# QA Results

> **Generated at:** 2026-09-23T20:49:40Z
>
> **Project:** SBM-DB
>
> **Overall status:** passed

## Database / Flyway validation

- Exit code: 0
- Tests collected/passed/failed: N/A (database migration repository)
- Coverage: N/A
- Coverage artifact: N/A

```text
Creando infraestructura QA aislada...
Esperando PostgreSQL temporal...
Ejecutando migraciones Flyway...
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-2195-postgres:5432/sbm_db (PostgreSQL 16.9)
Creating schema "sbm_business" ...
Creating Schema History table "sbm_business"."flyway_schema_history" ...
Current version of schema "sbm_business": null
Migrating schema "sbm_business" to version "202506151816 - init"
WARNING: DB: schema "sbm_business" already exists, skipping (SQL State: 42P06 - Error Code: 0)
Migrating schema "sbm_business" to version "202506151817 - constrains"
Migrating schema "sbm_business" to version "202506151819 - DEFAULT complementary"
+--------+
| setval |
+--------+
| 16     |
+--------+

Migrating schema "sbm_business" to version "202506161240 - USER admin"
Migrating schema "sbm_business" to version "202506161309 - DEFAULT restriction permission"
Migrating schema "sbm_business" to version "202506161422 - DEFAULT instruction"
Migrating schema "sbm_business" to version "202506302201 - USER tables"
WARNING: DB: relation "user" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "user_token" already exists, skipping (SQL State: 42P07 - Error Code: 0)
Migrating schema "sbm_business" to version "202506302202 - COMPLEMENTARY tables"
WARNING: DB: relation "menu" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "item_group" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "item_category" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "item_type" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "package_type" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "transport_type" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "measure_unit" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "provider_type" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "instruction_type" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "permission_type" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "bank_account_type" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "district" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "region" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "fiscal_directive_type" already exists, skipping (SQL State: 42P07 - Error Code: 0)
Migrating schema "sbm_business" to version "202506302203 - DOCUMENTATION security tables"
WARNING: DB: relation "restriction" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "restriction_roles" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "role_permissions" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "permission" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "role" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "instruction" already exists, skipping (SQL State: 42P07 - Error Code: 0)
Migrating schema "sbm_business" to version "202506302205 - PRICE sales tables"
Migrating schema "sbm_business" to version "202506302206 - CONSTRAINTS relationships"
Migrating schema "sbm_business" to version "202507041601 - ALTER menu table"
Migrating schema "sbm_business" to version "202507041602 - ADD new tables"
WARNING: DB: relation "bank" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "user_token" already exists, skipping (SQL State: 42P07 - Error Code: 0)
Migrating schema "sbm_business" to version "202507041603 - TRIGGER uuid franchise"
DB: trigger "franchise_before_insert" for relation "sbm_business.franchise" does not exist, skipping
Migrating schema "sbm_business" to version "202507041604 - INSERT franchise"
Migrating schema "sbm_business" to version "202507041605 - ALTER fiscal directive table"
Migrating schema "sbm_business" to version "202507041607 - ADD franchise configuration tables"
Migrating schema "sbm_business" to version "202507041608 - ADD variable formula table"
Migrating schema "sbm_business" to version "202507041610 - INSERT variable formula"
Migrating schema "sbm_business" to version "202507041616 - RENAME value column fiscal directive"
Migrating schema "sbm_business" to version "202507041621 - CREATE price type table"
+--------+
| setval |
+--------+
| 5      |
+--------+

Migrating schema "sbm_business" to version "202507041622 - CREATE branch types table"
DB: trigger "branch_types_before_insert" for relation "sbm_business.branch_types" does not exist, skipping
+--------+
| setval |
+--------+
| 5      |
+--------+

Migrating schema "sbm_business" to version "202507041630 - INSERT item category and type"
+--------+
| setval |
+--------+
| 9      |
+--------+

+--------+
| setval |
+--------+
| 6      |
+--------+

+--------+
| setval |
+--------+
| 5      |
+--------+

Migrating schema "sbm_business" to version "202507041631 - CREATE item filter classification table"
Migrating schema "sbm_business" to version "202507041631.1 - INSERT item filter classification"
+--------+
| setval |
+--------+
| 3      |
+--------+

Migrating schema "sbm_business" to version "202603092159 - ALTER menu"
Migrating schema "sbm_business" to version "202604092159 - ORDERS init"
WARNING: DB: there is already a transaction in progress (SQL State: 25001 - Error Code: 0)
DB: trigger "order_before_insert" for relation "sbm_business.order" does not exist, skipping
DB: trigger "trg_generate_order_code" for relation "sbm_business.order" does not exist, skipping
Migrating schema "sbm_business" to version "202604102159 - ORDERS details"
WARNING: DB: there is already a transaction in progress (SQL State: 25001 - Error Code: 0)
WARNING: DB: extension "uuid-ossp" already exists, skipping (SQL State: 42710 - Error Code: 0)
WARNING: DB: relation "order_code_seq" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "order" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: column "client" of relation "order" already exists, skipping (SQL State: 42701 - Error Code: 0)
+--------+
| setval |
+--------+
| 1      |
+--------+

DB: trigger "trg_order_audit_log" for relation "sbm_business.order" does not exist, skipping
WARNING: DB: relation "idx_order_code" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "idx_order_status" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "idx_order_type" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "idx_order_franchise" already exists, skipping (SQL State: 42P07 - Error Code: 0)
Migrating schema "sbm_business" to version "202604122159 - ORDERS config"
Migrating schema "sbm_business" to version "202604122259 - ORDERS formula"
Migrating schema "sbm_business" to version "202604122319 - ORDERS module config"
Migrating schema "sbm_business" to version "202605122319 - CALCULATION data type"
Successfully applied 32 migrations to schema "sbm_business", now at version v202605122319 (execution time 00:00.726s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-2195-postgres:5432/sbm_db (PostgreSQL 16.9)
Creating schema "ditaly_pasta" ...
Creating Schema History table "ditaly_pasta"."flyway_schema_history" ...
Current version of schema "ditaly_pasta": null
Migrating schema "ditaly_pasta" to version "202506151813 - init ditaly pasta"
WARNING: DB: schema "ditaly_pasta" already exists, skipping (SQL State: 42P06 - Error Code: 0)
Migrating schema "ditaly_pasta" to version "202506151816 - PRODUCT tables"
WARNING: DB: relation "catalog" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "package" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "material" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "service" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "provider" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "bank" already exists, skipping (SQL State: 42P07 - Error Code: 0)
DB: trigger "catalog_before_insert" for relation "ditaly_pasta.catalog" does not exist, skipping
DB: trigger "item_configuration_before_insert" for relation "ditaly_pasta.item_configuration" does not exist, skipping
DB: trigger "material_before_insert" for relation "ditaly_pasta.material" does not exist, skipping
DB: trigger "service_before_insert" for relation "ditaly_pasta.service" does not exist, skipping
DB: trigger "provider_before_insert" for relation "ditaly_pasta.provider" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202506151818 - TRIGGER uuid ditaly pasta"
Migrating schema "ditaly_pasta" to version "202506161601 - TRIGGER provider"
Migrating schema "ditaly_pasta" to version "202506171619 - DEFAULT catalog init"
Migrating schema "ditaly_pasta" to version "202507010031 - ADD price column to product"
Migrating schema "ditaly_pasta" to version "202507010034 - ADD price column to material"
Migrating schema "ditaly_pasta" to version "202507010035 - ADD price column to service"
Migrating schema "ditaly_pasta" to version "202507010036 - PRICE sales tables"
DB: trigger "price_fiscal_configuration_before_insert" for relation "ditaly_pasta.price_fiscal_configuration" does not exist, skipping
DB: trigger "price_before_insert" for relation "ditaly_pasta.price" does not exist, skipping
DB: trigger "fiscal_configuration_detail_before_insert" for relation "ditaly_pasta.fiscal_configuration_detail" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202507010037 - CONSTRAINTS relationships"
DB: constraint "fk_price_fiscal_configuration_formula" of relation "price_fiscal_configuration" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202507010038 - VW product simple commercial"
DB: view "vw_product_simple" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202507010039 - VW material simple commercial"
DB: view "vw_material_simple" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202507010040 - VW product simple"
Migrating schema "ditaly_pasta" to version "202507041602 - ADD fiscal tables"
WARNING: DB: relation "price_fiscal_configuration" already exists, skipping (SQL State: 42P07 - Error Code: 0)
WARNING: DB: relation "fiscal_configuration_detail" already exists, skipping (SQL State: 42P07 - Error Code: 0)
Migrating schema "ditaly_pasta" to version "202507041604 - INSERT ditaly pasta user"
Migrating schema "ditaly_pasta" to version "202507041605 - ADD franchise configuration tables"
Migrating schema "ditaly_pasta" to version "202507041606 - INSERT franchise configuration"
Migrating schema "ditaly_pasta" to version "202507041607 - INSERT franchise configuration detail"
Migrating schema "ditaly_pasta" to version "202507041610 - RENAME price fiscal configuration to price configuration"
Migrating schema "ditaly_pasta" to version "202507041611 - REORDER columns in price table"
DB: drop cascades to 2 other objects
Migrating schema "ditaly_pasta" to version "202507041612 - FINALIZE price and configuration tables"
Migrating schema "ditaly_pasta" to version "202507041613 - REORDER price configuration table"
DB: drop cascades to 2 other objects
Migrating schema "ditaly_pasta" to version "202507041614 - REORDER price configuration with code and trigger"
DB: trigger "trigger_price_configuration_before_insert" for relation "ditaly_pasta.price_configuration" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202507041615 - ALIGN price configuration FK to code"
Migrating schema "ditaly_pasta" to version "202507041615.1 - ADD price type column to price configuration"
Migrating schema "ditaly_pasta" to version "202507041616 - INSERT price configuration row"
Migrating schema "ditaly_pasta" to version "202507041617 - ALTER price code nullable"
DB: trigger "trigger_price_before_insert" for relation "ditaly_pasta.price" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202507041617.1 - ADD price type column to price configuration"
Migrating schema "ditaly_pasta" to version "202507041618 - INSERT provider row"
Migrating schema "ditaly_pasta" to version "202507041619 - ALTER price table"
Migrating schema "ditaly_pasta" to version "202507041620 - TRIGGER code price"
DB: trigger "trigger_price_before_insert" for relation "ditaly_pasta.price" does not exist, skipping
+--------+
| setval |
+--------+
| 1      |
+--------+

Migrating schema "ditaly_pasta" to version "202507041621 - INSERT additional price configuration"
+--------+
| setval |
+--------+
| 2      |
+--------+

+--------+
| setval |
+--------+
| 2      |
+--------+

Migrating schema "ditaly_pasta" to version "202507041622 - CREATE ticket table"
DB: trigger "ticket_before_insert" for relation "ditaly_pasta.ticket" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202507041623 - CREATE branches table"
DB: trigger "branches_before_insert" for relation "ditaly_pasta.branches" does not exist, skipping
+--------+
| setval |
+--------+
| 3      |
+--------+

Migrating schema "ditaly_pasta" to version "202507041624 - CREATE platform table"
DB: trigger "platform_before_insert" for relation "ditaly_pasta.platform" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202507041625 - CREATE platform detail table"
DB: trigger "platform_detail_before_insert" for relation "ditaly_pasta.platform_detail" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202507041626 - CREATE company agreements table"
DB: trigger "company_agreements_before_insert" for relation "ditaly_pasta.company_agreements" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202507041627 - CREATE agreements table"
DB: trigger "agreements_before_insert" for relation "ditaly_pasta.agreements" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202507041628 - CREATE agreement detail table"
DB: trigger "agreement_detail_before_insert" for relation "ditaly_pasta.agreement_detail" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202507041629 - ADD explicit constraints ticket"
Migrating schema "ditaly_pasta" to version "202507041632 - ADD filter classification to ticket"
Migrating schema "ditaly_pasta" to version "202507041633 - INSERT price and ticket data"
+--------+
| setval |
+--------+
| 48     |
+--------+

+--------+
| setval |
+--------+
| 48     |
+--------+

Migrating schema "ditaly_pasta" to version "202507041634 - UPDATE branches data"
Migrating schema "ditaly_pasta" to version "202507041635 - ADD quantity to item configuration detail"
WARNING: DB: column "quantity" of relation "item_configuration_detail" already exists, skipping (SQL State: 42701 - Error Code: 0)
Migrating schema "ditaly_pasta" to version "202602241916 - CREATE client tables"
WARNING: DB: extension "pgcrypto" already exists, skipping (SQL State: 42710 - Error Code: 0)
WARNING: DB: relation "status" already exists, skipping (SQL State: 42P07 - Error Code: 0)
DB: trigger "client_before_insert" for relation "ditaly_pasta.client" does not exist, skipping
DB: trigger "client_brand_before_insert" for relation "ditaly_pasta.client_brand" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202602242212 - TEST client init test"
Migrating schema "ditaly_pasta" to version "202603101805 - PRODUCTION catalog product init"
+--------+
| setval |
+--------+
| 9      |
+--------+

+--------+
| setval |
+--------+
| 1      |
+--------+

Migrating schema "ditaly_pasta" to version "202603101810 - PRODUCTION MATERIAL init"
Migrating schema "ditaly_pasta" to version "202604003212 - TRIGGER catalog"
DB: trigger "catalog_generate_sku_before_insert" for relation "ditaly_pasta.catalog" does not exist, skipping
Migrating schema "ditaly_pasta" to version "202605003212 - ORDER module"
Migrating schema "ditaly_pasta" to version "202605003213 - ORDER module config"
Migrating schema "ditaly_pasta" to version "202605003214 - CALCULATION concept configuration detail"
WARNING: DB: extension "pgcrypto" already exists, skipping (SQL State: 42710 - Error Code: 0)
Migrating schema "ditaly_pasta" to version "202606122319 - MODULE calculation detail"
Migrating schema "ditaly_pasta" to version "202607171905 - ALTER price amounts to decimal"
Successfully applied 54 migrations to schema "ditaly_pasta", now at version v202607171905 (execution time 00:00.570s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-2195-postgres:5432/sbm_db (PostgreSQL 16.9)
Creating schema "accounting" ...
Creating Schema History table "accounting"."flyway_schema_history" ...
Current version of schema "accounting": null
Migrating schema "accounting" to version "202507041601 - CROSSDATA"
Migrating schema "accounting" to version "202507041602 - ALTER all datetime to timestamptz"
Migrating schema "accounting" to version "202507041606 - CREATE fiscal directive stats view"
Migrating schema "accounting" to version "202507041608 - CREATE accounting tables"
WARNING: DB: schema "accounting" already exists, skipping (SQL State: 42P06 - Error Code: 0)
Successfully applied 4 migrations to schema "accounting", now at version v202507041608 (execution time 00:00.128s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-2195-postgres:5432/sbm_db (PostgreSQL 16.9)
Creating Schema History table "analytics"."flyway_schema_history" with baseline ...
Successfully baselined schema with version: 1
Current version of schema "analytics": 1
Migrating schema "analytics" to version "202507041801 - CREATE fiscal directive stats view"
WARNING: DB: schema "analytics" already exists, skipping (SQL State: 42P06 - Error Code: 0)
Successfully applied 1 migration to schema "analytics", now at version v202507041801 (execution time 00:00.014s)
Validando migraciones Flyway...
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-2195-postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 33 migrations (execution time 00:00.073s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-2195-postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 55 migrations (execution time 00:00.072s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-2195-postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 5 migrations (execution time 00:00.025s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-2195-postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 2 migrations (execution time 00:00.052s)
QA SBM-DB aislado completado correctamente.
```

