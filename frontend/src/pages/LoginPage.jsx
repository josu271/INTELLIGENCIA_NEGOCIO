export function LoginPage({
  busy,
  error,
  loginForm,
  setLoginForm,
  handleLogin,
}) {
  return (
    <main className="login-screen">
      <div className="aurora aurora-left" />
      <div className="aurora aurora-right" />
      <section className="login-panel">
        <p className="kicker">CableBI - panel de trabajo</p>
        <h1>Consulta clientes, servicios y pagos en un solo lugar.</h1>
        <p className="intro-copy">
          Ingresa para revisar la informacion del negocio, registrar atenciones y
          descargar reportes sin complicaciones.
        </p>
        <div className="credential-strip">
          <span>
            Usuario de prueba: <strong>admin</strong>
          </span>
          <span>
            Clave de prueba: <strong>admin123</strong>
          </span>
        </div>
        <form className="login-form" onSubmit={handleLogin}>
          <label>
            Usuario
            <input
              value={loginForm.username}
              onChange={(event) =>
                setLoginForm((current) => ({
                  ...current,
                  username: event.target.value,
                }))
              }
              placeholder="Escribe tu usuario"
            />
          </label>
          <label>
            Contrasena
            <input
              type="password"
              value={loginForm.password}
              onChange={(event) =>
                setLoginForm((current) => ({
                  ...current,
                  password: event.target.value,
                }))
              }
              placeholder="Escribe tu contrasena"
            />
          </label>
          <button type="submit" className="primary-button" disabled={busy}>
            {busy ? 'Ingresando...' : 'Entrar al sistema'}
          </button>
          {error ? <p className="feedback feedback-error">{error}</p> : null}
        </form>
      </section>
    </main>
  )
}
