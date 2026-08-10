# PROJECT_CONTEXT.md

> **Last updated:** 2026-08-08
>
> **Purpose:** Canonical project context for SBM-DB.
>
> **Accuracy note:** Structural facts are derived from the current SBM-DB repository and executed Flyway/PostgreSQL/QA evidence. Runtime state must be revalidated when preparing objective closure.

## 1. Executive summary

SBM-DB is the physical data-layer authority for SBM Suite. It owns PostgreSQL schemas, Flyway migrations, structural seeds, views, functions, constraints and the canonical DBML design consumed by application services through unmanaged mappings.

## 2. Project purpose

Provide a versioned, auditable and reproducible PostgreSQL schema for shared SBM platform data and brand-specific operational data while preventing application repositories from independently owning physical schema evolution.

## 3. Active objectives

| ID | Objective | Status | Priority | Target date | Branch | Documentation |
|---|---|---|---:|---|---|---|
| SBM-DB-001 | habilitación de sbm-db | active | 5 | 2026-08-07 | FEATURE-enables-sbm-db | `context/documentation/pages/🤖 AI Architect Roadmap/🏢 SBM-Suite 3a50bde8acd580d0a068d6abc3542603.md` |

## 4. Pending objectives

| ID | Objective | Status | Priority | Target date | Branch | Documentation |
|---|---|---|---:|---|---|---|
| SBM-DB-002 | Actualizar SBM-DB al contrato lifecycle actual de Context, incluyendo objectives[], execution_mode, preservación literal de objetivos y paths relativos. | pending | 5 | N/A | FEATURE-updates-context-lifecycle | N/A |

## 5. Scope and ownership

Canonical repository mapping:

```text
SBM-SUITE/sbm/SBM-DB/
```

Canonical runtime root:

```text
/suite/sbm/SBM-DB
```

Physical schema authority:

```text
SBM-DB + Flyway
→ PostgreSQL schemas, tables, views, constraints, functions and structural seeds

DP-API / SBM-API
→ application rules and unmanaged ORM mappings
```

SBM-DB does not own frontend behavior, API orchestration or AI workflows.

## 6. Architecture

```text
dbdiagram/SBM-business.dbml
        ↓ design target
flyway/sql/<flow>/V...__*.sql
        ↓ versioned evolution
Flyway
        ↓
PostgreSQL 16
├── sbm_business
├── ditaly_pasta
├── accounting
├── analytics
└── public
        ↓
DP-API / SBM-API unmanaged mappings
```

## 7. Runtime and containers

Docker Compose services:

```text
postgres
→ flyway_sbm_business
→ flyway_ditaly_pasta
→ flyway_cross
→ flyway_analytics
```

External network:

```text
sbm-network
```

Current validated runtime evidence reports PostgreSQL 16.9 and Flyway OSS 10.22.0.

## 8. Configuration

Development configuration:

```text
.env.dev
```

Database/Flyway variables include:

```text
POSTGRES_HOST
POSTGRES_PORT
POSTGRES_INTERNAL_PORT
POSTGRES_DB
POSTGRES_USER
POSTGRES_PASSWORD
FLYWAY_SBM_BUSINESS_SCHEMAS
FLYWAY_DITALY_PASTA_SCHEMAS
FLYWAY_CROSS_SCHEMAS
FLYWAY_ANALYTICS_SCHEMAS
DOPPLER_PROJECT
```

Lifecycle/QA integration additionally uses:

```text
AI_ASSISTANT_URL
SBM_SUITE_ROOT
SONAR_HOST_URL
SONAR_TOKEN
```

Secret values must never be committed or packaged into context/documentation exports.

## 9. Modules

| Module | Path | Responsibility |
|---|---|---|
| `sbm_business` | `flyway/sql/sbm_business/` | Shared/platform schema evolution |
| `ditaly_pasta` | `flyway/sql/ditaly_pasta/` | Brand operational schema evolution |
| `cross` | `flyway/sql/cross/` | Cross-schema/accounting changes |
| `analytics` | `flyway/sql/analytics/` | Analytics/reporting objects |
| DBML | `dbdiagram/SBM-business.dbml` | Canonical intended physical design |
| Lifecycle | `scripts/` | Context, documentation, database QA and Sonar workflows |

## 10. Data model ownership

Canonical design file:

```text
dbdiagram/SBM-business.dbml
```

Ownership model:

```text
DBML            → intended physical design
Flyway          → versioned physical evolution
Flyway history  → applied migration ledger
PostgreSQL      → effective runtime structure
application ORM → consumer mapping only
```

Primary schemas:

```text
sbm_business
ditaly_pasta
accounting
analytics
public
```

`cross` is a migration flow, not a business schema.

## 11. API surface

```text
N/A
```

SBM-DB does not expose an HTTP API. Application services consume PostgreSQL through their own persistence layers.

## 12. Authentication and authorization

SBM-DB does not own application authentication or authorization.

Database access is controlled through PostgreSQL credentials and environment-managed configuration. Secret values must remain outside Git and exported lifecycle artifacts.

## 13. Integrations

| Integration | Direction | Purpose | Status |
|---|---|---|---|
| DP-API | DP-API → PostgreSQL | Client-domain persistence | active |
| SBM-API | SBM-API → PostgreSQL | Platform persistence | active |
| Flyway | migrations → PostgreSQL | Physical schema evolution | active |
| SonarQube Community Build | scripts/YAML/secrets → SonarQube | Supported static analysis | active |
| sbm-ai-assistant | lifecycle scripts → assistant | Context/documentation lifecycle | active |

