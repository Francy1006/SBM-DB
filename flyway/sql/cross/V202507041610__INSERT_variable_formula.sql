-- INSERT VARIABLE FORMULA
INSERT INTO sbm_business.variable_formula
(id, code, formula, formula_template, formula_translate, is_deleted, is_confirmed, created_at, updated_at, confirmed_at, deleted_at, created_by, confirmed_by, updated_by, deleted_by)
VALUES(1, 'ee4eabde-242b-4252-9a81-8266ad9b9336', 'PASTA-CATEGORY-PROFIT-PERCENTAGE', '|${profit_percentage}*${net_unit_price}| ', '% UTILIDAD * PRECIO NETO UNIDAD', NULL, true, '2025-07-13 12:37:16.304', NULL, '2025-07-13 12:37:16.304', NULL, '1b4ec1e3-2b23-461f-83f7-3901f77c5ddc', '1b4ec1e3-2b23-461f-83f7-3901f77c5ddc', NULL, NULL); 