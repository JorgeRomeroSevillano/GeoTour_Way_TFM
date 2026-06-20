import { useEffect, useState } from 'react'
import {
  getGastronomiaProvincia,
  getPatrimonioDetalle,
} from '../services/patrimonioService'

export function useHeritageGastronomy(patrimonioId) {
  const [gastronomy, setGastronomy] = useState(null)
  const [isLoading, setIsLoading] = useState(true)
  const [error, setError] = useState('')

  useEffect(() => {
    let isMounted = true

    getPatrimonioDetalle(patrimonioId)
      .then((patrimonio) => {
        if (!patrimonio.provincia?.id) {
          throw new Error('El patrimonio no tiene una provincia asociada')
        }

        return getGastronomiaProvincia(patrimonio.provincia.id)
      })
      .then((response) => {
        if (isMounted) {
          setGastronomy(response)
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
    error,
    gastronomy,
    isLoading,
  }
}
