```text
                                                       █──▄────▄▄▄▄▄▄▄────▄───
                                                       █─▀▀▄─▄█████████▄─▄▀▀──
                                                       █─────██─▀███▀─██──────
                                                       █───▄─▀████▀████▀─▄────
                                                       █─▀█────██▀█▀██────█▀──
        ▄████▄   ▒█████   ███▄    █  ██ ██░██████ ▄▄▄  █
       ▒██▀ ▀█  ▒██▒  ██▒ ██ ▀█   █  ██ █░ ▓█   ▀▒████▄█
       ▒▓█    ▄ ▒██░  ██▒ ██  ▀█ █▒  ████░ ▒███  ▒██   █▄
       ▒▓▓▄ ▄██ ▒██   ██░ ██▒  ▐▌█▒  ██ █▄ ▒▓█  ▄░████████
       ▒ ▓███▀ ░░ ████▓▒  ██░   ▓█░  █▒ ██▄░▒████▒▓█  █▒
       ░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒  ▒▒ ▓▒░░ ▒░ ░▒▒   ▓▒█░
         ░  ▒     ░ ▒ ▒░ ░ ░░   ░ ▒  ░▒ ▒░ ░ ░  ░ ▒   ▒▒ ░
       ░        ░ ░ ░ ▒     ░   ░ ░ ░ ░░ ░    ░    ░   ▒
       ░ ░          ░ ░           ░ ░  ░      ░  ░     ░  ░
       ░
       ▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄
      █ ▄▄▄ █ ▀▀ ▄▀ ▀▄▀ █ ▄▄▄ █ ▄▀ ▀▄▀ █ ▄▄▄ █ ▄▄▄ █ ▀▀ ▄▀ ▀▄
      █ ███ █ ▀ ▀▄█ ▄ ▀ █ ███ █ ▀▄█ ▄ ▀ █ ███ █ ███ █ ▀ ▀▄█ ▄
      █▄▄▄█ █ █▄▀ █ ▀█ █ █▄▄▄█ █▄▀ █ ▀█ █▄▄▄█ █▄▄▄█ █ █▄▀ █ ▀
      ▄▄▄▄▄▄█ ▀▄█▄▀ ▀ █▄█▄▄▄▄▄█ ▀▄█▄▀ ▀ █▄▄▄▄▄█▄▄▄▄▄█ ▀▄█▄▀ ▀

    █████████████████████████████████████████████████████████████████
    ██  ║                                                       ║  ██
    ██  ║               ░▒▓ SBM - DB ▓▒░                        ║  ██
    ██  ║                                                       ║  ██
    ██  ║    ┌─────────────────────────────────────────────┐    ║  ██
    ██  ║    │  > PostgreSQL database for SBM Suite        │    ║  ██
    ██  ║    │  > Versioned schema evolution with Flyway   │    ║  ██
    ██  ║    │  > Shared and brand-owned business schemas  │    ║  ██
    ██  ║    │  > Canonical structure documented in DBML   │    ║  ██
    ██  ║    │  > STATUS: ACTIVE / IN DEVELOPMENT          │    ║  ██
    ██  ║    └─────────────────────────────────────────────┘    ║  ██
    ██  ║                                                       ║  ██
    ██  ║         ░▒▓ DATABASE DOMAIN ACCESS GRANTED ▓▒░        ║  ██
    ██  ║                                                       ║  ██
    ██  ╚═══════════════════════════════════════════════════════╝  ██
    ██                                                             ██
    █████████████████████████████████████████████████████████████████
```

# SBM-DB

PostgreSQL database definition and migration repository for **SBM Suite**.

`sbm-db` owns the physical database structure shared by `dp-api`, `sbm-api`
and other authorized SBM services. It centralizes the canonical DBML model,
versioned Flyway migrations, schema dependencies and the local PostgreSQL
runtime.

## Role within SBM Suite

