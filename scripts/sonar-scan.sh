#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SUITE_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"
source "${SUITE_ROOT}/context/scripts/sonar-scanner-common.sh"
ENV_FILE="${ENV_FILE:-${PROJECT_ROOT}/.env.dev}"

[[ -f "${ENV_FILE}" ]] || { echo "ERROR: No existe ${ENV_FILE}" >&2; exit 1; }
command -v docker >/dev/null 2>&1 || { echo "ERROR: Docker es obligatorio para SonarScanner" >&2; exit 1; }

set -a
. "${ENV_FILE}"
set +a

SONAR_HOST_URL="${SONAR_HOST_URL:-http://host.docker.internal:9000}"
SONAR_TOKEN="${SONAR_TOKEN:?SONAR_TOKEN no está definido}"

SONAR_ARCH="$(sbm_sonar_detect_arch)"
SONAR_SCANNER_PLATFORM="$(sbm_sonar_platform)"
SONAR_CACHE_DIR="$(sbm_sonar_cache_dir "${PROJECT_ROOT}" "${SONAR_ARCH}")"
SONAR_CONTAINER_NAME="sbm-sonar-${SONAR_ARCH}-$$"
mkdir -p "${SONAR_CACHE_DIR}"

cd "${PROJECT_ROOT}"

docker_args=(
  docker
  run
  --rm
  --name
  "${SONAR_CONTAINER_NAME}"
  --platform
  "${SONAR_SCANNER_PLATFORM}"
  --env-file
  "${ENV_FILE}"
  -v
  "${PROJECT_ROOT}:/usr/src"
  -v
  "${SONAR_CACHE_DIR}:/opt/sonar-scanner/.sonar/cache"
  -w
  "/usr/src"
  "$(sbm_sonar_image)"
)

sbm_sonar_ensure_image
sbm_sonar_run "${docker_args[@]}"

echo "SonarScanner y Quality Gate completados correctamente."
