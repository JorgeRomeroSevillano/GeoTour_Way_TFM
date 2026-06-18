import { useLanguage } from '../hooks/useLanguage'
import './styles/Home.css'

function Home() {
  const { t } = useLanguage()

  return <section className="home" aria-label={t('home.label')} />
}

export default Home
