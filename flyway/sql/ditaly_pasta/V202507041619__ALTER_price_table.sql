-- DROP y CREATE TABLE para ditaly_pasta.price según el modelo actualizado

DROP TABLE IF EXISTS ditaly_pasta.price CASCADE;
DROP TABLE IF EXISTS ditaly_pasta.price_type_record CASCADE;

CREATE TABLE ditaly_pasta.price (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  code char(36) UNIQUE NULL,
  base_net_amount integer NOT NULL DEFAULT 0,
  net_amount integer NOT NULL DEFAULT 0,
  gross_amount integer NOT NULL DEFAULT 0,
  iva_amount integer NOT NULL DEFAULT 0,
  aditional_tax_amount integer NOT NULL DEFAULT 0,
  retention_amount integer NOT NULL DEFAULT 0,
  price_configuration char(36) NOT NULL REFERENCES ditaly_pasta.price_configuration(code),
  is_current boolean NULL DEFAULT true,
  is_deleted boolean NULL,
  is_confirmed boolean NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,
  created_by char(36) NOT NULL REFERENCES sbm_business.user(code),
  record_item_code char(36)  NULL,
  price_record_type integer NULL
);

CREATE TABLE ditaly_pasta.price_type_record (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  type varchar(50) NOT NULL,
  description TEXT NOT NULL
);

