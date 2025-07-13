-- CREATE ACCOUNTING TABLES
-- Crear esquema y tablas de contabilidad

-- Crear el esquema accounting si no existe
CREATE SCHEMA IF NOT EXISTS accounting;

-- Crear tabla accounting_account
CREATE TABLE IF NOT EXISTS accounting.accounting_account (
    id SERIAL PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    parent_id INTEGER NULL,
    description TEXT NULL,
    FOREIGN KEY (parent_id) REFERENCES accounting.accounting_account(id)
);

-- Crear tabla accounting_journal
CREATE TABLE IF NOT EXISTS accounting.accounting_journal (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NULL,
    is_active BOOLEAN NOT NULL DEFAULT true
);

-- Crear tabla accounting_period
CREATE TABLE IF NOT EXISTS accounting.accounting_period (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_closed BOOLEAN DEFAULT false
);

-- Crear tabla accounting_transaction
CREATE TABLE IF NOT EXISTS accounting.accounting_transaction (
    id SERIAL PRIMARY KEY,
    journal INTEGER NOT NULL,
    reference VARCHAR(100) NULL,
    date DATE NOT NULL,
    description TEXT NULL,
    created_by CHAR(36) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (journal) REFERENCES accounting.accounting_journal(id),
    FOREIGN KEY (created_by) REFERENCES sbm_business.user(code)
);

-- Crear tabla accounting_entry
CREATE TABLE IF NOT EXISTS accounting.accounting_entry (
    id SERIAL PRIMARY KEY,
    transaction INTEGER NOT NULL,
    account INTEGER NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    is_debit BOOLEAN NOT NULL,
    description TEXT NULL,
    FOREIGN KEY (transaction) REFERENCES accounting.accounting_transaction(id),
    FOREIGN KEY (account) REFERENCES accounting.accounting_account(id)
);

-- Crear tabla accounting_closure
CREATE TABLE IF NOT EXISTS accounting.accounting_closure (
    id SERIAL PRIMARY KEY,
    period INTEGER NOT NULL,
    closed_by CHAR(36) NOT NULL,
    closed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    notes TEXT NULL,
    FOREIGN KEY (period) REFERENCES accounting.accounting_period(id),
    FOREIGN KEY (closed_by) REFERENCES sbm_business.user(code)
);

-- Crear tabla accounting_tax_report
CREATE TABLE IF NOT EXISTS accounting.accounting_tax_report (
    id SERIAL PRIMARY KEY,
    period INTEGER NOT NULL,
    type VARCHAR(50) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    submitted BOOLEAN DEFAULT false,
    submitted_at TIMESTAMP NULL,
    FOREIGN KEY (period) REFERENCES accounting.accounting_period(id)
);

-- Crear tabla accounting_invoice_link
CREATE TABLE IF NOT EXISTS accounting.accounting_invoice_link (
    id SERIAL PRIMARY KEY,
    invoice_id CHAR(36) NOT NULL,
    transaction INTEGER NOT NULL,
    FOREIGN KEY (transaction) REFERENCES accounting.accounting_transaction(id)
);

-- Crear tabla accounting_fiscal_directive_link
CREATE TABLE IF NOT EXISTS accounting.accounting_fiscal_directive_link (
    id SERIAL PRIMARY KEY,
    directive CHAR(36) NOT NULL,
    entry INTEGER NOT NULL,
    FOREIGN KEY (directive) REFERENCES sbm_business.fiscal_directive(code),
    FOREIGN KEY (entry) REFERENCES accounting.accounting_entry(id)
);

-- Insertar cuentas contables básicas
INSERT INTO accounting.accounting_account (code, name, type, description) VALUES
('1000', 'Caja', 'ACTIVO', 'Efectivo en caja'),
('1100', 'Banco', 'ACTIVO', 'Cuentas bancarias'),
('1200', 'Cuentas por Cobrar', 'ACTIVO', 'Deudas de clientes'),
('1300', 'Inventario', 'ACTIVO', 'Mercancías en stock'),
('2000', 'Cuentas por Pagar', 'PASIVO', 'Deudas a proveedores'),
('2100', 'Impuestos por Pagar', 'PASIVO', 'Impuestos pendientes'),
('3000', 'Capital', 'PATRIMONIO', 'Capital social'),
('4000', 'Ventas', 'INGRESO', 'Ingresos por ventas'),
('5000', 'Costo de Ventas', 'GASTO', 'Costos directos de ventas'),
('6000', 'Gastos Operacionales', 'GASTO', 'Gastos de administración')
ON CONFLICT (code) DO NOTHING;

-- Insertar diarios contables básicos
INSERT INTO accounting.accounting_journal (name, description) VALUES
('Ventas', 'Diario para registrar ventas'),
('Compras', 'Diario para registrar compras'),
('Gastos', 'Diario para registrar gastos'),
('Caja', 'Diario para movimientos de caja'),
('Bancos', 'Diario para movimientos bancarios')
ON CONFLICT DO NOTHING;

-- Comentarios para documentar las tablas
COMMENT ON SCHEMA accounting IS 'Esquema para el sistema de contabilidad';
COMMENT ON TABLE accounting.accounting_account IS 'Plan de cuentas contables';
COMMENT ON TABLE accounting.accounting_journal IS 'Diarios contables';
COMMENT ON TABLE accounting.accounting_period IS 'Períodos contables';
COMMENT ON TABLE accounting.accounting_transaction IS 'Transacciones contables';
COMMENT ON TABLE accounting.accounting_entry IS 'Asientos contables';
COMMENT ON TABLE accounting.accounting_closure IS 'Cierres contables';
COMMENT ON TABLE accounting.accounting_tax_report IS 'Reportes de impuestos';
COMMENT ON TABLE accounting.accounting_invoice_link IS 'Enlaces entre facturas y transacciones contables';
COMMENT ON TABLE accounting.accounting_fiscal_directive_link IS 'Enlaces entre directivas fiscales y asientos contables'; 