BEGIN;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS sbm_business.status (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    module VARCHAR(50),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION sbm_business.generate_uuid_code()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.code IS NULL OR NEW.code = '' THEN
    NEW.code := uuid_generate_v4()::char(36);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TABLE IF NOT EXISTS sbm_business.order_type (
  id SERIAL PRIMARY KEY,
  type VARCHAR(50) NOT NULL,
  description TEXT NOT NULL,
  category VARCHAR(20) NOT NULL
);

INSERT INTO sbm_business.order_type (type, description, category) VALUES
('COMPRA', 'Orden de compra a proveedor', 'PURCHASE'),
('COMPRA_URGENTE', 'Orden de compra urgente', 'PURCHASE'),
('VENTA', 'Orden de venta a cliente', 'SALES'),
('VENTA_MAYORISTA', 'Venta a distribuidor mayorista', 'SALES'),
('VENTA_ONLINE', 'Venta por canal digital', 'SALES'),
('TRASLADO', 'Traslado entre bodegas o sucursales', 'LOGISTICS'),
('DESPACHO', 'Despacho a cliente final', 'LOGISTICS'),
('RECEPCION', 'Recepción de mercadería', 'LOGISTICS'),
('PRODUCCION', 'Orden de producción interna', 'PRODUCTION'),
('PREPARACION', 'Preparación de pedidos', 'PRODUCTION'),
('MARKETING', 'Acción de marketing general', 'MARKETING'),
('PROMOCION_RED_SOCIAL', 'Publicación o campaña en redes sociales', 'MARKETING'),
('CAMPAÑA_PUBLICITARIA', 'Campaña pagada', 'MARKETING'),
('AJUSTE_INVENTARIO', 'Ajuste de inventario', 'ADMIN'),
('DEVOLUCION', 'Devolución de productos', 'ADMIN'),
('MERMA', 'Registro de merma', 'ADMIN'),
('FACTURACION', 'Emisión de factura', 'FINANCE'),
('PAGO_PROVEEDOR', 'Pago a proveedor', 'FINANCE'),
('COBRO_CLIENTE', 'Cobro a cliente', 'FINANCE')
ON CONFLICT DO NOTHING;

CREATE TABLE IF NOT EXISTS sbm_business."order" (
  id SERIAL PRIMARY KEY,
  code CHAR(36) NOT NULL UNIQUE,
  name VARCHAR(100) NOT NULL,
  franchise_code CHAR(36) NOT NULL,
  parent_order_id INTEGER NULL,
  order_type_id INTEGER NOT NULL,
  status_id INTEGER NOT NULL,
  description TEXT NULL,
  is_delayed BOOLEAN NOT NULL DEFAULT FALSE,
  is_partial BOOLEAN NOT NULL DEFAULT FALSE,
  is_canceled BOOLEAN NOT NULL DEFAULT FALSE,
  is_non_conforming BOOLEAN NOT NULL DEFAULT FALSE,
  requires_cold_chain BOOLEAN NOT NULL DEFAULT TRUE,
  expected_dispatch_date TIMESTAMP NULL,
  expected_delivery_date TIMESTAMP NULL,
  actual_dispatch_date TIMESTAMP NULL,
  actual_delivery_date TIMESTAMP NULL,
  delivery_route VARCHAR(50) NULL,
  delivery_window VARCHAR(50) NULL,
  delivery_comments TEXT NULL,
  total_net_amount DECIMAL(14,2) NULL,
  total_discount DECIMAL(14,2) NULL,
  total_surcharge DECIMAL(14,2) NULL,
  operation_date TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL,
  confirmed_at TIMESTAMP NULL,
  closed_at TIMESTAMP NULL,
  created_by CHAR(36) NOT NULL,
  updated_by CHAR(36) NULL,
  is_deleted BOOLEAN NOT NULL DEFAULT FALSE
);

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = 'sbm_business'
      AND table_name = 'franchise'
  ) AND NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
      AND table_name = 'order'
      AND constraint_name = 'fk_order_franchise'
  ) THEN
    ALTER TABLE sbm_business."order"
      ADD CONSTRAINT fk_order_franchise
      FOREIGN KEY (franchise_code)
      REFERENCES sbm_business.franchise(code);
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
      AND table_name = 'order'
      AND constraint_name = 'fk_order_parent'
  ) THEN
    ALTER TABLE sbm_business."order"
      ADD CONSTRAINT fk_order_parent
      FOREIGN KEY (parent_order_id)
      REFERENCES sbm_business."order"(id);
  END IF;
END $$;

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = 'sbm_business'
      AND table_name = 'order_type'
  ) AND NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
      AND table_name = 'order'
      AND constraint_name = 'fk_order_type'
  ) THEN
    ALTER TABLE sbm_business."order"
      ADD CONSTRAINT fk_order_type
      FOREIGN KEY (order_type_id)
      REFERENCES sbm_business.order_type(id);
  END IF;
