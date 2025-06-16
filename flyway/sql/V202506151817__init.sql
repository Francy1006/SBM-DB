CREATE TABLE `menu` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `menu` varchar(50) NOT NULL,
  `description` text NOT NULL
);

CREATE TABLE `item_group` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL,
  `description` text NOT NULL
);

CREATE TABLE `item_category` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  `description` text NOT NULL
);

CREATE TABLE `item_type` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `description` text NOT NULL
);

CREATE TABLE `package_type` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `description` text NOT NULL
);

CREATE TABLE `transport_type` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `description` text NOT NULL
);

CREATE TABLE `measure_unit` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `measure_unit` varchar(50) NOT NULL,
  `description` text NOT NULL
);

CREATE TABLE `instruction_type` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `is_deleted` boolean,
  `is_confirmed` boolean,
  `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` datetime,
  `confirmed_at` datetime,
  `deleted_at` datetime,
  `created_by` char(36) NOT NULL,
  `updated_by` char(36),
  `deleted_by` char(36)
);

CREATE TABLE `permission_type` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `is_deleted` boolean,
  `is_confirmed` boolean,
  `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` datetime,
  `confirmed_at` datetime,
  `deleted_at` datetime,
  `created_by` char(36) NOT NULL,
  `updated_by` char(36),
  `deleted_by` char(36)
);

CREATE TABLE `restriction` (
  `id` char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
  `restriction` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `is_deleted` boolean,
  `is_confirmed` boolean,
  `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` datetime,
  `confirmed_at` datetime,
  `deleted_at` datetime,
  `created_by` char(36) NOT NULL,
  `updated_by` char(36),
  `deleted_by` char(36)
);

CREATE TABLE `restriction_roles` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `restriction` char(36) NOT NULL,
  `role` char(36) NOT NULL,
  `is_deleted` boolean,
  `is_confirmed` boolean,
  `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` datetime,
  `confirmed_at` datetime,
  `deleted_at` datetime,
  `created_by` char(36) NOT NULL,
  `updated_by` char(36),
  `deleted_by` char(36)
);

CREATE TABLE `role_permissions` (
  `id` char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
  `role` char(36) NOT NULL,
  `permission` char(36) NOT NULL,
  `is_deleted` boolean,
  `is_confirmed` boolean,
  `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` datetime,
  `confirmed_at` datetime,
  `deleted_at` datetime,
  `created_by` char(36) NOT NULL,
  `updated_by` char(36),
  `deleted_by` char(36)
);

CREATE TABLE `permission` (
  `id` char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
  `permission` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `type` integer NOT NULL,
  `is_deleted` boolean,
  `is_confirmed` boolean,
  `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` datetime,
  `confirmed_at` datetime,
  `deleted_at` datetime,
  `created_by` char(36) NOT NULL,
  `updated_by` char(36),
  `deleted_by` char(36)
);

CREATE TABLE `role` (
  `id` char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
  `role` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `permissions` char(36) NOT NULL,
  `is_deleted` boolean,
  `is_confirmed` boolean,
  `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` datetime,
  `confirmed_at` datetime,
  `deleted_at` datetime,
  `created_by` char(36) NOT NULL,
  `updated_by` char(36),
  `deleted_by` char(36)
);

CREATE TABLE `instruction` (
  `id` char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
  `instruction` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `url_documentation` varchar(2083),
  `type` char(36) NOT NULL,
  `is_deleted` boolean,
  `is_confirmed` boolean,
  `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` datetime,
  `confirmed_at` datetime,
  `deleted_at` datetime,
  `created_by` char(36) NOT NULL,
  `updated_by` char(36),
  `deleted_by` char(36)
);

CREATE TABLE `cataloge` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `sku` char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
  `menu` integer NOT NULL,
  `group` integer NOT NULL,
  `category` integer NOT NULL,
  `type` integer NOT NULL,
  `restriction` char(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `OBS` varchar(255),
  `usage_instructions` char(36) NOT NULL,
  `startard_gross_price` integer NOT NULL DEFAULT 0,
  `premium_gross_price` integer NOT NULL DEFAULT 0,
  `min_quantity_purchase` integer NOT NULL DEFAULT 1,
  `rations_quantity` integer NOT NULL DEFAULT 1,
  `cover_image` varchar(2083),
  `image_gallery` varchar(2083),
  `configuration` char(36) NOT NULL,
  `is_visible` boolean NOT NULL DEFAULT 1,
  `is_deleted` boolean,
  `is_confirmed` boolean,
  `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` datetime,
  `confirmed_at` datetime,
  `deleted_at` datetime,
  `created_by` char(36) NOT NULL,
  `updated_by` char(36),
  `deleted_by` char(36)
);

