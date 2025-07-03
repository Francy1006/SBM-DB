-- USER TABLES
-- Tablas de usuarios, autenticación y tipos de usuario

-- USER (user_type ya existe de migración anterior)
CREATE TABLE IF NOT EXISTS sbm_business.user (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    `type` integer NOT NULL,
    google_id varchar(255) UNIQUE NOT NULL,
    mail varchar(255) UNIQUE NOT NULL,
    phone bigint NOT NULL,
    name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    is_active boolean,
    is_deleted boolean,
    is_confirmed boolean,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- USER TOKEN
CREATE TABLE IF NOT EXISTS sbm_business.user_token (
    id char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    user_id char(36) NOT NULL,
    token text NOT NULL,
    ip_address varchar(45) NOT NULL,
    user_agent text,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    expires_at datetime,
    revoked_at datetime
);

-- TRIGGERS PARA UUID
DELIMITER $$

DROP TRIGGER IF EXISTS user_before_insert$$
CREATE TRIGGER user_before_insert
BEFORE INSERT ON sbm_business.user
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
    IF NEW.log IS NULL THEN
        SET NEW.log = "init;";
    END IF;
END$$

DROP TRIGGER IF EXISTS user_token_before_insert$$
CREATE TRIGGER user_token_before_insert
BEFORE INSERT ON sbm_business.user_token
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL THEN
        SET NEW.id = UUID();
    END IF;
END$$

DELIMITER ; 