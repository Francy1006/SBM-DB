-- V202604122319__ORDERS_module_config.sql

-- =========================================================
-- 1) CREATE sbm_business.module
-- =========================================================
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'sbm_business'
          AND table_name = 'module'
    ) THEN
        CREATE TABLE sbm_business.module (
            id SERIAL PRIMARY KEY,
            code VARCHAR(50) NOT NULL UNIQUE,
            description VARCHAR(100) NULL,
            is_active BOOLEAN NOT NULL DEFAULT TRUE,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP NULL,
            deleted_at TIMESTAMP NULL,
            created_by CHAR(36) NULL,
            updated_by CHAR(36) NULL,
            deleted_by CHAR(36) NULL
        );
    END IF;
END$$;

-- =========================================================
-- 2) FK sbm_business.module -> user
-- =========================================================
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'sbm_business'
          AND table_name = 'module'
          AND constraint_name = 'fk_module_created_by'
    ) THEN
        ALTER TABLE sbm_business.module
        ADD CONSTRAINT fk_module_created_by
        FOREIGN KEY (created_by)
        REFERENCES sbm_business."user"(code);
    END IF;
END$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'sbm_business'
          AND table_name = 'module'
          AND constraint_name = 'fk_module_updated_by'
    ) THEN
        ALTER TABLE sbm_business.module
        ADD CONSTRAINT fk_module_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES sbm_business."user"(code);
    END IF;
END$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'sbm_business'
          AND table_name = 'module'
          AND constraint_name = 'fk_module_deleted_by'
    ) THEN
        ALTER TABLE sbm_business.module
        ADD CONSTRAINT fk_module_deleted_by
        FOREIGN KEY (deleted_by)
        REFERENCES sbm_business."user"(code);
    END IF;
END$$;

-- =========================================================
-- 3) SEED sbm_business.module
-- =========================================================
INSERT INTO sbm_business.module (
    id, code, description, is_active, created_at, created_by
)
SELECT
    1, 'NO-MODULE', 'Transversal / legacy configuration', TRUE, CURRENT_TIMESTAMP, NULL
WHERE NOT EXISTS (
    SELECT 1 FROM sbm_business.module WHERE id = 1 OR code = 'NO-MODULE'
);

INSERT INTO sbm_business.module (
    id, code, description, is_active, created_at, created_by
)
SELECT
    2, 'ORDER', 'Order module configuration', TRUE, CURRENT_TIMESTAMP, NULL
WHERE NOT EXISTS (
    SELECT 1 FROM sbm_business.module WHERE id = 2 OR code = 'ORDER'
);

INSERT INTO sbm_business.module (
    id, code, description, is_active, created_at, created_by
)
SELECT
    3, 'CATALOG', 'Catalog module configuration', TRUE, CURRENT_TIMESTAMP, NULL
WHERE NOT EXISTS (
    SELECT 1 FROM sbm_business.module WHERE id = 3 OR code = 'CATALOG'
);

DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'sbm_business'
          AND table_name = 'module'
          AND column_name = 'id'
    ) THEN
        PERFORM setval(
            pg_get_serial_sequence('sbm_business.module', 'id'),
            COALESCE((SELECT MAX(id) FROM sbm_business.module), 1),
            true
        );
    END IF;
END$$;

-- =========================================================
-- 4) RENAME sbm_business.order_module_config -> module_order_config
-- =========================================================
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'sbm_business'
          AND table_name = 'order_module_config'
    )
    AND NOT EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'sbm_business'
          AND table_name = 'module_order_config'
    ) THEN
        ALTER TABLE sbm_business.order_module_config
        RENAME TO module_order_config;
    END IF;
END$$;

-- =========================================================
-- 5) CREATE sbm_business.module_order_config if missing
-- =========================================================
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'sbm_business'
          AND table_name = 'module_order_config'
    ) THEN
        CREATE TABLE sbm_business.module_order_config (
            id SERIAL PRIMARY KEY,
            order_config_type INTEGER NOT NULL,
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
END$$;

-- =========================================================
-- 6) RENAME old constraints/indexes on module_order_config
-- =========================================================
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND constraint_name = 'fk_order_module_config_order_config_type'
    ) THEN
        ALTER TABLE sbm_business.module_order_config
        RENAME CONSTRAINT fk_order_module_config_order_config_type
        TO fk_module_order_config_order_config_type;
    END IF;
