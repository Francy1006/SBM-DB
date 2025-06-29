-- Foreign Key Constraints
-- This migration adds all foreign key constraints

-- instruction_type constraints
ALTER TABLE instruction_type ADD CONSTRAINT fk_instruction_type_created_by FOREIGN KEY (created_by) REFERENCES user (code);
ALTER TABLE instruction_type ADD CONSTRAINT fk_instruction_type_confirmed_by FOREIGN KEY (confirmed_by) REFERENCES user (code);
ALTER TABLE instruction_type ADD CONSTRAINT fk_instruction_type_updated_by FOREIGN KEY (updated_by) REFERENCES user (code);
ALTER TABLE instruction_type ADD CONSTRAINT fk_instruction_type_deleted_by FOREIGN KEY (deleted_by) REFERENCES user (code);

-- permission_type constraints
ALTER TABLE permission_type ADD CONSTRAINT fk_permission_type_created_by FOREIGN KEY (created_by) REFERENCES user (code);
ALTER TABLE permission_type ADD CONSTRAINT fk_permission_type_confirmed_by FOREIGN KEY (confirmed_by) REFERENCES user (code);
ALTER TABLE permission_type ADD CONSTRAINT fk_permission_type_updated_by FOREIGN KEY (updated_by) REFERENCES user (code);
ALTER TABLE permission_type ADD CONSTRAINT fk_permission_type_deleted_by FOREIGN KEY (deleted_by) REFERENCES user (code);

-- district constraints
ALTER TABLE district ADD CONSTRAINT fk_district_region FOREIGN KEY (region) REFERENCES region (id);

-- restriction constraints
ALTER TABLE restriction ADD CONSTRAINT fk_restriction_created_by FOREIGN KEY (created_by) REFERENCES user (code);
ALTER TABLE restriction ADD CONSTRAINT fk_restriction_confirmed_by FOREIGN KEY (confirmed_by) REFERENCES user (code);
ALTER TABLE restriction ADD CONSTRAINT fk_restriction_updated_by FOREIGN KEY (updated_by) REFERENCES user (code);
ALTER TABLE restriction ADD CONSTRAINT fk_restriction_deleted_by FOREIGN KEY (deleted_by) REFERENCES user (code); 