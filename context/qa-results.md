# QA Results

> **Generated at:** 2026-09-22T17:47:16Z
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
Database: jdbc:postgresql://sbm-db-qa-9607-postgres:5432/sbm_db (PostgreSQL 16.15)
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
Successfully applied 32 migrations to schema "sbm_business", now at version v202605122319 (execution time 00:01.005s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-9607-postgres:5432/sbm_db (PostgreSQL 16.15)
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
Successfully applied 54 migrations to schema "ditaly_pasta", now at version v202607171905 (execution time 00:01.478s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-9607-postgres:5432/sbm_db (PostgreSQL 16.15)
Creating schema "accounting" ...
Creating Schema History table "accounting"."flyway_schema_history" ...
Current version of schema "accounting": null
Migrating schema "accounting" to version "202507041601 - CROSSDATA"
Migrating schema "accounting" to version "202507041602 - ALTER all datetime to timestamptz"
Migrating schema "accounting" to version "202507041606 - CREATE fiscal directive stats view"
Migrating schema "accounting" to version "202507041608 - CREATE accounting tables"
WARNING: DB: schema "accounting" already exists, skipping (SQL State: 42P06 - Error Code: 0)
Successfully applied 4 migrations to schema "accounting", now at version v202507041608 (execution time 00:00.178s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-9607-postgres:5432/sbm_db (PostgreSQL 16.15)
Creating Schema History table "analytics"."flyway_schema_history" with baseline ...
Successfully baselined schema with version: 1
Current version of schema "analytics": 1
Migrating schema "analytics" to version "202507041801 - CREATE fiscal directive stats view"
WARNING: DB: schema "analytics" already exists, skipping (SQL State: 42P06 - Error Code: 0)
Successfully applied 1 migration to schema "analytics", now at version v202507041801 (execution time 00:00.031s)
Validando migraciones Flyway...
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-9607-postgres:5432/sbm_db (PostgreSQL 16.15)
Successfully validated 33 migrations (execution time 00:00.326s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-9607-postgres:5432/sbm_db (PostgreSQL 16.15)
Successfully validated 55 migrations (execution time 00:00.502s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-9607-postgres:5432/sbm_db (PostgreSQL 16.15)
Successfully validated 5 migrations (execution time 00:00.107s)
A more recent version of Flyway is available. Find out more about Flyway 13.7.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://sbm-db-qa-9607-postgres:5432/sbm_db (PostgreSQL 16.15)
Successfully validated 2 migrations (execution time 00:00.094s)
QA SBM-DB aislado completado correctamente.
```

## SonarScanner

- Exit code: 0
- Scope: Shell/YAML/secrets supported by Community Build; Flyway SQL excluded

```text
17:46:45.991 INFO  Scanner configuration file: /opt/sonar-scanner/conf/sonar-scanner.properties
17:46:46.000 INFO  Project root configuration file: /usr/src/sonar-project.properties
17:46:46.039 INFO  SonarScanner CLI 8.1.0.6389
17:46:46.054 INFO  Linux 6.18.33.2-microsoft-standard-WSL2 amd64
17:46:48.290 INFO  Communicating with SonarQube Community Build 26.7.0.124771
17:46:48.292 INFO  JRE provisioning: os[linux], arch[x86_64]
17:46:51.579 INFO  Starting SonarScanner Engine...
17:46:51.588 INFO  Java 21.0.9 Eclipse Adoptium (64-bit)
17:46:57.168 INFO  Load global settings
17:46:57.641 INFO  Load global settings (done) | time=466ms
17:46:57.660 INFO  Server id: 54000601-AZ-DAVF-MejkBZkEKtuI
17:46:57.692 INFO  Loading required plugins
17:46:57.693 INFO  Load plugins index
17:46:57.743 INFO  Load plugins index (done) | time=49ms
17:46:57.744 INFO  Load/download plugins
17:46:57.972 INFO  Load/download plugins (done) | time=228ms
17:46:59.477 INFO  Process project properties
17:46:59.565 INFO  Process project properties (done) | time=88ms
17:46:59.610 INFO  Project key: SBM-DB
17:46:59.610 INFO  Base dir: /usr/src
17:46:59.611 INFO  Working dir: /tmp/.scannerwork
17:46:59.642 INFO  Load project settings for component key: 'SBM-DB'
17:46:59.700 INFO  Load project settings for component key: 'SBM-DB' (done) | time=58ms
17:46:59.754 INFO  Load quality profiles
17:46:59.896 INFO  Load quality profiles (done) | time=142ms
17:47:00.080 INFO  Load active rules
17:47:00.799 INFO  Load active rules (done) | time=718ms
17:47:00.819 INFO  Load analysis cache
17:47:00.848 INFO  Load analysis cache (404) | time=29ms
17:47:01.433 INFO  Preprocessing files...
17:47:02.731 INFO  1 language detected in 5 preprocessed files (done) | time=1296ms
17:47:02.734 INFO  0 files ignored because of inclusion/exclusion patterns
17:47:02.734 INFO  0 files ignored because of scm ignore settings
17:47:02.750 INFO  Loading plugins for detected languages
17:47:02.752 INFO  Load/download plugins
17:47:02.881 INFO  Load/download plugins (done) | time=131ms
17:47:03.443 INFO  Load project repositories
17:47:03.867 INFO  Load project repositories (done) | time=424ms
17:47:03.916 INFO  Indexing files...
17:47:03.917 INFO  Project configuration:
17:47:03.922 INFO    Excluded sources: **/.git/**, **/.sonar/**, **/.scannerwork/**, **/context/**, **/flyway/**, **/dbdiagram/**
17:47:03.991 INFO  5 files indexed (done) | time=74ms
17:47:03.994 INFO  Quality profile for yaml: Sonar way
17:47:03.996 INFO  ------------- Run sensors on module SBM-DB
17:47:04.118 INFO  Load metrics repository
17:47:04.179 INFO  Load metrics repository (done) | time=61ms
17:47:05.649 INFO  Sensor IaC CloudFormation Sensor [iac]
17:47:05.762 INFO  There are no files to be analyzed for the CloudFormation language
17:47:05.763 INFO  Sensor IaC CloudFormation Sensor [iac] (done) | time=115ms
17:47:05.764 INFO  Sensor IaC cfn-lint report Sensor [iac]
17:47:05.766 INFO  Sensor IaC cfn-lint report Sensor [iac] (done) | time=1ms
17:47:05.766 INFO  Sensor IaC Kustomization Sensor [iac]
17:47:05.838 INFO  Sensor IaC Kustomization Sensor [iac] (done) | time=72ms
17:47:05.839 INFO  Sensor IaC hadolint report Sensor [iac]
17:47:05.839 INFO  Sensor IaC hadolint report Sensor [iac] (done) | time=0ms
17:47:05.840 INFO  Sensor Java Config Sensor [iac]
17:47:05.840 INFO  There are no files to be analyzed for the Java language
17:47:05.841 INFO  Sensor Java Config Sensor [iac] (done) | time=0ms
17:47:05.842 INFO  Sensor IaC Docker Sensor [iac]
17:47:05.847 INFO  There are no files to be analyzed for the Docker language
17:47:05.848 INFO  Sensor IaC Docker Sensor [iac] (done) | time=8ms
17:47:05.849 INFO  Sensor IaC Kubernetes Sensor [iac]
17:47:06.207 INFO  There are no files to be analyzed for the Kubernetes language
17:47:06.208 INFO  Sensor IaC Kubernetes Sensor [iac] (done) | time=360ms
17:47:06.208 INFO  Sensor TextAndSecretsSensor [text]
17:47:06.290 INFO  Available processors: 8
17:47:06.291 INFO  Using 8 threads for analysis.
17:47:07.577 INFO  The property "sonar.tests" is not set. To improve the analysis accuracy, we categorize a file as a test file if any of the following is true:
  * The filename starts with "test"
  * The filename contains "test." or "tests."
  * Any directory in the file path is named: "doc", "docs", "test", "tests", "mock" or "mocks"
  * Any directory in the file path has a name ending in "test" or "tests"

17:47:07.685 INFO  Start fetching files for the text and secrets analysis
17:47:07.714 INFO  Using Git CLI to retrieve dirty files
17:47:07.742 WARN  Retrieving only language associated files, make sure to run the analysis inside a git repository to make use of inclusions specified via "sonar.text.inclusions"
17:47:07.743 INFO  Starting the text and secrets analysis
17:47:07.751 INFO  1 source file to be analyzed for the text and secrets analysis
17:47:07.838 INFO  1/1 source file has been analyzed for the text and secrets analysis
17:47:07.844 INFO  Sensor TextAndSecretsSensor [text] (done) | time=1636ms
17:47:07.850 INFO  ------------- Run sensors on project
17:47:09.349 INFO  Sensor JavaScript/TypeScript/CSS analysis [javascript]
17:47:09.375 INFO  No input files found for analysis
17:47:09.376 INFO  Hit the cache for 0 out of 0
17:47:09.376 INFO  Miss the cache for 0 out of 0
17:47:09.377 INFO  Sensor JavaScript/TypeScript/CSS analysis [javascript] (done) | time=27ms
17:47:09.378 INFO  Sensor IaC Project Sensor [iac]
17:47:09.381 INFO  Sensor IaC Project Sensor [iac] (done) | time=2ms
17:47:09.382 INFO  Sensor Zero Coverage Sensor
17:47:09.391 INFO  Sensor Zero Coverage Sensor (done) | time=11ms
17:47:09.392 INFO  ------------- Gather SCA dependencies on project
17:47:09.409 INFO  Dependency analysis skipped
17:47:09.428 INFO  CPD Executor Calculating CPD for 0 files
17:47:09.429 INFO  CPD Executor CPD calculation finished (done) | time=0ms
17:47:09.539 INFO  SCM revision ID 'a0df285dfa8dacd5d33da3a8f57e336e952bd572'
17:47:09.829 INFO  Analysis report generated in 367ms, dir size=277.4 kB
17:47:09.877 INFO  Analysis report compressed in 48ms, zip size=28.2 kB
17:47:09.962 INFO  Analysis report uploaded in 84ms
17:47:09.967 INFO  ------------- Check Quality Gate status
17:47:09.968 INFO  Waiting for the analysis report to be processed (max 300s)
17:47:15.132 INFO  QUALITY GATE STATUS: PASSED - View details on http://host.docker.internal:9000/dashboard?id=SBM-DB
17:47:15.157 INFO  Analysis total time: 16.930 s
17:47:15.165 INFO  SonarScanner Engine completed successfully
17:47:15.397 INFO  EXECUTION SUCCESS
17:47:15.398 INFO  Total time: 29.414s
SonarScanner y Quality Gate completados correctamente.
```

## Evidence boundary

This file records only executed QA output.
It does not claim SQL static analysis, migration success, coverage, deployment or Quality Gate results that are absent from the logs.
