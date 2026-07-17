-- =========================================================
-- 4) CREATE ditaly_pasta.module_calculation_config
-- =========================================================
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = 'ditaly_pasta'
        AND table_name = 'module_calculation_config'
) THEN CREATE TABLE ditaly_pasta.module_calculation_config (
    id SERIAL PRIMARY KEY,
    module INTEGER NOT NULL,
    record_type INTEGER NOT NULL,
    variable_formula CHAR(36) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL,
    deleted_at TIMESTAMP NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL
);
END IF;
END $$;
-- =========================================================
-- 5) FK module_calculation_config
-- =========================================================
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'module_calculation_config'
        AND constraint_name = 'fk_mcc_module'
) THEN
ALTER TABLE ditaly_pasta.module_calculation_config
ADD CONSTRAINT fk_mcc_module FOREIGN KEY (module) REFERENCES sbm_business.module(id);
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'module_calculation_config'
        AND constraint_name = 'fk_mcc_record_type'
) THEN
ALTER TABLE ditaly_pasta.module_calculation_config
ADD CONSTRAINT fk_mcc_record_type FOREIGN KEY (record_type) REFERENCES sbm_business.record_type(id);
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'module_calculation_config'
        AND constraint_name = 'fk_mcc_variable_formula'
) THEN
ALTER TABLE ditaly_pasta.module_calculation_config
ADD CONSTRAINT fk_mcc_variable_formula FOREIGN KEY (variable_formula) REFERENCES sbm_business.variable_formula(code);
END IF;
END $$;
-- USER FK (corregido UUID)
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'module_calculation_config'
        AND constraint_name = 'fk_mcc_created_by'
) THEN
ALTER TABLE ditaly_pasta.module_calculation_config
ADD CONSTRAINT fk_mcc_created_by FOREIGN KEY (created_by) REFERENCES sbm_business."user"(code);
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'module_calculation_config'
        AND constraint_name = 'fk_mcc_updated_by'
) THEN
ALTER TABLE ditaly_pasta.module_calculation_config
ADD CONSTRAINT fk_mcc_updated_by FOREIGN KEY (updated_by) REFERENCES sbm_business."user"(code);
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'module_calculation_config'
        AND constraint_name = 'fk_mcc_deleted_by'
) THEN
ALTER TABLE ditaly_pasta.module_calculation_config
ADD CONSTRAINT fk_mcc_deleted_by FOREIGN KEY (deleted_by) REFERENCES sbm_business."user"(code);
END IF;
END $$;
-- =========================================================
-- 6) UNIQUE + INDEXES
-- =========================================================
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'ditaly_pasta'
        AND table_name = 'module_calculation_config'
        AND constraint_name = 'uq_mcc_module_order_type'
) THEN
ALTER TABLE ditaly_pasta.module_calculation_config
ADD CONSTRAINT uq_mcc_module_order_type UNIQUE (module, record_type);
END IF;
END $$;
CREATE INDEX IF NOT EXISTS idx_mcc_record_type ON ditaly_pasta.module_calculation_config(record_type);
CREATE INDEX IF NOT EXISTS idx_mcc_variable_formula ON ditaly_pasta.module_calculation_config(variable_formula);
-- =========================================================
-- 7) SEQUENCE FIX
-- =========================================================
DO $$ BEGIN PERFORM setval(
    pg_get_serial_sequence('ditaly_pasta.module_calculation_config', 'id'),
    COALESCE(
        (
            SELECT MAX(id)
            FROM ditaly_pasta.module_calculation_config
        ),
        1
    ),
    true
);
END $$;
-- =========================================================
-- 8) INSERT DATA (idempotente)
-- =========================================================
INSERT INTO ditaly_pasta.module_calculation_config (module, record_type, variable_formula)
SELECT m.id,
    oct.id,
    vf.code
FROM sbm_business.record_type oct
    JOIN sbm_business.variable_formula vf ON vf.formula = 'MODULE_ORDER_PRODUCT'
    JOIN sbm_business.module m ON m.code = 'ORDER'
WHERE oct.type = 'PRODUCT'
    AND NOT EXISTS (
        SELECT 1
        FROM ditaly_pasta.module_calculation_config x
        WHERE x.module = m.id
            AND x.record_type = oct.id
    );
INSERT INTO ditaly_pasta.module_calculation_config (module, record_type, variable_formula)
SELECT m.id,
    oct.id,
    vf.code
FROM sbm_business.record_type oct
    JOIN sbm_business.variable_formula vf ON vf.formula = 'MODULE_ORDER_MATERIAL'
    JOIN sbm_business.module m ON m.code = 'ORDER'
WHERE oct.type = 'MATERIAL'
    AND NOT EXISTS (
        SELECT 1
        FROM ditaly_pasta.module_calculation_config x
        WHERE x.module = m.id
            AND x.record_type = oct.id
    );
INSERT INTO ditaly_pasta.module_calculation_config (module, record_type, variable_formula)
SELECT m.id,
    oct.id,
    vf.code
FROM sbm_business.record_type oct
    JOIN sbm_business.variable_formula vf ON vf.formula = 'MODULE_ORDER_SERVICE'
    JOIN sbm_business.module m ON m.code = 'ORDER'
WHERE oct.type = 'SERVICE'
    AND NOT EXISTS (
        SELECT 1
        FROM ditaly_pasta.module_calculation_config x
        WHERE x.module = m.id
            AND x.record_type = oct.id
    );
INSERT INTO ditaly_pasta.module_calculation_config (module, record_type, variable_formula)
SELECT m.id,
    oct.id,
    vf.code
FROM sbm_business.record_type oct
    JOIN sbm_business.variable_formula vf ON vf.formula = 'MODULE_ORDER_CATALOG'
    JOIN sbm_business.module m ON m.code = 'ORDER'
WHERE oct.type = 'CATALOG'
    AND NOT EXISTS (
        SELECT 1
        FROM ditaly_pasta.module_calculation_config x
        WHERE x.module = m.id
            AND x.record_type = oct.id
    );
INSERT INTO ditaly_pasta.module_calculation_config (module, record_type, variable_formula)
SELECT m.id,
    oct.id,
    vf.code
FROM sbm_business.record_type oct
    JOIN sbm_business.variable_formula vf ON vf.formula = 'MODULE_ORDER_TICKET'
    JOIN sbm_business.module m ON m.code = 'ORDER'
WHERE oct.type = 'TICKET'
    AND NOT EXISTS (
        SELECT 1
        FROM ditaly_pasta.module_calculation_config x
        WHERE x.module = m.id
            AND x.record_type = oct.id
    );