import { useEffect, useState } from 'react'
import { translateText } from '../services/translationService'

export function useTranslatedText(text, targetLanguage, sourceLanguage = 'es') {
  const [translation, setTranslation] = useState({ key: '', value: '' })
  const shouldTranslate = Boolean(text) && targetLanguage !== sourceLanguage
  const translationKey = `${sourceLanguage}:${targetLanguage}:${text}`

  useEffect(() => {
    let isMounted = true

    if (!shouldTranslate) {
      return undefined
    }

    translateText(text, targetLanguage, sourceLanguage)
      .then((nextText) => {
        if (isMounted) {
          setTranslation({ key: translationKey, value: nextText })
        }
      })
      .catch(() => {
        if (isMounted) {
          setTranslation({ key: translationKey, value: text })
        }
      })

    return () => {
      isMounted = false
    }
  }, [shouldTranslate, sourceLanguage, targetLanguage, text, translationKey])

  if (!shouldTranslate || translation.key !== translationKey) {
    return text
  }

  return translation.value
}
