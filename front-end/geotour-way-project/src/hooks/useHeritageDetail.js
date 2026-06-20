import { useCallback, useEffect, useState } from 'react'
import {
  addFavorito,
  deleteFavorito,
  getFavoritos,
} from '../services/favoritosService'
import {
  getClimaProvincia,
  getPatrimonioDetalle,
  updatePatrimonioValoracion,
} from '../services/patrimonioService'
import { getCurrentWeatherByMunicipality } from '../services/weatherService'

const WEATHER_RETRY_BASE_DELAY = 2000
const WEATHER_RETRY_MAX_DELAY = 30000

function getWeatherRetryDelay(attempt) {
  return Math.min(
    WEATHER_RETRY_MAX_DELAY,
    WEATHER_RETRY_BASE_DELAY * 2 ** Math.min(attempt, 4),
  )
}

function notifyFavouritesChanged(count) {
  window.dispatchEvent(
    new CustomEvent('favourites:changed', {
      detail: { count },
    }),
  )
}

export function useHeritageDetail(patrimonioId) {
  const [patrimonio, setPatrimonio] = useState(null)
  const [isFavourite, setIsFavourite] = useState(false)
  const [favouriteIds, setFavouriteIds] = useState([])
  const [weather, setWeather] = useState(null)
  const [climate, setClimate] = useState(null)
  const [isLoading, setIsLoading] = useState(true)
  const [error, setError] = useState('')
  const [isUpdatingRating, setIsUpdatingRating] = useState(false)

  useEffect(() => {
    let isMounted = true
    let weatherRetryTimer

    function loadWeatherWithRetry(codigoIne, attempt = 0) {
      getCurrentWeatherByMunicipality(codigoIne)
        .then((currentWeather) => {
          if (isMounted) {
            setWeather(currentWeather)
          }
        })
        .catch(() => {
          if (!isMounted) {
            return
          }

          setWeather(null)
          weatherRetryTimer = window.setTimeout(
            () => loadWeatherWithRetry(codigoIne, attempt + 1),
            getWeatherRetryDelay(attempt),
          )
        })
    }

    Promise.all([getPatrimonioDetalle(patrimonioId), getFavoritos()])
      .then(([detail, favouritesResponse]) => {
        if (!isMounted) {
          return
        }

        const ids = favouritesResponse.idsPatrimonio ?? []
        setPatrimonio(detail)
        setFavouriteIds(ids)
        setIsFavourite(ids.includes(detail.id))
        setIsLoading(false)

        if (detail.codIne) {
          loadWeatherWithRetry(detail.codIne)
        }
      })
      .catch((requestError) => {
        if (isMounted) {
          setError(requestError.message)
          setIsLoading(false)
        }
      })

    return () => {
      isMounted = false
      window.clearTimeout(weatherRetryTimer)
    }
  }, [patrimonioId])

  const toggleFavourite = useCallback(() => {
    if (!patrimonio) {
      return
    }

    const previousIds = favouriteIds
    const nextIds = isFavourite
      ? previousIds.filter((id) => id !== patrimonio.id)
      : [...previousIds, patrimonio.id]
    const request = isFavourite
      ? deleteFavorito(patrimonio.id)
      : addFavorito(patrimonio.id)

    setFavouriteIds(nextIds)
    setIsFavourite(!isFavourite)
    notifyFavouritesChanged(nextIds.length)

    request
      .then((response) => {
        const confirmedIds = response.idsPatrimonio ?? nextIds
        setFavouriteIds(confirmedIds)
        setIsFavourite(confirmedIds.includes(patrimonio.id))
        notifyFavouritesChanged(confirmedIds.length)
      })
      .catch(() => {
        setFavouriteIds(previousIds)
        setIsFavourite(isFavourite)
        notifyFavouritesChanged(previousIds.length)
      })
  }, [favouriteIds, isFavourite, patrimonio])

  const updateRating = useCallback((rating) => {
    if (!patrimonio) {
      return Promise.resolve()
    }

    setIsUpdatingRating(true)

    return updatePatrimonioValoracion(patrimonio.id, rating)
      .then((updatedPatrimonio) => {
        setPatrimonio((currentPatrimonio) => ({
          ...currentPatrimonio,
          valoracion: updatedPatrimonio.valoracion,
        }))
      })
      .finally(() => setIsUpdatingRating(false))
  }, [patrimonio])

  const loadClimate = useCallback(() => {
    if (!patrimonio?.provincia?.id) {
      return Promise.resolve(null)
    }

    if (climate) {
      return Promise.resolve(climate)
    }

    return getClimaProvincia(patrimonio.provincia.id).then((response) => {
      setClimate(response)
      return response
    })
  }, [climate, patrimonio])

  return {
    climate,
    error,
    isFavourite,
    isLoading,
    isUpdatingRating,
    loadClimate,
    patrimonio,
    toggleFavourite,
    updateRating,
    weather,
  }
}
