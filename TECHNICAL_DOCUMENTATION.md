# Documentación Técnica - SBM Database Suite

## Stack Tecnológico
- **Base de Datos**: PostgreSQL 16.9
- **Migraciones**: Flyway 10.22.0
- **Orquestación**: Docker Compose
- **Repositorio**: https://github.com/Francy1006/SBM-DB
- **Configuración**: Variables de entorno con valores por defecto

## Estructura del Proyecto

```
SBM-DB/
├── docker-compose.yml          # Configuración de contenedores con variables
├── .env                        # Variables de entorno (opcional)
├── .cursorignore               # Archivos ignorados por Cursor IDE
├── flyway/
│   ├── flyway.conf            # Configuración principal con variables
│   └── sql/
│       ├── sbm_business/      # Migraciones del schema sbm_business
│       │   ├── flyway.conf   # Configuración específica del schema
│       │   └── V*.sql        # Archivos de migración
│       └── ditaly_pasta/      # Migraciones del schema ditaly_pasta
│           ├── flyway.conf   # Configuración específica del schema
│           └── V*.sql        # Archivos de migración
├── dbdiagram/
│   └── SBM-business.dbml      # Diagrama de base de datos
└── mysql/                     # Configuración legacy de MySQL
```

## Configuración de Base de Datos

### Variables de Entorno (.env)
```env
# PostgreSQL Database Configuration
POSTGRES_DB=sbm_db
POSTGRES_USER=sbm_user
POSTGRES_PASSWORD=sbm_password
POSTGRES_HOST=postgres
POSTGRES_PORT=5432

# Flyway Configuration
FLYWAY_SCHEMAS=sbm_business,ditaly_pasta
FLYWAY_USER=sbm_user
FLYWAY_PASSWORD=sbm_password

# Docker Configuration
DOCKER_COMPOSE_PROJECT_NAME=sbm-db
```

### Variables con Valores por Defecto
El sistema está configurado para usar valores por defecto si las variables no están definidas:
- `POSTGRES_HOST` → `postgres`
- `POSTGRES_PORT` → `5432`
- `POSTGRES_DB` → `sbm_db`
- `POSTGRES_USER` → `sbm_user`
- `POSTGRES_PASSWORD` → `sbm_password`

### Configuración de Variables de Entorno

#### Opción 1: Archivo .env
Crear un archivo `.env` en la raíz del proyecto:
```env
# PostgreSQL Database Configuration
POSTGRES_DB=sbm_db
POSTGRES_USER=sbm_user
POSTGRES_PASSWORD=sbm_password
POSTGRES_HOST=postgres
POSTGRES_PORT=5432

# Flyway Configuration
FLYWAY_SCHEMAS=sbm_business,ditaly_pasta
FLYWAY_USER=sbm_user
FLYWAY_PASSWORD=sbm_password

# Docker Configuration
DOCKER_COMPOSE_PROJECT_NAME=sbm-db
```

#### Opción 2: Variables de Entorno del Sistema
```bash
export POSTGRES_DB=sbm_db
export POSTGRES_USER=sbm_user
export POSTGRES_PASSWORD=sbm_password
export POSTGRES_HOST=postgres
export POSTGRES_PORT=5432
```

#### Opción 3: Variables Inline
```bash
POSTGRES_PASSWORD=my_secure_password docker compose up -d
```

#### Opción 4: Archivo .env Personalizado
```bash
docker compose --env-file .env.production up -d
```

## Configuración de Flyway

### Configuración Principal (flyway/flyway.conf)
```properties
flyway.url=jdbc:postgresql://${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}
flyway.user=${POSTGRES_USER}
flyway.password=${POSTGRES_PASSWORD}
flyway.locations=filesystem:/flyway/sql
flyway.schemas=${FLYWAY_SCHEMAS}
flyway.baselineOnMigrate=true
flyway.validateOnMigrate=true
flyway.cleanDisabled=false
flyway.encoding=UTF-8
flyway.placeholderReplacement=false
```

### Configuración por Schema

