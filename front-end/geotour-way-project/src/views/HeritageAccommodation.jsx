import { ArrowLeft } from 'lucide-react'
import { useMemo, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import AccommodationLegend from '../components/accommodation/AccommodationLegend'
import AccommodationMarkerLabel from '../components/accommodation/AccommodationMarkerLabel'
import Map from '../components/map/Map'
import { useHeritageAccommodation } from '../hooks/useHeritageAccommodation'
import { useLanguage } from '../hooks/useLanguage'
import './styles/HeritageAccommodation.css'

const ALL_RATES = [1, 2, 3]

function HeritageAccommodation() {
  const { id } = useParams()
  const navigate = useNavigate()
  const [selectedRates, setSelectedRates] = useState(ALL_RATES)
  const { t } = useLanguage()
  const {
    accommodations,
    error,
    isLoading,
    patrimonio,
    searchRadius,
  } = useHeritageAccommodation(id)
  const visibleAccommodations = useMemo(
    () =>
      accommodations.filter((accommodation) =>
        selectedRates.includes(accommodation.rate),
      ),
    [accommodations, selectedRates],
  )

  function handleRateToggle(rate) {
    setSelectedRates((currentRates) =>
      currentRates.includes(rate)
        ? currentRates.filter((currentRate) => currentRate !== rate)
        : [...currentRates, rate],
    )
  }

  if (isLoading) {
    return (
      <section className="heritage-accommodation heritage-accommodation--state">
        <p>{t('accommodation.searching')}</p>
      </section>
    )
  }

  if (error || !patrimonio) {
    return (
      <section className="heritage-accommodation heritage-accommodation--state">
        <h1>{t('accommodation.loadError')}</h1>
        <p>{error}</p>
        <button type="button" onClick={() => navigate(-1)}>
          {t('heritageDetail.back')}
        </button>
      </section>
    )
  }

  const center = [Number(patrimonio.latitud), Number(patrimonio.longitud)]
  const isCultural = patrimonio.tipo?.toLowerCase() === 'cultural'
  const markers = [
    {
      id: `heritage-${patrimonio.id}`,
      color: 'red',
      popupText: patrimonio.nombre,
      position: center,
    },
    ...visibleAccommodations.map((accommodation) => ({
      id: accommodation.id,
      color: 'blue',
      popupContent: (
        <AccommodationMarkerLabel accommodation={accommodation} />
      ),
      position: [accommodation.coordinates.lat, accommodation.coordinates.lon],
    })),
  ]

  return (
    <section
      className="heritage-accommodation"
      aria-label={t('accommodation.label')}
    >
      <header className="heritage-accommodation__bar">
        <button type="button" onClick={() => navigate(-1)}>
          <ArrowLeft size={18} aria-hidden="true" />
          {t('accommodation.nearbyTitle')}
        </button>
      </header>

      <div className="heritage-accommodation__map-area">
        <Map
          center={center}
          enableMeasure
          markers={markers}
          miniMapVariant="large"
          showMiniMap
          showScale
          variant="fullscreen"
          zoom={isCultural ? 15 : 13}
          zoomControlPosition="topright"
        />
        <AccommodationLegend
          onRateToggle={handleRateToggle}
          patrimonio={patrimonio}
          searchRadius={searchRadius}
          selectedRates={selectedRates}
        />
        {accommodations.length === 0 && (
          <p className="heritage-accommodation__empty">
            {t('accommodation.noResults')}
          </p>
        )}
        {accommodations.length > 0 && visibleAccommodations.length === 0 && (
          <p className="heritage-accommodation__empty">
            {t('accommodation.noFilteredResults')}
          </p>
        )}
      </div>
    </section>
  )
}

export default HeritageAccommodation
