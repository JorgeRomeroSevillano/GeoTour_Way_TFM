import { useLanguage } from '../hooks/useLanguage'
import './styles/Favourites.css'

function Favourites() {
  const { t } = useLanguage()

  return <section className="favourites" aria-label={t('favourites.label')} />
}

export default Favourites
