import { Badge, DataTable, Field, Panel } from '../components/ui'
import {
  contractStatusLabels,
  contractStatusOptions,
  getDisplayLabel,
} from '../utils/display'
import { formatCurrency, toDateInput } from '../utils/format'

export function ContractsPage({
  contractForm,
  setContractForm,
  submitContract,
  editingContractId,
  resetContractForm,
  clients,
  sites,
  plans,
  contracts,
  setEditingContractId,
}) {
  return (
    <div className="section-stack">
      <Panel
        eyebrow="Servicios"
        title="Registrar o actualizar un servicio"
        subtitle="El servicio sigue mes a mes mientras permanezca activo. La fecha de fin solo se usa cuando se cierra."
      >
        <form className="form-grid" onSubmit={submitContract}>
          <Field label="Cliente">
            <select
              value={contractForm.client_id}
              onChange={(event) =>
                setContractForm((current) => ({
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
          <Field label="Sede">
            <select
              value={contractForm.site_id}
              onChange={(event) =>
                setContractForm((current) => ({
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
          <Field label="Plan">
            <select
              value={contractForm.plan_id}
              onChange={(event) =>
                setContractForm((current) => ({
                  ...current,
                  plan_id: event.target.value,
                }))
              }
            >
              <option value="">Selecciona el plan</option>
              {plans.map((plan) => (
                <option key={plan.id} value={plan.id}>
                  {plan.name} - {formatCurrency(plan.monthly_price)}
                </option>
              ))}
            </select>
          </Field>
          <Field label="Inicio del servicio">
            <input
              type="date"
              value={contractForm.start_date}
              onChange={(event) =>
                setContractForm((current) => ({
                  ...current,
                  start_date: event.target.value,
                }))
              }
            />
          </Field>
          <Field label="Observaciones">
            <input
              placeholder="Observaciones (opcional)"
              value={contractForm.note}
              onChange={(event) =>
                setContractForm((current) => ({
                  ...current,
                  note: event.target.value,
                }))
              }
            />
          </Field>
          <Field
            label="Estado del servicio"
            hint={
              contractForm.status === 'cancelado' || contractForm.status === 'inactivo'
                ? 'Como el servicio ya no sigue vigente, indica tambien la fecha de fin.'
                : 'Mientras este activo o suspendido, no necesitas fecha de fin.'
            }
          >
            <select
              value={contractForm.status}
              onChange={(event) =>
                setContractForm((current) => ({ ...current, status: event.target.value }))
              }
            >
              {contractStatusOptions.map((option) => (
                <option key={option.value} value={option.value}>
                  {option.label}
                </option>
              ))}
            </select>
          </Field>
          {contractForm.status === 'cancelado' || contractForm.status === 'inactivo' ? (
            <Field
              label="Fecha de fin del servicio"
              hint="Usa esta fecha cuando el servicio termina definitivamente."
            >
              <input
                type="date"
                value={contractForm.end_date}
                onChange={(event) =>
                  setContractForm((current) => ({
                    ...current,
                    end_date: event.target.value,
                  }))
                }
              />
            </Field>
          ) : (
            <div className="field-control">
              <span className="field-label">Vigencia del servicio</span>
              <span className="field-hint">
                Este servicio sigue renovandose mes a mes hasta que su estado cambie a
                inactivo o cancelado.
              </span>
            </div>
          )}
          <div className="form-actions">
            <button type="submit" className="primary-button">
              {editingContractId ? 'Guardar cambios' : 'Registrar servicio'}
            </button>
            <button type="button" className="ghost-button" onClick={resetContractForm}>
              Limpiar formulario
            </button>
          </div>
        </form>
      </Panel>

      <Panel
        eyebrow="Servicios registrados"
        title="Lista de servicios"
        subtitle="Consulta la sede, el plan y el estado de cada servicio."
      >
        <DataTable
          columns={[
            { key: 'client_name', label: 'Cliente' },
            { key: 'site_name', label: 'Sede' },
            { key: 'plan_name', label: 'Plan' },
            {
              key: 'monthly_price',
              label: 'Pago mensual',
              render: (row) => formatCurrency(row.monthly_price),
            },
            { key: 'speed_mbps', label: 'Velocidad (Mbps)' },
            {
              key: 'status',
              label: 'Estado',
              render: (row) => (
                <Badge
                  tone={
                    row.status === 'activo'
                      ? 'success'
                      : row.status === 'suspendido'
                        ? 'warning'
                        : 'danger'
                  }
                >
                  {getDisplayLabel(contractStatusLabels, row.status)}
                </Badge>
              ),
            },
            {
              key: 'actions',
              label: 'Opciones',
              render: (row) => (
                <button
                  type="button"
                  className="link-button"
                  onClick={() => {
                    setEditingContractId(row.id)
                    setContractForm({
                      client_id: String(row.client_id),
                      site_id: String(row.site_id),
                      plan_id: String(row.plan_id),
                      start_date: toDateInput(row.start_date),
                      end_date: toDateInput(row.end_date),
                      status: row.status,
                      note: row.note ?? '',
                    })
                  }}
                >
                  Editar
                </button>
              ),
            },
          ]}
          rows={contracts}
          emptyMessage="Todavia no hay servicios registrados."
        />
      </Panel>
    </div>
  )
}
