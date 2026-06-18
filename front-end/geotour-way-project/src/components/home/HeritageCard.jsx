import { memo } from 'react'
import { Heart, Star } from 'lucide-react'
import { useNavigate } from 'react-router-dom'
import placeholderImage from '../../assets/placeholder.svg'
import { useLanguage } from '../../hooks/useLanguage'
import { useTranslatedText } from '../../hooks/useTranslatedText'
import { getCardImageUrl } from '../../utils/imageUtils'
import './styles/HeritageCard.css'

function HeritageCard({ isFavourite, onFavouriteToggle, patrimonio }) {
  const navigate = useNavigate()
  const { language, t } = useLanguage()
  const description = useTranslatedText(patrimonio.descripcion, language)
  const imageUrl = getCardImageUrl(patrimonio.urlImagen) || placeholderImage

  function handleFavouriteClick(event) {
    event.stopPropagation()
    onFavouriteToggle(patrimonio.id)
  }

  function handleCardKeyDown(event) {
    if (event.key === 'Enter') {
      navigate(`/heritage/${patrimonio.id}`)
    }
  }

  return (
    <article
      className="home__card"
      tabIndex={0}
      onClick={() => navigate(`/heritage/${patrimonio.id}`)}
      onKeyDown={handleCardKeyDown}
    >
      <img
        src={imageUrl}
        alt=""
        className="home__card-image"
        loading="lazy"
        decoding="async"
        fetchPriority="low"
        onError={(event) => {
          event.currentTarget.src = placeholderImage
        }}
      />
      <div className="home__card-content">
        <h2>{patrimonio.nombre}</h2>
        <p>{description}</p>
        <div className="home__card-footer">
          <span className="home__rating">
            <Star size={19} fill="currentColor" aria-hidden="true" />
            {Number(patrimonio.valoracion).toFixed(1)}
          </span>
          <button
            type="button"
            className="home__favourite-button"
            aria-label={
              isFavourite ? t('home.removeFavourite') : t('home.addFavourite')
            }
            onClick={handleFavouriteClick}
          >
            <Heart
              size={22}
              fill={isFavourite ? 'currentColor' : 'none'}
              aria-hidden="true"
            />
          </button>
        </div>
      </div>
    </article>
  )
}

export default memo(HeritageCard)
