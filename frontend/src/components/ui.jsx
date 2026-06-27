import { useEffect, useState } from 'react'

export function Badge({ children, tone = 'neutral' }) {
  return <span className={`badge badge-${tone}`}>{children}</span>
}

export function Field({ label, hint, children, className = '' }) {
  const classes = className ? `field-control ${className}` : 'field-control'

  return (
    <label className={classes}>
      <span className="field-label">{label}</span>
      {children}
      {hint ? <span className="field-hint">{hint}</span> : null}
    </label>
  )
}

export function Panel({ eyebrow, title, subtitle, actions, children, compact = false }) {
  return (
    <section className={`panel ${compact ? 'panel-compact' : ''}`}>
      <header className="panel-header">
        <div>
          {eyebrow ? <p className="panel-eyebrow">{eyebrow}</p> : null}
          <h2>{title}</h2>
          {subtitle ? <p className="panel-subtitle">{subtitle}</p> : null}
        </div>
        {actions ? <div className="panel-actions">{actions}</div> : null}
      </header>
      {children}
    </section>
  )
}

export function MetricCard({ label, value, detail, tone = 'teal' }) {
  return (
    <article className={`metric-card metric-${tone}`}>
      <p className="metric-label">{label}</p>
      <strong className="metric-value">{value}</strong>
      <span className="metric-detail">{detail}</span>
    </article>
  )
}

export function DataTable({
  columns,
  rows,
  emptyMessage,
  initialPageSize = 8,
  pageSizeOptions = [8, 12, 20, 50],
  paginationLabel = 'resultados',
}) {
  const [page, setPage] = useState(1)
  const [pageSize, setPageSize] = useState(initialPageSize)

  const totalRows = rows.length
  const totalPages = Math.max(1, Math.ceil(totalRows / pageSize))
  const startIndex = (page - 1) * pageSize
  const endIndex = Math.min(startIndex + pageSize, totalRows)
  const visibleRows = rows.slice(startIndex, endIndex)

  useEffect(() => {
    setPage(1)
  }, [pageSize])

  useEffect(() => {
    setPage((current) => Math.min(current, totalPages))
  }, [totalPages])

  return (
    <div className="table-block">
      <div className="table-shell">
        <table>
          <thead>
            <tr>
              {columns.map((column) => (
                <th key={column.key}>{column.label}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {rows.length ? (
              visibleRows.map((row, index) => (
                <tr
                  key={
                    row.id ??
                    row.client_id ??
                    row.period ??
                    row.feature ??
                    row.segment ??
                    row.key ??
                    index
                  }
                >
                  {columns.map((column) => (
                    <td key={column.key}>
                      {column.render ? column.render(row) : row[column.key]}
                    </td>
                  ))}
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan={columns.length} className="table-empty">
                  {emptyMessage}
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>

      {rows.length ? (
        <div className="table-footer">
          <p className="table-meta">
            Mostrando {startIndex + 1} a {endIndex} de {totalRows} {paginationLabel}
          </p>

          <div className="pagination-controls">
            <label className="page-size-control">
              <span>Por pagina</span>
              <select
                value={pageSize}
                onChange={(event) => setPageSize(Number(event.target.value))}
              >
                {pageSizeOptions.map((option) => (
                  <option key={option} value={option}>
                    {option}
                  </option>
                ))}
              </select>
            </label>

            <button
              type="button"
              className="ghost-button pagination-button"
              onClick={() => setPage((current) => Math.max(1, current - 1))}
              disabled={page === 1}
            >
              Anterior
            </button>
            <span className="page-indicator">
              Pagina {page} de {totalPages}
            </span>
            <button
              type="button"
              className="ghost-button pagination-button"
              onClick={() => setPage((current) => Math.min(totalPages, current + 1))}
              disabled={page === totalPages}
            >
              Siguiente
            </button>
          </div>
        </div>
      ) : null}
    </div>
  )
}
