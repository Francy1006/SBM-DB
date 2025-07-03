-- PRICE & SALES TABLES
-- Tablas de precios, configuración fiscal y fórmulas

-- FISCAL FORMULA
CREATE TABLE IF NOT EXISTS sbm_business.fiscal_formula (
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

-- FISCAL DIRECTIVE
CREATE TABLE IF NOT EXISTS sbm_business.fiscal_directive (
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

-- TRIGGERS PARA UUID
DELIMITER $$

DROP TRIGGER IF EXISTS fiscal_formula_before_insert$$
CREATE TRIGGER fiscal_formula_before_insert
BEFORE INSERT ON sbm_business.fiscal_formula
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL THEN
        SET NEW.id = UUID();
    END IF;
END$$

DROP TRIGGER IF EXISTS fiscal_directive_before_insert$$
CREATE TRIGGER fiscal_directive_before_insert
BEFORE INSERT ON sbm_business.fiscal_directive
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
END$$

DELIMITER ; 