-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table hris.attendance
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idx` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `dateIn` varchar(50) DEFAULT NULL,
  `timeScan` varchar(50) DEFAULT NULL,
  `checkIn` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.attendance: ~0 rows (approximately)

-- Dumping structure for table hris.attendance_log
DROP TABLE IF EXISTS `attendance_log`;
CREATE TABLE IF NOT EXISTS `attendance_log` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `fileSize` double NOT NULL,
  `fileName` varchar(250) NOT NULL,
  `note` varchar(250) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 1,
  `presence` int(1) NOT NULL DEFAULT 1,
  `inputDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.attendance_log: ~4 rows (approximately)
INSERT INTO `attendance_log` (`id`, `fileSize`, `fileName`, `note`, `status`, `presence`, `inputDate`, `updateDate`) VALUES
	(17, 58.48, '1674735843Attendance3.txt', 'Upload Success', 0, 1, '2023-01-26 13:24:04', NULL),
	(18, 58.48, '1674735880Attendance3.txt', 'Upload Success', 0, 1, '2023-01-26 13:24:40', NULL),
	(19, 58.48, '1674735990Attendance3.txt', 'Sync Success', 1, 1, '2023-01-26 13:26:30', '2023-01-26 13:26:30'),
	(20, 58.48, '1674736252Attendance3.txt', 'Sync Success', 1, 1, '2023-01-26 13:30:52', '2023-01-26 13:30:52');

-- Dumping structure for table hris.auto_number
DROP TABLE IF EXISTS `auto_number`;
CREATE TABLE IF NOT EXISTS `auto_number` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `prefix` varchar(50) NOT NULL DEFAULT '',
  `digit` int(2) NOT NULL DEFAULT 1,
  `runningNumber` int(9) NOT NULL DEFAULT 1,
  `updateDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.auto_number: ~5 rows (approximately)
INSERT INTO `auto_number` (`id`, `name`, `prefix`, `digit`, `runningNumber`, `updateDate`) VALUES
	(1, 'personal', 'P', 6, 10, '0000-00-00 00:00:00'),
	(2, 'employment', 'E', 6, 34, '0000-00-00 00:00:00'),
	(3, 'payroll', 'PYL', 6, 16, '0000-00-00 00:00:00'),
	(4, 'reimbursement', 'REM', 6, 24, '0000-00-00 00:00:00'),
	(5, 'loan', 'LN', 6, 17, '0000-00-00 00:00:00');

-- Dumping structure for table hris.bpjs_setting
DROP TABLE IF EXISTS `bpjs_setting`;
CREATE TABLE IF NOT EXISTS `bpjs_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `company` int(10) NOT NULL,
  `employee` int(10) NOT NULL,
  `presence` int(10) NOT NULL DEFAULT 1,
  `updateDate` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.bpjs_setting: ~6 rows (approximately)
INSERT INTO `bpjs_setting` (`id`, `label`, `company`, `employee`, `presence`, `updateDate`) VALUES
	(100, 'JHT (Jaminan Hari Tua)', 1, 9, 1, '2023-01-30 09:57:56'),
	(110, 'JKK (Jaminan Kecelakaan Kerja)', 2, 8, 1, '2023-01-30 09:57:56'),
	(111, 'JKM (Jaminan Kematian)', 3, 7, 1, '2023-01-30 09:57:56'),
	(112, 'JP (Jaminan Pensiun)', 5, 5, 1, '2023-01-30 09:57:56'),
	(113, 'JKP (Jaminan Kehilangan Pekerjaan)', 5, 4, 1, '2023-01-30 09:57:56'),
	(200, 'BPJS Kesehaatan', 12, 32, 1, '2023-01-30 09:57:56');

