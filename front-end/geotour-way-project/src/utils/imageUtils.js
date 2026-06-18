export function getCardImageUrl(imageUrl) {
  if (!imageUrl) {
    return imageUrl
  }

  try {
    const url = new URL(imageUrl)

    if (url.hostname.includes('unsplash.com')) {
      url.searchParams.set('w', '360')
      url.searchParams.set('q', '55')
      url.searchParams.set('fit', 'crop')
      return url.toString()
    }

    return imageUrl
  } catch {
    return imageUrl
  }
}
