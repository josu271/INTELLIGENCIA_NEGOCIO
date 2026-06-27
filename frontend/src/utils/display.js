const createLabelMap = (options) =>
  Object.fromEntries(options.map((option) => [option.value, option.label]))

export const roleOptions = [
  { value: 'admin', label: 'Administrador' },
  { value: 'analista', label: 'Analista' },
  { value: 'supervisor', label: 'Supervisor' },
]

export const customerTypeOptions = [
  { value: 'natural', label: 'Persona' },
  { value: 'juridico', label: 'Empresa' },
]

export const customerStatusOptions = [
  { value: 'activo', label: 'Activo' },
  { value: 'inactivo', label: 'Inactivo' },
]

export const contractStatusOptions = [
  { value: 'activo', label: 'Activo' },
  { value: 'suspendido', label: 'Suspendido' },
  { value: 'cancelado', label: 'Cancelado' },
  { value: 'inactivo', label: 'Inactivo' },
]

export const paymentMethodOptions = [
  { value: 'transferencia', label: 'Transferencia' },
  { value: 'yape', label: 'Yape' },
  { value: 'plin', label: 'Plin' },
  { value: 'efectivo', label: 'Efectivo' },
  { value: 'tarjeta', label: 'Tarjeta' },
  { value: 'deposito', label: 'Deposito bancario' },
]

export const paymentStatusOptions = [
  { value: 'pendiente', label: 'Pendiente' },
  { value: 'pagado', label: 'Pagado' },
  { value: 'vencido', label: 'Vencido' },
  { value: 'anulado', label: 'Anulado' },
]

export const incidentTypeOptions = [
  { value: 'Caida de senal', label: 'Sin senal o sin internet' },
  { value: 'Facturacion', label: 'Consulta de cobro o recibo' },
  { value: 'Velocidad lenta', label: 'Internet lento' },
  { value: 'Visita tecnica', label: 'Visita tecnica' },
]

export const incidentPriorityOptions = [
  { value: 'baja', label: 'Baja' },
  { value: 'media', label: 'Media' },
  { value: 'alta', label: 'Alta' },
  { value: 'critica', label: 'Urgente' },
]

export const incidentStatusOptions = [
  { value: 'registrada', label: 'Registrada' },
  { value: 'en_proceso', label: 'En seguimiento' },
  { value: 'resuelta', label: 'Resuelta' },
  { value: 'cerrada', label: 'Cerrada' },
]

export const riskLevelOptions = [
  { value: 'bajo', label: 'Bajo' },
  { value: 'medio', label: 'Medio' },
  { value: 'alto', label: 'Alto' },
]

export const roleLabels = createLabelMap(roleOptions)
export const customerTypeLabels = createLabelMap(customerTypeOptions)
export const customerStatusLabels = createLabelMap(customerStatusOptions)
export const contractStatusLabels = createLabelMap(contractStatusOptions)
export const paymentMethodLabels = createLabelMap(paymentMethodOptions)
export const paymentStatusLabels = createLabelMap(paymentStatusOptions)
export const incidentTypeLabels = createLabelMap(incidentTypeOptions)
export const incidentPriorityLabels = createLabelMap(incidentPriorityOptions)
export const incidentStatusLabels = createLabelMap(incidentStatusOptions)
export const riskLevelLabels = createLabelMap(riskLevelOptions)

export function getDisplayLabel(labels, value) {
  if (!value) {
    return ''
  }

  return labels[value] ?? value
}
