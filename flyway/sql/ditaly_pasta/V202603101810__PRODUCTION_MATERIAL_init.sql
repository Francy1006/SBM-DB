-- provider trigger fix
CREATE OR REPLACE FUNCTION ditaly_pasta.provider_before_insert() RETURNS TRIGGER AS $$
DECLARE next_num INTEGER;
BEGIN IF NEW.code IS NULL
OR TRIM(NEW.code) = '' THEN
SELECT COALESCE(
        MAX(
            CAST(
                SUBSTRING(
                    TRIM(code)
                    FROM 5
                ) AS INTEGER
            )
        ),
        0
    ) + 1 INTO next_num
FROM ditaly_pasta.provider
WHERE TRIM(code) LIKE 'PVP-%';
NEW.code := 'PVP-' || LPAD(next_num::text, 3, '0');
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- product trigger fix
CREATE OR REPLACE FUNCTION ditaly_pasta.product_before_insert() RETURNS TRIGGER AS $$
DECLARE provider_num TEXT;
next_num INTEGER;
BEGIN -- generar UUID para code
IF NEW.code IS NULL THEN NEW.code := gen_random_uuid();
END IF;
-- generar SKU
IF NEW.sku IS NULL
OR TRIM(NEW.sku) = '' THEN
SELECT SUBSTRING(
        code
        FROM 5
    ) INTO provider_num
FROM ditaly_pasta.provider
WHERE id = NEW.provider;
SELECT COALESCE(
        MAX(
            CAST(
                SUBSTRING(
                    sku
                    FROM '[0-9]+$'
                ) AS INTEGER
            )
        ),
        0
    ) + 1 INTO next_num
FROM ditaly_pasta.product
WHERE sku LIKE 'P-' || provider_num || '-%';
NEW.sku := 'P-' || provider_num || '-' || LPAD(next_num::text, 4, '0');
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- material trigger fix
-- MATERIAL
CREATE OR REPLACE FUNCTION ditaly_pasta.material_before_insert() RETURNS TRIGGER AS $$
DECLARE provider_num TEXT;
next_num INTEGER;
BEGIN IF NEW.code IS NULL THEN NEW.code := gen_random_uuid();
END IF;
IF NEW.sku IS NULL
OR TRIM(NEW.sku) = '' THEN
SELECT SUBSTRING(
        code
        FROM 5
    ) INTO provider_num
FROM ditaly_pasta.provider
WHERE id = NEW.provider;
SELECT COALESCE(
        MAX(
            CAST(
                SUBSTRING(
                    sku
                    FROM '[0-9]+$'
                ) AS INTEGER
            )
        ),
        0
    ) + 1 INTO next_num
FROM ditaly_pasta.material
WHERE sku LIKE 'M-' || provider_num || '-%';
NEW.sku := 'M-' || provider_num || '-' || LPAD(next_num::text, 4, '0');
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
DROP TRIGGER IF EXISTS trigger_material_before_insert ON ditaly_pasta.material;
CREATE TRIGGER trigger_material_before_insert BEFORE
INSERT ON ditaly_pasta.material FOR EACH ROW EXECUTE FUNCTION ditaly_pasta.material_before_insert();
-- service trigger fix
CREATE OR REPLACE FUNCTION ditaly_pasta.service_before_insert() RETURNS TRIGGER AS $$
DECLARE provider_num TEXT;
next_num INTEGER;
BEGIN IF NEW.code IS NULL THEN NEW.code := gen_random_uuid();
END IF;
IF NEW.sku IS NULL
OR TRIM(NEW.sku) = '' THEN
SELECT SUBSTRING(
        code
        FROM 5
    ) INTO provider_num
FROM ditaly_pasta.provider
WHERE id = NEW.provider;
SELECT COALESCE(
        MAX(
            CAST(
                SUBSTRING(
                    sku
                    FROM '[0-9]+$'
                ) AS INTEGER
            )
        ),
        0
    ) + 1 INTO next_num
