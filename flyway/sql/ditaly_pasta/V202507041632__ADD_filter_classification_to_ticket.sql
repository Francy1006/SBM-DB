-- ADD FILTER_CLASSIFICATION COLUMN TO TICKET TABLE
-- Agregar el campo filter_classification a la tabla ticket

-- Agregar la columna filter_classification como nullable primero
ALTER TABLE ditaly_pasta.ticket 
ADD COLUMN IF NOT EXISTS filter_classification integer;

-- Actualizar los registros existentes con el primer ID de item_filter_classification
-- Si no hay registros en item_filter_classification, crear uno por defecto
DO $$
DECLARE
    default_classification_id integer;
    ticket_count integer;
BEGIN
    -- Verificar si hay registros en item_filter_classification
    SELECT id INTO default_classification_id
    FROM sbm_business.item_filter_classification 
    ORDER BY id 
    LIMIT 1;
    
    -- Si no existe ningún registro, crear uno por defecto
    IF default_classification_id IS NULL THEN
        INSERT INTO sbm_business.item_filter_classification (classification, description)
        VALUES ('DEFAULT', 'Clasificación por defecto para filtros de items')
        RETURNING id INTO default_classification_id;
    END IF;
    
    -- Contar registros en ticket que necesitan actualización
    SELECT COUNT(*) INTO ticket_count
    FROM ditaly_pasta.ticket
    WHERE filter_classification IS NULL;
    
    -- Actualizar los registros existentes
    IF ticket_count > 0 THEN
        UPDATE ditaly_pasta.ticket 
        SET filter_classification = default_classification_id
        WHERE filter_classification IS NULL;
    END IF;
END $$;

-- Hacer la columna NOT NULL
ALTER TABLE ditaly_pasta.ticket 
ALTER COLUMN filter_classification SET NOT NULL;

-- Agregar la foreign key constraint
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'fk_ticket_filter_classification' 
        AND conrelid = 'ditaly_pasta.ticket'::regclass
    ) THEN
        ALTER TABLE ditaly_pasta.ticket 
        ADD CONSTRAINT fk_ticket_filter_classification 
        FOREIGN KEY (filter_classification) REFERENCES sbm_business.item_filter_classification(id);
    END IF;
END $$;

