const DEFAULT_GATEWAY_URL = 'http://localhost:8762'

function buildGatewayPayload({ targetMethod, queryParams = {}, body = null }) {
  return {
    targetMethod,
    queryParams,
    body,
  }
}

async function parseResponse(response) {
  const contentType = response.headers.get('content-type')

  if (contentType?.includes('application/json')) {
    return response.json()
  }

  return response.text()
}

export async function gatewayRequest({
  service,
  path,
  targetMethod = 'GET',
  queryParams = {},
  body = null,
}) {
  const normalizedPath = path.startsWith('/') ? path : `/${path}`
  const response = await fetch(`${DEFAULT_GATEWAY_URL}/${service}${normalizedPath}`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(
      buildGatewayPayload({
        targetMethod,
        queryParams,
        body,
      }),
    ),
  })

  const data = await parseResponse(response)

  if (!response.ok) {
    const message =
      typeof data === 'object' && data !== null && 'message' in data
        ? data.message
        : 'Error al comunicarse con el Gateway'

    throw new Error(message)
  }

  return data
}
