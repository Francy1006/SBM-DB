-- ADD EXPLICIT CONSTRAINTS FOR TICKET TABLE
-- Agregar constraints explícitas con nombre para que DBeaver pueda detectarlas correctamente

-- Eliminar constraints sin nombre y agregar constraints con nombre explícito
DO $$
DECLARE
    pk_constraint_name text;
    uk_constraint_name text;
    fk_constraint_exists boolean;
BEGIN
    -- Obtener el nombre de la constraint PRIMARY KEY existente
    SELECT conname INTO pk_constraint_name
    FROM pg_constraint
    WHERE contype = 'p'
    AND conrelid = 'ditaly_pasta.ticket'::regclass
    LIMIT 1;
    
    -- Si existe y no tiene el nombre deseado, eliminarla
    IF pk_constraint_name IS NOT NULL AND pk_constraint_name != 'pk_ticket_id' THEN
        EXECUTE format('ALTER TABLE ditaly_pasta.ticket DROP CONSTRAINT %I', pk_constraint_name);
    END IF;
    
    -- Agregar PRIMARY KEY con nombre explícito (si no existe)
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'pk_ticket_id' 
        AND conrelid = 'ditaly_pasta.ticket'::regclass
    ) THEN
        ALTER TABLE ditaly_pasta.ticket ADD CONSTRAINT pk_ticket_id PRIMARY KEY (id);
    END IF;
    
    -- Obtener el nombre de la constraint UNIQUE para code
    SELECT conname INTO uk_constraint_name
    FROM pg_constraint
    WHERE contype = 'u'
    AND conrelid = 'ditaly_pasta.ticket'::regclass
    AND conkey = ARRAY(
        SELECT attnum::smallint
        FROM pg_attribute 
        WHERE attrelid = 'ditaly_pasta.ticket'::regclass 
        AND attname = 'code'
    )::smallint[]
    LIMIT 1;
    
    -- Verificar si existe la foreign key que depende de la constraint UNIQUE
    SELECT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'fk_agreement_detail_ticket' 
        AND conrelid = 'ditaly_pasta.agreement_detail'::regclass
    ) INTO fk_constraint_exists;
    
    -- Si existe la constraint UNIQUE con nombre diferente y hay una FK que depende de ella
    IF uk_constraint_name IS NOT NULL AND uk_constraint_name != 'uk_ticket_code' THEN
        -- Si existe la foreign key, eliminarla temporalmente
        IF fk_constraint_exists THEN
            ALTER TABLE ditaly_pasta.agreement_detail DROP CONSTRAINT IF EXISTS fk_agreement_detail_ticket;
        END IF;
        
        -- Eliminar la constraint UNIQUE antigua
        EXECUTE format('ALTER TABLE ditaly_pasta.ticket DROP CONSTRAINT %I', uk_constraint_name);
        
        -- Recrear la constraint UNIQUE con el nombre deseado
        ALTER TABLE ditaly_pasta.ticket ADD CONSTRAINT uk_ticket_code UNIQUE (code);
        
        -- Recrear la foreign key si existía
        IF fk_constraint_exists THEN
            ALTER TABLE ditaly_pasta.agreement_detail 
            ADD CONSTRAINT fk_agreement_detail_ticket 
            FOREIGN KEY (ticket) REFERENCES ditaly_pasta.ticket(code);
        END IF;
    ELSIF uk_constraint_name IS NULL THEN
        -- Si no existe la constraint UNIQUE, crearla
        IF NOT EXISTS (
            SELECT 1 FROM pg_constraint 
            WHERE conname = 'uk_ticket_code' 
            AND conrelid = 'ditaly_pasta.ticket'::regclass
        ) THEN
            ALTER TABLE ditaly_pasta.ticket ADD CONSTRAINT uk_ticket_code UNIQUE (code);
        END IF;
    END IF;
END $$;

