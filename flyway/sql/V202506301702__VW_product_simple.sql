-- Vista de Productos con información del Proveedor
-- Vista simple que incluye todos los campos de product más información básica del proveedor

CREATE OR REPLACE VIEW vw_product_simple AS
SELECT 
    p.*,
    pr.provider AS provider_name,
    pr.rating AS provider_rating,
    pr.contact_name AS provider_contact,
    pr.contact_mail AS provider_email,
    pr.contact_phone AS provider_phone
FROM product p
LEFT JOIN provider pr ON p.provider = pr.id
WHERE p.is_deleted IS NULL OR p.is_deleted = 0;
