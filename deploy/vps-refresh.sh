#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$PROJECT_ROOT"

if [ ! -f .env ]; then
  echo "Falta el archivo .env en $PROJECT_ROOT"
  exit 1
fi

docker compose up -d --build --remove-orphans
docker compose ps
