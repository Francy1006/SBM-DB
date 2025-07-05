-- COMPLEMENTARY TABLES
-- Tablas de referencia y lookup para el sistema
-- MENU
CREATE TABLE IF NOT EXISTS sbm_business.menu (
    id SERIAL PRIMARY KEY,
    menu varchar(50) NOT NULL,
    description text NOT NULL
);
-- ITEM GROUP
CREATE TABLE IF NOT EXISTS sbm_business.item_group (
    id SERIAL PRIMARY KEY,
    group_name varchar(50) NOT NULL,
    description text NOT NULL,
    catalog_render boolean NOT NULL DEFAULT true
);
-- ITEM CATEGORY
CREATE TABLE IF NOT EXISTS sbm_business.item_category (
    id SERIAL PRIMARY KEY,
    category varchar(50) NOT NULL,
    description text NOT NULL,
    catalog_render boolean NOT NULL DEFAULT true
);
-- ITEM TYPE
CREATE TABLE IF NOT EXISTS sbm_business.item_type (
    id SERIAL PRIMARY KEY,
    type varchar(50) NOT NULL,
    description text NOT NULL
);
-- PACKAGE TYPE
CREATE TABLE IF NOT EXISTS sbm_business.package_type (
    id SERIAL PRIMARY KEY,
    type varchar(50) NOT NULL,
    description text NOT NULL
);
-- TRANSPORT TYPE
CREATE TABLE IF NOT EXISTS sbm_business.transport_type (
    id SERIAL PRIMARY KEY,
    type varchar(50) NOT NULL,
    description text NOT NULL
);
-- MEASURE UNIT
CREATE TABLE IF NOT EXISTS sbm_business.measure_unit (
    id SERIAL PRIMARY KEY,
    measure_unit varchar(50) NOT NULL,
    description text NOT NULL
);
-- PROVIDER TYPE
CREATE TABLE IF NOT EXISTS sbm_business.provider_type (
    id SERIAL PRIMARY KEY,
    type varchar(50) NOT NULL,
    description text NOT NULL
);
-- INSTRUCTION TYPE
CREATE TABLE IF NOT EXISTS sbm_business.instruction_type (
    id SERIAL PRIMARY KEY,
    type varchar(50) NOT NULL,
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
    deleted_by char(36)
);
-- PERMISSION TYPE
CREATE TABLE IF NOT EXISTS sbm_business.permission_type (
    id SERIAL PRIMARY KEY,
    type varchar(50) NOT NULL,
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
    deleted_by char(36)
);
-- BANK ACCOUNT TYPE
CREATE TABLE IF NOT EXISTS sbm_business.bank_account_type (
    id SERIAL PRIMARY KEY,
    type varchar(255) NOT NULL,
    description text NOT NULL
);
-- DISTRICT
CREATE TABLE IF NOT EXISTS sbm_business.district (
    id SERIAL PRIMARY KEY,
    district varchar(255) NOT NULL,
    region integer NOT NULL,
    description text NOT NULL
);
-- REGION
CREATE TABLE IF NOT EXISTS sbm_business.region (
    id SERIAL PRIMARY KEY,
    region varchar(255) NOT NULL,
    description text NOT NULL
);
-- FISCAL DIRECTIVE TYPE
CREATE TABLE IF NOT EXISTS sbm_business.fiscal_directive_type (
    id SERIAL PRIMARY KEY,
    type varchar(255) NOT NULL,
    description text NOT NULL
); 