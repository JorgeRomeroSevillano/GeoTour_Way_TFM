import { ArrowLeft } from 'lucide-react'
import { useNavigate } from 'react-router-dom'
import { useHeritageList } from '../../hooks/useHeritageList'
import { useLanguage } from '../../hooks/useLanguage'
import './styles/FavouritesHero.css'

function FavouritesHero() {
  const navigate = useNavigate()
  const { savedCount } = useHeritageList()
  const { t } = useLanguage()
  const savedPlacesLabel =
    savedCount === 1
      ? t('favourites.savedPlaceSingular')
      : t('favourites.savedPlacePlural')

  return (
    <header className="favourites__hero">
      <button
        type="button"
        className="favourites__back-button"
        onClick={() => navigate('/home')}
      >
        <ArrowLeft size={18} aria-hidden="true" />
        {t('favourites.backToList')}
      </button>
      <div className="favourites__heading">
        <h1>{t('favourites.title')}</h1>
        <p>{t('favourites.subtitle')}</p>
      </div>
      <p className="favourites__saved-count">
        {savedCount} {savedPlacesLabel}
      </p>
    </header>
  )
}

export default FavouritesHero
