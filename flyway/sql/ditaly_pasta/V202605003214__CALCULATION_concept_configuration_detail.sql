CREATE EXTENSION IF NOT EXISTS "pgcrypto";
-- =========================
-- TABLE: price_configuration_detail (FIX UUID)
-- =========================
CREATE TABLE IF NOT EXISTS ditaly_pasta.price_configuration_detail (
    id SERIAL PRIMARY KEY,
    code UUID NOT NULL DEFAULT gen_random_uuid() UNIQUE,
    price_configuration CHAR(36) NOT NULL,
    calculation_concept UUID NOT NULL,
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
-- =========================
-- DATA FIX (usar UUID real, no TEXT)
-- =========================
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
        '11b4efec-afe8-465c-8599-2b0b0742e127'::uuid,
        'net_amount',
        'Precio neto final',
        6,
        true,
        NOW(),
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002'::uuid,
        NULL
    ),
    (
        9,
        '5b227a97-da11-4d7c-8b4d-08e3f3be0ba9'::uuid,
        'gross_amount',
        'Precio bruto final',
        6,
        true,
        NOW(),
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002'::uuid,
        NULL
    ),
    (
        10,
        '9f64a11f-05da-4dad-a501-26773492df48'::uuid,
        'iva_amount',
        'Monto IVA',
        6,
        true,
        NOW(),
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002'::uuid,
        NULL
    ),
    (
        11,
        '20c03de3-69a6-4cdb-ad93-9c79621d45a2'::uuid,
        'aditional_tax_amount',
        'Impuesto adicional',
        6,
        true,
        NOW(),
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002'::uuid,
        NULL
    ),
    (
        12,
        'a1fe734c-50d7-476f-aec7-273dea527f1c'::uuid,
        'retention_amount',
        'Monto retención',
        6,
        true,
        NOW(),
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002'::uuid,
        NULL
    ) ON CONFLICT (id) DO NOTHING;
INSERT INTO ditaly_pasta.price_configuration_detail (
        code,
        price_configuration,
        calculation_concept,
        is_required,
        is_active,
        created_by
    )
VALUES (
        '2c5f0ab6-dc0e-4542-9879-5a3cfc17128f'::uuid,
        'cd746343-baf4-4359-b2e6-9bd829631e30'::uuid,
        '9f64a11f-05da-4dad-a501-26773492df48'::uuid,
        true,
        true,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002'::uuid
    ),
    (
        '68b9870c-f332-4500-a23a-df0c530a2b0c'::uuid,
        'cd746343-baf4-4359-b2e6-9bd829631e30'::uuid,
        '5b227a97-da11-4d7c-8b4d-08e3f3be0ba9'::uuid,
        true,
        true,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002'::uuid
    ),
    (
        '7f1d3ef1-47bc-4229-a689-8f0e53aa0416'::uuid,
        'cd746343-baf4-4359-b2e6-9bd829631e30'::uuid,
        '11b4efec-afe8-465c-8599-2b0b0742e127'::uuid,
        true,
        true,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002'::uuid
    ) ON CONFLICT (code) DO NOTHING;