#### sbm_business (flyway/sql/sbm_business/flyway.conf)
```properties
flyway.url=jdbc:postgresql://${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}
flyway.user=${POSTGRES_USER}
flyway.password=${POSTGRES_PASSWORD}
flyway.schemas=sbm_business
flyway.locations=filesystem:/flyway/sql
flyway.validateMigrationNaming=true
flyway.baselineOnMigrate=true
flyway.validateOnMigrate=true
flyway.cleanDisabled=false
flyway.encoding=UTF-8
flyway.placeholderReplacement=false
```

#### ditaly_pasta (flyway/sql/ditaly_pasta/flyway.conf)
```properties
flyway.url=jdbc:postgresql://${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}
flyway.user=${POSTGRES_USER}
flyway.password=${POSTGRES_PASSWORD}
flyway.schemas=ditaly_pasta
flyway.locations=filesystem:/flyway/sql
flyway.validateMigrationNaming=true
flyway.baselineOnMigrate=true
flyway.validateOnMigrate=true
flyway.cleanDisabled=false
flyway.encoding=UTF-8
flyway.placeholderReplacement=false
```

### Parámetros de Configuración
- **flyway.url**: Conexión a PostgreSQL con variables
- **flyway.user**: Usuario de base de datos
- **flyway.password**: Contraseña de base de datos
- **flyway.locations**: Ubicación de archivos SQL
- **flyway.schemas**: Esquemas a migrar
- **flyway.baselineOnMigrate**: Crear baseline automáticamente
- **flyway.validateOnMigrate**: Validar migraciones antes de ejecutar
- **flyway.cleanDisabled**: Deshabilitar limpieza de base de datos
- **flyway.encoding**: Codificación de archivos
- **flyway.placeholderReplacement**: Deshabilitar reemplazo de placeholders
- **flyway.validateMigrationNaming**: Validar nomenclatura de migraciones

## Esquemas de Base de Datos

### 1. Schema: `sbm_business`
Esquema principal para funcionalidades core del sistema.

#### Tablas Principales:
- **`user`** - Gestión de usuarios del sistema
- **`complementary`** - Datos complementarios
- **`documentation_security`** - Documentación de seguridad
- **`price_sales`** - Configuración de precios y ventas
- **`bank`** - Información bancaria
- **`package`** - Gestión de empaques
- **`menu`** - Gestión de menús del sistema
  - Campos: id, menu, description, franchise_only

#### Triggers:
- **`user_before_insert`** - Genera UUID automático para usuarios
- **`complementary_before_insert`** - Genera UUID automático para complementarios
- **`documentation_security_before_insert`** - Genera UUID automático para documentación
- **`price_sales_before_insert`** - Genera UUID automático para precios
- **`bank_before_insert`** - Genera UUID automático para bancos
- **`package_before_insert`** - Genera UUID automático para empaques
- **`menu_before_insert`** - Trigger preparado para futuras expansiones

### 2. Schema: `ditaly_pasta`
Esquema específico para el módulo de negocio Ditaly Pasta.

#### Tablas de Productos:
- **`catalog`** - Catálogo de productos
  - Campos: id, code, sku, menu, item_group, category, type, restriction, name, description, obs, chef_recommendation, usage_instructions, price, min_quantity_purchase, rations_quantity, cover_image, secondary_image, complementary_image, image_gallery, configuration, is_visible, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by, log, version

- **`product`** - Productos principales
  - Campos: id, code, sku, description, obs, package_unit, min_package_purchase, price, provider, type, item_group, category, url, is_active, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by, log, version

- **`material`** - Materiales
  - Campos: id, code, sku, description, obs, package_unit, min_package_purchase, price, provider, type, item_group, category, url, package, is_active, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by, log, version

- **`service`** - Servicios
  - Campos: id, code, sku, description, obs, package_unit, min_package_purchase, price, provider, type, item_group, category, url, is_active, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by, log, version

