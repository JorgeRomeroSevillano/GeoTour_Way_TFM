import { useCallback, useEffect, useMemo, useState } from 'react'
import { HeritageListContext } from '../context/HeritageListContext'
import {
  deleteFavorito,
  deleteFavoritos,
  getFavoritos,
} from '../services/favoritosService'
import { getPatrimonios } from '../services/patrimonioService'

const ITEMS_PER_PAGE = 9
const PAGE_GROUP_SIZE = 3
const EMPTY_FILTERS = {
  tipo: [],
  valoracion: '',
  localidades: [],
  provincias: [],
  comunidades: [],
}

function getUniqueSortedValues(values) {
  return [...new Set(values.filter(Boolean))].sort((first, second) =>
    first.localeCompare(second),
  )
}

function getFilterOptions(patrimonios) {
  return {
    tipo: getUniqueSortedValues(patrimonios.map((patrimonio) => patrimonio.tipo)),
    localidades: getUniqueSortedValues(
      patrimonios.map((patrimonio) => patrimonio.localidad),
    ),
    provincias: getUniqueSortedValues(
      patrimonios.map((patrimonio) => patrimonio.provincia?.nombre),
    ),
    comunidades: getUniqueSortedValues(
      patrimonios.map((patrimonio) => patrimonio.provincia?.comunidad),
    ),
  }
}

function buildFavouriteFilters(favouriteIds, filters = {}) {
  if (favouriteIds.length === 0) {
    return null
  }

  return {
    ids: favouriteIds,
    tipo: filters.tipo,
    valoracion: filters.valoracion,
    localidades: filters.localidades,
    provincias: filters.provincias,
    comunidades: filters.comunidades,
  }
}

function sortPatrimonios(patrimonios, sortBy) {
  return [...patrimonios].sort((first, second) => {
    if (sortBy === 'rating') {
      return Number(second.valoracion) - Number(first.valoracion)
    }

    if (sortBy === 'province') {
      return (first.provincia?.nombre ?? '').localeCompare(
        second.provincia?.nombre ?? '',
      )
    }

    return first.nombre.localeCompare(second.nombre)
  })
}

function getVisiblePageNumbers(page, totalPages) {
  const groupStart = Math.floor((page - 1) / PAGE_GROUP_SIZE) * PAGE_GROUP_SIZE + 1
  const groupEnd = Math.min(groupStart + PAGE_GROUP_SIZE - 1, totalPages)

  return Array.from(
    { length: groupEnd - groupStart + 1 },
    (_, index) => groupStart + index,
  )
}

function notifyFavouritesChanged(nextFavouriteIds) {
  window.dispatchEvent(
    new CustomEvent('favourites:changed', {
      detail: {
        count: nextFavouriteIds.length,
      },
    }),
  )
}

