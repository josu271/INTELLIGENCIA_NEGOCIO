import {
  useEffect,
  useEffectEvent,
  useRef,
  useState,
} from 'react'
import { cablebiApi } from '../api/cablebi'

const DEFAULT_SUGGESTIONS = {
  dashboard: [
    'Dame un resumen general',
    'Cuantos clientes activos hay',
    'Cuanto se cobro este mes',
  ],
  clientes: [
    'Cuantos clientes activos hay',
    'Busca al cliente con DNI 45874581',
    'Hay clientes con riesgo de baja',
  ],
  contratos: [
    'Cuantos contratos activos hay',
    'Que planes existen',
    'Que servicios estan inactivos',
  ],
  pagos: [
    'Cuantos pagos pendientes hay',
    'Cual es el monto pendiente',
    'Cuanto se cobro este mes',
  ],
  incidencias: [
    'Cuantas incidencias abiertas hay',
    'Hay casos de alta prioridad',
    'Cual es el tiempo promedio de resolucion',
  ],
  reportes: [
    'Resume el reporte general',
    'Cual fue el ingreso total del periodo',
    'Cuantas bajas hubo',
  ],
  ml: [
    'Muestra clientes con mayor riesgo',
    'Como esta la segmentacion',
    'Hay alertas de retencion',
  ],
}

function createMessage(role, text, suggestions = []) {
  return {
    id: `${role}-${Date.now()}-${Math.random().toString(36).slice(2, 8)}`,
    role,
    text,
    suggestions,
  }
}

function buildWelcomeMessage(view) {
  return createMessage(
    'assistant',
    'Soy Zoe. Te apoyo con clientes, contratos, pagos, incidencias, reportes y analisis del sistema. Tambien puedo seguir el contexto del chat con preguntas como "y en junio?" o "y sus pagos?".',
    DEFAULT_SUGGESTIONS[view] ?? DEFAULT_SUGGESTIONS.dashboard,
  )
}

export function ZoeChatWidget({ token, view }) {
  const [open, setOpen] = useState(false)
  const [draft, setDraft] = useState('')
  const [sending, setSending] = useState(false)
  const [messages, setMessages] = useState(() => [buildWelcomeMessage(view)])
  const inputRef = useRef(null)
  const messagesRef = useRef(null)

  const scrollToBottom = useEffectEvent(() => {
    const container = messagesRef.current
    if (!container) {
      return
    }
    container.scrollTop = container.scrollHeight
  })

  const sendMessage = useEffectEvent(async (text) => {
    const cleanText = text.trim()
    if (!cleanText || sending) {
      return
    }

    const userMessage = createMessage('user', cleanText)
    setMessages((current) => [...current, userMessage])
    setDraft('')
    setSending(true)

    try {
      const response = await cablebiApi.chatWithZoe(token, {
        message: cleanText,
        view,
        history: messages.slice(-8).map((message) => ({
          role: message.role,
          text: message.text,
        })),
      })
      setMessages((current) => [
        ...current,
        createMessage('assistant', response.message, response.suggestions ?? []),
      ])
    } catch (error) {
      setMessages((current) => [
        ...current,
        createMessage(
          'assistant',
          error.message ||
            'No pude consultar la informacion en este momento. Intenta otra vez.',
          DEFAULT_SUGGESTIONS[view] ?? DEFAULT_SUGGESTIONS.dashboard,
        ),
      ])
    } finally {
      setSending(false)
    }
  })

  useEffect(() => {
    scrollToBottom()
  }, [messages, open, scrollToBottom])

  useEffect(() => {
    if (!open) {
      return
    }
    inputRef.current?.focus()
  }, [open])

  useEffect(() => {
    setMessages((current) => {
      if (current.length > 1) {
        return current
      }
      return [buildWelcomeMessage(view)]
    })
  }, [view])

  function handleSubmit(event) {
    event.preventDefault()
    sendMessage(draft)
  }

  function handleSuggestionClick(suggestion) {
    sendMessage(suggestion)
  }

  const latestAssistantMessage = [...messages].reverse().find((message) => message.role === 'assistant')
  const suggestions =
    latestAssistantMessage?.suggestions?.length
      ? latestAssistantMessage.suggestions
      : DEFAULT_SUGGESTIONS[view] ?? DEFAULT_SUGGESTIONS.dashboard

  return (
    <div className={`zoe-widget ${open ? 'zoe-widget-open' : ''}`}>
      {open ? (
        <section className="zoe-panel" aria-label="Chat Zoe">
          <header className="zoe-header">
            <div>
              <p className="zoe-eyebrow">Asistente interno</p>
              <h3>Zoe</h3>
              <p className="zoe-status">En linea para soporte administrativo</p>
            </div>
            <button
              type="button"
              className="zoe-close"
              onClick={() => setOpen(false)}
              aria-label="Cerrar chat"
            >
              Cerrar
            </button>
          </header>

          <div className="zoe-messages" ref={messagesRef}>
            {messages.map((message) => (
              <article
                key={message.id}
                className={`zoe-message ${message.role === 'user' ? 'zoe-user' : 'zoe-assistant'}`}
              >
                <span className="zoe-message-role">
                  {message.role === 'user' ? 'Tu' : 'Zoe'}
                </span>
                <p>{message.text}</p>
              </article>
            ))}
            {sending ? (
              <article className="zoe-message zoe-assistant zoe-thinking">
                <span className="zoe-message-role">Zoe</span>
                <p>Revisando la informacion del sistema...</p>
              </article>
            ) : null}
          </div>

          <div className="zoe-suggestions">
            {suggestions.slice(0, 3).map((suggestion) => (
              <button
                key={suggestion}
                type="button"
                className="zoe-suggestion"
                onClick={() => handleSuggestionClick(suggestion)}
                disabled={sending}
              >
                {suggestion}
              </button>
            ))}
          </div>

          <form className="zoe-form" onSubmit={handleSubmit}>
            <input
              ref={inputRef}
              type="text"
              value={draft}
              onChange={(event) => setDraft(event.target.value)}
              placeholder="Pregunta por clientes, pagos, contratos o reportes"
              maxLength={600}
              disabled={sending}
            />
            <button type="submit" className="primary-button" disabled={sending || !draft.trim()}>
              Enviar
            </button>
          </form>
        </section>
      ) : null}

      <button
        type="button"
        className="zoe-bubble"
        onClick={() => setOpen((current) => !current)}
        aria-expanded={open}
        aria-label="Abrir chat Zoe"
      >
        <span className="zoe-bubble-mark">Z</span>
        <span className="zoe-bubble-copy">
          <strong>Zoe</strong>
          <small>Asistente AI</small>
        </span>
      </button>
    </div>
  )
}
