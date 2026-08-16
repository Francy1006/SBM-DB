#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
QA_RESULTS_FILE="${PROJECT_ROOT}/context/qa-results.md"
TEMP_DIRECTORY="$(mktemp -d)"
DB_LOG="${TEMP_DIRECTORY}/database-validation.log"
SONAR_LOG="${TEMP_DIRECTORY}/sonar.log"

cleanup() { rm -rf "${TEMP_DIRECTORY}"; }
trap cleanup EXIT
mkdir -p "$(dirname "${QA_RESULTS_FILE}")"

DB_STATUS=0
SONAR_STATUS=0

echo "1/2 Validando Docker/Flyway..."
set +e
"${SCRIPT_DIR}/qa-test.sh" 2>&1 | tee "${DB_LOG}"
DB_STATUS="${PIPESTATUS[0]}"
set -e

if [[ "${DB_STATUS}" -eq 0 ]]; then
  echo "2/2 Ejecutando SonarScanner (Shell/YAML/secrets; SQL excluido)..."
  set +e
  "${SCRIPT_DIR}/sonar-scan.sh" 2>&1 | tee "${SONAR_LOG}"
  SONAR_STATUS="${PIPESTATUS[0]}"
  set -e
else
  SONAR_STATUS=1
  echo "SonarScanner no se ejecutó porque la validación de base de datos falló." | tee "${SONAR_LOG}"
fi

OVERALL_STATUS="passed"
if [[ "${DB_STATUS}" -ne 0 || "${SONAR_STATUS}" -ne 0 ]]; then OVERALL_STATUS="failed"; fi

{
  echo "# QA Results"
  echo
  echo "> **Generated at:** $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  echo ">"
  echo "> **Project:** SBM-DB"
  echo ">"
  echo "> **Overall status:** ${OVERALL_STATUS}"
  echo
  echo "## Database / Flyway validation"
  echo
  echo "- Exit code: ${DB_STATUS}"
  echo "- Tests collected/passed/failed: N/A (database migration repository)"
  echo "- Coverage: N/A"
  echo "- Coverage artifact: N/A"
  echo
  echo '```text'
  cat "${DB_LOG}"
  echo '```'
  echo
  echo "## SonarScanner"
  echo
  echo "- Exit code: ${SONAR_STATUS}"
  echo "- Scope: Shell/YAML/secrets supported by Community Build; Flyway SQL excluded"
  echo
  echo '```text'
  cat "${SONAR_LOG}"
  echo '```'
  echo
  echo "## Evidence boundary"
  echo
  echo "This file records only executed QA output."
  echo "It does not claim SQL static analysis, migration success, coverage, deployment or Quality Gate results that are absent from the logs."
} > "${QA_RESULTS_FILE}"

echo
echo "Evidencia QA generada en: ${QA_RESULTS_FILE}"

[[ "${DB_STATUS}" -eq 0 ]] || { echo "ERROR: Validación Docker/Flyway falló." >&2; exit "${DB_STATUS}"; }
[[ "${SONAR_STATUS}" -eq 0 ]] || { echo "ERROR: SonarScanner/Quality Gate falló." >&2; exit "${SONAR_STATUS}"; }

echo "QA SBM-DB completado correctamente."
