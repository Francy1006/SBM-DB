-- V202604122320__ORDERS_module_config_ditaly_pasta.sql
-- =========================================================
-- 1) ALTER ditaly_pasta.fiscal_configuration_detail
-- =========================================================
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'module_id'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD COLUMN module_id INTEGER NULL;
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'module_config_id'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD COLUMN module_config_id VARCHAR(50) NULL;
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'is_active'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD COLUMN is_active BOOLEAN NOT NULL DEFAULT TRUE;
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'created_at'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'updated_at'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD COLUMN updated_at TIMESTAMP NULL;
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'deleted_at'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD COLUMN deleted_at TIMESTAMP NULL;
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'created_by'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD COLUMN created_by CHAR(36) NULL;
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'updated_by'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD COLUMN updated_by CHAR(36) NULL;
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'deleted_by'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD COLUMN deleted_by CHAR(36) NULL;
END IF;
END $$;
-- =========================================================
-- 2) MIGRATE legacy fiscal_configuration_detail records
-- =========================================================
DO $$ BEGIN IF EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'price_configuration'
) THEN
UPDATE ditaly_pasta.fiscal_configuration_detail
SET module_id = COALESCE(module_id, 1),
    module_config_id = COALESCE(module_config_id, price_configuration)
WHERE price_configuration IS NOT NULL
    AND (
        module_id IS NULL
        OR module_config_id IS NULL
    );
END IF;
END $$;
-- =========================================================
-- 3) SET NOT NULL after migration
-- =========================================================
DO $$ BEGIN IF EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'module_id'
        AND is_nullable = 'YES'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ALTER COLUMN module_id
SET NOT NULL;
END IF;
END $$;
DO $$ BEGIN IF EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'module_config_id'
        AND is_nullable = 'YES'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ALTER COLUMN module_config_id
SET NOT NULL;
END IF;
END $$;
-- =========================================================
-- 4) DROP old unique/index/column price_configuration
-- =========================================================
DO $$
DECLARE rec RECORD;
BEGIN FOR rec IN
SELECT tc.constraint_name
FROM information_schema.table_constraints tc
    JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
    AND tc.constraint_schema = kcu.constraint_schema
    AND tc.table_name = kcu.table_name
WHERE tc.constraint_schema = 'ditaly_pasta'
    AND tc.table_name = 'fiscal_configuration_detail'
    AND tc.constraint_type IN ('UNIQUE', 'FOREIGN KEY')
    AND kcu.column_name = 'price_configuration' LOOP EXECUTE format(
        'ALTER TABLE ditaly_pasta.fiscal_configuration_detail DROP CONSTRAINT %I',
        rec.constraint_name
    );
END LOOP;
END $$;
DO $$ BEGIN IF EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'price_configuration'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail DROP COLUMN price_configuration;
END IF;
END $$;
-- =========================================================
-- 5) FK fiscal_configuration_detail
-- =========================================================
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND constraint_name = 'fk_fiscal_configuration_detail_module'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD CONSTRAINT fk_fiscal_configuration_detail_module FOREIGN KEY (module_id) REFERENCES sbm_business.module(id);
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND constraint_name = 'fk_fiscal_configuration_detail_fiscal_directive'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD CONSTRAINT fk_fiscal_configuration_detail_fiscal_directive FOREIGN KEY (fiscal_directive) REFERENCES sbm_business.fiscal_directive(code);
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND constraint_name = 'fk_fiscal_configuration_detail_created_by'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD CONSTRAINT fk_fiscal_configuration_detail_created_by FOREIGN KEY (created_by) REFERENCES sbm_business."user"(code);
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND constraint_name = 'fk_fiscal_configuration_detail_updated_by'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD CONSTRAINT fk_fiscal_configuration_detail_updated_by FOREIGN KEY (updated_by) REFERENCES sbm_business."user"(code);
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND constraint_name = 'fk_fiscal_configuration_detail_deleted_by'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD CONSTRAINT fk_fiscal_configuration_detail_deleted_by FOREIGN KEY (deleted_by) REFERENCES sbm_business."user"(code);
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND constraint_name = 'uq_fiscal_configuration_detail_module_config_var'
) THEN
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD CONSTRAINT uq_fiscal_configuration_detail_module_config_var UNIQUE (module_id, module_config_id, var);
END IF;
END $$;
CREATE INDEX IF NOT EXISTS idx_fiscal_configuration_detail_module ON ditaly_pasta.fiscal_configuration_detail(module_id);
CREATE INDEX IF NOT EXISTS idx_fiscal_configuration_detail_module_config ON ditaly_pasta.fiscal_configuration_detail(module_config_id);
CREATE INDEX IF NOT EXISTS idx_fiscal_configuration_detail_fiscal_directive ON ditaly_pasta.fiscal_configuration_detail(fiscal_directive);
DO $$ BEGIN IF EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'fiscal_configuration_detail'
        AND column_name = 'id'
) THEN PERFORM setval(
    pg_get_serial_sequence('ditaly_pasta.fiscal_configuration_detail', 'id'),
    COALESCE(
        (
            SELECT MAX(id)
            FROM ditaly_pasta.fiscal_configuration_detail
        ),
        1
    ),
    true
);
END IF;
END $$;
-- =========================================================
-- 6) ALTER ditaly_pasta.franchise_configuration_detail
-- =========================================================
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'franchise_configuration_detail'
        AND column_name = 'variable_formula'
) THEN
ALTER TABLE ditaly_pasta.franchise_configuration_detail
ADD COLUMN variable_formula CHAR(36) NULL;
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'franchise_configuration_detail'
        AND constraint_name = 'fk_franchise_configuration_detail_variable_formula'
) THEN
ALTER TABLE ditaly_pasta.franchise_configuration_detail
ADD CONSTRAINT fk_franchise_configuration_detail_variable_formula FOREIGN KEY (variable_formula) REFERENCES sbm_business.variable_formula(code);
END IF;
END $$;
CREATE INDEX IF NOT EXISTS idx_franchise_configuration_detail_variable_formula ON ditaly_pasta.franchise_configuration_detail(variable_formula);