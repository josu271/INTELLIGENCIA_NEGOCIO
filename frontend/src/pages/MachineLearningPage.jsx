import { Badge, DataTable, MetricCard, Panel } from '../components/ui'
import { getDisplayLabel, riskLevelLabels } from '../utils/display'
import { formatCurrency, formatNumber, formatPercent } from '../utils/format'

const modelStack = [
  {
    title: 'Riesgo de baja',
    tool: 'Random Forest',
    description:
      'Se usa para estimar la probabilidad de que un cliente deje el servicio.',
  },
  {
    title: 'Tipos de cliente',
    tool: 'K-Means',
    description:
      'Se usa para agrupar clientes con comportamientos parecidos y apoyar campanas diferenciadas.',
  },
  {
    title: 'Herramientas',
    tool: 'scikit-learn y pandas',
    description:
      'Actualmente no se usa TensorFlow; el analisis trabaja con herramientas mas ligeras y explicables.',
  },
]

const featureLabels = {
  tenure_months: {
    label: 'Tiempo con el servicio',
    description: 'Cuanto tiempo lleva el cliente con la empresa.',
  },
  max_price: {
    label: 'Monto del plan',
    description: 'Valor del plan o servicio de mayor importe que tiene el cliente.',
  },
  max_speed: {
    label: 'Velocidad contratada',
    description: 'Velocidad mas alta del servicio contratado.',
  },
  pending_payments: {
    label: 'Pagos pendientes',
    description: 'Cantidad de pagos que aun no han sido regularizados.',
  },
  days_since_last_payment: {
    label: 'Tiempo desde el ultimo pago',
    description: 'Cuantos dias han pasado desde el ultimo pago registrado.',
  },
  total_contracts: {
    label: 'Cantidad de servicios',
    description: 'Numero total de servicios o contratos asociados al cliente.',
  },
  plan_level: {
    label: 'Nivel del plan',
    description: 'Ubica si el plan es basico, intermedio o de mayor valor.',
  },
  site_code: {
    label: 'Sede de atencion',
    description: 'Sede desde la cual se administra el servicio del cliente.',
  },
  open_incidents: {
    label: 'Casos abiertos',
    description: 'Cantidad de casos que siguen pendientes de cierre.',
  },
  recent_incidents: {
    label: 'Casos recientes',
    description: 'Problemas reportados por el cliente en fechas recientes.',
  },
}

function getFeatureInfo(feature) {
  return (
    featureLabels[feature] ?? {
      label: feature.replaceAll('_', ' '),
      description: 'Dato considerado por el sistema para revisar el comportamiento del cliente.',
    }
  )
}

