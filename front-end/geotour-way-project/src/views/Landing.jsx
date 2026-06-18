import { useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import backgroundLanding from '../assets/background_landing.avif'
import LandingHeader from '../components/landing/LandingHeader.jsx'
import { useLanguage } from '../hooks/useLanguage'
import './styles/Landing.css'

function Landing() {
  const navigate = useNavigate()
  const { t } = useLanguage()

  useEffect(() => {
    const timeoutId = window.setTimeout(() => {
      navigate('/home')
    }, 10000)

    return () => window.clearTimeout(timeoutId)
  }, [navigate])

  return (
    <section
      className="landing"
      style={{ '--landing-background': `url(${backgroundLanding})` }}
    >
      <LandingHeader />

      <div className="landing__content">
        <h1 className="landing__title">{t('landing.title')}</h1>
        <p className="landing__subtitle">{t('landing.subtitle')}</p>
        <button
          type="button"
          className="landing__action"
          onClick={() => navigate('/home')}
        >
          {t('landing.action')}
        </button>
      </div>
    </section>
  )
}

export default Landing
