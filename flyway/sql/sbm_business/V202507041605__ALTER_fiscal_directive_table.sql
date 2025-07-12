-- ALTER FISCAL_DIRECTIVE TABLE
-- Ajusta las columnas month, end_month, year y end_year según el modelo actualizado
-- Agrega la columna month (NULL) después de deleted_at
ALTER TABLE sbm_business.fiscal_directive
ADD COLUMN IF NOT EXISTS month integer NULL;
-- Agrega la columna end_month (NULL) después de month
ALTER TABLE sbm_business.fiscal_directive
ADD COLUMN IF NOT EXISTS end_month integer NULL;
-- Agrega la columna year (NOT NULL) después de end_month
ALTER TABLE sbm_business.fiscal_directive
ADD COLUMN IF NOT EXISTS year integer NOT NULL DEFAULT 2025;
-- Agrega la columna end_year (NULL) después de year
ALTER TABLE sbm_business.fiscal_directive
ADD COLUMN IF NOT EXISTS end_year integer NULL;
-- Elimina el default después de agregar la columna
ALTER TABLE sbm_business.fiscal_directive
ALTER COLUMN year DROP DEFAULT;
-- Comentarios para documentar el cambio
COMMENT ON COLUMN sbm_business.fiscal_directive.month IS 'Mes de inicio de vigencia de la directiva fiscal (opcional)';
COMMENT ON COLUMN sbm_business.fiscal_directive.end_month IS 'Mes de término de vigencia de la directiva fiscal (opcional)';
COMMENT ON COLUMN sbm_business.fiscal_directive.year IS 'Año de vigencia de la directiva fiscal (obligatorio)';
COMMENT ON COLUMN sbm_business.fiscal_directive.end_year IS 'Año de término de vigencia de la directiva fiscal (opcional)';
-- Actualizar observaciones existentes (solo si existen)
UPDATE sbm_business.fiscal_directive
SET obs = 'Retención de boletas de honorarios según ley de modernización tributaria. Vigente desde enero 2025.'
WHERE fiscal_directive = 'RETENCION_14_5_2025'
    AND obs IS NULL;
UPDATE sbm_business.fiscal_directive
SET obs = 'Impuesto IABA para bebidas energéticas hasta junio 2025.'
WHERE fiscal_directive = 'IABA_ENERGETICAS_27_2025H1'
    AND obs IS NULL;
UPDATE sbm_business.fiscal_directive
SET obs = 'Impuesto IABA para bebidas energéticas con aumento al 30% desde julio 2025.'
WHERE fiscal_directive = 'IABA_ENERGETICAS_30_2025H2'
    AND obs IS NULL;
UPDATE sbm_business.fiscal_directive
SET obs = 'Impuesto del 19% aplicado a servicios digitales prestados desde el extranjero. Vigente desde 2025.'
WHERE fiscal_directive = 'DIGITAL_SERVICES_2025'
    AND obs IS NULL;
UPDATE sbm_business.fiscal_directive
SET obs = 'Impuesto ecológico a envases y embalajes no reutilizables. Tasa 2% válida hasta marzo 2025.'
WHERE fiscal_directive = 'ECOLOGICO_ENVASES_2PCT_2025_Q1'
    AND obs IS NULL;
UPDATE sbm_business.fiscal_directive
SET obs = 'Ajuste del impuesto ecológico a 4% a partir de abril 2025 según Ley REP.'
WHERE fiscal_directive = 'ECOLOGICO_ENVASES_4PCT_2025_Q2+'
    AND obs IS NULL;
-- FISCAL-DIRECTIVE
INSERT INTO fiscal_directive (
        id,
        code,
        obs,
        fiscal_directive,
        "type",
        percentage,
        official_source_url,
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
        "month",
        end_month,
        "year",
        end_year
    )
VALUES(
        1,
        '3dba4813-0cc6-4437-904f-ce092830820c',
        'Impuesto al Valor Agregado general 19%',
        'IVA_GENERAL_2025',
        1,
        19.00,
        'https://www.sii.cl/pagina/juridica/tasa_impuesto/tasa_impuesto.htm',
        NULL,
        true,
        '2025-07-11 21:38:25.341',
        '2025-07-11 21:38:25.341',
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        1,
        NULL,
        2025,
        NULL
    );
INSERT INTO fiscal_directive (
        id,
        code,
        obs,
        fiscal_directive,
        "type",
        percentage,
        official_source_url,
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
        "month",
        end_month,
        "year",
        end_year
    )
VALUES(
        2,
        '5ea08d3d-f571-4998-803a-4f04738d6ccf',
        'Operación exenta de IVA según ley',
        'EXENTO_IVA_2025',
        3,
        0.00,
        'https://www.sii.cl/pagina/juridica/tasa_impuesto/exentos.htm',
        NULL,
        true,
        '2025-07-11 21:38:25.341',
        '2025-07-11 21:38:25.341',
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        1,
        NULL,
        2025,
        NULL
    );
INSERT INTO fiscal_directive (
        id,
        code,
        obs,
        fiscal_directive,
        "type",
        percentage,
        official_source_url,
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
        "month",
        end_month,
        "year",
        end_year
    )
VALUES(
        3,
        '8cc2e2ad-0e3f-48ee-b131-21c5bb08410c',
        'Operación no afecta impuestos (sin IVA, etc.)',
        'NO_AFECTO_2025',
        5,
        0.00,
        'https://www.sii.cl/pagina/juridica/tasa_impuesto/no_afectas.htm',
        NULL,
        true,
        '2025-07-11 21:38:25.341',
        '2025-07-11 21:38:25.341',
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        1,
        NULL,
        2025,
        NULL
    );
