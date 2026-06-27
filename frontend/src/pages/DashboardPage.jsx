import {
  Area,
  AreaChart,
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
import { SEGMENT_COLORS } from '../constants'
import { Badge, MetricCard, Panel } from '../components/ui'
import { getDisplayLabel, riskLevelLabels } from '../utils/display'
import { formatCurrency, formatNumber, formatPercent } from '../utils/format'

export function DashboardPage({
  filters,
  setFilters,
  sites,
  dashboard,
  siteKpis,
  segments,
  alerts,
}) {
  return (
    <>
      <Panel
        eyebrow="Vista general"
        title="Resumen del negocio"
        subtitle="Revisa aqui los datos mas importantes del servicio y la atencion al cliente."
        actions={
          <div className="filter-row">
            <select
              value={filters.region}
              onChange={(event) =>
                setFilters((current) => ({
                  ...current,
                  region: event.target.value,
                  site_id: '',
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
            <select
              value={filters.site_id}
              onChange={(event) =>
                setFilters((current) => ({ ...current, site_id: event.target.value }))
              }
            >
              <option value="">Todas las sedes</option>
              {sites
                .filter((site) => !filters.region || site.region === filters.region)
                .map((site) => (
                  <option key={site.id} value={site.id}>
                    {site.name}
                  </option>
                ))}
            </select>
          </div>
        }
      >
        <div className="metrics-grid">
          <MetricCard
            label="Clientes con servicio"
            value={formatNumber(dashboard.summary.active_clients)}
            detail="Clientes con un servicio activo"
          />
          <MetricCard
            label="Cobros del mes"
            value={formatCurrency(dashboard.summary.monthly_revenue)}
            detail="Pagos registrados en el mes actual"
            tone="orange"
          />
          <MetricCard
            label="Baja de clientes"
            value={formatPercent(dashboard.summary.churn_rate)}
            detail="Porcentaje de clientes que dejaron el servicio"
            tone="navy"
          />
          <MetricCard
            label="Atencion satisfactoria"
            value={formatPercent(dashboard.summary.satisfaction_rate)}
            detail="Casos cerrados con una buena calificacion"
            tone="red"
          />
          <MetricCard
            label="Pagos pendientes"
            value={formatPercent(dashboard.summary.delinquency_rate)}
            detail="Porcentaje de pagos aun pendientes"
          />
          <MetricCard
            label="Tiempo de atencion"
            value={`${formatNumber(dashboard.summary.average_resolution_hours)} h`}
            detail="Promedio para cerrar un caso"
            tone="orange"
          />
        </div>
      </Panel>

      <div className="dashboard-grid">
        <Panel
          eyebrow="Movimiento reciente"
          title="Ingresos y nuevas altas"
          subtitle="Comportamiento de los ultimos seis meses."
        >
          <div className="chart-box">
            <ResponsiveContainer width="100%" height={280}>
              <AreaChart data={dashboard.history}>
                <defs>
                  <linearGradient id="income-fill" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="5%" stopColor="#ea580c" stopOpacity={0.35} />
                    <stop offset="95%" stopColor="#ea580c" stopOpacity={0} />
                  </linearGradient>
                </defs>
                <CartesianGrid strokeDasharray="3 3" stroke="#d9d4ca" />
                <XAxis dataKey="period" stroke="#6f6658" />
                <YAxis stroke="#6f6658" />
                <Tooltip formatter={(value) => [formatCurrency(value), 'Cobros']} />
                <Area
                  type="monotone"
                  dataKey="revenue"
                  stroke="#ea580c"
                  fill="url(#income-fill)"
                  strokeWidth={2}
                />
              </AreaChart>
            </ResponsiveContainer>
          </div>
        </Panel>

        <Panel
          eyebrow="Comparacion por sede"
          title="Resultados por sede"
          subtitle="Monto cobrado por cada sede en el periodo actual."
        >
          <div className="chart-box">
            <ResponsiveContainer width="100%" height={280}>
              <BarChart data={siteKpis}>
                <CartesianGrid strokeDasharray="3 3" stroke="#d9d4ca" />
                <XAxis dataKey="name" stroke="#6f6658" />
                <YAxis stroke="#6f6658" />
                <Tooltip formatter={(value) => [formatCurrency(value), 'Cobros del mes']} />
                <Bar dataKey="monthly_revenue" fill="#0f766e" radius={[8, 8, 0, 0]} />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </Panel>
      </div>

      <div className="dashboard-grid">
        <Panel
          eyebrow="Tipos de cliente"
          title="Distribucion de grupos"
          subtitle={`Nivel de diferencia entre grupos: ${segments.silhouette_score}`}
        >
          <div className="chart-box">
            <ResponsiveContainer width="100%" height={280}>
              <PieChart>
                <Pie
                  data={segments.distribution}
                  dataKey="clients"
                  nameKey="segment"
                  innerRadius={62}
                  outerRadius={94}
                  paddingAngle={2}
                >
                  {segments.distribution.map((entry) => (
                    <Cell
                      key={entry.segment}
                      fill={SEGMENT_COLORS[entry.segment] ?? '#6b7280'}
                    />
                  ))}
                </Pie>
                <Tooltip formatter={(value) => [`${formatNumber(value)} clientes`, 'Clientes']} />
              </PieChart>
            </ResponsiveContainer>
          </div>
          <div className="legend-list">
            {segments.distribution.map((entry) => (
              <div key={entry.segment} className="legend-item">
                <span
                  className="legend-dot"
                  style={{ background: SEGMENT_COLORS[entry.segment] ?? '#6b7280' }}
                />
                <div>
                  <strong>{entry.segment}</strong>
                  <span>
                    {entry.clients} clientes - {formatPercent(entry.share)}
                  </span>
                </div>
              </div>
            ))}
          </div>
        </Panel>

        <Panel
          eyebrow="Seguimiento prioritario"
          title="Clientes para contactar"
          subtitle="Casos que conviene revisar primero para evitar bajas."
        >
          <div className="alerts-stack">
            {alerts.length ? (
              alerts.slice(0, 6).map((alert) => (
                <article key={alert.client_id} className="alert-card">
                  <div className="alert-head">
                    <strong>{alert.client_name}</strong>
                    <Badge tone={alert.risk_level === 'alto' ? 'danger' : 'warning'}>
                      {getDisplayLabel(riskLevelLabels, alert.risk_level)}
                    </Badge>
                  </div>
                  <p>{alert.message}</p>
                  <span>{alert.site}</span>
                </article>
              ))
            ) : (
              <p className="empty-note">No hay casos prioritarios en este momento.</p>
            )}
          </div>
        </Panel>
      </div>
    </>
  )
}
