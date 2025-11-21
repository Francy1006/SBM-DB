-- BRANCH TYPES TABLE
-- Tabla para tipos de sucursales
CREATE TABLE IF NOT EXISTS sbm_business.branch_types (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    type varchar(50) NOT NULL UNIQUE,
    description text,
    is_active boolean NOT NULL DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    created_by char(36) NOT NULL,
    updated_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- TRIGGER PARA UUID Y LOG
CREATE OR REPLACE FUNCTION sbm_business.branch_types_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid();
    END IF;
    IF NEW.log IS NULL THEN
        NEW.log := 'init;';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS branch_types_before_insert ON sbm_business.branch_types;
CREATE TRIGGER branch_types_before_insert
    BEFORE INSERT ON sbm_business.branch_types
    FOR EACH ROW
    EXECUTE FUNCTION sbm_business.branch_types_before_insert();

-- FOREIGN KEY CONSTRAINTS
ALTER TABLE sbm_business.branch_types 
ADD CONSTRAINT fk_branch_types_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE sbm_business.branch_types 
ADD CONSTRAINT fk_branch_types_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

-- INSERT BRANCH TYPES DATA
-- Agregar datos iniciales de branch_types

INSERT INTO sbm_business.branch_types (id, code, "type", description, is_active, created_at, updated_at, created_by, updated_by, log, "version")
OVERRIDING SYSTEM VALUE
VALUES(1, '40c00d02-aac7-4f49-956e-76639ee6e4fc', 'FRANCHISE', 'ENTORNO FRANQUICIA', true, '2025-11-16 18:48:56.404', NULL, '5fbf2886-4ad0-11f0-8ce6-0242ac120002', NULL, 'init;', 1);

INSERT INTO sbm_business.branch_types (id, code, "type", description, is_active, created_at, updated_at, created_by, updated_by, log, "version")
OVERRIDING SYSTEM VALUE
VALUES(4, '88136c3a-0896-42ce-bd28-35995760d911', 'MODULAR', 'LOCAL CONSTRUCCION MODULAR', true, '2025-11-16 18:48:56.372', NULL, '5fbf2886-4ad0-11f0-8ce6-0242ac120002', NULL, 'init;', 1);

INSERT INTO sbm_business.branch_types (id, code, "type", description, is_active, created_at, updated_at, created_by, updated_by, log, "version")
OVERRIDING SYSTEM VALUE
VALUES(5, 'b0873c30-01ad-47f2-90bf-057b69ad8108', 'STREET ', 'LOCAL ACCESO CALLE', true, '2025-11-16 18:48:56.404', NULL, '5fbf2886-4ad0-11f0-8ce6-0242ac120002', NULL, 'init;', 1);

-- Resetear la secuencia después de las inserciones manuales
SELECT setval('sbm_business.branch_types_id_seq', (SELECT MAX(id) FROM sbm_business.branch_types), true);

