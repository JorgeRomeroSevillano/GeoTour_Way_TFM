import { useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import backgroundLanding from '../assets/background_landing.avif'
import LandingHeader from '../components/landing/LandingHeader.jsx'
import './styles/Landing.css'

function Landing() {
  const navigate = useNavigate()

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
        <h1 className="landing__title">"Descubre España a tu manera"</h1>
        <p className="landing__subtitle">
          Destinos únicos y experiencias auténticas
        </p>
        <button
          type="button"
          className="landing__action"
          onClick={() => navigate('/home')}
        >
          Explorar destinos
        </button>
      </div>
    </section>
  )
}

export default Landing
