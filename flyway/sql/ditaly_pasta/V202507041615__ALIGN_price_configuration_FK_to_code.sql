-- DROP y CREATE TABLE para alinear las FKs a price_configuration.code (char(36)) según DBML

DROP TABLE IF EXISTS ditaly_pasta.price CASCADE;
DROP TABLE IF EXISTS ditaly_pasta.fiscal_configuration_detail CASCADE;

CREATE TABLE ditaly_pasta.price (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    code char(36) NOT NULL UNIQUE,
    base_net_amount integer NOT NULL DEFAULT 0,
    net_amount integer NOT NULL DEFAULT 0,
    gross_amount integer NOT NULL DEFAULT 0,
    iva_amount integer NOT NULL DEFAULT 0,
    retention_amount integer NOT NULL DEFAULT 0,
    price_configuration char(36) NOT NULL,
    is_deleted boolean,
    is_confirmed boolean,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    created_by char(36) NOT NULL,
    CONSTRAINT fk_price_configuration FOREIGN KEY (price_configuration) REFERENCES ditaly_pasta.price_configuration(code),
    CONSTRAINT fk_price_created_by FOREIGN KEY (created_by) REFERENCES sbm_business.user(code)
);

CREATE TABLE ditaly_pasta.fiscal_configuration_detail (
    id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    price_configuration char(36) NOT NULL,
    fiscal_directive char(36) NOT NULL,
    var varchar(50) NOT NULL,
    CONSTRAINT fk_fiscal_configuration_detail_price_configuration FOREIGN KEY (price_configuration) REFERENCES ditaly_pasta.price_configuration(code),
    CONSTRAINT fk_fiscal_configuration_detail_fiscal_directive FOREIGN KEY (fiscal_directive) REFERENCES sbm_business.fiscal_directive(code)
); 