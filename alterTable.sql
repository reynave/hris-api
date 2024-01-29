CREATE TABLE `personal_master_select` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`category` VARCHAR(50) NOT NULL,
	`presence` INT(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (`id`)
)
COLLATE='utf16_bin'
;

DELETE FROM `personal_master_select` WHERE `id`=101;
INSERT INTO `personal_master_select` (`id`, `name`, `category`, `presence`) VALUES (101, 'Single', 'maritalStatus', 1);
DELETE FROM `personal_master_select` WHERE `id`=102;
INSERT INTO `personal_master_select` (`id`, `name`, `category`, `presence`) VALUES (102, 'Divorced', 'maritalStatus', 1);
DELETE FROM `personal_master_select` WHERE `id`=103;
INSERT INTO `personal_master_select` (`id`, `name`, `category`, `presence`) VALUES (103, 'Merried', 'maritalStatus', 1);
DELETE FROM `personal_master_select` WHERE `id`=104;
INSERT INTO `personal_master_select` (`id`, `name`, `category`, `presence`) VALUES (104, 'Cohabiting', 'maritalStatus', 1);
DELETE FROM `personal_master_select` WHERE `id`=201;
INSERT INTO `personal_master_select` (`id`, `name`, `category`, `presence`) VALUES (201, 'Father', 'relationship', 1);
DELETE FROM `personal_master_select` WHERE `id`=202;
INSERT INTO `personal_master_select` (`id`, `name`, `category`, `presence`) VALUES (202, 'Mother', 'relationship', 1);
DELETE FROM `personal_master_select` WHERE `id`=206;
INSERT INTO `personal_master_select` (`id`, `name`, `category`, `presence`) VALUES (206, 'Brother', 'relationship', 1);
DELETE FROM `personal_master_select` WHERE `id`=207;
INSERT INTO `personal_master_select` (`id`, `name`, `category`, `presence`) VALUES (207, 'Sister', 'relationship', 1);
DELETE FROM `personal_master_select` WHERE `id`=208;
INSERT INTO `personal_master_select` (`id`, `name`, `category`, `presence`) VALUES (208, 'Uncle', 'relationship', 1);
DELETE FROM `personal_master_select` WHERE `id`=209;
INSERT INTO `personal_master_select` (`id`, `name`, `category`, `presence`) VALUES (209, 'Aunty', 'relationship', 1);
DELETE FROM `personal_master_select` WHERE `id`=210;
INSERT INTO `personal_master_select` (`id`, `name`, `category`, `presence`) VALUES (210, 'Wife', 'relationship', 1);
DELETE FROM `personal_master_select` WHERE `id`=211;
INSERT INTO `personal_master_select` (`id`, `name`, `category`, `presence`) VALUES (211, 'Husband', 'relationship', 1);
DELETE FROM `personal_master_select` WHERE `id`=212;
INSERT INTO `personal_master_select` (`id`, `name`, `category`, `presence`) VALUES (212, 'Child', 'relationship', 1);



CREATE TABLE `personal_family` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`personalId` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`maritalStatus` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`name` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`dateOfBirth` DATE NOT NULL DEFAULT '2000-01-01',
	`relationship` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`job` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`ktpId` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`address` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`phone` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`gender` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`asEmergencyContact` INT(1) NOT NULL DEFAULT '0',
	`presence` INT(1) NOT NULL DEFAULT '1',
	`inputDate` DATETIME NOT NULL DEFAULT '2024-01-01 00:00:00',
	`updateDate` DATETIME NOT NULL DEFAULT '2024-01-01 00:00:00',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf16_bin'
ENGINE=InnoDB
AUTO_INCREMENT=6
;
