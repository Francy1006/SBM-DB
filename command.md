# migrate CMD
docker-compose up flyway



# new SQL Flyway file CMD (SET LABEL)
label="new_file" 
flywayVersion="V$(date +%Y%m%d%H%M)__$label.sql"
touch flyway/sql/$flywayVersion