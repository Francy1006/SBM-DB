-- CREATE FISCAL DIRECTIVE STATISTICS VIEW
-- Vista de estadísticas de fiscal_directive agrupadas por type para consultas rápidas

-- Crear el esquema analytics si no existe
CREATE SCHEMA IF NOT EXISTS analytics;

-- Crear vista de estadísticas de directivas fiscales por tipo
CREATE OR REPLACE VIEW analytics.fiscal_directive_stats AS
SELECT 
    fd.type,
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

-- Crear vista de resumen general de directivas fiscales
CREATE OR REPLACE VIEW analytics.fiscal_directive_summary AS
SELECT 
    'TOTAL' AS category,
    COUNT(*) AS total_directives,
    COUNT(CASE WHEN is_confirmed = true THEN 1 END) AS confirmed_directives,
    COUNT(CASE WHEN is_deleted = true THEN 1 END) AS deleted_directives,
    COUNT(CASE WHEN is_confirmed IS NULL THEN 1 END) AS pending_directives,
    COUNT(DISTINCT type) AS unique_types,
    COUNT(DISTINCT year) AS unique_years,
    AVG(value) AS avg_percentage,
    MIN(value) AS min_percentage,
    MAX(value) AS max_percentage
FROM sbm_business.fiscal_directive

UNION ALL

SELECT 
    'ACTIVE' AS category,
    COUNT(*) AS total_directives,
    COUNT(CASE WHEN is_confirmed = true THEN 1 END) AS confirmed_directives,
    COUNT(CASE WHEN is_deleted = true THEN 1 END) AS deleted_directives,
    COUNT(CASE WHEN is_confirmed IS NULL THEN 1 END) AS pending_directives,
    COUNT(DISTINCT type) AS unique_types,
    COUNT(DISTINCT year) AS unique_years,
    AVG(value) AS avg_percentage,
    MIN(value) AS min_percentage,
    MAX(value) AS max_percentage
FROM sbm_business.fiscal_directive
WHERE is_deleted IS NULL OR is_deleted = false;

-- Crear vista de directivas fiscales por año
CREATE OR REPLACE VIEW analytics.fiscal_directive_by_year AS
SELECT 
    year,
    COUNT(*) AS total_directives,
    COUNT(CASE WHEN is_confirmed = true THEN 1 END) AS confirmed_directives,
    COUNT(CASE WHEN is_deleted = true THEN 1 END) AS deleted_directives,
    COUNT(CASE WHEN is_confirmed IS NULL THEN 1 END) AS pending_directives,
    COUNT(DISTINCT type) AS unique_types,
    AVG(value) AS avg_percentage,
    MIN(value) AS min_percentage,
    MAX(value) AS max_percentage
FROM sbm_business.fiscal_directive
GROUP BY year
ORDER BY year DESC;

-- Comentarios para documentar las vistas
COMMENT ON VIEW analytics.fiscal_directive_stats IS 'Estadísticas de directivas fiscales agrupadas por tipo para consultas rápidas';
COMMENT ON VIEW analytics.fiscal_directive_summary IS 'Resumen general de todas las directivas fiscales';
COMMENT ON VIEW analytics.fiscal_directive_by_year IS 'Estadísticas de directivas fiscales agrupadas por año'; 