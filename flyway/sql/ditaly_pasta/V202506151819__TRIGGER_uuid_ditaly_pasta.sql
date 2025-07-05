-- TRIGGERS PARA UUID (PostgreSQL)
-- Trigger para la tabla catalog
CREATE OR REPLACE FUNCTION catalog_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_catalog_before_insert
    BEFORE INSERT ON ditaly_pasta.catalog
    FOR EACH ROW
    EXECUTE FUNCTION catalog_before_insert();

-- Trigger para la tabla item_configuration
CREATE OR REPLACE FUNCTION item_configuration_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_item_configuration_before_insert
    BEFORE INSERT ON ditaly_pasta.item_configuration
    FOR EACH ROW
    EXECUTE FUNCTION item_configuration_before_insert();

-- Trigger para la tabla product
CREATE OR REPLACE FUNCTION product_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_product_before_insert
    BEFORE INSERT ON ditaly_pasta.product
    FOR EACH ROW
    EXECUTE FUNCTION product_before_insert();

-- Trigger para la tabla material
CREATE OR REPLACE FUNCTION material_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_material_before_insert
    BEFORE INSERT ON ditaly_pasta.material
    FOR EACH ROW
    EXECUTE FUNCTION material_before_insert();

-- Trigger para la tabla service
CREATE OR REPLACE FUNCTION service_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_service_before_insert
    BEFORE INSERT ON ditaly_pasta.service
    FOR EACH ROW
    EXECUTE FUNCTION service_before_insert(); 