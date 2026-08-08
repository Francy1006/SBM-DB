# QA Results

> **Generated at:** 2026-08-08T03:35:56Z
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
Validando Docker Compose...
Levantando PostgreSQL...
 Container sbm-db-postgres-1  Running
Validando flyway_sbm_business...
A more recent version of Flyway is available. Find out more about Flyway 13.2.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 33 migrations (execution time 00:00.038s)
Validando flyway_ditaly_pasta...
A more recent version of Flyway is available. Find out more about Flyway 13.2.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 55 migrations (execution time 00:00.069s)
Validando flyway_cross...
A more recent version of Flyway is available. Find out more about Flyway 13.2.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 5 migrations (execution time 00:00.039s)
Validando flyway_analytics...
A more recent version of Flyway is available. Find out more about Flyway 13.2.0 at https://rd.gt/3rXiSlV

Flyway OSS Edition 10.22.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://postgres:5432/sbm_db (PostgreSQL 16.9)
Successfully validated 2 migrations (execution time 00:00.029s)
Validación Flyway completada correctamente.
```

## SonarScanner

- Exit code: 0
- Scope: Shell/YAML/secrets supported by Community Build; Flyway SQL excluded

```text
03:34:51.402 INFO  Scanner configuration file: /opt/sonar-scanner/conf/sonar-scanner.properties
03:34:51.424 INFO  Project root configuration file: /usr/src/sonar-project.properties
03:34:51.584 INFO  SonarScanner CLI 8.0.1.6346
03:34:51.675 INFO  Linux 5.15.49-linuxkit-pr amd64
03:35:05.137 INFO  Communicating with SonarQube Community Build 26.7.0.124771
03:35:05.149 INFO  JRE provisioning: os[linux], arch[x86_64]
03:35:13.946 INFO  Starting SonarScanner Engine...
03:35:13.951 INFO  Java 21.0.9 Eclipse Adoptium (64-bit)
03:35:27.018 INFO  Load global settings
03:35:27.770 INFO  Load global settings (done) | time=756ms
03:35:27.809 INFO  Server id: 54000601-AZ-DAVF-MejkBZkEKtuI
03:35:27.907 INFO  Loading required plugins
03:35:27.909 INFO  Load plugins index
03:35:28.073 INFO  Load plugins index (done) | time=164ms
03:35:28.079 INFO  Load/download plugins
03:35:28.295 INFO  Load/download plugins (done) | time=216ms
03:35:30.921 INFO  Process project properties
03:35:31.009 INFO  Process project properties (done) | time=106ms
03:35:31.111 INFO  Project key: SBM-DB
03:35:31.113 INFO  Base dir: /usr/src
03:35:31.114 INFO  Working dir: /tmp/.scannerwork
03:35:31.184 INFO  Load project settings for component key: 'SBM-DB'
03:35:31.488 INFO  Load project settings for component key: 'SBM-DB' (done) | time=303ms
03:35:31.639 INFO  Load quality profiles
03:35:32.158 INFO  Load quality profiles (done) | time=527ms
03:35:32.655 INFO  Load active rules
03:35:35.563 INFO  Load active rules (done) | time=2922ms
03:35:35.638 INFO  Load analysis cache
03:35:35.844 INFO  Load analysis cache (404) | time=207ms
03:35:37.062 INFO  Preprocessing files...
03:35:37.608 INFO  1 language detected in 8 preprocessed files (done) | time=563ms
03:35:37.610 INFO  0 files ignored because of inclusion/exclusion patterns
03:35:37.628 INFO  0 files ignored because of scm ignore settings
03:35:37.652 INFO  Loading plugins for detected languages
03:35:37.661 INFO  Load/download plugins
03:35:37.752 INFO  Load/download plugins (done) | time=92ms
03:35:38.621 INFO  Load project repositories
03:35:39.922 INFO  Load project repositories (done) | time=1312ms
03:35:40.425 INFO  Indexing files...
03:35:40.431 INFO  Project configuration:
03:35:40.444 INFO    Excluded sources: **/.git/**, **/.sonar/**, **/.scannerwork/**, **/context/**, **/flyway/**, **/dbdiagram/**
03:35:40.626 INFO  8 files indexed (done) | time=173ms
03:35:40.663 INFO  Quality profile for yaml: Sonar way
03:35:40.666 INFO  ------------- Run sensors on module SBM-DB
03:35:40.930 INFO  Load metrics repository
03:35:41.163 INFO  Load metrics repository (done) | time=221ms
03:35:42.802 INFO  Sensor IaC CloudFormation Sensor [iac]
03:35:42.917 INFO  There are no files to be analyzed for the CloudFormation language
03:35:42.919 INFO  Sensor IaC CloudFormation Sensor [iac] (done) | time=127ms
03:35:42.932 INFO  Sensor IaC cfn-lint report Sensor [iac]
03:35:42.939 INFO  Sensor IaC cfn-lint report Sensor [iac] (done) | time=2ms
03:35:42.940 INFO  Sensor IaC Kustomization Sensor [iac]
03:35:43.061 INFO  Sensor IaC Kustomization Sensor [iac] (done) | time=132ms
03:35:43.067 INFO  Sensor IaC hadolint report Sensor [iac]
03:35:43.068 INFO  Sensor IaC hadolint report Sensor [iac] (done) | time=0ms
03:35:43.070 INFO  Sensor Java Config Sensor [iac]
03:35:43.076 INFO  There are no files to be analyzed for the Java language
03:35:43.080 INFO  Sensor Java Config Sensor [iac] (done) | time=0ms
03:35:43.081 INFO  Sensor IaC Docker Sensor [iac]
03:35:43.083 INFO  There are no files to be analyzed for the Docker language
03:35:43.084 INFO  Sensor IaC Docker Sensor [iac] (done) | time=10ms
03:35:43.085 INFO  Sensor IaC Kubernetes Sensor [iac]
03:35:43.705 INFO  There are no files to be analyzed for the Kubernetes language
03:35:43.747 INFO  Sensor IaC Kubernetes Sensor [iac] (done) | time=630ms
03:35:43.757 INFO  Sensor TextAndSecretsSensor [text]
03:35:43.881 INFO  Available processors: 4
03:35:43.884 INFO  Using 4 threads for analysis.
03:35:45.150 INFO  The property "sonar.tests" is not set. To improve the analysis accuracy, we categorize a file as a test file if any of the following is true:
  * The filename starts with "test"
  * The filename contains "test." or "tests."
  * Any directory in the file path is named: "doc", "docs", "test", "tests", "mock" or "mocks"
  * Any directory in the file path has a name ending in "test" or "tests"

03:35:45.300 INFO  Start fetching files for the text and secrets analysis
03:35:45.427 INFO  Using Git CLI to retrieve dirty files
03:35:45.494 WARN  Retrieving only language associated files, make sure to run the analysis inside a git repository to make use of inclusions specified via "sonar.text.inclusions"
03:35:45.496 INFO  Starting the text and secrets analysis
03:35:45.508 INFO  1 source file to be analyzed for the text and secrets analysis
03:35:45.702 INFO  1/1 source file has been analyzed for the text and secrets analysis
03:35:45.709 INFO  Sensor TextAndSecretsSensor [text] (done) | time=2012ms
03:35:45.741 INFO  ------------- Run sensors on project
03:35:46.691 INFO  Sensor JavaScript/TypeScript/CSS analysis [javascript]
03:35:46.746 INFO  No input files found for analysis
03:35:46.749 INFO  Hit the cache for 0 out of 0
03:35:46.752 INFO  Miss the cache for 0 out of 0
03:35:46.754 INFO  Sensor JavaScript/TypeScript/CSS analysis [javascript] (done) | time=64ms
03:35:46.759 INFO  Sensor IaC Project Sensor [iac]
03:35:46.767 INFO  Sensor IaC Project Sensor [iac] (done) | time=22ms
03:35:46.768 INFO  Sensor Zero Coverage Sensor
03:35:46.800 INFO  Sensor Zero Coverage Sensor (done) | time=33ms
03:35:46.807 INFO  ------------- Gather SCA dependencies on project
03:35:46.831 INFO  Dependency analysis skipped
03:35:46.857 INFO  CPD Executor Calculating CPD for 0 files
03:35:46.879 INFO  CPD Executor CPD calculation finished (done) | time=0ms
03:35:46.949 INFO  SCM revision ID 'df81bd1bb6e44281605d34cd3efa24917860c899'
03:35:47.448 INFO  Analysis report generated in 539ms, dir size=277.4 kB
03:35:47.510 INFO  Analysis report compressed in 62ms, zip size=28.3 kB
03:35:48.518 INFO  Analysis report uploaded in 987ms
03:35:48.586 INFO  ------------- Check Quality Gate status
03:35:48.593 INFO  Waiting for the analysis report to be processed (max 300s)
03:35:54.161 INFO  QUALITY GATE STATUS: PASSED - View details on http://host.docker.internal:9000/dashboard?id=SBM-DB
03:35:54.367 INFO  Analysis total time: 25.810 s
03:35:54.376 INFO  SonarScanner Engine completed successfully
03:35:54.631 INFO  EXECUTION SUCCESS
03:35:54.837 INFO  Total time: 1:03.265s
SonarScanner y Quality Gate completados correctamente.
```

## Evidence boundary

This file records only executed QA output.
It does not claim SQL static analysis, migration success, coverage, deployment or Quality Gate results that are absent from the logs.
