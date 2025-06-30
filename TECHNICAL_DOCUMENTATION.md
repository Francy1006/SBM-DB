# SBM-SUITE MySQL Database - Documentación Técnica

## Tabla de Contenidos
1. [Visión General del Proyecto](#visión-general-del-proyecto)
2. [Arquitectura de Base de Datos](#arquitectura-de-base-de-datos)
3. [Análisis del Esquema](#análisis-del-esquema)
4. [Definiciones de Tablas](#definiciones-de-tablas)
5. [Relaciones y Restricciones](#relaciones-y-restricciones)
6. [Triggers y Automatización](#triggers-y-automatización)
7. [Flujo de Datos y Lógica de Negocio](#flujo-de-datos-y-lógica-de-negocio)
8. [Seguridad y Control de Acceso](#seguridad-y-control-de-acceso)
9. [Consideraciones de Performance](#consideraciones-de-performance)
10. [Despliegue e Infraestructura](#despliegue-e-infraestructura)

---

## 1. Visión General del Proyecto

**SBM-SUITE MySQL** es un sistema de base de datos integral diseñado para Ditaly Pasta, una plataforma de gestión de distribución y franquicias de pasta. El sistema gestiona catálogos de productos, proveedores, usuarios, permisos y operaciones comerciales con enfoque en productos de pasta italiana y servicios relacionados.

### Características Principales
- **Gestión de Productos**: Categorización multinivel (menú, grupo, categoría, tipo)
- **Gestión de Proveedores**: Ciclo de vida completo del proveedor con información de contacto y facturación
- **Gestión de Usuarios**: Control de acceso basado en roles con autenticación de Google
- **Sistema de Catálogo**: Catalogación de productos con controles de precios y visibilidad
- **Sistema de Permisos**: Control de acceso granular con permisos basados en roles
- **Traza de Auditoría**: Registro completo y versionado para todas las entidades

---

## 2. Arquitectura de Base de Datos

### Stack Tecnológico
- **Base de Datos**: MySQL 8.0+
- **Herramienta de Migración**: Flyway 9
- **Containerización**: Docker & Docker Compose
- **Esquema**: `ditaly_pasta`

### Patrones de Diseño
- **Soft Delete**: Todas las entidades de negocio implementan eliminación suave
- **Traza de Auditoría**: Registro completo con control de versiones
- **Claves Primarias UUID**: Para seguridad y sistemas distribuidos
- **Esquema Normalizado**: Cumplimiento 3NF con relaciones apropiadas

---

## 3. Análisis del Esquema

### Estadísticas de la Base de Datos
- **Total de Tablas**: 25
- **Tablas de Negocio Principal**: 15
- **Tablas de Referencia/Búsqueda**: 10
- **Triggers**: 12 (generación de UUID + códigos personalizados de proveedor)
- **Restricciones de Clave Foránea**: 15+

### Categorías del Esquema

#### 1. Tablas de Referencia (Datos de Búsqueda)
- `menu`, `item_group`, `item_category`, `item_type`
- `package_type`, `transport_type`, `measure_unit`
- `provider_type`, `instruction_type`, `permission_type`
- `bank_account_type`, `district`, `region`

#### 2. Entidades de Negocio Principal
- `catalog`, `product`, `material`, `service`
- `provider`, `package`, `item_configuration`
- `user`, `role`, `permission`, `restriction`

#### 3. Tablas de Relación
- `role_permissions`, `restriction_roles`
- `item_configuration_detail`

#### 4. Tablas del Sistema
- `user_token`, `instruction`

---

## 4. Definiciones de Tablas

### Tablas de Referencia

#### Tabla Menu
```sql
CREATE TABLE menu (
    id integer PRIMARY KEY AUTO_INCREMENT,
    menu varchar(50) NOT NULL,
    description text NOT NULL
);
```
**Propósito**: Define menús/categorías de productos (BELLAVITA, VEROGUSTO, DESECHABLE, DOLCEZZA, etc.)
**Volumen de Datos**: Bajo (5-10 registros)
**Frecuencia de Actualización**: Rara

#### Tabla Item Group
```sql
CREATE TABLE item_group (
    id integer PRIMARY KEY AUTO_INCREMENT,
    group_name varchar(50) NOT NULL,
    description text NOT NULL,
    catalog_render boolean NOT NULL DEFAULT 1
);
```
**Propósito**: Agrupación de productos (GRANEL, UNIDAD, BANDEJA, TIENDA, SERVICIO)
**Característica Clave**: `catalog_render` controla la visibilidad del catálogo
**Lógica de Negocio**: Determina cómo se muestran los productos en los catálogos

#### Tabla Item Category
```sql
CREATE TABLE item_category (
    id integer PRIMARY KEY AUTO_INCREMENT,
    category varchar(50) NOT NULL,
    description text NOT NULL,
    catalog_render boolean NOT NULL DEFAULT 1
);
```
**Propósito**: Categorización de productos (PASTA, SALSA, BEBESTIBLE, DESECHABLE, etc.)
**Lógica de Negocio**: Controla el renderizado del catálogo y la organización de productos

#### Tabla Item Type
```sql
CREATE TABLE item_type (
    id integer PRIMARY KEY AUTO_INCREMENT,
    `type` varchar(50) NOT NULL,
    description text NOT NULL
);
```
**Propósito**: Clasificación de tipos de productos
**Valores**: PRODUCTO CONGELADO, PRODUCTO REFRIGERADO, MATERIAL, PRODUCTO ALMACEN, SERVICIO

### Tablas de Negocio Principal

#### Tabla Catalog
```sql
CREATE TABLE catalog (
    id int PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NULL COMMENT 'UUID() REQUIRES TRIGGER',
    sku varchar(50) NOT NULL,
    menu integer NOT NULL,
    `group` integer NOT NULL,
    category integer NOT NULL,
    `type` integer NOT NULL,
    restriction char(36) NOT NULL,
    name varchar(50) NOT NULL,
    description text NOT NULL,
    OBS varchar(255),
    chef_recommendation boolean NOT NULL DEFAULT 0,
    usage_instructions char(36) NOT NULL,
    base_gross_price integer NOT NULL DEFAULT 0,
    min_quantity_purchase integer NOT NULL DEFAULT 1,
    rations_quantity integer NOT NULL DEFAULT 1,
    cover_image varchar(2083),
    secondary_image varchar(2083),
    complementary_image varchar(2083),
    image_gallery varchar(2083),
    configuration char(36) NOT NULL,
    is_visible boolean NOT NULL DEFAULT 1,
    -- Campos de auditoría
    is_deleted boolean,
    is_confirmed boolean,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);
```
**Propósito**: Catálogo principal de productos con metadatos completos
**Características Clave**:
- Soporte multi-imagen (portada, secundaria, complementaria, galería)
- Recomendaciones del chef e instrucciones de uso
- Controles de precios y cantidades
- Workflows de visibilidad y confirmación
- Traza de auditoría completa con versionado

#### Tabla Provider
```sql
CREATE TABLE provider (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'CUSTOM TRIGGER',
    provider varchar(50) UNIQUE NOT NULL,
    `type` integer NOT NULL,
    rating integer NOT NULL DEFAULT 0,
    OBS_provider text NOT NULL,
    -- Información de Contacto
    contact_name varchar(100),
    contact_mail varchar(255),
    contact_phone bigint,
    contact_phone2 bigint,
    website_url text,
    OBS_contact varchar(255),
    -- Información de la Empresa
    company_name varchar(255),
    company_rut varchar(12),
    company_activity varchar(255),
    legal_representative varchar(255),
    -- Información de Facturación
    billing_address text,
    billing_mail varchar(255),
    billing_phone bigint,
    company_bank integer,
    bank_account_type integer,
    bank_account_number varchar(255),
    bank_account_mail varchar(255),
    -- Información de Despacho
    dispatch_address varchar(255),
    dispatch_maps_location varchar(255),
    OBS_dispatch text,
    dispatch_district integer,
    dispatch_region integer,
    -- Estado y Auditoría
    is_active boolean NOT NULL DEFAULT 1,
    is_deleted boolean,
    is_confirmed boolean,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);
```
**Propósito**: Gestión integral de proveedores/suministradores
**Características Clave**:
- Información completa de contacto y empresa
- Detalles de facturación y despacho
- Seguimiento de ubicación geográfica
- Sistema de calificación de proveedores
- Generación personalizada de códigos (PVP-001, PVM-001, etc.)

#### Tabla User
```sql
CREATE TABLE user (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    `type` integer NOT NULL,
    google_id varchar(255) UNIQUE NOT NULL,
    mail varchar(255) UNIQUE NOT NULL,
    phone bigint NULL,
    name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    is_active boolean,
    is_deleted boolean,
    is_confirmed boolean,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    deleted_by char(36),
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);
```
**Propósito**: Gestión de usuarios con autenticación de Google
**Características Clave**:
- Integración con Google OAuth
- Clasificación de tipos de usuario (ADMIN, DISTRIBUCION, FRANQUICIA, VISITA)
- Workflows de eliminación suave y confirmación
- Traza de auditoría con versionado

### Tablas de Seguridad y Control de Acceso

#### Tabla Role
```sql
CREATE TABLE role (
    id char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    role varchar(50) UNIQUE NOT NULL,
    description text NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);
```

#### Tabla Permission
```sql
CREATE TABLE permission (
    id char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    permission varchar(50) UNIQUE NOT NULL,
    description text NOT NULL,
    `type` integer NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    created_by char(36) NOT NULL,
    updated_by char(36),
    confirmed_by char(36),
    deleted_by char(36),
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);
```

#### Tabla Restriction
```sql
CREATE TABLE restriction (
    id char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    restriction varchar(50) UNIQUE NOT NULL,
    description text NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);
```

---

## 5. Relaciones y Restricciones

### Relaciones de Clave Foránea

#### Relaciones de Gestión de Usuarios
```sql
-- Clasificación de tipo de usuario
user.type → user_type.id

-- Asignaciones de roles (vía role_permissions)
role_permissions.role → role.id
role_permissions.permission → permission.id

-- Asignaciones de restricciones
restriction_roles.restriction → restriction.id
restriction_roles.role → role.id
```

#### Relaciones de Gestión de Productos
```sql
-- Categorización del catálogo
catalog.menu → menu.id
catalog.group → item_group.id
catalog.category → item_category.id
catalog.type → item_type.id
catalog.restriction → restriction.id
catalog.usage_instructions → instruction.id
catalog.configuration → item_configuration.code

-- Configuración de productos
item_configuration.package → package.id
item_configuration_detail.configuration → item_configuration.code
item_configuration_detail.type → instruction_type.id
item_configuration_detail.id_item → (product.code OR material.code OR service.code)

-- Información de empaque
package.package_type → package_type.id
package.transport_type → transport_type.id
package.measure_unit → measure_unit.id
package.storage_instructions → instruction.id
package.transport_instructions → instruction.id
```

#### Relaciones de Proveedores
```sql
-- Clasificación de proveedor
provider.type → provider_type.id
provider.company_bank → bank.id
provider.bank_account_type → bank_account_type.id
provider.dispatch_district → district.id
provider.dispatch_region → region.id

-- Relaciones producto-proveedor
product.provider → provider.id
material.provider → provider.id
service.provider → provider.id
```

#### Relaciones Geográficas
```sql
district.region → region.id
```

### Análisis de Restricciones

#### Restricciones de Clave Primaria
- **IDs Auto-increment**: Usados para tablas de referencia y entidades simples
- **Claves Primarias UUID**: Usadas para entidades sensibles de seguridad (usuarios, roles, permisos)
- **Claves Compuestas**: Ninguna identificada

#### Restricciones Únicas
- **Claves de Negocio**: `provider.provider`, `catalog.sku`, `user.google_id`, `user.mail`
- **Claves del Sistema**: Todos los campos UUID con restricciones únicas
- **Claves Naturales**: `menu.menu`, `item_group.group_name`, `item_category.category`

#### Restricciones Not Null
- **Campos de Negocio Requeridos**: Todos los campos de nombre, descripción y tipo
- **Campos de Auditoría**: `created_by`, `created_at`, `LOG`
- **Campos de Estado**: `is_active`, `is_deleted`, `is_confirmed`

---

## 6. Triggers y Automatización

### Triggers de Generación de UUID

#### Triggers UUID Estándar
```sql
-- Aplicado a: restriction, role_permissions, permission, role, instruction, 
-- catalog, item_configuration, product, material, service, user, user_token

DELIMITER $$
CREATE TRIGGER [table_name]_before_insert
BEFORE INSERT ON [table_name]
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL THEN
        SET NEW.id = UUID();
    END IF;
END$$
DELIMITER ;
```

#### Trigger Personalizado de Código de Proveedor
```sql
CREATE TRIGGER before_insert_provider
BEFORE INSERT ON provider
FOR EACH ROW
BEGIN
  DECLARE prefix VARCHAR(3);
  DECLARE count_same_type INT;

  IF NEW.code IS NULL OR NEW.code = '' THEN
    -- Definir prefijo basado en tipo
    SET prefix = CASE NEW.type
      WHEN 1 THEN 'PVP'  -- Proveedor de Productos
      WHEN 2 THEN 'PVM'  -- Proveedor de Materiales  
      WHEN 3 THEN 'PVS'  -- Proveedor de Servicios
      ELSE 'PVX'         -- Proveedor Desconocido
    END;

    -- Contar proveedores existentes del mismo tipo
    SELECT COUNT(*) + 1 INTO count_same_type
    FROM provider
    WHERE type = NEW.type;

    -- Generar código con formato: PVP-001
    SET NEW.code = CONCAT(prefix, '-', LPAD(count_same_type, 3, '0'));
  END IF;
END
```

### Análisis de Triggers

#### Beneficios
- **Generación Automática de UUID**: Asegura identificadores únicos para sistemas distribuidos
- **Aplicación de Lógica de Negocio**: Los códigos de proveedor siguen convenciones específicas de nomenclatura
- **Integridad de Datos**: Previene valores UUID nulos en campos críticos

#### Consideraciones
- **Impacto en Performance**: Mínimo para generación de UUID, moderado para conteo de códigos de proveedor
- **Escalabilidad**: El trigger de código de proveedor puede volverse más lento con grandes volúmenes de datos
- **Mantenimiento**: Los triggers están controlados por versiones a través de migraciones de Flyway

---

## 7. Flujo de Datos y Lógica de Negocio

### Ciclo de Vida de Productos

#### 1. Flujo de Creación de Productos
```
Creación de Proveedor → Definición de Empaque → Configuración de Item → Entrada al Catálogo
```

#### 2. Gestión de Catálogos
- **Control de Visibilidad**: `catalog.is_visible` y `catalog.is_confirmed`
- **Estrategia de Precios**: `base_gross_price` con `min_quantity_purchase`
- **Sistema de Recomendaciones**: Bandera `chef_recommendation`
- **Gestión de Imágenes**: Múltiples URLs de imagen para diferentes propósitos

#### 3. Gestión de Proveedores
- **Clasificación de Tipos**: Proveedores de Productos, Materiales o Servicios
- **Gestión de Contactos**: Múltiples métodos de contacto y direcciones
- **Integración de Facturación**: Información de cuenta bancaria y pagos
- **Seguimiento Geográfico**: Organización basada en distrito y región

### Control de Acceso de Usuarios

#### 1. Flujo de Autenticación
```
Google OAuth → Creación de Usuario → Asignación de Rol → Asignación de Permisos
```

#### 2. Jerarquía de Permisos
- **Tipos de Permisos**: CATALOG, PRICE, etc.
- **Acceso Basado en Roles**: Los usuarios heredan permisos a través de roles
- **Sistema de Restricciones**: Controles de acceso adicionales para recursos específicos

#### 3. Gestión de Sesiones
- **Basado en Tokens**: Tabla `user_token` para seguimiento de sesiones
- **Seguimiento de IP**: Campo `ip_address` para monitoreo de seguridad
- **Control de Expiración**: Timestamps `expires_at` y `revoked_at`

---

## 8. Seguridad y Control de Acceso

### Sistema de Autenticación
- **Integración OAuth**: Autenticación de Google vía `google_id`
- **Gestión de Sesiones**: Tokens tipo JWT con expiración
- **Multi-factor**: Validación de email y número de teléfono

### Modelo de Autorización
- **RBAC (Control de Acceso Basado en Roles)**: Usuarios → Roles → Permisos
- **Restricciones de Recursos**: Controles de acceso adicionales vía restricciones
- **Traza de Auditoría**: Registro completo de todas las acciones de usuario

### Protección de Datos
- **Soft Delete**: Sin eliminación permanente de datos
- **Control de Versiones**: Todas las entidades mantienen historial de versiones
- **Campos de Auditoría**: Seguimiento de `created_by`, `updated_by`, `deleted_by`

### Consideraciones de Seguridad
- **Claves Primarias UUID**: Previene ataques de enumeración
- **Validación de Entrada**: Tipos de datos y restricciones apropiadas
- **Prevención de SQL Injection**: Consultas parametrizadas recomendadas

---

## 9. Consideraciones de Performance

### Estrategia de Indexación
- **Claves Primarias**: Indexes de auto-increment y UUID
- **Claves Foráneas**: Creación automática de indexes
- **Claves de Negocio**: Las restricciones únicas proporcionan indexes
- **Campos de Búsqueda**: `sku`, `name`, `description` pueden necesitar indexes adicionales

### Optimización de Consultas
- **Performance de Joins**: Relaciones apropiadas de claves foráneas
- **Impacto de Soft Delete**: Los filtros `is_deleted` pueden necesitar indexes
- **Consultas de Rango de Fechas**: Indexes en `created_at`, `updated_at` para reportes

### Consideraciones de Escalabilidad
- **Generación de Códigos de Proveedor**: Puede necesitar optimización para grandes volúmenes de datos
- **Traza de Auditoría**: Monitoreo del tamaño del campo `LOG`
- **URLs de Imágenes**: Considerar integración de CDN para almacenamiento de imágenes

### Puntos de Monitoreo
- **Performance de Triggers**: Monitorear triggers de UUID y códigos de proveedor
- **Validación de Restricciones**: Performance de restricciones de clave foránea
- **Crecimiento de Traza de Auditoría**: Monitorear requisitos de almacenamiento del campo `LOG`

---

## 10. Despliegue e Infraestructura

### Arquitectura de Contenedores
```yaml
services:
  mysql:
    build: ./mysql/
    container_name: mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
    ports:
      - '3306:3306'
    volumes:
      - ./mysql_sbm_vol:/var/lib/mysql
      - ./mysql/my.cnf:/etc/mysql/conf.d/my.cnf

  flyway:
    image: flyway/flyway:9
    command: -connectRetries=60 migrate
    volumes:
      - ./flyway/sql:/flyway/sql
      - ./flyway/flyway.conf:/flyway/conf/flyway.conf
    depends_on:
      - mysql
```

### Estrategia de Migraciones
- **Control de Versiones**: Migraciones gestionadas por Flyway con versionado
- **Soporte de Baseline**: `flyway.baselineOnMigrate=true`
- **Capacidad de Rollback**: Procedimientos manuales de rollback requeridos
- **Gestión de Entornos**: Configuraciones separadas por entorno

### Gestión de Configuración
- **Variables de Entorno**: Credenciales de base de datos y configuraciones de conexión
- **Configuración MySQL**: `my.cnf` personalizado para optimización de performance
- **Aislamiento de Red**: Red Docker para comunicación de servicios

### Respaldo y Recuperación
- **Persistencia de Datos**: Volúmenes Docker para almacenamiento de datos
- **Historial de Migraciones**: Seguimiento de versiones de esquema de Flyway
- **Recuperación Punto en Tiempo**: Logs binarios de MySQL recomendados

---

## 11. Conclusión

La base de datos SBM-SUITE MySQL representa una solución integral para la gestión de distribución y franquicias de pasta. El sistema demuestra:

- **Arquitectura Robusta**: Esquema bien normalizado con relaciones apropiadas
- **Enfoque en Seguridad**: Identificadores basados en UUID y trazas de auditoría completas
- **Diseño Escalable**: Despliegue containerizado con gestión de migraciones
- **Integración de Lógica de Negocio**: Workflows automatizados y validación de datos
- **Mantenibilidad**: Migraciones controladas por versiones y documentación clara

El sistema está listo para producción con medidas de seguridad apropiadas, capacidades de auditoría y arquitectura escalable adecuada para despliegue a nivel empresarial.

---

*Versión de Documentación: 1.0*  
*Última Actualización: 2025-01-27*  
*Versión de Base de Datos: V202506171619*
