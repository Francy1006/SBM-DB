-- INSERT DEFAULT ITEM FILTER CLASSIFICATION
-- Insertar clasificación por defecto para filtros de items

INSERT INTO sbm_business.item_filter_classification (id, classification, description)
OVERRIDING SYSTEM VALUE
VALUES (1, 'DEFAULT', 'Clasificación por defecto para filtros de items');

INSERT INTO sbm_business.item_filter_classification (id, classification, description)
OVERRIDING SYSTEM VALUE
VALUES (2, 'PASTA REGULAR', 'Pasta porción regular 16 oz');

INSERT INTO sbm_business.item_filter_classification (id, classification, description)
OVERRIDING SYSTEM VALUE
VALUES (3, 'PASTA XL', 'Pasta porción doble XL 32 oz');

-- Resetear la secuencia después de la inserción manual
SELECT setval('sbm_business.item_filter_classification_id_seq', (SELECT MAX(id) FROM sbm_business.item_filter_classification), true);

