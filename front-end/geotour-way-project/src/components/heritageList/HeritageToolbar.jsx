import { ArrowDownAZ, SlidersHorizontal } from 'lucide-react'
import { useHeritageList } from '../../hooks/useHeritageList'
import { useLanguage } from '../../hooks/useLanguage'
import './styles/HeritageToolbar.css'

function HeritageToolbar() {
  const {
    handleSortChange,
    isFiltersOpen,
    setIsFiltersOpen,
    sortBy,
    totalResults,
  } = useHeritageList()
  const { t } = useLanguage()

  return (
    <div className="home__toolbar">
      <p className="home__results">
        {totalResults} {t('home.results')}
      </p>
      <div className="home__toolbar-actions">
        <button
          type="button"
          className="home__toolbar-button"
          aria-label={isFiltersOpen ? t('home.closeFilters') : t('home.openFilters')}
          aria-expanded={isFiltersOpen}
          onClick={() => setIsFiltersOpen((currentValue) => !currentValue)}
        >
          <span>{t('home.filters')}</span>
          <SlidersHorizontal size={24} aria-hidden="true" />
        </button>
        <label
          className="home__sort"
          aria-label={t('home.sortBy')}
        >
          <span className="home__sort-label">
            {t('home.sortBy')}
            <ArrowDownAZ size={18} aria-hidden="true" />
          </span>
          <select
            className="home__sort-select"
            value={sortBy}
            onChange={handleSortChange}
          >
            <option value="name">{t('home.sortName')}</option>
            <option value="rating">{t('home.sortRating')}</option>
            <option value="province">{t('home.sortProvince')}</option>
          </select>
        </label>
      </div>
    </div>
  )
}

export default HeritageToolbar
