import placeholderImage from '../../assets/placeholder.svg'
import { useLanguage } from '../../hooks/useLanguage'
import { useTranslatedText } from '../../hooks/useTranslatedText'
import ExpandableDescription from '../heritageDetail/ExpandableDescription'
import './styles/GastronomyCard.css'

function GastronomyCard({ dish }) {
  const { language } = useLanguage()
  const translatedDescription = useTranslatedText(dish.descripcion, language)

  return (
    <article className="gastronomy-card">
      <div className="gastronomy-card__image-frame">
        <img
          src={dish.urlImagen || placeholderImage}
          alt={dish.nombre}
          className="gastronomy-card__image"
          loading="lazy"
          decoding="async"
          onError={(event) => {
            event.currentTarget.src = placeholderImage
          }}
        />
      </div>
      <div className="gastronomy-card__content">
        <h2>{dish.nombre}</h2>
        <ExpandableDescription text={translatedDescription} />
      </div>
    </article>
  )
}

export default GastronomyCard
