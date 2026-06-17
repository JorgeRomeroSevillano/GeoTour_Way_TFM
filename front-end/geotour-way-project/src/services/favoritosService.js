import { gatewayRequest } from '../api/gatewayApi'

const SERVICE = 'favoritos'

export function getFavoritos() {
  return gatewayRequest({
    service: SERVICE,
    path: '/favoritos',
    targetMethod: 'GET',
  })
}

export function addFavorito(idPatrimonio) {
  return gatewayRequest({
    service: SERVICE,
    path: '/favoritos',
    targetMethod: 'POST',
    body: {
      idPatrimonio,
    },
  })
}

export function deleteFavorito(idPatrimonio) {
  return gatewayRequest({
    service: SERVICE,
    path: `/favoritos/${encodeURIComponent(idPatrimonio)}`,
    targetMethod: 'DELETE',
  })
}

export function deleteFavoritos() {
  return gatewayRequest({
    service: SERVICE,
    path: '/favoritos',
    targetMethod: 'DELETE',
  })
}
