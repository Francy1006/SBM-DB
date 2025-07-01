-- PRODUCT TABLES
-- Tablas principales de productos, catálogos y proveedores

-- CATALOG
CREATE TABLE IF NOT EXISTS catalog (
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
    obs varchar(255),
    chef_recommendation boolean NOT NULL DEFAULT 0,
    usage_instructions char(36) NOT NULL,
    price char(36) NOT NULL,
    min_quantity_purchase integer NOT NULL DEFAULT 1,
    rations_quantity integer NOT NULL DEFAULT 1,
    cover_image varchar(2083),
    secondary_image varchar(2083),
    complementary_image varchar(2083),
    image_gallery varchar(2083),
    configuration char(36) NOT NULL,
    is_visible boolean NOT NULL DEFAULT 1,
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
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- ITEM CONFIGURATION
CREATE TABLE IF NOT EXISTS item_configuration (
    id int PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    configuration varchar(50) NOT NULL,
    description text NOT NULL,
    package integer NOT NULL,
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
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- PACKAGE
CREATE TABLE IF NOT EXISTS package (
    id integer PRIMARY KEY AUTO_INCREMENT,
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
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36)
);

-- ITEM CONFIGURATION DETAIL
CREATE TABLE IF NOT EXISTS item_configuration_detail (
    code char(36) NOT NULL,
    detail varchar(50) NOT NULL,
    type integer NOT NULL,
    configuration char(36) NOT NULL,
    id_item char(36) NOT NULL,
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
    PRIMARY KEY (code, type, id_item)
);

-- PRODUCT
-- MATERIAL
CREATE TABLE IF NOT EXISTS material (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    sku varchar(50) NOT NULL,
    description text NOT NULL,
    obs text NOT NULL,
    package_unit integer NOT NULL,
    min_package_purchase integer NOT NULL,
    price char(36) NOT NULL,
    provider integer NOT NULL,
    `type` integer NOT NULL,
    `group` integer NOT NULL,
    category integer NOT NULL,
    url varchar(255),
    package integer NOT NULL,
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
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- SERVICE
CREATE TABLE IF NOT EXISTS service (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    sku varchar(50) NOT NULL,
    description text NOT NULL,
    obs text NOT NULL,
    package_unit integer NOT NULL,
    min_package_purchase integer NOT NULL,
    price char(36) NOT NULL,
    provider integer NOT NULL,
    `type` integer NOT NULL,
    `group` integer NOT NULL,
    category integer NOT NULL,
    url varchar(255),
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
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- PROVIDER
CREATE TABLE IF NOT EXISTS provider (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'CUSTOM TRIGGER',
    provider varchar(50) UNIQUE NOT NULL,
    `type` integer NOT NULL,
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
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- BANK
CREATE TABLE IF NOT EXISTS bank (
    id integer PRIMARY KEY AUTO_INCREMENT,
    bank varchar(255) NOT NULL,
    description text NOT NULL,
    created_at datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

-- TRIGGERS PARA UUID
DELIMITER $$

DROP TRIGGER IF EXISTS catalog_before_insert$$
CREATE TRIGGER catalog_before_insert
BEFORE INSERT ON catalog
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
    IF NEW.log IS NULL THEN
        SET NEW.log = "init;";
    END IF;
END$$

DROP TRIGGER IF EXISTS item_configuration_before_insert$$
CREATE TRIGGER item_configuration_before_insert
BEFORE INSERT ON item_configuration
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
    IF NEW.log IS NULL THEN
        SET NEW.log = "init;";
    END IF;
END$$

DROP TRIGGER IF EXISTS product_before_insert$$
CREATE TRIGGER product_before_insert
BEFORE INSERT ON product
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
    IF NEW.log IS NULL THEN
        SET NEW.log = "init;";
    END IF;
END$$

DROP TRIGGER IF EXISTS material_before_insert$$
CREATE TRIGGER material_before_insert
BEFORE INSERT ON material
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
    IF NEW.log IS NULL THEN
        SET NEW.log = "init;";
    END IF;
END$$

DROP TRIGGER IF EXISTS service_before_insert$$
CREATE TRIGGER service_before_insert
BEFORE INSERT ON service
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
    IF NEW.log IS NULL THEN
        SET NEW.log = "init;";
    END IF;
END$$

DROP TRIGGER IF EXISTS before_insert_provider$$
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
  IF NEW.log IS NULL THEN
    SET NEW.log = "init;";
  END IF;
END$$

DELIMITER ; 