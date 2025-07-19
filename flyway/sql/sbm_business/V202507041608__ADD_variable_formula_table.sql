-- ADD VARIABLE FORMULA TABLE
CREATE TABLE IF NOT EXISTS sbm_business.variable_formula (
    id SERIAL PRIMARY KEY,
    code CHAR(36) UNIQUE NULL,
    formula VARCHAR(50) NOT NULL,
    formula_template TEXT NOT NULL,
    formula_translate TEXT NOT NULL,
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

-- Trigger para asignar UUID a code en variable_formula
CREATE OR REPLACE FUNCTION sbm_business.variable_formula_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_variable_formula_before_insert
    BEFORE INSERT ON sbm_business.variable_formula
    FOR EACH ROW
    EXECUTE FUNCTION sbm_business.variable_formula_before_insert();

COMMENT ON TABLE sbm_business.variable_formula IS 'Fórmulas variables para configuración de franquicias y fiscalidad'; 