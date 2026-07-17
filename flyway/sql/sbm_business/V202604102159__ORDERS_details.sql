BEGIN;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE SEQUENCE IF NOT EXISTS sbm_business.order_code_seq START 1;

CREATE OR REPLACE FUNCTION sbm_business.generate_order_code()
RETURNS trigger AS $$
DECLARE
  next_num integer;
  year_text text;
BEGIN
  IF NEW.code IS NULL OR trim(NEW.code) = '' THEN
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

CREATE OR REPLACE FUNCTION sbm_business.fn_set_audit_log_order()
RETURNS trigger AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    NEW.created_at := COALESCE(NEW.created_at, CURRENT_TIMESTAMP);
    NEW.log := COALESCE(NEW.log, 'init;');
    NEW.version := COALESCE(NEW.version, 1);
  ELSIF TG_OP = 'UPDATE' THEN
    NEW.updated_at := CURRENT_TIMESTAMP;
    NEW.version := COALESCE(OLD.version, 1) + 1;
    NEW.log := COALESCE(OLD.log, 'init;')
      || 'update@'
      || to_char(CURRENT_TIMESTAMP, 'YYYY-MM-DD HH24:MI:SS')
      || ';';

    IF NEW.is_deleted = TRUE AND COALESCE(OLD.is_deleted, FALSE) = FALSE THEN
      NEW.deleted_at := COALESCE(NEW.deleted_at, CURRENT_TIMESTAMP);
      NEW.log := NEW.log
        || 'delete@'
        || to_char(CURRENT_TIMESTAMP, 'YYYY-MM-DD HH24:MI:SS')
        || ';';
    END IF;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TABLE IF NOT EXISTS sbm_business.fiscal_document_type (
  id SERIAL PRIMARY KEY,
  type varchar(50) NOT NULL,
  description text NOT NULL
);

CREATE TABLE IF NOT EXISTS sbm_business.fiscal_documentation (
  id SERIAL PRIMARY KEY,
  code char(36) NOT NULL UNIQUE,
  document_type integer NOT NULL,
  document_number varchar(50) NULL,
  url varchar(2083) NOT NULL,
  issued_at timestamp NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,
  created_by char(36) NOT NULL
);

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = 'sbm_business'
      AND table_name = 'fiscal_document_type'
  ) AND NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
      AND table_name = 'fiscal_documentation'
      AND constraint_name = 'fk_fiscal_documentation_type'
  ) THEN
    ALTER TABLE sbm_business.fiscal_documentation
      ADD CONSTRAINT fk_fiscal_documentation_type
      FOREIGN KEY (document_type)
      REFERENCES sbm_business.fiscal_document_type(id);
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
      AND table_name = 'fiscal_documentation'
      AND constraint_name = 'fk_fiscal_documentation_created_by'
  ) THEN
    ALTER TABLE sbm_business.fiscal_documentation
      ADD CONSTRAINT fk_fiscal_documentation_created_by
      FOREIGN KEY (created_by)
      REFERENCES sbm_business."user"(code);
  END IF;
END $$;

CREATE TABLE IF NOT EXISTS sbm_business."order" (
  id SERIAL PRIMARY KEY,
  code char(20) NOT NULL UNIQUE,
  name varchar(100) NOT NULL,
  franchise_code char(36) NOT NULL,
  client char(36) NULL,
  parent_order_id integer NULL,
  order_type_id integer NOT NULL,
  status_id integer NOT NULL,
  description text NULL,
  is_delayed boolean NOT NULL DEFAULT FALSE,
  is_partial boolean NOT NULL DEFAULT FALSE,
  is_canceled boolean NOT NULL DEFAULT FALSE,
  is_non_conforming boolean NOT NULL DEFAULT FALSE,
  requires_cold_chain boolean NOT NULL DEFAULT TRUE,
  requires_fiscal_documentation boolean NOT NULL DEFAULT FALSE,
  has_fiscal_documentation boolean NOT NULL DEFAULT FALSE,
  fiscal_documentation_error boolean NOT NULL DEFAULT FALSE,
  is_processed boolean NOT NULL DEFAULT FALSE,
  is_closed boolean NOT NULL DEFAULT FALSE,
  expected_dispatch_date timestamp NULL,
  expected_delivery_date timestamp NULL,
  dispatch_date timestamp NULL,
  delivery_date timestamp NULL,
  delivery_route varchar(50) NULL,
  delivery_window varchar(50) NULL,
  delivery_comments text NULL,
  total_net_amount numeric(14,2) NULL,
  total_discount numeric(14,2) NULL,
  total_surcharge numeric(14,2) NULL,
  processed_at timestamp NULL,
  closed_at timestamp NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NULL,
  deleted_at timestamp NULL,
  created_by char(36) NOT NULL,
  updated_by char(36) NULL,
  is_deleted boolean NOT NULL DEFAULT FALSE,
  log text NOT NULL DEFAULT 'init;',
  version integer NOT NULL DEFAULT 1
);

