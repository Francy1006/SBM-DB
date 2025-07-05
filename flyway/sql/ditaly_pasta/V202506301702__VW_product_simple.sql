-- Vista de Productos con información del Proveedor
-- Vista simple que incluye todos los campos de product más información básica del proveedor
CREATE OR REPLACE VIEW ditaly_pasta.vw_product_simple AS
SELECT 
    p.description AS nombre_producto,
    p.OBS AS observaciones,
    p.package_unit AS cantidad_unidades_embalaje,
    p.min_package_purchase AS compra_embalajes_minima,
    p.gross_price AS provider_phone
FROM ditaly_pasta.product p
LEFT JOIN ditaly_pasta.provider pr ON p.provider = pr.id
WHERE p.is_deleted IS NULL OR p.is_deleted = false;
