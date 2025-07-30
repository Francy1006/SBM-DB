-- Migration: V202507041602__ADD_new_tables.sql
-- Description: Add new tables for franchise, bank, and user_token

-- START SBM configuration tables
-- Add franchise_state table
CREATE TABLE IF NOT EXISTS sbm_business.franchise_state (
    id SERIAL PRIMARY KEY,
    state VARCHAR(50) NOT NULL,
    description TEXT NOT NULL
);

-- Add franchise table
CREATE TABLE IF NOT EXISTS sbm_business.franchise (
    id SERIAL PRIMARY KEY,
    code CHAR(36) NULL UNIQUE,
    franchise VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    state INTEGER NOT NULL,
    FOREIGN KEY (state) REFERENCES sbm_business.franchise_state(id)
);

-- END SBM configuration tables

-- START complementary tables
-- Add bank table
CREATE TABLE IF NOT EXISTS sbm_business.bank (
    id SERIAL PRIMARY KEY,
    bank VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- END complementary tables

-- START documentation & security tables
-- END documentation & security tables

-- START user tables
-- Add user_token table
CREATE TABLE IF NOT EXISTS sbm_business.user_token (
    id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    token TEXT NOT NULL,
    ip_address VARCHAR(45) NOT NULL,
    user_agent TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP NULL,
    revoked_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES sbm_business.user(code)
);

-- END user tables

-- END price & sales tables

-- Insert default data for franchise_state
INSERT INTO sbm_business.franchise_state (state, description) VALUES
('ACTIVO', 'Franchise is active and operational'),
('DESACTIVADO', 'Franchise is inactive'),
('PENDIENTE', 'Franchise is pending approval'),
('SUSPENDIDO', 'Franchise is temporarily suspended')
ON CONFLICT DO NOTHING;

-- Insert default data for bank
INSERT INTO sbm_business.bank (bank, description) VALUES
('Banco de Chile', 'Banco de Chile'),
('Banco Santander', 'Banco Santander'),
('Banco de Crédito e Inversiones', 'Banco de Crédito e Inversiones'),
('Banco Estado', 'Banco Estado'),
('Scotiabank Chile', 'Scotiabank Chile'),
('Banco BCI', 'Banco BCI'),
('Banco Security', 'Banco Security'),
('Banco Falabella', 'Banco Falabella'),
('Banco Consorcio', 'Banco Consorcio'),
('Banco Ripley', 'Banco Ripley')
ON CONFLICT DO NOTHING;

-- Insert default fiscal formulas
-- Estos inserts se encuentran ahora en flyway-cross para evitar dependencias de datos. 