-- ADD FRANCHISE CONFIGURATION TABLES
-- Agregar tablas de configuración de franquicias en ditaly_pasta

-- Crear tabla franchise_configuration
CREATE TABLE IF NOT EXISTS ditaly_pasta.franchise_configuration (
    id SERIAL PRIMARY KEY,
    code CHAR(36) UNIQUE NOT NULL,
    configuration VARCHAR(50) NOT NULL,
    franchise CHAR(36) NOT NULL,
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
    FOREIGN KEY (franchise) REFERENCES sbm_business.franchise(code),
    FOREIGN KEY (created_by) REFERENCES sbm_business.user(code),
    FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code),
    FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code),
    FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code)
);

-- Crear tabla franchise_configuration_detail
CREATE TABLE IF NOT EXISTS ditaly_pasta.franchise_configuration_detail (
    id SERIAL,
    code CHAR(36) NULL,
    detail VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    type INTEGER NOT NULL,
    configuration CHAR(36) NOT NULL,
    index INTEGER NOT NULL DEFAULT 1,
    var VARCHAR(50) NOT NULL,
    value DECIMAL(10,2) NOT NULL DEFAULT 0,
    formula CHAR(36) NOT NULL,
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
    PRIMARY KEY (id, type),
    FOREIGN KEY (type) REFERENCES sbm_business.franchise_configuration_type(id),
    FOREIGN KEY (configuration) REFERENCES ditaly_pasta.franchise_configuration(code),
    FOREIGN KEY (formula) REFERENCES sbm_business.variable_formula(code),
    FOREIGN KEY (created_by) REFERENCES sbm_business.user(code),
    FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code),
    FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code),
    FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code)
);

-- Trigger para asignar UUID a code en franchise_configuration
CREATE OR REPLACE FUNCTION ditaly_pasta.franchise_configuration_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_franchise_configuration_before_insert
    BEFORE INSERT ON ditaly_pasta.franchise_configuration
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.franchise_configuration_before_insert();

-- Trigger para asignar UUID a code en franchise_configuration_detail
CREATE OR REPLACE FUNCTION ditaly_pasta.franchise_configuration_detail_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_franchise_configuration_detail_before_insert
    BEFORE INSERT ON ditaly_pasta.franchise_configuration_detail
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.franchise_configuration_detail_before_insert();



-- Comentarios para documentar el cambio
COMMENT ON TABLE ditaly_pasta.franchise_configuration IS 'Configuraciones específicas por franquicia';
COMMENT ON TABLE ditaly_pasta.franchise_configuration_detail IS 'Detalles de configuración específicos por franquicia'; 