INSERT INTO fiscal_directive (
        id,
        code,
        obs,
        fiscal_directive,
        "type",
        percentage,
        official_source_url,
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
        "month",
        end_month,
        "year",
        end_year
    )
VALUES(
        4,
        'dadd2641-92a5-416e-aef7-544279c87885',
        'Retención por boleta de honorarios 14.5%',
        'RETENCION_HONORARIOS_2025',
        2,
        14.50,
        'https://www.sii.cl/destacados/boletas_honorarios/index.html',
        NULL,
        true,
        '2025-07-11 21:38:25.341',
        '2025-07-11 21:38:25.341',
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        1,
        NULL,
        2025,
        NULL
    );
INSERT INTO fiscal_directive (
        id,
        code,
        obs,
        fiscal_directive,
        "type",
        percentage,
        official_source_url,
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
        "month",
        end_month,
        "year",
        end_year
    )
VALUES(
        5,
        '2ac0287d-5bd9-4b0e-8487-baaafa11c754',
        'Impuesto de aduana o internacional',
        'IMPUESTO_ADUANERO_2025',
        10,
        6.00,
        'https://www.aduana.cl/arancel-aduanero/aduana/2007-02-20/151116.html',
        NULL,
        true,
        '2025-07-11 21:38:25.341',
        '2025-07-11 21:38:25.341',
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        1,
        NULL,
        2025,
        NULL
    );
INSERT INTO fiscal_directive (
        id,
        code,
        obs,
        fiscal_directive,
        "type",
        percentage,
        official_source_url,
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
        "month",
        end_month,
        "year",
        end_year
    )
VALUES(
        6,
        '3efce556-a1e3-4df3-9bea-a1d1e4470553',
        'Impuesto a servicios digitales',
        'IVA_SERVICIOS_DIGITALES_2025',
        11,
        19.00,
        'https://www.sii.cl/servicios_online/1039-.html',
        NULL,
        true,
        '2025-07-11 21:38:25.341',
        '2025-07-11 21:38:25.341',
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        1,
        NULL,
        2025,
        NULL
    );
INSERT INTO fiscal_directive (
        id,
        code,
        obs,
        fiscal_directive,
        "type",
        percentage,
        official_source_url,
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
        "month",
        end_month,
        "year",
        end_year
    )
VALUES(
        7,
        'd10db440-6aed-4566-90a9-803d9b793532',
        'Impuesto verde o ecológico',
        'IMPUESTO_ECOLOGICO_2025',
        9,
        1.50,
        'https://www.sii.cl/ayudas/aprenda_sobre/3072-3-3078.htm',
        NULL,
        true,
        '2025-07-11 21:38:25.341',
        '2025-07-11 21:38:25.341',
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        1,
        NULL,
        2025,
        NULL
    );
INSERT INTO fiscal_directive (
        id,
        code,
        obs,
        fiscal_directive,
        "type",
        percentage,
        official_source_url,
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
        "month",
        end_month,
        "year",
        end_year
    )
VALUES(
        8,
        '81444afc-3c61-4684-a324-f9bbbfa85588',
        'Impuesto específico general',
        'ESPECIFICO_GENERAL_2025',
        6,
        30.00,
        'https://www.sii.cl/pagina/juridica/tasa_impuesto/impuesto_especifico.htm',
        NULL,
        true,
        '2025-07-11 21:38:25.341',
        '2025-07-11 21:38:25.341',
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        1,
        NULL,
        2025,
        NULL
    );
INSERT INTO fiscal_directive (
        id,
        code,
        obs,
        fiscal_directive,
        "type",
        percentage,
        official_source_url,
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
        "month",
        end_month,
        "year",
        end_year
    )
VALUES(
        9,
        '9100ca67-4aa3-47bf-8a8e-f201d6249882',
        'Impuesto específico según categoría de producto',
        'ESPECIFICO_CATEGORIA_2025',
        7,
        50.00,
        'https://www.sii.cl/pagina/juridica/tasa_impuesto/impuesto_especifico.htm',
        NULL,
        true,
        '2025-07-11 21:38:25.341',
        '2025-07-11 21:38:25.341',
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        1,
        NULL,
        2025,
        NULL
    );
INSERT INTO fiscal_directive (
        id,
        code,
        obs,
        fiscal_directive,
        "type",
        percentage,
        official_source_url,
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
        "month",
        end_month,
        "year",
        end_year
    )
VALUES(
        10,
        '04e11754-55da-4b01-b3f9-60b2fb5e72f1',
        'Impuesto a las bebidas azucaradas',
        'IABA_BEBIDAS_AZUCARADAS_2025',
        7,
        18.00,
        'https://www.sii.cl/ayudas/aprenda_sobre/3072-3-3079.html',
        NULL,
        true,
        '2025-07-11 21:38:25.341',
        '2025-07-11 21:38:25.341',
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        1,
        NULL,
        2025,
        NULL
    );
INSERT INTO fiscal_directive (
        id,
        code,
        obs,
        fiscal_directive,
        "type",
        percentage,
        official_source_url,
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
        "month",
        end_month,
        "year",
        end_year
    )
VALUES(
        11,
        'a22ec960-7548-4cdf-9fc4-41c7d6354925',
        'Impuesto a bebidas energéticas',
        'IABA_ENERGETICAS_2025',
        7,
        18.00,
        'https://www.sii.cl/ayudas/aprenda_sobre/3072-3-3079.html',
        NULL,
        true,
        '2025-07-11 21:38:25.341',
        '2025-07-11 21:38:25.341',
        NULL,
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL,
        1,
        NULL,
        2025,
        NULL
    );