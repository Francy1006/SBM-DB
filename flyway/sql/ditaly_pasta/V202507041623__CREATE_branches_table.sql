-- BRANCHES TABLE
-- Tabla para sucursales
CREATE TABLE IF NOT EXISTS ditaly_pasta.branches (
    id SERIAL PRIMARY KEY,
    code char(36) UNIQUE NOT NULL,
    branch varchar(100) UNIQUE NOT NULL,
    tag varchar(3) UNIQUE NOT NULL,
    description text NOT NULL,
    cover_image varchar(2083),
    secondary_image varchar(2083),
    complementary_image varchar(2083),
    type char(36) NOT NULL,
    district integer NOT NULL,
    region integer NOT NULL,
    address text NOT NULL,
    maps_location varchar(255),
    phone bigint,
    mail varchar(255),
    opening_hours varchar(255),
    toteat_url varchar(2083),
    uber_eats_url varchar(2083),
    pedidos_ya_url varchar(2083),
    whatsapp_channel_url varchar(2083),
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
CREATE OR REPLACE FUNCTION ditaly_pasta.branches_before_insert()
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

DROP TRIGGER IF EXISTS branches_before_insert ON ditaly_pasta.branches;
CREATE TRIGGER branches_before_insert
    BEFORE INSERT ON ditaly_pasta.branches
    FOR EACH ROW
    EXECUTE FUNCTION ditaly_pasta.branches_before_insert();

-- FOREIGN KEY CONSTRAINTS
ALTER TABLE ditaly_pasta.branches 
ADD CONSTRAINT fk_branches_type 
FOREIGN KEY (type) REFERENCES sbm_business.branch_types(code);

ALTER TABLE ditaly_pasta.branches 
ADD CONSTRAINT fk_branches_district 
FOREIGN KEY (district) REFERENCES sbm_business.district(id);

ALTER TABLE ditaly_pasta.branches 
ADD CONSTRAINT fk_branches_region 
FOREIGN KEY (region) REFERENCES sbm_business.region(id);

ALTER TABLE ditaly_pasta.branches 
ADD CONSTRAINT fk_branches_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.branches 
ADD CONSTRAINT fk_branches_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.branches 
ADD CONSTRAINT fk_branches_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.branches 
ADD CONSTRAINT fk_branches_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);

-- INSERT BRANCHES DATA
-- Agregar datos iniciales de branches

INSERT INTO ditaly_pasta.branches (id, code, branch, description, cover_image, secondary_image, complementary_image, "type", district, region, address, maps_location, phone, mail, opening_hours, is_active, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by, log, "version", tag, toteat_url, uber_eats_url, pedidos_ya_url, whatsapp_channel_url)
OVERRIDING SYSTEM VALUE
VALUES(1, 'fc923cb7-3aa0-4355-a1fe-dec707d35a46', 'FRANQUICIA', 'FRANQUICIA DITALY PASTA', NULL, NULL, NULL, '40c00d02-aac7-4f49-956e-76639ee6e4fc', 2, 7, 'MARCHANT PEREIRA', NULL, NULL, 'OPERACIONES@DITALYPASTA.CL', 'L-V (HORARIO HABIL)', true, NULL, true, '2025-11-16 21:40:52.944', NULL, NULL, NULL, '5fbf2886-4ad0-11f0-8ce6-0242ac120002', '5fbf2886-4ad0-11f0-8ce6-0242ac120002', NULL, NULL, 'init;', 1, 'FRQ', NULL, NULL, NULL, NULL);

INSERT INTO ditaly_pasta.branches (id, code, branch, description, cover_image, secondary_image, complementary_image, "type", district, region, address, maps_location, phone, mail, opening_hours, is_active, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by, log, "version", tag, toteat_url, uber_eats_url, pedidos_ya_url, whatsapp_channel_url)
OVERRIDING SYSTEM VALUE
VALUES(2, '06cb116e-fdf1-4098-9726-e3f855635d09', 'ESPACIO M', 'Local modular dentro de Mall Espacio M, perfecto para disfrutar pastas frescas en un formato rápido y conveniente.', NULL, NULL, NULL, '88136c3a-0896-42ce-bd28-35995760d911', 1, 7, 'COMPAÑIA DE JESUS 1214, LOCAL M-1, PISO 1, SANTIAGO CENTRO', '{"lat": -33.439035229007274, "lng": -70.65416367262239}'::jsonb, NULL, 'ANDRES.SEPULVEDA@DITALYPASTA.CL', 'L-V (HORARIO HABIL)', true, NULL, true, '2025-11-16 21:40:52.944', NULL, NULL, NULL, '5fbf2886-4ad0-11f0-8ce6-0242ac120002', '5fbf2886-4ad0-11f0-8ce6-0242ac120002', NULL, NULL, 'init;', 1, 'EM', NULL, NULL, NULL, NULL);

INSERT INTO ditaly_pasta.branches (id, code, branch, description, cover_image, secondary_image, complementary_image, "type", district, region, address, maps_location, phone, mail, opening_hours, is_active, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by, log, "version", tag, toteat_url, uber_eats_url, pedidos_ya_url, whatsapp_channel_url)
OVERRIDING SYSTEM VALUE
VALUES(3, '8fffea58-4c08-446e-b9d0-eb43b4062078', 'LAS CONDES', 'Local de dos pisos, con ambiente cómodo para disfrutar nuestras pastas italianas y compartir en un espacio acogedor.', NULL, NULL, NULL, 'b0873c30-01ad-47f2-90bf-057b69ad8108', 3, 7, 'ANDRES BELLO 2895, LOCAL 40, LAS CONDES', '{"lat": -33.41225569004627, "lng": -70.60368774921002}'::jsonb, NULL, 'IBSEN.FARIAS@DITALYPASTA.CL', 'L-V (HORARIO HABIL)', true, NULL, true, '2025-11-16 21:40:52.944', NULL, NULL, NULL, '5fbf2886-4ad0-11f0-8ce6-0242ac120002', '5fbf2886-4ad0-11f0-8ce6-0242ac120002', NULL, NULL, 'init;', 1, 'LC', NULL, NULL, NULL, NULL);

-- Resetear la secuencia después de las inserciones manuales
SELECT setval('ditaly_pasta.branches_id_seq', (SELECT MAX(id) FROM ditaly_pasta.branches), true);

