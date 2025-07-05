-- USER TABLES
-- Tablas de usuarios, autenticación y tipos de usuario
-- USER (user_type ya existe de migración anterior)
CREATE TABLE IF NOT EXISTS sbm_business.user (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    type integer NOT NULL,
    google_id varchar(255) UNIQUE NOT NULL,
    mail varchar(255) UNIQUE NOT NULL,
    phone bigint,
    name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    is_active boolean,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);
-- USER TOKEN
CREATE TABLE IF NOT EXISTS sbm_business.user_token (
    id char(36) PRIMARY KEY,
    user_id char(36) NOT NULL,
    token text NOT NULL,
    ip_address varchar(45) NOT NULL,
    user_agent text,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP,
    revoked_at TIMESTAMP
);
-- TRIGGERS PARA UUID (PostgreSQL)
-- Trigger para la tabla user
CREATE OR REPLACE FUNCTION user_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    IF NEW.log IS NULL THEN
        NEW.log := 'init;';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_user_before_insert
    BEFORE INSERT ON sbm_business.user
    FOR EACH ROW
    EXECUTE FUNCTION user_before_insert();

-- Trigger para la tabla user_token
CREATE OR REPLACE FUNCTION user_token_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id IS NULL THEN
        NEW.id := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_user_token_before_insert
    BEFORE INSERT ON sbm_business.user_token
    FOR EACH ROW
    EXECUTE FUNCTION user_token_before_insert(); 