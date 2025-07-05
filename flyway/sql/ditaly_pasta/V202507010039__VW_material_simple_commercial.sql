DROP VIEW IF EXISTS ditaly_pasta.VW_material_simple;
CREATE VIEW ditaly_pasta.VW_material_simple AS
SELECT 
    m.sku AS sku,
    m.description AS nombre_material,
    m.obs AS observaciones,
    m.package_unit AS unidades_por_empaque,
    m.min_package_purchase AS compra_minima_empaques,
    m.url AS url_material,
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
FROM ditaly_pasta.material m
LEFT JOIN ditaly_pasta.price pr ON m.price = pr.code
LEFT JOIN ditaly_pasta.provider pv ON m.provider = pv.id
WHERE m.is_deleted IS NULL OR m.is_deleted = false; 