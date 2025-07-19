-- Migration: V202507041602__ADD_fiscal_tables.sql
-- Description: Add fiscal configuration tables for ditaly_pasta schema

-- START price & sales tables
-- Add price_fiscal_configuration table
CREATE TABLE IF NOT EXISTS ditaly_pasta.price_fiscal_configuration (
    id CHAR(36) PRIMARY KEY,
    fiscal_configuration VARCHAR(50) NOT NULL UNIQUE,
    fiscal_formula CHAR(36) NOT NULL,
    is_deleted BOOLEAN NULL,
    is_confirmed BOOLEAN NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL,
    confirmed_at TIMESTAMP NULL,
    deleted_at TIMESTAMP NULL,
    created_by CHAR(36) NOT NULL,
    confirmed_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,
    FOREIGN KEY (fiscal_formula) REFERENCES sbm_business.variable_formula(code),
    FOREIGN KEY (created_by) REFERENCES sbm_business.user(code),
    FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code),
    FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code),
    FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code)
);

-- Add fiscal_configuration_detail table
CREATE TABLE IF NOT EXISTS ditaly_pasta.fiscal_configuration_detail (
    id SERIAL,
    price_fiscal_configuration CHAR(36) NOT NULL,
    price CHAR(36) NOT NULL,
    fiscal_directive CHAR(36) NOT NULL,
    log TEXT NOT NULL DEFAULT 'init;',
    PRIMARY KEY (id, price, fiscal_directive),
    FOREIGN KEY (price_fiscal_configuration) REFERENCES ditaly_pasta.price_fiscal_configuration(id),
    FOREIGN KEY (price) REFERENCES ditaly_pasta.price(code),
    FOREIGN KEY (fiscal_directive) REFERENCES sbm_business.fiscal_directive(code)
);

-- END price & sales tables 