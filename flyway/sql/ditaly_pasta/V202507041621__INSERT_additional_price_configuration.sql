-- INSERT additional price configuration data
INSERT INTO ditaly_pasta.price_configuration
(id, code, price_configuration, franchise_configuration, variable_formula, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by)
OVERRIDING SYSTEM VALUE
VALUES(2, 'ffd4f457-5fff-42c5-a36d-07be4b6ad39a', 'CATALOG_NORMAL_IVA', 'e8a80b9f-38d5-4c3d-8add-bb28a2493e26', 'ee4eabde-242b-4252-9a81-8266ad9b9336', NULL, true, '2025-07-31 18:14:44.164', NULL, NULL, NULL, '1b4ec1e3-2b23-461f-83f7-3901f77c5ddc', '1b4ec1e3-2b23-461f-83f7-3901f77c5ddc', NULL, NULL);

-- INSERT additional fiscal configuration detail data
INSERT INTO ditaly_pasta.fiscal_configuration_detail
(id, price_configuration, fiscal_directive, var)
OVERRIDING SYSTEM VALUE
VALUES(2, 'ffd4f457-5fff-42c5-a36d-07be4b6ad39a', '3dba4813-0cc6-4437-904f-ce092830820c', 'iva');

-- Resetear las secuencias después de las inserciones manuales
SELECT setval('ditaly_pasta.price_configuration_id_seq', (SELECT MAX(id) FROM ditaly_pasta.price_configuration), true);
SELECT setval('ditaly_pasta.fiscal_configuration_detail_id_seq', (SELECT MAX(id) FROM ditaly_pasta.fiscal_configuration_detail), true); 