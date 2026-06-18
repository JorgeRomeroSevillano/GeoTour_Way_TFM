import { useMemo, useState } from 'react'
import { LanguageContext } from '../context/LanguageContext'
import en from '../locales/en.json'
import es from '../locales/es.json'

const translations = {
  en,
  es,
}

const DEFAULT_LANGUAGE = 'es'
const LANGUAGE_STORAGE_KEY = 'geotour-way-language'

function getInitialLanguage() {
  const storedLanguage = window.localStorage.getItem(LANGUAGE_STORAGE_KEY)

  return translations[storedLanguage] ? storedLanguage : DEFAULT_LANGUAGE
}

function getTranslation(language, key) {
  return key.split('.').reduce((value, part) => value?.[part], translations[language])
}

function LanguageProvider({ children }) {
  const [language, setLanguageState] = useState(getInitialLanguage)

  function setLanguage(nextLanguage) {
    if (!translations[nextLanguage]) {
      return
    }

    window.localStorage.setItem(LANGUAGE_STORAGE_KEY, nextLanguage)
    setLanguageState(nextLanguage)
  }

  const value = useMemo(
    () => ({
      language,
      setLanguage,
      t: (key) => getTranslation(language, key) ?? key,
    }),
    [language],
  )

  return (
    <LanguageContext.Provider value={value}>
      {children}
    </LanguageContext.Provider>
  )
}

export default LanguageProvider
