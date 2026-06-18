import { Heart } from 'lucide-react'
import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import appIcon from '../../assets/Favicon_GeoTour_Way.png'
import spainFlag from '../../assets/icons/spain-country-round-flag.png'
import ukFlag from '../../assets/icons/uk-country-round-flag.png'
import { useLanguage } from '../../hooks/useLanguage'
import { getFavoritos } from '../../services/favoritosService'
import './styles/Header.css'

const flags = {
  en: ukFlag,
  es: spainFlag,
}

function Header() {
  const navigate = useNavigate()
  const { language, setLanguage, t } = useLanguage()
  const [favoriteCount, setFavoriteCount] = useState(0)
  const [isLanguageMenuOpen, setIsLanguageMenuOpen] = useState(false)

  useEffect(() => {
    getFavoritos()
      .then((response) => {
        setFavoriteCount(response.idsPatrimonio?.length ?? 0)
      })
      .catch(() => {
        setFavoriteCount(0)
      })
  }, [])

  function handleLanguageChange(nextLanguage) {
    setLanguage(nextLanguage)
    setIsLanguageMenuOpen(false)
  }

  return (
    <header className="header">
      <button
        type="button"
        className="header__brand"
        aria-label={t('home.label')}
        onClick={() => navigate('/home')}
      >
        <span className="header__brand-icon-frame">
          <img src={appIcon} alt="" className="header__brand-icon" />
        </span>
        <span className="header__brand-text">GTW</span>
      </button>

      <div className="header__actions">
        <button
          type="button"
          className="header__favorite-button"
          aria-label={t('header.favorites')}
          onClick={() => navigate('/favourites')}
        >
          <Heart
            size={24}
            strokeWidth={3}
            fill="currentColor"
            aria-hidden="true"
          />
          <span className="header__favorite-count">{favoriteCount}</span>
        </button>

        <div className="header__language">
          <button
            type="button"
            className="header__language-button"
            aria-label={t('header.language')}
            aria-expanded={isLanguageMenuOpen}
            onClick={() => setIsLanguageMenuOpen((isOpen) => !isOpen)}
          >
            <img
              src={flags[language]}
              alt=""
              className="header__language-flag"
            />
          </button>

          {isLanguageMenuOpen && (
            <div className="header__language-menu">
              <button
                type="button"
                className="header__language-option"
                onClick={() => handleLanguageChange('es')}
              >
                <img src={spainFlag} alt="" className="header__language-flag" />
                {t('header.spanish')}
              </button>
              <button
                type="button"
                className="header__language-option"
                onClick={() => handleLanguageChange('en')}
              >
                <img src={ukFlag} alt="" className="header__language-flag" />
                {t('header.english')}
              </button>
            </div>
          )}
        </div>
      </div>
    </header>
  )
}

export default Header
