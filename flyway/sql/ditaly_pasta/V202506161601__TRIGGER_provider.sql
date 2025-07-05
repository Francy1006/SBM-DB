-- TRIGGER para autogenerar el campo code en provider (PostgreSQL)
CREATE OR REPLACE FUNCTION provider_before_insert()
RETURNS TRIGGER AS $$
DECLARE
    prefix TEXT;
    count_same_type INT;
BEGIN
    IF NEW.code IS NULL OR NEW.code = '' THEN
        -- Definir prefijo según el tipo
        prefix := CASE NEW.type
            WHEN 1 THEN 'PVP'
            WHEN 2 THEN 'PVM'
            WHEN 3 THEN 'PVS'
            ELSE 'PVX'
        END;
        -- Contar cuántos proveedores existen ya con ese tipo
        SELECT COUNT(*) + 1 INTO count_same_type
        FROM ditaly_pasta.provider
        WHERE type = NEW.type;
        -- Generar el código con formato tipo: PVP-001
        NEW.code := prefix || '-' || LPAD(count_same_type::text, 3, '0');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_provider_before_insert
    BEFORE INSERT ON ditaly_pasta.provider
    FOR EACH ROW
    EXECUTE FUNCTION provider_before_insert();

-- CONSTRAINTS for ditaly_pasta schema
-- Restricciones de clave foránea que referencian a sbm_business

-- Catalog -> Menu
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_menu 
FOREIGN KEY (menu) REFERENCES sbm_business.menu(id);

-- Catalog -> Item Group
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_group 
FOREIGN KEY (item_group) REFERENCES sbm_business.item_group(id);

-- Catalog -> Item Category
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_category 
FOREIGN KEY (category) REFERENCES sbm_business.item_category(id);

-- Catalog -> Item Type
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_type 
FOREIGN KEY (type) REFERENCES sbm_business.item_type(id);

-- Catalog -> Restriction
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_restriction 
FOREIGN KEY (restriction) REFERENCES sbm_business.restriction(id);

-- Catalog -> Instruction
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_usage_instructions 
FOREIGN KEY (usage_instructions) REFERENCES sbm_business.instruction(id);

-- Item Configuration -> Package
ALTER TABLE ditaly_pasta.item_configuration 
ADD CONSTRAINT fk_item_configuration_package 
FOREIGN KEY (package) REFERENCES sbm_business.package(id);

-- Item Configuration Detail -> Item Type
ALTER TABLE ditaly_pasta.item_configuration_detail 
ADD CONSTRAINT fk_item_configuration_detail_type 
FOREIGN KEY (type) REFERENCES sbm_business.item_type(id);

-- Item Configuration Detail -> Item Configuration
ALTER TABLE ditaly_pasta.item_configuration_detail 
ADD CONSTRAINT fk_item_configuration_detail_configuration 
FOREIGN KEY (configuration) REFERENCES ditaly_pasta.item_configuration(code);

-- Catalog -> Item Configuration
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_configuration 
FOREIGN KEY (configuration) REFERENCES ditaly_pasta.item_configuration(code);

-- Product -> Provider
ALTER TABLE ditaly_pasta.product 
ADD CONSTRAINT fk_product_provider 
FOREIGN KEY (provider) REFERENCES ditaly_pasta.provider(id);

-- Product -> Item Type
ALTER TABLE ditaly_pasta.product 
ADD CONSTRAINT fk_product_type 
FOREIGN KEY (type) REFERENCES sbm_business.item_type(id);

-- Product -> Item Group
ALTER TABLE ditaly_pasta.product 
ADD CONSTRAINT fk_product_group 
FOREIGN KEY (item_group) REFERENCES sbm_business.item_group(id);

-- Product -> Item Category
ALTER TABLE ditaly_pasta.product 
ADD CONSTRAINT fk_product_category 
FOREIGN KEY (category) REFERENCES sbm_business.item_category(id);

-- Product -> Package
ALTER TABLE ditaly_pasta.product 
ADD CONSTRAINT fk_product_package 
FOREIGN KEY (package) REFERENCES sbm_business.package(id);

-- Material -> Provider
ALTER TABLE ditaly_pasta.material 
ADD CONSTRAINT fk_material_provider 
FOREIGN KEY (provider) REFERENCES ditaly_pasta.provider(id);

-- Material -> Item Type
ALTER TABLE ditaly_pasta.material 
ADD CONSTRAINT fk_material_type 
FOREIGN KEY (type) REFERENCES sbm_business.item_type(id);

-- Material -> Item Group
ALTER TABLE ditaly_pasta.material 
ADD CONSTRAINT fk_material_group 
FOREIGN KEY (item_group) REFERENCES sbm_business.item_group(id);

-- Material -> Item Category
ALTER TABLE ditaly_pasta.material 
ADD CONSTRAINT fk_material_category 
FOREIGN KEY (category) REFERENCES sbm_business.item_category(id);

-- Material -> Package
ALTER TABLE ditaly_pasta.material 
ADD CONSTRAINT fk_material_package 
FOREIGN KEY (package) REFERENCES sbm_business.package(id);

-- Service -> Provider
ALTER TABLE ditaly_pasta.service 
ADD CONSTRAINT fk_service_provider 
FOREIGN KEY (provider) REFERENCES ditaly_pasta.provider(id);

-- Service -> Item Type
ALTER TABLE ditaly_pasta.service 
ADD CONSTRAINT fk_service_type 
FOREIGN KEY (type) REFERENCES sbm_business.item_type(id);

-- Service -> Item Group
ALTER TABLE ditaly_pasta.service 
ADD CONSTRAINT fk_service_group 
FOREIGN KEY (item_group) REFERENCES sbm_business.item_group(id);

-- Service -> Item Category
ALTER TABLE ditaly_pasta.service 
ADD CONSTRAINT fk_service_category 
FOREIGN KEY (category) REFERENCES sbm_business.item_category(id);

-- Provider -> Provider Type
ALTER TABLE ditaly_pasta.provider 
ADD CONSTRAINT fk_provider_type 
FOREIGN KEY (type) REFERENCES sbm_business.provider_type(id);

-- Provider -> Bank
ALTER TABLE ditaly_pasta.provider 
ADD CONSTRAINT fk_provider_company_bank 
FOREIGN KEY (company_bank) REFERENCES sbm_business.bank(id);

-- Provider -> Bank Account Type
ALTER TABLE ditaly_pasta.provider 
ADD CONSTRAINT fk_provider_bank_account_type 
FOREIGN KEY (bank_account_type) REFERENCES sbm_business.bank_account_type(id);

-- Provider -> District
ALTER TABLE ditaly_pasta.provider 
ADD CONSTRAINT fk_provider_dispatch_district 
FOREIGN KEY (dispatch_district) REFERENCES sbm_business.district(id);

-- Provider -> Region
ALTER TABLE ditaly_pasta.provider 
ADD CONSTRAINT fk_provider_dispatch_region 
FOREIGN KEY (dispatch_region) REFERENCES sbm_business.region(id);