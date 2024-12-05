ALTER TABLE `employment`
	CHANGE COLUMN `branchId` `branchId` VARCHAR(50) NOT NULL DEFAULT '' AFTER `jobLevelId`;

ALTER TABLE `branch`
	CHANGE COLUMN `id` `id` VARCHAR(50) NOT NULL DEFAULT '' FIRST;

	ALTER TABLE `salary_fix`
	ADD COLUMN `treatmentDate` DATE NOT NULL DEFAULT '2020-01-01' AFTER `bpjs`,
	ADD COLUMN `treatmentTime` VARCHAR(50) NOT NULL DEFAULT '' AFTER `treatmentDate`,
	ADD COLUMN `patientName` VARCHAR(250) NOT NULL DEFAULT '' AFTER `treatmentTime`;
