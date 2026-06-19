import HomeHero from '../components/home/HomeHero'
import HeritageFilters from '../components/heritageList/HeritageFilters'
import HeritageGrid from '../components/heritageList/HeritageGrid'
import HeritagePagination from '../components/heritageList/HeritagePagination'
import HeritageToolbar from '../components/heritageList/HeritageToolbar'
import { useHeritageList } from '../hooks/useHeritageList'
import { useLanguage } from '../hooks/useLanguage'
import HomeProvider from '../provider/HomeProvider'
import './styles/Home.css'

function HomeContent() {
  const { isFiltersOpen } = useHeritageList()
  const { t } = useLanguage()

  return (
    <section className="home" aria-label={t('home.label')}>
      {isFiltersOpen && <HeritageFilters />}

      <div className="home__content">
        <HomeHero />
        <HeritageToolbar />
        <HeritageGrid />
        <HeritagePagination />
      </div>
    </section>
  )
}

function Home() {
  return (
    <HomeProvider>
      <HomeContent />
    </HomeProvider>
  )
}

export default Home
