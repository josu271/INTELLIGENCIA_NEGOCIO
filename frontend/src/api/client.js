const API_BASE_URL = import.meta.env.VITE_API_BASE_URL ?? 'http://localhost:8000'

export async function apiFetch(path, options = {}) {
  const { token, parseAs = 'json', body, headers, ...rest } = options
  const response = await fetch(`${API_BASE_URL}${path}`, {
    ...rest,
    headers: {
      ...(body ? { 'Content-Type': 'application/json' } : {}),
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
      ...headers,
    },
    body: body ? JSON.stringify(body) : undefined,
  })

  if (!response.ok) {
    let message = 'No fue posible completar la operacion.'
    try {
      const data = await response.json()
      message = data.detail ?? data.message ?? message
    } catch {
      message = response.statusText || message
    }
    throw new Error(message)
  }

  if (parseAs === 'text') {
    return response.text()
  }

  if (response.status === 204) {
    return null
  }

  return response.json()
}