```text
DBML design
→ versioned Flyway migration
→ PostgreSQL schemas
→ DP-API / SBM-API / authorized services
```

`sbm-db` is the database ownership boundary. Application repositories consume
its schemas but do not create or evolve business tables through framework
migrations.

```text
Physical database structure  → sbm-db
Client business operations   → dp-api
Platform administration      → sbm-api
```

The physical schema containing a table does not by itself determine which API
may operate it. API ownership and authorization are defined by business rules;
schema ownership and evolution remain in this repository.

## Current status

- Active repository.
- PostgreSQL 16 and Flyway 10 are the configured major image tags; patch
  versions are not pinned.
- Schema evolution managed by Flyway 10.
- Ordered migration flows for `sbm_business`, `ditaly_pasta`, cross-schema
  dependencies and analytics.
- 91 versioned SQL files available: 32 `sbm_business`, 54 `ditaly_pasta`,
  4 `cross` and 1 `analytics`.
- Persistent PostgreSQL volume for local development.
- Shared external Docker network for SBM Suite services.
- Canonical high-level structure maintained in
  `dbdiagram/SBM-business.dbml`.
- The current deployed state was not verified in this documentation pass:
  Docker socket access was unavailable.
- A clean bootstrap is not currently proven: cross and analytics have known
  blockers documented below.

## Technology stack

- PostgreSQL 16
- Flyway 10
- SQL
- DBML
- Docker
- Docker Compose

## Main schemas

| Schema | Responsibility |
|---|---|
| `sbm_business` | Shared platform definitions, users, authorization, franchises, classifications, fiscal directives, formulas, calculations and orders |
| `ditaly_pasta` | Ditaly Pasta operational data, including products, materials, services, catalogs, providers, prices, branches, tickets, clients, marketing, content and events |
| `accounting` | Implemented by a cross migration; its DBML tables currently lack an explicit schema qualifier |
| `analytics` | Implemented by Flyway only; absent from the canonical DBML |

`cross` is a Flyway migration flow, not a business schema. It owns changes
that require more than one schema or establish cross-schema structures such as
the accounting model.

## Architecture

The repository separates structural design, schema evolution and deployed
state:

```text
dbdiagram/SBM-business.dbml
        ↓
flyway/sql/<migration-flow>/V...__description.sql
        ↓
Flyway validation and ordered execution
        ↓
PostgreSQL
├── sbm_business
├── ditaly_pasta
├── accounting
└── analytics
        ↓
Unmanaged ORM mappings and authorized consumers
```

The DBML file is the canonical structural design. Flyway migrations implement
its evolution, while a PostgreSQL instance proves which migrations have
actually been applied. These three views must be compared when diagnosing
drift.

```text
Design target        → dbdiagram/SBM-business.dbml
Available evolution  → flyway/sql/**/V...__*.sql
Applied history      → <schema>.flyway_schema_history
Effective structure  → PostgreSQL catalogs/information_schema
Historical context   → README.md, PROJECT_CONTEXT.md and command.md
```

A migration file being present does not prove it was applied. Historical
runtime observations in `PROJECT_CONTEXT.md` are explicitly labeled and must
be revalidated against the target instance.

Application ORM mappings must follow the database and remain unmanaged where
the consuming framework supports that distinction. Updating an ORM model does
not update PostgreSQL.

## Migration flows

Docker Compose enforces this execution order:

```text
postgres (healthy)
        ↓
flyway_sbm_business
        ↓
flyway_ditaly_pasta
        ↓
flyway_cross
        ↓
flyway_analytics
```

| Flow | Directory | Purpose |
|---|---|---|
| `flyway_sbm_business` | `flyway/sql/sbm_business/` | Shared and platform-level structures required by downstream schemas |
| `flyway_ditaly_pasta` | `flyway/sql/ditaly_pasta/` | Brand-specific operational structures and references to shared definitions |
| `flyway_cross` | `flyway/sql/cross/` | Cross-schema constraints, normalization and accounting structures |
| `flyway_analytics` | `flyway/sql/analytics/` | Analytics schema and reporting views, executed after operational migrations |

