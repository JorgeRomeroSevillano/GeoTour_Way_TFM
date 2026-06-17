import { gatewayRequest } from '../api/gatewayApi'

const SERVICE = 'patrimonio'

function toQueryValue(value) {
  if (value === undefined || value === null || value === '') {
    return null
  }

  return Array.isArray(value) ? value.join(',') : String(value)
}

function buildPatrimonioQueryParams(filters = {}) {
  return Object.entries(filters).reduce((queryParams, [key, value]) => {
    const queryValue = toQueryValue(value)

    if (queryValue !== null) {
      queryParams[key] = [queryValue]
    }

    return queryParams
  }, {})
}

export function getPatrimonios(filters = {}) {
  return gatewayRequest({
    service: SERVICE,
    path: '/patrimonios',
    targetMethod: 'GET',
    queryParams: buildPatrimonioQueryParams(filters),
  })
}

export function getPatrimonioDetalle(id) {
  return gatewayRequest({
    service: SERVICE,
    path: `/patrimonios/${encodeURIComponent(id)}`,
    targetMethod: 'GET',
  })
}

export function getGastronomiaProvincia(provinciaId) {
  return gatewayRequest({
    service: SERVICE,
    path: `/provincias/${encodeURIComponent(provinciaId)}/gastronomia`,
    targetMethod: 'GET',
  })
}

export function getClimaProvincia(provinciaId) {
  return gatewayRequest({
    service: SERVICE,
    path: `/provincias/${encodeURIComponent(provinciaId)}/clima`,
    targetMethod: 'GET',
  })
}

export function updatePatrimonioValoracion(id, valoracion) {
  return gatewayRequest({
    service: SERVICE,
    path: `/patrimonios/${encodeURIComponent(id)}/valoracion`,
    targetMethod: 'PATCH',
    body: {
      valoracion,
    },
  })
}
