-- CONSTRAINTS for sbm_business schema only
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

-- User -> User Type
ALTER TABLE sbm_business.user 
ADD CONSTRAINT fk_user_type 
FOREIGN KEY (type) REFERENCES sbm_business.user_type(id);

-- User Token -> User
ALTER TABLE sbm_business.user_token 
ADD CONSTRAINT fk_user_token_user 
FOREIGN KEY (user_id) REFERENCES sbm_business.user(code); 