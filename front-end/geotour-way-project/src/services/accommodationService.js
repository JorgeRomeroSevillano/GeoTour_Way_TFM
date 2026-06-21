import { openTripMapRequest } from '../api/openTripMapApi'

const DEFAULT_LIMIT = 500
const ACCOMMODATION_KINDS = 'accomodations'
const MAX_SEARCH_RADIUS = 50000
const FIXED_SEARCH_NATURAL_RADII = {
  'parque natural de las islas atlanticas de galicia': 20000,
  'parque natural cabo de gata-nijar': 15000,
  'parque nacional de ordesa y monte perdido': 15000,
  'parque nacional de las tablas de daimiel': 15000,
  'parque nacional de los picos de europa': 15000,
  'parque nacional del teide': 15000,
  'lagos de covadonga': 15000,
}

function mapAccommodation(place) {
  return {
    id: place.xid,
    name: place.name,
    rate: Number(place.rate),
    coordinates: {
      lat: place.point.lat,
      lon: place.point.lon,
    },
  }
}

function normalizeName(name = '') {
  return name
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
}

function getSearchRadii(heritageType, heritageName) {
  const fixedRadius = FIXED_SEARCH_NATURAL_RADII[normalizeName(heritageName)]

  if (fixedRadius) {
    return [fixedRadius]
  }

  const isNatural = heritageType?.toLowerCase() === 'natural'
  const increment = isNatural ? 5000 : 2000
  const firstRadius = isNatural ? 10000 : 8000
  const radii = [firstRadius]

  for (
    let radius = firstRadius + increment;
    radius <= MAX_SEARCH_RADIUS;
    radius += increment
  ) {
    radii.push(radius)
  }

  return radii
}

export async function getAccommodationsByCoordinates({
  lat,
  lon,
  radius,
  limit = DEFAULT_LIMIT,
}) {
  if (radius === undefined || radius === null) {
    throw new Error('El radio es obligatorio para buscar alojamientos')
  }

  const places = await openTripMapRequest('/radius', {
    radius,
    lon,
    lat,
    kinds: ACCOMMODATION_KINDS,
    format: 'json',
    limit,
  })

  return places
    .filter(
      (place) =>
        place.name &&
        Number.isFinite(place.point?.lat) &&
        Number.isFinite(place.point?.lon) &&
        Number(place.rate) >= 1 &&
        Number(place.rate) <= 3,
    )
    .map(mapAccommodation)
}

export async function findNearbyAccommodations({
  heritageName,
  heritageType,
  lat,
  lon,
}) {
  const radii = getSearchRadii(heritageType, heritageName)

  for (const radius of radii) {
    const accommodations = await getAccommodationsByCoordinates({
      lat,
      lon,
      radius,
    })

    if (accommodations.length > 0) {
      return { accommodations, radius }
    }
  }

  return {
    accommodations: [],
    radius: radii[radii.length - 1],
  }
}
