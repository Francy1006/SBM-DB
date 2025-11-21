-- AGREEMENTS TABLE
-- Tabla para convenios
CREATE TABLE IF NOT EXISTS ditaly_pasta.agreements (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    company char(36) NOT NULL,
    name varchar(150) NOT NULL,
    description text,
    discount decimal(5,2) NOT NULL,
    start_date date NOT NULL,
    end_date date,
    is_active boolean NOT NULL DEFAULT true,
    is_deleted boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    updated_by char(36),
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- TRIGGER PARA UUID Y LOG
CREATE OR REPLACE FUNCTION ditaly_pasta.agreements_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid();
    END IF;
    IF NEW.log IS NULL THEN
        NEW.log := 'init;';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS agreements_before_insert ON ditaly_pasta.agreements;
CREATE TRIGGER agreements_before_insert
    BEFORE INSERT ON ditaly_pasta.agreements
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.agreements_before_insert();

-- FOREIGN KEY CONSTRAINTS
ALTER TABLE ditaly_pasta.agreements 
ADD CONSTRAINT fk_agreements_company 
FOREIGN KEY (company) REFERENCES ditaly_pasta.company_agreements(code);

ALTER TABLE ditaly_pasta.agreements 
ADD CONSTRAINT fk_agreements_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.agreements 
ADD CONSTRAINT fk_agreements_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.agreements 
ADD CONSTRAINT fk_agreements_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);