Known bootstrap blockers:

- The cross view migration selects `fiscal_directive.percentage`, but the
  preceding shared flow has already renamed that column to `value`.
- Compose mounts analytics files at `/flyway/sql`, while its configuration
  searches `/flyway/sql/analytics`; the migration may not be discovered.
- `validateOnMigrate=false` is configured for cross and analytics.

Resolve and verify these issues before treating `docker compose up` as a
successful full migration path.

Versioned migrations use the Flyway convention:

```text
V<version>__<DESCRIPTION>.sql
```

Example:

```text
V202607171905__ALTER_price_amounts_to_decimal.sql
```

Never modify a migration that has already been applied to a shared or
production database. Add a new migration with a unique, increasing version.

## Database boundaries

### Shared business schema

`sbm_business` contains reusable definitions and platform-level records. Its
current domains include:

- franchises and franchise states;
- users, tokens, roles, permissions and restrictions;
- item groups, categories, types and classifications;
- banks, regions, districts, units and provider types;
- fiscal directives and fiscal document types;
- formula types, variable formulas and calculation concepts;
- modules, statuses, orders and order details.

### Ditaly Pasta schema

`ditaly_pasta` contains operational records owned by the Ditaly Pasta business
domain. Its current domains include:

- products, materials, services and catalogs;
- item and module calculation configuration;
- providers and commercial relationships;
- prices and price configurations;
- branches, platforms and agreements;
- tickets and clients;
- campaigns, content, stakeholders and events.

Price amount fields are defined as `DECIMAL(14,2)` in the canonical DBML,
including `base_net_amount`, `net_amount`, `gross_amount`, `iva_amount`,
`aditional_tax_amount` and `retention_amount`.

Historical prices must not be deleted. A recalculation creates a new current
price and preserves earlier records linked to their record item and record
type.

Price business invariants:

- `base_net_amount` is the sole editable monetary input.
- `net_amount`, `gross_amount`, `iva_amount`, `aditional_tax_amount` and
  `retention_amount` are calculated outputs.
- Calculations use the Price configuration and its variable formula; tax is
  configurable and must never be hardcoded globally as 19%.
- Preserve decimal precision through intermediate operations and round only
  the final persisted values to two decimal places.
- One Price belongs to one logical item. An item may have historical Prices,
  but only one current Price.
- A new Price deactivates the old one; normal operations never delete price
  history.
- `record_item_code` plus `price_record_type` is the polymorphic historical
  relation. The inspected design/scripts do not enforce its target or current
  uniqueness with a physical FK/partial unique index.

The canonical DBML declares all six amounts as `DECIMAL(14,2)`. The available
migration `V202607171905__ALTER_price_amounts_to_decimal.sql` performs that
conversion, but its presence does not prove it has been applied.

### Cross-schema and analytical structures

Cross-schema migrations run only after both main business flows complete. They
may create structures such as `accounting` or references between domains.

Analytics migrations run last and create reporting structures such as
`analytics.fiscal_directive_stats`. Analytical views must not become the
source of truth for transactional data.

## Local development

### Requirements

- Docker
- Docker Compose
- An environment file with the required PostgreSQL and Flyway variables
- Existing external Docker network:

```bash
docker network inspect sbm-network
docker network create sbm-network
```

Run `create` only when `inspect` confirms that the network does not exist.

### Environment

The repository currently provides `.env.dev` and `.env.prod`. Do not commit or
publish real credentials.

Main variables:

```text
POSTGRES_HOST
POSTGRES_PORT
POSTGRES_INTERNAL_PORT
POSTGRES_DB
POSTGRES_USER
POSTGRES_PASSWORD
FLYWAY_USER
FLYWAY_PASSWORD
FLYWAY_SBM_BUSINESS_SCHEMAS
FLYWAY_DITALY_PASTA_SCHEMAS
FLYWAY_CROSS_SCHEMAS
FLYWAY_ANALYTICS_SCHEMAS
DOPPLER_PROJECT
DOPPLER_CONFIG
DOPPLER_ENVIRONMENT
```

