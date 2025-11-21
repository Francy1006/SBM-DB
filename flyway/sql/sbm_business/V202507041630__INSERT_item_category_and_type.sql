-- INSERT ADDITIONAL ITEM CATEGORY AND ITEM TYPE
-- Este archivo ya no es necesario ya que los datos se insertaron en V202506151819__DEFAULT_complementary.sql
-- Se mantiene el archivo para mantener el historial de migraciones pero está vacío

-- Resetear las secuencias después de las inserciones manuales
SELECT setval('sbm_business.item_category_id_seq', (SELECT MAX(id) FROM sbm_business.item_category), true);
SELECT setval('sbm_business.item_type_id_seq', (SELECT MAX(id) FROM sbm_business.item_type), true);
SELECT setval('sbm_business.item_group_id_seq', (SELECT MAX(id) FROM sbm_business.item_group), true);

