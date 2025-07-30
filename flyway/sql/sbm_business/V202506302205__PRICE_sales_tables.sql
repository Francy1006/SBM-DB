-- PRICE & SALES TABLES
-- Tablas de precios, configuración fiscal y fórmulas

-- FISCAL DIRECTIVE
CREATE TABLE IF NOT EXISTS sbm_business.fiscal_directive (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    obs text,
    fiscal_directive varchar(50) UNIQUE NOT NULL,
    type integer NOT NULL,
    percentage decimal(10, 3) NOT NULL DEFAULT 0,
    official_source_url varchar(255) NOT NULL,
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

-- TRIGGERS PARA UUID (PostgreSQL)
-- Trigger para la tabla fiscal_directive
CREATE OR REPLACE FUNCTION fiscal_directive_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_fiscal_directive_before_insert
    BEFORE INSERT ON sbm_business.fiscal_directive
    FOR EACH ROW
    EXECUTE FUNCTION fiscal_directive_before_insert(); 