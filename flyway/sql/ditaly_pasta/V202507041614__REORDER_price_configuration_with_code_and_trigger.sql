-- DROP y CREATE TABLE para reordenar columnas y agregar code con trigger UUID en ditaly_pasta.price_configuration según DBML

DROP TABLE IF EXISTS ditaly_pasta.price_configuration CASCADE;

CREATE TABLE ditaly_pasta.price_configuration (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    code char(36) UNIQUE NULL,
    price_configuration varchar(50) NOT NULL UNIQUE,
    franchise_configuration char(36) NOT NULL,
    variable_formula char(36) NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp NULL,
    confirmed_at timestamp NULL,
    deleted_at timestamp NULL,
    created_by char(36) NOT NULL,
    confirmed_by char(36) NULL,
    updated_by char(36) NULL,
    deleted_by char(36) NULL,
    CONSTRAINT fk_price_configuration_franchise_configuration FOREIGN KEY (franchise_configuration) REFERENCES ditaly_pasta.franchise_configuration(code),
    CONSTRAINT fk_price_configuration_variable_formula FOREIGN KEY (variable_formula) REFERENCES sbm_business.variable_formula(code),
    CONSTRAINT fk_price_configuration_created_by FOREIGN KEY (created_by) REFERENCES sbm_business.user(code),
    CONSTRAINT fk_price_configuration_confirmed_by FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code),
    CONSTRAINT fk_price_configuration_updated_by FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code),
    CONSTRAINT fk_price_configuration_deleted_by FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code)
);

-- Trigger para asignar UUID a code en price_configuration
CREATE OR REPLACE FUNCTION ditaly_pasta.price_configuration_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_price_configuration_before_insert ON ditaly_pasta.price_configuration;
CREATE TRIGGER trigger_price_configuration_before_insert
    BEFORE INSERT ON ditaly_pasta.price_configuration
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.price_configuration_before_insert(); 