#### Tablas de Configuración:
- **`item_configuration`** - Configuración de items
- **`item_configuration_detail`** - Detalles de configuración
- **`price_fiscal_configuration`** - Configuración fiscal de precios
- **`fiscal_configuration_detail`** - Detalles de configuración fiscal

#### Tablas de Proveedores:
- **`provider`** - Proveedores
  - Campos: id, code, provider, type, rating, obs_provider, contact_name, contact_mail, contact_phone, contact_phone2, website_url, obs_contact, company_name, company_rut, company_activity, legal_representative, billing_address, billing_mail, billing_phone, company_bank, bank_account_type, bank_account_number, bank_account_mail, dispatch_address, dispatch_maps_location, obs_dispatch, dispatch_district, dispatch_region, is_active, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by, log, version

#### Tablas de Precios:
- **`price`** - Precios
  - Campos: id, code, net_amount, gross_amount, iva_amount, retention_amount, price_fiscal_configuration, is_active, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by

#### Vistas:
- **`vw_product_simple`** - Vista simple de productos con información básica
- **`vw_product_simple_commercial`** - Vista comercial de productos con información de precios y proveedores
- **`vw_material_simple_commercial`** - Vista comercial de materiales con información de precios y proveedores

#### Triggers:
- **`catalog_before_insert`** - Genera UUID automático para catálogos
- **`item_configuration_before_insert`** - Genera UUID automático para configuraciones
- **`material_before_insert`** - Genera UUID automático para materiales
- **`service_before_insert`** - Genera UUID automático para servicios
- **`provider_before_insert`** - Genera código automático con prefijo basado en tipo (PVP, PVM, PVS)
- **`price_fiscal_configuration_before_insert`** - Genera UUID automático para configuración fiscal
- **`price_before_insert`** - Genera UUID automático para precios
- **`fiscal_configuration_detail_before_insert`** - Inicializa log automáticamente

## Migraciones Completadas

### Schema: `sbm_business`
1. **V202506151816** - Inicialización del schema
2. **V202506151816a** - Inicialización de tablas principales
3. **V202506151817** - Construcción de constraints
4. **V202506151819** - Datos complementarios por defecto
5. **V202506161240** - Usuario administrador
6. **V202506161309** - Restricciones de permisos por defecto
7. **V202506161422** - Instrucciones por defecto
8. **V202506302201** - Tablas de usuarios
9. **V202506302202** - Tablas complementarias
10. **V202506302203** - Tablas de documentación de seguridad
11. **V202506302205** - Tablas de precios y ventas
12. **V202506302206** - Constraints de relaciones
13. **V202507041601** - Alteración de tabla menu (agregar columna franchise_only)

### Schema: `ditaly_pasta`
1. **V202506151817** - Inicialización del schema ditaly_pasta
2. **V202506151819** - Triggers para UUID
3. **V202506161601** - Trigger para proveedores
4. **V202506171619** - Inicialización de catálogo por defecto
5. **V202506301702** - Vista simple de productos
6. **V202506302204** - Tablas de productos
7. **V202507010031** - Agregar columna de precio a productos
8. **V202507010034** - Agregar columna de precio a materiales
9. **V202507010036** - Tablas de precios y ventas
10. **V202507010037** - Constraints de relaciones
11. **V202507010038** - Vista comercial de productos
12. **V202507010039** - Vista comercial de materiales

## Adaptaciones de MySQL a PostgreSQL

