-- CONSTRAINTS & RELATIONSHIPS
-- Restricciones de clave foránea y relaciones entre tablas
-- NOTA: Las restricciones de clave foránea principales ya fueron creadas
-- en las migraciones anteriores. Esta migración se mantiene para
-- futuras restricciones adicionales que puedan ser necesarias.
-- Las siguientes restricciones ya existen y no se repiten:
-- - Todas las restricciones de user.code (created_by, updated_by, etc.)
-- - Restricciones de tablas de lookup (menu, item_group, etc.)
-- - Restricciones de entidades principales (product, catalog, etc.)
-- Esta migración está lista para futuras restricciones adicionales
-- que puedan ser necesarias en el desarrollo del sistema.
-- Las restricciones de clave foránea principales ya fueron creadas
-- en las migraciones anteriores. Esta migración se mantiene para
-- futuras restricciones adicionales que puedan ser necesarias.
-- Add missing foreign key constraints for user references
-- Instruction Type -> User
ALTER TABLE sbm_business.instruction_type 
ADD CONSTRAINT fk_instruction_type_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.instruction_type 
ADD CONSTRAINT fk_instruction_type_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.instruction_type 
ADD CONSTRAINT fk_instruction_type_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.instruction_type 
ADD CONSTRAINT fk_instruction_type_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);
-- Permission Type -> User
ALTER TABLE sbm_business.permission_type 
ADD CONSTRAINT fk_permission_type_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.permission_type 
ADD CONSTRAINT fk_permission_type_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.permission_type 
ADD CONSTRAINT fk_permission_type_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.permission_type 
ADD CONSTRAINT fk_permission_type_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);
-- Restriction -> User
ALTER TABLE sbm_business.restriction 
ADD CONSTRAINT fk_restriction_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.restriction 
ADD CONSTRAINT fk_restriction_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.restriction 
ADD CONSTRAINT fk_restriction_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.restriction 
ADD CONSTRAINT fk_restriction_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);
-- Restriction Roles -> User
ALTER TABLE sbm_business.restriction_roles 
ADD CONSTRAINT fk_restriction_roles_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.restriction_roles 
ADD CONSTRAINT fk_restriction_roles_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.restriction_roles 
ADD CONSTRAINT fk_restriction_roles_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.restriction_roles 
ADD CONSTRAINT fk_restriction_roles_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);
-- Role Permissions -> User
ALTER TABLE sbm_business.role_permissions 
ADD CONSTRAINT fk_role_permissions_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.role_permissions 
ADD CONSTRAINT fk_role_permissions_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.role_permissions 
ADD CONSTRAINT fk_role_permissions_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.role_permissions 
ADD CONSTRAINT fk_role_permissions_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);
-- Permission -> User
ALTER TABLE sbm_business.permission 
ADD CONSTRAINT fk_permission_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.permission 
ADD CONSTRAINT fk_permission_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.permission 
ADD CONSTRAINT fk_permission_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.permission 
ADD CONSTRAINT fk_permission_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);
-- Role -> User
ALTER TABLE sbm_business.role 
ADD CONSTRAINT fk_role_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.role 
ADD CONSTRAINT fk_role_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.role 
ADD CONSTRAINT fk_role_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.role 
ADD CONSTRAINT fk_role_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);
-- Instruction -> User
ALTER TABLE sbm_business.instruction 
ADD CONSTRAINT fk_instruction_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.instruction 
ADD CONSTRAINT fk_instruction_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.instruction 
ADD CONSTRAINT fk_instruction_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.instruction 
ADD CONSTRAINT fk_instruction_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);
-- Package -> User
ALTER TABLE sbm_business.package 
ADD CONSTRAINT fk_package_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.package 
ADD CONSTRAINT fk_package_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.package 
ADD CONSTRAINT fk_package_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.package 
ADD CONSTRAINT fk_package_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);
-- Fiscal Formula -> User
ALTER TABLE sbm_business.fiscal_formula 
ADD CONSTRAINT fk_fiscal_formula_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.fiscal_formula 
ADD CONSTRAINT fk_fiscal_formula_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.fiscal_formula 
ADD CONSTRAINT fk_fiscal_formula_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.fiscal_formula 
ADD CONSTRAINT fk_fiscal_formula_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);
-- Fiscal Directive -> User
ALTER TABLE sbm_business.fiscal_directive 
ADD CONSTRAINT fk_fiscal_directive_created_by 
FOREIGN KEY (created_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.fiscal_directive 
ADD CONSTRAINT fk_fiscal_directive_confirmed_by 
FOREIGN KEY (confirmed_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.fiscal_directive 
ADD CONSTRAINT fk_fiscal_directive_updated_by 
FOREIGN KEY (updated_by) REFERENCES sbm_business.user(code);
ALTER TABLE sbm_business.fiscal_directive 
ADD CONSTRAINT fk_fiscal_directive_deleted_by 
FOREIGN KEY (deleted_by) REFERENCES sbm_business.user(code);
-- Fiscal Directive -> Fiscal Directive Type
ALTER TABLE sbm_business.fiscal_directive 
ADD CONSTRAINT fk_fiscal_directive_type 
FOREIGN KEY (type) REFERENCES sbm_business.fiscal_directive_type(id); 