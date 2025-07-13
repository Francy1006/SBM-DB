-- ADD VARIABLE FORMULA TABLE
CREATE TABLE IF NOT EXISTS sbm_business.variable_formula (
    id CHAR(36) PRIMARY KEY,
    formula VARCHAR(50) NOT NULL,
    formula_template TEXT NOT NULL,
    is_deleted BOOLEAN NULL,
    is_confirmed BOOLEAN NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL,
    confirmed_at TIMESTAMP NULL,
    deleted_at TIMESTAMP NULL,
    created_by CHAR(36) NOT NULL REFERENCES sbm_business.user(code),
    confirmed_by CHAR(36) NULL REFERENCES sbm_business.user(code),
    updated_by CHAR(36) NULL REFERENCES sbm_business.user(code),
    deleted_by CHAR(36) NULL REFERENCES sbm_business.user(code)
);

COMMENT ON TABLE sbm_business.variable_formula IS 'Fórmulas variables para configuración de franquicias y fiscalidad'; 