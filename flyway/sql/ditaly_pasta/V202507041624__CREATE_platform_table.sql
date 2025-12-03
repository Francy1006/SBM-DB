-- PLATFORM TABLE
-- Tabla para plataformas
CREATE TABLE IF NOT EXISTS ditaly_pasta.platform (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    platform varchar(100) NOT NULL UNIQUE,
    description text,
    website varchar(255),
    is_active boolean NOT NULL DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    created_by char(36) NOT NULL,
    updated_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- TRIGGER PARA UUID Y LOG
CREATE OR REPLACE FUNCTION ditaly_pasta.platform_before_insert()
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

DROP TRIGGER IF EXISTS platform_before_insert ON ditaly_pasta.platform;
CREATE TRIGGER platform_before_insert
    BEFORE INSERT ON ditaly_pasta.platform
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.platform_before_insert();

-- FOREIGN KEY CONSTRAINTS
ALTER TABLE ditaly_pasta.platform 
ADD CONSTRAINT fk_platform_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.platform 
ADD CONSTRAINT fk_platform_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);








