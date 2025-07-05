# Documentación Técnica - PostgreSQL

## Stack
- PostgreSQL 16
- Flyway 10
- Docker Compose

## Estructura de carpetas
- `flyway/sql/sbm_business/` → Migraciones para el schema sbm_business
- `flyway/sql/ditaly_pasta/` → Migraciones para el schema ditaly_pasta

## Configuración de Flyway
- El archivo `flyway.conf` de cada carpeta debe usar la URL de PostgreSQL:
  - `flyway.url=jdbc:postgresql://postgres:5432/sbm_db`
  - `flyway.user=sbm_user`
  - `flyway.password=sbm_password`

## Adaptación de migraciones
- Cambia tipos de datos incompatibles (ej: `int` → `integer`, `varchar`, `text`, etc.)
- Usa `SERIAL` o `GENERATED` para autoincrementos.
- Usa comillas dobles para identificadores si es necesario.
- Elimina ENGINE, CHARSET y backticks (`) de MySQL.
- Revisa funciones y triggers: adapta `UUID()` y `CURRENT_TIMESTAMP` a la sintaxis de PostgreSQL.

## Ejemplo de comando para migrar:

```sh
docker compose up -d postgres
docker compose run --rm flyway_sbm_business
```

## Notas
- Asegúrate de adaptar todos los scripts SQL a la sintaxis de PostgreSQL antes de ejecutar Flyway.
