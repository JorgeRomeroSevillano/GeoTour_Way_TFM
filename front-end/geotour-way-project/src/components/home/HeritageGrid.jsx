import { useHome } from '../../hooks/useHome'
import { useLanguage } from '../../hooks/useLanguage'
import HeritageCard from './HeritageCard'
import './styles/HeritageGrid.css'

function HeritageGrid() {
  const { favouriteIdSet, handleFavouriteToggle, paginatedPatrimonios } = useHome()
  const { t } = useLanguage()

  return (
    <section className="home__heritage-results">
      {paginatedPatrimonios.length === 0 && (
        <div className="home__empty">
          <h2>{t('home.noResultsTitle')}</h2>
          <p>{t('home.noResults')}</p>
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
