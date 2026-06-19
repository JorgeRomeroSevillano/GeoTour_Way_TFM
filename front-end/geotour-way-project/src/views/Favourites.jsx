import { Trash2 } from 'lucide-react'
import FavouritesHero from '../components/favourites/FavouritesHero'
import HeritageFilters from '../components/heritageList/HeritageFilters'
import HeritageGrid from '../components/heritageList/HeritageGrid'
import HeritagePagination from '../components/heritageList/HeritagePagination'
import HeritageToolbar from '../components/heritageList/HeritageToolbar'
import { useHeritageList } from '../hooks/useHeritageList'
import { useLanguage } from '../hooks/useLanguage'
import FavouritesProvider from '../provider/FavouritesProvider'
import './styles/Favourites.css'

function FavouritesContent() {
  const { handleClearAllFavourites, isFiltersOpen, savedCount } =
    useHeritageList()
  const { t } = useLanguage()

  return (
    <section className="favourites" aria-label={t('favourites.label')}>
      {isFiltersOpen && <HeritageFilters />}

      <div className="favourites__content">
        <FavouritesHero />
        <HeritageToolbar />
        <div className="favourites__list">
          <HeritageGrid
            emptyMessageKey="favourites.noResults"
            emptyTitleKey="favourites.noResultsTitle"
          />
          <div className="favourites__list-footer">
            <HeritagePagination />
            {savedCount > 0 && (
              <button
                type="button"
                className="favourites__clear-button"
                onClick={handleClearAllFavourites}
              >
                <Trash2 size={18} aria-hidden="true" />
                {t('favourites.clearList')}
              </button>
            )}
          </div>
        </div>
      </div>
    </section>
  )
}

function Favourites() {
  return (
    <FavouritesProvider>
      <FavouritesContent />
    </FavouritesProvider>
  )
}

export default Favourites