## SonarScanner

- Exit code: 0
- Scope: Shell/YAML/secrets supported by Community Build; Flyway SQL excluded

```text
20:49:13.661 INFO  Scanner configuration file: /opt/sonar-scanner/conf/sonar-scanner.properties
20:49:13.667 INFO  Project root configuration file: /usr/src/sonar-project.properties
20:49:13.687 INFO  SonarScanner CLI 8.1.0.6389
20:49:13.699 INFO  Linux 5.15.49-linuxkit-pr aarch64
20:49:17.215 INFO  Communicating with SonarQube Community Build 26.7.0.124771
20:49:17.216 INFO  JRE provisioning: os[linux], arch[aarch64]
20:49:17.908 INFO  Starting SonarScanner Engine...
20:49:17.909 INFO  Java 21.0.9 Eclipse Adoptium (64-bit)
20:49:22.182 INFO  Load global settings
20:49:22.465 INFO  Load global settings (done) | time=287ms
20:49:22.467 INFO  Server id: 54000601-AZ-DAVF-MejkBZkEKtuI
20:49:22.474 INFO  Loading required plugins
20:49:22.475 INFO  Load plugins index
20:49:22.621 INFO  Load plugins index (done) | time=147ms
20:49:22.625 INFO  Load/download plugins
20:49:22.656 INFO  Load/download plugins (done) | time=34ms
20:49:22.862 INFO  Process project properties
20:49:22.946 INFO  Process project properties (done) | time=83ms
20:49:22.974 INFO  Project key: SBM-DB
20:49:22.974 INFO  Base dir: /usr/src
20:49:22.975 INFO  Working dir: /usr/src/.scannerwork
20:49:22.986 INFO  Load project settings for component key: 'SBM-DB'
20:49:23.059 INFO  Load project settings for component key: 'SBM-DB' (done) | time=74ms
20:49:23.083 INFO  Load quality profiles
20:49:23.337 INFO  Load quality profiles (done) | time=255ms
20:49:23.385 INFO  Load active rules
20:49:24.378 INFO  Load active rules (done) | time=988ms
20:49:24.381 INFO  Load analysis cache
20:49:24.423 INFO  Load analysis cache (404) | time=44ms
20:49:24.572 INFO  Preprocessing files...
20:49:24.814 INFO  1 language detected in 5 preprocessed files (done) | time=242ms
20:49:24.815 INFO  0 files ignored because of inclusion/exclusion patterns
20:49:24.815 INFO  1 file ignored because of scm ignore settings
20:49:24.817 INFO  Loading plugins for detected languages
20:49:24.818 INFO  Load/download plugins
20:49:24.832 INFO  Load/download plugins (done) | time=14ms
20:49:25.048 INFO  Load project repositories
20:49:25.250 INFO  Load project repositories (done) | time=205ms
20:49:25.267 INFO  Indexing files...
20:49:25.268 INFO  Project configuration:
20:49:25.268 INFO    Excluded sources: **/.git/**, **/.sonar/**, **/.scannerwork/**, **/context/**, **/flyway/**, **/dbdiagram/**
20:49:25.280 INFO  5 files indexed (done) | time=13ms
20:49:25.281 INFO  Quality profile for yaml: Sonar way
20:49:25.281 INFO  ------------- Run sensors on module SBM-DB
20:49:25.316 INFO  Load metrics repository
20:49:25.365 INFO  Load metrics repository (done) | time=49ms
20:49:25.879 INFO  Sensor IaC CloudFormation Sensor [iac]
20:49:25.902 INFO  There are no files to be analyzed for the CloudFormation language
20:49:25.903 INFO  Sensor IaC CloudFormation Sensor [iac] (done) | time=23ms
20:49:25.903 INFO  Sensor IaC cfn-lint report Sensor [iac]
20:49:25.903 INFO  Sensor IaC cfn-lint report Sensor [iac] (done) | time=0ms
20:49:25.904 INFO  Sensor IaC Kustomization Sensor [iac]
20:49:25.914 INFO  Sensor IaC Kustomization Sensor [iac] (done) | time=11ms
20:49:25.915 INFO  Sensor IaC hadolint report Sensor [iac]
20:49:25.915 INFO  Sensor IaC hadolint report Sensor [iac] (done) | time=0ms
20:49:25.915 INFO  Sensor Java Config Sensor [iac]
20:49:25.915 INFO  There are no files to be analyzed for the Java language
20:49:25.915 INFO  Sensor Java Config Sensor [iac] (done) | time=0ms
20:49:25.915 INFO  Sensor IaC Docker Sensor [iac]
20:49:25.916 INFO  There are no files to be analyzed for the Docker language
20:49:25.916 INFO  Sensor IaC Docker Sensor [iac] (done) | time=0ms
20:49:25.916 INFO  Sensor IaC Kubernetes Sensor [iac]
20:49:26.738 INFO  There are no files to be analyzed for the Kubernetes language
20:49:26.739 INFO  Sensor IaC Kubernetes Sensor [iac] (done) | time=817ms
20:49:26.740 INFO  Sensor TextAndSecretsSensor [text]
20:49:26.832 INFO  Available processors: 6
20:49:26.832 INFO  Using 6 threads for analysis.
20:49:27.176 INFO  The property "sonar.tests" is not set. To improve the analysis accuracy, we categorize a file as a test file if any of the following is true:
  * The filename starts with "test"
  * The filename contains "test." or "tests."
  * Any directory in the file path is named: "doc", "docs", "test", "tests", "mock" or "mocks"
  * Any directory in the file path has a name ending in "test" or "tests"

20:49:27.203 INFO  Start fetching files for the text and secrets analysis
20:49:27.215 INFO  Using JGit to retrieve dirty files
20:49:27.483 WARN  Thread[#32,ForkJoinPool.commonPool-worker-1,5,main]: got smaller file timestamp on /usr/src (/host_mark/Users), /usr/src/.git: 2026-09-23T20:49:27Z < 2026-09-23T20:49:27.472435286Z. Aborting measurement at resolution PT0.527564714S.
20:49:27.667 INFO  Retrieving language associated files and files included via "sonar.text.inclusions" that are tracked by git
20:49:27.668 INFO  Starting the text and secrets analysis
20:49:27.669 INFO  5 source files to be analyzed for the text and secrets analysis
20:49:27.735 INFO  5/5 source files have been analyzed for the text and secrets analysis
20:49:27.735 INFO  Skipped 1 file(s) in the secrets analysis due to automatic test file detection
20:49:27.744 INFO  Sensor TextAndSecretsSensor [text] (done) | time=1009ms
20:49:27.746 INFO  ------------- Run sensors on project
20:49:27.987 INFO  Sensor JavaScript/TypeScript/CSS analysis [javascript]
20:49:27.990 INFO  No input files found for analysis
20:49:27.991 INFO  Hit the cache for 0 out of 0
20:49:27.991 INFO  Miss the cache for 0 out of 0
20:49:27.991 INFO  Sensor JavaScript/TypeScript/CSS analysis [javascript] (done) | time=5ms
20:49:27.991 INFO  Sensor IaC Project Sensor [iac]
20:49:27.994 INFO  Sensor IaC Project Sensor [iac] (done) | time=0ms
20:49:27.994 INFO  Sensor Zero Coverage Sensor
20:49:27.994 INFO  Sensor Zero Coverage Sensor (done) | time=1ms
20:49:27.995 INFO  ------------- Gather SCA dependencies on project
20:49:27.997 INFO  Dependency analysis skipped
20:49:28.003 INFO  CPD Executor Calculating CPD for 0 files
20:49:28.003 INFO  CPD Executor CPD calculation finished (done) | time=0ms
20:49:28.019 INFO  SCM revision ID 'a0d18bae544ab851448ba7ca8cd236ab0f474b43'
20:49:28.107 INFO  Analysis report generated in 96ms, dir size=277.3 kB
20:49:28.177 INFO  Analysis report compressed in 69ms, zip size=28.2 kB
20:49:28.343 INFO  Analysis report uploaded in 166ms
20:49:28.350 INFO  ------------- Check Quality Gate status
20:49:28.350 INFO  Waiting for the analysis report to be processed (max 300s)
20:49:38.649 INFO  QUALITY GATE STATUS: PASSED - View details on http://host.docker.internal:9000/dashboard?id=SBM-DB
20:49:38.717 INFO  Analysis total time: 16.018 s
20:49:38.731 INFO  SonarScanner Engine completed successfully
20:49:39.088 INFO  EXECUTION SUCCESS
20:49:39.189 INFO  Total time: 25.433s
SonarScanner y Quality Gate completados correctamente.
```

## Evidence boundary

This file records only executed QA output.
It does not claim SQL static analysis, migration success, coverage, deployment or Quality Gate results that are absent from the logs.