Canonical assistant registry mapping:

```text
sbm-db → /suite/sbm/SBM-DB
```

## 14. Implemented behavior

- PostgreSQL is started and managed through Docker Compose for local lifecycle validation.
- Four ordered Flyway flows validate the shared, brand, cross-schema and analytics migrations.
- `db-validate.sh` validates Docker Compose and all four Flyway flows.
- `qa-check.sh` combines Flyway/PostgreSQL validation with SonarQube Community Build.
- `sonar-scan.sh` waits for the server-side SonarQube Quality Gate.
- Context and documentation lifecycle scripts use suite-global input/output/backup locations.
- Analytics Flyway discovery is aligned with its Compose mount through `filesystem:/flyway/sql`.
- Fiscal directive analytics uses `fd.value` while preserving the existing view aliases `avg_percentage`, `min_percentage` and `max_percentage`.

## 15. Validation evidence

Latest executed QA evidence:

```text
context/qa-results.md
Generated at: 2026-08-08T03:35:56Z
Overall status: passed
```

Flyway validation:

| Flow | Validated migrations | Result |
|---|---:|---|
| `sbm_business` | 33 | PASS |
| `ditaly_pasta` | 55 | PASS |
| `cross` | 5 | PASS |
| `analytics` | 2 | PASS |

SonarQube:

```text
Project key: SBM-DB
Scanner exit code: 0
Quality Gate: PASSED
```

Application tests and coverage are not applicable to this migration/data repository.

## 16. Database and migration impact

Validated migration corrections during enablement:

- `V202604122259__ORDERS_formula.sql`: checksum mismatch investigated; intended local content was explicitly confirmed and Flyway history repaired.
- `V202507041606__CREATE_fiscal_directive_stats_view.sql`: fiscal directive metric references use `fd.value`.
- `V202507041801__CREATE_fiscal_directive_stats_view.sql`: existing view aliases are preserved to satisfy PostgreSQL `CREATE OR REPLACE VIEW` constraints.
- Analytics Flyway configuration uses the container-visible migration location.
- Analytics migration `202507041801` executed successfully before the final QA validation.

Migration discipline:

- never silently rewrite an already-applied migration in a shared environment;
- investigate checksum differences before `flyway repair`;
- prefer forward migrations for new structural changes;
- never use `clean` against data that must be preserved.

## 17. Security considerations

- Never commit PostgreSQL passwords, Sonar tokens or Doppler secrets.
- Context/documentation scripts must exclude `.env*` content.
- Database ports are development configuration and do not imply production exposure.
- Destructive database operations require explicit authorization and an appropriate backup strategy.
- SonarQube Community Build is used only for supported non-SQL repository artifacts.

## 18. Accepted risks and constraints

- Code coverage is not applicable to this migration/data repository.
- Application test counts are not applicable.
- SonarQube Community Build is not the primary SQL/Flyway quality gate.
- Flyway `validate` proves migration history/checksum consistency but pending SQL must still be executed before release when applicable.
- DBML, Flyway source and runtime PostgreSQL may drift and require explicit reconciliation.

## 19. Completed work

- PostgreSQL/Flyway repository structure established.
- Canonical DBML design established.
- Ordered migration flows established in Docker Compose.
- Flyway validation confirmed across all four flows.
- SonarQube Community Build integration established with server-side Quality Gate validation.
- Repository-local context, documentation and QA lifecycle scripts established.
- `sbm-db` registered in the assistant Project Registry.

## 20. Pending work

- Complete lifecycle activation for the SBM-DB enablement objective.
- Apply the resulting context synchronization package.
- Complete the documentation lifecycle after implementation/context closure when required.

## 21. Required behavior

- Preserve data by default.
- Treat Flyway history as auditable state.
- Keep application ORMs unmanaged for physical schema ownership.
- Require explicit validation before `repair`, destructive SQL or schema cleanup.
- Use suite-global context/documentation input, output and backup directories.
- Never package `.env*` values.
- Treat PostgreSQL/Flyway execution as authoritative database QA evidence.
- Keep project and global contexts synchronized through the lifecycle workflow.

## 22. Historical decisions

- SBM-DB is the physical schema authority for SBM Suite PostgreSQL data.
- Application ORM mappings consume the physical schema and do not own migrations.
- Flyway/PostgreSQL execution is the primary database quality gate.
- SonarQube Community Build is limited to supported non-SQL artifacts for this repository.

## 23. Related documentation

```text
SBM-SUITE/sbm/SBM-DB/README.md
SBM-SUITE/sbm/SBM-DB/context/QA_CONTEXT.md
SBM-SUITE/sbm/SBM-DB/context/DEPLOY_CONTEXT.md
SBM-SUITE/context/PROJECT_CONTEXT.md
SBM-SUITE/context/QA_CONTEXT.md
SBM-SUITE/context/DATA_CONTEXT.md
SBM-SUITE/context/SUITE_CONTEXT.md
```

## 24. Document boundary

This file defines the current canonical project state, ownership, architecture, runtime, validation, database impact, risks and operational objectives for SBM-DB.

It does not replace Flyway migration SQL, PostgreSQL runtime inspection, DBML, raw QA evidence, SonarQube server reports, global suite contexts or historical completed-objective records.
