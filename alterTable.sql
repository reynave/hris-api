ALTER TABLE `employment_jobposition`
	CHANGE COLUMN `_masterData` `_masterData` TINYINT(3) NOT NULL DEFAULT 0 AFTER `name`,
	CHANGE COLUMN `_timeManagement` `_timeManagement` TINYINT(3) NOT NULL DEFAULT 0 AFTER `_masterData`,
	CHANGE COLUMN `_reimbursement` `_reimbursement` TINYINT(3) NOT NULL DEFAULT 0 AFTER `_timeManagement`,
	CHANGE COLUMN `_loan` `_loan` TINYINT(3) NOT NULL DEFAULT 0 AFTER `_reimbursement`,
	CHANGE COLUMN `_payroll` `_payroll` TINYINT(3) NOT NULL DEFAULT 0 AFTER `_loan`,
	CHANGE COLUMN `_maintenance` `_maintenance` TINYINT(3) NOT NULL DEFAULT 0 AFTER `_payroll`,
	ADD COLUMN `_announcement` TINYINT(3) NOT NULL DEFAULT 0 AFTER `_maintenance`,
	CHANGE COLUMN `presence` `presence` TINYINT(1) NOT NULL DEFAULT 1 AFTER `_announcement`;


CREATE TABLE `inventory` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`presence` TINYINT(3) NOT NULL DEFAULT '1',
	`inputDate` DATETIME NOT NULL DEFAULT '2024-01-01 00:00:00',
	`updateDate` DATETIME NOT NULL DEFAULT '2024-01-01 00:00:00',
	`inputBy` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`updateBy` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf16_bin'
ENGINE=InnoDB
AUTO_INCREMENT=23
;

CREATE TABLE `inventory_personal` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`personalId` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`inventoryId` INT(11) NOT NULL DEFAULT '0',
	`rent` INT(11) NOT NULL DEFAULT '0',
	`presence` TINYINT(3) NOT NULL DEFAULT '1',
	`inputDate` DATETIME NOT NULL DEFAULT '2024-01-01 00:00:00',
	`updateDate` DATETIME NOT NULL DEFAULT '2024-01-01 00:00:00',
	`inputBy` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	`updateBy` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf16_bin',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf16_bin'
ENGINE=InnoDB
AUTO_INCREMENT=23
;



ALTER TABLE `employment_jobposition`
	ADD COLUMN `_invetory` TINYINT(3) NOT NULL DEFAULT '0' AFTER `_announcement`,
	ADD COLUMN `_sp` TINYINT(3) NOT NULL DEFAULT '0' AFTER `_invetory`;


ALTER TABLE `reimbursement`
	ADD COLUMN `uploadFile` VARCHAR(250) NOT NULL DEFAULT '' AFTER `description`;
