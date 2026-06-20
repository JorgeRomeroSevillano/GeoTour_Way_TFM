import { useLanguage } from '../../hooks/useLanguage'
import { useTranslatedText } from '../../hooks/useTranslatedText'
import { getWeatherIcon } from '../../utils/weatherIcons'
import './styles/CurrentWeather.css'

function CurrentWeather({ weather }) {
  const { language, t } = useLanguage()
  const translatedDescription = useTranslatedText(
    weather?.sky?.description,
    language,
  )
  const description = translatedDescription ?? t('heritageDetail.unavailable')

  return (
    <div className="current-weather">
      <span
        className="current-weather__icon"
        role="img"
        aria-label={description}
      >
        {getWeatherIcon(weather?.sky?.code)}
      </span>
      <div className="current-weather__information">
        <span className="current-weather__label">
          {t('heritageDetail.currentWeather')}
        </span>
        <strong className="current-weather__temperature">
          {weather ? `${weather.temperature}°C` : '--'}
        </strong>
        <small className="current-weather__description">{description}</small>
      </div>
    </div>
  )
}

export default CurrentWeather
