import { Hash } from 'lucide-react'
import appIcon from '../../assets/Favicon_GeoTour_Way.png'
import { useLanguage } from '../../hooks/useLanguage'
import './styles/LandingHeader.css'

function LandingHeader() {
  const { t } = useLanguage()

  return (
    <header className="landing-header">
      <div className="landing-header__brand">
        <span className="landing-header__brand-icon-frame">
          <img src={appIcon} alt="" className="landing-header__brand-icon" />
        </span>
        <span className="landing-header__brand-text">GTW</span>
      </div>

      <nav className="landing-header__nav" aria-label="Navegación principal">
        <span className="landing-header__nav-item">
          <Hash size={22} strokeWidth={3} aria-hidden="true" />
          {t('landing.navTravel')}
        </span>
        <span className="landing-header__nav-item">
          <Hash size={22} strokeWidth={3} aria-hidden="true" />
          {t('landing.navExplore')}
        </span>
      </nav>
    </header>
  )
}

export default LandingHeader
