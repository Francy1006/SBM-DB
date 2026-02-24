ALTER TABLE ditaly_pasta.item_configuration_detail
ADD COLUMN IF NOT EXISTS quantity integer NOT NULL DEFAULT 1;