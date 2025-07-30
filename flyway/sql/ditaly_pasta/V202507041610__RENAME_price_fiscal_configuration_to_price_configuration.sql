-- RENAME price_fiscal_configuration TO price_configuration y actualizar referencias

-- 1. Renombrar la tabla principal
ALTER TABLE ditaly_pasta.price_fiscal_configuration RENAME TO price_configuration;

-- 2. Renombrar columna en price
ALTER TABLE ditaly_pasta.price RENAME COLUMN price_fiscal_configuration TO price_configuration;

-- 3. Renombrar columna en fiscal_configuration_detail
ALTER TABLE ditaly_pasta.fiscal_configuration_detail RENAME COLUMN price_fiscal_configuration TO price_configuration;

-- 4. Eliminar constraints antiguas y crear nuevas
ALTER TABLE ditaly_pasta.price DROP CONSTRAINT IF EXISTS fk_price_fiscal_configuration;
ALTER TABLE ditaly_pasta.price ADD CONSTRAINT fk_price_configuration FOREIGN KEY (price_configuration) REFERENCES ditaly_pasta.price_configuration(id);

ALTER TABLE ditaly_pasta.fiscal_configuration_detail DROP CONSTRAINT IF EXISTS fk_fiscal_configuration_detail_price_fiscal_configuration;
ALTER TABLE ditaly_pasta.fiscal_configuration_detail ADD CONSTRAINT fk_fiscal_configuration_detail_price_configuration FOREIGN KEY (price_configuration) REFERENCES ditaly_pasta.price_configuration(id);

-- 5. Renombrar columna fiscal_formula a variable_formula en price_configuration (solo si existe)
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'ditaly_pasta' AND table_name = 'price_configuration' AND column_name = 'fiscal_formula') THEN
        ALTER TABLE ditaly_pasta.price_configuration RENAME COLUMN fiscal_formula TO variable_formula;
    END IF;
END$$;

-- 6. Eliminar columna formula de franchise_configuration_detail si existe
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'ditaly_pasta' AND table_name = 'franchise_configuration_detail' AND column_name = 'formula') THEN
        ALTER TABLE ditaly_pasta.franchise_configuration_detail DROP COLUMN formula;
    END IF;
END$$;

-- 7. Agregar columna base_net_amount a price si no existe
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'ditaly_pasta' AND table_name = 'price' AND column_name = 'base_net_amount') THEN
        ALTER TABLE ditaly_pasta.price ADD COLUMN base_net_amount integer NOT NULL DEFAULT 0;
    END IF;
END$$;

-- 8. Ajustar fiscal_configuration_detail: eliminar columna price y agregar columna var
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'ditaly_pasta' AND table_name = 'fiscal_configuration_detail' AND column_name = 'price') THEN
        ALTER TABLE ditaly_pasta.fiscal_configuration_detail DROP COLUMN price;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'ditaly_pasta' AND table_name = 'fiscal_configuration_detail' AND column_name = 'var') THEN
        ALTER TABLE ditaly_pasta.fiscal_configuration_detail ADD COLUMN var varchar(50) NOT NULL DEFAULT '';
    END IF;
END$$;

-- 9. Ajustar PK de fiscal_configuration_detail
ALTER TABLE ditaly_pasta.fiscal_configuration_detail DROP CONSTRAINT IF EXISTS fiscal_configuration_detail_pkey;
ALTER TABLE ditaly_pasta.fiscal_configuration_detail ADD PRIMARY KEY (id, fiscal_directive);
