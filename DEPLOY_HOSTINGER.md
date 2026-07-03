# Despliegue demo en Hostinger VPS

Este repositorio ya queda preparado para publicar el demo con:

- `frontend` React compilado en contenedor
- `backend` FastAPI en contenedor
- `Caddy` como proxy para `nexoproyect.com` con HTTPS automatico
- actualizacion por `git pull` en el VPS o por GitHub Actions

## 1. DNS del dominio

En Hostinger crea estos registros tipo `A`:

- `@` -> `187.127.47.54`
- `www` -> `187.127.47.54`

## 2. Subir el repo a tu Git

Ejemplo con GitHub:

```powershell
git remote add origin <TU_REPO_GIT>
git push -u origin main
```

## 3. Preparar el VPS

Conectate por SSH:

```bash
ssh root@187.127.47.54
```

Instala Git y Docker en Ubuntu o Debian:

```bash
apt update
apt install -y git docker.io docker-compose-plugin
systemctl enable --now docker
```

## 4. Crear el archivo `.env` en el VPS

Si vas a desplegar manualmente:

```bash
git clone <TU_REPO_GIT> /opt/nexoproyect
cd /opt/nexoproyect
cp .env.example .env
```

Si vas a desplegar con GitHub Actions, crea primero la carpeta y el `.env`:

```bash
mkdir -p /opt/nexoproyect
cd /opt/nexoproyect
nano .env
```

Contenido minimo sugerido para el demo:

```env
APP_DOMAIN=nexoproyect.com
APP_WWW_DOMAIN=www.nexoproyect.com
VITE_API_BASE_URL=
SECRET_KEY=cambia-esta-clave-demo
BACKEND_CORS_ORIGINS=http://localhost:5173,http://127.0.0.1:5173,https://nexoproyect.com,https://www.nexoproyect.com
DB_FALLBACK_TO_SQLITE=true
SQLITE_PATH=/data/cablebi_demo.db
DB_HOST=localhost
DB_PORT=5432
DB_NAME=cablebi
DB_SCHEMA=cablebi
DB_USER=postgres
DB_PASSWORD=postgres
DB_ADMIN_USER=
DB_ADMIN_PASSWORD=
DB_MAINTENANCE_DB=postgres
```

Con eso el demo funciona usando SQLite persistente en el VPS.

## 5. Despliegue manual

```bash
cd /opt/nexoproyect
bash deploy/vps-refresh.sh
```

## 6. Despliegue automatico desde GitHub

El workflow `.github/workflows/deploy.yml` necesita estos secretos:

- `VPS_HOST` = `187.127.47.54`
- `VPS_PORT` = `22`
- `VPS_USER` = tu usuario SSH del VPS
- `VPS_SSH_KEY` = clave privada SSH
- `VPS_APP_DIR` = `/opt/nexoproyect`
- `DEPLOY_REPO_URL` = URL Git que el VPS pueda clonar
- `DEPLOY_BRANCH` = `main`

Cuando hagas push a `main`, el workflow hara:

1. Clonar o actualizar el repo en el VPS.
2. Verificar que exista `.env`.
3. Ejecutar `docker compose up -d --build`.

## 7. Verificacion

Despues del despliegue revisa:

```bash
docker compose ps
docker compose logs -f caddy
docker compose logs -f backend
```

Sitios esperados:

- `https://nexoproyect.com`
- `https://www.nexoproyect.com`
- `https://nexoproyect.com/docs`
