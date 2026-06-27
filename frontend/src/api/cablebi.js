import { apiFetch } from './client'

export const cablebiApi = {
  getSystemInfo() {
    return apiFetch('/')
  },
  login(payload) {
    return apiFetch('/api/v1/auth/login', {
      method: 'POST',
      body: payload,
    })
  },
  listSites(token) {
    return apiFetch('/api/v1/sedes', { token })
  },
  listPlans(token) {
    return apiFetch('/api/v1/planes', { token })
  },
  listClients(token) {
    return apiFetch('/api/v1/clientes', { token })
  },
  createClient(token, payload) {
    return apiFetch('/api/v1/clientes', { method: 'POST', token, body: payload })
  },
  updateClient(token, clientId, payload) {
    return apiFetch(`/api/v1/clientes/${clientId}`, {
      method: 'PUT',
      token,
      body: payload,
    })
  },
  deactivateClient(token, clientId) {
    return apiFetch(`/api/v1/clientes/${clientId}`, {
      method: 'DELETE',
      token,
    })
  },
  listContracts(token) {
    return apiFetch('/api/v1/contratos', { token })
  },
  createContract(token, payload) {
    return apiFetch('/api/v1/contratos', { method: 'POST', token, body: payload })
  },
  updateContract(token, contractId, payload) {
    return apiFetch(`/api/v1/contratos/${contractId}`, {
      method: 'PUT',
      token,
      body: payload,
    })
  },
  cancelContract(token, contractId) {
    return apiFetch(`/api/v1/contratos/${contractId}`, {
      method: 'DELETE',
      token,
    })
  },
  listPayments(token) {
    return apiFetch('/api/v1/pagos', { token })
  },
  createPayment(token, payload) {
    return apiFetch('/api/v1/pagos', { method: 'POST', token, body: payload })
  },
  updatePayment(token, paymentId, payload) {
    return apiFetch(`/api/v1/pagos/${paymentId}`, {
      method: 'PUT',
      token,
      body: payload,
    })
  },
  listIncidents(token) {
    return apiFetch('/api/v1/incidencias', { token })
  },
  createIncident(token, payload) {
    return apiFetch('/api/v1/incidencias', { method: 'POST', token, body: payload })
  },
  updateIncident(token, incidentId, payload) {
    return apiFetch(`/api/v1/incidencias/${incidentId}`, {
      method: 'PUT',
      token,
      body: payload,
    })
  },
  getDashboardSummary(token, params = {}) {
    const query = new URLSearchParams()
    if (params.region) {
      query.set('region', params.region)
    }
    if (params.site_id) {
      query.set('site_id', params.site_id)
    }
    const suffix = query.toString() ? `?${query}` : ''
    return apiFetch(`/api/v1/dashboard/resumen${suffix}`, { token })
  },
  getSiteKpis(token, region = '') {
    const suffix = region ? `?region=${encodeURIComponent(region)}` : ''
    return apiFetch(`/api/v1/kpis/sedes${suffix}`, { token })
  },
  getRegionReport(token, params = {}) {
    const query = new URLSearchParams()
    if (params.region) {
      query.set('region', params.region)
    }
    if (params.start_date) {
      query.set('start_date', params.start_date)
    }
    if (params.end_date) {
      query.set('end_date', params.end_date)
    }
    const suffix = query.toString() ? `?${query}` : ''
    return apiFetch(`/api/v1/reportes/regional${suffix}`, { token })
  },
  exportRegionReport(token, params = {}) {
    const query = new URLSearchParams()
    if (params.region) {
      query.set('region', params.region)
    }
    if (params.start_date) {
      query.set('start_date', params.start_date)
    }
    if (params.end_date) {
      query.set('end_date', params.end_date)
    }
    const suffix = query.toString() ? `?${query}` : ''
    return apiFetch(`/api/v1/reportes/regional/export${suffix}`, {
      token,
      parseAs: 'text',
    })
  },
  getRetentionAlerts(token) {
    return apiFetch('/api/v1/alertas/retencion', { token })
  },
  getSegments(token) {
    return apiFetch('/api/v1/ml/segmentacion', { token })
  },
  getChurnPredictions(token) {
    return apiFetch('/api/v1/ml/riesgo-clientes', { token })
  },
  predictClientChurn(token, clientId) {
    return apiFetch('/api/v1/ml/prediccion-churn', {
      method: 'POST',
      token,
      body: { client_id: Number(clientId) },
    })
  },
}
