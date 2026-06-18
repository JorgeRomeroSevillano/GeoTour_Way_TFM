import { useLanguage } from '../hooks/useLanguage'
import './styles/HeritageDetail.css'

function HeritageDetail() {
  const { t } = useLanguage()

  return <section className="heritage-detail" aria-label={t('heritageDetail.label')} />
}

export default HeritageDetail
