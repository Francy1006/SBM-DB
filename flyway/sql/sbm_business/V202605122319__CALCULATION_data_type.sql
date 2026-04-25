-- 1. CREATE TABLE
CREATE TABLE sbm_business.data_type (
  id SERIAL PRIMARY KEY,
  data_type VARCHAR(50) NOT NULL UNIQUE,
  description VARCHAR(255)
);

-- 2. SEED DATA TYPES
INSERT INTO sbm_business.data_type (data_type, description) VALUES
('decimal', 'Número decimal'),
('percentage', 'Porcentaje'),
('text', 'Texto'),
('long', 'Texto largo'),
('currency_int1', 'Moneda sin decimales'),
('currency_int2', 'Moneda con 2 decimales');


-- =========================================================
-- 3. calculation_concept (MIGRACIÓN VARCHAR → FK INT)
-- =========================================================

-- 3.1 Add new column
ALTER TABLE sbm_business.calculation_concept
ADD COLUMN data_type_id INT;

-- 3.2 Backfill default (decimal)
UPDATE sbm_business.calculation_concept cc
SET data_type_id = dt.id
FROM sbm_business.data_type dt
WHERE dt.data_type = 'decimal'
  AND cc.data_type_id IS NULL;

-- 3.3 NOT NULL constraint
ALTER TABLE sbm_business.calculation_concept
ALTER COLUMN data_type_id SET NOT NULL;

-- 3.4 Drop old column
ALTER TABLE sbm_business.calculation_concept
DROP COLUMN data_type;

-- 3.5 FK constraint
ALTER TABLE sbm_business.calculation_concept
ADD CONSTRAINT fk_calculation_concept_data_type
FOREIGN KEY (data_type_id)
REFERENCES sbm_business.data_type(id);


-- =========================================================
-- 4. fiscal_configuration_detail (NEW COLUMN)
-- =========================================================

-- 4.1 Add column
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD COLUMN data_type_id INT;

-- 4.2 Backfill default (decimal)
UPDATE ditaly_pasta.fiscal_configuration_detail f
SET data_type_id = dt.id
FROM sbm_business.data_type dt
WHERE dt.data_type = 'percentage'
  AND f.data_type_id IS NULL;

-- 4.3 NOT NULL constraint
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ALTER COLUMN data_type_id SET NOT NULL;

-- 4.4 FK constraint
ALTER TABLE ditaly_pasta.fiscal_configuration_detail
ADD CONSTRAINT fk_fiscal_configuration_detail_data_type
FOREIGN KEY (data_type_id)
REFERENCES sbm_business.data_type(id);