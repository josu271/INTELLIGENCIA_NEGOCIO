import { Badge, DataTable, Field, Panel } from '../components/ui'
import {
  getDisplayLabel,
  incidentPriorityLabels,
  incidentPriorityOptions,
  incidentStatusLabels,
  incidentStatusOptions,
  incidentTypeLabels,
  incidentTypeOptions,
} from '../utils/display'
import { toDateTimeInput } from '../utils/format'

export function IncidentsPage({
  incidentForm,
  setIncidentForm,
  submitIncident,
  editingIncidentId,
  resetIncidentForm,
  clients,
  contracts,
  sites,
  incidents,
  setEditingIncidentId,
}) {
  const incidentIsClosed =
    incidentForm.status === 'resuelta' || incidentForm.status === 'cerrada'

  function handleIncidentStatusChange(nextStatus) {
    setIncidentForm((current) => ({
      ...current,
      status: nextStatus,
      resolved_at:
        nextStatus === 'resuelta' || nextStatus === 'cerrada'
          ? current.resolved_at || new Date().toISOString().slice(0, 16)
          : '',
    }))
  }

  return (
    <div className="section-stack">
      <Panel
        eyebrow="Atencion al cliente"
        title="Registrar o actualizar un caso"
        subtitle="Normalmente solo registras la fecha de apertura. La fecha de cierre solo aparece cuando el caso termina."
      >
        <form className="form-grid" onSubmit={submitIncident}>
          <Field label="Cliente">
            <select
              value={incidentForm.client_id}
              onChange={(event) =>
                setIncidentForm((current) => ({
                  ...current,
                  client_id: event.target.value,
                }))
              }
            >
              <option value="">Selecciona el cliente</option>
              {clients.map((client) => (
                <option key={client.id} value={client.id}>
                  {client.full_name}
                </option>
              ))}
            </select>
          </Field>
          <Field label="Servicio">
            <select
              value={incidentForm.contract_id}
              onChange={(event) =>
                setIncidentForm((current) => ({
                  ...current,
                  contract_id: event.target.value,
                }))
              }
            >
              <option value="">Selecciona el servicio</option>
              {contracts.map((contract) => (
                <option key={contract.id} value={contract.id}>
                  Servicio #{contract.id} - {contract.client_name}
                </option>
              ))}
            </select>
          </Field>
          <Field label="Sede">
            <select
              value={incidentForm.site_id}
              onChange={(event) =>
                setIncidentForm((current) => ({
                  ...current,
                  site_id: event.target.value,
                }))
              }
            >
              <option value="">Selecciona la sede</option>
              {sites.map((site) => (
                <option key={site.id} value={site.id}>
                  {site.name}
                </option>
              ))}
            </select>
          </Field>
          <Field label="Fecha de registro">
            <input
              type="datetime-local"
              value={incidentForm.reported_at}
              onChange={(event) =>
                setIncidentForm((current) => ({
                  ...current,
                  reported_at: event.target.value,
                }))
              }
            />
          </Field>
          <Field label="Motivo del caso">
            <select
              value={incidentForm.incident_type}
              onChange={(event) =>
                setIncidentForm((current) => ({
                  ...current,
                  incident_type: event.target.value,
                }))
              }
            >
              {incidentTypeOptions.map((option) => (
                <option key={option.value} value={option.value}>
                  {option.label}
                </option>
              ))}
            </select>
          </Field>
          <Field label="Descripcion">
            <input
              placeholder="Describe brevemente lo ocurrido"
              value={incidentForm.description}
              onChange={(event) =>
                setIncidentForm((current) => ({
                  ...current,
                  description: event.target.value,
                }))
              }
            />
          </Field>
          <Field label="Prioridad">
            <select
              value={incidentForm.priority}
              onChange={(event) =>
                setIncidentForm((current) => ({
                  ...current,
                  priority: event.target.value,
                }))
              }
            >
              {incidentPriorityOptions.map((option) => (
                <option key={option.value} value={option.value}>
                  {option.label}
                </option>
              ))}
            </select>
          </Field>
          <Field label="Estado del caso">
            <select
              value={incidentForm.status}
              onChange={(event) => handleIncidentStatusChange(event.target.value)}
            >
              {incidentStatusOptions.map((option) => (
                <option key={option.value} value={option.value}>
                  {option.label}
                </option>
              ))}
            </select>
          </Field>
          {incidentIsClosed ? (
            <Field
              label="Fecha de cierre"
              hint="Usa esta fecha cuando la atencion ya termino."
            >
              <input
                type="datetime-local"
                value={incidentForm.resolved_at}
                onChange={(event) =>
                  setIncidentForm((current) => ({
                    ...current,
                    resolved_at: event.target.value,
                  }))
                }
              />
            </Field>
          ) : (
            <div className="field-control">
              <span className="field-label">Seguimiento del caso</span>
              <span className="field-hint">
                Mientras el caso siga abierto o en seguimiento, no necesitas fecha de
                cierre.
              </span>
            </div>
          )}
          <div className="form-actions">
            <button type="submit" className="primary-button">
              {editingIncidentId ? 'Guardar cambios' : 'Registrar caso'}
            </button>
            <button type="button" className="ghost-button" onClick={resetIncidentForm}>
              Limpiar formulario
            </button>
          </div>
        </form>
      </Panel>

      <Panel
        eyebrow="Seguimiento"
        title="Casos registrados"
        subtitle="Consulta el avance de cada caso de atencion."
      >
        <DataTable
          columns={[
            { key: 'client_name', label: 'Cliente' },
            { key: 'site_name', label: 'Sede' },
            {
              key: 'incident_type',
              label: 'Motivo',
              render: (row) => getDisplayLabel(incidentTypeLabels, row.incident_type),
            },
            {
              key: 'priority',
              label: 'Prioridad',
              render: (row) => (
                <Badge
                  tone={
                    row.priority === 'critica' || row.priority === 'alta'
                      ? 'danger'
                      : row.priority === 'media'
                        ? 'warning'
                        : 'success'
                  }
                >
                  {getDisplayLabel(incidentPriorityLabels, row.priority)}
                </Badge>
              ),
            },
            {
              key: 'status',
              label: 'Estado',
              render: (row) => (
                <Badge
                  tone={
                    row.status === 'resuelta' || row.status === 'cerrada'
                      ? 'success'
                      : 'warning'
                  }
                >
                  {getDisplayLabel(incidentStatusLabels, row.status)}
                </Badge>
              ),
            },
            { key: 'reported_at', label: 'Fecha de registro' },
            {
              key: 'actions',
              label: 'Opciones',
              render: (row) => (
                <button
                  type="button"
                  className="link-button"
                  onClick={() => {
                    setEditingIncidentId(row.id)
                    setIncidentForm({
                      client_id: String(row.client_id),
                      contract_id: String(row.contract_id),
                      site_id: String(row.site_id),
                      reported_at: toDateTimeInput(row.reported_at),
                      resolved_at: toDateTimeInput(row.resolved_at),
                      incident_type: row.incident_type,
                      description: row.description,
                      priority: row.priority,
                      status: row.status,
                    })
                  }}
                >
                  Editar
                </button>
              ),
            },
          ]}
          rows={incidents}
          emptyMessage="Todavia no hay casos registrados."
        />
      </Panel>
    </div>
  )
}
