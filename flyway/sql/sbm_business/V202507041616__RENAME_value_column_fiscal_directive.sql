-- Renombrar la columna value a value en fiscal_directive (no-op, pero asegura consistencia Flyway)
ALTER TABLE sbm_business.fiscal_directive RENAME COLUMN percentage TO value; 