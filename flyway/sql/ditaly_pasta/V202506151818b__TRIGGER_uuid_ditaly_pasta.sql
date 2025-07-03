DELIMITER $$
CREATE TRIGGER catalog_before_insert
BEFORE INSERT ON catalog
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER item_configuration_before_insert
BEFORE INSERT ON item_configuration
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER product_before_insert
BEFORE INSERT ON product
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER material_before_insert
BEFORE INSERT ON material
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER service_before_insert
BEFORE INSERT ON service
FOR EACH ROW
BEGIN
    IF NEW.code IS NULL THEN
        SET NEW.code = UUID();
    END IF;
END$$
DELIMITER ; 