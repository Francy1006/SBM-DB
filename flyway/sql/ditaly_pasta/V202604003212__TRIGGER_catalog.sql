
CREATE OR REPLACE FUNCTION ditaly_pasta.generate_catalog_sku()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
    v_menu_txt text;
    v_next_correlative integer;
BEGIN
    -- Solo generar si viene nulo o vacío
    IF NEW.sku IS NULL OR btrim(NEW.sku) = '' THEN
        -- menu en formato xx
        v_menu_txt := lpad(NEW.menu::text, 2, '0');

        -- siguiente correlativo por menú, comenzando en 0000
        SELECT COALESCE(
            MAX(
                SUBSTRING(sku FROM 'CTG-\d{2}-(\d{4})$')::integer
            ),
            -1
        ) + 1
        INTO v_next_correlative
        FROM ditaly_pasta.catalog
        WHERE menu = NEW.menu
          AND sku ~ '^CTG-\d{2}-\d{4}$';

        NEW.sku := 'CTG-' || v_menu_txt || '-' || lpad(v_next_correlative::text, 4, '0');
    END IF;

    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS catalog_generate_sku_before_insert
ON ditaly_pasta.catalog;

CREATE TRIGGER catalog_generate_sku_before_insert
BEFORE INSERT ON ditaly_pasta.catalog
FOR EACH ROW
EXECUTE FUNCTION ditaly_pasta.generate_catalog_sku();
