-- Cambia todas las columnas datetime a timestamptz usando zona horaria 'America/Santiago'

-- ditay_pasta.catalog
 ALTER TABLE ditaly_pasta.catalog
ALTER COLUMN created_at
TYPE timestamptz
USING created_at AT TIME ZONE 'America/Santiago';

ALTER TABLE ditaly_pasta.catalog
ALTER COLUMN updated_at
TYPE timestamptz
USING updated_at AT TIME ZONE 'America/Santiago';

ALTER TABLE ditaly_pasta.catalog
ALTER COLUMN confirmed_at
TYPE timestamptz
USING confirmed_at AT TIME ZONE 'America/Santiago';

ALTER TABLE ditaly_pasta.catalog
ALTER COLUMN deleted_at
TYPE timestamptz
USING deleted_at AT TIME ZONE 'America/Santiago';
