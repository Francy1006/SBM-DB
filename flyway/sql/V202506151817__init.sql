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
    `confirmed_by` char(36),
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
    `confirmed_by` char(36),
    `updated_by` char(36),
    `deleted_by` char(36)
);

CREATE TABLE `restriction` (
    `id` char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    `restriction` varchar(50) UNIQUE NOT NULL,
    `description` text NOT NULL,
    `is_deleted` boolean,
    `is_confirmed` boolean,
    `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
    `updated_at` datetime,
    `confirmed_at` datetime,
    `deleted_at` datetime,
    `created_by` char(36) NOT NULL,
    `confirmed_by` char(36),
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
    `confirmed_by` char(36),
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
    `confirmed_by` char(36),
    `updated_by` char(36),
    `deleted_by` char(36)
);

CREATE TABLE `permission` (
    `id` char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    `permission` varchar(50) UNIQUE NOT NULL,
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
    `confirmed_by` char(36),
    `deleted_by` char(36)
);

CREATE TABLE `role` (
    `id` char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    `role` varchar(50) UNIQUE NOT NULL,
    `description` text NOT NULL,
    `is_deleted` boolean,
    `is_confirmed` boolean,
    `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
    `updated_at` datetime,
    `confirmed_at` datetime,
    `deleted_at` datetime,
    `created_by` char(36) NOT NULL,
    `confirmed_by` char(36),
    `updated_by` char(36),
    `deleted_by` char(36)
);

CREATE TABLE `instruction` (
    `id` char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    `instruction` varchar(50) NOT NULL,
    `description` text NOT NULL,
    `url_documentation` varchar(2083),
    `type` integer NOT NULL,
    `is_deleted` boolean,
    `is_confirmed` boolean,
    `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
    `updated_at` datetime,
    `confirmed_at` datetime,
    `deleted_at` datetime,
    `created_by` char(36) NOT NULL,
    `confirmed_by` char(36),
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
    `confirmed_by` char(36),
    `updated_by` char(36),
    `deleted_by` char(36)
);

CREATE TABLE `item_configuration` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `code` char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    `configuration` varchar(50) NOT NULL,
    `description` text NOT NULL,
    `package` integer NOT NULL,
    `is_deleted` boolean,
    `is_confirmed` boolean,
    `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
    `updated_at` datetime,
    `confirmed_at` datetime,
    `deleted_at` datetime,
    `created_by` char(36) NOT NULL,
    `confirmed_by` char(36),
    `updated_by` char(36),
    `deleted_by` char(36)
);

CREATE TABLE `package` (
    `id` integer PRIMARY KEY,
    `description` text NOT NULL,
    `package_type` integer NOT NULL,
    `transport_type` integer NOT NULL,
    `size` decimal(10, 2) NOT NULL DEFAULT 0,
    `weight` decimal(10, 2) NOT NULL DEFAULT 0,
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
    `confirmed_by` char(36),
    `updated_by` char(36),
    `deleted_by` char(36)
);

CREATE TABLE `item_configuration_detail` (
    `id` integer PRIMARY KEY AUTO_INCREMENT,
    `code` char(36) NOT NULL,
    `detail` varchar(50) NOT NULL,
    `type` integer NOT NULL,
    `configuration` char(36) NOT NULL,
    `id_item` char(36) NOT NULL,
    `is_deleted` boolean,
    `is_confirmed` boolean,
    `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
    `updated_at` datetime,
    `confirmed_at` datetime,
    `deleted_at` datetime,
    `created_by` char(36) NOT NULL,
    `confirmed_by` char(36),
    `updated_by` char(36),
    `deleted_by` char(36)
);

CREATE TABLE `user` (
    `id` integer PRIMARY KEY AUTO_INCREMENT,
    `code` char(36) UNIQUE NOT NULL COMMENT 'UUID() REQUIRES TRIGGER',
    `type` integer NOT NULL,
    `google_id` varchar(255) UNIQUE NOT NULL,
    `email` varchar(255) UNIQUE NOT NULL,
    `name` varchar(255) NOT NULL,
    `last_name` varchar(255) NOT NULL,
    `is_active` boolean,
    `is_deleted` boolean,
    `is_confirmed` boolean,
    `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
    `updated_at` datetime,
    `confirmed_at` datetime,
    `deleted_at` datetime,
    `deleted_by` char(36)
);

