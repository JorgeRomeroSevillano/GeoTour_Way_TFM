const translationCache = new Map()

export async function translateText(text, targetLanguage, sourceLanguage = 'es') {
  if (!text || targetLanguage === sourceLanguage) {
    return text
  }

  const cacheKey = `${sourceLanguage}:${targetLanguage}:${text}`

  if (translationCache.has(cacheKey)) {
    return translationCache.get(cacheKey)
  }

  const response = await fetch(
    `https://api.mymemory.translated.net/get?q=${encodeURIComponent(text)}&langpair=${sourceLanguage}|${targetLanguage}`,
  )

  if (!response.ok) {
    throw new Error('No se pudo traducir el texto')
  }

  const data = await response.json()
  const translatedText = data.responseData?.translatedText || text
  translationCache.set(cacheKey, translatedText)

  return translatedText
}