### Cambios de Sintaxis Realizados:
1. **Auto-incrementos**: `AUTO_INCREMENT` → `SERIAL`
2. **Tipos de datos**: `datetime` → `TIMESTAMP`
3. **Valores booleanos**: `DEFAULT 1/0` → `DEFAULT true/false`
4. **Comparaciones booleanas**: `= 0` → `= false`
5. **Identificadores**: Eliminación de backticks (`` ` ``)
6. **Comentarios**: Eliminación de comentarios MySQL
7. **UUID**: `UUID()` → `gen_random_uuid()`
8. **Concatenación**: `CONCAT()` → `||`
9. **Palabras reservadas**: `group` → `item_group`

### Triggers Convertidos:
- **MySQL**: `DELIMITER`, `SET`, `BEGIN/END`
- **PostgreSQL**: `CREATE OR REPLACE FUNCTION`, `plpgsql`, `RETURN NEW`

## Comandos de Ejecución

### Iniciar Todo Automáticamente (Recomendado):
```bash
docker compose up -d --build
```

### Iniciar Base de Datos:
```bash
docker compose up -d postgres
```

### Ejecutar Migraciones sbm_business:
```bash
docker compose run --rm flyway_sbm_business
```

### Ejecutar Migraciones ditaly_pasta:
```bash
docker compose run --rm flyway_ditaly_pasta
```

### Verificar Estado de Migraciones:
```bash
docker compose run --rm flyway_sbm_business info
docker compose run --rm flyway_ditaly_pasta info
```

### Verificar Variables de Entorno:
```bash
# Ver variables en el contenedor de postgres
docker compose exec postgres env | grep POSTGRES

# Ver variables en el contenedor de flyway
docker compose run --rm flyway_sbm_business env | grep POSTGRES

# Ver configuración de flyway
docker compose run --rm flyway_sbm_business -configFiles=/flyway/conf/flyway.conf info
```

## Comandos y Operaciones de Flyway

### Comandos Básicos
```bash
# Información del estado de migraciones
flyway info

# Ejecutar migraciones pendientes
flyway migrate

# Validar migraciones
flyway validate

# Limpiar base de datos (¡CUIDADO!)
flyway clean

# Reparar tabla de historial
flyway repair

# Baseline de migraciones existentes
flyway baseline

# Verificar estado de migraciones
flyway info
```

### Comandos Específicos por Schema

#### sbm_business
```bash
# Ejecutar migraciones sbm_business
docker compose run --rm flyway_sbm_business migrate

# Verificar estado sbm_business
docker compose run --rm flyway_sbm_business info

# Validar migraciones sbm_business
docker compose run --rm flyway_sbm_business validate

# Limpiar schema sbm_business
docker compose run --rm flyway_sbm_business clean
```

#### ditaly_pasta
```bash
# Ejecutar migraciones ditaly_pasta
docker compose run --rm flyway_ditaly_pasta migrate

# Verificar estado ditaly_pasta
docker compose run --rm flyway_ditaly_pasta info

# Validar migraciones ditaly_pasta
docker compose run --rm flyway_ditaly_pasta validate

# Limpiar schema ditaly_pasta
docker compose run --rm flyway_ditaly_pasta clean
```

### Convenciones de Nomenclatura de Migraciones

#### Formato de Nombres de Archivos
```
V{version}__{description}.sql
```

#### Ejemplos:
- `V202506151816__init.sql` - Inicialización
- `V202506151817__constraints.sql` - Constraints
- `V202506301702__VW_product_simple.sql` - Vista de productos
- `V202507010036__PRICE_sales_tables.sql` - Tablas de precios

#### Reglas de Versionado:
- **Formato**: `YYYYMMDDHHMM` (año, mes, día, hora, minuto)
- **Separador**: `__` (doble guión bajo)
- **Descripción**: En minúsculas con guiones bajos
- **Extensión**: `.sql`

### Tabla de Historial de Flyway

#### Estructura de flyway_schema_history:
```sql
CREATE TABLE flyway_schema_history (
    installed_rank INTEGER PRIMARY KEY,
    version VARCHAR(50),
    description VARCHAR(200),
    type VARCHAR(20),
    script VARCHAR(1000),
    checksum INTEGER,
    installed_by VARCHAR(100),
    installed_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    execution_time INTEGER,
    success BOOLEAN
);
```

#### Campos Importantes:
- **installed_rank**: Orden de instalación
- **version**: Versión de la migración
- **description**: Descripción de la migración
- **type**: Tipo (SQL, JDBC, etc.)
- **script**: Nombre del archivo SQL
- **checksum**: Checksum del archivo
- **installed_by**: Usuario que ejecutó la migración
- **installed_on**: Fecha y hora de instalación
- **execution_time**: Tiempo de ejecución en ms
- **success**: Estado de éxito/fallo

### Logs y Debugging

#### Niveles de Log:
```bash
# Log detallado con -X
docker compose run --rm flyway_sbm_business migrate -X

# Log con información de debug
docker compose run --rm flyway_ditaly_pasta migrate -debug

# Log con información de SQL ejecutado
docker compose run --rm flyway_sbm_business migrate -X -debug
```

#### Información Útil en Logs:
- **Versión de Flyway**: 10.22.0
- **Base de datos**: PostgreSQL 16.9
- **Esquemas creados**: sbm_business, ditaly_pasta
- **Migraciones aplicadas**: Lista completa con timestamps
- **Tiempo de ejecución**: Por migración y total
- **Errores**: Detalles completos con SQL State y posición

## Estructura de Docker

### Servicios:
- **postgres**: Base de datos PostgreSQL 16.9 con variables de entorno
- **flyway_sbm_business**: Migraciones del schema sbm_business (se ejecuta después de postgres)
- **flyway_ditaly_pasta**: Migraciones del schema ditaly_pasta (se ejecuta después de sbm_business)

### Volúmenes:
- **postgres_sbm_vol**: Datos persistentes de PostgreSQL

### Redes:
- **sbm-network**: Red bridge para comunicación entre servicios

### Configuración de Variables en Docker Compose:
```yaml
environment:
  POSTGRES_USER: ${POSTGRES_USER:-sbm_user}
  POSTGRES_PASSWORD: ${POSTGRES_PASSWORD:-sbm_password}
  POSTGRES_DB: ${POSTGRES_DB:-sbm_db}
  POSTGRES_HOST: ${POSTGRES_HOST:-postgres}
  POSTGRES_PORT: ${POSTGRES_PORT:-5432}
```

### Dependencias y Healthchecks:
```yaml
# Secuencia de ejecución automática:
# 1. postgres → se inicia y espera a estar healthy
# 2. flyway_sbm_business → espera a postgres y ejecuta migraciones
# 3. flyway_ditaly_pasta → espera a que sbm_business termine exitosamente

flyway_ditaly_pasta:
  depends_on:
    postgres:
      condition: service_healthy
    flyway_sbm_business:
      condition: service_completed_successfully
  healthcheck:
    test: ["CMD", "flyway", "-configFiles=/flyway/conf/flyway.conf", "info"]
    interval: 30s
    timeout: 10s
    retries: 3
    start_period: 60s
  restart: on-failure
```

## Notas Importantes

1. **Separación de Esquemas**: Los esquemas `sbm_business` y `ditaly_pasta` están completamente separados para mantener la modularidad.

2. **Triggers Automáticos**: Todos los triggers generan UUIDs automáticamente y mantienen logs de auditoría.

3. **Vistas Comerciales**: Las vistas incluyen información completa de productos, precios y proveedores para consultas comerciales.

4. **Compatibilidad**: Todas las migraciones han sido adaptadas para ser completamente compatibles con PostgreSQL.

5. **Auditoría**: Todas las tablas incluyen campos de auditoría (created_at, updated_at, created_by, etc.).

6. **Variables de Entorno**: Sistema completamente configurado con variables de entorno y valores por defecto.
7. **Ejecución Automática**: Docker Compose configurado para ejecutar migraciones en secuencia automáticamente.

## Troubleshooting y Mejores Prácticas de Flyway

### Errores Comunes y Soluciones

#### 1. Error de Sintaxis SQL
```bash
# Error: syntax error at or near "keyword"
# Solución: Verificar sintaxis PostgreSQL vs MySQL
```

**Problemas típicos:**
- `AUTO_INCREMENT` → `SERIAL`
- `datetime` → `TIMESTAMP`
- `DEFAULT 1/0` → `DEFAULT true/false`
- Backticks (`` ` ``) → Eliminar
- `UUID()` → `gen_random_uuid()`

