import { useHeritageList } from '../../hooks/useHeritageList'
import { useLanguage } from '../../hooks/useLanguage'
import HeritageCard from './HeritageCard'
import './styles/HeritageGrid.css'

function HeritageGrid({
  emptyMessageKey = 'home.noResults',
  emptyTitleKey = 'home.noResultsTitle',
}) {
  const { favouriteIdSet, handleFavouriteToggle, paginatedPatrimonios } =
    useHeritageList()
  const { t } = useLanguage()

  return (
    <section className="home__heritage-results">
      {paginatedPatrimonios.length === 0 && (
        <div className="home__empty">
          <h2>{t(emptyTitleKey)}</h2>
          <p>{t(emptyMessageKey)}</p>
        </div>
      )}

      {paginatedPatrimonios.length > 0 && (
        <div className="home__grid">
          {paginatedPatrimonios.map((patrimonio) => (
            <HeritageCard
              key={patrimonio.id}
              isFavourite={favouriteIdSet.has(patrimonio.id)}
              patrimonio={patrimonio}
              onFavouriteToggle={handleFavouriteToggle}
            />
          ))}
        </div>
      )}
    </section>
  )
}

export default HeritageGrid
