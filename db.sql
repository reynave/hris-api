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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.auto_number: ~4 rows (approximately)
INSERT INTO `auto_number` (`id`, `name`, `prefix`, `digit`, `runningNumber`, `updateDate`) VALUES
	(1, 'personal', 'P', 6, 7, '0000-00-00 00:00:00'),
	(2, 'employment', 'E', 6, 23, '0000-00-00 00:00:00'),
	(3, 'payroll', 'PYL', 6, 12, '0000-00-00 00:00:00'),
	(4, 'reimbursement', 'REM', 6, 23, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.branch: ~11 rows (approximately)
INSERT INTO `branch` (`id`, `organizationId`, `name`, `presence`, `inputDate`, `updateDate`, `inputBy`, `updateBy`) VALUES
	(1, '1', 'Kelapa gading', 1, NULL, NULL, NULL, NULL),
	(2, '1', 'Mangga Dua', 1, NULL, NULL, NULL, NULL),
	(3, '1', 'Mall Taman Anggrek', 1, NULL, NULL, NULL, NULL),
	(4, '2', 'Kokas', 1, NULL, NULL, NULL, NULL),
	(5, '2', 'GI', 1, NULL, NULL, NULL, NULL),
	(6, '3', 'Senayan City', 1, NULL, NULL, NULL, NULL),
	(7, '881', 'fasdfasdfadsf', 1, '2023-01-17 12:13:20', '2023-01-17 12:13:20', NULL, NULL),
	(8, '885', '234234234234', 1, '2023-01-17 12:26:51', '2023-01-17 12:26:51', NULL, NULL),
	(9, '1', 'hahahahahahah', 1, '2023-01-17 12:37:24', '2023-01-17 12:37:24', NULL, NULL),
	(10, '1', '11111123123', 1, '2023-01-17 12:38:12', '2023-01-17 12:38:12', NULL, NULL),
	(11, '1', '5234523452345', 1, '2023-01-17 12:38:45', '2023-01-17 12:38:45', NULL, NULL),
	(12, '1', '5234523452345', 1, '2023-01-17 12:38:52', '2023-01-17 12:38:52', NULL, NULL),
	(13, '1', '999886574576', 1, '2023-01-17 12:39:33', '2023-01-17 12:39:33', NULL, NULL);

-- Dumping structure for table hris.employment
DROP TABLE IF EXISTS `employment`;
CREATE TABLE IF NOT EXISTS `employment` (
  `id` varchar(9) NOT NULL,
  `personalId` varchar(10) NOT NULL,
  `employmentStatusId` int(3) NOT NULL DEFAULT 0,
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

-- Dumping data for table hris.employment: ~3 rows (approximately)
INSERT INTO `employment` (`id`, `personalId`, `employmentStatusId`, `dateJoinStart`, `dateJoinEnd`, `jobPositionId`, `jobLevelId`, `branchId`, `approvalLineId`, `organizationId`, `presence`, `status`, `inputDate`, `updateDate`) VALUES
	('E000013', 'P000003', 1, '2023-05-19', '2030-01-01', 7, 5, 4, 'P000005', 2, 1, 1, '2023-01-17 06:53:49', '2023-01-17 10:48:46'),
	('E000015', 'P000004', 2, '2023-01-28', '2030-01-01', 6, 5, 13, 'P000004', 1, 1, 1, '2023-01-17 08:33:22', '2023-01-17 12:39:41'),
	('E000016', 'P000007', 0, '0000-00-00', '2030-01-01', 0, 0, 0, '', 0, 1, 1, '2023-01-18 10:06:55', '2023-01-01 00:00:00');

-- Dumping structure for table hris.employment_joblevel
DROP TABLE IF EXISTS `employment_joblevel`;
CREATE TABLE IF NOT EXISTS `employment_joblevel` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `presence` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.employment_joblevel: ~2 rows (approximately)
INSERT INTO `employment_joblevel` (`id`, `name`, `presence`) VALUES
	(4, 'CEO', 1),
	(5, 'Manager', 1),
	(6, 'Staft', 1);

-- Dumping structure for table hris.employment_jobposition
DROP TABLE IF EXISTS `employment_jobposition`;
CREATE TABLE IF NOT EXISTS `employment_jobposition` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `presence` int(1) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.employment_jobposition: ~5 rows (approximately)
INSERT INTO `employment_jobposition` (`id`, `name`, `presence`) VALUES
	(4, 'Marketing', 1),
	(5, 'Sales', 1),
	(6, 'Accounting', 1),
	(7, 'General Manager', 1),
	(8, 'IT Staft', 1),
	(9, 'Office Boy', 1);

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
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.loan: ~0 rows (approximately)
INSERT INTO `loan` (`id`, `name`) VALUES
	(1, 'Personal Load');

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
	(878, 'hahahah', 1, '2023-01-17 11:44:16', '2023-01-17 11:44:16', NULL, NULL),
	(879, 'sadfasdfadf', 1, '2023-01-17 11:44:57', '2023-01-17 11:44:57', NULL, NULL),
	(880, 'palanging', 1, '2023-01-17 11:49:40', '2023-01-17 11:49:40', NULL, NULL),
	(881, 'aagagaga', 1, '2023-01-17 11:50:05', '2023-01-17 11:50:05', NULL, NULL),
	(882, 'hrfsadf', 1, '2023-01-17 12:14:22', '2023-01-17 12:14:22', NULL, NULL),
	(883, 'gasdfasdf', 1, '2023-01-17 12:14:44', '2023-01-17 12:14:44', NULL, NULL),
	(884, 'asdfsadfasdf', 1, '2023-01-17 12:25:47', '2023-01-17 12:25:47', NULL, NULL),
	(885, 'gagag', 1, '2023-01-17 12:26:48', '2023-01-17 12:26:48', NULL, NULL);

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

-- Dumping data for table hris.payroll: ~2 rows (approximately)
INSERT INTO `payroll` (`id`, `personalId`, `salary`, `salaryType`, `bankName`, `bankAccountNumber`, `bankAccountHolderName`, `hourlyRate`, `tunjangan`, `taxNpwp`, `taxMethod`, `taxableDate`, `taxHolderName`, `taxPtkpStatus`, `taxSalary`, `EmploymentTaxStatus`, `taxPktpAccountHolder`, `bpsjTkNo`, `bpsjKesehatanNo`, `JhtCost`, `JaminanPensiunCost`, `bpjsTkDate`, `bpjsKesehatanFamily`, `JaminanPensiunDate`, `status`, `presence`, `updateDate`, `inputDate`) VALUES
	('R000011', 'P000003', 1230, 'H', '1bbb', 'aaa', 'ddddf', 234234, 2342340, 'NPWP', 'Tax Method', '2021-01-11', 'Account Holder Name', 'PTKP Status', 40, 'Employment Tax Status', 'Account Holder Name', 'BPJS TK no', 'BPJS Kesehatan No', 10, 20, '2022-01-31', '30', '2023-01-10', 1, 1, '2023-01-18 07:42:35', '2023-01-17 06:53:51'),
	('R000012', 'P000007', 0, '', '', '', '', 0, 0, '', '', '2020-01-01', '', '', 0, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-01-01 00:00:00', '2023-01-18 10:12:32');

-- Dumping structure for table hris.personal
DROP TABLE IF EXISTS `personal`;
CREATE TABLE IF NOT EXISTS `personal` (
  `id` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
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

-- Dumping data for table hris.personal: ~8 rows (approximately)
INSERT INTO `personal` (`id`, `name`, `phone`, `email`, `birthPlace`, `birthDate`, `gender`, `marital`, `blood`, `religion`, `idType`, `idNumber`, `expDate`, `permanent`, `postalCode`, `address`, `presence`, `status`, `inputDate`, `updateDate`) VALUES
	('1', 'gagag', 'pho123123', '', '', '', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 0, 0, '2023-01-16 13:32:39', '2023-01-16 13:32:39'),
	('800', 'asd', '', '', '', '', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 0, 0, '2023-01-16 13:32:58', '2023-01-16 13:32:58'),
	('P000002', 'asd', '', '', '', '', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 0, 0, '2023-01-16 13:43:32', '2023-01-16 13:43:32'),
	('P000003', 'Jonny', 'fsgfdfg', 'admin@abac.org', 'gagagagagag', '1990-1-27', '1', 2, 'AB', 5, 2, '5345345345443434', '2023-03-17', 0, '535345', '245234523 2 43 2345 2345', 1, 1, '2023-01-17 13:32:53', '2023-01-17 13:32:53'),
	('P000004', 'AkanShari', '', '', '', '1990-1-19', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-01-16 13:14:47', '2023-01-16 13:14:47'),
	('P000005', 'Sayako', '1234234', 'admin@admin.com', '', '1990-1-1', 'M', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-01-17 10:41:04', '2023-01-17 10:41:04'),
	('P000006', 'Kitaro', '43234234', 'rey_nave@yahoo.com', '', '1990-1-1', 'M', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-01-16 13:17:41', '2023-01-16 13:17:41'),
	('P000007', 'Olive alson', '999976666', 'alson@email.com', '', '1981-1-2', 'M', 0, '', 0, 1, '', '2023-01-01', 0, '', '', 1, 1, '2023-01-18 10:06:42', '2023-01-18 10:06:42');

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
	(2, 'Password', 0),
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
	('REM000023', 'P000003', 5, '234234324', 312320, 23440, '2023-01-19', 'P0004', '2023-01-19 11:47:21', 1, '2023-01-19 11:33:24', '2023-01-19 11:47:21');

-- Dumping structure for table hris.reimbursement_name
DROP TABLE IF EXISTS `reimbursement_name`;
CREATE TABLE IF NOT EXISTS `reimbursement_name` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `presence` int(1) NOT NULL DEFAULT 1,
  `inputDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.reimbursement_name: ~2 rows (approximately)
INSERT INTO `reimbursement_name` (`id`, `name`, `presence`, `inputDate`) VALUES
	(4, 'Pewaratan', 1, NULL),
	(5, 'kaca mata', 1, NULL),
	(6, 'transportasi', 1, NULL);

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
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `updateDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.time_management: ~13 rows (approximately)
INSERT INTO `time_management` (`id`, `personalId`, `date`, `shiftId`, `checkIn`, `checkOut`, `overTime`, `offTimeId`, `presence`, `inputDate`, `updateDate`) VALUES
	(1, 'P000003', '2023-01-18', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
	(2, 'P000003', '2023-01-17', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
	(3, 'P000004', '2023-01-17', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
	(4, 'P000004', '2023-01-11', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
	(5, 'P000004', '2022-05-21', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
	(6, 'P000004', '2023-01-18', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
	(7, 'P000005', '2023-01-18', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, '2023-01-18 12:27:53', '2023-01-01 00:00:00'),
	(8, 'P000006', '2023-01-18', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, '2023-01-18 12:27:56', '2023-01-01 00:00:00'),
	(9, 'P000007', '2023-01-18', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, '2023-01-18 12:28:00', '2023-01-01 00:00:00'),
	(10, 'undefined', '2023-01-19', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, '2023-01-19 07:24:15', '2023-01-01 00:00:00'),
	(11, 'P000003', '2023-01-19', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 0, '2023-01-19 07:27:35', '2023-01-19 12:24:28'),
	(12, 'P000004', '2023-01-19', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, '2023-01-19 12:02:11', '2023-01-01 00:00:00'),
	(13, 'P000007', '2023-01-19', 'W', '03:02:00', '03:02:00', '03:01:00', 887, 1, '2023-01-19 12:18:42', '2023-01-19 12:27:19'),
	(14, 'P000003', '2023-01-19', 'W', '03:02:00', '03:02:00', '05:00:00', 887, 1, '2023-01-19 12:24:54', '2023-01-19 12:27:04'),
	(15, 'P000005', '2023-01-19', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, '2023-01-19 12:25:41', '2023-01-01 00:00:00'),
	(16, 'P000006', '2023-01-19', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, '2023-01-19 12:25:44', '2023-01-01 00:00:00');

-- Dumping structure for table hris.time_management_shift
DROP TABLE IF EXISTS `time_management_shift`;
CREATE TABLE IF NOT EXISTS `time_management_shift` (
  `id` varchar(9) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `scheduleIn` time NOT NULL DEFAULT '00:00:00',
  `scheduleOut` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.time_management_shift: ~0 rows (approximately)
INSERT INTO `time_management_shift` (`id`, `name`, `scheduleIn`, `scheduleOut`) VALUES
	('W', 'WEEKDAY', '08:00:00', '17:00:00');

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

-- Dumping structure for table hris.user_access
DROP TABLE IF EXISTS `user_access`;
CREATE TABLE IF NOT EXISTS `user_access` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL DEFAULT '',
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.user_access: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
