import HeritageGrid from '../components/home/HeritageGrid'
import HomeFilters from '../components/home/HomeFilters'
import HomeHero from '../components/home/HomeHero'
import HomePagination from '../components/home/HomePagination'
import HomeToolbar from '../components/home/HomeToolbar'
import { useHome } from '../hooks/useHome'
import { useLanguage } from '../hooks/useLanguage'
import HomeProvider from '../provider/HomeProvider'
import './styles/Home.css'

function HomeContent() {
  const { isFiltersOpen } = useHome()
  const { t } = useLanguage()

  return (
    <section className="home" aria-label={t('home.label')}>
      {isFiltersOpen && <HomeFilters />}

      <div className="home__content">
        <HomeHero />
        <HomeToolbar />
        <HeritageGrid />
        <HomePagination />
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