ALTER TABLE sbm_business."order"
  ALTER COLUMN code TYPE char(20);

ALTER TABLE sbm_business."order"
  ADD COLUMN IF NOT EXISTS client char(36),
  ADD COLUMN IF NOT EXISTS requires_fiscal_documentation boolean NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS has_fiscal_documentation boolean NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS fiscal_documentation_error boolean NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS is_processed boolean NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS is_closed boolean NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS dispatch_date timestamp NULL,
  ADD COLUMN IF NOT EXISTS delivery_date timestamp NULL,
  ADD COLUMN IF NOT EXISTS processed_at timestamp NULL,
  ADD COLUMN IF NOT EXISTS deleted_at timestamp NULL,
  ADD COLUMN IF NOT EXISTS log text NOT NULL DEFAULT 'init;',
  ADD COLUMN IF NOT EXISTS version integer NOT NULL DEFAULT 1;

ALTER TABLE sbm_business."order"
  DROP COLUMN IF EXISTS actual_dispatch_date,
  DROP COLUMN IF EXISTS actual_delivery_date,
  DROP COLUMN IF EXISTS operation_date,
  DROP COLUMN IF EXISTS confirmed_at;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'sbm_business'
      AND table_name = 'order'
      AND column_name = 'closed_at'
  ) THEN
    ALTER TABLE sbm_business."order"
      ADD COLUMN closed_at timestamp NULL;
  END IF;
END $$;

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

SELECT setval(
  'sbm_business.order_code_seq',
  COALESCE(
    (
      SELECT MAX(
        CASE
          WHEN code::text ~ '^COT-[0-9]{4,}-[0-9]{4}$'
          THEN split_part(code::text, '-', 2)::integer
          ELSE 0
        END
      )
      FROM sbm_business."order"
    ),
    0
  ) + 1,
  false
);

DROP TRIGGER IF EXISTS order_before_insert ON sbm_business."order";
DROP TRIGGER IF EXISTS trg_generate_order_code ON sbm_business."order";
DROP TRIGGER IF EXISTS trg_order_audit_log ON sbm_business."order";

CREATE TRIGGER trg_generate_order_code
BEFORE INSERT ON sbm_business."order"
FOR EACH ROW
EXECUTE FUNCTION sbm_business.generate_order_code();

CREATE TRIGGER trg_order_audit_log
BEFORE INSERT OR UPDATE ON sbm_business."order"
FOR EACH ROW
EXECUTE FUNCTION sbm_business.fn_set_audit_log_order();

CREATE INDEX IF NOT EXISTS idx_order_code
  ON sbm_business."order"(code);

CREATE INDEX IF NOT EXISTS idx_order_status
  ON sbm_business."order"(status_id);

CREATE INDEX IF NOT EXISTS idx_order_type
  ON sbm_business."order"(order_type_id);

CREATE INDEX IF NOT EXISTS idx_order_franchise
  ON sbm_business."order"(franchise_code);

CREATE INDEX IF NOT EXISTS idx_order_client
  ON sbm_business."order"(client);

CREATE INDEX IF NOT EXISTS idx_order_is_deleted
  ON sbm_business."order"(is_deleted);

CREATE INDEX IF NOT EXISTS idx_order_processed_at
  ON sbm_business."order"(processed_at);

CREATE INDEX IF NOT EXISTS idx_order_closed_at
  ON sbm_business."order"(closed_at);

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = 'sbm_business'
      AND table_name = 'order_detail'
  ) THEN
    EXECUTE 'DROP TABLE sbm_business.order_detail CASCADE';
  END IF;
END $$;

