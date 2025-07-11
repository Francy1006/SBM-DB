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
-- INSERTAR NUEVAS DIRECTIVAS FISCALES (con ON CONFLICT para evitar duplicados)
INSERT INTO sbm_business.fiscal_directive (
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
        '63e9e23f-1e6f-4a3a-8f16-6460fdc5a95d',
        'Operación exenta del pago de IVA, según lo dispuesto en el artículo 12 de la Ley de IVA. Aplica a ciertos servicios médicos, educacionales, y actividades exentas por ley.',
        'EXENTO_IVA_2025',
        3,
        0.00,
        'https://www.sii.cl/portales/iva/servicios_exentos.htm',
        NULL,
        true,
        '2025-07-11 17:00:00.000',
        NULL,
        '2025-07-11 17:00:00.000',
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