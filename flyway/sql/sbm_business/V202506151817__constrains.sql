-- CONSTRAINTS
-- Restricciones de clave foránea principales

-- District -> Region
ALTER TABLE sbm_business.district 
ADD CONSTRAINT fk_district_region 
FOREIGN KEY (region) REFERENCES sbm_business.region(id);

-- Restriction Roles -> Restriction
ALTER TABLE sbm_business.restriction_roles 
ADD CONSTRAINT fk_restriction_roles_restriction 
FOREIGN KEY (restriction) REFERENCES sbm_business.restriction(id);

-- Restriction Roles -> Role
ALTER TABLE sbm_business.restriction_roles 
ADD CONSTRAINT fk_restriction_roles_role 
FOREIGN KEY (role) REFERENCES sbm_business.role(id);

-- Role Permissions -> Role
ALTER TABLE sbm_business.role_permissions 
ADD CONSTRAINT fk_role_permissions_role 
FOREIGN KEY (role) REFERENCES sbm_business.role(id);

-- Role Permissions -> Permission
ALTER TABLE sbm_business.role_permissions 
ADD CONSTRAINT fk_role_permissions_permission 
FOREIGN KEY (permission) REFERENCES sbm_business.permission(id);

-- Permission -> Permission Type
ALTER TABLE sbm_business.permission 
ADD CONSTRAINT fk_permission_type 
FOREIGN KEY (type) REFERENCES sbm_business.permission_type(id);

-- Instruction -> Instruction Type
ALTER TABLE sbm_business.instruction 
ADD CONSTRAINT fk_instruction_type 
FOREIGN KEY (type) REFERENCES sbm_business.instruction_type(id);

-- Catalog -> Menu
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_menu 
FOREIGN KEY (menu) REFERENCES sbm_business.menu(id);

-- Catalog -> Item Group
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_group 
FOREIGN KEY (`group`) REFERENCES sbm_business.item_group(id);

-- Catalog -> Item Category
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_category 
FOREIGN KEY (category) REFERENCES sbm_business.item_category(id);

-- Catalog -> Item Type
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_type 
FOREIGN KEY (`type`) REFERENCES sbm_business.item_type(id);

-- Catalog -> Restriction
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_restriction 
FOREIGN KEY (restriction) REFERENCES sbm_business.restriction(id);

-- Catalog -> Instruction
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_usage_instructions 
FOREIGN KEY (usage_instructions) REFERENCES sbm_business.instruction(id);

-- Catalog -> Item Configuration
ALTER TABLE ditaly_pasta.catalog 
ADD CONSTRAINT fk_catalog_configuration 
FOREIGN KEY (configuration) REFERENCES ditaly_pasta.item_configuration(code);

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

-- Package -> Package Type
ALTER TABLE sbm_business.package 
ADD CONSTRAINT fk_package_package_type 
FOREIGN KEY (package_type) REFERENCES sbm_business.package_type(id);

-- Package -> Transport Type
ALTER TABLE sbm_business.package 
ADD CONSTRAINT fk_package_transport_type 
FOREIGN KEY (transport_type) REFERENCES sbm_business.transport_type(id);

-- Package -> Measure Unit
ALTER TABLE sbm_business.package 
ADD CONSTRAINT fk_package_measure_unit 
FOREIGN KEY (measure_unit) REFERENCES sbm_business.measure_unit(id);

-- Package -> Storage Instructions
ALTER TABLE sbm_business.package 
ADD CONSTRAINT fk_package_storage_instructions 
FOREIGN KEY (storage_instructions) REFERENCES sbm_business.instruction(id);

-- Package -> Transport Instructions
ALTER TABLE sbm_business.package 
ADD CONSTRAINT fk_package_transport_instructions 
FOREIGN KEY (transport_instructions) REFERENCES sbm_business.instruction(id);

-- Product -> Provider
ALTER TABLE ditaly_pasta.product 
ADD CONSTRAINT fk_product_provider 
FOREIGN KEY (provider) REFERENCES ditaly_pasta.provider(id);

-- Product -> Item Type
ALTER TABLE ditaly_pasta.product 
ADD CONSTRAINT fk_product_type 
FOREIGN KEY (`type`) REFERENCES sbm_business.item_type(id);

-- Product -> Item Group
ALTER TABLE ditaly_pasta.product 
ADD CONSTRAINT fk_product_group 
FOREIGN KEY (`group`) REFERENCES sbm_business.item_group(id);

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
FOREIGN KEY (`type`) REFERENCES sbm_business.item_type(id);

-- Material -> Item Group
ALTER TABLE ditaly_pasta.material 
ADD CONSTRAINT fk_material_group 
FOREIGN KEY (`group`) REFERENCES sbm_business.item_group(id);

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
FOREIGN KEY (`type`) REFERENCES sbm_business.item_type(id);

-- Service -> Item Group
ALTER TABLE ditaly_pasta.service 
ADD CONSTRAINT fk_service_group 
FOREIGN KEY (`group`) REFERENCES sbm_business.item_group(id);

-- Service -> Item Category
ALTER TABLE ditaly_pasta.service 
ADD CONSTRAINT fk_service_category 
FOREIGN KEY (category) REFERENCES sbm_business.item_category(id);

-- Provider -> Provider Type
ALTER TABLE ditaly_pasta.provider 
ADD CONSTRAINT fk_provider_type 
FOREIGN KEY (`type`) REFERENCES sbm_business.provider_type(id);

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

-- User -> User Type
ALTER TABLE sbm_business.user 
ADD CONSTRAINT fk_user_type 
FOREIGN KEY (`type`) REFERENCES sbm_business.user_type(id);

-- User Token -> User
ALTER TABLE sbm_business.user_token 
ADD CONSTRAINT fk_user_token_user 
FOREIGN KEY (user_id) REFERENCES sbm_business.user(code); 