CREATE TABLE sbm_business.order_detail (
  id SERIAL PRIMARY KEY,
  order_id integer NOT NULL,
  order_type_id integer NOT NULL,
  record_type integer NOT NULL,
  id_item varchar(50) NOT NULL,
  description varchar(255) NOT NULL,
  quantity integer NOT NULL DEFAULT 1,
  percent numeric(6,4) NULL,
  net_amount numeric(14,2) NULL,
  fiscal_documentation integer NULL,
  obs text NULL,
  url_evidence varchar(2083) NULL,
  is_delayed boolean NOT NULL DEFAULT FALSE,
  is_partial boolean NOT NULL DEFAULT FALSE,
  is_canceled boolean NOT NULL DEFAULT FALSE,
  is_non_conforming boolean NOT NULL DEFAULT FALSE,
  requires_cold_chain boolean NOT NULL DEFAULT FALSE,
  requires_fiscal_documentation boolean NOT NULL DEFAULT FALSE,
  has_fiscal_documentation boolean NOT NULL DEFAULT FALSE,
  fiscal_documentation_error boolean NOT NULL DEFAULT FALSE,
  is_processed boolean NOT NULL DEFAULT FALSE,
  is_closed boolean NOT NULL DEFAULT FALSE,
  is_deleted boolean NOT NULL DEFAULT FALSE,
  expected_dispatch_date timestamp NULL,
  expected_delivery_date timestamp NULL,
  dispatch_date timestamp NULL,
  delivery_date timestamp NULL,
  processed_at timestamp NULL,
  closed_at timestamp NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NULL,
  deleted_at timestamp NULL,
  created_by char(36) NOT NULL
);

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = 'sbm_business'
      AND table_name = 'order'
  ) AND NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
      AND table_name = 'order_detail'
      AND constraint_name = 'fk_order_detail_order'
  ) THEN
    ALTER TABLE sbm_business.order_detail
      ADD CONSTRAINT fk_order_detail_order
      FOREIGN KEY (order_id)
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
      AND table_name = 'order_detail'
      AND constraint_name = 'fk_order_detail_order_type'
  ) THEN
    ALTER TABLE sbm_business.order_detail
      ADD CONSTRAINT fk_order_detail_order_type
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
      AND table_name = 'record_type'
  ) AND NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
      AND table_name = 'order_detail'
      AND constraint_name = 'fk_order_detail_record_type'
  ) THEN
    ALTER TABLE sbm_business.order_detail
      ADD CONSTRAINT fk_order_detail_record_type
      FOREIGN KEY (record_type)
      REFERENCES sbm_business.record_type(id);
  END IF;
END $$;

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = 'sbm_business'
      AND table_name = 'fiscal_documentation'
  ) AND NOT EXISTS (
    SELECT 1
    FROM information_schema.table_constraints
    WHERE constraint_schema = 'sbm_business'
      AND table_name = 'order_detail'
      AND constraint_name = 'fk_order_detail_fiscal_documentation'
  ) THEN
    ALTER TABLE sbm_business.order_detail
      ADD CONSTRAINT fk_order_detail_fiscal_documentation
      FOREIGN KEY (fiscal_documentation)
      REFERENCES sbm_business.fiscal_documentation(id);
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
      AND table_name = 'order_detail'
      AND constraint_name = 'fk_order_detail_created_by'
  ) THEN
    ALTER TABLE sbm_business.order_detail
      ADD CONSTRAINT fk_order_detail_created_by
      FOREIGN KEY (created_by)
      REFERENCES sbm_business."user"(code);
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_order_detail_order_id
  ON sbm_business.order_detail(order_id);

CREATE INDEX IF NOT EXISTS idx_order_detail_order_type_id
  ON sbm_business.order_detail(order_type_id);

CREATE INDEX IF NOT EXISTS idx_order_detail_record_type
  ON sbm_business.order_detail(record_type);

CREATE INDEX IF NOT EXISTS idx_order_detail_id_item
  ON sbm_business.order_detail(id_item);

CREATE INDEX IF NOT EXISTS idx_order_detail_fiscal_documentation
  ON sbm_business.order_detail(fiscal_documentation);

CREATE INDEX IF NOT EXISTS idx_order_detail_is_deleted
  ON sbm_business.order_detail(is_deleted);

CREATE INDEX IF NOT EXISTS idx_order_detail_processed_at
  ON sbm_business.order_detail(processed_at);

CREATE INDEX IF NOT EXISTS idx_order_detail_closed_at
  ON sbm_business.order_detail(closed_at);

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'ditaly_pasta'
      AND table_name = 'item_configuration_detail'
      AND column_name = 'id_item'
      AND data_type <> 'character varying'
  ) THEN
    ALTER TABLE ditaly_pasta.item_configuration_detail
      ALTER COLUMN id_item TYPE varchar(50);
  END IF;
END $$;

COMMIT;