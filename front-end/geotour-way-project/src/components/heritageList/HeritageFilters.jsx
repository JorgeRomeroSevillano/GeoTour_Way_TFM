import { useMemo, useState } from 'react'
import { FilterX, X } from 'lucide-react'
import { useHeritageList } from '../../hooks/useHeritageList'
import { useLanguage } from '../../hooks/useLanguage'
import './styles/HeritageFilters.css'

function getOptionLabel(value) {
  return value.charAt(0).toUpperCase() + value.slice(1).toLowerCase()
}

function HeritageFilterCheckboxGroup({ filterName, values, searchable = false }) {
  const { draftFilters, handleFilterToggle } = useHeritageList()
  const { t } = useLanguage()
  const [query, setQuery] = useState('')
  const visibleValues = useMemo(() => {
    const normalizedQuery = query.trim().toLowerCase()

    if (!normalizedQuery) {
      return values
    }

    return values.filter((value) => value.toLowerCase().includes(normalizedQuery))
  }, [query, values])

  return (
    <>
      {searchable && (
        <input
          className="home__filter-search"
          type="search"
          value={query}
          placeholder={t('home.filterSearchPlaceholder')}
          onChange={(event) => setQuery(event.target.value)}
        />
      )}
      <div
        className={
          searchable
            ? 'home__filter-options home__filter-options--scroll'
            : 'home__filter-options'
        }
      >
        {visibleValues.map((value) => (
          <label key={value} className="home__filter-option">
            <input
              type={filterName === 'tipo' ? 'radio' : 'checkbox'}
              name={filterName === 'tipo' ? 'tipo' : undefined}
              checked={draftFilters[filterName].includes(value)}
              onChange={() => handleFilterToggle(filterName, value)}
            />
            <span>{filterName === 'tipo' ? getOptionLabel(value) : value}</span>
          </label>
        ))}
        {visibleValues.length === 0 && (
          <p className="home__filter-empty">{t('home.noFilterOptions')}</p>
        )}
      </div>
    </>
  )
}

function HeritageFiltersActions() {
  const { handleApplyFilters, handleClearFilters } = useHeritageList()
  const { t } = useLanguage()

  return (
    <div className="home__filters-actions">
      <button
        type="button"
        className="home__clear-filters"
        onClick={handleClearFilters}
      >
        <FilterX size={18} aria-hidden="true" />
        {t('home.clearFilters')}
      </button>
      <button
        type="button"
        className="home__apply-filters"
        onClick={handleApplyFilters}
      >
        {t('home.applyFilters')}
      </button>
    </div>
  )
}

function HeritageFilters() {
  const {
    draftFilters,
    filterOptions,
    handleMinimumRatingChange,
    setIsFiltersOpen,
  } = useHeritageList()
  const { t } = useLanguage()

  return (
    <aside className="home__filters" aria-label={t('home.filters')}>
      <div className="home__filters-scroll">
        <div className="home__filters-header">
          <h2>{t('home.filters')}</h2>
          <button
            type="button"
            className="home__filters-close"
            aria-label={t('home.closeFilters')}
            onClick={() => setIsFiltersOpen(false)}
          >
            <X size={22} strokeWidth={3} aria-hidden="true" />
          </button>
        </div>
        <p className="home__filters-help">{t('home.filtersHelp')}</p>

        <div className="home__filter-group">
          <h3>{t('home.type')}</h3>
          <HeritageFilterCheckboxGroup filterName="tipo" values={filterOptions.tipo} />
        </div>
        <div className="home__filter-group">
          <h3>{t('home.minimumRating')}</h3>
          <input
            className="home__rating-input"
            type="number"
            min="0"
            max="10"
            step="0.1"
            value={draftFilters.valoracion}
            onChange={handleMinimumRatingChange}
          />
        </div>
        <div className="home__filter-group">
          <h3>{t('home.localities')}</h3>
          <HeritageFilterCheckboxGroup
            filterName="localidades"
            searchable
            values={filterOptions.localidades}
          />
        </div>
        <div className="home__filter-group">
          <h3>{t('home.provinces')}</h3>
          <HeritageFilterCheckboxGroup
            filterName="provincias"
            searchable
            values={filterOptions.provincias}
          />
        </div>
        <div className="home__filter-group">
          <h3>{t('home.communities')}</h3>
          <HeritageFilterCheckboxGroup
            filterName="comunidades"
            searchable
            values={filterOptions.comunidades}
          />
        </div>
      </div>
      <HeritageFiltersActions />
    </aside>
  )
}

export default HeritageFilters