END $$;

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = 'sbm_business'
      AND table_name = 'status'
  ) AND NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
      AND table_name = 'order'
      AND constraint_name = 'fk_order_status'
  ) THEN
    ALTER TABLE sbm_business."order"
      ADD CONSTRAINT fk_order_status
      FOREIGN KEY (status_id)
      REFERENCES sbm_business.status(id);
  END IF;
END $$;

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = 'sbm_business'
      AND table_name = 'user'
  ) AND NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
      AND table_name = 'order'
      AND constraint_name = 'fk_order_created_by'
  ) THEN
    ALTER TABLE sbm_business."order"
      ADD CONSTRAINT fk_order_created_by
      FOREIGN KEY (created_by)
      REFERENCES sbm_business."user"(code);
  END IF;
END $$;

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = 'sbm_business'
      AND table_name = 'user'
  ) AND NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
      AND table_name = 'order'
      AND constraint_name = 'fk_order_updated_by'
  ) THEN
    ALTER TABLE sbm_business."order"
      ADD CONSTRAINT fk_order_updated_by
      FOREIGN KEY (updated_by)
      REFERENCES sbm_business."user"(code);
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_order_code ON sbm_business."order"(code);
CREATE INDEX IF NOT EXISTS idx_order_status ON sbm_business."order"(status_id);
CREATE INDEX IF NOT EXISTS idx_order_type ON sbm_business."order"(order_type_id);
CREATE INDEX IF NOT EXISTS idx_order_franchise ON sbm_business."order"(franchise_code);

DROP TRIGGER IF EXISTS order_before_insert ON sbm_business."order";

CREATE TRIGGER order_before_insert
BEFORE INSERT ON sbm_business."order"
FOR EACH ROW
EXECUTE FUNCTION sbm_business.generate_uuid_code();

INSERT INTO sbm_business.status
(code, "name", description, "module", is_active, created_at)
VALUES
('ORDER_CREATED', 'Creada', 'Orden creada en el sistema', 'order', true, NOW()),
('ORDER_PENDING', 'Pendiente', 'Orden pendiente de gestión', 'order', true, NOW()),
('ORDER_CONFIRMED', 'Confirmada', 'Orden confirmada', 'order', true, NOW()),
('ORDER_IN_PROGRESS', 'En proceso', 'Orden en ejecución', 'order', true, NOW()),
('ORDER_PREPARING', 'Preparando', 'Preparación de productos/servicios', 'order', true, NOW()),
('ORDER_DISPATCHED', 'Despachada', 'Orden despachada', 'order', true, NOW()),
('ORDER_IN_TRANSIT', 'En tránsito', 'Orden en camino', 'order', true, NOW()),
('ORDER_DELIVERED', 'Entregada', 'Orden entregada correctamente', 'order', true, NOW()),
('ORDER_PARTIAL', 'Parcial', 'Orden parcialmente completada', 'order', true, NOW()),
('ORDER_DELAYED', 'Atrasada', 'Orden con retraso', 'order', true, NOW()),
('ORDER_CANCELED', 'Cancelada', 'Orden cancelada', 'order', true, NOW()),
('ORDER_REJECTED', 'Rechazada', 'Orden rechazada', 'order', true, NOW()),
('ORDER_NON_CONFORMING', 'No conforme', 'Orden con problemas o inconsistencias', 'order', true, NOW()),
('ORDER_CLOSED', 'Cerrada', 'Orden finalizada y cerrada', 'order', true, NOW())
ON CONFLICT DO NOTHING;

ALTER TABLE sbm_business."order"
ADD COLUMN IF NOT EXISTS client char(36);

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = 'ditaly_pasta'
      AND table_name = 'client'
  ) AND NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
      AND table_name = 'order'
      AND constraint_name = 'fk_order_client'
  ) THEN
    ALTER TABLE sbm_business."order"
      ADD CONSTRAINT fk_order_client
      FOREIGN KEY (client)
      REFERENCES ditaly_pasta.client(code);
  END IF;
END $$;

CREATE SEQUENCE IF NOT EXISTS sbm_business.order_code_seq START 1;

CREATE OR REPLACE FUNCTION sbm_business.generate_order_code()
RETURNS trigger AS $$
DECLARE
  next_num integer;
  year_text text;
BEGIN
  IF NEW.code IS NULL OR NEW.code = '' THEN
    next_num := nextval('sbm_business.order_code_seq');
    year_text := to_char(NOW(), 'YYYY');

    NEW.code :=
      'COT-' ||
      LPAD(next_num::text, 4, '0') ||
      '-' ||
      year_text;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_generate_order_code ON sbm_business."order";

CREATE TRIGGER trg_generate_order_code
BEFORE INSERT ON sbm_business."order"
FOR EACH ROW
EXECUTE FUNCTION sbm_business.generate_order_code();

COMMIT;