FROM ditaly_pasta.service
WHERE sku LIKE 'S-' || provider_num || '-%';
NEW.sku := 'S-' || provider_num || '-' || LPAD(next_num::text, 4, '0');
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
DROP TRIGGER IF EXISTS trigger_service_before_insert ON ditaly_pasta.service;
CREATE TRIGGER trigger_service_before_insert BEFORE
INSERT ON ditaly_pasta.service FOR EACH ROW EXECUTE FUNCTION ditaly_pasta.service_before_insert();
INSERT INTO ditaly_pasta.material (
        code,
        sku,
        description,
        obs,
        package_unit,
        min_package_purchase,
        gross_price,
        provider,
        "type",
        item_group,
        category,
        url,
        package,
        is_active,
        is_deleted,
        is_confirmed,
        created_at,
        updated_at,
        confirmed_at,
        deleted_at,
        created_by,
        confirmed_by,
        updated_by,
        deleted_by,
        log,
        "version",
        price
    )
VALUES(
        '21548b81-ec3e-4727-8496-b7e7f3185c34',
        'M-003-0001',
        'POTE POLIPAPEL BLANCO 16OZ (528 UNIDADES)',
        'POTE POLIPAPEL BLANCO 16 ONZAS (500 ML, 528 UNIDADES)',
        1,
        1,
        0,
        3,
        3,
        1,
        4,
        NULL,
        4,
        true,
        NULL,
        true,
        '2026-03-12 20:54:08.519',
        NULL,
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        NULL,
        'init;',
        1,
        'de1875d2-d9c6-4ecc-84cc-aa5811bbba15'
    );
INSERT INTO ditaly_pasta.material (
        code,
        sku,
        description,
        obs,
        package_unit,
        min_package_purchase,
        gross_price,
        provider,
        "type",
        item_group,
        category,
        url,
        package,
        is_active,
        is_deleted,
        is_confirmed,
        created_at,
        updated_at,
        confirmed_at,
        deleted_at,
        created_by,
        confirmed_by,
        updated_by,
        deleted_by,
        log,
        "version",
        price
    )
VALUES(
        'f03d9cd9-d231-4392-9946-5b4b7843e67d',
        'M-003-0002',
        'TAPA POTE PET TRANSPARENTE 16 ONZAS (528 UNIDADES)',
        'TAPA POTE PET TRANSPARENTE 16 ONZAS (528 UNIDADES)',
        1,
        1,
        0,
        3,
        3,
        1,
        4,
        NULL,
        5,
        true,
        NULL,
        true,
        '2026-03-12 20:59:13.579',
        NULL,
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        NULL,
        'init;',
        1,
        '8ee6c0ff-290c-4a08-a0d1-d91d7ebf0dab'
    );
INSERT INTO ditaly_pasta.material (
        code,
        sku,
        description,
        obs,
        package_unit,
        min_package_purchase,
        gross_price,
        provider,
        "type",
        item_group,
        category,
        url,
        package,
        is_active,
        is_deleted,
        is_confirmed,
        created_at,
        updated_at,
        confirmed_at,
        deleted_at,
        created_by,
        confirmed_by,
        updated_by,
        deleted_by,
        log,
        "version",
        price
    )
VALUES(
        '1d693b47-761d-4bb2-a34e-b1ef7b3c241d',
        'M-005-0001',
        'ETIQUETA REDONDA DITALY PASTA (600 UNIDADES)',
        'ETIQUETA REDONDA DITALY PASTA 6 X 6 CMS (600 UNIDADES)',
        1,
        1,
        0,
        5,
        3,
        1,
        4,
        NULL,
        6,
        true,
        NULL,
        true,
        '2026-03-12 21:22:04.251',
        NULL,
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        NULL,
        'init;',
        1,
        '4c616008-974f-49a5-8d7a-d51e730f03f1'
    );