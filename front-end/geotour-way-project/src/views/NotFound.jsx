import { ArrowLeft, Compass, Home, Map } from 'lucide-react'
import { useNavigate } from 'react-router-dom'
import { useLanguage } from '../hooks/useLanguage'
import './styles/NotFound.css'

function NotFound() {
  const navigate = useNavigate()
  const { t } = useLanguage()

  return (
    <section className="notfound" aria-label={t('notFound.label')}>
      <div className="notfound__content">
        <p className="notfound__eyebrow">404</p>
        <h1 className="notfound__title">{t('notFound.title')}</h1>
        <p className="notfound__message">{t('notFound.message')}</p>

        <div className="notfound__actions">
          <button
            type="button"
            className="notfound__button notfound__button--primary"
            onClick={() => navigate('/home')}
          >
            <Home size={18} aria-hidden="true" />
            {t('notFound.homeAction')}
          </button>
          <button
            type="button"
            className="notfound__button"
            onClick={() => navigate(-1)}
          >
            <ArrowLeft size={18} aria-hidden="true" />
            {t('notFound.backAction')}
          </button>
        </div>
      </div>

      <div className="notfound__visual" aria-hidden="true">
        <Compass className="notfound__compass" size={96} strokeWidth={1.7} />
        <Map className="notfound__map" size={52} strokeWidth={1.8} />
      </div>
    </section>
  )
}

export default NotFound