export function MachineLearningPage({
  churn,
  segments,
  selectedPrediction,
  onSelectPrediction,
}) {
  const highlightedPrediction = selectedPrediction ?? churn.predictions?.[0] ?? null
  const showingSuggestedCase = !selectedPrediction && highlightedPrediction
  const featureRows = (churn.metrics.feature_importance ?? []).map((row) => {
    const info = getFeatureInfo(row.feature)
    return {
      ...row,
      label: info.label,
      description: info.description,
    }
  })

  return (
    <div className="section-stack">
      <Panel
        eyebrow="Analisis de clientes"
        title="Grupos de clientes y riesgo de baja"
        subtitle="Esta vista ayuda a identificar a quienes conviene dar seguimiento."
      >
        <div className="metrics-grid">
          <MetricCard
            label="Clientes analizados"
            value={formatNumber(churn.metrics.records)}
            detail="Clientes incluidos en la evaluacion"
          />
          <MetricCard
            label="Clientes con evaluacion"
            value={formatNumber(churn.metrics.eligible_clients)}
            detail="Clientes activos con resultado disponible"
            tone="teal"
          />
          <MetricCard
            label="Historial de bajas"
            value={formatNumber(churn.metrics.churn_cases)}
            detail="Casos usados como referencia"
            tone="red"
          />
          <MetricCard
            label="Tipos de cliente"
            value={formatNumber(segments.distribution.length)}
            detail="Tipos de cliente encontrados"
            tone="orange"
          />
          <MetricCard
            label="Claridad de grupos"
            value={formatNumber(segments.silhouette_score)}
            detail="Que tan claros son los grupos"
            tone="navy"
          />
        </div>
      </Panel>

      <Panel
        eyebrow="Motor del analisis"
        title="Que modelo usa el sistema"
        subtitle="Aqui puedes ver de forma clara que motor analitico esta trabajando por detras."
      >
        <div className="marketing-grid">
          {modelStack.map((item) => (
            <article key={item.title} className="marketing-card">
              <div className="marketing-head">
                <h3>{item.title}</h3>
                <Badge tone="navy">{item.tool}</Badge>
              </div>
              <p className="marketing-why">{item.description}</p>
            </article>
          ))}
        </div>
      </Panel>

      <Panel
        eyebrow="Seguimiento"
        title="Clientes con mayor riesgo"
        subtitle="Esta lista tiene prioridad para llamadas, visitas tecnicas o acciones de retencion."
      >
        <DataTable
          columns={[
            { key: 'client_name', label: 'Cliente' },
            { key: 'site', label: 'Sede' },
            {
              key: 'probability_churn_percentage',
              label: 'Riesgo de baja',
              render: (row) => formatPercent(row.probability_churn_percentage),
            },
            {
              key: 'risk_level',
              label: 'Nivel',
              render: (row) => (
                <Badge
                  tone={
                    row.risk_level === 'alto'
                      ? 'danger'
                      : row.risk_level === 'medio'
                        ? 'warning'
                        : 'success'
                  }
                >
                  {getDisplayLabel(riskLevelLabels, row.risk_level)}
                </Badge>
              ),
            },
            {
              key: 'actions',
              label: 'Sugerencias',
              render: (row) => row.actions_suggested.join(', '),
            },
            {
              key: 'detail',
              label: 'Detalle',
              render: (row) => (
                <button
                  type="button"
                  className="link-button"
                  onClick={() => onSelectPrediction?.(row)}
                >
                  Ver caso
                </button>
              ),
            },
          ]}
          rows={churn.predictions}
          emptyMessage="No hay evaluaciones disponibles."
          initialPageSize={6}
          paginationLabel="evaluaciones"
        />
      </Panel>

      <Panel
        eyebrow="Caso puntual"
        title={showingSuggestedCase ? 'Caso destacado del momento' : 'Caso seleccionado'}
        subtitle={
          showingSuggestedCase
            ? 'Se muestra automaticamente el cliente con mayor prioridad actual.'
            : 'Detalle rapido para revisar un cliente en particular.'
        }
      >
        {highlightedPrediction ? (
          <div className="prediction-card">
            <div className="prediction-head">
              <h3>{highlightedPrediction.client_name}</h3>
              <Badge
                tone={
                  highlightedPrediction.risk_level === 'alto'
                    ? 'danger'
                    : highlightedPrediction.risk_level === 'medio'
                      ? 'warning'
                      : 'success'
                }
              >
                {getDisplayLabel(riskLevelLabels, highlightedPrediction.risk_level)}
              </Badge>
            </div>
            <strong className="prediction-score">
              {formatPercent(highlightedPrediction.probability_churn_percentage)}
            </strong>
            <p>{highlightedPrediction.site}</p>
            <ul className="prediction-actions">
              {highlightedPrediction.actions_suggested.map((action) => (
                <li key={action}>{action}</li>
              ))}
            </ul>
          </div>
        ) : (
          <p className="empty-note">
            Cuando existan clientes evaluados, aqui veras el caso mas importante o el que
            elijas desde la tabla.
          </p>
        )}
      </Panel>

      <Panel
        eyebrow="Senales de alerta"
        title="Que datos mira el sistema"
        subtitle="Aqui se resume la informacion que mas ayuda a detectar posibles bajas de clientes."
      >
        <DataTable
          columns={[
            { key: 'label', label: 'Dato revisado' },
            { key: 'description', label: 'Que nos dice' },
            {
              key: 'importance',
              label: 'Influencia',
              render: (row) => formatPercent(row.importance * 100),
            },
          ]}
          rows={featureRows}
          emptyMessage="No hay factores disponibles."
          initialPageSize={5}
          paginationLabel="factores"
        />
      </Panel>

      <Panel
        eyebrow="Grupos detectados"
        title="Clientes por grupo"
        subtitle="Apoyo para organizar campanas y seguimiento"
      >
        <DataTable
          columns={[
            { key: 'client_name', label: 'Cliente' },
            { key: 'site', label: 'Sede' },
            {
              key: 'segment',
              label: 'Grupo',
              render: (row) => (
                <Badge
                  tone={
                    row.segment === 'En Riesgo'
                      ? 'danger'
                      : row.segment === 'Empresarial / Corporativo'
                        ? 'navy'
                        : row.segment === 'Residencial Alto Consumo'
                          ? 'warning'
                          : 'success'
                  }
                >
                  {row.segment}
                </Badge>
              ),
            },
            {
              key: 'max_price',
              label: 'Monto maximo',
              render: (row) => formatCurrency(row.max_price),
            },
            { key: 'max_speed', label: 'Velocidad (Mbps)' },
            { key: 'pending_payments', label: 'Pendientes' },
          ]}
          rows={segments.clients}
          emptyMessage="Todavia no hay clientes agrupados."
          initialPageSize={8}
          paginationLabel="clientes"
        />
      </Panel>
    </div>
  )
}
