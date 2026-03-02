-- PRODUCT TABLES
-- Tablas principales de productos, catálogos y proveedores
-- CATALOG
CREATE TABLE IF NOT EXISTS ditaly_pasta.catalog (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NULL,
    sku varchar(50) NOT NULL,
    menu integer NOT NULL,
    item_group integer NOT NULL,
    category integer NOT NULL,
    type integer NOT NULL,
    restriction char(36) NOT NULL,
    name varchar(50) NOT NULL,
    description text NOT NULL,
    obs varchar(255),
    chef_recommendation boolean NOT NULL DEFAULT false,
    usage_instructions char(36) NOT NULL,
    price char(36) NOT NULL,
    min_quantity_purchase integer NOT NULL DEFAULT 1,
    rations_quantity integer NOT NULL DEFAULT 1,
    cover_image varchar(2083),
    secondary_image varchar(2083),
    complementary_image varchar(2083),
    image_gallery varchar(2083),
    configuration char(36) NOT NULL,
    is_visible boolean NOT NULL DEFAULT true,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);
-- ITEM CONFIGURATION
CREATE TABLE IF NOT EXISTS ditaly_pasta.item_configuration (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    configuration varchar(50) NOT NULL,
    description text NOT NULL,
    package integer NOT NULL,
    variable_formula CHAR(36) NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1,
    FOREIGN KEY (variable_formula) REFERENCES sbm_business.variable_formula(code)
);
-- PACKAGE
CREATE TABLE IF NOT EXISTS sbm_business.package (
    id SERIAL PRIMARY KEY,
    description text NOT NULL,
    package_type integer NOT NULL,
    transport_type integer NOT NULL,
    size decimal(10, 2) NOT NULL DEFAULT 0,
    weight decimal(10, 2) NOT NULL DEFAULT 0,
    measure_unit integer NOT NULL,
    quantity_unit integer NOT NULL DEFAULT 1,
    storage_instructions char(36) NOT NULL,
    transport_instructions char(36) NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36)
);
-- ITEM CONFIGURATION DETAIL
CREATE TABLE IF NOT EXISTS ditaly_pasta.item_configuration_detail (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    detail varchar(50) NOT NULL,
    type integer NOT NULL,
    configuration char(36) NOT NULL,
    id_item char(36) NOT NULL,
    quantity integer NOT NULL DEFAULT 1,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36)
);
-- PRODUCT
-- MATERIAL
CREATE TABLE IF NOT EXISTS ditaly_pasta.material (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    sku varchar(50) NOT NULL,
    description text NOT NULL,
    obs text NOT NULL,
    package_unit integer NOT NULL,
    min_package_purchase integer NOT NULL,
    price char(36) NOT NULL,
    provider integer NOT NULL,
    type integer NOT NULL,
    item_group integer NOT NULL,
    category integer NOT NULL,
    url varchar(255),
    package integer NOT NULL,
    is_active boolean NOT NULL DEFAULT true,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);
-- SERVICE
CREATE TABLE IF NOT EXISTS ditaly_pasta.service (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    sku varchar(50) NOT NULL,
    description text NOT NULL,
    obs text NOT NULL,
    package_unit integer NOT NULL,
    min_package_purchase integer NOT NULL,
    price char(36) NOT NULL,
    provider integer NOT NULL,
    type integer NOT NULL,
    item_group integer NOT NULL,
    category integer NOT NULL,
    url varchar(255),
    is_active boolean NOT NULL DEFAULT true,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);
-- PROVIDER
CREATE TABLE IF NOT EXISTS ditaly_pasta.provider (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    provider varchar(50) UNIQUE NOT NULL,
    type integer NOT NULL,
    rating integer NOT NULL DEFAULT 0,
    obs_provider text NOT NULL,
    contact_name varchar(100),
    contact_mail varchar(255),
    contact_phone bigint,
    contact_phone2 bigint,
    website_url text,
    obs_contact varchar(255),
    company_name varchar(255),
    company_rut varchar(12),
    company_activity varchar(255),
    legal_representative varchar(255),
    billing_address text,
    billing_mail varchar(255),
    billing_phone bigint,
    company_bank integer,
    bank_account_type integer,
    bank_account_number varchar(255),
    bank_account_mail varchar(255),
    dispatch_address varchar(255),
    dispatch_maps_location varchar(255),
    obs_dispatch text,
    dispatch_district integer,
    dispatch_region integer,
    is_active boolean NOT NULL DEFAULT true,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);
-- BANK
CREATE TABLE IF NOT EXISTS sbm_business.bank (
    id SERIAL PRIMARY KEY,
    bank varchar(255) NOT NULL,
    description text NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- TRIGGERS PARA UUID
-- Catalog trigger
CREATE OR REPLACE FUNCTION ditaly_pasta.catalog_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid();
    END IF;
    IF NEW.log IS NULL THEN
        NEW.log := 'init;';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS catalog_before_insert ON ditaly_pasta.catalog;
CREATE TRIGGER catalog_before_insert
    BEFORE INSERT ON ditaly_pasta.catalog
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.catalog_before_insert();

-- Item configuration trigger
CREATE OR REPLACE FUNCTION ditaly_pasta.item_configuration_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid();
    END IF;
    IF NEW.log IS NULL THEN
        NEW.log := 'init;';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS item_configuration_before_insert ON ditaly_pasta.item_configuration;
CREATE TRIGGER item_configuration_before_insert
    BEFORE INSERT ON ditaly_pasta.item_configuration
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.item_configuration_before_insert();

-- Material trigger
CREATE OR REPLACE FUNCTION ditaly_pasta.material_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid();
    END IF;
    IF NEW.log IS NULL THEN
        NEW.log := 'init;';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS material_before_insert ON ditaly_pasta.material;
CREATE TRIGGER material_before_insert
    BEFORE INSERT ON ditaly_pasta.material
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.material_before_insert();

-- Service trigger
CREATE OR REPLACE FUNCTION ditaly_pasta.service_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid();
    END IF;
    IF NEW.log IS NULL THEN
        NEW.log := 'init;';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS service_before_insert ON ditaly_pasta.service;
CREATE TRIGGER service_before_insert
    BEFORE INSERT ON ditaly_pasta.service
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.service_before_insert();

-- Provider trigger
CREATE OR REPLACE FUNCTION ditaly_pasta.provider_before_insert()
RETURNS TRIGGER AS $$
DECLARE
    prefix VARCHAR(3);
    count_same_type INTEGER;
BEGIN
    IF NEW.code IS NULL OR NEW.code = '' THEN
        -- Definir prefijo basado en tipo
        prefix := CASE NEW.type
            WHEN 1 THEN 'PVP'  -- Proveedor de Productos
            WHEN 2 THEN 'PVM'  -- Proveedor de Materiales  
            WHEN 3 THEN 'PVS'  -- Proveedor de Servicios
            ELSE 'PVX'         -- Proveedor Desconocido
        END;
        -- Contar proveedores existentes del mismo tipo
        SELECT COUNT(*) + 1 INTO count_same_type
        FROM ditaly_pasta.provider
        WHERE type = NEW.type;
        -- Generar código con formato: PVP-001
        NEW.code := prefix || '-' || LPAD(count_same_type::text, 3, '0');
    END IF;
    IF NEW.log IS NULL THEN
        NEW.log := 'init;';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS provider_before_insert ON ditaly_pasta.provider;
CREATE TRIGGER provider_before_insert
    BEFORE INSERT ON ditaly_pasta.provider
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.provider_before_insert(); 