# SBM-SUITE con PostgreSQL

Este proyecto ahora utiliza PostgreSQL como base de datos principal, junto con Flyway para la gestión de migraciones.

## Servicios principales
- **postgres**: Base de datos PostgreSQL
- **flyway_sbm_business**: Migraciones para el schema sbm_business
- **flyway_ditaly_pasta**: Migraciones para el schema ditaly_pasta

## Comandos útiles

Levantar la base de datos y aplicar migraciones:

```sh
docker compose up -d postgres
docker compose run --rm flyway_sbm_business
docker compose run --rm flyway_ditaly_pasta
```

## Configuración por defecto
- Usuario: `sbm_user`
- Password: `sbm_password`
- Base de datos: `sbm_db`
- Puerto: `5432`

## Migraciones
Las migraciones deben estar adaptadas a la sintaxis de PostgreSQL. Revisa los ejemplos en `flyway/sql/sbm_business` y `flyway/sql/ditaly_pasta`.