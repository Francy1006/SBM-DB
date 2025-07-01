-- PRICE & SALES TABLES
-- Tablas de precios, configuración fiscal y fórmulas

-- FISCAL FORMULA
CREATE TABLE IF NOT EXISTS fiscal_formula (
    id char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    formula varchar(50) NOT NULL,
    formula_template text NOT NULL,
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

-- PRICE FISCAL CONFIGURATION
CREATE TABLE IF NOT EXISTS price_fiscal_configuration (
    id char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    fiscal_configuration varchar(50) UNIQUE NOT NULL,
    fiscal_formula char(36) NOT NULL,
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

-- FISCAL DIRECTIVE
CREATE TABLE IF NOT EXISTS fiscal_directive (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    obs text,
    fiscal_directive varchar(50) UNIQUE NOT NULL,
    `type` integer NOT NULL,
    percentage decimal(10, 2) NOT NULL DEFAULT 0,
    official_source_url varchar(255) NOT NULL,
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

-- PRICE
CREATE TABLE IF NOT EXISTS price (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    net_amount integer NOT NULL DEFAULT 0,
    gross_amount integer NOT NULL DEFAULT 0,
    iva_amount integer NOT NULL DEFAULT 0,
    price_fiscal_configuration char(36) NOT NULL,
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
    deleted_by char(36)
);

-- FISCAL CONFIGURATION DETAIL
CREATE TABLE IF NOT EXISTS fiscal_configuration_detail (
    id integer AUTO_INCREMENT,
    price_fiscal_configuration char(36) NOT NULL,
    price char(36) NOT NULL,
    fiscal_directive char(36) NOT NULL,
    log text NOT NULL,
    PRIMARY KEY (id, price, fiscal_directive)
);

-- TRIGGERS PARA UUID
DELIMITER $$

DROP TRIGGER IF EXISTS fiscal_formula_before_insert$$
CREATE TRIGGER fiscal_formula_before_insert
BEFORE INSERT ON fiscal_formula
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL THEN
        SET NEW.id = UUID();
    END IF;
END$$

DROP TRIGGER IF EXISTS price_fiscal_configuration_before_insert$$
CREATE TRIGGER price_fiscal_configuration_before_insert
BEFORE INSERT ON price_fiscal_configuration
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL THEN
        SET NEW.id = UUID();
    END IF;
END$$

DROP TRIGGER IF EXISTS fiscal_directive_before_insert$$
CREATE TRIGGER fiscal_directive_before_insert
BEFORE INSERT ON fiscal_directive
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
END$$

DROP TRIGGER IF EXISTS price_before_insert$$
CREATE TRIGGER price_before_insert
BEFORE INSERT ON price
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
END$$

DROP TRIGGER IF EXISTS fiscal_configuration_detail_before_insert$$
CREATE TRIGGER fiscal_configuration_detail_before_insert
BEFORE INSERT ON fiscal_configuration_detail
FOR EACH ROW
BEGIN
    IF NEW.log IS NULL THEN
        SET NEW.log = "init;";
    END IF;
END$$

DELIMITER ; 