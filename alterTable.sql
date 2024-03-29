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


CREATE TABLE `personal_education` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`personalId` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`grade` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`institution` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`major` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`startYear` INT(4) NOT NULL DEFAULT '0',
	`endYear` INT(4) NOT NULL DEFAULT '0',
	`gpa` VARCHAR(10) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`presence` INT(1) NOT NULL DEFAULT '1',
	`inputDate` DATETIME NOT NULL DEFAULT '2024-01-01 00:00:00',
	`updateDate` DATETIME NOT NULL DEFAULT '2024-01-01 00:00:00',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf16_bin'
ENGINE=InnoDB
AUTO_INCREMENT=3
;
CREATE TABLE `personal_informal_education` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`personalId` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`name` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`heldBy` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`startYear` DATE NOT NULL DEFAULT '2020-01-01',
	`endYear` DATE NOT NULL DEFAULT '2020-01-01',
	`fee` INT(11) NOT NULL DEFAULT '0',
	`certificate` INT(1) NOT NULL DEFAULT '0',
	`presence` INT(1) NOT NULL DEFAULT '1',
	`inputDate` DATETIME NOT NULL DEFAULT '2024-01-01 00:00:00',
	`updateDate` DATETIME NOT NULL DEFAULT '2024-01-01 00:00:00',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf16_bin'
ENGINE=InnoDB
AUTO_INCREMENT=3
;

CREATE TABLE `request_holiday` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`personalId` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`shiftId` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`date` DATE NOT NULL DEFAULT '2024-01-01',
	`note` VARCHAR(250) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`approved` INT(1) NOT NULL DEFAULT '0',
	`approvedBy` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf16_bin',
	`approvedDate` DATETIME NOT NULL DEFAULT '2024-01-01 00:00:00',
	`presence` INT(1) NOT NULL DEFAULT '1',
	`inputDate` DATETIME NOT NULL DEFAULT '2023-01-01 00:00:00',
	`updateDate` DATETIME NOT NULL DEFAULT '2023-01-01 00:00:00',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf16_bin'
ENGINE=InnoDB
AUTO_INCREMENT=8952
;


ALTER TABLE `personal`
	ADD COLUMN `note` TEXT NULL AFTER `status`;

ALTER TABLE `time_management`
	ADD COLUMN `requestHolidayId` INT(11) NOT NULL DEFAULT '0' AFTER `id`;


ALTER TABLE `salary_time`
	ADD COLUMN `pinaltyFee` DOUBLE NOT NULL DEFAULT '0' AFTER `amount`,
	ADD COLUMN `overtimeFee` DOUBLE NOT NULL DEFAULT '0' AFTER `pinaltyFee`;

ALTER TABLE `employment`
	ADD COLUMN `totalHoliday` INT(3) NOT NULL DEFAULT 0 AFTER `personalId`;


DELETE FROM `global_setting` WHERE `id`=12;
INSERT INTO `global_setting` (`id`, `name`, `value`) VALUES (12, 'TotalHoliday per Year', '14');


DELETE FROM `employment_status` WHERE `id`=199;
INSERT INTO `employment_status` (`id`, `name`) VALUES (199, 'Resign');

ALTER TABLE `payroll`
	ADD COLUMN `overtimeRate` DOUBLE NOT NULL DEFAULT '0' AFTER `hourlyRate`;


ALTER TABLE `salary`
	ADD COLUMN `salaryType` VARCHAR(3) NOT NULL DEFAULT '' AFTER `asLock`;
