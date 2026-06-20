import { useLanguage } from '../hooks/useLanguage'
import './styles/HeritageGastronomy.css'

function HeritageGastronomy() {
  const { t } = useLanguage()

  return (
    <section
      className="heritage-gastronomy"
      aria-label={t('heritageDetail.gastronomy')}
    />
  )
}

export default HeritageGastronomy
