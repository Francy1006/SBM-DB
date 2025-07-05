# migrate CMD
docker-compose up flyway



# new SQL Flyway file CMD (SET LABEL)
label="DEFAULT_catalog_init"
flywayVersion="V$(date +%Y%m%d%H%M)__$label.sql"
touch flyway/sql/$flywayVersion

# Comandos para levantar los contenedores en orden recomendado

# 1. Levantar MySQL primero

docker-compose up -d mysql

# 2. Levantar migraciones Flyway (cada esquema)

docker-compose up -d flyway_sbm_business

docker-compose up -d flyway_ditaly_pasta

# (Opcional) Si tienes un servicio cross-schema:
# docker-compose up -d flyway_cross_schema

# Comandos útiles para PostgreSQL + Flyway

## Levantar la base de datos y aplicar migraciones

```sh
docker compose up -d postgres
docker compose run --rm flyway_sbm_business
docker compose run --rm flyway_ditaly_pasta
```

## Ver logs de PostgreSQL

```sh
docker compose logs -f postgres
```

## Acceder a la base de datos PostgreSQL

```sh
docker compose exec postgres psql -U sbm_user -d sbm_db
```