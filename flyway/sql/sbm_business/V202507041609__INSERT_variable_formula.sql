-- INSERT VARIABLE FORMULA
INSERT INTO sbm_business.variable_formula
(id, code, formula, formula_template, formula_translate, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by)
VALUES(1, 'ee4eabde-242b-4252-9a81-8266ad9b9336', 'NORMAL_IVA', '|${base_net_amount}*(1+${iva})|', 'PRECIO NETO * (1 + IVA)', NULL, true, '2025-07-13 12:37:16.304', NULL, '2025-07-13 12:37:16.304', NULL, '5fbf2886-4ad0-11f0-8ce6-0242ac120002', '5fbf2886-4ad0-11f0-8ce6-0242ac120002', NULL, NULL); 