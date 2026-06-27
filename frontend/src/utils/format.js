export function formatCurrency(value) {
  return new Intl.NumberFormat('es-PE', {
    style: 'currency',
    currency: 'PEN',
    maximumFractionDigits: 0,
  }).format(Number(value || 0))
}

export function formatNumber(value) {
  return new Intl.NumberFormat('es-PE', {
    maximumFractionDigits: 2,
  }).format(Number(value || 0))
}

export function formatPercent(value) {
  return `${formatNumber(value)}%`
}

export function toDateInput(value) {
  return value ? value.slice(0, 10) : ''
}

export function toDateTimeInput(value) {
  return value ? value.slice(0, 16) : ''
}
