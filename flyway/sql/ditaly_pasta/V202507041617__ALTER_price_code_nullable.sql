-- Permitir que el campo code en ditaly_pasta.price sea NULL
ALTER TABLE ditaly_pasta.price ALTER COLUMN code DROP NOT NULL;

-- Trigger para asignar UUID a code en ditaly_pasta.price si es NULL
CREATE OR REPLACE FUNCTION ditaly_pasta.price_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_price_before_insert ON ditaly_pasta.price;
CREATE TRIGGER trigger_price_before_insert
    BEFORE INSERT ON ditaly_pasta.price
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.price_before_insert(); 