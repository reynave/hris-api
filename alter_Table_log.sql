ALTER TABLE `payroll`
	CHANGE COLUMN `EmploymentTaxStatus` `EmploymentTaxStatus` VARCHAR(50) NOT NULL DEFAULT '0' AFTER `taxSalary`,
	ADD COLUMN `taxPktpAccountHolder` VARCHAR(50) NOT NULL DEFAULT '0' AFTER `EmploymentTaxStatus`;
ALTER TABLE `payroll`
	CHANGE COLUMN `JhtCost` `JhtCost` DOUBLE NOT NULL DEFAULT 0 COLLATE 'utf8mb4_general_ci' AFTER `bpsjKesehatanNo`;
ALTER TABLE `payroll`
	CHANGE COLUMN `JaminanPensiunDate` `JaminanPensiunDate` DATE NOT NULL DEFAULT '2023-01-01' AFTER `bpjsKesehatanFamily`;