#### 2. Error de Comparación Booleana
```bash
# Error: operator does not exist: boolean = integer
# Solución: Cambiar = 0 a = false
```

**Ejemplo:**
```sql
-- Incorrecto
WHERE is_deleted = 0

-- Correcto
WHERE is_deleted = false
```

#### 3. Error de Palabras Reservadas
```bash
# Error: syntax error at or near "group"
# Solución: Renombrar columnas reservadas
```

**Ejemplo:**
```sql
-- Incorrecto
group integer NOT NULL

-- Correcto
item_group integer NOT NULL
```

#### 4. Error de Triggers MySQL
```bash
# Error: syntax error at or near "DELIMITER"
# Solución: Convertir a sintaxis PostgreSQL
```

**Conversión:**
```sql
-- MySQL
DELIMITER $$
CREATE TRIGGER trigger_name
BEFORE INSERT ON table_name
FOR EACH ROW
BEGIN
    SET NEW.code = UUID();
END$$
DELIMITER ;

-- PostgreSQL
CREATE OR REPLACE FUNCTION function_name()
RETURNS TRIGGER AS $$
BEGIN
    NEW.code := gen_random_uuid();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_name
    BEFORE INSERT ON table_name
    FOR EACH ROW
    EXECUTE FUNCTION function_name();
```

