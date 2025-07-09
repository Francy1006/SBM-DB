-- Trigger para asignar UUID a code en sbm_business.franchise

-- Asegúrate de tener la extensión pgcrypto para gen_random_uuid
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Función que asigna UUID si code es NULL
CREATE OR REPLACE FUNCTION sbm_business.franchise_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Elimina el trigger si ya existe
DROP TRIGGER IF EXISTS franchise_before_insert ON sbm_business.franchise;

-- Crea el trigger
CREATE TRIGGER franchise_before_insert
BEFORE INSERT ON sbm_business.franchise
FOR EACH ROW
EXECUTE FUNCTION sbm_business.franchise_before_insert(); 