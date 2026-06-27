import { Badge, DataTable, Field, Panel } from '../components/ui'
import {
  getDisplayLabel,
  paymentMethodOptions,
  paymentStatusLabels,
  paymentStatusOptions,
} from '../utils/display'
import { formatCurrency, toDateInput } from '../utils/format'

export function PaymentsPage({
  paymentForm,
  setPaymentForm,
  submitPayment,
  editingPaymentId,
  resetPaymentForm,
  contracts,
  payments,
  setEditingPaymentId,
}) {
  const paymentUsesPaidDate = paymentForm.status === 'pagado'
  const visiblePaymentDate = paymentUsesPaidDate
    ? paymentForm.paid_date || paymentForm.issued_date
    : paymentForm.issued_date

  function handlePaymentDateChange(value) {
    if (paymentUsesPaidDate) {
      setPaymentForm((current) => ({
        ...current,
        issued_date: editingPaymentId ? current.issued_date || value : value,
        paid_date: value,
      }))
      return
    }

    setPaymentForm((current) => ({
      ...current,
      issued_date: value,
      paid_date: '',
    }))
  }

  function handlePaymentStatusChange(nextStatus) {
    setPaymentForm((current) => {
      if (nextStatus === 'pagado') {
        const resolvedDate = current.paid_date || current.issued_date
        return {
          ...current,
          status: nextStatus,
          issued_date: editingPaymentId ? current.issued_date || resolvedDate : resolvedDate,
          paid_date: resolvedDate,
        }
      }

      return {
        ...current,
        status: nextStatus,
        issued_date: current.issued_date || current.paid_date,
        paid_date: '',
      }
    })
  }

  return (
    <div className="section-stack">
      <Panel
        eyebrow="Pagos"
        title="Registrar o actualizar un pago"
        subtitle="En la operacion diaria solo necesitas una fecha: la del cobro o la del pago, segun el estado."
      >
        <form className="form-grid" onSubmit={submitPayment}>
          <Field label="Servicio">
            <select
              value={paymentForm.contract_id}
              onChange={(event) =>
                setPaymentForm((current) => ({
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
          <Field
            label={paymentUsesPaidDate ? 'Fecha del pago' : 'Fecha de cobro'}
            hint={
              paymentUsesPaidDate
                ? 'Dia en que el cliente realizo el pago.'
                : 'Dia en que corresponde cobrar o registrar el cargo.'
            }
          >
            <input
              type="date"
              value={visiblePaymentDate}
              onChange={(event) => handlePaymentDateChange(event.target.value)}
            />
          </Field>
          <Field label="Monto pagado">
            <input
              type="number"
              min="0"
              step="0.01"
              placeholder="Monto pagado"
              value={paymentForm.amount}
              onChange={(event) =>
                setPaymentForm((current) => ({ ...current, amount: event.target.value }))
              }
            />
          </Field>
          <Field label="Medio de pago">
            <select
              value={paymentForm.payment_method}
              onChange={(event) =>
                setPaymentForm((current) => ({
                  ...current,
                  payment_method: event.target.value,
                }))
              }
            >
              {paymentMethodOptions.map((option) => (
                <option key={option.value} value={option.value}>
                  {option.label}
                </option>
              ))}
            </select>
          </Field>
          <Field label="Numero de operacion" hint="Opcional si el pago fue en efectivo.">
            <input
              placeholder="Numero de operacion o referencia"
              value={paymentForm.reference}
              onChange={(event) =>
                setPaymentForm((current) => ({
                  ...current,
                  reference: event.target.value,
                }))
              }
            />
          </Field>
          <Field label="Estado del pago">
            <select
              value={paymentForm.status}
              onChange={(event) => handlePaymentStatusChange(event.target.value)}
            >
              {paymentStatusOptions.map((option) => (
                <option key={option.value} value={option.value}>
                  {option.label}
                </option>
              ))}
            </select>
          </Field>
          <div className="form-actions">
            <button type="submit" className="primary-button">
              {editingPaymentId ? 'Guardar cambios' : 'Registrar pago'}
            </button>
            <button type="button" className="ghost-button" onClick={resetPaymentForm}>
              Limpiar formulario
            </button>
          </div>
        </form>
      </Panel>

      <Panel
        eyebrow="Historial de pagos"
        title="Pagos registrados"
        subtitle="Revisa el estado de cobro de cada servicio."
      >
        <DataTable
          columns={[
            { key: 'client_name', label: 'Cliente' },
            { key: 'site_name', label: 'Sede' },
            {
              key: 'amount',
              label: 'Monto',
              render: (row) => formatCurrency(row.amount),
            },
            {
              key: 'payment_date',
              label: 'Fecha',
              render: (row) => (row.status === 'pagado' ? row.paid_date || row.issued_date : row.issued_date),
            },
            {
              key: 'status',
              label: 'Estado',
              render: (row) => (
                <Badge
                  tone={
                    row.status === 'pagado'
                      ? 'success'
                      : row.status === 'anulado'
                        ? 'danger'
                        : 'warning'
                  }
                >
                  {getDisplayLabel(paymentStatusLabels, row.status)}
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
                    setEditingPaymentId(row.id)
                    setPaymentForm({
                      contract_id: String(row.contract_id),
                      issued_date: toDateInput(row.issued_date),
                      paid_date: toDateInput(row.paid_date),
                      amount: String(row.amount),
                      payment_method: row.payment_method ?? 'transferencia',
                      reference: row.reference ?? '',
                      status: row.status,
                    })
                  }}
                >
                  Editar
                </button>
              ),
            },
          ]}
          rows={payments}
          emptyMessage="Todavia no hay pagos registrados."
        />
      </Panel>
    </div>
  )
}
