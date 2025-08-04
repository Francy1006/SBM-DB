-- Vista de Productos con información del Proveedor
-- Vista simple que incluye todos los campos de product más información básica del proveedor
DROP VIEW IF EXISTS ditaly_pasta.vw_product_simple;
CREATE VIEW ditaly_pasta.vw_product_simple AS
SELECT 
    p.description AS nombre_producto,
    p.OBS AS observaciones,
    p.package_unit AS cantidad_unidades_embalaje,
    p.min_package_purchase AS compra_embalajes_minima,
    prc.gross_amount AS precio_gross
FROM ditaly_pasta.product p
LEFT JOIN ditaly_pasta.provider pr ON p.provider = pr.id
LEFT JOIN ditaly_pasta.price prc ON p.price = prc.code
WHERE p.is_deleted IS NULL OR p.is_deleted = false; 