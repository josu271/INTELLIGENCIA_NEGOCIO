import {
  Bar,
  BarChart,
  CartesianGrid,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'
import { DataTable, Field, MetricCard, Panel } from '../components/ui'
import { formatCurrency, formatNumber } from '../utils/format'

function monthRange(value) {
  if (!value) {
    return { start_date: '', end_date: '' }
  }

  const [year, month] = value.split('-').map(Number)
  const lastDay = new Date(year, month, 0).getDate()
  const paddedMonth = String(month).padStart(2, '0')

  return {
    start_date: `${year}-${paddedMonth}-01`,
    end_date: `${year}-${paddedMonth}-${String(lastDay).padStart(2, '0')}`,
  }
}

export function ReportsPage({
  reportFilters,
  setReportFilters,
  sites,
  exportReport,
  report,
}) {
  const reportMonth = reportFilters.start_date ? reportFilters.start_date.slice(0, 7) : ''

  return (
    <div className="section-stack">
      <Panel
        eyebrow="Reportes"
        title="Resultados por zona y fechas"
        subtitle="Para una empresa de telecomunicaciones, lo mas practico es revisar los resultados por mes."
        actions={
          <div className="filter-row">
            <Field label="Zona">
              <select
                value={reportFilters.region}
                onChange={(event) =>
                  setReportFilters((current) => ({
                    ...current,
                    region: event.target.value,
                  }))
                }
              >
                <option value="">Todas las regiones</option>
                {[...new Set(sites.map((site) => site.region))].map((region) => (
                  <option key={region} value={region}>
                    {region}
                  </option>
                ))}
              </select>
            </Field>
            <Field
              label="Mes del reporte"
              hint="Al elegir un mes, el sistema calcula el periodo completo automaticamente."
            >
              <input
                type="month"
                value={reportMonth}
                onChange={(event) => {
                  const range = monthRange(event.target.value)
                  setReportFilters((current) => ({
                    ...current,
                    ...range,
                  }))
                }}
              />
            </Field>
            <button type="button" className="primary-button" onClick={exportReport}>
              Descargar CSV
            </button>
          </div>
        }
      >
        <div className="metrics-grid">
          <MetricCard
            label="Monto acumulado"
            value={formatCurrency(report.totals.revenue)}
            detail="Total del periodo consultado"
          />
          <MetricCard
            label="Casos registrados"
            value={formatNumber(report.totals.incidents)}
            detail="Atenciones registradas en el periodo"
            tone="red"
          />
          <MetricCard
            label="Nuevos clientes"
            value={formatNumber(report.totals.new_clients)}
            detail="Clientes incorporados en ese rango"
            tone="orange"
          />
          <MetricCard
            label="Clientes que dejaron el servicio"
            value={formatNumber(report.totals.churn_events)}
            detail="Bajas registradas en el periodo"
            tone="navy"
          />
        </div>
      </Panel>

      <Panel
        eyebrow="Resumen mensual"
        title="Ingresos por mes"
        subtitle="Comparacion del periodo seleccionado"
      >
        <div className="chart-box">
          <ResponsiveContainer width="100%" height={300}>
            <BarChart data={report.series}>
              <CartesianGrid strokeDasharray="3 3" stroke="#d9d4ca" />
              <XAxis dataKey="period" stroke="#6f6658" />
              <YAxis stroke="#6f6658" />
              <Tooltip formatter={(value) => [formatCurrency(value), 'Ingresos']} />
              <Bar dataKey="revenue" fill="#0f172a" radius={[8, 8, 0, 0]} />
            </BarChart>
          </ResponsiveContainer>
        </div>
      </Panel>

      <Panel
        eyebrow="Detalle del reporte"
        title="Datos para revision"
        subtitle="Tabla lista para compartir o descargar"
      >
        <DataTable
          columns={[
            { key: 'period', label: 'Periodo' },
            {
              key: 'revenue',
              label: 'Ingresos',
              render: (row) => formatCurrency(row.revenue),
            },
            { key: 'new_clients', label: 'Nuevos clientes' },
            { key: 'active_clients', label: 'Clientes activos' },
            { key: 'incidents', label: 'Casos' },
            { key: 'churn_events', label: 'Bajas de clientes' },
          ]}
          rows={report.series}
          emptyMessage="No hay datos para el rango solicitado."
        />
      </Panel>
    </div>
  )
}
