# QA Results

> **Generated at:** 2026-09-23T20:24:39Z
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
Database: jdbc:postgresql://sbm-db-qa-49068-postgres:5432/sbm_db (PostgreSQL 16.9)
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
Successfully applied 32 migrations to schema "sbm_business", now at version v202605122319 (execution time 00:00.325s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-49068-postgres:5432/sbm_db (PostgreSQL 16.9)
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
Successfully applied 54 migrations to schema "ditaly_pasta", now at version v202607171905 (execution time 00:00.469s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-49068-postgres:5432/sbm_db (PostgreSQL 16.9)
Creating schema "accounting" ...
Creating Schema History table "accounting"."flyway_schema_history" ...
Current version of schema "accounting": null
Migrating schema "accounting" to version "202507041601 - CROSSDATA"
Migrating schema "accounting" to version "202507041602 - ALTER all datetime to timestamptz"
Migrating schema "accounting" to version "202507041606 - CREATE fiscal directive stats view"
Migrating schema "accounting" to version "202507041608 - CREATE accounting tables"
WARNING: DB: schema "accounting" already exists, skipping (SQL State: 42P06 - Error Code: 0)
Successfully applied 4 migrations to schema "accounting", now at version v202507041608 (execution time 00:00.051s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-49068-postgres:5432/sbm_db (PostgreSQL 16.9)
Creating Schema History table "analytics"."flyway_schema_history" with baseline ...
Successfully baselined schema with version: 1
Current version of schema "analytics": 1
Migrating schema "analytics" to version "202507041801 - CREATE fiscal directive stats view"
WARNING: DB: schema "analytics" already exists, skipping (SQL State: 42P06 - Error Code: 0)
Successfully applied 1 migration to schema "analytics", now at version v202507041801 (execution time 00:00.007s)
Validando migraciones Flyway...
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-49068-postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 33 migrations (execution time 00:00.045s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-49068-postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 55 migrations (execution time 00:00.080s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-49068-postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 5 migrations (execution time 00:00.025s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-49068-postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 2 migrations (execution time 00:00.021s)
QA SBM-DB aislado completado correctamente.
```

## SonarScanner

- Exit code: 0
- Scope: Shell/YAML/secrets supported by Community Build; Flyway SQL excluded

```text
20:24:20.857 INFO  Scanner configuration file: /opt/sonar-scanner/conf/sonar-scanner.properties
20:24:20.863 INFO  Project root configuration file: /usr/src/sonar-project.properties
20:24:20.874 INFO  SonarScanner CLI 8.1.0.6389
20:24:20.881 INFO  Linux 5.15.49-linuxkit-pr aarch64
20:24:23.776 INFO  Communicating with SonarQube Community Build 26.7.0.124771
20:24:23.784 INFO  JRE provisioning: os[linux], arch[aarch64]
20:24:24.659 INFO  Starting SonarScanner Engine...
20:24:24.659 INFO  Java 21.0.9 Eclipse Adoptium (64-bit)
20:24:27.910 INFO  Load global settings
20:24:28.056 INFO  Load global settings (done) | time=148ms
20:24:28.058 INFO  Server id: 54000601-AZ-DAVF-MejkBZkEKtuI
20:24:28.066 INFO  Loading required plugins
20:24:28.066 INFO  Load plugins index
20:24:28.112 INFO  Load plugins index (done) | time=46ms
20:24:28.114 INFO  Load/download plugins
20:24:28.141 INFO  Load/download plugins (done) | time=28ms
20:24:28.344 INFO  Process project properties
20:24:28.385 INFO  Process project properties (done) | time=40ms
20:24:28.450 INFO  Project key: SBM-DB
20:24:28.450 INFO  Base dir: /usr/src
20:24:28.450 INFO  Working dir: /usr/src/.scannerwork
20:24:28.475 INFO  Load project settings for component key: 'SBM-DB'
20:24:28.518 INFO  Load project settings for component key: 'SBM-DB' (done) | time=43ms
20:24:28.560 INFO  Load quality profiles
20:24:28.656 INFO  Load quality profiles (done) | time=95ms
20:24:28.780 INFO  Load active rules
20:24:29.274 INFO  Load active rules (done) | time=487ms
20:24:29.278 INFO  Load analysis cache
20:24:29.726 INFO  Load analysis cache (404) | time=446ms
20:24:29.863 INFO  Preprocessing files...
20:24:29.919 INFO  1 language detected in 5 preprocessed files (done) | time=57ms
20:24:29.920 INFO  0 files ignored because of inclusion/exclusion patterns
20:24:29.921 INFO  1 file ignored because of scm ignore settings
20:24:29.921 INFO  Loading plugins for detected languages
20:24:29.922 INFO  Load/download plugins
20:24:29.941 INFO  Load/download plugins (done) | time=20ms
20:24:30.242 INFO  Load project repositories
20:24:30.530 INFO  Load project repositories (done) | time=291ms
20:24:30.555 INFO  Indexing files...
20:24:30.555 INFO  Project configuration:
20:24:30.557 INFO    Excluded sources: **/.git/**, **/.sonar/**, **/.scannerwork/**, **/context/**, **/flyway/**, **/dbdiagram/**
20:24:30.577 INFO  5 files indexed (done) | time=23ms
20:24:30.579 INFO  Quality profile for yaml: Sonar way
20:24:30.579 INFO  ------------- Run sensors on module SBM-DB
20:24:30.606 INFO  Load metrics repository
20:24:30.629 INFO  Load metrics repository (done) | time=23ms
20:24:30.981 INFO  Sensor IaC CloudFormation Sensor [iac]
20:24:31.005 INFO  There are no files to be analyzed for the CloudFormation language
20:24:31.006 INFO  Sensor IaC CloudFormation Sensor [iac] (done) | time=24ms
20:24:31.006 INFO  Sensor IaC cfn-lint report Sensor [iac]
20:24:31.006 INFO  Sensor IaC cfn-lint report Sensor [iac] (done) | time=0ms
20:24:31.006 INFO  Sensor IaC Kustomization Sensor [iac]
20:24:31.020 INFO  Sensor IaC Kustomization Sensor [iac] (done) | time=14ms
20:24:31.021 INFO  Sensor IaC hadolint report Sensor [iac]
20:24:31.021 INFO  Sensor IaC hadolint report Sensor [iac] (done) | time=0ms
20:24:31.021 INFO  Sensor Java Config Sensor [iac]
20:24:31.021 INFO  There are no files to be analyzed for the Java language
20:24:31.021 INFO  Sensor Java Config Sensor [iac] (done) | time=0ms
20:24:31.021 INFO  Sensor IaC Docker Sensor [iac]
20:24:31.022 INFO  There are no files to be analyzed for the Docker language
20:24:31.022 INFO  Sensor IaC Docker Sensor [iac] (done) | time=0ms
20:24:31.023 INFO  Sensor IaC Kubernetes Sensor [iac]
20:24:31.439 INFO  There are no files to be analyzed for the Kubernetes language
20:24:31.440 INFO  Sensor IaC Kubernetes Sensor [iac] (done) | time=416ms
20:24:31.441 INFO  Sensor TextAndSecretsSensor [text]
20:24:31.465 INFO  Available processors: 6
20:24:31.466 INFO  Using 6 threads for analysis.
20:24:31.668 INFO  The property "sonar.tests" is not set. To improve the analysis accuracy, we categorize a file as a test file if any of the following is true:
  * The filename starts with "test"
  * The filename contains "test." or "tests."
  * Any directory in the file path is named: "doc", "docs", "test", "tests", "mock" or "mocks"
  * Any directory in the file path has a name ending in "test" or "tests"

20:24:31.690 INFO  Start fetching files for the text and secrets analysis
20:24:31.706 INFO  Using JGit to retrieve dirty files
20:24:31.832 WARN  Thread[#32,ForkJoinPool.commonPool-worker-1,5,main]: got smaller file timestamp on /usr/src (/host_mark/Users), /usr/src/.git: 2026-09-23T20:24:31Z < 2026-09-23T20:24:31.828766313Z. Aborting measurement at resolution PT0.171233687S.
20:24:31.921 INFO  Retrieving language associated files and files included via "sonar.text.inclusions" that are tracked by git
20:24:31.922 INFO  Starting the text and secrets analysis
20:24:31.928 INFO  4 source files to be analyzed for the text and secrets analysis
20:24:31.978 INFO  4/4 source files have been analyzed for the text and secrets analysis
20:24:31.979 INFO  Skipped 1 file(s) in the secrets analysis due to automatic test file detection
20:24:31.983 INFO  1 file is ignored because it is untracked by git or has been modified
20:24:31.986 INFO  Sensor TextAndSecretsSensor [text] (done) | time=548ms
20:24:31.989 INFO  ------------- Run sensors on project
20:24:32.343 INFO  Sensor JavaScript/TypeScript/CSS analysis [javascript]
20:24:32.349 INFO  No input files found for analysis
20:24:32.350 INFO  Hit the cache for 0 out of 0
20:24:32.351 INFO  Miss the cache for 0 out of 0
20:24:32.352 INFO  Sensor JavaScript/TypeScript/CSS analysis [javascript] (done) | time=12ms
20:24:32.356 INFO  Sensor IaC Project Sensor [iac]
20:24:32.357 INFO  Sensor IaC Project Sensor [iac] (done) | time=1ms
20:24:32.357 INFO  Sensor Zero Coverage Sensor
20:24:32.358 INFO  Sensor Zero Coverage Sensor (done) | time=2ms
20:24:32.359 INFO  ------------- Gather SCA dependencies on project
20:24:32.373 INFO  Dependency analysis skipped
20:24:32.380 INFO  CPD Executor Calculating CPD for 0 files
20:24:32.381 INFO  CPD Executor CPD calculation finished (done) | time=0ms
20:24:32.394 INFO  SCM revision ID '7966221982c8a9d7418407a4642c7b7362c5bfc7'
20:24:32.526 INFO  Analysis report generated in 138ms, dir size=277.3 kB
20:24:32.599 INFO  Analysis report compressed in 73ms, zip size=28.2 kB
20:24:32.673 INFO  Analysis report uploaded in 74ms
20:24:32.675 INFO  ------------- Check Quality Gate status
20:24:32.675 INFO  Waiting for the analysis report to be processed (max 300s)
20:24:37.802 INFO  QUALITY GATE STATUS: PASSED - View details on http://host.docker.internal:9000/dashboard?id=SBM-DB
20:24:37.889 INFO  Analysis total time: 9.692 s
20:24:37.900 INFO  SonarScanner Engine completed successfully
20:24:38.210 INFO  EXECUTION SUCCESS
20:24:38.230 INFO  Total time: 17.356s
SonarScanner y Quality Gate completados correctamente.
```

## Evidence boundary

This file records only executed QA output.
It does not claim SQL static analysis, migration success, coverage, deployment or Quality Gate results that are absent from the logs.