-- Dumping structure for table hris.branch
DROP TABLE IF EXISTS `branch`;
CREATE TABLE IF NOT EXISTS `branch` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `organizationId` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `presence` int(1) DEFAULT 1,
  `inputDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `inputBy` varchar(50) DEFAULT NULL,
  `updateBy` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.branch: ~11 rows (approximately)
INSERT INTO `branch` (`id`, `organizationId`, `name`, `presence`, `inputDate`, `updateDate`, `inputBy`, `updateBy`) VALUES
	(1, '1', 'Kelapa gading', 1, NULL, NULL, NULL, NULL),
	(2, '1', 'Mangga Dua', 1, NULL, NULL, NULL, NULL),
	(3, '1', 'Mall Taman Anggrek', 1, NULL, NULL, NULL, NULL),
	(4, '2', 'Kokas', 1, NULL, NULL, NULL, NULL),
	(5, '2', 'GI', 1, NULL, NULL, NULL, NULL),
	(6, '3', 'Senayan City', 1, NULL, NULL, NULL, NULL),
	(7, '881', 'Branchd 123', 0, '2023-01-17 12:13:20', '2023-01-17 12:13:20', NULL, NULL),
	(8, '885', 'ghhhh342', 0, '2023-01-17 12:26:51', '2023-01-17 12:26:51', NULL, NULL),
	(9, '1', 'hahahahahahah', 1, '2023-01-17 12:37:24', '2023-01-17 12:37:24', NULL, NULL),
	(10, '1', '11111123123', 0, '2023-01-17 12:38:12', '2023-01-17 12:38:12', NULL, NULL),
	(11, '1', '5234523452345', 0, '2023-01-17 12:38:45', '2023-01-17 12:38:45', NULL, NULL),
	(12, '1', '5234523452345', 0, '2023-01-17 12:38:52', '2023-01-17 12:38:52', NULL, NULL),
	(13, '1', '999886574576', 0, '2023-01-17 12:39:33', '2023-01-17 12:39:33', NULL, NULL),
	(14, '880', 'hahah', 1, '2023-01-25 11:31:22', '2023-01-25 11:31:22', NULL, NULL);

-- Dumping structure for table hris.employment
DROP TABLE IF EXISTS `employment`;
CREATE TABLE IF NOT EXISTS `employment` (
  `id` varchar(9) NOT NULL,
  `personalId` varchar(10) NOT NULL,
  `employmentStatusId` int(3) NOT NULL DEFAULT 0,
  `timeManagementShiftId` varchar(3) NOT NULL,
  `dateJoinStart` date NOT NULL,
  `dateJoinEnd` date NOT NULL DEFAULT '2030-01-01',
  `jobPositionId` int(3) NOT NULL,
  `jobLevelId` int(3) NOT NULL,
  `branchId` int(3) NOT NULL,
  `approvalLineId` varchar(50) NOT NULL DEFAULT '',
  `organizationId` int(3) NOT NULL,
  `presence` int(2) NOT NULL DEFAULT 1,
  `status` int(2) NOT NULL DEFAULT 1,
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `updateDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `personalId` (`personalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.employment: ~4 rows (approximately)
INSERT INTO `employment` (`id`, `personalId`, `employmentStatusId`, `timeManagementShiftId`, `dateJoinStart`, `dateJoinEnd`, `jobPositionId`, `jobLevelId`, `branchId`, `approvalLineId`, `organizationId`, `presence`, `status`, `inputDate`, `updateDate`) VALUES
	('E000031', '1', 1, '', '0000-00-00', '2030-01-01', 1, 0, 0, '', 0, 1, 1, '2023-01-25 10:50:22', '2023-01-01 00:00:00'),
	('E000032', 'P000003', 1, '', '2023-01-01', '2030-01-01', 6, 4, 4, 'P000004', 2, 1, 1, '2023-01-25 11:13:08', '2023-01-25 11:28:26'),
	('E000033', 'P000004', 2, '', '0000-00-00', '2030-01-01', 8, 4, 14, 'P000004', 880, 1, 1, '2023-01-25 11:28:32', '2023-01-25 11:31:22'),
	('E000034', 'P000010', 0, '', '0000-00-00', '2030-01-01', 0, 0, 0, '', 0, 1, 1, '2023-01-25 11:45:14', '2023-01-01 00:00:00');

-- Dumping structure for table hris.employment_joblevel
DROP TABLE IF EXISTS `employment_joblevel`;
CREATE TABLE IF NOT EXISTS `employment_joblevel` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.employment_joblevel: ~8 rows (approximately)
INSERT INTO `employment_joblevel` (`id`, `name`, `presence`) VALUES
	(4, 'CEO', 1),
	(5, 'Manager', 1),
	(6, 'Staft', 1),
	(7, '123123132', 0),
	(8, '123123', 0),
	(9, '123123', 0),
	(10, '123123', 0),
	(11, '', 0),
	(12, '', 0);

-- Dumping structure for table hris.employment_jobposition
DROP TABLE IF EXISTS `employment_jobposition`;
CREATE TABLE IF NOT EXISTS `employment_jobposition` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `_masterData` int(1) NOT NULL DEFAULT 0,
  `_timeManagement` int(1) NOT NULL DEFAULT 0,
  `_reimbursement` int(1) NOT NULL DEFAULT 0,
  `_loan` int(1) NOT NULL DEFAULT 0,
  `_payroll` int(1) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.employment_jobposition: ~8 rows (approximately)
INSERT INTO `employment_jobposition` (`id`, `name`, `_masterData`, `_timeManagement`, `_reimbursement`, `_loan`, `_payroll`, `presence`) VALUES
	(1, 'Administrator', 1, 1, 1, 1, 1, 1),
	(5, 'Manager', 1, 0, 0, 0, 0, 1),
	(6, 'Staft', 0, 1, 0, 0, 0, 1),
	(7, 'General Manager', 0, 0, 1, 0, 0, 1),
	(8, 'IT Staft', 0, 1, 0, 1, 0, 1),
	(9, 'Office Boy', 1, 0, 0, 0, 1, 1),
	(10, '', 0, 0, 0, 0, 0, 0),
	(11, 'haha', 1, 0, 0, 1, 0, 0);

-- Dumping structure for table hris.employment_status
DROP TABLE IF EXISTS `employment_status`;
CREATE TABLE IF NOT EXISTS `employment_status` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.employment_status: ~3 rows (approximately)
INSERT INTO `employment_status` (`id`, `name`) VALUES
	(1, 'Probation'),
	(2, 'Contract'),
	(3, 'Permanent');

-- Dumping structure for table hris.loan
DROP TABLE IF EXISTS `loan`;
CREATE TABLE IF NOT EXISTS `loan` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `personalId` varchar(50) NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT 0,
  `installment` int(10) NOT NULL DEFAULT 0,
  `description` varchar(250) NOT NULL DEFAULT '',
  `effectiveDate` date DEFAULT NULL,
  `presence` int(2) NOT NULL DEFAULT 1,
  `status` int(3) NOT NULL DEFAULT 1,
  `inputDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.loan: ~1 rows (approximately)
INSERT INTO `loan` (`id`, `personalId`, `amount`, `installment`, `description`, `effectiveDate`, `presence`, `status`, `inputDate`, `updateDate`) VALUES
	('LN000017', 'P000004', 100000000, 12, '', '2023-01-19', 1, 1, '2023-01-19 14:52:08', NULL);

-- Dumping structure for table hris.loan_detail
DROP TABLE IF EXISTS `loan_detail`;
CREATE TABLE IF NOT EXISTS `loan_detail` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `loanId` varchar(50) NOT NULL,
  `installment` int(3) NOT NULL DEFAULT 1,
  `paymentDate` date DEFAULT NULL,
  `paymentAmount` double NOT NULL DEFAULT 0,
  `paidDate` date DEFAULT NULL,
  `paidAmount` double NOT NULL DEFAULT 0,
  `balance` double NOT NULL DEFAULT 0,
  `status` int(3) NOT NULL DEFAULT 1,
  `presence` int(2) NOT NULL DEFAULT 1,
  `inputDate` datetime DEFAULT NULL,
  `inputBy` varchar(50) NOT NULL DEFAULT '',
  `updateDate` datetime DEFAULT NULL,
  `updateBy` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.loan_detail: ~12 rows (approximately)
INSERT INTO `loan_detail` (`id`, `loanId`, `installment`, `paymentDate`, `paymentAmount`, `paidDate`, `paidAmount`, `balance`, `status`, `presence`, `inputDate`, `inputBy`, `updateDate`, `updateBy`) VALUES
	(109, 'LN000017', 1, '2023-02-19', 8333334, NULL, 0, 8333334, 1, 1, '2023-01-19 14:52:08', '', NULL, ''),
	(110, 'LN000017', 2, '2023-03-19', 8333334, NULL, 0, 8333334, 1, 1, '2023-01-19 14:52:08', '', NULL, ''),
	(111, 'LN000017', 3, '2023-04-19', 8333334, NULL, 0, 8333334, 1, 1, '2023-01-19 14:52:08', '', NULL, ''),
	(112, 'LN000017', 4, '2023-05-19', 8333334, NULL, 0, 8333334, 1, 1, '2023-01-19 14:52:08', '', NULL, ''),
	(113, 'LN000017', 5, '2023-06-19', 8333334, NULL, 0, 8333334, 1, 1, '2023-01-19 14:52:08', '', NULL, ''),
	(114, 'LN000017', 6, '2023-07-19', 8333334, NULL, 0, 8333334, 1, 1, '2023-01-19 14:52:08', '', NULL, ''),
	(115, 'LN000017', 7, '2023-08-19', 8333334, NULL, 0, 8333334, 1, 1, '2023-01-19 14:52:08', '', NULL, ''),
	(116, 'LN000017', 8, '2023-09-19', 8333334, NULL, 0, 8333334, 1, 1, '2023-01-19 14:52:08', '', NULL, ''),
	(117, 'LN000017', 9, '2023-10-19', 8333334, NULL, 0, 8333334, 1, 1, '2023-01-19 14:52:08', '', NULL, ''),
	(118, 'LN000017', 10, '2023-11-19', 8333334, NULL, 0, 8333334, 1, 1, '2023-01-19 14:52:08', '', NULL, ''),
	(119, 'LN000017', 11, '2023-12-19', 8333334, NULL, 0, 8333334, 1, 1, '2023-01-19 14:52:08', '', NULL, ''),
	(120, 'LN000017', 12, '2024-01-19', 8333334, NULL, 0, 8333334, 1, 1, '2023-01-19 14:52:08', '', NULL, '');

-- Dumping structure for table hris.offtime
DROP TABLE IF EXISTS `offtime`;
CREATE TABLE IF NOT EXISTS `offtime` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `presence` int(1) DEFAULT 1,
  `inputDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `inputBy` varchar(50) DEFAULT NULL,
  `updateBy` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=888 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.offtime: ~2 rows (approximately)
INSERT INTO `offtime` (`id`, `name`, `presence`, `inputDate`, `updateDate`, `inputBy`, `updateBy`) VALUES
	(886, 'Cuti Stress', 1, NULL, NULL, NULL, NULL),
	(887, 'Cuti Ga Jelas', 1, NULL, NULL, NULL, NULL);

-- Dumping structure for table hris.organization
DROP TABLE IF EXISTS `organization`;
CREATE TABLE IF NOT EXISTS `organization` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `presence` int(1) DEFAULT 1,
  `inputDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `inputBy` varchar(50) DEFAULT NULL,
  `updateBy` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=886 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.organization: ~9 rows (approximately)
INSERT INTO `organization` (`id`, `name`, `presence`, `inputDate`, `updateDate`, `inputBy`, `updateBy`) VALUES
	(1, 'PT Astra TBK', 1, NULL, NULL, NULL, NULL),
	(2, 'PT Panasonic', 1, NULL, NULL, NULL, NULL),
	(3, 'PT Samsung Tbk', 1, NULL, NULL, NULL, NULL),
	(878, 'hahahah', 0, '2023-01-17 11:44:16', '2023-01-17 11:44:16', NULL, NULL),
	(879, 'sadfasdfadf', 1, '2023-01-17 11:44:57', '2023-01-17 11:44:57', NULL, NULL),
	(880, 'palanging', 1, '2023-01-17 11:49:40', '2023-01-17 11:49:40', NULL, NULL),
	(881, '1231244234', 0, '2023-01-17 11:50:05', '2023-01-17 11:50:05', NULL, NULL),
	(882, 'hrfsadf', 1, '2023-01-17 12:14:22', '2023-01-17 12:14:22', NULL, NULL),
	(883, 'gasdfasdf', 0, '2023-01-17 12:14:44', '2023-01-17 12:14:44', NULL, NULL),
	(884, 'asdfsadfasdf34345', 0, '2023-01-17 12:25:47', '2023-01-17 12:25:47', NULL, NULL),
	(885, 'gagagsdsdfgsdfggfdfgd', 0, '2023-01-17 12:26:48', '2023-01-17 12:26:48', NULL, NULL);

-- Dumping structure for table hris.payroll
DROP TABLE IF EXISTS `payroll`;
CREATE TABLE IF NOT EXISTS `payroll` (
  `id` varchar(9) NOT NULL,
  `personalId` varchar(50) NOT NULL DEFAULT '',
  `salary` double NOT NULL DEFAULT 0,
  `salaryType` varchar(2) NOT NULL DEFAULT '',
  `bankName` varchar(50) NOT NULL DEFAULT '',
  `bankAccountNumber` varchar(50) NOT NULL DEFAULT '',
  `bankAccountHolderName` varchar(50) NOT NULL DEFAULT '',
  `hourlyRate` double NOT NULL DEFAULT 0,
  `tunjangan` double NOT NULL DEFAULT 0,
  `taxNpwp` varchar(50) NOT NULL DEFAULT '',
  `taxMethod` varchar(50) NOT NULL DEFAULT '',
  `taxableDate` date NOT NULL DEFAULT '2020-01-01',
  `taxHolderName` varchar(50) NOT NULL DEFAULT '',
  `taxPtkpStatus` varchar(50) NOT NULL DEFAULT '',
  `taxSalary` double NOT NULL DEFAULT 0,
  `EmploymentTaxStatus` varchar(50) NOT NULL DEFAULT '0',
  `taxPktpAccountHolder` varchar(50) NOT NULL DEFAULT '0',
  `bpsjTkNo` varchar(50) NOT NULL DEFAULT '',
  `bpsjKesehatanNo` varchar(50) NOT NULL DEFAULT '',
  `JhtCost` double NOT NULL DEFAULT 0,
  `JaminanPensiunCost` double NOT NULL DEFAULT 0,
  `bpjsTkDate` date NOT NULL DEFAULT '2023-01-01',
  `bpjsKesehatanFamily` varchar(50) NOT NULL DEFAULT '',
  `JaminanPensiunDate` date NOT NULL DEFAULT '2023-01-01',
  `status` int(2) NOT NULL DEFAULT 1,
  `presence` int(2) NOT NULL DEFAULT 1,
  `updateDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `personalId` (`personalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.payroll: ~1 rows (approximately)
INSERT INTO `payroll` (`id`, `personalId`, `salary`, `salaryType`, `bankName`, `bankAccountNumber`, `bankAccountHolderName`, `hourlyRate`, `tunjangan`, `taxNpwp`, `taxMethod`, `taxableDate`, `taxHolderName`, `taxPtkpStatus`, `taxSalary`, `EmploymentTaxStatus`, `taxPktpAccountHolder`, `bpsjTkNo`, `bpsjKesehatanNo`, `JhtCost`, `JaminanPensiunCost`, `bpjsTkDate`, `bpjsKesehatanFamily`, `JaminanPensiunDate`, `status`, `presence`, `updateDate`, `inputDate`) VALUES
	('PYL000014', 'P000003', 0, '', '', '', '', 0, 0, '', '', '2020-01-01', '', '', 0, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-01-01 00:00:00', '2023-01-25 11:15:20'),
	('PYL000015', 'P000010', 0, '', '', '', '', 0, 0, '', '', '2020-01-01', '', '', 0, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-01-01 00:00:00', '2023-01-25 11:45:16'),
	('PYL000016', '1', 0, '', '', '', '', 0, 0, '', '', '2020-01-01', '', '', 0, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-01-01 00:00:00', '2023-01-26 08:54:28');

-- Dumping structure for table hris.personal
DROP TABLE IF EXISTS `personal`;
CREATE TABLE IF NOT EXISTS `personal` (
  `id` varchar(50) NOT NULL,
  `idx` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(250) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `birthPlace` varchar(50) NOT NULL DEFAULT '',
  `birthDate` varchar(50) NOT NULL DEFAULT '',
  `gender` varchar(2) NOT NULL DEFAULT '',
  `marital` int(2) NOT NULL DEFAULT 0,
  `blood` varchar(2) NOT NULL DEFAULT '',
  `religion` int(2) NOT NULL DEFAULT 0,
  `idType` int(2) DEFAULT 1,
  `idNumber` varchar(50) DEFAULT '',
  `expDate` date DEFAULT '2023-01-01',
  `permanent` int(1) DEFAULT 0,
  `postalCode` varchar(6) DEFAULT '',
  `address` varchar(250) DEFAULT '',
  `presence` int(2) DEFAULT 1,
  `status` int(2) DEFAULT 1,
  `inputDate` datetime DEFAULT '2023-01-01 00:00:00',
  `updateDate` datetime DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.personal: ~11 rows (approximately)
INSERT INTO `personal` (`id`, `idx`, `name`, `phone`, `email`, `password`, `birthPlace`, `birthDate`, `gender`, `marital`, `blood`, `religion`, `idType`, `idNumber`, `expDate`, `permanent`, `postalCode`, `address`, `presence`, `status`, `inputDate`, `updateDate`) VALUES
	('1', '11223344', 'admin', '007', 'hris@admin.com', '25f9e794323b453885f5181f1b624d0b', '', '', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-01-16 13:32:39', '2023-01-16 13:32:39'),
	('800', '20190001', 'asd', '', '', '', '', '', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 0, 0, '2023-01-16 13:32:58', '2023-01-16 13:32:58'),
	('P000002', '20189900', 'asd', '', '', '', '', '', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 0, 0, '2023-01-16 13:43:32', '2023-01-16 13:43:32'),
	('P000003', '20050082', 'maria', '234234324', 'admin@abac.org', '25d55ad283aa400af464c76d713c07ad', 'gagagagagag', '1990-1-27', 'M', 4, 'A', 3, 2, '88854454520000454', '2023-03-17', 1, '535345', '245234523 2 43 2345 2345', 1, 1, '2023-01-27 15:17:53', '2023-01-27 15:17:53'),
	('P000004', '20120542', 'AkanShari', '', '', '', '', '1990-1-19', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-01-16 13:14:47', '2023-01-16 13:14:47'),
	('P000005', '20130588', 'Sayako', '1234234', 'admin@admin.com', '', '', '1990-1-1', 'M', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-01-17 10:41:04', '2023-01-17 10:41:04'),
	('P000006', '20130607', 'Kitaro', '43234234', 'rey_nave@yahoo.com', '', '', '1990-1-1', 'M', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-01-16 13:17:41', '2023-01-16 13:17:41'),
	('P000007', '20140622', 'Olive alson', '999976666', 'alson@email.com', '', '', '1981-1-2', 'M', 0, '', 0, 1, '', '2023-01-01', 0, '', '', 1, 1, '2023-01-18 10:06:42', '2023-01-18 10:06:42'),
	('P000008', '', 'Melanisa', '78988565555', 'admi223n@jasa.com', '', '', '1990-1-1', 'M', 0, '', 0, 1, '', '2023-01-01', 0, '', '', 1, 1, '2023-01-24 10:10:18', '2023-01-24 10:10:18'),
	('P000009', '', 'Leonhard', '77774434', 'Leonhard@email.com', '', '', '1990-1-19', 'M', 0, '', 0, 1, '', '2023-01-01', 0, '', '', 1, 1, '2023-01-25 10:01:18', '2023-01-25 10:01:18'),
	('P000010', '', 'talita', '009944333333', 'talita@uaoo.com', '', '', '1981-1-2', 'F', 2, '', 0, 1, '', '2023-01-01', 0, '', '', 1, 1, '2023-01-25 11:45:02', '2023-01-25 11:45:02');

-- Dumping structure for table hris.personal_access
DROP TABLE IF EXISTS `personal_access`;
CREATE TABLE IF NOT EXISTS `personal_access` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `personalId` varchar(50) NOT NULL DEFAULT '',
  `token` varchar(50) NOT NULL DEFAULT '',
  `agent` varchar(250) NOT NULL DEFAULT '',
  `client_ip` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(2) NOT NULL DEFAULT '1',
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.personal_access: ~7 rows (approximately)
INSERT INTO `personal_access` (`id`, `personalId`, `token`, `agent`, `client_ip`, `status`, `inputDate`) VALUES
	(1, '1', '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(2, '1', '4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(3, '1', 'c', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(4, '1', 'g', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(6, '1', 'e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(7, '1', '3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(8, '1', 'TT-f65337aef142c307a7fab7f9421dcee0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00');

-- Dumping structure for table hris.personal_id
DROP TABLE IF EXISTS `personal_id`;
CREATE TABLE IF NOT EXISTS `personal_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `other` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.personal_id: ~3 rows (approximately)
INSERT INTO `personal_id` (`id`, `name`, `other`) VALUES
	(1, 'KTP', 0),
	(2, 'Passport', 0),
	(3, 'Other', 0);

-- Dumping structure for table hris.personal_load
DROP TABLE IF EXISTS `personal_load`;
CREATE TABLE IF NOT EXISTS `personal_load` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `loadId` int(9) NOT NULL DEFAULT 0,
  `personalId` varchar(9) NOT NULL DEFAULT '',
  `loadAmount` double NOT NULL DEFAULT 0,
  `installment` int(3) NOT NULL DEFAULT 0,
  `interest` int(3) NOT NULL DEFAULT 0,
  `effectiveDate` date NOT NULL DEFAULT '2023-01-01',
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `updateDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.personal_load: ~0 rows (approximately)

-- Dumping structure for table hris.personal_marital
DROP TABLE IF EXISTS `personal_marital`;
CREATE TABLE IF NOT EXISTS `personal_marital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `other` int(1) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.personal_marital: ~3 rows (approximately)
INSERT INTO `personal_marital` (`id`, `name`, `other`, `presence`) VALUES
	(1, 'Single', 0, 1),
	(2, 'married', 0, 1),
	(3, 'Widow', 0, 1),
	(4, 'Widower', 0, 1);

-- Dumping structure for table hris.personal_religion
DROP TABLE IF EXISTS `personal_religion`;
CREATE TABLE IF NOT EXISTS `personal_religion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `other` int(1) NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.personal_religion: ~6 rows (approximately)
INSERT INTO `personal_religion` (`id`, `name`, `other`, `presence`) VALUES
	(1, 'Islam', 0, 1),
	(2, 'Christian', 0, 1),
	(3, 'Catholic', 0, 1),
	(4, 'Buddhist', 0, 1),
	(5, 'Hindu', 0, 1),
	(6, 'Others', 0, 1);

-- Dumping structure for table hris.pph21_ptkp
DROP TABLE IF EXISTS `pph21_ptkp`;
CREATE TABLE IF NOT EXISTS `pph21_ptkp` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `jumlahAnak` int(2) NOT NULL DEFAULT 0,
  `PTKPTidakKawinLabel` varchar(50) NOT NULL,
  `PTKPTidakKawin` double NOT NULL,
  `PTKPKawinLabel` varchar(50) NOT NULL,
  `PTKPKawin` double NOT NULL,
  `PTKPGabunganSuamiIstriLabel` varchar(50) NOT NULL,
  `PTKPGabunganSuamiIstri` double NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  `updateDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.pph21_ptkp: ~4 rows (approximately)
INSERT INTO `pph21_ptkp` (`id`, `jumlahAnak`, `PTKPTidakKawinLabel`, `PTKPTidakKawin`, `PTKPKawinLabel`, `PTKPKawin`, `PTKPGabunganSuamiIstriLabel`, `PTKPGabunganSuamiIstri`, `presence`, `updateDate`) VALUES
	(1, 0, 'TK/0', 54000000, 'K/0', 58500000, 'K/I/0a', 112500000, 1, '2023-01-30 09:03:15'),
	(2, 1, 'TK/1', 58500000, 'K/1', 63000000, 'K/I/1b', 117000000, 1, '2023-01-30 09:03:15'),
	(3, 2, 'TK/2', 63000000, 'K/2', 67500000, 'K/I/2c', 121500000, 1, '2023-01-30 09:03:15'),
	(4, 3, 'TK/3', 67500000, 'K/3', 72000000, 'K/I/3d', 126500000, 1, '2023-01-30 09:03:15');

-- Dumping structure for table hris.pph21_tarif_pajak
DROP TABLE IF EXISTS `pph21_tarif_pajak`;
CREATE TABLE IF NOT EXISTS `pph21_tarif_pajak` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `note` varchar(250) NOT NULL DEFAULT '',
  `minAmount` double NOT NULL DEFAULT 0,
  `maxAmount` double NOT NULL DEFAULT 0,
  `TaxPercent` float NOT NULL DEFAULT 0,
  `presence` int(1) NOT NULL DEFAULT 1,
  `updateDate` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.pph21_tarif_pajak: ~4 rows (approximately)
INSERT INTO `pph21_tarif_pajak` (`id`, `note`, `minAmount`, `maxAmount`, `TaxPercent`, `presence`, `updateDate`) VALUES
	(1, '', 0, 60000000, 5, 1, '2023-01-30 09:03:15'),
	(2, '', 60000001, 250000000, 15, 1, '2023-01-30 09:03:15'),
	(3, '', 25000001, 500000000, 25, 1, '2023-01-30 09:03:15'),
	(4, '', 500000001, 5000000000, 30, 1, '2023-01-30 09:03:15'),
	(5, '', 5000000001, 99999999999, 35, 1, '2023-01-30 09:03:15');

-- Dumping structure for table hris.reimbursement
DROP TABLE IF EXISTS `reimbursement`;
CREATE TABLE IF NOT EXISTS `reimbursement` (
  `id` varchar(50) NOT NULL,
  `personalId` varchar(50) NOT NULL DEFAULT '',
  `reimbursementNameId` int(10) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `requestAmount` double NOT NULL DEFAULT 0,
  `paidAmount` double NOT NULL DEFAULT 0,
  `requestDate` date NOT NULL,
  `approvedBy` varchar(50) NOT NULL DEFAULT '',
  `approvedDate` datetime DEFAULT NULL,
  `presence` int(10) NOT NULL DEFAULT 1,
  `inputDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.reimbursement: ~4 rows (approximately)
INSERT INTO `reimbursement` (`id`, `personalId`, `reimbursementNameId`, `description`, `requestAmount`, `paidAmount`, `requestDate`, `approvedBy`, `approvedDate`, `presence`, `inputDate`, `updateDate`) VALUES
	('REM000019', 'P000003', 5, 'Description Description', 80000, 2444220, '2023-01-19', 'P0004', '2023-01-19 11:47:52', 0, '2023-01-19 11:54:50', '2023-01-19 11:54:50'),
	('REM000020', 'P000004', 6, 'ok', 555530, 555530, '2023-01-19', '0', '2023-01-19 11:34:46', 0, '2023-01-19 11:54:54', '2023-01-19 11:54:54'),
	('REM000021', 'P000007', 6, '123123', 33320, 33320, '2023-01-19', '0', '2023-01-19 11:34:59', 1, '2023-01-19 09:47:16', '2023-01-19 11:34:59'),
	('REM000023', 'P000003', 5, '234234324', 312320, 23440, '2023-01-19', 'P0004', '2023-01-19 11:47:21', 1, '2023-01-19 11:33:24', '2023-01-19 11:47:21'),
	('REM000024', 'P000004', 5, 'Description', 444110, 0, '2023-01-24', 'P0004', '2023-01-24 10:08:06', 1, '2023-01-24 10:07:40', '2023-01-24 10:08:06');

-- Dumping structure for table hris.reimbursement_name
DROP TABLE IF EXISTS `reimbursement_name`;
CREATE TABLE IF NOT EXISTS `reimbursement_name` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `presence` int(1) NOT NULL DEFAULT 1,
  `inputDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.reimbursement_name: ~2 rows (approximately)
INSERT INTO `reimbursement_name` (`id`, `name`, `presence`, `inputDate`) VALUES
	(4, 'Pewaratan', 1, NULL),
	(5, 'kaca mata', 1, NULL),
	(6, 'transportasi', 1, NULL),
	(7, '123123', 1, NULL);

-- Dumping structure for procedure hris.spTest
DROP PROCEDURE IF EXISTS `spTest`;
DELIMITER //
CREATE PROCEDURE `spTest`()
BEGIN
	SELECT *  FROM time_management;
END//
DELIMITER ;

-- Dumping structure for table hris.time_management
DROP TABLE IF EXISTS `time_management`;
CREATE TABLE IF NOT EXISTS `time_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personalId` varchar(50) NOT NULL DEFAULT '',
  `date` date DEFAULT NULL,
  `shiftId` varchar(50) NOT NULL DEFAULT 'W',
  `checkIn` time NOT NULL DEFAULT '00:00:00',
  `checkOut` time NOT NULL DEFAULT '00:00:00',
  `overTime` time NOT NULL DEFAULT '00:00:00',
  `offTimeId` int(6) NOT NULL DEFAULT 0,
  `presence` int(2) NOT NULL DEFAULT 1,
  `importData` int(2) NOT NULL DEFAULT 0,
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `updateDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4960 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.time_management: ~170 rows (approximately)
INSERT INTO `time_management` (`id`, `personalId`, `date`, `shiftId`, `checkIn`, `checkOut`, `overTime`, `offTimeId`, `presence`, `importData`, `inputDate`, `updateDate`) VALUES
	(4748, 'P000007', '2023-01-02', 'W', '08:02:00', '16:50:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4749, 'P000003', '2023-01-02', 'W', '09:04:00', '23:50:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4750, 'P000002', '2023-01-02', 'W', '06:25:00', '20:14:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4751, 'P000004', '2023-01-02', 'W', '07:37:00', '18:19:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4752, 'P000006', '2023-01-03', 'W', '08:35:00', '17:51:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4753, 'P000002', '2023-01-03', 'W', '07:16:00', '18:13:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4754, 'P000007', '2023-01-03', 'W', '08:05:00', '16:30:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4755, 'P000004', '2023-01-03', 'W', '07:50:00', '18:28:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4756, '800', '2023-01-03', 'W', '08:28:00', '19:15:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4757, 'P000003', '2023-01-03', 'W', '09:00:00', '17:56:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4758, 'P000005', '2023-01-03', 'W', '08:56:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4759, '800', '2023-01-04', 'W', '08:32:00', '19:17:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4760, 'P000003', '2023-01-04', 'W', '09:12:00', '18:04:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4761, 'P000005', '2023-01-04', 'W', '08:42:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4762, 'P000007', '2023-01-04', 'W', '08:02:00', '16:35:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4763, 'P000006', '2023-01-04', 'W', '08:33:00', '19:07:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4764, 'P000002', '2023-01-04', 'W', '06:09:00', '18:09:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4765, 'P000004', '2023-01-04', 'W', '06:02:00', '18:33:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4766, 'P000006', '2023-01-05', 'W', '08:27:00', '19:27:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4767, 'P000002', '2023-01-05', 'W', '06:22:00', '21:12:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4768, 'P000004', '2023-01-05', 'W', '06:01:00', '17:16:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4769, '800', '2023-01-05', 'W', '08:29:00', '19:44:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4770, '1', '2023-01-05', 'W', '06:58:00', '18:46:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4771, 'P000005', '2023-01-05', 'W', '08:51:00', '18:05:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4772, 'P000003', '2023-01-05', 'W', '09:13:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4773, 'P000007', '2023-01-05', 'W', '08:05:00', '16:55:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4774, '800', '2023-01-06', 'W', '08:18:00', '17:54:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4775, 'P000005', '2023-01-06', 'W', '08:53:00', '18:25:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4776, 'P000007', '2023-01-06', 'W', '08:05:00', '16:42:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4777, 'P000003', '2023-01-06', 'W', '09:10:00', '18:08:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4778, 'P000006', '2023-01-06', 'W', '08:28:00', '17:26:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4779, 'P000002', '2023-01-06', 'W', '06:26:00', '18:03:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4780, '1', '2023-01-06', 'W', '07:48:00', '17:43:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4781, 'P000004', '2023-01-06', 'W', '06:26:00', '18:27:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4782, 'P000007', '2023-01-07', 'W', '08:32:00', '15:01:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4783, 'P000006', '2023-01-07', 'W', '09:01:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4784, 'P000003', '2023-01-07', 'W', '14:50:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-01 00:00:00'),
	(4785, 'P000002', '2023-01-07', 'W', '07:56:00', '16:11:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4786, 'P000004', '2023-01-07', 'W', '06:19:00', '15:08:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4787, '800', '2023-01-07', 'W', '08:52:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4788, '1', '2023-01-07', 'W', '06:36:00', '15:03:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4789, 'P000003', '2023-01-09', 'W', '08:58:00', '18:06:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4790, 'P000007', '2023-01-09', 'W', '08:05:00', '16:49:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4791, '800', '2023-01-09', 'W', '08:30:00', '19:28:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4792, 'P000004', '2023-01-09', 'W', '07:26:00', '18:40:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4793, '1', '2023-01-09', 'W', '08:40:00', '18:30:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4794, 'P000002', '2023-01-09', 'W', '06:23:00', '21:01:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4795, 'P000005', '2023-01-09', 'W', '08:49:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4796, 'P000006', '2023-01-09', 'W', '19:08:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-01 00:00:00'),
	(4797, 'P000004', '2023-01-10', 'W', '05:58:00', '19:22:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4798, '1', '2023-01-10', 'W', '06:36:00', '17:50:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4799, 'P000005', '2023-01-10', 'W', '08:48:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4800, 'P000002', '2023-01-10', 'W', '06:09:00', '17:59:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4801, 'P000003', '2023-01-10', 'W', '08:51:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4802, '800', '2023-01-10', 'W', '08:26:00', '19:48:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4803, 'P000007', '2023-01-10', 'W', '08:06:00', '16:59:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4804, 'P000006', '2023-01-10', 'W', '19:24:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-01 00:00:00'),
	(4805, '800', '2023-01-11', 'W', '08:26:00', '20:17:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4806, '1', '2023-01-11', 'W', '06:57:00', '18:47:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4807, 'P000006', '2023-01-11', 'W', '08:43:00', '18:49:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4808, 'P000003', '2023-01-11', 'W', '09:01:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4809, 'P000004', '2023-01-11', 'W', '06:08:00', '19:14:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4810, 'P000005', '2023-01-11', 'W', '08:58:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4811, 'P000007', '2023-01-11', 'W', '08:02:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-01 00:00:00'),
	(4812, 'P000002', '2023-01-11', 'W', '06:07:00', '21:13:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4813, '1', '2023-01-12', 'W', '06:15:00', '18:38:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4814, '800', '2023-01-12', 'W', '08:22:00', '20:40:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4815, 'P000005', '2023-01-12', 'W', '08:46:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4816, 'P000002', '2023-01-12', 'W', '06:15:00', '21:24:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4817, 'P000007', '2023-01-12', 'W', '08:06:00', '16:33:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4818, 'P000004', '2023-01-12', 'W', '06:19:00', '19:54:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4819, 'P000006', '2023-01-12', 'W', '08:35:00', '19:30:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4820, 'P000003', '2023-01-12', 'W', '09:01:00', '18:16:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4821, 'P000002', '2023-01-13', 'W', '06:17:00', '07:34:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4822, 'P000005', '2023-01-13', 'W', '08:39:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4823, 'P000004', '2023-01-13', 'W', '06:02:00', '19:34:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4824, 'P000006', '2023-01-13', 'W', '08:34:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4825, 'P000003', '2023-01-13', 'W', '08:58:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4826, 'P000007', '2023-01-13', 'W', '08:01:00', '17:02:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4827, '800', '2023-01-13', 'W', '08:17:00', '19:36:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4828, 'P000007', '2023-01-14', 'W', '08:31:00', '15:52:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4829, 'P000006', '2023-01-14', 'W', '08:56:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4830, '800', '2023-01-14', 'W', '08:51:00', '16:06:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4831, 'P000004', '2023-01-14', 'W', '06:38:00', '15:09:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4832, 'P000003', '2023-01-14', 'W', '09:07:00', '14:59:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-01-26 19:30:52'),
	(4875, 'P000007', '2023-01-02', 'W', '08:02:00', '16:50:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4876, 'P000003', '2023-01-02', 'W', '09:04:00', '23:50:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4877, 'P000002', '2023-01-02', 'W', '06:25:00', '20:14:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4878, 'P000004', '2023-01-02', 'W', '07:37:00', '18:19:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4879, 'P000006', '2023-01-03', 'W', '08:35:00', '17:51:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4880, 'P000002', '2023-01-03', 'W', '07:16:00', '18:13:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4881, 'P000007', '2023-01-03', 'W', '08:05:00', '16:30:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4882, 'P000004', '2023-01-03', 'W', '07:50:00', '18:28:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4883, '800', '2023-01-03', 'W', '08:28:00', '19:15:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4884, 'P000003', '2023-01-03', 'W', '09:00:00', '17:56:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4885, 'P000005', '2023-01-03', 'W', '08:56:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4886, '800', '2023-01-04', 'W', '08:32:00', '19:17:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4887, 'P000003', '2023-01-04', 'W', '09:12:00', '18:04:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4888, 'P000005', '2023-01-04', 'W', '08:42:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4889, 'P000007', '2023-01-04', 'W', '08:02:00', '16:35:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4890, 'P000006', '2023-01-04', 'W', '08:33:00', '19:07:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4891, 'P000002', '2023-01-04', 'W', '06:09:00', '18:09:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4892, 'P000004', '2023-01-04', 'W', '06:02:00', '18:33:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4893, 'P000006', '2023-01-05', 'W', '08:27:00', '19:27:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4894, 'P000002', '2023-01-05', 'W', '06:22:00', '21:12:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4895, 'P000004', '2023-01-05', 'W', '06:01:00', '17:16:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4896, '800', '2023-01-05', 'W', '08:29:00', '19:44:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4897, '1', '2023-01-05', 'W', '06:58:00', '18:46:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4898, 'P000005', '2023-01-05', 'W', '08:51:00', '18:05:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4899, 'P000003', '2023-01-05', 'W', '09:13:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4900, 'P000007', '2023-01-05', 'W', '08:05:00', '16:55:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4901, '800', '2023-01-06', 'W', '08:18:00', '17:54:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4902, 'P000005', '2023-01-06', 'W', '08:53:00', '18:25:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4903, 'P000007', '2023-01-06', 'W', '08:05:00', '16:42:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4904, 'P000003', '2023-01-06', 'W', '09:10:00', '18:08:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4905, 'P000006', '2023-01-06', 'W', '08:28:00', '17:26:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4906, 'P000002', '2023-01-06', 'W', '06:26:00', '18:03:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4907, '1', '2023-01-06', 'W', '07:48:00', '17:43:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4908, 'P000004', '2023-01-06', 'W', '06:26:00', '18:27:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4909, 'P000007', '2023-01-07', 'W', '08:32:00', '15:01:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4910, 'P000006', '2023-01-07', 'W', '09:01:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4911, 'P000003', '2023-01-07', 'W', '14:50:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-01 00:00:00'),
	(4912, 'P000002', '2023-01-07', 'W', '07:56:00', '16:11:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4913, 'P000004', '2023-01-07', 'W', '06:19:00', '15:08:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4914, '800', '2023-01-07', 'W', '08:52:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4915, '1', '2023-01-07', 'W', '06:36:00', '15:03:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4916, 'P000003', '2023-01-09', 'W', '08:58:00', '18:06:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4917, 'P000007', '2023-01-09', 'W', '08:05:00', '16:49:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4918, '800', '2023-01-09', 'W', '08:30:00', '19:28:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4919, 'P000004', '2023-01-09', 'W', '07:26:00', '18:40:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4920, '1', '2023-01-09', 'W', '08:40:00', '18:30:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4921, 'P000002', '2023-01-09', 'W', '06:23:00', '21:01:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4922, 'P000005', '2023-01-09', 'W', '08:49:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4923, 'P000006', '2023-01-09', 'W', '19:08:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-01 00:00:00'),
	(4924, 'P000004', '2023-01-10', 'W', '05:58:00', '19:22:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4925, '1', '2023-01-10', 'W', '06:36:00', '17:50:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4926, 'P000005', '2023-01-10', 'W', '08:48:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4927, 'P000002', '2023-01-10', 'W', '06:09:00', '17:59:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4928, 'P000003', '2023-01-10', 'W', '08:51:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4929, '800', '2023-01-10', 'W', '08:26:00', '19:48:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4930, 'P000007', '2023-01-10', 'W', '08:06:00', '16:59:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4931, 'P000006', '2023-01-10', 'W', '19:24:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-01 00:00:00'),
	(4932, '800', '2023-01-11', 'W', '08:26:00', '20:17:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4933, '1', '2023-01-11', 'W', '06:57:00', '18:47:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4934, 'P000006', '2023-01-11', 'W', '08:43:00', '18:49:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4935, 'P000003', '2023-01-11', 'W', '09:01:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4936, 'P000004', '2023-01-11', 'W', '06:08:00', '19:14:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4937, 'P000005', '2023-01-11', 'W', '08:58:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4938, 'P000007', '2023-01-11', 'W', '08:02:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-01 00:00:00'),
	(4939, 'P000002', '2023-01-11', 'W', '06:07:00', '21:13:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4940, '1', '2023-01-12', 'W', '06:15:00', '18:38:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4941, '800', '2023-01-12', 'W', '08:22:00', '20:40:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4942, 'P000005', '2023-01-12', 'W', '08:46:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4943, 'P000002', '2023-01-12', 'W', '06:15:00', '21:24:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4944, 'P000007', '2023-01-12', 'W', '08:06:00', '16:33:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4945, 'P000004', '2023-01-12', 'W', '06:19:00', '19:54:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4946, 'P000006', '2023-01-12', 'W', '08:35:00', '19:30:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4947, 'P000003', '2023-01-12', 'W', '09:01:00', '18:16:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4948, 'P000002', '2023-01-13', 'W', '06:17:00', '07:34:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4949, 'P000005', '2023-01-13', 'W', '08:39:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4950, 'P000004', '2023-01-13', 'W', '06:02:00', '19:34:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4951, 'P000006', '2023-01-13', 'W', '08:34:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4952, 'P000003', '2023-01-13', 'W', '08:58:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4953, 'P000007', '2023-01-13', 'W', '08:01:00', '17:02:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4954, '800', '2023-01-13', 'W', '08:17:00', '19:36:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4955, 'P000007', '2023-01-14', 'W', '08:31:00', '15:52:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4956, 'P000006', '2023-01-14', 'W', '08:56:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4957, '800', '2023-01-14', 'W', '08:51:00', '16:06:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4958, 'P000004', '2023-01-14', 'W', '06:38:00', '15:09:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52'),
	(4959, 'P000003', '2023-01-14', 'W', '09:07:00', '14:59:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-01-26 19:30:52');

-- Dumping structure for table hris.time_management_shift
DROP TABLE IF EXISTS `time_management_shift`;
CREATE TABLE IF NOT EXISTS `time_management_shift` (
  `idAuto` int(5) NOT NULL AUTO_INCREMENT,
  `id` varchar(9) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `scheduleIn` time NOT NULL DEFAULT '00:00:00',
  `scheduleOut` time NOT NULL DEFAULT '00:00:00',
  `Sun` int(1) NOT NULL DEFAULT 0,
  `Mon` int(1) NOT NULL DEFAULT 1,
  `Tue` int(1) NOT NULL DEFAULT 1,
  `Wed` int(1) NOT NULL DEFAULT 1,
  `Thu` int(1) NOT NULL DEFAULT 1,
  `Fri` int(1) NOT NULL DEFAULT 1,
  `Sat` int(1) NOT NULL DEFAULT 1,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idAuto`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.time_management_shift: ~3 rows (approximately)
INSERT INTO `time_management_shift` (`idAuto`, `id`, `name`, `scheduleIn`, `scheduleOut`, `Sun`, `Mon`, `Tue`, `Wed`, `Thu`, `Fri`, `Sat`, `presence`) VALUES
	(1, 'W', 'WEEKDAY', '06:00:00', '19:00:00', 0, 1, 1, 1, 1, 1, 1, 1),
	(2, 'BC', 'Part Time', '14:00:00', '19:00:00', 0, 1, 1, 1, 1, 1, 0, 1),
	(3, '', '', '00:00:00', '00:00:00', 0, 1, 1, 1, 1, 1, 1, 0);

-- Dumping structure for table hris.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.user: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
