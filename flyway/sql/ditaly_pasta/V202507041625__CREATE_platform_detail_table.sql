-- PLATFORM DETAIL TABLE
-- Tabla para detalles de plataformas por sucursal
CREATE TABLE IF NOT EXISTS ditaly_pasta.platform_detail (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    branch char(36) NOT NULL,
    platform char(36) NOT NULL,
    param_key varchar(100) NOT NULL,
    param_value text,
    description text,
    is_required boolean NOT NULL DEFAULT false,
    is_encrypted boolean NOT NULL DEFAULT false,
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
CREATE OR REPLACE FUNCTION ditaly_pasta.platform_detail_before_insert()
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

DROP TRIGGER IF EXISTS platform_detail_before_insert ON ditaly_pasta.platform_detail;
CREATE TRIGGER platform_detail_before_insert
    BEFORE INSERT ON ditaly_pasta.platform_detail
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.platform_detail_before_insert();

-- FOREIGN KEY CONSTRAINTS
ALTER TABLE ditaly_pasta.platform_detail 
ADD CONSTRAINT fk_platform_detail_branch 
FOREIGN KEY (branch) REFERENCES ditaly_pasta.branches(code);

ALTER TABLE ditaly_pasta.platform_detail 
ADD CONSTRAINT fk_platform_detail_platform 
FOREIGN KEY (platform) REFERENCES ditaly_pasta.platform(code);

ALTER TABLE ditaly_pasta.platform_detail 
ADD CONSTRAINT fk_platform_detail_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.platform_detail 
ADD CONSTRAINT fk_platform_detail_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.platform_detail 
ADD CONSTRAINT fk_platform_detail_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);








