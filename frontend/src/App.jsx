import {
  startTransition,
  useDeferredValue,
  useEffect,
  useEffectEvent,
  useState,
} from 'react'
import './App.css'
import { cablebiApi } from './api/cablebi'
import { Badge } from './components/ui'
import { ZoeChatWidget } from './components/ZoeChatWidget'
import {
  DEFAULT_VIEW,
  initialClientForm,
  initialContractForm,
  initialIncidentForm,
  initialPaymentForm,
  NAV_ITEMS,
} from './constants'
import { ClientsPage } from './pages/ClientsPage'
import { ContractsPage } from './pages/ContractsPage'
import { DashboardPage } from './pages/DashboardPage'
import { IncidentsPage } from './pages/IncidentsPage'
import { LoginPage } from './pages/LoginPage'
import { MachineLearningPage } from './pages/MachineLearningPage'
import { PaymentsPage } from './pages/PaymentsPage'
import { ReportsPage } from './pages/ReportsPage'
import { getDisplayLabel, roleLabels } from './utils/display'

function getViewFromHash(hash) {
  const cleanHash = hash.replace(/^#\/?/, '')
  return NAV_ITEMS.some((item) => item.id === cleanHash) ? cleanHash : DEFAULT_VIEW
}

function writeHash(view) {
  window.location.hash = `/${view}`
}

function createViewLoadState() {
  return {
    dashboard: false,
    clientes: false,
    contratos: false,
    pagos: false,
    incidencias: false,
    reportes: false,
    ml: false,
  }
}

function App() {
  const [token, setToken] = useState(() => localStorage.getItem('cablebi-token') ?? '')
  const [user, setUser] = useState(() => {
    const raw = localStorage.getItem('cablebi-user')
    return raw ? JSON.parse(raw) : null
  })
  const [systemInfo, setSystemInfo] = useState(null)
  const [view, setView] = useState(() => getViewFromHash(window.location.hash))
  const [notice, setNotice] = useState('')
  const [error, setError] = useState('')
  const [busy, setBusy] = useState(false)
  const [loadedViews, setLoadedViews] = useState(createViewLoadState)

  const [loginForm, setLoginForm] = useState({ username: 'admin', password: 'admin123' })
  const [filters, setFilters] = useState({ region: '', site_id: '' })
  const [reportFilters, setReportFilters] = useState({
    site_id: '',
    start_date: '',
    end_date: '',
  })

  const [clients, setClients] = useState([])
  const [contracts, setContracts] = useState([])
  const [payments, setPayments] = useState([])
  const [incidents, setIncidents] = useState([])
  const [sites, setSites] = useState([])
  const [plans, setPlans] = useState([])
  const [dashboard, setDashboard] = useState({ summary: {}, history: [] })
  const [siteKpis, setSiteKpis] = useState([])
  const [alerts, setAlerts] = useState([])
  const [segments, setSegments] = useState({
    distribution: [],
    clients: [],
    silhouette_score: 0,
  })
  const [churn, setChurn] = useState({ metrics: {}, predictions: [] })
  const [report, setReport] = useState({ series: [], totals: {} })
  const [selectedPrediction, setSelectedPrediction] = useState(null)

  const [clientForm, setClientForm] = useState(initialClientForm)
  const [contractForm, setContractForm] = useState(initialContractForm)
  const [paymentForm, setPaymentForm] = useState(initialPaymentForm)
  const [incidentForm, setIncidentForm] = useState(initialIncidentForm)

  const [editingClientId, setEditingClientId] = useState(null)
  const [editingContractId, setEditingContractId] = useState(null)
  const [editingPaymentId, setEditingPaymentId] = useState(null)
  const [editingIncidentId, setEditingIncidentId] = useState(null)
  const [clientSearch, setClientSearch] = useState('')
  const deferredClientSearch = useDeferredValue(clientSearch)

  const filteredClients = clients.filter((client) => {
    const haystack = `${client.full_name} ${client.dni} ${client.email ?? ''}`.toLowerCase()
    return haystack.includes(deferredClientSearch.toLowerCase())
  })

  const navigateToView = useEffectEvent((nextView) => {
    writeHash(nextView)
    setView(nextView)
  })

  const markViewLoaded = useEffectEvent((viewId) => {
    setLoadedViews((current) => ({ ...current, [viewId]: true }))
  })

  const loadBaseData = useEffectEvent(async (activeToken) => {
    const [root, sitesData, plansData] = await Promise.all([
      cablebiApi.getSystemInfo(),
      cablebiApi.listSites(activeToken),
      cablebiApi.listPlans(activeToken),
    ])
    setSystemInfo(root)
    setSites(sitesData)
    setPlans(plansData)
  })

  const loadClientsData = useEffectEvent(async (activeToken) => {
    const clientsData = await cablebiApi.listClients(activeToken)
    setClients(clientsData)
  })

  const loadContractsData = useEffectEvent(async (activeToken) => {
    const contractsData = await cablebiApi.listContracts(activeToken)
    setContracts(contractsData)
  })

  const loadPaymentsData = useEffectEvent(async (activeToken) => {
    const paymentsData = await cablebiApi.listPayments(activeToken)
    setPayments(paymentsData)
  })

  const loadIncidentsData = useEffectEvent(async (activeToken) => {
    const incidentsData = await cablebiApi.listIncidents(activeToken)
    setIncidents(incidentsData)
  })

  const loadSegmentsData = useEffectEvent(async (activeToken) => {
    const segmentsData = await cablebiApi.getSegments(activeToken)
    setSegments(segmentsData)
  })

  const loadChurnData = useEffectEvent(async (activeToken) => {
    const churnData = await cablebiApi.getChurnPredictions(activeToken)
    setChurn(churnData)
  })

  const loadAlertsData = useEffectEvent(async (activeToken) => {
    const alertsData = await cablebiApi.getRetentionAlerts(activeToken)
    setAlerts(alertsData)
  })

  const loadDashboardMetrics = useEffectEvent(async (activeToken) => {
    const [summaryData, siteData] = await Promise.all([
      cablebiApi.getDashboardSummary(activeToken, filters),
      cablebiApi.getSiteKpis(activeToken, filters.region),
    ])
    setDashboard(summaryData)
    setSiteKpis(siteData)
  })

  const loadDashboardContext = useEffectEvent(async (activeToken) => {
    await Promise.all([loadSegmentsData(activeToken), loadAlertsData(activeToken)])
  })

  const loadReport = useEffectEvent(async (activeToken) => {
    const reportData = await cablebiApi.getSiteReport(activeToken, reportFilters)
    setReport(reportData)
  })

  const loadDataForView = useEffectEvent(async (viewToLoad, activeToken = token, force = false) => {
    if (!force && loadedViews[viewToLoad]) {
      return
    }

    if (viewToLoad === 'dashboard') {
      await Promise.all([loadDashboardMetrics(activeToken), loadDashboardContext(activeToken)])
    }

    if (viewToLoad === 'clientes') {
      await loadClientsData(activeToken)
    }

    if (viewToLoad === 'contratos') {
      await Promise.all([loadClientsData(activeToken), loadContractsData(activeToken)])
    }

    if (viewToLoad === 'pagos') {
      await Promise.all([loadContractsData(activeToken), loadPaymentsData(activeToken)])
    }

    if (viewToLoad === 'incidencias') {
      await Promise.all([
        loadClientsData(activeToken),
        loadContractsData(activeToken),
        loadIncidentsData(activeToken),
      ])
    }

    if (viewToLoad === 'reportes') {
      await loadReport(activeToken)
    }

    if (viewToLoad === 'ml') {
      await Promise.all([loadSegmentsData(activeToken), loadChurnData(activeToken)])
    }

    markViewLoaded(viewToLoad)
  })

  const refreshWorkspace = useEffectEvent(async (activeToken = token) => {
    setBusy(true)
    setError('')
    try {
      await Promise.all([
        loadBaseData(activeToken),
        loadDataForView(view, activeToken, true),
      ])
      markViewLoaded(view)
      setNotice('Datos actualizados correctamente.')
    } catch (requestError) {
      setError(requestError.message)
    } finally {
      setBusy(false)
    }
  })

  useEffect(() => {
    const onHashChange = () => setView(getViewFromHash(window.location.hash))
    window.addEventListener('hashchange', onHashChange)
    if (!window.location.hash) {
      writeHash(DEFAULT_VIEW)
    }
    return () => window.removeEventListener('hashchange', onHashChange)
  }, [])

  useEffect(() => {
    if (!token) {
      return
    }
    setLoadedViews(createViewLoadState())
    setBusy(true)
    setError('')
    loadBaseData(token)
      .catch((requestError) => setError(requestError.message))
      .finally(() => setBusy(false))
  }, [token])

  useEffect(() => {
    if (!token) {
      return
    }
    loadDataForView(view, token).catch((requestError) => setError(requestError.message))
  }, [view, token])

  useEffect(() => {
    if (!token || view !== 'dashboard' || !loadedViews.dashboard) {
      return
    }
    loadDashboardMetrics(token).catch((requestError) => setError(requestError.message))
  }, [filters.region, filters.site_id, token, view, loadedViews.dashboard])

  useEffect(() => {
    if (!token || view !== 'reportes' || !loadedViews.reportes) {
      return
    }
    loadReport(token).catch((requestError) => setError(requestError.message))
  }, [
    reportFilters.site_id,
    reportFilters.start_date,
    reportFilters.end_date,
    token,
    view,
    loadedViews.reportes,
  ])

  async function handleLogin(event) {
    event.preventDefault()
    setBusy(true)
    setError('')
    try {
      const data = await cablebiApi.login(loginForm)
      const profile = {
        username: data.username,
        full_name: data.full_name,
        role: data.role,
      }
      localStorage.setItem('cablebi-token', data.access_token)
      localStorage.setItem('cablebi-user', JSON.stringify(profile))
      setLoadedViews(createViewLoadState())
      setToken(data.access_token)
      setUser(profile)
      setNotice('Ingreso correcto.')
      navigateToView(DEFAULT_VIEW)
    } catch (requestError) {
      setError(requestError.message)
    } finally {
      setBusy(false)
    }
  }

  function handleLogout() {
    localStorage.removeItem('cablebi-token')
    localStorage.removeItem('cablebi-user')
    setToken('')
    setUser(null)
    setSystemInfo(null)
    setClients([])
    setContracts([])
    setPayments([])
    setIncidents([])
    setSites([])
    setPlans([])
    setDashboard({ summary: {}, history: [] })
    setSiteKpis([])
    setAlerts([])
    setSegments({ distribution: [], clients: [], silhouette_score: 0 })
    setChurn({ metrics: {}, predictions: [] })
    setReport({ series: [], totals: {} })
    setSelectedPrediction(null)
    setLoadedViews(createViewLoadState())
    setNotice('')
    setError('')
    navigateToView(DEFAULT_VIEW)
  }

  function resetClientForm() {
    setClientForm(initialClientForm)
    setEditingClientId(null)
  }

  function resetContractForm() {
    setContractForm(initialContractForm)
    setEditingContractId(null)
  }

  function resetPaymentForm() {
    setPaymentForm(initialPaymentForm)
    setEditingPaymentId(null)
  }

  function resetIncidentForm() {
    setIncidentForm(initialIncidentForm)
    setEditingIncidentId(null)
  }

  async function submitClient(event) {
    event.preventDefault()
    setBusy(true)
    try {
      const payload = {
        ...clientForm,
        site_id: clientForm.site_id ? Number(clientForm.site_id) : null,
        email: clientForm.email || null,
        phone: clientForm.phone || null,
        address: clientForm.address || null,
      }
      if (editingClientId) {
        await cablebiApi.updateClient(token, editingClientId, payload)
      } else {
        await cablebiApi.createClient(token, payload)
      }
      resetClientForm()
      await loadClientsData(token)
      setNotice('Datos del cliente guardados correctamente.')
    } catch (requestError) {
      setError(requestError.message)
    } finally {
      setBusy(false)
    }
  }

  async function submitContract(event) {
    event.preventDefault()
    setBusy(true)
    try {
      const payload = {
        ...contractForm,
        client_id: Number(contractForm.client_id),
        site_id: Number(contractForm.site_id),
        plan_id: Number(contractForm.plan_id),
        end_date:
          contractForm.status === 'cancelado' || contractForm.status === 'inactivo'
            ? contractForm.end_date || null
            : null,
        note: contractForm.note || null,
      }
      if (editingContractId) {
        await cablebiApi.updateContract(token, editingContractId, payload)
      } else {
        await cablebiApi.createContract(token, payload)
      }
      resetContractForm()
      await Promise.all([loadClientsData(token), loadContractsData(token)])
      setNotice('Servicio guardado correctamente.')
    } catch (requestError) {
      setError(requestError.message)
    } finally {
      setBusy(false)
    }
  }

  async function submitPayment(event) {
    event.preventDefault()
    setBusy(true)
    try {
      const payload = {
        ...paymentForm,
        contract_id: Number(paymentForm.contract_id),
        amount: Number(paymentForm.amount),
        issued_date:
          paymentForm.status === 'pagado'
            ? paymentForm.issued_date || paymentForm.paid_date
            : paymentForm.issued_date,
        paid_date:
          paymentForm.status === 'pagado'
            ? paymentForm.paid_date || paymentForm.issued_date
            : null,
        payment_method: paymentForm.payment_method || null,
        reference: paymentForm.reference || null,
      }
      if (editingPaymentId) {
        await cablebiApi.updatePayment(token, editingPaymentId, payload)
      } else {
        await cablebiApi.createPayment(token, payload)
      }
      resetPaymentForm()
      await loadPaymentsData(token)
      setNotice('Pago guardado correctamente.')
    } catch (requestError) {
      setError(requestError.message)
    } finally {
      setBusy(false)
    }
  }

  async function submitIncident(event) {
    event.preventDefault()
    setBusy(true)
    try {
      const payload = {
        ...incidentForm,
        client_id: Number(incidentForm.client_id),
        contract_id: Number(incidentForm.contract_id),
        site_id: Number(incidentForm.site_id),
        resolved_at:
          incidentForm.status === 'resuelta' || incidentForm.status === 'cerrada'
            ? incidentForm.resolved_at || null
            : null,
      }
      if (editingIncidentId) {
        await cablebiApi.updateIncident(token, editingIncidentId, payload)
      } else {
        await cablebiApi.createIncident(token, payload)
      }
      resetIncidentForm()
      await loadIncidentsData(token)
      setNotice('Caso guardado correctamente.')
    } catch (requestError) {
      setError(requestError.message)
    } finally {
      setBusy(false)
    }
  }

  async function exportReport() {
    try {
      const content = await cablebiApi.exportSiteReport(token, reportFilters)
      const blob = new Blob([content], { type: 'text/csv;charset=utf-8' })
      const url = URL.createObjectURL(blob)
      const link = document.createElement('a')
      link.href = url
      link.download = 'reporte-cablebi-por-sede.csv'
      link.click()
      URL.revokeObjectURL(url)
      setNotice('Reporte descargado correctamente.')
    } catch (requestError) {
      setError(requestError.message)
    }
  }

  async function runPrediction(clientId) {
    setError('')
    try {
      const prediction = await cablebiApi.predictClientChurn(token, clientId)
      setSelectedPrediction(prediction)
      startTransition(() => navigateToView('ml'))
    } catch (requestError) {
      setError(requestError.message)
    }
  }

  if (!token) {
    return (
      <LoginPage
        busy={busy}
        error={error}
        loginForm={loginForm}
        setLoginForm={setLoginForm}
        handleLogin={handleLogin}
      />
    )
  }

  return (
    <div className="app-shell">
      <aside className="sidebar">
        <div className="brand-card">
          <p className="brand-overline">Panel empresarial</p>
          <h1>CableBI</h1>
          <p className="brand-text">
            Sistema para revisar clientes, servicios, pagos y casos de atencion en un
            solo lugar.
          </p>
        </div>

        <nav className="nav-stack">
          {NAV_ITEMS.map((item) => (
            <button
              key={item.id}
              type="button"
              className={`nav-button ${view === item.id ? 'nav-active' : ''}`}
              onClick={() => startTransition(() => navigateToView(item.id))}
            >
              <strong>{item.label}</strong>
              <span>{item.helper}</span>
            </button>
          ))}
        </nav>

        <div className="sidebar-foot">
          <p>{user?.full_name}</p>
          <span>{getDisplayLabel(roleLabels, user?.role)}</span>
          <button type="button" className="ghost-button" onClick={handleLogout}>
            Cerrar sesion
          </button>
        </div>
      </aside>

      <main className="content">
        <header className="topbar">
          <div>
            <p className="kicker">Panel principal</p>
            <h2 className="page-title">
              Informacion general de clientes, servicios, pagos y atencion
            </h2>
            <p className="page-copy">
              {systemInfo?.database_backend === 'sqlite'
                ? 'Sistema usando una base local temporal para seguir trabajando sin detener la operacion.'
                : 'Sistema conectado a la base de datos principal para consultar clientes, servicios, pagos y atencion al cliente.'}
            </p>
            <div className="topbar-notes">
              <span className="topbar-note">Vista lista para el trabajo diario</span>
              <span className="topbar-note">Informacion ordenada por area de trabajo</span>
            </div>
          </div>
          <div className="topbar-actions">
            <button type="button" className="ghost-button" onClick={() => refreshWorkspace()}>
              Actualizar datos
            </button>
            {busy ? <Badge tone="warning">Actualizando</Badge> : <Badge tone="success">Sistema activo</Badge>}
          </div>
        </header>

        {notice ? <p className="feedback feedback-success">{notice}</p> : null}
        {error ? <p className="feedback feedback-error">{error}</p> : null}

        {view === 'dashboard' ? (
          <DashboardPage
            filters={filters}
            setFilters={setFilters}
            sites={sites}
            dashboard={dashboard}
            siteKpis={siteKpis}
            segments={segments}
            alerts={alerts}
          />
        ) : null}

        {view === 'clientes' ? (
          <ClientsPage
            clientForm={clientForm}
            setClientForm={setClientForm}
            submitClient={submitClient}
            editingClientId={editingClientId}
            resetClientForm={resetClientForm}
            clientSearch={clientSearch}
            setClientSearch={setClientSearch}
            filteredClients={filteredClients}
            sites={sites}
            setEditingClientId={setEditingClientId}
            runPrediction={runPrediction}
          />
        ) : null}

        {view === 'contratos' ? (
          <ContractsPage
            contractForm={contractForm}
            setContractForm={setContractForm}
            submitContract={submitContract}
            editingContractId={editingContractId}
            resetContractForm={resetContractForm}
            clients={clients}
            sites={sites}
            plans={plans}
            contracts={contracts}
            setEditingContractId={setEditingContractId}
          />
        ) : null}

        {view === 'pagos' ? (
          <PaymentsPage
            paymentForm={paymentForm}
            setPaymentForm={setPaymentForm}
            submitPayment={submitPayment}
            editingPaymentId={editingPaymentId}
            resetPaymentForm={resetPaymentForm}
            contracts={contracts}
            payments={payments}
            setEditingPaymentId={setEditingPaymentId}
          />
        ) : null}

        {view === 'incidencias' ? (
          <IncidentsPage
            incidentForm={incidentForm}
            setIncidentForm={setIncidentForm}
            submitIncident={submitIncident}
            editingIncidentId={editingIncidentId}
            resetIncidentForm={resetIncidentForm}
            clients={clients}
            contracts={contracts}
            sites={sites}
            incidents={incidents}
            setEditingIncidentId={setEditingIncidentId}
          />
        ) : null}

        {view === 'reportes' ? (
          <ReportsPage
            reportFilters={reportFilters}
            setReportFilters={setReportFilters}
            sites={sites}
            exportReport={exportReport}
            report={report}
          />
        ) : null}

        {view === 'ml' ? (
          <MachineLearningPage
            churn={churn}
            segments={segments}
            selectedPrediction={selectedPrediction}
            onSelectPrediction={setSelectedPrediction}
          />
        ) : null}
      </main>

      <ZoeChatWidget token={token} view={view} />
    </div>
  )
}

export default App
