-- ADD price_type column to ditaly_pasta.price_configuration table according to DBML

-- Add price_type column if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'ditaly_pasta' 
        AND table_name = 'price_configuration' 
        AND column_name = 'price_type'
    ) THEN
        ALTER TABLE ditaly_pasta.price_configuration 
        ADD COLUMN price_type integer NOT NULL;
    END IF;
END$$;

-- Add foreign key constraint if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
        WHERE tc.table_schema = 'ditaly_pasta' 
        AND tc.table_name = 'price_configuration' 
        AND tc.constraint_type = 'FOREIGN KEY' 
        AND kcu.column_name = 'price_type'
    ) THEN
        ALTER TABLE ditaly_pasta.price_configuration 
        ADD CONSTRAINT fk_price_configuration_price_type 
        FOREIGN KEY (price_type) REFERENCES sbm_business.price_type(id);
    END IF;
END$$;