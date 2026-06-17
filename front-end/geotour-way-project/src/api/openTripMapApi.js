const OPEN_TRIP_MAP_URL = 'https://api.opentripmap.com/0.1/en/places'
const OPEN_TRIP_MAP_API_KEY = '5ae2e3f221c38a28845f05b6c864c27d612a7e3157cfa3d12c86bfdc'

function buildQueryParams(params) {
  const queryParams = new URLSearchParams()

  Object.entries(params).forEach(([key, value]) => {
    if (value !== undefined && value !== null && value !== '') {
      queryParams.set(key, String(value))
    }
  })

  return queryParams.toString()
}

export async function openTripMapRequest(path, params) {
  if (!OPEN_TRIP_MAP_API_KEY) {
    throw new Error('Falta configurar la API key de OpenTripMap')
  }

  const queryParams = buildQueryParams({
    ...params,
    apikey: OPEN_TRIP_MAP_API_KEY,
  })

  const response = await fetch(`${OPEN_TRIP_MAP_URL}${path}?${queryParams}`)
  const data = await response.json()

  if (!response.ok) {
    throw new Error('Error al consultar OpenTripMap')
  }

  return data
}
