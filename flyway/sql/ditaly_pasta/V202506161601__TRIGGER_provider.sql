CREATE TRIGGER before_insert_provider
BEFORE INSERT ON ditaly_pasta.provider
FOR EACH ROW
BEGIN
  DECLARE prefix VARCHAR(3);
  DECLARE count_same_type INT;

  IF NEW.code IS NULL OR NEW.code = '' THEN
    -- Definir prefijo según el tipo
    SET prefix = CASE NEW.type
      WHEN 1 THEN 'PVP'
      WHEN 2 THEN 'PVM'
      WHEN 3 THEN 'PVS'
      ELSE 'PVX'
    END;

    -- Contar cuántos proveedores existen ya con ese tipo
    SELECT COUNT(*) + 1 INTO count_same_type
    FROM ditaly_pasta.provider
    WHERE type = NEW.type;

    -- Generar el código con formato tipo: PVP-001
    SET NEW.code = CONCAT(prefix, '-', LPAD(count_same_type, 3, '0'));
  END IF;
END