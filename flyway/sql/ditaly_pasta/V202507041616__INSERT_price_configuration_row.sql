-- Insertar registro inicial en ditaly_pasta.price_configuration
INSERT INTO ditaly_pasta.price_configuration
(code, price_configuration, franchise_configuration, variable_formula, record_type, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by)
VALUES('cd746343-baf4-4359-b2e6-9bd829631e30', 'PRODUCT_NORMAL_IVA', 'e8a80b9f-38d5-4c3d-8add-bb28a2493e26', 'ee4eabde-242b-4252-9a81-8266ad9b9336', 1, NULL, true, '2025-07-17 11:29:02.059', NULL, NULL, NULL, '1b4ec1e3-2b23-461f-83f7-3901f77c5ddc', '1b4ec1e3-2b23-461f-83f7-3901f77c5ddc', NULL, NULL); 


INSERT INTO ditaly_pasta.fiscal_configuration_detail
(price_configuration, fiscal_directive, var)
VALUES('cd746343-baf4-4359-b2e6-9bd829631e30', '3dba4813-0cc6-4437-904f-ce092830820c', 'iva');
