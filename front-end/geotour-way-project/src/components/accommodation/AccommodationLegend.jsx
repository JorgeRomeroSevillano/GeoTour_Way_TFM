import { ChevronDown, Star } from 'lucide-react'
import { useLanguage } from '../../hooks/useLanguage'
import './styles/AccommodationLegend.css'

const RATES = [1, 2, 3]

function AccommodationLegend({ onRateToggle, patrimonio, searchRadius, selectedRates }) {
  const { t } = useLanguage()

  return (
    <aside className="accommodation-legend" aria-label={t('accommodation.legend')}>
      <dl className="accommodation-legend__heritage">
        <div>
          <dt>{t('accommodation.name')}:</dt>
          <dd>{patrimonio.nombre}</dd>
        </div>
        <div>
          <dt>{t('accommodation.locality')}:</dt>
          <dd>{patrimonio.localidad}</dd>
        </div>
        <div>
          <dt>{t('accommodation.province')}:</dt>
          <dd>{patrimonio.provincia?.nombre ?? '-'}</dd>
        </div>
        <div>
          <dt>{t('accommodation.community')}:</dt>
          <dd>{patrimonio.provincia?.comunidad ?? '-'}</dd>
        </div>
      </dl>

      <div className="accommodation-legend__symbols">
        <span><i className="accommodation-legend__pin accommodation-legend__pin--red" />{t('accommodation.heritage')}</span>
        <span><i className="accommodation-legend__pin accommodation-legend__pin--blue" />{t('accommodation.lodging')}</span>
      </div>

      <details className="accommodation-legend__filter">
        <summary>
          {t('accommodation.filterByRate')}
          <ChevronDown size={17} aria-hidden="true" />
        </summary>
        <div className="accommodation-legend__rate-options">
          {RATES.map((rate) => (
            <label key={rate}>
              <input
                type="checkbox"
                checked={selectedRates.includes(rate)}
                onChange={() => onRateToggle(rate)}
              />
              <span>{rate}</span>
              <Star size={15} fill="currentColor" aria-hidden="true" />
            </label>
          ))}
        </div>
      </details>

      <small className="accommodation-legend__radius">
        {t('accommodation.searchRadius')}: {(searchRadius / 1000).toLocaleString()} km
      </small>
    </aside>
  )
}

export default AccommodationLegend
