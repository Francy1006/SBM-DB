-- ADD FRANCHISE CONFIGURATION TABLES
-- Agregar tablas de configuración de franquicias

-- Crear tabla franchise_configuration_type
CREATE TABLE IF NOT EXISTS sbm_business.franchise_configuration_type (
    id SERIAL PRIMARY KEY,
    configuration_type VARCHAR(50) NOT NULL UNIQUE,
    description TEXT NOT NULL
);

-- Comentarios para documentar el cambio
COMMENT ON TABLE sbm_business.franchise_configuration_type IS 'Tipos de configuración disponibles para franquicias';
COMMENT ON COLUMN sbm_business.franchise_configuration_type.configuration_type IS 'Nombre del tipo de configuración';
COMMENT ON COLUMN sbm_business.franchise_configuration_type.description IS 'Descripción detallada del tipo de configuración';

-- Insertar tipos de configuración básicos
INSERT INTO sbm_business.franchise_configuration_type (configuration_type, description) VALUES
('MENU_CONFIG', 'Configuración de menús específicos por franquicia'),
('PRICING_CONFIG', 'Configuración de precios y descuentos por franquicia'),
('DELIVERY_CONFIG', 'Configuración de entrega y zonas de cobertura'),
('PAYMENT_CONFIG', 'Configuración de métodos de pago aceptados'),
('BRANDING_CONFIG', 'Configuración de marca y personalización visual'),
('OPERATIONS_CONFIG', 'Configuración de horarios y operaciones')
ON CONFLICT (configuration_type) DO NOTHING; 