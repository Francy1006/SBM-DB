# DEPLOY_CONTEXT.md

> **Last updated:** 2026-08-10
>
> **Purpose:** Canonical deployment and governed lifecycle context for SBM-DB.
>
> **Accuracy note:** This file defines repository-local database deployment behavior and how SBM-DB delegates the suite-global Context and Documentation lifecycle. It does not claim a production deployment or replace PostgreSQL backup/recovery procedures.

## 1. Scope and ownership

Canonical repository mapping:

```text
SBM-SUITE/sbm/SBM-DB/
```

Canonical runtime root:

```text
/suite/sbm/SBM-DB
```

Database execution order:

```text
postgres healthy
→ flyway_sbm_business
→ flyway_ditaly_pasta
→ flyway_cross
→ flyway_analytics
```

Standard local execution:

```bash
docker compose --env-file .env.dev up
```

Do not treat the stack as successfully migrated unless every required Flyway service completes successfully.

Flyway `repair` is not a normal deployment step. Investigate checksum differences and confirm canonical migration content before repair.

## 2. Required configuration

Local environment file:

```text
.env.dev
```

SBM-DB has no local Context or Documentation configuration or scripts. Their
configuration, execution and validation belong exclusively to
`SBM-SUITE/context`.

Sonar configuration:

```text
SONAR_HOST_URL
SONAR_TOKEN
```

Database variables are project-owned. Secret values must never be exported into context/documentation packages.

## 3. Canonical paths

From the SBM-DB repository root:

```text
../../context/input/
../../context/output/
../../context/backup/
../../context/documentation/input/
../../context/documentation/output/
context/qa-results.md
```

Canonical suite backup root:

```text
SBM-SUITE/context/backup/<timestamp>_<project>/
```

Database backups are a separate operational responsibility.

## 4. Global lifecycle ownership

The only canonical lifecycle implementations are:

```text
SBM-SUITE/context/scripts/context-deploy.sh
SBM-SUITE/context/scripts/context-upgrade.sh
SBM-SUITE/context/scripts/documentation-deploy.sh
SBM-SUITE/context/scripts/documentation-upgrade.sh
```

SBM-DB contains neither wrappers nor implementations for these workflows. It does
not implement Project Registry, lifecycle, Git evidence, QA, HTTP, payload, ZIP,
Context or Documentation reconciliation.

The canonical Project Tree implementation is:

```text
SBM-SUITE/context/scripts/project-tree.sh
```

SBM-DB has no local `project-tree.sh` and no local Project Tree consumer.

## 5. Context deploy workflow

From the `SBM-SUITE/context` root:

```bash
./scripts/context-deploy.sh sbm-db <lifecycle_phase> '<objectives-json-array>' [user_prompt]
```

Supported phases:

```text
planning-activation
implementation-progress
implementation-closure
```

All validation, evidence collection, Project Tree generation and package creation
belong to the global script.

## 6. Manual review stage

The generated context package and `SYS_PROMPT.md` are reviewed by the LLM/user workflow before any context mutation.

For `planning-activation`:

- confirm objective ID and objective text;
- preserve planned work as planned;
- do not claim implementation or closure;
- ensure project/global objective synchronization;
- ensure proposed branch complies with the lifecycle contract.

For closure:

- require fresh successful QA evidence;
- validate database/migration claims against executed evidence;
- do not infer deployment or migration success.

## 7. Context upgrade workflow

Place the reviewed archive at:

```text
../../context/input/context-upgrade.zip
```

Run from the `SBM-SUITE/context` root:

```bash
./scripts/context-upgrade.sh
```

Validate response:

```text
../../context/output/context-upgrade-response.json
```

The global workflow obtains the project from the archive manifest. It validates
`FORMAT_CONTEXT.md`, manifest authorization, target mappings and lifecycle
invariants before applying patches.

## 8. Documentation workflows

Run from the `SBM-SUITE/context` root:

```bash
./scripts/documentation-deploy.sh

./scripts/documentation-upgrade.sh
```

Documentation deploy and upgrade are suite-global and accept no project
argument. The global implementation performs multi-project reconciliation;
SBM-DB neither selects nor filters targets and does not reconcile documentation
locally.

## 9. Atomicity and cleanup

Context/documentation lifecycle updates must be applied atomically by the backend workflow.

Backups use only:

```text
SBM-SUITE/context/backup/<timestamp>_<project>/
```

Input packages are cleaned only after successful validated application according to the lifecycle script contract.

No environment-secret file may be copied into lifecycle evidence or backup metadata.

## 10. Rollback

Context/documentation rollback uses the corresponding suite backup generated before the atomic replacement.

Database rollback is separate:

- do not use `flyway clean` for rollback;
- prefer forward corrective migrations;
- restore PostgreSQL data only through an explicit database backup/recovery procedure;
- context backups do not replace PostgreSQL backups.

## 11. Validation performed

The suite-global lifecycle scripts validate, as applicable:

- backend canonical project registration;
- canonical repository mapping;
- required ZIP manifest and response fields;
- environment-file exclusion from evidence;
- required QA evidence for implementation closure;
- Docker Compose/Flyway validation through `db-validate.sh`;
- SonarScanner and server-side Quality Gate through `qa-check.sh`.

## 12. Current limitations

- SonarQube Community Build is not the primary SQL/Flyway quality gate.
- Database backup/recovery is outside the context/documentation lifecycle.
- Flyway `validate` does not prove pending migrations execute successfully; pending migrations require execution evidence when applicable.
- Lifecycle activation/closure must use context files that conform exactly to the current global `FORMAT_CONTEXT.md`.
