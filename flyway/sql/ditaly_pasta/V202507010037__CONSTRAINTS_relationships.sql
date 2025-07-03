-- CONSTRAINTS & RELATIONSHIPS (migrado desde sbm_business)
-- Relaciones de claves foráneas entre ditaly_pasta y sbm_business

-- Item Configuration -> User
ALTER TABLE ditaly_pasta.item_configuration 
ADD CONSTRAINT fk_item_configuration_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.item_configuration 
ADD CONSTRAINT fk_item_configuration_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.item_configuration 
ADD CONSTRAINT fk_item_configuration_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.item_configuration 
ADD CONSTRAINT fk_item_configuration_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);

-- Item Configuration Detail -> User
ALTER TABLE ditaly_pasta.item_configuration_detail 
ADD CONSTRAINT fk_item_configuration_detail_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.item_configuration_detail 
ADD CONSTRAINT fk_item_configuration_detail_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.item_configuration_detail 
ADD CONSTRAINT fk_item_configuration_detail_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.item_configuration_detail 
ADD CONSTRAINT fk_item_configuration_detail_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);

-- Product -> User
ALTER TABLE ditaly_pasta.product 
ADD CONSTRAINT fk_product_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.product 
ADD CONSTRAINT fk_product_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.product 
ADD CONSTRAINT fk_product_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.product 
ADD CONSTRAINT fk_product_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);

-- Material -> User
ALTER TABLE ditaly_pasta.material 
ADD CONSTRAINT fk_material_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.material 
ADD CONSTRAINT fk_material_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.material 
ADD CONSTRAINT fk_material_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.material 
ADD CONSTRAINT fk_material_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);

-- Service -> User
ALTER TABLE ditaly_pasta.service 
ADD CONSTRAINT fk_service_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.service 
ADD CONSTRAINT fk_service_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.service 
ADD CONSTRAINT fk_service_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.service 
ADD CONSTRAINT fk_service_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);

-- Provider -> User
ALTER TABLE ditaly_pasta.provider 
ADD CONSTRAINT fk_provider_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.provider 
ADD CONSTRAINT fk_provider_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.provider 
ADD CONSTRAINT fk_provider_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.provider 
ADD CONSTRAINT fk_provider_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);

-- Catalog -> User
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);

-- Price -> User
ALTER TABLE ditaly_pasta.price 
ADD CONSTRAINT fk_price_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.price 
ADD CONSTRAINT fk_price_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.price 
ADD CONSTRAINT fk_price_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.price 
ADD CONSTRAINT fk_price_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);

-- Price Fiscal Configuration -> User
ALTER TABLE ditaly_pasta.price_fiscal_configuration 
ADD CONSTRAINT fk_price_fiscal_configuration_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.price_fiscal_configuration 
ADD CONSTRAINT fk_price_fiscal_configuration_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.price_fiscal_configuration 
ADD CONSTRAINT fk_price_fiscal_configuration_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);

ALTER TABLE ditaly_pasta.price_fiscal_configuration 
ADD CONSTRAINT fk_price_fiscal_configuration_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);

-- Additional foreign key constraints for price relationships
-- Price -> Price Fiscal Configuration
ALTER TABLE ditaly_pasta.price 
ADD CONSTRAINT fk_price_fiscal_configuration 
FOREIGN KEY (price_fiscal_configuration) REFERENCES ditaly_pasta.price_fiscal_configuration(id);

-- Price Fiscal Configuration -> Fiscal Formula
ALTER TABLE ditaly_pasta.price_fiscal_configuration 
ADD CONSTRAINT fk_price_fiscal_configuration_formula 
FOREIGN KEY (fiscal_formula) REFERENCES sbm_business.fiscal_formula(id);

-- Fiscal Configuration Detail -> Price Fiscal Configuration
ALTER TABLE ditaly_pasta.fiscal_configuration_detail 
ADD CONSTRAINT fk_fiscal_configuration_detail_price_fiscal_configuration 
FOREIGN KEY (price_fiscal_configuration) REFERENCES ditaly_pasta.price_fiscal_configuration(id);

-- Fiscal Configuration Detail -> Price
ALTER TABLE ditaly_pasta.fiscal_configuration_detail 
ADD CONSTRAINT fk_fiscal_configuration_detail_price 
FOREIGN KEY (price) REFERENCES ditaly_pasta.price(code);

-- Fiscal Configuration Detail -> Fiscal Directive
ALTER TABLE ditaly_pasta.fiscal_configuration_detail 
ADD CONSTRAINT fk_fiscal_configuration_detail_fiscal_directive 
FOREIGN KEY (fiscal_directive) REFERENCES sbm_business.fiscal_directive(code); 