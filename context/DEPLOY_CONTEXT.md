# DEPLOY_CONTEXT.md

> **Last updated:** 2026-08-08
>
> **Purpose:** Canonical deployment and governed lifecycle context for SBM-DB.
>
> **Accuracy note:** This file defines repository-local deployment/lifecycle behavior. It does not claim a production deployment or replace PostgreSQL backup/recovery procedures.

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

Lifecycle configuration:

```text
DOPPLER_PROJECT=sbm-db
AI_ASSISTANT_URL
SBM_SUITE_ROOT
```

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

## 4. Context deploy workflow

```text
./scripts/context-deploy.sh <lifecycle_phase> <objective_id> [user_prompt]
→ GET /contexts/contract
→ validate canonical `sbm-db` registration
→ generate global project-tree.txt
→ collect Git and QA evidence excluding environment secrets
→ POST /contexts/export
→ generate suite-global context package
```

Supported phases:

```text
planning-activation
implementation-progress
implementation-closure
```

## 5. Manual review stage

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

## 6. Context upgrade workflow

Place the reviewed archive at:

```text
../../context/input/context-upgrade.zip
```

Run:

```bash
./scripts/context-upgrade.sh
```

Validate response:

```text
../../context/output/context-upgrade-response.json
```

The backend validates `FORMAT_CONTEXT.md`, manifest authorization, target mappings and lifecycle invariants before applying patches.

## 7. Atomicity and cleanup

Context/documentation lifecycle updates must be applied atomically by the backend workflow.

Backups use only:

```text
SBM-SUITE/context/backup/<timestamp>_<project>/
```

Input packages are cleaned only after successful validated application according to the lifecycle script contract.

No environment-secret file may be copied into lifecycle evidence or backup metadata.

## 8. Rollback

Context/documentation rollback uses the corresponding suite backup generated before the atomic replacement.

Database rollback is separate:

- do not use `flyway clean` for rollback;
- prefer forward corrective migrations;
- restore PostgreSQL data only through an explicit database backup/recovery procedure;
- context backups do not replace PostgreSQL backups.

## 9. Validation performed

Repository lifecycle scripts validate, as applicable:

- `.env.dev` existence;
- `DOPPLER_PROJECT=sbm-db`;
- backend canonical project registration;
- exact runtime/repository mapping;
- required ZIP manifest and response fields;
- environment-file exclusion from evidence;
- required QA evidence for implementation closure;
- Docker Compose/Flyway validation through `db-validate.sh`;
- SonarScanner and server-side Quality Gate through `qa-check.sh`.

## 10. Current limitations

- SonarQube Community Build is not the primary SQL/Flyway quality gate.
- Database backup/recovery is outside the context/documentation lifecycle.
- Flyway `validate` does not prove pending migrations execute successfully; pending migrations require execution evidence when applicable.
- Lifecycle activation/closure must use context files that conform exactly to the current global `FORMAT_CONTEXT.md`.
