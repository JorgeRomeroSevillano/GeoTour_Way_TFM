import { useCallback, useEffect, useMemo, useState } from 'react'
import { HeritageListContext } from '../context/HeritageListContext'
import {
  addFavorito,
  deleteFavorito,
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
const HOME_STATE_STORAGE_KEY = 'geotour-way-home-state'

function getInitialHomeState() {
  try {
    const storedState = window.localStorage.getItem(HOME_STATE_STORAGE_KEY)

    if (!storedState) {
      return {
        appliedSearch: '',
        draftFilters: EMPTY_FILTERS,
        filters: EMPTY_FILTERS,
        page: 1,
        search: '',
        sortBy: 'name',
      }
    }

    const parsedState = JSON.parse(storedState)

    return {
      appliedSearch: parsedState.appliedSearch ?? '',
      draftFilters: parsedState.draftFilters ?? EMPTY_FILTERS,
      filters: parsedState.filters ?? EMPTY_FILTERS,
      page: Math.max(1, Number(parsedState.page) || 1),
      search: parsedState.search ?? '',
      sortBy: parsedState.sortBy ?? 'name',
    }
  } catch {
    return {
      appliedSearch: '',
      draftFilters: EMPTY_FILTERS,
      filters: EMPTY_FILTERS,
      page: 1,
      search: '',
      sortBy: 'name',
    }
  }
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

function buildRequestFilters(filters, search) {
  return {
    tipo: filters.tipo,
    valoracion: filters.valoracion,
    localidades: filters.localidades,
    provincias: filters.provincias,
    comunidades: filters.comunidades,
    nombre: search,
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

function HomeProvider({ children }) {
  const initialHomeState = useMemo(() => getInitialHomeState(), [])
  const [patrimonios, setPatrimonios] = useState([])
  const [allPatrimonios, setAllPatrimonios] = useState([])
  const [favouriteIds, setFavouriteIds] = useState([])
  const [filters, setFilters] = useState(initialHomeState.filters)
  const [draftFilters, setDraftFilters] = useState(initialHomeState.draftFilters)
  const [search, setSearch] = useState(initialHomeState.search)
  const [appliedSearch, setAppliedSearch] = useState(
    initialHomeState.appliedSearch,
  )
  const [sortBy, setSortBy] = useState(initialHomeState.sortBy)
  const [page, setPage] = useState(initialHomeState.page)
  const [isFiltersOpen, setIsFiltersOpen] = useState(false)

  const loadPatrimonios = useCallback((nextFilters, nextSearch) => {
    return getPatrimonios(buildRequestFilters(nextFilters, nextSearch)).then((data) => {
      setPatrimonios(data)
      setPage((currentPage) =>
        Math.min(currentPage, Math.max(1, Math.ceil(data.length / ITEMS_PER_PAGE))),
      )
    })
  }, [])

  useEffect(() => {
    getPatrimonios().then((data) => {
      setAllPatrimonios(data)
    })

    getFavoritos()
      .then((response) => setFavouriteIds(response.idsPatrimonio ?? []))
      .catch(() => setFavouriteIds([]))
  }, [])

  useEffect(() => {
    loadPatrimonios(filters, appliedSearch)
  }, [appliedSearch, filters, loadPatrimonios])

  useEffect(() => {
    window.localStorage.setItem(
      HOME_STATE_STORAGE_KEY,
      JSON.stringify({
        appliedSearch,
        draftFilters,
        filters,
        page,
        search,
        sortBy,
      }),
    )
  }, [appliedSearch, draftFilters, filters, page, search, sortBy])

  const filterOptions = useMemo(
    () => getFilterOptions(allPatrimonios),
    [allPatrimonios],
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

  function handleSearch() {
    setPage(1)
    setAppliedSearch(search)
  }

  function handleSearchKeyDown(event) {
    if (event.key === 'Enter') {
      handleSearch()
    }
  }

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

  function handleSearchChange(event) {
    const nextSearch = event.target.value
    setSearch(nextSearch)

    if (!nextSearch) {
      setPage(1)
      setAppliedSearch('')
    }
  }

  function handleApplyFilters() {
    setPage(1)
    setFilters(draftFilters)
  }

  function handleClearFilters() {
    setPage(1)
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
    const isFavourite = previousFavouriteIds.includes(patrimonioId)
    const optimisticFavouriteIds = isFavourite
      ? previousFavouriteIds.filter((id) => id !== patrimonioId)
      : [...previousFavouriteIds, patrimonioId]
    const request = isFavourite ? deleteFavorito(patrimonioId) : addFavorito(patrimonioId)

    setFavouriteIds(optimisticFavouriteIds)
    notifyFavouritesChanged(optimisticFavouriteIds)

    request
      .then((response) => {
        const nextFavouriteIds = response.idsPatrimonio ?? optimisticFavouriteIds
        setFavouriteIds(nextFavouriteIds)
        notifyFavouritesChanged(nextFavouriteIds)
      })
      .catch(() => {
        setFavouriteIds(previousFavouriteIds)
        notifyFavouritesChanged(previousFavouriteIds)
      })
  }, [favouriteIds])

  const value = {
    draftFilters,
    favouriteIdSet,
    favouriteIds,
    filterOptions,
    goToNextPageGroup,
    goToPreviousPageGroup,
    handleApplyFilters,
    handleClearFilters,
    handleFavouriteToggle,
    handleFilterToggle,
    handleMinimumRatingChange,
    handleSearch,
    handleSearchChange,
    handleSearchKeyDown,
    handleSortChange,
    hasNextPageGroup,
    hasPreviousPageGroup,
    isFiltersOpen,
    page,
    pageNumbers,
    paginatedPatrimonios,
    search,
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

export default HomeProvider
