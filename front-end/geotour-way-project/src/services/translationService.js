const translationCache = new Map()
let isMyMemoryQuotaExhausted = false

async function translateWithMyMemory(text, targetLanguage, sourceLanguage) {
  if (isMyMemoryQuotaExhausted) {
    throw new Error('Cuota de MyMemory agotada')
  }

  const response = await fetch(
    `https://api.mymemory.translated.net/get?q=${encodeURIComponent(text)}&langpair=${sourceLanguage}|${targetLanguage}`,
  )

  if (response.status === 429) {
    isMyMemoryQuotaExhausted = true
    throw new Error('Cuota de MyMemory agotada')
  }

  if (!response.ok) {
    throw new Error('MyMemory no pudo traducir el texto')
  }

  const data = await response.json()

  if (data.responseStatus === 429) {
    isMyMemoryQuotaExhausted = true
    throw new Error('Cuota de MyMemory agotada')
  }

  if (!data.responseData?.translatedText) {
    throw new Error('MyMemory devolvió una traducción vacía')
  }

  return data.responseData.translatedText
}

async function translateWithGoogle(text, targetLanguage, sourceLanguage) {
  const response = await fetch(
    `https://translate.googleapis.com/translate_a/single?client=gtx&sl=${sourceLanguage}&tl=${targetLanguage}&dt=t&q=${encodeURIComponent(text)}`,
  )

  if (!response.ok) {
    throw new Error('No se pudo traducir el texto')
  }

  const data = await response.json()
  const translatedText = data[0]
    ?.map((translationPart) => translationPart[0])
    .filter(Boolean)
    .join('')

  if (!translatedText) {
    throw new Error('El traductor devolvió una traducción vacía')
  }

  return translatedText
}

export async function translateText(text, targetLanguage, sourceLanguage = 'es') {
  if (!text || targetLanguage === sourceLanguage) {
    return text
  }

  const cacheKey = `${sourceLanguage}:${targetLanguage}:${text}`

  if (translationCache.has(cacheKey)) {
    return translationCache.get(cacheKey)
  }

  let translatedText

  try {
    translatedText = await translateWithMyMemory(
      text,
      targetLanguage,
      sourceLanguage,
    )
  } catch {
    translatedText = await translateWithGoogle(
      text,
      targetLanguage,
      sourceLanguage,
    )
  }

  translationCache.set(cacheKey, translatedText)
  return translatedText
}
