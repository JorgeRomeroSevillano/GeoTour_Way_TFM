import { CloudRain, Thermometer, X } from 'lucide-react'
import { useState } from 'react'
import { useLanguage } from '../../hooks/useLanguage'
import './styles/ClimateModal.css'

const SEASONS = ['invierno', 'primavera', 'verano', 'otoño']

function normalizeValue(value = '') {
  return value
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
}

function ClimateModal({ climate, isOpen, onClose }) {
  const [activeSeason, setActiveSeason] = useState(SEASONS[0])
  const { t } = useLanguage()

  if (!isOpen) {
    return null
  }

  const selectedClimate = climate?.clima?.find(
    (item) => normalizeValue(item.estacion) === normalizeValue(activeSeason),
  )

  return (
    <div className="climate-modal" role="presentation" onMouseDown={onClose}>
      <section
        className="climate-modal__dialog"
        role="dialog"
        aria-modal="true"
        aria-labelledby="climate-modal-title"
        onMouseDown={(event) => event.stopPropagation()}
      >
        <header className="climate-modal__header">
          <h2 id="climate-modal-title">
            {climate?.provincia?.nombre ?? t('heritageDetail.climate')}
          </h2>
          <button
            type="button"
            className="climate-modal__close"
            aria-label={t('heritageDetail.closeClimate')}
            onClick={onClose}
          >
            <X size={24} strokeWidth={3} aria-hidden="true" />
          </button>
        </header>

        <div className="climate-modal__tabs" role="tablist">
          {SEASONS.map((season) => (
            <button
              key={season}
              type="button"
              role="tab"
              aria-selected={activeSeason === season}
              className={
                activeSeason === season
                  ? 'climate-modal__tab climate-modal__tab--active'
                  : 'climate-modal__tab'
              }
              onClick={() => setActiveSeason(season)}
            >
              {t(`heritageDetail.seasons.${season}`)}
            </button>
          ))}
        </div>

        <div className="climate-modal__table">
          <div className="climate-modal__table-header">
            <span>{t('heritageDetail.months')}</span>
            <span>
              <Thermometer size={17} aria-hidden="true" />
              {t('heritageDetail.maxMin')}
            </span>
            <span>
              <CloudRain size={17} aria-hidden="true" />
              {t('heritageDetail.averageRainfall')}
            </span>
          </div>
          <div className="climate-modal__table-row">
            <span>{t(`heritageDetail.seasonMonths.${activeSeason}`)}</span>
            <strong>
              {selectedClimate
                ? `${selectedClimate.temMax}° / ${selectedClimate.temMin}°`
                : '-'}
            </strong>
            <strong>
              {selectedClimate
                ? `${selectedClimate.precipitacionMedia} mm`
                : '-'}
            </strong>
          </div>
        </div>
      </section>
    </div>
  )
}

export default ClimateModal
