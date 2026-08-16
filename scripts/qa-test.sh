#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
ENV_FILE="${ENV_FILE:-${PROJECT_ROOT}/.env.dev}"

[[ -f "${ENV_FILE}" ]] || {
  echo "ERROR: no existe ${ENV_FILE}" >&2
  exit 1
}

command -v docker >/dev/null 2>&1 || {
  echo "ERROR: Docker no disponible" >&2
  exit 1
}

QA_ID="sbm-db-qa-$$"
DB_CONTAINER="${QA_ID}-postgres"
NETWORK="${QA_ID}-network"

cleanup() {
  docker rm -f "${DB_CONTAINER}" >/dev/null 2>&1 || true
  docker network rm "${NETWORK}" >/dev/null 2>&1 || true
}
trap cleanup EXIT

env_value() {
  local key="$1"
  local value

  value="$(grep -E "^${key}=" "${ENV_FILE}" | tail -n 1 | cut -d= -f2-)"
  value="${value%\"}"
  value="${value#\"}"
  printf '%s' "${value}"
}

run_flyway() {
  local directory="$1"
  local schema_variable="$2"
  local action="$3"
  local schemas

  schemas="$(env_value "${schema_variable}")"

  [[ -n "${schemas}" ]] || {
    echo "ERROR: ${schema_variable} no definido" >&2
    exit 1
  }

  docker run --rm \
    --network "${NETWORK}" \
    --env-file "${ENV_FILE}" \
    -e POSTGRES_HOST="${DB_CONTAINER}" \
    -e POSTGRES_PORT=5432 \
    -e POSTGRES_INTERNAL_PORT=5432 \
    -e FLYWAY_URL="jdbc:postgresql://${DB_CONTAINER}:5432/$(env_value POSTGRES_DB)" \
    -e FLYWAY_USER="$(env_value POSTGRES_USER)" \
    -e FLYWAY_PASSWORD="$(env_value POSTGRES_PASSWORD)" \
    -e FLYWAY_SCHEMAS="${schemas}" \
    -v "${PROJECT_ROOT}/flyway/sql/${directory}:/flyway/sql:ro" \
    -v "${PROJECT_ROOT}/flyway/sql/${directory}/flyway.conf:/flyway/conf/flyway.conf:ro" \
    flyway/flyway:10 \
    -configFiles=/flyway/conf/flyway.conf "${action}"
}

echo "Creando infraestructura QA aislada..."

docker network create "${NETWORK}" >/dev/null

docker run -d \
  --name "${DB_CONTAINER}" \
  --network "${NETWORK}" \
  --env-file "${ENV_FILE}" \
  --tmpfs /var/lib/postgresql/data:rw \
  --health-cmd='pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB"' \
  --health-interval=2s \
  --health-timeout=5s \
  --health-retries=30 \
  postgres:16 >/dev/null

echo "Esperando PostgreSQL temporal..."

for _ in $(seq 1 30); do
  status="$(docker inspect --format '{{.State.Health.Status}}' "${DB_CONTAINER}")"
  [[ "${status}" == "healthy" ]] && break
  [[ "${status}" == "unhealthy" ]] && {
    echo "ERROR: PostgreSQL temporal unhealthy" >&2
    exit 1
  }
  sleep 2
done

[[ "$(docker inspect --format '{{.State.Health.Status}}' "${DB_CONTAINER}")" == "healthy" ]] || {
  echo "ERROR: PostgreSQL temporal no quedo healthy" >&2
  exit 1
}

echo "Ejecutando migraciones Flyway..."
run_flyway sbm_business FLYWAY_SBM_BUSINESS_SCHEMAS migrate
run_flyway ditaly_pasta FLYWAY_DITALY_PASTA_SCHEMAS migrate
run_flyway cross FLYWAY_CROSS_SCHEMAS migrate
run_flyway analytics FLYWAY_ANALYTICS_SCHEMAS migrate

echo "Validando migraciones Flyway..."
run_flyway sbm_business FLYWAY_SBM_BUSINESS_SCHEMAS validate
run_flyway ditaly_pasta FLYWAY_DITALY_PASTA_SCHEMAS validate
run_flyway cross FLYWAY_CROSS_SCHEMAS validate
run_flyway analytics FLYWAY_ANALYTICS_SCHEMAS validate

echo "QA SBM-DB aislado completado correctamente."
