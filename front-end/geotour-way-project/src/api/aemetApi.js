const AEMET_URL = 'https://opendata.aemet.es/opendata/api'
const AEMET_API_KEY = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqLnJvbWVyby5zZXZpbGxhbm9AZ21haWwuY29tIiwianRpIjoiNjZlZjcyODgtYTRhMi00MzllLWEzOGMtMjgwYjFlZTQyM2Y0IiwiaXNzIjoiQUVNRVQiLCJpYXQiOjE3ODEzNzI1NTQsInVzZXJJZCI6IjY2ZWY3Mjg4LWE0YTItNDM5ZS1hMzhjLTI4MGIxZWU0MjNmNCIsInJvbGUiOiIifQ.Jedx-0hpyhPBLwbZInYG2NtOqgeKCLvGohk-Bm5QUV4'

async function parseJsonResponse(response) {
  const data = await response.json()

  if (!response.ok) {
    throw new Error(data.descripcion ?? 'Error al consultar AEMET')
  }

  return data
}

export async function aemetRequest(path) {
  if (!AEMET_API_KEY) {
    throw new Error('Falta configurar la API key de AEMET')
  }

  const metadataResponse = await fetch(`${AEMET_URL}${path}?api_key=${AEMET_API_KEY}`)
  const metadata = await parseJsonResponse(metadataResponse)

  if (!metadata.datos) {
    throw new Error('AEMET no ha devuelto una URL de datos')
  }

  const dataResponse = await fetch(metadata.datos)

  return parseJsonResponse(dataResponse)
}
