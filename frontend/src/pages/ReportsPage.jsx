import { useState } from 'react'
import {
  Bar,
  BarChart,
  CartesianGrid,
  Cell,
  Pie,
  PieChart,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'
import { Badge, DataTable, Field, MetricCard, Panel } from '../components/ui'
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

function getPriorityTone(priority) {
  if (priority === 'Alta') {
    return 'danger'
  }
  if (priority === 'Media') {
    return 'warning'
  }
  return 'success'
}

const STATUS_COLORS = ['#0f766e', '#ea580c', '#0f172a']

export function ReportsPage({
  reportFilters,
  setReportFilters,
  sites,
  exportReport,
  report,
}) {
  const reportMonth = reportFilters.start_date ? reportFilters.start_date.slice(0, 7) : ''
  const marketingActions = report.marketing_actions ?? []
  const [selectedCampaignTitle, setSelectedCampaignTitle] = useState('')
  const selectedCampaign =
    marketingActions.find((action) => action.title === selectedCampaignTitle) ??
    marketingActions[0] ??
    null
  const activeCampaignTitle = selectedCampaign?.title ?? ''
  const campaignChartData = marketingActions.map((action) => ({
    name: action.chart_label ?? action.title,
    clients: action.estimated_clients,
  }))
  const campaignBalanceData = [
    { name: 'Nuevos clientes', value: report.totals.new_clients ?? 0 },
    { name: 'Bajas', value: report.totals.churn_events ?? 0 },
    { name: 'Casos', value: report.totals.incidents ?? 0 },
  ].filter((item) => item.value > 0)

  return (
    <div className="section-stack">
      <Panel
        eyebrow="Reportes"
        title="Resultados por sede y mes"
        subtitle="Selecciona una sede y revisa el comportamiento del negocio en el mes elegido."
        actions={
          <div className="filter-row">
            <Field label="Sede">
              <select
                value={reportFilters.site_id}
                onChange={(event) =>
                  setReportFilters((current) => ({
                    ...current,
                    site_id: event.target.value,
                  }))
                }
              >
                <option value="">Todas las sedes</option>
                {sites.map((site) => (
                  <option key={site.id} value={site.id}>
                    {site.name}
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
        eyebrow="Inteligencia comercial"
        title="Que acciones considerar para una campana de marketing"
        subtitle="Explora oportunidades por sede con apoyo visual y elige la campana mas conveniente para el periodo."
      >
        {marketingActions.length ? (
          <>
            <div className="report-marketing-layout">
              <div className="report-marketing-charts">
                <div className="chart-box marketing-chart">
                  <ResponsiveContainer width="100%" height={260}>
                    <BarChart data={campaignChartData}>
                      <CartesianGrid strokeDasharray="3 3" stroke="#d9d4ca" />
                      <XAxis dataKey="name" stroke="#6f6658" />
                      <YAxis stroke="#6f6658" />
                      <Tooltip formatter={(value) => [formatNumber(value), 'Clientes estimados']} />
                      <Bar dataKey="clients" fill="#0f766e" radius={[8, 8, 0, 0]} />
                    </BarChart>
                  </ResponsiveContainer>
                </div>

                <div className="chart-box marketing-chart">
                  <ResponsiveContainer width="100%" height={260}>
                    <PieChart>
                      <Pie
                        data={campaignBalanceData}
                        dataKey="value"
                        nameKey="name"
                        innerRadius={58}
                        outerRadius={92}
                        paddingAngle={3}
                      >
                        {campaignBalanceData.map((entry, index) => (
                          <Cell
                            key={entry.name}
                            fill={STATUS_COLORS[index % STATUS_COLORS.length]}
                          />
                        ))}
                      </Pie>
                      <Tooltip formatter={(value) => [formatNumber(value), 'Casos del periodo']} />
                    </PieChart>
                  </ResponsiveContainer>
                </div>
              </div>

              <div className="campaign-selector">
                {marketingActions.map((action) => {
                  const isActive = action.title === activeCampaignTitle

                  return (
                    <button
                      key={action.title}
                      type="button"
                      className={`campaign-card ${isActive ? 'campaign-card-active' : ''}`}
                      onClick={() => setSelectedCampaignTitle(action.title)}
                    >
                      <div className="campaign-card-head">
                        <strong>{action.title}</strong>
                        <Badge tone={getPriorityTone(action.priority)}>{action.priority}</Badge>
                      </div>
                      <span>{action.target}</span>
                      <small>
                        Clientes estimados: {formatNumber(action.estimated_clients)}
                      </small>
                    </button>
                  )
                })}
              </div>
            </div>

            {selectedCampaign ? (
              <div className="campaign-detail">
                <div className="campaign-detail-head">
                  <div>
                    <p className="panel-eyebrow">Campana seleccionada</p>
                    <h3>{selectedCampaign.title}</h3>
                  </div>
                  <Badge tone={getPriorityTone(selectedCampaign.priority)}>
                    {selectedCampaign.priority}
                  </Badge>
                </div>

                <div className="campaign-kpis">
                  <div className="campaign-kpi">
                    <span>Sede analizada</span>
                    <strong>{report.site_name ?? 'Todas las sedes'}</strong>
                  </div>
                  <div className="campaign-kpi">
                    <span>Base estimada</span>
                    <strong>{formatNumber(selectedCampaign.estimated_clients)} clientes</strong>
                  </div>
                  <div className="campaign-kpi">
                    <span>Enfoque</span>
                    <strong>{selectedCampaign.chart_label ?? 'Comercial'}</strong>
                  </div>
                </div>

                <p className="marketing-target">
                  <strong>Dirigido a:</strong> {selectedCampaign.target}
                </p>
                <p className="marketing-why">{selectedCampaign.why}</p>

                <ul className="marketing-list">
                  {selectedCampaign.recommended_actions.map((step) => (
                    <li key={step}>{step}</li>
                  ))}
                </ul>
              </div>
            ) : null}
          </>
        ) : (
          <p className="empty-note">
            Todavia no hay recomendaciones comerciales para este periodo.
          </p>
        )}
      </Panel>

      <Panel
        eyebrow="Resumen mensual"
        title="Ingresos del periodo"
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