function FavouritesProvider({ children }) {
  const [patrimonios, setPatrimonios] = useState([])
  const [allFavouritePatrimonios, setAllFavouritePatrimonios] = useState([])
  const [favouriteIds, setFavouriteIds] = useState([])
  const [filters, setFilters] = useState(EMPTY_FILTERS)
  const [draftFilters, setDraftFilters] = useState(EMPTY_FILTERS)
  const [sortBy, setSortBy] = useState('name')
  const [page, setPage] = useState(1)
  const [isFiltersOpen, setIsFiltersOpen] = useState(false)

  useEffect(() => {
    getFavoritos()
      .then((response) => setFavouriteIds(response.idsPatrimonio ?? []))
      .catch(() => setFavouriteIds([]))
  }, [])

  useEffect(() => {
    let isMounted = true
    const requestFilters = buildFavouriteFilters(favouriteIds)

    if (!requestFilters) {
      Promise.resolve().then(() => {
        if (isMounted) {
          setAllFavouritePatrimonios([])
        }
      })

      return () => {
        isMounted = false
      }
    }

    getPatrimonios(requestFilters).then((data) => {
      if (isMounted) {
        setAllFavouritePatrimonios(data)
      }
    })

    return () => {
      isMounted = false
    }
  }, [favouriteIds])

  useEffect(() => {
    let isMounted = true
    const requestFilters = buildFavouriteFilters(favouriteIds, filters)

    if (!requestFilters) {
      Promise.resolve().then(() => {
        if (isMounted) {
          setPatrimonios([])
          setPage(1)
        }
      })

      return () => {
        isMounted = false
      }
    }

    getPatrimonios(requestFilters).then((data) => {
      if (isMounted) {
        setPatrimonios(data)
        setPage(1)
      }
    })

    return () => {
      isMounted = false
    }
  }, [favouriteIds, filters])

  const filterOptions = useMemo(
    () => getFilterOptions(allFavouritePatrimonios),
    [allFavouritePatrimonios],
  )
  const favouriteIdSet = useMemo(() => new Set(favouriteIds), [favouriteIds])
  const sortedPatrimonios = useMemo(
    () => sortPatrimonios(patrimonios, sortBy),
    [patrimonios, sortBy],
  )
  const totalPages = Math.max(
    1,
    Math.ceil(sortedPatrimonios.length / ITEMS_PER_PAGE),
  )
  const paginatedPatrimonios = sortedPatrimonios.slice(
    (page - 1) * ITEMS_PER_PAGE,
    page * ITEMS_PER_PAGE,
  )
  const pageNumbers = useMemo(
    () => getVisiblePageNumbers(page, totalPages),
    [page, totalPages],
  )
  const hasPreviousPageGroup = pageNumbers[0] > 1
  const hasNextPageGroup = pageNumbers[pageNumbers.length - 1] < totalPages

  function handleFilterToggle(filterName, value) {
    setDraftFilters((currentFilters) => {
      if (filterName === 'tipo') {
        return {
          ...currentFilters,
          tipo: currentFilters.tipo.includes(value) ? [] : [value],
        }
      }

      const currentValues = currentFilters[filterName]
      const nextValues = currentValues.includes(value)
        ? currentValues.filter((currentValue) => currentValue !== value)
        : [...currentValues, value]

      return {
        ...currentFilters,
        [filterName]: nextValues,
      }
    })
  }

  function handleMinimumRatingChange(event) {
    const nextValue = event.target.value

    if (nextValue === '') {
      setDraftFilters((currentFilters) => ({
        ...currentFilters,
        valoracion: '',
      }))
      return
    }

    const normalizedValue = Math.min(10, Math.max(0, Number(nextValue)))

    if (Number.isNaN(normalizedValue)) {
      return
    }

    setDraftFilters((currentFilters) => ({
      ...currentFilters,
      valoracion: String(normalizedValue),
    }))
  }

  function handleApplyFilters() {
    setFilters(draftFilters)
  }

  function handleClearFilters() {
    setFilters(EMPTY_FILTERS)
    setDraftFilters(EMPTY_FILTERS)
  }

  function handleSortChange(event) {
    setSortBy(event.target.value)
    setPage(1)
  }

  function goToPreviousPageGroup() {
    setPage(Math.max(1, pageNumbers[0] - PAGE_GROUP_SIZE))
  }

  function goToNextPageGroup() {
    setPage(Math.min(totalPages, pageNumbers[pageNumbers.length - 1] + 1))
  }

  const handleFavouriteToggle = useCallback((patrimonioId) => {
    const previousFavouriteIds = favouriteIds
    const nextFavouriteIds = previousFavouriteIds.filter(
      (id) => id !== patrimonioId,
    )

    setFavouriteIds(nextFavouriteIds)
    notifyFavouritesChanged(nextFavouriteIds)

    deleteFavorito(patrimonioId).catch(() => {
      setFavouriteIds(previousFavouriteIds)
      notifyFavouritesChanged(previousFavouriteIds)
    })
  }, [favouriteIds])

  function handleClearAllFavourites() {
    deleteFavoritos().then(() => {
      setFavouriteIds([])
      setPatrimonios([])
      setAllFavouritePatrimonios([])
      notifyFavouritesChanged([])
    })
  }

  const value = {
    draftFilters,
    favouriteIdSet,
    favouriteIds,
    filterOptions,
    goToNextPageGroup,
    goToPreviousPageGroup,
    handleApplyFilters,
    handleClearAllFavourites,
    handleClearFilters,
    handleFavouriteToggle,
    handleFilterToggle,
    handleMinimumRatingChange,
    handleSortChange,
    hasNextPageGroup,
    hasPreviousPageGroup,
    isFiltersOpen,
    page,
    pageNumbers,
    paginatedPatrimonios,
    savedCount: favouriteIds.length,
    setIsFiltersOpen,
    setPage,
    sortBy,
    totalResults: sortedPatrimonios.length,
  }

  return (
    <HeritageListContext.Provider value={value}>
      {children}
    </HeritageListContext.Provider>
  )
}

export default FavouritesProvider
