-- TICKET TABLE
-- Tabla para tickets
CREATE TABLE IF NOT EXISTS ditaly_pasta.ticket (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    sku varchar(50) NOT NULL,
    description text NOT NULL,
    cover_image varchar(2083),
    secondary_image varchar(2083),
    complementary_image varchar(2083),
    image_gallery varchar(2083),
    obs text NOT NULL,
    package_unit integer NOT NULL,
    min_package_purchase integer NOT NULL DEFAULT 1,
    price char(36) NOT NULL,
    type integer NOT NULL,
    item_group integer NOT NULL,
    category integer NOT NULL,
    url varchar(255),
    package integer NOT NULL,
    is_active boolean NOT NULL DEFAULT true,
    is_deleted boolean,
    is_confirmed boolean,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by char(36) NOT NULL,
    confirmed_by char(36),
    updated_by char(36),
    deleted_by char(36),
    log text NOT NULL,
    version integer NOT NULL DEFAULT 1
);

-- TRIGGER PARA UUID Y LOG
CREATE OR REPLACE FUNCTION ditaly_pasta.ticket_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid();
    END IF;
    IF NEW.log IS NULL THEN
        NEW.log := 'init;';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS ticket_before_insert ON ditaly_pasta.ticket;
CREATE TRIGGER ticket_before_insert
    BEFORE INSERT ON ditaly_pasta.ticket
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.ticket_before_insert();

-- FOREIGN KEY CONSTRAINTS
-- Ticket -> User
ALTER TABLE ditaly_pasta.ticket 
ADD CONSTRAINT fk_ticket_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.ticket 
ADD CONSTRAINT fk_ticket_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.ticket 
ADD CONSTRAINT fk_ticket_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.ticket 
ADD CONSTRAINT fk_ticket_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);

-- Ticket -> Price (comentado hasta que se inserten los datos de price)
-- ALTER TABLE ditaly_pasta.ticket 
-- ADD CONSTRAINT fk_ticket_price 
-- FOREIGN KEY (price) REFERENCES ditaly_pasta.price(code);

-- Ticket -> Item Type
ALTER TABLE ditaly_pasta.ticket 
ADD CONSTRAINT fk_ticket_type 
FOREIGN KEY (type) REFERENCES sbm_business.item_type(id);

-- Ticket -> Item Group
ALTER TABLE ditaly_pasta.ticket 
ADD CONSTRAINT fk_ticket_item_group 
FOREIGN KEY (item_group) REFERENCES sbm_business.item_group(id);

-- Ticket -> Item Category
ALTER TABLE ditaly_pasta.ticket 
ADD CONSTRAINT fk_ticket_category 
FOREIGN KEY (category) REFERENCES sbm_business.item_category(id);

-- Ticket -> Package
ALTER TABLE ditaly_pasta.ticket 
ADD CONSTRAINT fk_ticket_package 
FOREIGN KEY (package) REFERENCES sbm_business.package(id);

-- INSERT TICKET DATA
-- Los datos de ticket se insertan en una migración posterior

