-- ITEM FILTER CLASSIFICATION TABLE
-- Tabla para clasificaciones de filtro de items
CREATE TABLE IF NOT EXISTS sbm_business.item_filter_classification (
    id SERIAL PRIMARY KEY,
    classification varchar(50) NOT NULL,
    description text NOT NULL
);