CREATE TABLE `user_token` (
    `id` char(36) PRIMARY KEY COMMENT 'UUID() REQUIRES TRIGGER',
    `user_id` char(36) NOT NULL,
    `token` text NOT NULL,
    `ip_address` varchar(45) NOT NULL,
    `user_agent` text,
    `created_at` datetime DEFAULT (CURRENT_TIMESTAMP),
    `expires_at` datetime,
    `revoked_at` datetime
);

CREATE TABLE `user_type` (
    `id` integer PRIMARY KEY AUTO_INCREMENT,
    `type` varchar(50) NOT NULL,
    `description` text NOT NULL,
    `created_at` datetime DEFAULT (CURRENT_TIMESTAMP)
);

ALTER TABLE
    `instruction_type`
ADD
    CONSTRAINT `fk_instruction_type_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `instruction_type`
ADD
    CONSTRAINT `fk_instruction_type_confirmed_by` FOREIGN KEY (`confirmed_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `instruction_type`
ADD
    CONSTRAINT `fk_instruction_type_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `instruction_type`
ADD
    CONSTRAINT `fk_instruction_type_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `permission_type`
ADD
    CONSTRAINT `fk_permission_type_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `permission_type`
ADD
    CONSTRAINT `fk_permission_type_confirmed_by` FOREIGN KEY (`confirmed_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `permission_type`
ADD
    CONSTRAINT `fk_permission_type_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `permission_type`
ADD
    CONSTRAINT `fk_permission_type_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `restriction`
ADD
    CONSTRAINT `fk_restriction_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `restriction`
ADD
    CONSTRAINT `fk_restriction_confirmed_by` FOREIGN KEY (`confirmed_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `restriction`
ADD
    CONSTRAINT `fk_restriction_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `restriction`
ADD
    CONSTRAINT `fk_restriction_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `restriction_roles`
ADD
    CONSTRAINT `fk_restriction_roles_restriction` FOREIGN KEY (`restriction`) REFERENCES `restriction` (`id`);

ALTER TABLE
    `restriction_roles`
ADD
    CONSTRAINT `fk_restriction_roles_role` FOREIGN KEY (`role`) REFERENCES `role` (`id`);

ALTER TABLE
    `restriction_roles`
ADD
    CONSTRAINT `fk_restriction_roles_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `restriction_roles`
ADD
    CONSTRAINT `fk_restriction_roles_confirmed_by` FOREIGN KEY (`confirmed_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `restriction_roles`
ADD
    CONSTRAINT `fk_restriction_roles_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `restriction_roles`
ADD
    CONSTRAINT `fk_restriction_roles_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `role_permissions`
ADD
    CONSTRAINT `fk_role_permissions_role` FOREIGN KEY (`role`) REFERENCES `role` (`id`);

ALTER TABLE
    `role_permissions`
ADD
    CONSTRAINT `fk_role_permissions_permission` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`);

ALTER TABLE
    `role_permissions`
ADD
    CONSTRAINT `fk_role_permissions_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `role_permissions`
