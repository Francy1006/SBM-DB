-- Create schemas
CREATE SCHEMA IF NOT EXISTS sbm_business;
CREATE SCHEMA IF NOT EXISTS ditaly_pasta;

-- START complementary tables (sbm_business schema)
CREATE TABLE IF NOT EXISTS sbm_business.menu (
    id integer PRIMARY KEY AUTO_INCREMENT,
    menu varchar(50) NOT NULL,
    description text NOT NULL
);

CREATE TABLE IF NOT EXISTS sbm_business.item_group (
    id integer PRIMARY KEY AUTO_INCREMENT,
    group_name varchar(50) NOT NULL,
    description text NOT NULL,
    catalog_render boolean NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS sbm_business.item_category (
    id integer PRIMARY KEY AUTO_INCREMENT,
    category varchar(50) NOT NULL,
    description text NOT NULL,
    catalog_render boolean NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS sbm_business.item_type (
    id integer PRIMARY KEY AUTO_INCREMENT,
    `type` varchar(50) NOT NULL,
    description text NOT NULL
);

CREATE TABLE IF NOT EXISTS sbm_business.package_type (
    id integer PRIMARY KEY AUTO_INCREMENT,
    `type` varchar(50) NOT NULL,
    description text NOT NULL
);

CREATE TABLE IF NOT EXISTS sbm_business.transport_type (
    id integer PRIMARY KEY AUTO_INCREMENT,
    `type` varchar(50) NOT NULL,
    description text NOT NULL
);

CREATE TABLE IF NOT EXISTS sbm_business.measure_unit (
    id integer PRIMARY KEY AUTO_INCREMENT,
    measure_unit varchar(50) NOT NULL,
    description text NOT NULL
);

CREATE TABLE IF NOT EXISTS sbm_business.provider_type (
    id integer PRIMARY KEY AUTO_INCREMENT,
    `type` varchar(50) NOT NULL,
    description text NOT NULL
);

CREATE TABLE IF NOT EXISTS sbm_business.instruction_type (
    id int PRIMARY KEY AUTO_INCREMENT,
    `type` varchar(50) NOT NULL,
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
    deleted_by char(36)
);

CREATE TABLE IF NOT EXISTS sbm_business.permission_type (
    id integer PRIMARY KEY AUTO_INCREMENT,
    `type` varchar(50) NOT NULL,
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
    deleted_by char(36)
);

CREATE TABLE IF NOT EXISTS sbm_business.bank_account_type (
    id integer PRIMARY KEY AUTO_INCREMENT,
    `type` varchar(255) NOT NULL,
    description text NOT NULL
);

CREATE TABLE IF NOT EXISTS sbm_business.district (
    id integer PRIMARY KEY AUTO_INCREMENT,
    district varchar(255) NOT NULL,
    region integer NOT NULL,
    description text NOT NULL
);

CREATE TABLE IF NOT EXISTS sbm_business.region (
    id integer PRIMARY KEY AUTO_INCREMENT,
    region varchar(255) NOT NULL,
    description text NOT NULL
);

CREATE TABLE IF NOT EXISTS sbm_business.fiscal_directive_type (
    id integer PRIMARY KEY AUTO_INCREMENT,
    type varchar(255) NOT NULL,
    description text NOT NULL
);

CREATE TABLE IF NOT EXISTS sbm_business.user_type (
    id integer PRIMARY KEY AUTO_INCREMENT,
    `type` varchar(50) NOT NULL,
    description text NOT NULL,
    created_at datetime DEFAULT (CURRENT_TIMESTAMP)
);

-- START documentation & security tables (sbm_business schema)
CREATE TABLE IF NOT EXISTS sbm_business.restriction (
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
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS sbm_business.restriction_roles (
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

CREATE TABLE IF NOT EXISTS sbm_business.role_permissions (
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

CREATE TABLE IF NOT EXISTS sbm_business.permission (
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
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS sbm_business.role (
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
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS sbm_business.instruction (
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

-- START product tables (ditaly_pasta schema)
CREATE TABLE IF NOT EXISTS ditaly_pasta.catalog (
    id int PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NULL COMMENT 'UUID() REQUIRES TRIGGER',
    sku varchar(50) NOT NULL,
    menu integer NOT NULL,
    `group` integer NOT NULL,
    category integer NOT NULL,
    `type` integer NOT NULL,
    restriction char(36) NOT NULL,
    name varchar(50) NOT NULL,
    description text NOT NULL,
    OBS varchar(255),
    chef_recommendation boolean NOT NULL DEFAULT 0,
    usage_instructions char(36) NOT NULL,
    base_gross_price integer NOT NULL DEFAULT 0,
    min_quantity_purchase integer NOT NULL DEFAULT 1,
    rations_quantity integer NOT NULL DEFAULT 1,
    cover_image varchar(2083),
    secondary_image varchar(2083),
    complementary_image varchar(2083),
    image_gallery varchar(2083),
    configuration char(36) NOT NULL,
    is_visible boolean NOT NULL DEFAULT 1,
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
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS ditaly_pasta.item_configuration (
    id int PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    configuration varchar(50) NOT NULL,
    description text NOT NULL,
    package integer NOT NULL,
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
    LOG text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS sbm_business.package (
    id integer PRIMARY KEY AUTO_INCREMENT,
    description text NOT NULL,
    package_type integer NOT NULL,
    transport_type integer NOT NULL,
    size decimal(10, 2) NOT NULL DEFAULT 0,
    weight decimal(10, 2) NOT NULL DEFAULT 0,
    measure_unit integer NOT NULL,
    quantity_unit integer NOT NULL DEFAULT 1,
    storage_instructions char(36) NOT NULL,
    transport_instructions char(36) NOT NULL,
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

CREATE TABLE IF NOT EXISTS ditaly_pasta.item_configuration_detail (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) NOT NULL,
    detail varchar(50) NOT NULL,
    type integer NOT NULL,
    configuration char(36) NOT NULL,
    id_item char(36) NOT NULL,
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

CREATE TABLE IF NOT EXISTS ditaly_pasta.product (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    sku varchar(50) NOT NULL,
    description text NOT NULL,
    OBS text NOT NULL,
    package_unit integer NOT NULL,
    min_package_purchase integer NOT NULL,
    gross_price integer NOT NULL DEFAULT 0,
    provider integer NOT NULL,
    `type` integer NOT NULL,
    `group` integer NOT NULL,
    category integer NOT NULL,
    url varchar(255),
    package integer NOT NULL,
    is_active boolean NOT NULL DEFAULT 1,
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
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS ditaly_pasta.material (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    sku varchar(50) NOT NULL,
    description text NOT NULL,
    OBS text NOT NULL,
    package_unit integer NOT NULL,
    min_package_purchase integer NOT NULL,
    gross_price integer NOT NULL DEFAULT 0,
    provider integer NOT NULL,
    `type` integer NOT NULL,
    `group` integer NOT NULL,
    category integer NOT NULL,
    url varchar(255),
    package integer NOT NULL,
    is_active boolean NOT NULL DEFAULT 1,
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
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS ditaly_pasta.service (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    sku varchar(50) NOT NULL,
    description text NOT NULL,
    OBS text NOT NULL,
    package_unit integer NOT NULL,
    min_package_purchase integer NOT NULL,
    gross_price integer NOT NULL DEFAULT 0,
    provider integer NOT NULL,
    `type` integer NOT NULL,
    `group` integer NOT NULL,
    category integer NOT NULL,
    url varchar(255),
    is_active boolean NOT NULL DEFAULT 1,
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
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS ditaly_pasta.provider (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'CUSTOM TRIGGER',
    provider varchar(50) UNIQUE NOT NULL,
    `type` integer NOT NULL,
    rating integer NOT NULL DEFAULT 0,
    OBS_provider text NOT NULL,
    contact_name varchar(100),
    contact_mail varchar(255),
    contact_phone bigint,
    contact_phone2 bigint,
    website_url text,
    OBS_contact varchar(255),
    company_name varchar(255),
    company_rut varchar(12),
    company_activity varchar(255),
    legal_representative varchar(255),
    billing_address text,
    billing_mail varchar(255),
    billing_phone bigint,
    company_bank integer,
    bank_account_type integer,
    bank_account_number varchar(255),
    bank_account_mail varchar(255),
    dispatch_address varchar(255),
    dispatch_maps_location varchar(255),
    OBS_dispatch text,
    dispatch_district integer,
    dispatch_region integer,
    is_active boolean NOT NULL DEFAULT 1,
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
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS sbm_business.bank (
    id integer PRIMARY KEY AUTO_INCREMENT,
    bank varchar(255) NOT NULL,
    description text NOT NULL,
    created_at datetime NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

-- START user tables (sbm_business schema)
CREATE TABLE IF NOT EXISTS sbm_business.user (
    id integer PRIMARY KEY AUTO_INCREMENT,
    code char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    `type` integer NOT NULL,
    google_id varchar(255) UNIQUE NOT NULL,
    mail varchar(255) UNIQUE NOT NULL,
    phone bigint NULL,
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
    `LOG` text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

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
