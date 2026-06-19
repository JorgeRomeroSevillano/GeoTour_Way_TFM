import { useContext } from 'react'
import { HeritageListContext } from '../context/HeritageListContext'

export function useHeritageList() {
  const context = useContext(HeritageListContext)

  if (!context) {
    throw new Error('useHeritageList debe usarse dentro de un provider de listado')
  }

  return context
}
