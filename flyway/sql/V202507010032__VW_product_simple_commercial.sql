DROP VIEW IF EXISTS VW_product_simple;

CREATE VIEW VW_product_simple AS
SELECT 
    p.sku AS sku,
    p.description AS nombre_producto,
    p.obs AS observaciones,
    p.package_unit AS unidades_por_empaque,
    p.min_package_purchase AS compra_minima_empaques,
    p.url AS url_producto,
    pr.net_amount AS precio_neto,
    pr.gross_amount AS precio_bruto,
    pv.provider AS nombre_proveedor,
    pv.contact_name AS contacto_proveedor,
    pv.contact_mail AS email_proveedor,
    pv.contact_phone AS telefono_proveedor,
    pv.website_url AS sitio_web_proveedor,
    pv.company_name AS razon_social,
    pv.company_rut AS rut_empresa,
    pv.billing_address AS direccion_facturacion,
    pv.dispatch_address AS direccion_empresa
FROM product p
LEFT JOIN price pr ON p.price = pr.code
LEFT JOIN provider pv ON p.provider = pv.id
WHERE p.is_deleted IS NULL OR p.is_deleted = 0; 