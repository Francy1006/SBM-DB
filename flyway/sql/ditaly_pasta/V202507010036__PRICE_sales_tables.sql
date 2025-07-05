-- PRICE & SALES TABLES (migrado desde sbm_business)
-- Tablas de precios, configuración fiscal y fórmulas
-- PRICE FISCAL CONFIGURATION
CREATE TABLE IF NOT EXISTS ditaly_pasta.price_fiscal_configuration (
    id char(36) PRIMARY KEY,
    fiscal_configuration varchar(50) UNIQUE NOT NULL,
    fiscal_formula char(36) NOT NULL,
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

-- PRICE
CREATE TABLE IF NOT EXISTS ditaly_pasta.price (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    net_amount integer NOT NULL DEFAULT 0,
    gross_amount integer NOT NULL DEFAULT 0,
    iva_amount integer NOT NULL DEFAULT 0,
    retention_amount integer NOT NULL DEFAULT 0,
    price_fiscal_configuration char(36) NOT NULL,
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
    deleted_by char(36)
);

-- FISCAL CONFIGURATION DETAIL
CREATE TABLE IF NOT EXISTS ditaly_pasta.fiscal_configuration_detail (
    id SERIAL PRIMARY KEY,
    price_fiscal_configuration char(36) NOT NULL,
    price char(36) NOT NULL,
    fiscal_directive char(36) NOT NULL,
    log text NOT NULL
);

-- TRIGGERS PARA UUID
-- Price fiscal configuration trigger
CREATE OR REPLACE FUNCTION ditaly_pasta.price_fiscal_configuration_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id IS NULL THEN
        NEW.id := gen_random_uuid();
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS price_fiscal_configuration_before_insert ON ditaly_pasta.price_fiscal_configuration;
CREATE TRIGGER price_fiscal_configuration_before_insert
    BEFORE INSERT ON ditaly_pasta.price_fiscal_configuration
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.price_fiscal_configuration_before_insert();

-- Price trigger
CREATE OR REPLACE FUNCTION ditaly_pasta.price_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid();
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS price_before_insert ON ditaly_pasta.price;
CREATE TRIGGER price_before_insert
    BEFORE INSERT ON ditaly_pasta.price
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.price_before_insert();

-- Fiscal configuration detail trigger
CREATE OR REPLACE FUNCTION ditaly_pasta.fiscal_configuration_detail_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.log IS NULL THEN
        NEW.log := 'init;';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS fiscal_configuration_detail_before_insert ON ditaly_pasta.fiscal_configuration_detail;
CREATE TRIGGER fiscal_configuration_detail_before_insert
    BEFORE INSERT ON ditaly_pasta.fiscal_configuration_detail
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.fiscal_configuration_detail_before_insert(); 