ALTER TABLE ditaly_pasta.price
    ALTER COLUMN base_net_amount TYPE DECIMAL(14,2)
        USING base_net_amount::DECIMAL(14,2),
    ALTER COLUMN net_amount TYPE DECIMAL(14,2)
        USING net_amount::DECIMAL(14,2),
    ALTER COLUMN gross_amount TYPE DECIMAL(14,2)
        USING gross_amount::DECIMAL(14,2),
    ALTER COLUMN iva_amount TYPE DECIMAL(14,2)
        USING iva_amount::DECIMAL(14,2),
    ALTER COLUMN aditional_tax_amount TYPE DECIMAL(14,2)
        USING aditional_tax_amount::DECIMAL(14,2),
    ALTER COLUMN retention_amount TYPE DECIMAL(14,2)
        USING retention_amount::DECIMAL(14,2);
