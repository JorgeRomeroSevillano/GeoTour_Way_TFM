import {
  ArrowLeft,
  Heart,
} from 'lucide-react'
import { useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import placeholderImage from '../assets/placeholder.svg'
import ClimateModal from '../components/heritageDetail/ClimateModal'
import CurrentWeather from '../components/heritageDetail/CurrentWeather'
import ExpandableDescription from '../components/heritageDetail/ExpandableDescription'
import QuickInfo from '../components/heritageDetail/QuickInfo'
import RatingControl from '../components/heritageDetail/RatingControl'
import Map from '../components/map/Map'
import { useHeritageDetail } from '../hooks/useHeritageDetail'
import { useLanguage } from '../hooks/useLanguage'
import { useTranslatedText } from '../hooks/useTranslatedText'
import './styles/HeritageDetail.css'

function HeritageDetail() {
  const { id } = useParams()
  const navigate = useNavigate()
  const { language, t } = useLanguage()
  const [isClimateOpen, setIsClimateOpen] = useState(false)
  const {
    climate,
    error,
    isFavourite,
    isLoading,
    isUpdatingRating,
    loadClimate,
    patrimonio,
    toggleFavourite,
    updateRating,
    weather,
  } = useHeritageDetail(id)
  const description = useTranslatedText(patrimonio?.descripcion, language)

  if (isLoading) {
    return (
      <section className="heritage-detail heritage-detail--state">
        <p>{t('heritageDetail.loading')}</p>
      </section>
    )
  }

  if (error || !patrimonio) {
    return (
      <section className="heritage-detail heritage-detail--state">
        <h1>{t('heritageDetail.loadError')}</h1>
        <p>{error}</p>
        <button type="button" onClick={() => navigate(-1)}>
          {t('heritageDetail.back')}
        </button>
      </section>
    )
  }

  const isCultural = patrimonio.tipo?.toLowerCase() === 'cultural'
  const coordinates = [Number(patrimonio.latitud), Number(patrimonio.longitud)]
  const hasCoordinates = coordinates.every(Number.isFinite)
  const imageUrl = patrimonio.urlImagen || placeholderImage

  function handleClimateOpen() {
    setIsClimateOpen(true)
    loadClimate()
  }

  return (
    <section className="heritage-detail" aria-label={t('heritageDetail.label')}>
      <button
        type="button"
        className="heritage-detail__back"
        onClick={() => navigate(-1)}
      >
        <ArrowLeft size={18} aria-hidden="true" />
        {t('heritageDetail.back')}
      </button>

      <div className="heritage-detail__overview">
        <div className="heritage-detail__image-frame">
          <img
            src={imageUrl}
            alt={patrimonio.nombre}
            className="heritage-detail__image"
            onError={(event) => {
              event.currentTarget.src = placeholderImage
            }}
          />
        </div>

        <div className="heritage-detail__identity">
          <h1>{patrimonio.nombre}</h1>
          <p className="heritage-detail__location">
            <span className="heritage-detail__location-marker" aria-hidden="true" />
            {patrimonio.localidad}
          </p>
          <RatingControl
            isUpdating={isUpdatingRating}
            value={patrimonio.valoracion}
            onUpdate={updateRating}
          />

          <CurrentWeather weather={weather} />

          <button
            type="button"
            className="heritage-detail__climate-button"
            onClick={handleClimateOpen}
          >
            {t('heritageDetail.annualClimate')}
          </button>
        </div>

        <div className="heritage-detail__quick-column">
          <QuickInfo patrimonio={patrimonio} />
          <button
            type="button"
            className="heritage-detail__favourite-button"
            onClick={toggleFavourite}
          >
            <Heart
              size={22}
              fill={isFavourite ? 'currentColor' : 'none'}
              aria-hidden="true"
            />
            {isFavourite
              ? t('heritageDetail.removeFavourite')
              : t('heritageDetail.addFavourite')}
          </button>
        </div>
      </div>

      <div className="heritage-detail__lower-content">
        <article className="heritage-detail__description">
          <div className="heritage-detail__description-header">
            <h2>{t('heritageDetail.description')}</h2>
            <button
              type="button"
              onClick={() => navigate(`/heritage/${patrimonio.id}/gastronomy`)}
            >
              {t('heritageDetail.gastronomy')}
            </button>
            <button
              type="button"
              onClick={() => navigate(`/heritage/${patrimonio.id}/accommodation`)}
            >
              {t('heritageDetail.accommodation')}
            </button>
          </div>
          <ExpandableDescription text={description} />
        </article>

        <div className="heritage-detail__map">
          {hasCoordinates ? (
            <Map
              center={coordinates}
              enableMeasure
              markers={[
                {
                  id: patrimonio.id,
                  color: 'red',
                  popupText: patrimonio.nombre,
                  position: coordinates,
                },
              ]}
              showMiniMap
              showScale
              variant="detail"
              zoom={isCultural ? 15 : 11}
            />
          ) : (
            <p>{t('heritageDetail.noCoordinates')}</p>
          )}
        </div>
      </div>

      <ClimateModal
        climate={climate}
        isOpen={isClimateOpen}
        onClose={() => setIsClimateOpen(false)}
      />
    </section>
  )
}

export default HeritageDetail
