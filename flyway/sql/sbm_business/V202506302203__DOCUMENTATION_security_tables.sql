-- DOCUMENTATION & SECURITY TABLES
-- Tablas de documentación, instrucciones y control de acceso

-- RESTRICTION
CREATE TABLE IF NOT EXISTS sbm_business.restriction (
    id char(36) PRIMARY KEY,
    restriction varchar(50) UNIQUE NOT NULL,
    description text NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- RESTRICTION ROLES
CREATE TABLE IF NOT EXISTS sbm_business.restriction_roles (
    id SERIAL PRIMARY KEY,
    restriction char(36) NOT NULL,
    role char(36) NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36)
);

-- ROLE PERMISSIONS
CREATE TABLE IF NOT EXISTS sbm_business.role_permissions (
    id char(36) PRIMARY KEY,
    role char(36) NOT NULL,
    permission char(36) NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36)
);

-- PERMISSION
CREATE TABLE IF NOT EXISTS sbm_business.permission (
    id char(36) PRIMARY KEY,
    permission varchar(50) UNIQUE NOT NULL,
    description text NOT NULL,
    type integer NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    updated_by char(36),
    confirmed_by char(36),
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- ROLE
CREATE TABLE IF NOT EXISTS sbm_business.role (
    id char(36) PRIMARY KEY,
    role varchar(50) UNIQUE NOT NULL,
    description text NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- INSTRUCTION
CREATE TABLE IF NOT EXISTS sbm_business.instruction (
    code char(36) PRIMARY KEY,
    instruction varchar(50) NOT NULL,
    description text NOT NULL,
    url_documentation varchar(2083),
    type integer NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36)
);

-- TRIGGERS PARA UUID Y CAMPOS DE AUDITORÍA (PostgreSQL)

-- Trigger para la tabla restriction
CREATE OR REPLACE FUNCTION restriction_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id IS NULL THEN
        NEW.id := gen_random_uuid()::text;
    END IF;
    IF NEW.log IS NULL THEN
        NEW.log := 'init;';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_restriction_before_insert
    BEFORE INSERT ON sbm_business.restriction
    FOR EACH ROW
    EXECUTE FUNCTION restriction_before_insert();

-- Trigger para la tabla role_permissions
CREATE OR REPLACE FUNCTION role_permissions_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id IS NULL THEN
        NEW.id := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_role_permissions_before_insert
    BEFORE INSERT ON sbm_business.role_permissions
    FOR EACH ROW
    EXECUTE FUNCTION role_permissions_before_insert();

-- Trigger para la tabla permission
CREATE OR REPLACE FUNCTION permission_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id IS NULL THEN
        NEW.id := gen_random_uuid()::text;
    END IF;
    IF NEW.log IS NULL THEN
        NEW.log := 'init;';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_permission_before_insert
    BEFORE INSERT ON sbm_business.permission
    FOR EACH ROW
    EXECUTE FUNCTION permission_before_insert();

-- Trigger para la tabla role
CREATE OR REPLACE FUNCTION role_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id IS NULL THEN
        NEW.id := gen_random_uuid()::text;
    END IF;
    IF NEW.log IS NULL THEN
        NEW.log := 'init;';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_role_before_insert
    BEFORE INSERT ON sbm_business.role
    FOR EACH ROW
    EXECUTE FUNCTION role_before_insert();

-- Trigger para la tabla instruction
CREATE OR REPLACE FUNCTION instruction_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_instruction_before_insert
    BEFORE INSERT ON sbm_business.instruction
    FOR EACH ROW
    EXECUTE FUNCTION instruction_before_insert(); 