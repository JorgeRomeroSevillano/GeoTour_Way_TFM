import { aemetRequest } from '../api/aemetApi'

function formatDate(date) {
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')

  return `${year}-${month}-${day}`
}

function getCurrentHour(date) {
  return date.getHours()
}

function findDayPrediction(days, date) {
  const targetDate = formatDate(date)

  return days.find((day) => day.fecha?.startsWith(targetDate))
}

function findClosestPeriodValue(values, currentHour) {
  if (!values?.length) {
    return null
  }

  return values.reduce((closestValue, currentValue) => {
    const closestDistance = Math.abs(Number(closestValue.periodo) - currentHour)
    const currentDistance = Math.abs(Number(currentValue.periodo) - currentHour)

    return currentDistance < closestDistance ? currentValue : closestValue
  })
}

function mapCurrentWeather({ prediction, day, currentHour }) {
  const temperature = findClosestPeriodValue(day.temperatura, currentHour)
  const skyState = findClosestPeriodValue(day.estadoCielo, currentHour)

  if (!temperature || !skyState) {
    throw new Error('No hay predicción disponible para la hora actual')
  }

  return {
    municipality: prediction.nombre,
    date: day.fecha,
    period: temperature.periodo,
    temperature: Number(temperature.value),
    sky: {
      code: skyState.value,
      description: skyState.descripcion,
    },
  }
}

export async function getCurrentWeatherByMunicipality(codigoIne, date = new Date()) {
  const predictions = await aemetRequest(
    `/prediccion/especifica/municipio/horaria/${codigoIne}`,
  )
  const prediction = Array.isArray(predictions) ? predictions[0] : null

  if (!prediction?.prediccion?.dia) {
    throw new Error('AEMET no ha devuelto predicción horaria')
  }

  const currentHour = getCurrentHour(date)
  const day = findDayPrediction(prediction.prediccion.dia, date)

  if (!day) {
    throw new Error('No hay predicción disponible para el día actual')
  }

  return mapCurrentWeather({
    prediction,
    day,
    currentHour,
  })
}
