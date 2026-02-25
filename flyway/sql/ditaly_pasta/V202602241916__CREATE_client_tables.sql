-- ==============================
-- 1️⃣ EXTENSION UUID
-- ==============================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- ==============================
-- 2️⃣ STATUS (si no existe)
-- ==============================

CREATE TABLE IF NOT EXISTS sbm_business.status (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    module VARCHAR(50),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==============================
-- 3️⃣ CLIENT
-- ==============================

CREATE TABLE ditaly_pasta.client (
    id SERIAL PRIMARY KEY,
    code CHAR(36) NOT NULL UNIQUE,

    franchise CHAR(36) NOT NULL REFERENCES sbm_business.franchise(code),

    detection_date DATE NOT NULL,
    status INTEGER NOT NULL REFERENCES sbm_business.status(id),
    platform INTEGER NOT NULL REFERENCES ditaly_pasta.platform(id),

    exact_address VARCHAR(255) NOT NULL,
    district INTEGER NOT NULL REFERENCES sbm_business.district(id),
    region INTEGER NOT NULL REFERENCES sbm_business.region(id),
    same_address_detected BOOLEAN NOT NULL DEFAULT FALSE,

    estimated_type VARCHAR(150),
    operation_schedule VARCHAR(150),
    estimated_avg_ticket DECIMAL(10,2),
    has_visible_physical_store BOOLEAN NOT NULL DEFAULT FALSE,

    company_name VARCHAR(255),
    company_rut VARCHAR(20),
    owner_name VARCHAR(255),
    owner_position VARCHAR(150),
    linkedin_url VARCHAR(255),

    direct_phone VARCHAR(50),
    direct_email VARCHAR(255),
    contacted BOOLEAN NOT NULL DEFAULT FALSE,
    contact_date DATE,
    progress TEXT,

    estimated_potential_volume DECIMAL(14,2),
    priority VARCHAR(20),
    observations TEXT,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    is_deleted BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,

    created_by CHAR(36) NOT NULL REFERENCES sbm_business.user(code),
    updated_by CHAR(36) REFERENCES sbm_business.user(code),
    deleted_by CHAR(36) REFERENCES sbm_business.user(code),

    log TEXT NOT NULL DEFAULT 'init;',
    version INTEGER NOT NULL DEFAULT 1
);

-- ==============================
-- 4️⃣ CLIENT BRAND
-- ==============================

CREATE TABLE ditaly_pasta.client_brand (
    id SERIAL PRIMARY KEY,
    code CHAR(36) NOT NULL UNIQUE,

    client CHAR(36) NOT NULL REFERENCES ditaly_pasta.client(code),
    brand_name VARCHAR(150) NOT NULL,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by CHAR(36) NOT NULL REFERENCES sbm_business.user(code),

    CONSTRAINT uq_client_brand UNIQUE (client, brand_name)
);

-- ==============================
-- 5️⃣ CLIENT UUID TRIGGER
-- ==============================

CREATE OR REPLACE FUNCTION ditaly_pasta.client_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS client_before_insert ON ditaly_pasta.client;

CREATE TRIGGER client_before_insert
BEFORE INSERT ON ditaly_pasta.client
FOR EACH ROW
EXECUTE FUNCTION ditaly_pasta.client_before_insert();

-- ==============================
-- 6️⃣ CLIENT BRAND UUID TRIGGER
-- ==============================

CREATE OR REPLACE FUNCTION ditaly_pasta.client_brand_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.code IS NULL THEN
        NEW.code := gen_random_uuid()::text;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS client_brand_before_insert ON ditaly_pasta.client_brand;

CREATE TRIGGER client_brand_before_insert
BEFORE INSERT ON ditaly_pasta.client_brand
FOR EACH ROW
EXECUTE FUNCTION ditaly_pasta.client_brand_before_insert();



INSERT INTO sbm_business.status (code,name,description,module,is_active) VALUES
('CLIENT_SIN_DATOS','Sin datos','No se conoce el dueño del negocio','clients',true),
('CLIENT_SIN_CONTACTO','Sin contacto','Datos disponibles pero aún no contactado','clients',true),
('CLIENT_CONTACTADO','Contactado','Primer contacto realizado','clients',true),
('CLIENT_INTERESADO','Interesado','Mostró interés comercial','clients',true),
('CLIENT_POSTULANTE','Postulante','En proceso formal de incorporación','clients',true),
('CLIENT_ACTIVO','Activo','Cliente activo','clients',true),
('CLIENT_RECHAZADO','Rechazado','Rechazó propuesta comercial','clients',true),
('CLIENT_DESCARTAR','Descartar','Descartado comercialmente (soft business delete)','clients',true)
ON CONFLICT (code) DO NOTHING;


INSERT INTO ditaly_pasta.platform (code,platform,description,is_active,created_by,log,version) VALUES
(NULL,'Uber Eats','Plataforma de delivery internacional',true,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'PedidosYa','Plataforma de delivery LATAM',true,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'Rappi','Plataforma de delivery y quick-commerce',true,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'Justo','Plataforma de e-commerce gastronómico',true,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'Cornershop','Marketplace supermercado / última milla',true,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'Didi Food','Plataforma de delivery Didi',true,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'Pedidos Propios','Sistema propio del restaurante',true,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'WhatsApp','Canal directo de venta',true,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'Instagram','Canal social de captación y venta',true,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1),
(NULL,'Web Propia','Sitio web propio del negocio',true,'5fbf2886-4ad0-11f0-8ce6-0242ac120002','init;',1);