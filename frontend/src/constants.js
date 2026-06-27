export const DEFAULT_VIEW = 'dashboard'

export const NAV_ITEMS = [
  { id: 'dashboard', label: 'Resumen', helper: 'Vista general del negocio' },
  { id: 'clientes', label: 'Clientes', helper: 'Datos y contacto' },
  { id: 'contratos', label: 'Servicios', helper: 'Planes y estado' },
  { id: 'pagos', label: 'Pagos', helper: 'Cobros y seguimiento' },
  { id: 'incidencias', label: 'Atencion', helper: 'Problemas y seguimiento' },
  { id: 'reportes', label: 'Reportes', helper: 'Resultados por fechas' },
  { id: 'ml', label: 'Analisis', helper: 'Riesgo de baja y grupos' },
]

export const SEGMENT_COLORS = {
  'Residencial Economico': '#0f766e',
  'Residencial Alto Consumo': '#ea580c',
  'Empresarial / Corporativo': '#0f172a',
  'En Riesgo': '#dc2626',
  'Base General': '#1d4ed8',
}

export const initialClientForm = {
  site_id: '',
  dni: '',
  first_name: '',
  last_name: '',
  email: '',
  phone: '',
  address: '',
  customer_type: 'natural',
  status: 'activo',
  registered_at: new Date().toISOString().slice(0, 10),
}

export const initialContractForm = {
  client_id: '',
  site_id: '',
  plan_id: '',
  start_date: new Date().toISOString().slice(0, 10),
  end_date: '',
  status: 'activo',
  note: '',
}

export const initialPaymentForm = {
  contract_id: '',
  issued_date: new Date().toISOString().slice(0, 10),
  paid_date: '',
  amount: '',
  payment_method: 'transferencia',
  reference: '',
  status: 'pendiente',
}

export const initialIncidentForm = {
  client_id: '',
  contract_id: '',
  site_id: '',
  reported_at: new Date().toISOString().slice(0, 16),
  resolved_at: '',
  incident_type: 'Caida de senal',
  description: '',
  priority: 'media',
  status: 'registrada',
}
