-- FINALIZE price, price_configuration, and fiscal_configuration_detail tables according to DBML

-- 1. Asegurar columna franchise_configuration en price_configuration
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'ditaly_pasta' AND table_name = 'price_configuration' AND column_name = 'franchise_configuration'
    ) THEN
        ALTER TABLE ditaly_pasta.price_configuration ADD COLUMN franchise_configuration char(36) NOT NULL;
    END IF;
END$$;

-- 2. FK franchise_configuration -> franchise_configuration.code
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
        WHERE tc.table_schema = 'ditaly_pasta' AND tc.table_name = 'price_configuration' AND tc.constraint_type = 'FOREIGN KEY' AND kcu.column_name = 'franchise_configuration'
    ) THEN
        ALTER TABLE ditaly_pasta.price_configuration ADD CONSTRAINT fk_price_configuration_franchise_configuration FOREIGN KEY (franchise_configuration) REFERENCES ditaly_pasta.franchise_configuration(code);
    END IF;
END$$;

-- 3. Asegurar columna variable_formula en price_configuration
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'ditaly_pasta' AND table_name = 'price_configuration' AND column_name = 'variable_formula'
    ) THEN
        ALTER TABLE ditaly_pasta.price_configuration ADD COLUMN variable_formula char(36) NOT NULL;
    END IF;
END$$;

-- 4. FK variable_formula -> sbm_business.variable_formula.code
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
        WHERE tc.table_schema = 'ditaly_pasta' AND tc.table_name = 'price_configuration' AND tc.constraint_type = 'FOREIGN KEY' AND kcu.column_name = 'variable_formula'
    ) THEN
        ALTER TABLE ditaly_pasta.price_configuration ADD CONSTRAINT fk_price_configuration_variable_formula FOREIGN KEY (variable_formula) REFERENCES sbm_business.variable_formula(code);
    END IF;
END$$;

-- 5. FK price.price_configuration -> price_configuration.id
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
        WHERE tc.table_schema = 'ditaly_pasta' AND tc.table_name = 'price' AND tc.constraint_type = 'FOREIGN KEY' AND kcu.column_name = 'price_configuration'
    ) THEN
        ALTER TABLE ditaly_pasta.price ADD CONSTRAINT fk_price_configuration FOREIGN KEY (price_configuration) REFERENCES ditaly_pasta.price_configuration(id);
    END IF;
END$$;

-- 6. FK fiscal_configuration_detail.price_configuration -> price_configuration.id
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
        WHERE tc.table_schema = 'ditaly_pasta' AND tc.table_name = 'fiscal_configuration_detail' AND tc.constraint_type = 'FOREIGN KEY' AND kcu.column_name = 'price_configuration'
    ) THEN
        ALTER TABLE ditaly_pasta.fiscal_configuration_detail ADD CONSTRAINT fk_fiscal_configuration_detail_price_configuration FOREIGN KEY (price_configuration) REFERENCES ditaly_pasta.price_configuration(id);
    END IF;
END$$;

-- 7. Ajustar PK de fiscal_configuration_detail a (id, fiscal_directive)
ALTER TABLE ditaly_pasta.fiscal_configuration_detail DROP CONSTRAINT IF EXISTS fiscal_configuration_detail_pkey;
ALTER TABLE ditaly_pasta.fiscal_configuration_detail ADD PRIMARY KEY (id, fiscal_directive);

-- 8. Eliminar columnas obsoletas si existen
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'ditaly_pasta' AND table_name = 'price_configuration' AND column_name = 'fiscal_formula') THEN
        ALTER TABLE ditaly_pasta.price_configuration DROP COLUMN fiscal_formula;
    END IF;
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'ditaly_pasta' AND table_name = 'price_configuration' AND column_name = 'fiscal_configuration') THEN
        ALTER TABLE ditaly_pasta.price_configuration DROP COLUMN fiscal_configuration;
    END IF;
END$$;

-- 9. Renombrar columnas si es necesario (según DBML)
-- Ya realizado en migraciones previas, pero se deja como referencia
-- ALTER TABLE ditaly_pasta.price_configuration RENAME COLUMN price_fiscal_configuration TO price_configuration;
-- ALTER TABLE ditaly_pasta.price_configuration RENAME COLUMN fiscal_formula TO variable_formula;

-- 10. Validar estructura final
-- Esta migración asegura que la estructura y relaciones coincidan con el modelo DBML más reciente. 