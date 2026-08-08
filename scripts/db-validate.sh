#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
ENV_FILE="${ENV_FILE:-${PROJECT_ROOT}/.env.dev}"

[[ -f "${ENV_FILE}" ]] || { echo "ERROR: No existe ${ENV_FILE}" >&2; exit 1; }
command -v docker >/dev/null 2>&1 || { echo "ERROR: Docker es obligatorio" >&2; exit 1; }

cd "${PROJECT_ROOT}"

echo "Validando Docker Compose..."
docker compose --env-file "${ENV_FILE}" config -q

ANALYTICS_CONF="${PROJECT_ROOT}/flyway/sql/analytics/flyway.conf"
if [[ -f "${ANALYTICS_CONF}" ]] && grep -q '^flyway.locations=filesystem:/flyway/sql/analytics$' "${ANALYTICS_CONF}"; then
  echo "ERROR: analytics flyway.conf busca /flyway/sql/analytics pero Compose monta ./flyway/sql/analytics en /flyway/sql." >&2
  echo "Corrige flyway.locations antes de considerar válido el flujo analytics." >&2
  exit 1
fi

echo "Levantando PostgreSQL..."
docker compose --env-file "${ENV_FILE}" up -d postgres

services=(
  flyway_sbm_business
  flyway_ditaly_pasta
  flyway_cross
  flyway_analytics
)

for service in "${services[@]}"; do
  echo "Validando ${service}..."
  docker compose --env-file "${ENV_FILE}" run --rm --no-deps "${service}" \
    -configFiles=/flyway/conf/flyway.conf validate
done

echo "Validación Flyway completada correctamente."
