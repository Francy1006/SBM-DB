# QA Results

> **Generated at:** 2026-09-24T12:05:20Z
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
A more recent version of Flyway is available. Find out more about Flyway 13.8.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-50375-postgres:5432/sbm_db (PostgreSQL 16.9)
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
Successfully applied 32 migrations to schema "sbm_business", now at version v202605122319 (execution time 00:00.319s)
A more recent version of Flyway is available. Find out more about Flyway 13.8.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-50375-postgres:5432/sbm_db (PostgreSQL 16.9)
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
Successfully applied 54 migrations to schema "ditaly_pasta", now at version v202607171905 (execution time 00:00.417s)
A more recent version of Flyway is available. Find out more about Flyway 13.8.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-50375-postgres:5432/sbm_db (PostgreSQL 16.9)
Creating schema "accounting" ...
Creating Schema History table "accounting"."flyway_schema_history" ...
Current version of schema "accounting": null
Migrating schema "accounting" to version "202507041601 - CROSSDATA"
Migrating schema "accounting" to version "202507041602 - ALTER all datetime to timestamptz"
Migrating schema "accounting" to version "202507041606 - CREATE fiscal directive stats view"
Migrating schema "accounting" to version "202507041608 - CREATE accounting tables"
WARNING: DB: schema "accounting" already exists, skipping (SQL State: 42P06 - Error Code: 0)
Successfully applied 4 migrations to schema "accounting", now at version v202507041608 (execution time 00:00.049s)
A more recent version of Flyway is available. Find out more about Flyway 13.8.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-50375-postgres:5432/sbm_db (PostgreSQL 16.9)
Creating Schema History table "analytics"."flyway_schema_history" with baseline ...
Successfully baselined schema with version: 1
Current version of schema "analytics": 1
Migrating schema "analytics" to version "202507041801 - CREATE fiscal directive stats view"
WARNING: DB: schema "analytics" already exists, skipping (SQL State: 42P06 - Error Code: 0)
Successfully applied 1 migration to schema "analytics", now at version v202507041801 (execution time 00:00.012s)
Validando migraciones Flyway...
A more recent version of Flyway is available. Find out more about Flyway 13.8.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-50375-postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 33 migrations (execution time 00:00.035s)
A more recent version of Flyway is available. Find out more about Flyway 13.8.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-50375-postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 55 migrations (execution time 00:00.041s)
A more recent version of Flyway is available. Find out more about Flyway 13.8.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-50375-postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 5 migrations (execution time 00:00.028s)
A more recent version of Flyway is available. Find out more about Flyway 13.8.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-50375-postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 2 migrations (execution time 00:00.021s)
QA SBM-DB aislado completado correctamente.
```

## SonarScanner

- Exit code: 0
- Scope: Shell/YAML/secrets supported by Community Build; Flyway SQL excluded

```text
12:05:06.539 INFO  Scanner configuration file: /opt/sonar-scanner/conf/sonar-scanner.properties
12:05:06.541 INFO  Project root configuration file: /usr/src/sonar-project.properties
12:05:06.548 INFO  SonarScanner CLI 8.1.0.6389
12:05:06.550 INFO  Linux 5.15.49-linuxkit-pr aarch64
12:05:09.031 INFO  Communicating with SonarQube Community Build 26.7.0.124771
12:05:09.032 INFO  JRE provisioning: os[linux], arch[aarch64]
12:05:09.439 INFO  Starting SonarScanner Engine...
12:05:09.440 INFO  Java 21.0.9 Eclipse Adoptium (64-bit)
12:05:12.019 INFO  Load global settings
12:05:12.188 INFO  Load global settings (done) | time=169ms
12:05:12.191 INFO  Server id: 54000601-AZ-DAVF-MejkBZkEKtuI
12:05:12.209 INFO  Loading required plugins
12:05:12.210 INFO  Load plugins index
12:05:12.255 INFO  Load plugins index (done) | time=46ms
12:05:12.257 INFO  Load/download plugins
12:05:12.308 INFO  Load/download plugins (done) | time=51ms
12:05:12.523 INFO  Process project properties
12:05:12.534 INFO  Process project properties (done) | time=11ms
12:05:12.544 INFO  Project key: SBM-DB
12:05:12.544 INFO  Base dir: /usr/src
12:05:12.545 INFO  Working dir: /usr/src/.scannerwork
12:05:12.562 INFO  Load project settings for component key: 'SBM-DB'
12:05:12.580 INFO  Load project settings for component key: 'SBM-DB' (done) | time=20ms
12:05:12.598 INFO  Load quality profiles
12:05:12.642 INFO  Load quality profiles (done) | time=45ms
12:05:12.670 INFO  Load active rules
12:05:13.085 INFO  Load active rules (done) | time=413ms
12:05:13.089 INFO  Load analysis cache
12:05:13.114 INFO  Load analysis cache (404) | time=25ms
12:05:13.178 INFO  Preprocessing files...
12:05:13.222 INFO  1 language detected in 5 preprocessed files (done) | time=44ms
12:05:13.222 INFO  0 files ignored because of inclusion/exclusion patterns
12:05:13.225 INFO  1 file ignored because of scm ignore settings
12:05:13.225 INFO  Loading plugins for detected languages
12:05:13.226 INFO  Load/download plugins
12:05:13.234 INFO  Load/download plugins (done) | time=9ms
12:05:13.340 INFO  Load project repositories
12:05:13.437 INFO  Load project repositories (done) | time=97ms
12:05:13.449 INFO  Indexing files...
12:05:13.449 INFO  Project configuration:
12:05:13.452 INFO    Excluded sources: **/.git/**, **/.sonar/**, **/.scannerwork/**, **/context/**, **/flyway/**, **/dbdiagram/**
12:05:13.464 INFO  5 files indexed (done) | time=14ms
12:05:13.465 INFO  Quality profile for yaml: Sonar way
12:05:13.465 INFO  ------------- Run sensors on module SBM-DB
12:05:13.493 INFO  Load metrics repository
12:05:13.515 INFO  Load metrics repository (done) | time=22ms
12:05:13.786 INFO  Sensor IaC CloudFormation Sensor [iac]
12:05:13.797 INFO  There are no files to be analyzed for the CloudFormation language
12:05:13.797 INFO  Sensor IaC CloudFormation Sensor [iac] (done) | time=11ms
12:05:13.798 INFO  Sensor IaC cfn-lint report Sensor [iac]
12:05:13.798 INFO  Sensor IaC cfn-lint report Sensor [iac] (done) | time=0ms
12:05:13.798 INFO  Sensor IaC Kustomization Sensor [iac]
12:05:13.806 INFO  Sensor IaC Kustomization Sensor [iac] (done) | time=7ms
12:05:13.806 INFO  Sensor IaC hadolint report Sensor [iac]
12:05:13.806 INFO  Sensor IaC hadolint report Sensor [iac] (done) | time=0ms
12:05:13.806 INFO  Sensor Java Config Sensor [iac]
12:05:13.806 INFO  There are no files to be analyzed for the Java language
12:05:13.807 INFO  Sensor Java Config Sensor [iac] (done) | time=0ms
12:05:13.807 INFO  Sensor IaC Docker Sensor [iac]
12:05:13.808 INFO  There are no files to be analyzed for the Docker language
12:05:13.808 INFO  Sensor IaC Docker Sensor [iac] (done) | time=1ms
12:05:13.808 INFO  Sensor IaC Kubernetes Sensor [iac]
12:05:13.983 INFO  There are no files to be analyzed for the Kubernetes language
12:05:13.984 INFO  Sensor IaC Kubernetes Sensor [iac] (done) | time=175ms
12:05:13.984 INFO  Sensor TextAndSecretsSensor [text]
12:05:14.000 INFO  Available processors: 6
12:05:14.000 INFO  Using 6 threads for analysis.
12:05:14.167 INFO  The property "sonar.tests" is not set. To improve the analysis accuracy, we categorize a file as a test file if any of the following is true:
  * The filename starts with "test"
  * The filename contains "test." or "tests."
  * Any directory in the file path is named: "doc", "docs", "test", "tests", "mock" or "mocks"
  * Any directory in the file path has a name ending in "test" or "tests"

12:05:14.184 INFO  Start fetching files for the text and secrets analysis
12:05:14.194 INFO  Using JGit to retrieve dirty files
12:05:14.267 WARN  Thread[#32,ForkJoinPool.commonPool-worker-1,5,main]: got smaller file timestamp on /usr/src (/host_mark/Users), /usr/src/.git: 2026-09-24T12:05:14Z < 2026-09-24T12:05:14.264875904Z. Aborting measurement at resolution PT0.735124096S.
12:05:14.312 INFO  Retrieving language associated files and files included via "sonar.text.inclusions" that are tracked by git
12:05:14.313 INFO  Starting the text and secrets analysis
12:05:14.314 INFO  5 source files to be analyzed for the text and secrets analysis
12:05:14.343 INFO  5/5 source files have been analyzed for the text and secrets analysis
12:05:14.343 INFO  Skipped 1 file(s) in the secrets analysis due to automatic test file detection
12:05:14.347 INFO  Sensor TextAndSecretsSensor [text] (done) | time=363ms
12:05:14.350 INFO  ------------- Run sensors on project
12:05:14.471 INFO  Sensor JavaScript/TypeScript/CSS analysis [javascript]
12:05:14.476 INFO  No input files found for analysis
12:05:14.477 INFO  Hit the cache for 0 out of 0
12:05:14.477 INFO  Miss the cache for 0 out of 0
12:05:14.478 INFO  Sensor JavaScript/TypeScript/CSS analysis [javascript] (done) | time=5ms
12:05:14.478 INFO  Sensor IaC Project Sensor [iac]
12:05:14.478 INFO  Sensor IaC Project Sensor [iac] (done) | time=0ms
12:05:14.478 INFO  Sensor Zero Coverage Sensor
12:05:14.486 INFO  Sensor Zero Coverage Sensor (done) | time=9ms
12:05:14.486 INFO  ------------- Gather SCA dependencies on project
12:05:14.489 INFO  Dependency analysis skipped
12:05:14.492 INFO  CPD Executor Calculating CPD for 0 files
12:05:14.492 INFO  CPD Executor CPD calculation finished (done) | time=0ms
12:05:14.509 INFO  SCM revision ID '5fe367f35fc9192c6b59ea846f964195abdfd2a0'
12:05:14.622 INFO  Analysis report generated in 122ms, dir size=277.3 kB
12:05:14.697 INFO  Analysis report compressed in 75ms, zip size=28.2 kB
12:05:14.759 INFO  Analysis report uploaded in 61ms
12:05:14.761 INFO  ------------- Check Quality Gate status
12:05:14.762 INFO  Waiting for the analysis report to be processed (max 300s)
12:05:19.882 INFO  QUALITY GATE STATUS: PASSED - View details on http://host.docker.internal:9000/dashboard?id=SBM-DB
12:05:19.908 INFO  Analysis total time: 7.551 s
12:05:19.936 INFO  SonarScanner Engine completed successfully
12:05:20.010 INFO  EXECUTION SUCCESS
12:05:20.015 INFO  Total time: 13.472s
SonarScanner y Quality Gate completados correctamente.
```

## Evidence boundary

This file records only executed QA output.
It does not claim SQL static analysis, migration success, coverage, deployment or Quality Gate results that are absent from the logs.
