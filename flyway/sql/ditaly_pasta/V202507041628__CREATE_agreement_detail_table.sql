-- AGREEMENT DETAIL TABLE
-- Tabla para detalles de convenios por sucursal y ticket
CREATE TABLE IF NOT EXISTS ditaly_pasta.agreement_detail (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    company char(36) NOT NULL,
    agreement char(36) NOT NULL,
    branch char(36) NOT NULL,
    ticket char(36),
    benefit_applied boolean NOT NULL DEFAULT false,
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
CREATE OR REPLACE FUNCTION ditaly_pasta.agreement_detail_before_insert()
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

DROP TRIGGER IF EXISTS agreement_detail_before_insert ON ditaly_pasta.agreement_detail;
CREATE TRIGGER agreement_detail_before_insert
    BEFORE INSERT ON ditaly_pasta.agreement_detail
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.agreement_detail_before_insert();

-- FOREIGN KEY CONSTRAINTS
ALTER TABLE ditaly_pasta.agreement_detail 
ADD CONSTRAINT fk_agreement_detail_company 
FOREIGN KEY (company) REFERENCES ditaly_pasta.company_agreements(code);

ALTER TABLE ditaly_pasta.agreement_detail 
ADD CONSTRAINT fk_agreement_detail_agreement 
FOREIGN KEY (agreement) REFERENCES ditaly_pasta.agreements(code);

ALTER TABLE ditaly_pasta.agreement_detail 
ADD CONSTRAINT fk_agreement_detail_branch 
FOREIGN KEY (branch) REFERENCES ditaly_pasta.branches(code);

ALTER TABLE ditaly_pasta.agreement_detail 
ADD CONSTRAINT fk_agreement_detail_ticket 
FOREIGN KEY (ticket) REFERENCES ditaly_pasta.ticket(code);

ALTER TABLE ditaly_pasta.agreement_detail 
ADD CONSTRAINT fk_agreement_detail_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.agreement_detail 
ADD CONSTRAINT fk_agreement_detail_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.agreement_detail 
ADD CONSTRAINT fk_agreement_detail_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);