### Mejores Prácticas

#### 1. Nomenclatura de Migraciones
- ✅ Usar formato: `V{YYYYMMDDHHMM}__{description}.sql`
- ✅ Descripciones claras y concisas
- ✅ Evitar caracteres especiales en nombres
- ❌ No usar espacios en nombres de archivos

#### 2. Estructura de Archivos SQL
- ✅ Un archivo por migración
- ✅ Comentarios descriptivos
- ✅ Separar DDL, DML y DCL
- ✅ Usar transacciones cuando sea apropiado

#### 3. Versionado
- ✅ Usar timestamps únicos
- ✅ No reutilizar versiones
- ✅ Mantener orden cronológico
- ❌ No modificar migraciones ya aplicadas

#### 4. Testing
- ✅ Probar migraciones en entorno de desarrollo
- ✅ Validar sintaxis antes de aplicar
- ✅ Verificar rollback procedures
- ✅ Documentar cambios importantes

### Comandos de Mantenimiento

#### Verificar Integridad
```bash
# Validar todas las migraciones
docker compose run --rm flyway_sbm_business validate
docker compose run --rm flyway_ditaly_pasta validate

# Verificar checksums
docker compose run --rm flyway_sbm_business info
```

#### Reparar Problemas
```bash
# Reparar tabla de historial
docker compose run --rm flyway_sbm_business repair

# Limpiar y reiniciar (¡CUIDADO!)
docker compose run --rm flyway_sbm_business clean
docker compose run --rm flyway_sbm_business migrate
```

#### Backup y Restore
```bash
# Backup de base de datos
docker compose exec postgres pg_dump -U sbm_user sbm_db > backup.sql

# Restore de base de datos
docker compose exec -T postgres psql -U sbm_user sbm_db < backup.sql
```

## Estado Actual
- ✅ **sbm_business**: Migraciones completadas (13/13)
- ✅ **ditaly_pasta**: Migraciones completadas (12/12)
- ✅ **PostgreSQL**: Configurado y funcionando
- ✅ **Docker**: Contenedores configurados con variables de entorno y dependencias automáticas
- ✅ **Flyway**: Migraciones automatizadas en secuencia
- ✅ **Variables de Entorno**: Sistema completamente configurado
- ✅ **Documentación**: Actualizada y completa

## Última Actualización
- **Fecha**: 4 de Julio, 2025
- **Versión**: 1.1.0
- **Estado**: Producción Ready
- **Compatibilidad**: PostgreSQL 16.9, Flyway 10.22.0
- **Nuevas Funcionalidades**: 
  - Ejecución automática de migraciones en secuencia
  - Tabla menu con columna franchise_only
  - Dependencias automáticas en Docker Compose