CREATE TABLE `item_configuration` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `code` char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
  `configuration` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `package` char(36) NOT NULL,
  `is_deleted` boolean,
  `is_confirmed` boolean,
  `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` datetime,
  `confirmed_at` datetime,
  `deleted_at` datetime,
  `created_by` char(36) NOT NULL,
  `updated_by` char(36),
  `deleted_by` char(36)
);

CREATE TABLE `package` (
  `id` integer PRIMARY KEY,
  `description` text NOT NULL,
  `package_type` integer NOT NULL,
  `transport_type` integer NOT NULL,
  `size` decimal(10,2) NOT NULL DEFAULT 0,
  `weight` decimal(10,2) NOT NULL DEFAULT 0,
  `measure_unit` integer NOT NULL,
  `quantity_unit` integer NOT NULL DEFAULT 1,
  `storage_instructions` char(36) NOT NULL,
  `transport_instructions` char(36) NOT NULL,
  `is_deleted` boolean,
  `is_confirmed` boolean,
  `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` datetime,
  `confirmed_at` datetime,
  `deleted_at` datetime,
  `created_by` char(36) NOT NULL,
  `updated_by` char(36),
  `deleted_by` char(36)
);

CREATE TABLE `item_configuration_detail` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `code` char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
  `detail` varchar(50) NOT NULL,
  `type` integer NOT NULL,
  `configuration` char(36) NOT NULL,
  `id_item` chart(36) NOT NULL,
  `is_deleted` boolean,
  `is_confirmed` boolean,
  `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
  `updated_at` datetime,
  `confirmed_at` datetime,
  `deleted_at` datetime,
  `created_by` char(36) NOT NULL,
  `updated_by` char(36),
  `deleted_by` char(36)
);

ALTER TABLE `cataloge` ADD CONSTRAINT `menu` FOREIGN KEY (`menu`) REFERENCES `menu` (`id`);

ALTER TABLE `cataloge` ADD CONSTRAINT `item_group` FOREIGN KEY (`group`) REFERENCES `item_group` (`id`);

ALTER TABLE `cataloge` ADD CONSTRAINT `item_category` FOREIGN KEY (`category`) REFERENCES `item_category` (`id`);

ALTER TABLE `cataloge` ADD CONSTRAINT `item_type` FOREIGN KEY (`type`) REFERENCES `item_type` (`id`);

ALTER TABLE `cataloge` ADD CONSTRAINT `restriction` FOREIGN KEY (`restriction`) REFERENCES `restriction` (`id`);

ALTER TABLE `cataloge` ADD CONSTRAINT `instruction` FOREIGN KEY (`usage_instructions`) REFERENCES `instruction` (`id`);

ALTER TABLE `cataloge` ADD CONSTRAINT `item_configuration` FOREIGN KEY (`configuration`) REFERENCES `item_configuration` (`code`);

ALTER TABLE `package` ADD CONSTRAINT `instruction` FOREIGN KEY (`storage_instructions`) REFERENCES `instruction` (`id`);

ALTER TABLE `package` ADD CONSTRAINT `instruction` FOREIGN KEY (`transport_instructions`) REFERENCES `instruction` (`id`);

ALTER TABLE `item_configuration` ADD CONSTRAINT `package` FOREIGN KEY (`package`) REFERENCES `package` (`id`);

ALTER TABLE `package` ADD CONSTRAINT `package_type` FOREIGN KEY (`package_type`) REFERENCES `package_type` (`id`);

ALTER TABLE `package` ADD CONSTRAINT `transport_type` FOREIGN KEY (`transport_type`) REFERENCES `transport_type` (`id`);

ALTER TABLE `package` ADD CONSTRAINT `measure_unit` FOREIGN KEY (`measure_unit`) REFERENCES `measure_unit` (`id`);

ALTER TABLE `item_configuration_detail` ADD CONSTRAINT `item_configuration` FOREIGN KEY (`configuration`) REFERENCES `item_configuration` (`id`);

ALTER TABLE `item_configuration_detail` ADD CONSTRAINT `item_type` FOREIGN KEY (`type`) REFERENCES `item_type` (`id`);

ALTER TABLE `instruction` ADD CONSTRAINT `instruction_type` FOREIGN KEY (`type`) REFERENCES `instruction_type` (`id`);

ALTER TABLE `restriction_roles` ADD CONSTRAINT `restriction` FOREIGN KEY (`restriction`) REFERENCES `restriction` (`id`);

ALTER TABLE `restriction_roles` ADD CONSTRAINT `role` FOREIGN KEY (`role`) REFERENCES `role` (`id`);

ALTER TABLE `role_permissions` ADD CONSTRAINT `permission` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`);

ALTER TABLE `role_permissions` ADD CONSTRAINT `role` FOREIGN KEY (`role`) REFERENCES `role` (`id`);

ALTER TABLE `permission` ADD CONSTRAINT `permission_type` FOREIGN KEY (`type`) REFERENCES `permission_type` (`id`);
