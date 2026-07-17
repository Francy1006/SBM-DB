-- CREATE TABLE para sbm_business.record_type
CREATE TABLE sbm_business.record_type (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  type varchar(50) NOT NULL,
  description TEXT NOT NULL
);

-- Insertar datos iniciales para record_type
INSERT INTO sbm_business.record_type (id, "type", description)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'PRODUCT', 'PRODUCT ITEMS'),
(2, 'MATERIAL', 'MATERIAL ITEMS'),
(3, 'SERVICE', 'SERVICE ITEMS'),
(4, 'CATALOG', 'CATALOG ITEMS'),
(5, 'TICKET', 'TICKET ITEMS');

-- Resetear la secuencia
SELECT setval('sbm_business.record_type_id_seq', (SELECT MAX(id) FROM sbm_business.record_type), true); 