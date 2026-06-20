import { useEffect, useState } from 'react'
import { findNearbyAccommodations } from '../services/accommodationService'
import { getPatrimonioDetalle } from '../services/patrimonioService'

export function useHeritageAccommodation(patrimonioId) {
  const [patrimonio, setPatrimonio] = useState(null)
  const [accommodations, setAccommodations] = useState([])
  const [searchRadius, setSearchRadius] = useState(null)
  const [isLoading, setIsLoading] = useState(true)
  const [error, setError] = useState('')

  useEffect(() => {
    let isMounted = true

    getPatrimonioDetalle(patrimonioId)
      .then(async (detail) => {
        if (!isMounted) {
          return
        }

        setPatrimonio(detail)
        const lat = Number(detail.latitud)
        const lon = Number(detail.longitud)

        if (!Number.isFinite(lat) || !Number.isFinite(lon)) {
          throw new Error('El patrimonio no tiene coordenadas válidas')
        }

        const result = await findNearbyAccommodations({
          heritageName: detail.nombre,
          heritageType: detail.tipo,
          lat,
          lon,
        })

        if (isMounted) {
          setAccommodations(result.accommodations)
          setSearchRadius(result.radius)
          setIsLoading(false)
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
    }
  }, [patrimonioId])

  return {
    accommodations,
    error,
    isLoading,
    patrimonio,
    searchRadius,
  }
}
