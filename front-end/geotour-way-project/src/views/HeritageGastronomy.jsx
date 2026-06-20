import { ArrowLeft } from 'lucide-react'
import { useNavigate, useParams } from 'react-router-dom'
import GastronomyCard from '../components/gastronomy/GastronomyCard'
import { useHeritageGastronomy } from '../hooks/useHeritageGastronomy'
import { useLanguage } from '../hooks/useLanguage'
import './styles/HeritageGastronomy.css'

function HeritageGastronomy() {
  const { id } = useParams()
  const navigate = useNavigate()
  const { t } = useLanguage()
  const { error, gastronomy, isLoading } = useHeritageGastronomy(id)

  if (isLoading) {
    return (
      <section className="heritage-gastronomy heritage-gastronomy--state">
        <p>{t('gastronomy.loading')}</p>
      </section>
    )
  }

  if (error || !gastronomy) {
    return (
      <section className="heritage-gastronomy heritage-gastronomy--state">
        <h1>{t('gastronomy.loadError')}</h1>
        <p>{error}</p>
        <button type="button" onClick={() => navigate(-1)}>
          {t('heritageDetail.back')}
        </button>
      </section>
    )
  }

  return (
    <section
      className="heritage-gastronomy"
      aria-label={t('gastronomy.label')}
    >
      <header className="heritage-gastronomy__header">
        <button
          type="button"
          aria-label={t('gastronomy.back')}
          title={t('gastronomy.back')}
          onClick={() => navigate(-1)}
        >
          <ArrowLeft size={19} aria-hidden="true" />
        </button>
        <div>
          <h1>
            {t('gastronomy.title')} {gastronomy.provincia?.nombre}
          </h1>
          <p>{t('gastronomy.subtitle')}</p>
        </div>
      </header>

      {gastronomy.platos?.length > 0 ? (
        <div className="heritage-gastronomy__grid">
          {gastronomy.platos.map((dish) => (
            <GastronomyCard key={dish.id} dish={dish} />
          ))}
        </div>
      ) : (
        <div className="heritage-gastronomy__empty">
          <h2>{t('gastronomy.noResultsTitle')}</h2>
          <p>{t('gastronomy.noResults')}</p>
        </div>
      )}
    </section>
  )
}

export default HeritageGastronomy
