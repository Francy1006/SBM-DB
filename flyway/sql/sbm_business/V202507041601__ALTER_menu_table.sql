-- ALTER MENU TABLE
-- Modificación de la tabla menu existente
ALTER TABLE sbm_business.menu 
ADD COLUMN IF NOT EXISTS franchise_only boolean NOT NULL DEFAULT false;

-- Comentario para documentar el cambio
COMMENT ON COLUMN sbm_business.menu.franchise_only IS 'Indicador si el menú es específico para franquicias';

-- Actualizar registros existentes para marcar como franchise_only = true
UPDATE sbm_business.menu 
SET franchise_only = true 
WHERE id IN (3, 5, 6)