END$$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND constraint_name = 'fk_order_module_config_variable_formula'
    ) THEN
        ALTER TABLE sbm_business.module_order_config
        RENAME CONSTRAINT fk_order_module_config_variable_formula
        TO fk_module_order_config_variable_formula;
    END IF;
END$$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND constraint_name = 'uq_order_module_config_type'
    ) THEN
        ALTER TABLE sbm_business.module_order_config
        RENAME CONSTRAINT uq_order_module_config_type
        TO uq_module_order_config_type;
    END IF;
END$$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM pg_indexes
        WHERE schemaname = 'sbm_business'
          AND tablename = 'module_order_config'
          AND indexname = 'idx_order_module_config_order_config_type'
    ) THEN
        ALTER INDEX sbm_business.idx_order_module_config_order_config_type
        RENAME TO idx_module_order_config_order_config_type;
    END IF;
END$$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM pg_indexes
        WHERE schemaname = 'sbm_business'
          AND tablename = 'module_order_config'
          AND indexname = 'idx_order_module_config_variable_formula'
    ) THEN
        ALTER INDEX sbm_business.idx_order_module_config_variable_formula
        RENAME TO idx_module_order_config_variable_formula;
    END IF;
END$$;

-- =========================================================
-- 7) ADD missing columns to module_order_config
-- =========================================================
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND column_name = 'deleted_at'
    ) THEN
        ALTER TABLE sbm_business.module_order_config
        ADD COLUMN deleted_at TIMESTAMP NULL;
    END IF;
END$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND column_name = 'created_by'
    ) THEN
        ALTER TABLE sbm_business.module_order_config
        ADD COLUMN created_by CHAR(36) NULL;
    END IF;
END$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND column_name = 'updated_by'
    ) THEN
        ALTER TABLE sbm_business.module_order_config
        ADD COLUMN updated_by CHAR(36) NULL;
    END IF;
END$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND column_name = 'deleted_by'
    ) THEN
        ALTER TABLE sbm_business.module_order_config
        ADD COLUMN deleted_by CHAR(36) NULL;
    END IF;
END$$;

-- =========================================================
-- 8) FK module_order_config
-- =========================================================
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND constraint_name = 'fk_module_order_config_order_config_type'
    ) THEN
        ALTER TABLE sbm_business.module_order_config
        ADD CONSTRAINT fk_module_order_config_order_config_type
        FOREIGN KEY (order_config_type)
        REFERENCES sbm_business.order_config_type(id);
    END IF;
END$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND constraint_name = 'fk_module_order_config_variable_formula'
    ) THEN
        ALTER TABLE sbm_business.module_order_config
        ADD CONSTRAINT fk_module_order_config_variable_formula
        FOREIGN KEY (variable_formula)
        REFERENCES sbm_business.variable_formula(code);
    END IF;
END$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND constraint_name = 'fk_module_order_config_created_by'
    ) THEN
        ALTER TABLE sbm_business.module_order_config
        ADD CONSTRAINT fk_module_order_config_created_by
        FOREIGN KEY (created_by)
        REFERENCES sbm_business."user"(code);
    END IF;
END$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND constraint_name = 'fk_module_order_config_updated_by'
    ) THEN
        ALTER TABLE sbm_business.module_order_config
        ADD CONSTRAINT fk_module_order_config_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES sbm_business."user"(code);
    END IF;
END$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND constraint_name = 'fk_module_order_config_deleted_by'
    ) THEN
        ALTER TABLE sbm_business.module_order_config
        ADD CONSTRAINT fk_module_order_config_deleted_by
        FOREIGN KEY (deleted_by)
        REFERENCES sbm_business."user"(code);
    END IF;
