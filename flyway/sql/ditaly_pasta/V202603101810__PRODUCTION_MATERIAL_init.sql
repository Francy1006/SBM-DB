
-- provider trigger fix
CREATE OR REPLACE FUNCTION ditaly_pasta.provider_before_insert()
RETURNS TRIGGER AS $$
DECLARE
    next_num INTEGER;
BEGIN
    IF NEW.code IS NULL OR TRIM(NEW.code) = '' THEN

        SELECT COALESCE(
            MAX(CAST(SUBSTRING(TRIM(code) FROM 5) AS INTEGER)),0
        ) + 1
        INTO next_num
        FROM ditaly_pasta.provider
        WHERE TRIM(code) LIKE 'PVP-%';

        NEW.code := 'PVP-' || LPAD(next_num::text,3,'0');

    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- product trigger fix
CREATE OR REPLACE FUNCTION ditaly_pasta.product_before_insert()
RETURNS TRIGGER AS $$
DECLARE
    provider_num TEXT;
    next_num INTEGER;
BEGIN

    -- generar UUID para code
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid();
    END IF;

    -- generar SKU
    IF NEW.sku IS NULL OR TRIM(NEW.sku) = '' THEN

        SELECT SUBSTRING(code FROM 5)
        INTO provider_num
        FROM ditaly_pasta.provider
        WHERE id = NEW.provider;

        SELECT COALESCE(
            MAX(CAST(SUBSTRING(sku FROM '[0-9]+$') AS INTEGER)),0
        ) + 1
        INTO next_num
        FROM ditaly_pasta.product
        WHERE sku LIKE 'P-' || provider_num || '-%';

        NEW.sku := 'P-' || provider_num || '-' || LPAD(next_num::text,4,'0');

    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- material trigger fix
-- MATERIAL
CREATE OR REPLACE FUNCTION ditaly_pasta.material_before_insert()
RETURNS TRIGGER AS $$
DECLARE
    provider_num TEXT;
    next_num INTEGER;
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid();
    END IF;

    IF NEW.sku IS NULL OR TRIM(NEW.sku) = '' THEN
        SELECT SUBSTRING(code FROM 5)
        INTO provider_num
        FROM ditaly_pasta.provider
        WHERE id = NEW.provider;

        SELECT COALESCE(MAX(CAST(SUBSTRING(sku FROM '[0-9]+$') AS INTEGER)),0) + 1
        INTO next_num
        FROM ditaly_pasta.material
        WHERE sku LIKE 'M-' || provider_num || '-%';

        NEW.sku := 'M-' || provider_num || '-' || LPAD(next_num::text,4,'0');
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_material_before_insert ON ditaly_pasta.material;

CREATE TRIGGER trigger_material_before_insert
BEFORE INSERT ON ditaly_pasta.material
FOR EACH ROW
EXECUTE FUNCTION ditaly_pasta.material_before_insert();



-- service trigger fix
CREATE OR REPLACE FUNCTION ditaly_pasta.service_before_insert()
RETURNS TRIGGER AS $$
DECLARE
    provider_num TEXT;
    next_num INTEGER;
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid();
    END IF;

    IF NEW.sku IS NULL OR TRIM(NEW.sku) = '' THEN
        SELECT SUBSTRING(code FROM 5)
        INTO provider_num
        FROM ditaly_pasta.provider
        WHERE id = NEW.provider;

        SELECT COALESCE(MAX(CAST(SUBSTRING(sku FROM '[0-9]+$') AS INTEGER)),0) + 1
        INTO next_num
        FROM ditaly_pasta.service
        WHERE sku LIKE 'S-' || provider_num || '-%';

        NEW.sku := 'S-' || provider_num || '-' || LPAD(next_num::text,4,'0');
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_service_before_insert ON ditaly_pasta.service;

CREATE TRIGGER trigger_service_before_insert
BEFORE INSERT ON ditaly_pasta.service
FOR EACH ROW
EXECUTE FUNCTION ditaly_pasta.service_before_insert();




