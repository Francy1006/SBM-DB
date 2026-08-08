# QA_CONTEXT.md

> **Last updated:** 2026-08-08
>
> **Purpose:** Canonical repository-local QA context for SBM-DB.
>
> **Accuracy note:** Only executed and evidenced validation is recorded as completed. Application tests and code coverage are not applicable to this PostgreSQL/Flyway repository. SQL correctness is validated through PostgreSQL/Flyway execution, not SonarQube Community Build.

## 1. Project technical details

| Attribute | Value |
|---|---|
| Project | SBM-DB |
| Language | SQL / Shell / YAML |
| Framework | PostgreSQL 16 / Flyway 10 |
| Runtime | Docker Compose |
| Test framework | Flyway/PostgreSQL validation |
| Coverage tool | N/A |
| Static analysis tool | SonarQube Community Build |
| SonarQube project key | `SBM-DB` |
| QA execution command | `./scripts/qa-check.sh` |

## 2. Project QA scope

SBM-DB QA protects Docker Compose validity, PostgreSQL runtime availability, Flyway history/checksum consistency, migration compatibility across configured schemas, execution of pending migrations before release, and supported Shell/YAML/secrets static analysis.

SQL/Flyway correctness is owned by PostgreSQL and Flyway execution.

## 3. Required quality gates

| Gate | Requirement | Blocking | Evidence |
|---|---|---:|---|
| Docker Compose | `docker compose --env-file .env.dev config -q` passes | 1 | command output |
| PostgreSQL | PostgreSQL service starts and is reachable | 1 | Docker/Flyway output |
| Flyway sbm_business | explicit `validate` passes | 1 | Flyway output |
| Flyway ditaly_pasta | explicit `validate` passes | 1 | Flyway output |
| Flyway cross | explicit `validate` passes | 1 | Flyway output |
| Flyway analytics | explicit `validate` passes | 1 | Flyway output |
| Pending migrations | pending migrations execute successfully before release | 1 | Flyway migrate output |
| SonarQube | scanner succeeds and server-side Quality Gate passes | 1 | scanner/server output |
| Coverage | N/A | 0 | N/A |

## 4. Test environments

Current validated local QA environment:

```text
Docker Compose
PostgreSQL 16.9
Flyway OSS 10.22.0
SonarQube Community Build 26.7.0.124771
```

Environment-specific credentials and tokens are supplied through `.env.dev` and are not part of QA evidence packages.

## 5. Test structure

```text
scripts/db-validate.sh
→ docker compose config
→ postgres
→ flyway_sbm_business validate
→ flyway_ditaly_pasta validate
→ flyway_cross validate
→ flyway_analytics validate

scripts/qa-check.sh
→ db-validate.sh
→ sonar-scan.sh
→ context/qa-results.md
```

## 6. Test inventory

| Test ID | Description | Logic type | Components | Risk | Last execution | Result | Evidence |
|---|---|---|---|---:|---|---|---|
| SBM-DB-QA-001 | Validate Docker Compose and all four Flyway flows | database | Docker Compose, PostgreSQL, Flyway | 5 | 2026-08-08 | passed | `context/qa-results.md` |
| SBM-DB-QA-002 | Run supported static analysis and wait for Quality Gate | static-analysis | Shell, YAML, secrets, SonarQube | 4 | 2026-08-08 | passed | `context/qa-results.md` |

## 7. Test data and fixtures

```text
N/A
```

SBM-DB QA validates migrations against the configured PostgreSQL database. No application fixture framework is used by this repository.

## 8. Unit tests

```text
N/A
```

This repository does not contain an application unit-test suite.

## 9. Integration tests

Database migration execution against PostgreSQL is the relevant integration boundary.

Current evidence is captured under database tests and `context/qa-results.md`.

## 10. API tests

```text
N/A
```

SBM-DB does not expose an HTTP API.

## 11. Database tests

Latest validated Flyway results:

| Flow | Validated migrations | Result |
|---|---:|---|
| `sbm_business` | 33 | PASS |
| `ditaly_pasta` | 55 | PASS |
| `cross` | 5 | PASS |
| `analytics` | 2 | PASS |

Primary validation path:

```text
Docker Compose
→ PostgreSQL runtime
→ Flyway validate
→ Flyway migrate for pending migrations when applicable
→ PostgreSQL execution result
```

Rules:

- checksum mismatch is blocking until investigated;
- `repair` requires explicit confirmation of the intended canonical migration content;
- Flyway `validate` does not by itself prove pending SQL executes successfully;
- destructive `clean` is prohibited against data that must be preserved.

## 12. Security tests

Current automated security coverage is limited to supported SonarQube text/secrets analysis.

Database credential handling is validated operationally by keeping secret values outside Git and lifecycle packages.

## 13. Static analysis

SonarQube Community Build analyzes supported non-SQL repository artifacts.

Configured exclusions include:

```text
flyway/**
dbdiagram/**
context/**
```

Therefore SQL/Flyway static analysis is not part of the SonarQube gate for SBM-DB.

## 14. Coverage

```text
N/A
```

Reason:

```text
SBM-DB is a PostgreSQL/Flyway migration repository and does not contain an application codebase for meaningful line or branch coverage.
```

## 15. SonarQube

Latest evidence:

```text
Project key: SBM-DB
Scanner exit code: 0
Quality Gate: PASSED
```

The server-side Quality Gate is authoritative for this static-analysis step.

## 16. Current validated evidence

Latest QA execution:

```text
Generated at: 2026-08-08T03:35:56Z
Overall status: passed
Evidence: context/qa-results.md
```

Validated outcomes:

- Docker/Flyway QA completed successfully.
- `sbm_business`: 33 migrations validated.
- `ditaly_pasta`: 55 migrations validated.
- `cross`: 5 migrations validated.
- `analytics`: 2 migrations validated.
- SonarScanner execution succeeded.
- SonarQube Quality Gate passed.

## 17. Known defects

```text
No unresolved defect is recorded by the latest qa-results.md evidence.
```

Resolved enablement issues included:

- checksum mismatch for `V202604122259__ORDERS_formula.sql`;
- fiscal directive view reference to nonexistent `fd.percentage`;
- analytics view alias replacement conflict;
- analytics Flyway location mismatch;
- local Sonar wrapper expecting a host-side `.scannerwork/report-task.txt`.

## 18. Accepted exceptions

- Application test counts: N/A.
- Code coverage: N/A.
- SonarQube SQL/Flyway analysis: N/A under the current Community Build scope.
- Database QA requires PostgreSQL/Flyway execution in addition to SonarQube.

## 19. Pending QA work

- Re-run `./scripts/qa-check.sh` before objective closure when fresh closure evidence is required.
- Validate context export/upgrade lifecycle for SBM-DB.
- Keep project and global QA summaries synchronized through context-upgrade.

## 20. Related documentation

```text
SBM-SUITE/sbm/SBM-DB/context/PROJECT_CONTEXT.md
SBM-SUITE/sbm/SBM-DB/context/DEPLOY_CONTEXT.md
SBM-SUITE/context/QA_CONTEXT.md
SBM-SUITE/context/DATA_CONTEXT.md
```

## 21. Document boundary

This file defines SBM-DB QA policy, test inventory, database validation gates, static-analysis scope, current evidence, defects, exceptions and pending QA work.

It does not replace raw Flyway output, PostgreSQL runtime inspection, migration SQL, DBML, SonarQube server reports or `context/qa-results.md`.
