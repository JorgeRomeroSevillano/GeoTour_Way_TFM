import { openTripMapRequest } from '../api/openTripMapApi'

const DEFAULT_LIMIT = 500
const ACCOMMODATION_KINDS = 'accomodations'

function mapAccommodation(place) {
  return {
    name: place.name,
    rate: place.rate,
    coordinates: {
      lat: place.point.lat,
      lon: place.point.lon,
    },
  }
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
    .filter((place) => place.name && place.point?.lat && place.point?.lon)
    .map(mapAccommodation)
}
