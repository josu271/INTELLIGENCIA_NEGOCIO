import { Badge, DataTable, Panel } from '../components/ui'
import {
  customerStatusLabels,
  customerStatusOptions,
  customerTypeOptions,
  getDisplayLabel,
} from '../utils/display'

export function ClientsPage({
  clientForm,
  setClientForm,
  submitClient,
  editingClientId,
  resetClientForm,
  clientSearch,
  setClientSearch,
  filteredClients,
  sites,
  setEditingClientId,
  runPrediction,
}) {
  return (
    <div className="section-stack">
      <Panel
        eyebrow="Datos de clientes"
        title="Registrar o actualizar clientes"
        subtitle="Completa la informacion principal para ubicar y atender mejor a cada cliente."
      >
        <form className="form-grid" onSubmit={submitClient}>
          <input
            placeholder="Numero de DNI"
            value={clientForm.dni}
            onChange={(event) =>
              setClientForm((current) => ({ ...current, dni: event.target.value }))
            }
          />
          <input
            placeholder="Nombres"
            value={clientForm.first_name}
            onChange={(event) =>
              setClientForm((current) => ({ ...current, first_name: event.target.value }))
            }
          />
          <input
            placeholder="Apellidos"
            value={clientForm.last_name}
            onChange={(event) =>
              setClientForm((current) => ({ ...current, last_name: event.target.value }))
            }
          />
          <select
            value={clientForm.site_id}
            onChange={(event) =>
              setClientForm((current) => ({ ...current, site_id: event.target.value }))
            }
          >
            <option value="">Selecciona la sede</option>
            {sites.map((site) => (
              <option key={site.id} value={site.id}>
                {site.name}
              </option>
            ))}
          </select>
          <input
            placeholder="Correo electronico (opcional)"
            value={clientForm.email}
            onChange={(event) =>
              setClientForm((current) => ({ ...current, email: event.target.value }))
            }
          />
          <input
            placeholder="Telefono o celular"
            value={clientForm.phone}
            onChange={(event) =>
              setClientForm((current) => ({ ...current, phone: event.target.value }))
            }
          />
          <input
            placeholder="Direccion"
            value={clientForm.address}
            onChange={(event) =>
              setClientForm((current) => ({ ...current, address: event.target.value }))
            }
          />
          <input
            type="date"
            value={clientForm.registered_at}
            onChange={(event) =>
              setClientForm((current) => ({
                ...current,
                registered_at: event.target.value,
              }))
            }
          />
          <select
            value={clientForm.customer_type}
            onChange={(event) =>
              setClientForm((current) => ({
                ...current,
                customer_type: event.target.value,
              }))
            }
          >
            {customerTypeOptions.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </select>
          <select
            value={clientForm.status}
            onChange={(event) =>
              setClientForm((current) => ({ ...current, status: event.target.value }))
            }
          >
            {customerStatusOptions.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </select>
          <div className="form-actions">
            <button type="submit" className="primary-button">
              {editingClientId ? 'Guardar cambios' : 'Registrar cliente'}
            </button>
            <button type="button" className="ghost-button" onClick={resetClientForm}>
              Limpiar formulario
            </button>
          </div>
        </form>
      </Panel>

      <Panel
        eyebrow="Lista de clientes"
        title="Clientes registrados"
        subtitle="Aqui puedes buscar y revisar la informacion principal de cada cliente."
        actions={
          <input
            className="search-input"
            value={clientSearch}
            onChange={(event) => setClientSearch(event.target.value)}
            placeholder="Buscar por nombre, DNI o correo"
          />
        }
      >
        <DataTable
          columns={[
            { key: 'full_name', label: 'Cliente' },
            { key: 'dni', label: 'Documento' },
            { key: 'email', label: 'Correo' },
            { key: 'site_name', label: 'Sede' },
            { key: 'plan_name', label: 'Plan actual' },
            {
              key: 'status',
              label: 'Estado',
              render: (row) => (
                <Badge tone={row.status === 'activo' ? 'success' : 'danger'}>
                  {getDisplayLabel(customerStatusLabels, row.status)}
                </Badge>
              ),
            },
            {
              key: 'actions',
              label: 'Opciones',
              render: (row) => (
                <div className="row-actions">
                  <button
                    type="button"
                    className="link-button"
                    onClick={() => {
                      setEditingClientId(row.id)
                      setClientForm({
                        site_id: row.site_id ? String(row.site_id) : '',
                        dni: row.dni,
                        first_name: row.first_name,
                        last_name: row.last_name,
                        email: row.email ?? '',
                        phone: row.phone ?? '',
                        address: row.address ?? '',
                        customer_type: row.customer_type,
                        status: row.status,
                        registered_at: row.registered_at,
                      })
                    }}
                  >
                    Editar
                  </button>
                  {row.status === 'activo' && row.active_contracts > 0 ? (
                    <button
                      type="button"
                      className="link-button danger-link"
                      onClick={() => runPrediction(row.id)}
                    >
                      Revisar riesgo de baja
                    </button>
                  ) : (
                    <span className="inline-note">Sin servicio activo</span>
                  )}
                </div>
              ),
            },
          ]}
          rows={filteredClients}
          emptyMessage="No se encontraron clientes con esos datos."
        />
      </Panel>
    </div>
  )
}