Inside the Compose network, `POSTGRES_HOST` normally resolves to the
`postgres` service. The flow configurations are not uniform: the two main
flows receive the internal port through the Compose environment, while cross
references `POSTGRES_INTERNAL_PORT` directly. Verify rendered configuration
with `docker compose --env-file .env.dev config` without publishing its output,
because it can contain resolved credentials.

### Start the database

Compose is designed to start PostgreSQL and run every Flyway flow in dependency
order:

```bash
docker compose --env-file .env.dev up -d
```

Do not use that as proof of a successful bootstrap. Inspect exit codes and
logs, and resolve the cross/analytics blockers described above. For controlled
diagnosis, start PostgreSQL first:

Start only PostgreSQL when migrations should not run automatically:

```bash
docker compose --env-file .env.dev up -d postgres
```

Run migration flows explicitly:

```bash
docker compose --env-file .env.dev run --rm flyway_sbm_business -configFiles=/flyway/conf/flyway.conf migrate
docker compose --env-file .env.dev run --rm flyway_ditaly_pasta -configFiles=/flyway/conf/flyway.conf migrate
docker compose --env-file .env.dev run --rm flyway_cross -configFiles=/flyway/conf/flyway.conf migrate
docker compose --env-file .env.dev run --rm flyway_analytics -configFiles=/flyway/conf/flyway.conf migrate
```

Execute them only after `info` and `validate`, and stop on the first failure.
The Flyway services use `restart: on-failure`, so a persistent error can cause
restart loops when started through Compose.

### Validate containers

```bash
docker compose --env-file .env.dev ps -a
```

The Flyway containers are one-shot services. A successful migration container
is expected to finish with exit code `0` rather than remain running.

### View logs

```bash
docker compose --env-file .env.dev logs postgres
docker compose --env-file .env.dev logs flyway_sbm_business
docker compose --env-file .env.dev logs flyway_ditaly_pasta
docker compose --env-file .env.dev logs flyway_cross
docker compose --env-file .env.dev logs flyway_analytics
```

## Local connection

Use the values configured in the selected environment file:

```text
Host:     localhost
Port:     ${POSTGRES_PORT}
Database: ${POSTGRES_DB}
User:     ${POSTGRES_USER}
Password: ${POSTGRES_PASSWORD}
```

Containers attached to `sbm-network` connect with `POSTGRES_HOST` and
`POSTGRES_INTERNAL_PORT` instead of the host-mapped address.

Open `psql` using variables already present inside the container:

```bash
docker compose --env-file .env.dev exec postgres sh -lc 'psql -U "$POSTGRES_USER" -d "$POSTGRES_DB"'
```

Recommended search path for consumers that use both business schemas:

```sql
SET search_path TO ditaly_pasta, sbm_business, public;
```

Prefer schema-qualified table names in migrations, views and cross-schema
queries.

## Access control

Database credentials grant infrastructure access; they do not replace
application authorization.

- Applications must enforce tenant, franchise, role and module scope.
- Client operations must pass through `dp-api` or another authorized service.
- Platform-level operations remain behind `sbm-api` or controlled tooling.
- AI integrations must never connect directly to business tables.
- Production roles should receive only the privileges they require.

## Database management

Flyway owns business schema evolution. Framework-generated migrations must not
create, alter or delete SBM business tables.

Inspect migration status:

```bash
docker compose --env-file .env.dev run --rm flyway_sbm_business \
  -configFiles=/flyway/conf/flyway.conf info
```

Validate applied migrations:

```bash
docker compose --env-file .env.dev run --rm flyway_sbm_business \
  -configFiles=/flyway/conf/flyway.conf validate
```

