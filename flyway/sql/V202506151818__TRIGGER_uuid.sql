CREATE TRIGGER before_insert_role
BEFORE INSERT ON `role`
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL OR NEW.id = '' THEN
        SET NEW.id = UUID();
    END IF;
END;


CREATE TRIGGER before_insert_restriction
BEFORE INSERT ON `restriction`
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL OR NEW.id = '' THEN
        SET NEW.id = UUID();
    END IF;
END;


CREATE TRIGGER before_insert_role_permissions
BEFORE INSERT ON `role_permissions`
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL OR NEW.id = '' THEN
        SET NEW.id = UUID();
    END IF;
END;


CREATE TRIGGER before_insert_permission
BEFORE INSERT ON `permission`
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL OR NEW.id = '' THEN
        SET NEW.id = UUID();
    END IF;
END;




CREATE TRIGGER before_insert_instruction
BEFORE INSERT ON `instruction`
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL OR NEW.id = '' THEN
        SET NEW.id = UUID();
    END IF;
END;

CREATE TRIGGER before_insert_cataloge
BEFORE INSERT ON `cataloge`
FOR EACH ROW
BEGIN
    IF NEW.sku IS NULL OR NEW.sku = '' THEN
        SET NEW.sku = UUID();
    END IF;
END;


CREATE TRIGGER before_insert_item_configuration
BEFORE INSERT ON `item_configuration`
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL OR NEW.code = '' THEN
        SET NEW.code = UUID();
    END IF;
END;


CREATE TRIGGER before_insert_user
BEFORE INSERT ON `user`
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL OR NEW.code = '' THEN
        SET NEW.code = UUID();
    END IF;
END;


CREATE TRIGGER before_insert_user_token
BEFORE INSERT ON `user_token`
FOR EACH ROW
BEGIN
    IF NEW.id IS NULL OR NEW.id = '' THEN
        SET NEW.id = UUID();
    END IF;
END;

