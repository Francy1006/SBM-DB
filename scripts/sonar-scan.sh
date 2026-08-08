#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
ENV_FILE="${ENV_FILE:-${PROJECT_ROOT}/.env.dev}"

[[ -f "${ENV_FILE}" ]] || { echo "ERROR: No existe ${ENV_FILE}" >&2; exit 1; }
command -v docker >/dev/null 2>&1 || { echo "ERROR: Docker es obligatorio para SonarScanner" >&2; exit 1; }

set -a
. "${ENV_FILE}"
set +a

SONAR_HOST_URL="${SONAR_HOST_URL:-http://host.docker.internal:9000}"
SONAR_TOKEN="${SONAR_TOKEN:?SONAR_TOKEN no está definido}"

mkdir -p "${PROJECT_ROOT}/.sonar/cache"

cd "${PROJECT_ROOT}"

docker run --rm --platform linux/amd64 \
  --env-file "${ENV_FILE}" \
  -v "${PROJECT_ROOT}:/usr/src" \
  -v "${PROJECT_ROOT}/.sonar/cache:/opt/sonar-scanner/.sonar/cache" \
  -w /usr/src \
  sonarsource/sonar-scanner-cli

echo "SonarScanner y Quality Gate completados correctamente."