END$$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.table_constraints
        WHERE constraint_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND constraint_name = 'uq_module_order_config_type'
    ) THEN
        ALTER TABLE sbm_business.module_order_config
        ADD CONSTRAINT uq_module_order_config_type
        UNIQUE (order_config_type);
    END IF;
END$$;

CREATE INDEX IF NOT EXISTS idx_module_order_config_order_config_type
ON sbm_business.module_order_config(order_config_type);

CREATE INDEX IF NOT EXISTS idx_module_order_config_variable_formula
ON sbm_business.module_order_config(variable_formula);

DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'sbm_business'
          AND table_name = 'module_order_config'
          AND column_name = 'id'
    ) THEN
        PERFORM setval(
            pg_get_serial_sequence('sbm_business.module_order_config', 'id'),
            COALESCE((SELECT MAX(id) FROM sbm_business.module_order_config), 1),
            true
        );
    END IF;
END$$;

-- =========================================================
-- 9) INSERT module_order_config records using existing variable_formula
-- =========================================================
INSERT INTO sbm_business.module_order_config (
    order_config_type,
    variable_formula,
    is_active,
    created_at,
    created_by
)
SELECT
    oct.id,
    vf.code,
    TRUE,
    CURRENT_TIMESTAMP,
    NULL
FROM sbm_business.order_config_type oct
JOIN sbm_business.variable_formula vf
    ON vf.formula = 'MODULE_ORDER_PRODUCT'
WHERE oct.type = 'PRODUCT'
  AND NOT EXISTS (
      SELECT 1
      FROM sbm_business.module_order_config moc
      WHERE moc.order_config_type = oct.id
  );

INSERT INTO sbm_business.module_order_config (
    order_config_type,
    variable_formula,
    is_active,
    created_at,
    created_by
)
SELECT
    oct.id,
    vf.code,
    TRUE,
    CURRENT_TIMESTAMP,
    NULL
FROM sbm_business.order_config_type oct
JOIN sbm_business.variable_formula vf
    ON vf.formula = 'MODULE_ORDER_MATERIAL'
WHERE oct.type = 'MATERIAL'
  AND NOT EXISTS (
      SELECT 1
      FROM sbm_business.module_order_config moc
      WHERE moc.order_config_type = oct.id
  );

INSERT INTO sbm_business.module_order_config (
    order_config_type,
    variable_formula,
    is_active,
    created_at,
    created_by
)
SELECT
    oct.id,
    vf.code,
    TRUE,
    CURRENT_TIMESTAMP,
    NULL
FROM sbm_business.order_config_type oct
JOIN sbm_business.variable_formula vf
    ON vf.formula = 'MODULE_ORDER_SERVICE'
WHERE oct.type = 'SERVICE'
  AND NOT EXISTS (
      SELECT 1
      FROM sbm_business.module_order_config moc
      WHERE moc.order_config_type = oct.id
  );

INSERT INTO sbm_business.module_order_config (
    order_config_type,
    variable_formula,
    is_active,
    created_at,
    created_by
)
SELECT
    oct.id,
    vf.code,
    TRUE,
    CURRENT_TIMESTAMP,
    NULL
FROM sbm_business.order_config_type oct
JOIN sbm_business.variable_formula vf
    ON vf.formula = 'MODULE_ORDER_CATALOG'
WHERE oct.type = 'CATALOG'
  AND NOT EXISTS (
      SELECT 1
      FROM sbm_business.module_order_config moc
      WHERE moc.order_config_type = oct.id
  );

INSERT INTO sbm_business.module_order_config (
    order_config_type,
    variable_formula,
    is_active,
    created_at,
    created_by
)
SELECT
    oct.id,
    vf.code,
    TRUE,
    CURRENT_TIMESTAMP,
    NULL
FROM sbm_business.order_config_type oct
JOIN sbm_business.variable_formula vf
    ON vf.formula = 'MODULE_ORDER_TICKET'
WHERE oct.type = 'TICKET'
  AND NOT EXISTS (
      SELECT 1
      FROM sbm_business.module_order_config moc
      WHERE moc.order_config_type = oct.id
  );