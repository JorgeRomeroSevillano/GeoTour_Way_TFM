import { useLanguage } from '../hooks/useLanguage'
import './styles/HeritageAccommodation.css'

function HeritageAccommodation() {
  const { t } = useLanguage()

  return (
    <section
      className="heritage-accommodation"
      aria-label={t('heritageDetail.accommodation')}
    />
  )
}

export default HeritageAccommodation