Replace `flyway_sbm_business` with the target flow as needed.

Repeat both commands for all four services. A successful `validate` checks
known migration checksums/naming but does not prove that every SQL statement
will work on a fresh or data-bearing database.

Inspect applied history in each configured history schema, for example:

```sql
SELECT installed_rank, version, description, script, checksum,
       installed_on, success
FROM ditaly_pasta.flyway_schema_history
ORDER BY installed_rank;
```

Before adding a structural change:

1. Confirm the business invariant.
2. Update `dbdiagram/SBM-business.dbml` with the intended structure.
3. Add a new versioned migration in the owning flow.
4. Apply it to a disposable or development database.
5. Inspect `flyway_schema_history` and the resulting PostgreSQL objects.
6. Run dependent API and integration tests.
7. Update unmanaged ORM mappings and documentation.

Do not use `flyway clean`, drop schemas or delete the PostgreSQL volume unless
the target has been explicitly verified as disposable. Although some current
Flyway configurations permit `clean`, that is not authorization to run it.

## Service integration

Expected application flow:

```text
Client / internal operator / AI channel
→ authorized API
→ validated domain operation
→ PostgreSQL transaction
→ operational or analytical result
```

Consumers must not duplicate schema evolution, bypass domain validation or
write directly to reporting views.

## Project documentation

- `README.md`: project overview and developer entry point.
- `PROJECT_CONTEXT.md`: exhaustive architecture, inventories, invariants,
  known drift and operational guardrails.
- `dbdiagram/SBM-business.dbml`: canonical high-level database structure.
- `flyway/flyway.conf`: shared Flyway configuration reference.
- `flyway/sql/*/flyway.conf`: flow-specific Flyway configuration.
- `flyway/sql/*/V...__*.sql`: versioned physical schema evolution.

`command.md` is historical and contains legacy MySQL/incomplete instructions;
it is not an operational source of truth. The shared `flyway/flyway.conf` is
also not mounted by the Compose services: use the per-flow configurations for
runtime analysis.

Keep documentation synchronized with DBML and new migrations. When they do not
match a deployed instance, inspect `flyway_schema_history` before assuming the
instance is current.

## Security notes

- Never commit environment files containing real credentials.
- Rotate credentials that have been exposed outside their intended
  environment.
- Do not expose PostgreSQL publicly in production without strict network
  controls.
- Use separate least-privilege roles for applications, migrations and
  operators.
- Back up the database before high-risk production migrations.
- Validate restore procedures, not only backup creation.
- Review cross-schema foreign keys and migration order before deployment.
- Never delete historical price records.

## Known risks and debt

- Cross bootstrap references the renamed fiscal column `percentage` instead
  of `value`.
- Analytics has a mounted-path/`flyway.locations` mismatch.
- Every flow currently has `cleanDisabled=false`; never interpret that setting
  as permission to run `clean`.
- Cross and analytics disable `validateOnMigrate`.
- A `TEST` seed is in the normal Ditaly migration location and is therefore
  not environment-isolated.
- A migration named `PRODUCTION_catalog_product_init` performs broad deletes;
  historical price deletion conflicts with the current Price invariant.
- Several older migrations use `DROP TABLE ... CASCADE`, hard-coded seeds,
  unqualified object names or non-idempotent inserts.
- DBML and SQL differ in accounting qualification, fiscal/configuration field
  names, branches JSON type, legacy `product.gross_price`, order fields and
  coverage of marketing/analytics objects.
- Seeded Price/Ticket data includes record-type/configuration mismatches and
  cannot be used as evidence of current business integrity.
- Seed SQL contains identity/contact-like fixture data; review and sanitize it
  before sharing repository extracts.

See `PROJECT_CONTEXT.md` for exact migration inventory and detailed evidence.

## License

Private portfolio and development project unless a separate license is added.

---

```text
Signed by CONKER
SBM Suite
```
