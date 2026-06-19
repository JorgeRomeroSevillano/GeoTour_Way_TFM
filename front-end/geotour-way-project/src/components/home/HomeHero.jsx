import { Search } from 'lucide-react'
import { useHeritageList } from '../../hooks/useHeritageList'
import { useLanguage } from '../../hooks/useLanguage'
import './styles/HomeHero.css'

function HomeHero() {
  const { handleSearch, handleSearchChange, handleSearchKeyDown, search } =
    useHeritageList()
  const { t } = useLanguage()

  return (
    <header className="home__hero">
      <h1>{t('home.title')}</h1>
      <p>{t('home.subtitle')}</p>
      <div className="home__search">
        <input
          type="search"
          value={search}
          placeholder={t('home.searchPlaceholder')}
          onChange={handleSearchChange}
          onKeyDown={handleSearchKeyDown}
        />
        <button type="button" onClick={handleSearch}>
          <Search size={31} strokeWidth={3} aria-hidden="true" />
        </button>
      </div>
    </header>
  )
}

export default HomeHero
