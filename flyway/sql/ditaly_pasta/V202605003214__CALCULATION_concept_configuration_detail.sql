-- extension para generar uuid
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
-- =========================
-- TABLE: calculation_concept
-- =========================
CREATE TABLE sbm_business.calculation_concept (
    id SERIAL PRIMARY KEY,
    code CHAR(36) NOT NULL UNIQUE,
    field_name VARCHAR(50) NOT NULL,
    description TEXT,
    data_type VARCHAR(20) NOT NULL DEFAULT 'decimal',
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL,
    created_by CHAR(36) NOT NULL,
    updated_by CHAR(36) NULL,
    CONSTRAINT fk_calculation_concept_created_by FOREIGN KEY (created_by) REFERENCES sbm_business."user"(code),
    CONSTRAINT fk_calculation_concept_updated_by FOREIGN KEY (updated_by) REFERENCES sbm_business."user"(code)
);
-- trigger para generar UUID como texto
CREATE OR REPLACE FUNCTION sbm_business.fn_calculation_concept_uuid() RETURNS trigger AS $$ BEGIN IF NEW.code IS NULL THEN NEW.code := gen_random_uuid()::text;
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_calculation_concept_uuid BEFORE
INSERT ON sbm_business.calculation_concept FOR EACH ROW EXECUTE FUNCTION sbm_business.fn_calculation_concept_uuid();
-- =========================
-- TABLE: price_configuration_detail
-- =========================
CREATE TABLE ditaly_pasta.price_configuration_detail (
    id SERIAL PRIMARY KEY,
    code CHAR(36) NOT NULL UNIQUE,
    price_configuration CHAR(36) NOT NULL,
    calculation_concept CHAR(36) NOT NULL,
    label VARCHAR(100) NOT NULL,
    format_type VARCHAR(50) NOT NULL DEFAULT 'currency_int',
    is_required BOOLEAN NOT NULL DEFAULT TRUE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL,
    created_by CHAR(36) NOT NULL,
    updated_by CHAR(36) NULL,
    CONSTRAINT fk_pcd_price_configuration FOREIGN KEY (price_configuration) REFERENCES ditaly_pasta.price_configuration(code),
    CONSTRAINT fk_pcd_calculation_concept FOREIGN KEY (calculation_concept) REFERENCES sbm_business.calculation_concept(code),
    CONSTRAINT fk_pcd_created_by FOREIGN KEY (created_by) REFERENCES sbm_business."user"(code),
    CONSTRAINT fk_pcd_updated_by FOREIGN KEY (updated_by) REFERENCES sbm_business."user"(code),
    CONSTRAINT uq_price_config_concept UNIQUE (price_configuration, calculation_concept)
);
-- trigger uuid texto
CREATE OR REPLACE FUNCTION ditaly_pasta.fn_pcd_uuid() RETURNS trigger AS $$ BEGIN IF NEW.code IS NULL THEN NEW.code := gen_random_uuid()::text;
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_pcd_uuid BEFORE
INSERT ON ditaly_pasta.price_configuration_detail FOR EACH ROW EXECUTE FUNCTION ditaly_pasta.fn_pcd_uuid();
INSERT INTO sbm_business.calculation_concept (
        id,
        code,
        field_name,
        description,
        data_type,
        is_active,
        created_at,
        updated_at,
        created_by,
        updated_by
    )
VALUES (
        8,
        '11b4efec-afe8-465c-8599-2b0b0742e127',
        'net_amount',
        'Precio neto final',
        'decimal',
        true,
        '2026-04-17 16:14:43.365',
        null,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        null
    ),
    (
        9,
        '5b227a97-da11-4d7c-8b4d-08e3f3be0ba9',
        'gross_amount',
        'Precio bruto final',
        'decimal',
        true,
        '2026-04-17 16:14:43.365',
        null,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        null
    ),
    (
        10,
        '9f64a11f-05da-4dad-a501-26773492df48',
        'iva_amount',
        'Monto IVA',
        'decimal',
        true,
        '2026-04-17 16:14:43.365',
        null,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        null
    ),
    (
        11,
        '20c03de3-69a6-4cdb-ad93-9c79621d45a2',
        'aditional_tax_amount',
        'Impuesto adicional',
        'decimal',
        true,
        '2026-04-17 16:14:43.365',
        null,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        null
    ),
    (
        12,
        'a1fe734c-50d7-476f-aec7-273dea527f1c',
        'retention_amount',
        'Monto retención',
        'decimal',
        true,
        '2026-04-17 16:14:43.365',
        null,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        null
    );
INSERT INTO ditaly_pasta.price_configuration_detail (
        code,
        price_configuration,
        calculation_concept,
        "label",
        format_type,
        is_required,
        is_active,
        created_at,
        updated_at,
        created_by,
        updated_by
    )
VALUES (
        '2c5f0ab6-dc0e-4542-9879-5a3cfc17128f',
        'cd746343-baf4-4359-b2e6-9bd829631e30',
        '9f64a11f-05da-4dad-a501-26773492df48',
        'IVA COMPRA',
        '5',
        true,
        true,
        '2026-04-24 23:05:07.122',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL
    ),
    (
        '68b9870c-f332-4500-a23a-df0c530a2b0c',
        'cd746343-baf4-4359-b2e6-9bd829631e30',
        '5b227a97-da11-4d7c-8b4d-08e3f3be0ba9',
        'BRUTO COSTO',
        '5',
        true,
        true,
        '2026-04-24 23:05:07.122',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL
    ),
    (
        '7f1d3ef1-47bc-4229-a689-8f0e53aa0416',
        'cd746343-baf4-4359-b2e6-9bd829631e30',
        '11b4efec-afe8-465c-8599-2b0b0742e127',
        'NETO COSTO',
        '5',
        true,
        true,
        '2026-04-24 23:05:07.122',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL
    );