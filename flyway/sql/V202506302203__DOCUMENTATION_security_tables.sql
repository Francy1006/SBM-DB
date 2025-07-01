-- DOCUMENTATION & SECURITY TABLES
-- Tablas de documentación, instrucciones y control de acceso

-- RESTRICTION
CREATE TABLE IF NOT EXISTS restriction (
    id char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    restriction varchar(50) UNIQUE NOT NULL,
    description text NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- RESTRICTION ROLES
CREATE TABLE IF NOT EXISTS restriction_roles (
    id integer PRIMARY KEY AUTO_INCREMENT,
    restriction char(36) NOT NULL,
    role char(36) NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36)
);

-- ROLE PERMISSIONS
CREATE TABLE IF NOT EXISTS role_permissions (
    id char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    role char(36) NOT NULL,
    permission char(36) NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36)
);

-- PERMISSION
CREATE TABLE IF NOT EXISTS permission (
    id char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    permission varchar(50) UNIQUE NOT NULL,
    description text NOT NULL,
    `type` integer NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    created_by char(36) NOT NULL,
    updated_by char(36),
    confirmed_by char(36),
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- ROLE
CREATE TABLE IF NOT EXISTS role (
    id char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    role varchar(50) UNIQUE NOT NULL,
    description text NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- INSTRUCTION
CREATE TABLE IF NOT EXISTS instruction (
    id char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    instruction varchar(50) NOT NULL,
    description text NOT NULL,
    url_documentation varchar(2083),
    `type` integer NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP),
    updated_at datetime,
    confirmed_at datetime,
    deleted_at datetime,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36)
);

-- TRIGGERS PARA UUID
DELIMITER $$

DROP TRIGGER IF EXISTS restriction_before_insert$$
CREATE TRIGGER restriction_before_insert
BEFORE INSERT ON restriction
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL THEN
        SET NEW.id = UUID();
    END IF;
    IF NEW.log IS NULL THEN
        SET NEW.log = "init;";
    END IF;
END$$

DROP TRIGGER IF EXISTS role_permissions_before_insert$$
CREATE TRIGGER role_permissions_before_insert
BEFORE INSERT ON role_permissions
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL THEN
        SET NEW.id = UUID();
    END IF;
END$$

DROP TRIGGER IF EXISTS permission_before_insert$$
CREATE TRIGGER permission_before_insert
BEFORE INSERT ON permission
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL THEN
        SET NEW.id = UUID();
    END IF;
    IF NEW.log IS NULL THEN
        SET NEW.log = "init;";
    END IF;
END$$

DROP TRIGGER IF EXISTS role_before_insert$$
CREATE TRIGGER role_before_insert
BEFORE INSERT ON role
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL THEN
        SET NEW.id = UUID();
    END IF;
    IF NEW.log IS NULL THEN
        SET NEW.log = "init;";
    END IF;
END$$

DROP TRIGGER IF EXISTS instruction_before_insert$$
CREATE TRIGGER instruction_before_insert
BEFORE INSERT ON instruction
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL THEN
        SET NEW.id = UUID();
    END IF;
END$$

DELIMITER ; 