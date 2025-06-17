# migrate CMD
docker-compose up flyway



# new SQL Flyway file CMD (SET LABEL)
label="DEFAULT_cataloge_init"
flywayVersion="V$(date +%Y%m%d%H%M)__$label.sql"
touch flyway/sql/$flywayVersion