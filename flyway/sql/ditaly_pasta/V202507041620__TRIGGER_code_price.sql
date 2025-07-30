-- Trigger para asignar UUID a code en ditaly_pasta.price si es NULL
CREATE OR REPLACE FUNCTION ditaly_pasta.price_before_insert() RETURNS TRIGGER AS $$ BEGIN IF NEW.code IS NULL THEN NEW.code := gen_random_uuid()::text;
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
DROP TRIGGER IF EXISTS trigger_price_before_insert ON ditaly_pasta.price;
CREATE TRIGGER trigger_price_before_insert BEFORE
INSERT ON ditaly_pasta.price FOR EACH ROW EXECUTE FUNCTION ditaly_pasta.price_before_insert();
INSERT INTO ditaly_pasta.product (
        id,
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
OVERRIDING SYSTEM VALUE
VALUES(
        1,
        'ab288ad1-4667-4220-956f-f568fe024c58',
        'P01-FETHUE150',
        'FETUCCINI AL HUEVO 1.5 KG (10 X 150 GR)',
        'Fetuccini al huevo 10 porciones x 150 grs',
        10,
        3,
        0,
        1,
        1,
        1,
        1,
        NULL,
        1,
        true,
        NULL,
        true,
        '2025-07-19 20:51:06.004',
        NULL,
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        NULL,
        'init;',
        1,
        '246e04ea-7b6f-4277-ac65-4930205d3679'
    );
INSERT INTO ditaly_pasta.price (
        id,
        code,
        base_net_amount,
        net_amount,
        gross_amount,
        iva_amount,
        aditional_tax_amount,
        retention_amount,
        price_configuration,
        is_current,
        is_deleted,
        is_confirmed,
        created_at,
        created_by,
        record_item_code,
        price_record_type
    )
OVERRIDING SYSTEM VALUE
VALUES(
        1,
        '246e04ea-7b6f-4277-ac65-4930205d3679',
        5660,
        0,
        0,
        0,
        0,
        0,
        'cd746343-baf4-4359-b2e6-9bd829631e30',
        true,
        NULL,
        true,
        '2025-07-20 16:44:18.208',
        '1b4ec1e3-2b23-461f-83f7-3901f77c5ddc',
        NULL,
        NULL
    );
INSERT INTO ditaly_pasta.price_type_record (id, "type", description)
OVERRIDING SYSTEM VALUE
VALUES(1, 'PRODUCT', 'PRODUCT ITEMS');
INSERT INTO ditaly_pasta.price_type_record (id, "type", description)
OVERRIDING SYSTEM VALUE
VALUES(2, 'MATERIAL', 'MATERIAL ITEMS');
INSERT INTO ditaly_pasta.price_type_record (id, "type", description)
OVERRIDING SYSTEM VALUE
VALUES(3, 'SERVICE', 'SERVICE ITEMS');
INSERT INTO ditaly_pasta.price_type_record (id, "type", description)
OVERRIDING SYSTEM VALUE
VALUES(4, 'CATALOG', 'CATALOG ITEMS');
INSERT INTO ditaly_pasta.price_type_record (id, "type", description)
OVERRIDING SYSTEM VALUE
VALUES(5, 'TICKET', 'TICKET ITEMS');

-- Actualizar las secuencias después de las inserciones manuales
SELECT setval('ditaly_pasta.product_id_seq', (SELECT MAX(id) FROM ditaly_pasta.product), true);
SELECT setval('ditaly_pasta.price_id_seq', (SELECT MAX(id) FROM ditaly_pasta.price), true);
SELECT setval('ditaly_pasta.price_type_record_id_seq', (SELECT MAX(id) FROM ditaly_pasta.price_type_record), true);