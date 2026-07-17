-- V202604122319__ORDERS_module_config_FULL_FIXED.sql
-- =========================================================
-- 1) CREATE sbm_business.module
-- =========================================================
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = 'sbm_business'
        AND table_name = 'module'
) THEN CREATE TABLE sbm_business.module (
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
END $$;
-- =========================================================
-- 2) FK module -> user
-- =========================================================
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
        AND table_name = 'module'
        AND constraint_name = 'fk_module_created_by'
) THEN
ALTER TABLE sbm_business.module
ADD CONSTRAINT fk_module_created_by FOREIGN KEY (created_by) REFERENCES sbm_business."user"(code);
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
        AND table_name = 'module'
        AND constraint_name = 'fk_module_updated_by'
) THEN
ALTER TABLE sbm_business.module
ADD CONSTRAINT fk_module_updated_by FOREIGN KEY (updated_by) REFERENCES sbm_business."user"(code);
END IF;
END $$;
DO $$ BEGIN IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
        AND table_name = 'module'
        AND constraint_name = 'fk_module_deleted_by'
) THEN
ALTER TABLE sbm_business.module
ADD CONSTRAINT fk_module_deleted_by FOREIGN KEY (deleted_by) REFERENCES sbm_business."user"(code);
END IF;
END $$;
-- =========================================================
-- 3) SEED module
-- =========================================================
INSERT INTO sbm_business.module (id, code, description, is_active)
SELECT 1,
    'NO-MODULE',
    'Transversal / legacy configuration',
    TRUE
WHERE NOT EXISTS (
        SELECT 1
        FROM sbm_business.module
        WHERE id = 1
            OR code = 'NO-MODULE'
    );
INSERT INTO sbm_business.module (id, code, description, is_active)
SELECT 2,
    'ORDER',
    'Order module configuration',
    TRUE
WHERE NOT EXISTS (
        SELECT 1
        FROM sbm_business.module
        WHERE id = 2
            OR code = 'ORDER'
    );
INSERT INTO sbm_business.module (id, code, description, is_active)
SELECT 3,
    'CATALOG',
    'Catalog module configuration',
    TRUE
WHERE NOT EXISTS (
        SELECT 1
        FROM sbm_business.module
        WHERE id = 3
            OR code = 'CATALOG'
    );
DO $$ BEGIN PERFORM setval(
    pg_get_serial_sequence('sbm_business.module', 'id'),
    COALESCE(
        (
            SELECT MAX(id)
            FROM sbm_business.module
        ),
        1
    ),
    true
);
END $$;
