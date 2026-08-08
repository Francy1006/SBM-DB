-- Crear el esquema analytics si no existe
CREATE SCHEMA IF NOT EXISTS analytics;

-- Crear vista de estadísticas de directivas fiscales por tipo
CREATE OR REPLACE VIEW analytics.fiscal_directive_stats AS
SELECT
    fd.type AS type,
    fdt.type AS type_name,
    fdt.description AS type_description,
    COUNT(*) AS total_directives,
    COUNT(CASE WHEN fd.is_confirmed = true THEN 1 END) AS confirmed_directives,
    COUNT(CASE WHEN fd.is_deleted = true THEN 1 END) AS deleted_directives,
    COUNT(CASE WHEN fd.is_confirmed IS NULL THEN 1 END) AS pending_directives,
    AVG(fd.value) AS avg_percentage,
    MIN(fd.value) AS min_percentage,
    MAX(fd.value) AS max_percentage,
    COUNT(CASE WHEN fd.year = EXTRACT(YEAR FROM CURRENT_DATE) THEN 1 END) AS current_year_directives,
    COUNT(CASE WHEN fd.month IS NOT NULL THEN 1 END) AS directives_with_month,
    COUNT(CASE WHEN fd.end_month IS NOT NULL THEN 1 END) AS directives_with_end_month,
    COUNT(CASE WHEN fd.end_year IS NOT NULL THEN 1 END) AS directives_with_end_year,
    MIN(fd.year) AS earliest_year,
    MAX(fd.year) AS latest_year,
    COUNT(DISTINCT fd.year) AS unique_years,
    COUNT(DISTINCT fd.month) AS unique_months
FROM sbm_business.fiscal_directive fd
LEFT JOIN sbm_business.fiscal_directive_type fdt ON fd.type = fdt.id
GROUP BY fd.type, fdt.type, fdt.description
ORDER BY fd.type; 