ADD
    CONSTRAINT `fk_role_permissions_confirmed_by` FOREIGN KEY (`confirmed_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `role_permissions`
ADD
    CONSTRAINT `fk_role_permissions_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `role_permissions`
ADD
    CONSTRAINT `fk_role_permissions_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `permission`
ADD
    CONSTRAINT `fk_permission_type` FOREIGN KEY (`type`) REFERENCES `permission_type` (`id`);

ALTER TABLE
    `permission`
ADD
    CONSTRAINT `fk_permission_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `permission`
ADD
    CONSTRAINT `fk_permission_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `permission`
ADD
    CONSTRAINT `fk_permission_confirmed_by` FOREIGN KEY (`confirmed_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `permission`
ADD
    CONSTRAINT `fk_permission_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `role`
ADD
    CONSTRAINT `fk_role_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `role`
ADD
    CONSTRAINT `fk_role_confirmed_by` FOREIGN KEY (`confirmed_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `role`
ADD
    CONSTRAINT `fk_role_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `role`
ADD
    CONSTRAINT `fk_role_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `instruction`
ADD
    CONSTRAINT `fk_instruction_type_id` FOREIGN KEY (`type`) REFERENCES `instruction_type` (`id`);

ALTER TABLE
    `instruction`
ADD
    CONSTRAINT `fk_instruction_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `instruction`
ADD
    CONSTRAINT `fk_instruction_confirmed_by` FOREIGN KEY (`confirmed_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `instruction`
ADD
    CONSTRAINT `fk_instruction_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `instruction`
ADD
    CONSTRAINT `fk_instruction_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `cataloge`
ADD
    CONSTRAINT `fk_cataloge_menu` FOREIGN KEY (`menu`) REFERENCES `menu` (`id`);

ALTER TABLE
    `cataloge`
ADD
    CONSTRAINT `fk_cataloge_group` FOREIGN KEY (`group`) REFERENCES `item_group` (`id`);

ALTER TABLE
    `cataloge`
ADD
    CONSTRAINT `fk_cataloge_category` FOREIGN KEY (`category`) REFERENCES `item_category` (`id`);

ALTER TABLE
    `cataloge`
ADD
    CONSTRAINT `fk_cataloge_type` FOREIGN KEY (`type`) REFERENCES `item_type` (`id`);

ALTER TABLE
    `cataloge`
ADD
    CONSTRAINT `fk_cataloge_restriction` FOREIGN KEY (`restriction`) REFERENCES `restriction` (`id`);

ALTER TABLE
    `cataloge`
ADD
    CONSTRAINT `fk_cataloge_usage_instructions` FOREIGN KEY (`usage_instructions`) REFERENCES `instruction` (`id`);

ALTER TABLE
    `cataloge`
ADD
    CONSTRAINT `fk_cataloge_configuration` FOREIGN KEY (`configuration`) REFERENCES `item_configuration` (`code`);

ALTER TABLE
    `cataloge`
ADD
    CONSTRAINT `fk_cataloge_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `cataloge`
ADD
    CONSTRAINT `fk_cataloge_confirmed_by` FOREIGN KEY (`confirmed_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `cataloge`
ADD
    CONSTRAINT `fk_cataloge_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `cataloge`
ADD
    CONSTRAINT `fk_cataloge_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `item_configuration`
ADD
    CONSTRAINT `fk_item_configuration_package` FOREIGN KEY (`package`) REFERENCES `package` (`id`);

ALTER TABLE
    `item_configuration`
ADD
    CONSTRAINT `fk_item_configuration_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `item_configuration`
ADD
    CONSTRAINT `fk_item_configuration_confirmed_by` FOREIGN KEY (`confirmed_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `item_configuration`
ADD
    CONSTRAINT `fk_item_configuration_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `item_configuration`
ADD
    CONSTRAINT `fk_item_configuration_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `package`
ADD
    CONSTRAINT `fk_package_type` FOREIGN KEY (`package_type`) REFERENCES `package_type` (`id`);

ALTER TABLE
    `package`
ADD
    CONSTRAINT `fk_package_transport_type` FOREIGN KEY (`transport_type`) REFERENCES `transport_type` (`id`);

ALTER TABLE
    `package`
ADD
    CONSTRAINT `fk_package_measure_unit` FOREIGN KEY (`measure_unit`) REFERENCES `measure_unit` (`id`);

ALTER TABLE
    `package`
ADD
    CONSTRAINT `fk_package_storage_instructions` FOREIGN KEY (`storage_instructions`) REFERENCES `instruction` (`id`);

ALTER TABLE
    `package`
ADD
    CONSTRAINT `fk_package_transport_instructions` FOREIGN KEY (`transport_instructions`) REFERENCES `instruction` (`id`);

ALTER TABLE
    `package`
ADD
    CONSTRAINT `fk_package_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `package`
ADD
    CONSTRAINT `fk_package_confirmed_by` FOREIGN KEY (`confirmed_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `package`
ADD
    CONSTRAINT `fk_package_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `package`
ADD
    CONSTRAINT `fk_package_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `item_configuration_detail`
ADD
    CONSTRAINT `fk_item_config_detail_type` FOREIGN KEY (`type`) REFERENCES `item_type` (`id`);

ALTER TABLE
    `item_configuration_detail`
ADD
    CONSTRAINT `fk_item_config_detail_configuration` FOREIGN KEY (`configuration`) REFERENCES `item_configuration` (`code`);

ALTER TABLE
    `item_configuration_detail`
ADD
    CONSTRAINT `fk_item_config_detail_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `item_configuration_detail`
ADD
    CONSTRAINT `fk_item_config_detail_confirmed_by` FOREIGN KEY (`confirmed_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `item_configuration_detail`
ADD
    CONSTRAINT `fk_item_config_detail_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `item_configuration_detail`
ADD
    CONSTRAINT `fk_item_config_detail_deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `user` (`code`);

ALTER TABLE
    `user`
ADD
    CONSTRAINT `fk_user_type` FOREIGN KEY (`type`) REFERENCES `user_type` (`id`);

ALTER TABLE
    `user_token`
ADD
    CONSTRAINT `fk_user_token_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`code`);