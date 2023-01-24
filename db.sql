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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.attendance_log: ~15 rows (approximately)
INSERT INTO `attendance_log` (`id`, `fileSize`, `fileName`, `note`, `status`, `presence`, `inputDate`, `updateDate`) VALUES
	(1, 58.48, '1674547434Attendance3.txt', '', 0, 1, '2023-01-24 09:05:16', NULL),
	(2, 58.48, '1674547516Attendance3.txt', '', 0, 1, '2023-01-24 09:05:16', NULL),
	(3, 58.48, '1674547524Attendance3.txt', '', 0, 1, '2023-01-24 09:05:24', NULL),
	(4, 58.48, '1674548057Attendance3.txt', '', 0, 1, '2023-01-24 09:14:17', NULL),
	(5, 58.48, '1674548190Attendance3.txt', '', 0, 1, '2023-01-24 09:16:30', NULL),
	(6, 58.48, '1674548754Attendance3.txt', '', 0, 1, '2023-01-24 09:25:54', NULL),
	(7, 58.48, '1674548790Attendance3.txt', '', 0, 1, '2023-01-24 09:26:30', NULL),
	(8, 58.48, '1674548882Attendance3.txt', '', 0, 1, '2023-01-24 09:28:02', NULL),
	(9, 58.48, '1674548904Attendance3.txt', '', 0, 1, '2023-01-24 09:28:24', NULL),
	(10, 58.48, '1674549032Attendance3.txt', '', 0, 1, '2023-01-24 09:30:32', NULL),
	(11, 58.48, '1674550274Attendance3.txt', 'Upload Success', 0, 1, '2023-01-24 09:51:14', NULL),
	(12, 58.48, '1674550317Attendance3.txt', 'Sync Success', 1, 1, '2023-01-24 09:51:57', '2023-01-24 09:51:57'),
	(13, 58.48, '1674550400Attendance3.txt', 'Sync Success', 1, 1, '2023-01-24 09:53:20', '2023-01-24 09:53:20'),
	(14, 58.48, '1674550449Attendance3.txt', 'Sync Success', 1, 1, '2023-01-24 09:54:09', '2023-01-24 09:54:09'),
	(15, 58.48, '1674550571Attendance3.txt', 'Sync Success', 1, 1, '2023-01-24 09:56:11', '2023-01-24 09:56:12'),
	(16, 58.48, '1674550606Attendance3.txt', 'Sync Success', 1, 1, '2023-01-24 09:56:46', '2023-01-24 09:56:46');

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
	(1, 'personal', 'P', 6, 8, '0000-00-00 00:00:00'),
	(2, 'employment', 'E', 6, 24, '0000-00-00 00:00:00'),
	(3, 'payroll', 'PYL', 6, 13, '0000-00-00 00:00:00'),
	(4, 'reimbursement', 'REM', 6, 24, '0000-00-00 00:00:00'),
	(5, 'loan', 'LN', 6, 17, '0000-00-00 00:00:00');

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
	(7, '881', 'Branchd 123', 0, '2023-01-17 12:13:20', '2023-01-17 12:13:20', NULL, NULL),
	(8, '885', 'ghhhh342', 0, '2023-01-17 12:26:51', '2023-01-17 12:26:51', NULL, NULL),
	(9, '1', 'hahahahahahah', 1, '2023-01-17 12:37:24', '2023-01-17 12:37:24', NULL, NULL),
	(10, '1', '11111123123', 0, '2023-01-17 12:38:12', '2023-01-17 12:38:12', NULL, NULL),
	(11, '1', '5234523452345', 0, '2023-01-17 12:38:45', '2023-01-17 12:38:45', NULL, NULL),
	(12, '1', '5234523452345', 0, '2023-01-17 12:38:52', '2023-01-17 12:38:52', NULL, NULL),
	(13, '1', '999886574576', 0, '2023-01-17 12:39:33', '2023-01-17 12:39:33', NULL, NULL);

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

-- Dumping data for table hris.employment: ~3 rows (approximately)
INSERT INTO `employment` (`id`, `personalId`, `employmentStatusId`, `timeManagementShiftId`, `dateJoinStart`, `dateJoinEnd`, `jobPositionId`, `jobLevelId`, `branchId`, `approvalLineId`, `organizationId`, `presence`, `status`, `inputDate`, `updateDate`) VALUES
	('E000013', 'P000003', 1, 'W', '2022-05-19', '2030-01-01', 7, 5, 4, 'P000005', 2, 1, 1, '2023-01-17 06:53:49', '2023-01-17 10:48:46'),
	('E000015', 'P000004', 2, 'W', '2022-01-28', '2030-01-01', 6, 5, 13, 'P000004', 1, 1, 1, '2023-01-17 08:33:22', '2023-01-17 12:39:41'),
	('E000016', 'P000007', 0, 'W', '2022-01-28', '2030-01-01', 0, 0, 0, '', 0, 1, 1, '2023-01-18 10:06:55', '2023-01-01 00:00:00'),
	('E000024', 'P000008', 0, '', '0000-00-00', '2030-01-01', 0, 0, 0, '', 0, 1, 1, '2023-01-24 10:10:20', '2023-01-01 00:00:00');

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

-- Dumping data for table hris.organization: ~11 rows (approximately)
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

-- Dumping data for table hris.payroll: ~2 rows (approximately)
INSERT INTO `payroll` (`id`, `personalId`, `salary`, `salaryType`, `bankName`, `bankAccountNumber`, `bankAccountHolderName`, `hourlyRate`, `tunjangan`, `taxNpwp`, `taxMethod`, `taxableDate`, `taxHolderName`, `taxPtkpStatus`, `taxSalary`, `EmploymentTaxStatus`, `taxPktpAccountHolder`, `bpsjTkNo`, `bpsjKesehatanNo`, `JhtCost`, `JaminanPensiunCost`, `bpjsTkDate`, `bpjsKesehatanFamily`, `JaminanPensiunDate`, `status`, `presence`, `updateDate`, `inputDate`) VALUES
	('PYL000013', 'P000008', 0, '', '', '', '', 0, 0, '', '', '2020-01-01', '', '', 0, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-01-01 00:00:00', '2023-01-24 10:10:22'),
	('R000011', 'P000003', 1230, 'H', '1bbb', 'aaa', 'ddddf', 234234, 2342340, 'NPWP', 'Tax Method', '2021-01-11', 'Account Holder Name', 'PTKP Status', 40, 'Employment Tax Status', 'Account Holder Name', 'BPJS TK no', 'BPJS Kesehatan No', 10, 20, '2022-01-31', '30', '2023-01-10', 1, 1, '2023-01-18 07:42:35', '2023-01-17 06:53:51'),
	('R000012', 'P000007', 0, '', '', '', '', 0, 0, '', '', '2020-01-01', '', '', 0, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-01-01 00:00:00', '2023-01-18 10:12:32');

-- Dumping structure for table hris.personal
DROP TABLE IF EXISTS `personal`;
CREATE TABLE IF NOT EXISTS `personal` (
  `id` varchar(50) NOT NULL,
  `idx` varchar(50) NOT NULL DEFAULT '',
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
INSERT INTO `personal` (`id`, `idx`, `name`, `phone`, `email`, `birthPlace`, `birthDate`, `gender`, `marital`, `blood`, `religion`, `idType`, `idNumber`, `expDate`, `permanent`, `postalCode`, `address`, `presence`, `status`, `inputDate`, `updateDate`) VALUES
	('1', '11223344', 'gagag', 'pho123123', '', '', '', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 0, 0, '2023-01-16 13:32:39', '2023-01-16 13:32:39'),
	('800', '20190001', 'asd', '', '', '', '', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 0, 0, '2023-01-16 13:32:58', '2023-01-16 13:32:58'),
	('P000002', '20189900', 'asd', '', '', '', '', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 0, 0, '2023-01-16 13:43:32', '2023-01-16 13:43:32'),
	('P000003', '20050082', 'Jonny', 'fsgfdfg', 'admin@abac.org', 'gagagagagag', '1990-1-27', '1', 2, 'AB', 5, 2, '5345345345443434', '2023-03-17', 0, '535345', '245234523 2 43 2345 2345', 1, 1, '2023-01-17 13:32:53', '2023-01-17 13:32:53'),
	('P000004', '20120542', 'AkanShari', '', '', '', '1990-1-19', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-01-16 13:14:47', '2023-01-16 13:14:47'),
	('P000005', '20130588', 'Sayako', '1234234', 'admin@admin.com', '', '1990-1-1', 'M', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-01-17 10:41:04', '2023-01-17 10:41:04'),
	('P000006', '20130607', 'Kitaro', '43234234', 'rey_nave@yahoo.com', '', '1990-1-1', 'M', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-01-16 13:17:41', '2023-01-16 13:17:41'),
	('P000007', '20140622', 'Olive alson', '999976666', 'alson@email.com', '', '1981-1-2', 'M', 0, '', 0, 1, '', '2023-01-01', 0, '', '', 1, 1, '2023-01-18 10:06:42', '2023-01-18 10:06:42'),
	('P000008', '', 'Melanisa', '78988565555', 'admi223n@jasa.com', '', '1990-1-1', 'M', 0, '', 0, 1, '', '2023-01-01', 0, '', '', 1, 1, '2023-01-24 10:10:18', '2023-01-24 10:10:18');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.reimbursement_name: ~2 rows (approximately)
INSERT INTO `reimbursement_name` (`id`, `name`, `presence`, `inputDate`) VALUES
	(4, 'Pewaratan', 1, NULL),
	(5, 'kaca mata', 1, NULL),
	(6, 'transportasi', 1, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4748 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.time_management: ~0 rows (approximately)
INSERT INTO `time_management` (`id`, `personalId`, `date`, `shiftId`, `checkIn`, `checkOut`, `overTime`, `offTimeId`, `presence`, `importData`, `inputDate`, `updateDate`) VALUES
	(4107, 'P000003', '2023-01-02', 'W', '09:04:00', '23:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4108, 'P000004', '2023-01-02', 'W', '07:37:00', '18:19:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4109, 'P000002', '2023-01-02', 'W', '06:25:00', '20:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4110, 'P000007', '2023-01-02', 'W', '08:02:00', '16:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4111, 'P000003', '2023-01-02', 'W', '09:04:00', '23:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4112, 'P000004', '2023-01-02', 'W', '07:37:00', '18:19:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4113, 'P000002', '2023-01-02', 'W', '06:25:00', '20:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4114, 'P000007', '2023-01-02', 'W', '08:02:00', '16:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4115, 'P000003', '2023-01-02', 'W', '09:04:00', '23:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4116, 'P000002', '2023-01-02', 'W', '06:25:00', '20:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4117, 'P000004', '2023-01-02', 'W', '07:37:00', '18:19:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4118, 'P000007', '2023-01-02', 'W', '08:02:00', '16:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4119, 'P000002', '2023-01-02', 'W', '06:25:00', '20:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4120, 'P000004', '2023-01-02', 'W', '07:37:00', '18:19:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4121, 'P000003', '2023-01-02', 'W', '09:04:00', '23:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4122, 'P000007', '2023-01-02', 'W', '08:02:00', '16:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4123, 'P000002', '2023-01-02', 'W', '06:25:00', '20:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4124, 'P000004', '2023-01-02', 'W', '07:37:00', '18:19:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4125, 'P000003', '2023-01-02', 'W', '09:04:00', '23:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4126, 'P000007', '2023-01-02', 'W', '08:02:00', '16:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4127, 'P000004', '2023-01-02', 'W', '07:37:00', '18:19:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4128, 'P000003', '2023-01-02', 'W', '09:04:00', '23:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4129, 'P000002', '2023-01-02', 'W', '06:25:00', '20:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4130, 'P000007', '2023-01-02', 'W', '08:02:00', '16:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4131, 'P000007', '2023-01-03', 'W', '08:05:00', '16:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4132, '800', '2023-01-03', 'W', '08:28:00', '19:15:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4133, 'P000006', '2023-01-03', 'W', '08:35:00', '17:51:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4134, 'P000002', '2023-01-03', 'W', '07:16:00', '18:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4135, 'P000005', '2023-01-03', 'W', '08:56:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4136, 'P000004', '2023-01-03', 'W', '07:50:00', '18:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4137, 'P000003', '2023-01-03', 'W', '09:00:00', '17:56:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4138, 'P000007', '2023-01-03', 'W', '08:05:00', '16:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4139, '800', '2023-01-03', 'W', '08:28:00', '19:15:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4140, 'P000006', '2023-01-03', 'W', '08:35:00', '17:51:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4141, 'P000004', '2023-01-03', 'W', '07:50:00', '18:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4142, 'P000003', '2023-01-03', 'W', '09:00:00', '17:56:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4143, 'P000005', '2023-01-03', 'W', '08:56:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4144, '800', '2023-01-03', 'W', '08:28:00', '19:15:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4145, 'P000002', '2023-01-03', 'W', '07:16:00', '18:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4146, 'P000006', '2023-01-03', 'W', '08:35:00', '17:51:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4147, 'P000007', '2023-01-03', 'W', '08:05:00', '16:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4148, 'P000003', '2023-01-03', 'W', '09:00:00', '17:56:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4149, 'P000005', '2023-01-03', 'W', '08:56:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4150, 'P000004', '2023-01-03', 'W', '07:50:00', '18:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4151, 'P000002', '2023-01-03', 'W', '07:16:00', '18:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4152, 'P000007', '2023-01-03', 'W', '08:05:00', '16:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4153, 'P000006', '2023-01-03', 'W', '08:35:00', '17:51:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4154, 'P000005', '2023-01-03', 'W', '08:56:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4155, '800', '2023-01-03', 'W', '08:28:00', '19:15:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4156, 'P000004', '2023-01-03', 'W', '07:50:00', '18:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4157, 'P000003', '2023-01-03', 'W', '09:00:00', '17:56:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4158, 'P000002', '2023-01-03', 'W', '07:16:00', '18:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4159, 'P000007', '2023-01-03', 'W', '08:05:00', '16:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4160, 'P000006', '2023-01-03', 'W', '08:35:00', '17:51:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4161, '800', '2023-01-03', 'W', '08:28:00', '19:15:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4162, 'P000002', '2023-01-03', 'W', '07:16:00', '18:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4163, 'P000005', '2023-01-03', 'W', '08:56:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4164, 'P000006', '2023-01-03', 'W', '08:35:00', '17:51:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4165, 'P000004', '2023-01-03', 'W', '07:50:00', '18:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4166, 'P000003', '2023-01-03', 'W', '09:00:00', '17:56:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4167, 'P000007', '2023-01-03', 'W', '08:05:00', '16:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4168, '800', '2023-01-03', 'W', '08:28:00', '19:15:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4169, 'P000002', '2023-01-03', 'W', '07:16:00', '18:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4170, 'P000005', '2023-01-03', 'W', '08:56:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4171, 'P000004', '2023-01-03', 'W', '07:50:00', '18:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4172, 'P000003', '2023-01-03', 'W', '09:00:00', '17:56:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4173, 'P000005', '2023-01-04', 'W', '08:42:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4174, 'P000006', '2023-01-04', 'W', '08:33:00', '19:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4175, 'P000007', '2023-01-04', 'W', '08:02:00', '16:35:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4176, 'P000004', '2023-01-04', 'W', '06:02:00', '18:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4177, 'P000003', '2023-01-04', 'W', '09:12:00', '18:04:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4178, 'P000002', '2023-01-04', 'W', '06:09:00', '18:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4179, '800', '2023-01-04', 'W', '08:32:00', '19:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4180, 'P000006', '2023-01-04', 'W', '08:33:00', '19:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4181, 'P000007', '2023-01-04', 'W', '08:02:00', '16:35:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4182, 'P000002', '2023-01-04', 'W', '06:09:00', '18:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4183, 'P000005', '2023-01-04', 'W', '08:42:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4184, '800', '2023-01-04', 'W', '08:32:00', '19:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4185, 'P000004', '2023-01-04', 'W', '06:02:00', '18:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4186, 'P000003', '2023-01-04', 'W', '09:12:00', '18:04:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4187, 'P000006', '2023-01-04', 'W', '08:33:00', '19:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4188, 'P000002', '2023-01-04', 'W', '06:09:00', '18:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4189, 'P000005', '2023-01-04', 'W', '08:42:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4190, '800', '2023-01-04', 'W', '08:32:00', '19:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4191, 'P000004', '2023-01-04', 'W', '06:02:00', '18:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4192, 'P000003', '2023-01-04', 'W', '09:12:00', '18:04:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4193, 'P000007', '2023-01-04', 'W', '08:02:00', '16:35:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4194, 'P000002', '2023-01-04', 'W', '06:09:00', '18:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4195, 'P000005', '2023-01-04', 'W', '08:42:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4196, '800', '2023-01-04', 'W', '08:32:00', '19:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4197, 'P000006', '2023-01-04', 'W', '08:33:00', '19:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4198, 'P000004', '2023-01-04', 'W', '06:02:00', '18:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4199, 'P000003', '2023-01-04', 'W', '09:12:00', '18:04:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4200, 'P000007', '2023-01-04', 'W', '08:02:00', '16:35:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4201, '800', '2023-01-04', 'W', '08:32:00', '19:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4202, 'P000004', '2023-01-04', 'W', '06:02:00', '18:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4203, 'P000006', '2023-01-04', 'W', '08:33:00', '19:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4204, 'P000003', '2023-01-04', 'W', '09:12:00', '18:04:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4205, 'P000005', '2023-01-04', 'W', '08:42:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4206, 'P000007', '2023-01-04', 'W', '08:02:00', '16:35:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4207, 'P000002', '2023-01-04', 'W', '06:09:00', '18:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4208, '800', '2023-01-04', 'W', '08:32:00', '19:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4209, 'P000003', '2023-01-04', 'W', '09:12:00', '18:04:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4210, 'P000006', '2023-01-04', 'W', '08:33:00', '19:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4211, 'P000005', '2023-01-04', 'W', '08:42:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4212, 'P000007', '2023-01-04', 'W', '08:02:00', '16:35:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4213, 'P000004', '2023-01-04', 'W', '06:02:00', '18:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4214, 'P000002', '2023-01-04', 'W', '06:09:00', '18:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4215, '1', '2023-01-05', 'W', '06:58:00', '18:46:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4216, 'P000002', '2023-01-05', 'W', '06:22:00', '21:12:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4217, 'P000007', '2023-01-05', 'W', '08:05:00', '16:55:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4218, 'P000003', '2023-01-05', 'W', '09:13:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4219, 'P000005', '2023-01-05', 'W', '08:51:00', '18:05:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4220, 'P000004', '2023-01-05', 'W', '06:01:00', '17:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4221, '800', '2023-01-05', 'W', '08:29:00', '19:44:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4222, 'P000006', '2023-01-05', 'W', '08:27:00', '19:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4223, '1', '2023-01-05', 'W', '06:58:00', '18:46:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4224, 'P000007', '2023-01-05', 'W', '08:05:00', '16:55:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4225, 'P000004', '2023-01-05', 'W', '06:01:00', '17:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4226, 'P000003', '2023-01-05', 'W', '09:13:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4227, 'P000005', '2023-01-05', 'W', '08:51:00', '18:05:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4228, '800', '2023-01-05', 'W', '08:29:00', '19:44:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4229, 'P000006', '2023-01-05', 'W', '08:27:00', '19:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4230, 'P000002', '2023-01-05', 'W', '06:22:00', '21:12:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4231, '1', '2023-01-05', 'W', '06:58:00', '18:46:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4232, 'P000007', '2023-01-05', 'W', '08:05:00', '16:55:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4233, 'P000003', '2023-01-05', 'W', '09:13:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4234, 'P000005', '2023-01-05', 'W', '08:51:00', '18:05:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4235, '800', '2023-01-05', 'W', '08:29:00', '19:44:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4236, 'P000006', '2023-01-05', 'W', '08:27:00', '19:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4237, 'P000004', '2023-01-05', 'W', '06:01:00', '17:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4238, '1', '2023-01-05', 'W', '06:58:00', '18:46:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4239, 'P000002', '2023-01-05', 'W', '06:22:00', '21:12:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4240, 'P000007', '2023-01-05', 'W', '08:05:00', '16:55:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4241, 'P000003', '2023-01-05', 'W', '09:13:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4242, 'P000005', '2023-01-05', 'W', '08:51:00', '18:05:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4243, 'P000004', '2023-01-05', 'W', '06:01:00', '17:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4244, 'P000002', '2023-01-05', 'W', '06:22:00', '21:12:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4245, 'P000006', '2023-01-05', 'W', '08:27:00', '19:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4246, 'P000007', '2023-01-05', 'W', '08:05:00', '16:55:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4247, 'P000003', '2023-01-05', 'W', '09:13:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4248, '800', '2023-01-05', 'W', '08:29:00', '19:44:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4249, '1', '2023-01-05', 'W', '06:58:00', '18:46:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4250, 'P000002', '2023-01-05', 'W', '06:22:00', '21:12:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4251, 'P000005', '2023-01-05', 'W', '08:51:00', '18:05:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4252, 'P000006', '2023-01-05', 'W', '08:27:00', '19:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4253, 'P000004', '2023-01-05', 'W', '06:01:00', '17:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4254, 'P000007', '2023-01-05', 'W', '08:05:00', '16:55:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4255, '800', '2023-01-05', 'W', '08:29:00', '19:44:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4256, '1', '2023-01-05', 'W', '06:58:00', '18:46:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4257, 'P000003', '2023-01-05', 'W', '09:13:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4258, 'P000002', '2023-01-05', 'W', '06:22:00', '21:12:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4259, 'P000006', '2023-01-05', 'W', '08:27:00', '19:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4260, 'P000005', '2023-01-05', 'W', '08:51:00', '18:05:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4261, 'P000004', '2023-01-05', 'W', '06:01:00', '17:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4262, '800', '2023-01-05', 'W', '08:29:00', '19:44:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4263, 'P000007', '2023-01-06', 'W', '08:05:00', '16:42:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4264, 'P000004', '2023-01-06', 'W', '06:26:00', '18:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4265, 'P000002', '2023-01-06', 'W', '06:26:00', '18:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4266, 'P000003', '2023-01-06', 'W', '09:10:00', '18:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4267, '1', '2023-01-06', 'W', '07:48:00', '17:43:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4268, 'P000006', '2023-01-06', 'W', '08:28:00', '17:26:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4269, 'P000007', '2023-01-06', 'W', '08:05:00', '16:42:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4270, '800', '2023-01-06', 'W', '08:18:00', '17:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4271, 'P000002', '2023-01-06', 'W', '06:26:00', '18:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4272, 'P000005', '2023-01-06', 'W', '08:53:00', '18:25:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4273, 'P000003', '2023-01-06', 'W', '09:10:00', '18:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4274, 'P000004', '2023-01-06', 'W', '06:26:00', '18:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4275, '1', '2023-01-06', 'W', '07:48:00', '17:43:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4276, 'P000006', '2023-01-06', 'W', '08:28:00', '17:26:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4277, 'P000007', '2023-01-06', 'W', '08:05:00', '16:42:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4278, 'P000002', '2023-01-06', 'W', '06:26:00', '18:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4279, 'P000003', '2023-01-06', 'W', '09:10:00', '18:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4280, '800', '2023-01-06', 'W', '08:18:00', '17:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4281, 'P000005', '2023-01-06', 'W', '08:53:00', '18:25:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4282, 'P000004', '2023-01-06', 'W', '06:26:00', '18:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4283, 'P000006', '2023-01-06', 'W', '08:28:00', '17:26:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4284, '1', '2023-01-06', 'W', '07:48:00', '17:43:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4285, 'P000002', '2023-01-06', 'W', '06:26:00', '18:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4286, '800', '2023-01-06', 'W', '08:18:00', '17:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4287, 'P000005', '2023-01-06', 'W', '08:53:00', '18:25:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4288, 'P000004', '2023-01-06', 'W', '06:26:00', '18:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4289, '1', '2023-01-06', 'W', '07:48:00', '17:43:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4290, 'P000007', '2023-01-06', 'W', '08:05:00', '16:42:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4291, 'P000003', '2023-01-06', 'W', '09:10:00', '18:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4292, '800', '2023-01-06', 'W', '08:18:00', '17:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4293, 'P000006', '2023-01-06', 'W', '08:28:00', '17:26:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4294, 'P000004', '2023-01-06', 'W', '06:26:00', '18:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4295, 'P000005', '2023-01-06', 'W', '08:53:00', '18:25:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4296, 'P000007', '2023-01-06', 'W', '08:05:00', '16:42:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4297, 'P000002', '2023-01-06', 'W', '06:26:00', '18:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4298, 'P000003', '2023-01-06', 'W', '09:10:00', '18:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4299, '800', '2023-01-06', 'W', '08:18:00', '17:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4300, '1', '2023-01-06', 'W', '07:48:00', '17:43:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4301, 'P000006', '2023-01-06', 'W', '08:28:00', '17:26:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4302, 'P000005', '2023-01-06', 'W', '08:53:00', '18:25:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4303, 'P000007', '2023-01-06', 'W', '08:05:00', '16:42:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4304, 'P000004', '2023-01-06', 'W', '06:26:00', '18:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4305, 'P000002', '2023-01-06', 'W', '06:26:00', '18:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4306, 'P000003', '2023-01-06', 'W', '09:10:00', '18:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4307, '800', '2023-01-06', 'W', '08:18:00', '17:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4308, 'P000006', '2023-01-06', 'W', '08:28:00', '17:26:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4309, 'P000005', '2023-01-06', 'W', '08:53:00', '18:25:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4310, '1', '2023-01-06', 'W', '07:48:00', '17:43:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4311, 'P000004', '2023-01-07', 'W', '06:19:00', '15:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4312, '800', '2023-01-07', 'W', '08:52:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4313, '1', '2023-01-07', 'W', '06:36:00', '15:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4314, 'P000007', '2023-01-07', 'W', '08:32:00', '15:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4315, 'P000004', '2023-01-07', 'W', '06:19:00', '15:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4316, 'P000003', '2023-01-07', 'W', '14:50:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4317, '800', '2023-01-07', 'W', '08:52:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4318, 'P000006', '2023-01-07', 'W', '09:01:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4319, '1', '2023-01-07', 'W', '06:36:00', '15:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4320, 'P000002', '2023-01-07', 'W', '07:56:00', '16:11:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4321, 'P000007', '2023-01-07', 'W', '08:32:00', '15:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4322, '800', '2023-01-07', 'W', '08:52:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4323, 'P000003', '2023-01-07', 'W', '14:50:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4324, 'P000006', '2023-01-07', 'W', '09:01:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4325, 'P000004', '2023-01-07', 'W', '06:19:00', '15:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4326, '1', '2023-01-07', 'W', '06:36:00', '15:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4327, 'P000002', '2023-01-07', 'W', '07:56:00', '16:11:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4328, 'P000007', '2023-01-07', 'W', '08:32:00', '15:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4329, '800', '2023-01-07', 'W', '08:52:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4330, 'P000006', '2023-01-07', 'W', '09:01:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4331, '1', '2023-01-07', 'W', '06:36:00', '15:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4332, 'P000003', '2023-01-07', 'W', '14:50:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4333, 'P000004', '2023-01-07', 'W', '06:19:00', '15:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4334, 'P000002', '2023-01-07', 'W', '07:56:00', '16:11:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4335, 'P000007', '2023-01-07', 'W', '08:32:00', '15:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4336, 'P000006', '2023-01-07', 'W', '09:01:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4337, 'P000003', '2023-01-07', 'W', '14:50:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4338, 'P000007', '2023-01-07', 'W', '08:32:00', '15:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4339, 'P000002', '2023-01-07', 'W', '07:56:00', '16:11:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4340, 'P000004', '2023-01-07', 'W', '06:19:00', '15:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4341, '800', '2023-01-07', 'W', '08:52:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4342, '1', '2023-01-07', 'W', '06:36:00', '15:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4343, 'P000002', '2023-01-07', 'W', '07:56:00', '16:11:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4344, 'P000003', '2023-01-07', 'W', '14:50:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4345, 'P000006', '2023-01-07', 'W', '09:01:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4346, 'P000007', '2023-01-07', 'W', '08:32:00', '15:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4347, 'P000004', '2023-01-07', 'W', '06:19:00', '15:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4348, '800', '2023-01-07', 'W', '08:52:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4349, '1', '2023-01-07', 'W', '06:36:00', '15:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4350, 'P000003', '2023-01-07', 'W', '14:50:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4351, 'P000006', '2023-01-07', 'W', '09:01:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4352, 'P000002', '2023-01-07', 'W', '07:56:00', '16:11:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4353, 'P000005', '2023-01-09', 'W', '08:49:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4354, '800', '2023-01-09', 'W', '08:30:00', '19:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4355, 'P000004', '2023-01-09', 'W', '07:26:00', '18:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4356, 'P000007', '2023-01-09', 'W', '08:05:00', '16:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4357, 'P000006', '2023-01-09', 'W', '19:08:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4358, 'P000003', '2023-01-09', 'W', '08:58:00', '18:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4359, 'P000002', '2023-01-09', 'W', '06:23:00', '21:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4360, '1', '2023-01-09', 'W', '08:40:00', '18:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4361, 'P000005', '2023-01-09', 'W', '08:49:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4362, 'P000006', '2023-01-09', 'W', '19:08:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4363, 'P000002', '2023-01-09', 'W', '06:23:00', '21:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4364, 'P000003', '2023-01-09', 'W', '08:58:00', '18:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4365, 'P000004', '2023-01-09', 'W', '07:26:00', '18:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4366, 'P000007', '2023-01-09', 'W', '08:05:00', '16:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4367, '800', '2023-01-09', 'W', '08:30:00', '19:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4368, 'P000005', '2023-01-09', 'W', '08:49:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4369, '1', '2023-01-09', 'W', '08:40:00', '18:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4370, 'P000006', '2023-01-09', 'W', '19:08:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4371, 'P000002', '2023-01-09', 'W', '06:23:00', '21:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4372, 'P000003', '2023-01-09', 'W', '08:58:00', '18:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4373, 'P000004', '2023-01-09', 'W', '07:26:00', '18:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4374, 'P000007', '2023-01-09', 'W', '08:05:00', '16:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4375, '800', '2023-01-09', 'W', '08:30:00', '19:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4376, 'P000005', '2023-01-09', 'W', '08:49:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4377, 'P000006', '2023-01-09', 'W', '19:08:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4378, '1', '2023-01-09', 'W', '08:40:00', '18:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4379, 'P000003', '2023-01-09', 'W', '08:58:00', '18:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4380, 'P000007', '2023-01-09', 'W', '08:05:00', '16:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4381, '800', '2023-01-09', 'W', '08:30:00', '19:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4382, 'P000004', '2023-01-09', 'W', '07:26:00', '18:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4383, 'P000002', '2023-01-09', 'W', '06:23:00', '21:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4384, '1', '2023-01-09', 'W', '08:40:00', '18:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4385, 'P000005', '2023-01-09', 'W', '08:49:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4386, 'P000003', '2023-01-09', 'W', '08:58:00', '18:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4387, 'P000007', '2023-01-09', 'W', '08:05:00', '16:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4388, '800', '2023-01-09', 'W', '08:30:00', '19:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4389, 'P000006', '2023-01-09', 'W', '19:08:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4390, 'P000004', '2023-01-09', 'W', '07:26:00', '18:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4391, 'P000002', '2023-01-09', 'W', '06:23:00', '21:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4392, 'P000003', '2023-01-09', 'W', '08:58:00', '18:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4393, '1', '2023-01-09', 'W', '08:40:00', '18:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4394, 'P000005', '2023-01-09', 'W', '08:49:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4395, '800', '2023-01-09', 'W', '08:30:00', '19:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4396, 'P000006', '2023-01-09', 'W', '19:08:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4397, 'P000004', '2023-01-09', 'W', '07:26:00', '18:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4398, 'P000007', '2023-01-09', 'W', '08:05:00', '16:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4399, 'P000002', '2023-01-09', 'W', '06:23:00', '21:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4400, '1', '2023-01-09', 'W', '08:40:00', '18:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4401, 'P000002', '2023-01-10', 'W', '06:09:00', '17:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4402, 'P000006', '2023-01-10', 'W', '19:24:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4403, '1', '2023-01-10', 'W', '06:36:00', '17:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4404, 'P000003', '2023-01-10', 'W', '08:51:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4405, 'P000004', '2023-01-10', 'W', '05:58:00', '19:22:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4406, '800', '2023-01-10', 'W', '08:26:00', '19:48:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4407, 'P000005', '2023-01-10', 'W', '08:48:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4408, 'P000007', '2023-01-10', 'W', '08:06:00', '16:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4409, 'P000002', '2023-01-10', 'W', '06:09:00', '17:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4410, 'P000006', '2023-01-10', 'W', '19:24:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4411, 'P000003', '2023-01-10', 'W', '08:51:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4412, 'P000004', '2023-01-10', 'W', '05:58:00', '19:22:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4413, '800', '2023-01-10', 'W', '08:26:00', '19:48:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4414, '1', '2023-01-10', 'W', '06:36:00', '17:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4415, 'P000007', '2023-01-10', 'W', '08:06:00', '16:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4416, 'P000006', '2023-01-10', 'W', '19:24:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4417, 'P000005', '2023-01-10', 'W', '08:48:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4418, 'P000003', '2023-01-10', 'W', '08:51:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4419, '800', '2023-01-10', 'W', '08:26:00', '19:48:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4420, 'P000002', '2023-01-10', 'W', '06:09:00', '17:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4421, 'P000004', '2023-01-10', 'W', '05:58:00', '19:22:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4422, 'P000007', '2023-01-10', 'W', '08:06:00', '16:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4423, '1', '2023-01-10', 'W', '06:36:00', '17:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4424, 'P000003', '2023-01-10', 'W', '08:51:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4425, 'P000006', '2023-01-10', 'W', '19:24:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4426, 'P000005', '2023-01-10', 'W', '08:48:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4427, '800', '2023-01-10', 'W', '08:26:00', '19:48:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4428, 'P000002', '2023-01-10', 'W', '06:09:00', '17:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4429, 'P000004', '2023-01-10', 'W', '05:58:00', '19:22:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4430, '1', '2023-01-10', 'W', '06:36:00', '17:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4431, 'P000007', '2023-01-10', 'W', '08:06:00', '16:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4432, 'P000006', '2023-01-10', 'W', '19:24:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4433, 'P000005', '2023-01-10', 'W', '08:48:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4434, 'P000003', '2023-01-10', 'W', '08:51:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4435, 'P000002', '2023-01-10', 'W', '06:09:00', '17:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4436, 'P000004', '2023-01-10', 'W', '05:58:00', '19:22:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4437, 'P000007', '2023-01-10', 'W', '08:06:00', '16:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4438, '1', '2023-01-10', 'W', '06:36:00', '17:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4439, 'P000006', '2023-01-10', 'W', '19:24:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4440, '800', '2023-01-10', 'W', '08:26:00', '19:48:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4441, 'P000005', '2023-01-10', 'W', '08:48:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4442, 'P000004', '2023-01-10', 'W', '05:58:00', '19:22:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4443, 'P000003', '2023-01-10', 'W', '08:51:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4444, 'P000002', '2023-01-10', 'W', '06:09:00', '17:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4445, '1', '2023-01-10', 'W', '06:36:00', '17:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4446, '800', '2023-01-10', 'W', '08:26:00', '19:48:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4447, 'P000007', '2023-01-10', 'W', '08:06:00', '16:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4448, 'P000005', '2023-01-10', 'W', '08:48:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4449, 'P000005', '2023-01-11', 'W', '08:58:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4450, 'P000003', '2023-01-11', 'W', '09:01:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4451, 'P000006', '2023-01-11', 'W', '08:43:00', '18:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4452, 'P000004', '2023-01-11', 'W', '06:08:00', '19:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4453, 'P000007', '2023-01-11', 'W', '08:02:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4454, '800', '2023-01-11', 'W', '08:26:00', '20:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4455, 'P000002', '2023-01-11', 'W', '06:07:00', '21:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4456, '1', '2023-01-11', 'W', '06:57:00', '18:47:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4457, 'P000003', '2023-01-11', 'W', '09:01:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4458, 'P000006', '2023-01-11', 'W', '08:43:00', '18:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4459, 'P000005', '2023-01-11', 'W', '08:58:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4460, 'P000004', '2023-01-11', 'W', '06:08:00', '19:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4461, 'P000007', '2023-01-11', 'W', '08:02:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4462, '800', '2023-01-11', 'W', '08:26:00', '20:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4463, 'P000002', '2023-01-11', 'W', '06:07:00', '21:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4464, 'P000004', '2023-01-11', 'W', '06:08:00', '19:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4465, '1', '2023-01-11', 'W', '06:57:00', '18:47:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4466, 'P000005', '2023-01-11', 'W', '08:58:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4467, 'P000007', '2023-01-11', 'W', '08:02:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4468, '800', '2023-01-11', 'W', '08:26:00', '20:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4469, 'P000003', '2023-01-11', 'W', '09:01:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4470, 'P000002', '2023-01-11', 'W', '06:07:00', '21:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4471, 'P000006', '2023-01-11', 'W', '08:43:00', '18:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4472, '1', '2023-01-11', 'W', '06:57:00', '18:47:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4473, 'P000005', '2023-01-11', 'W', '08:58:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4474, 'P000002', '2023-01-11', 'W', '06:07:00', '21:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4475, '800', '2023-01-11', 'W', '08:26:00', '20:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4476, 'P000007', '2023-01-11', 'W', '08:02:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4477, 'P000006', '2023-01-11', 'W', '08:43:00', '18:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4478, 'P000004', '2023-01-11', 'W', '06:08:00', '19:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4479, 'P000003', '2023-01-11', 'W', '09:01:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4480, '1', '2023-01-11', 'W', '06:57:00', '18:47:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4481, 'P000005', '2023-01-11', 'W', '08:58:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4482, '800', '2023-01-11', 'W', '08:26:00', '20:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4483, 'P000007', '2023-01-11', 'W', '08:02:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4484, 'P000002', '2023-01-11', 'W', '06:07:00', '21:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4485, 'P000006', '2023-01-11', 'W', '08:43:00', '18:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4486, 'P000004', '2023-01-11', 'W', '06:08:00', '19:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4487, 'P000003', '2023-01-11', 'W', '09:01:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4488, '1', '2023-01-11', 'W', '06:57:00', '18:47:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4489, '800', '2023-01-11', 'W', '08:26:00', '20:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4490, 'P000005', '2023-01-11', 'W', '08:58:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4491, 'P000003', '2023-01-11', 'W', '09:01:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4492, 'P000006', '2023-01-11', 'W', '08:43:00', '18:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4493, 'P000004', '2023-01-11', 'W', '06:08:00', '19:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4494, '1', '2023-01-11', 'W', '06:57:00', '18:47:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4495, 'P000007', '2023-01-11', 'W', '08:02:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-01 00:00:00'),
	(4496, 'P000002', '2023-01-11', 'W', '06:07:00', '21:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4497, 'P000004', '2023-01-12', 'W', '06:19:00', '19:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4498, 'P000003', '2023-01-12', 'W', '09:01:00', '18:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4499, 'P000002', '2023-01-12', 'W', '06:15:00', '21:24:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4500, '800', '2023-01-12', 'W', '08:22:00', '20:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4501, 'P000007', '2023-01-12', 'W', '08:06:00', '16:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4502, 'P000006', '2023-01-12', 'W', '08:35:00', '19:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4503, 'P000005', '2023-01-12', 'W', '08:46:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4504, 'P000002', '2023-01-12', 'W', '06:15:00', '21:24:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4505, 'P000004', '2023-01-12', 'W', '06:19:00', '19:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4506, 'P000003', '2023-01-12', 'W', '09:01:00', '18:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4507, '1', '2023-01-12', 'W', '06:15:00', '18:38:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4508, '800', '2023-01-12', 'W', '08:22:00', '20:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4509, 'P000007', '2023-01-12', 'W', '08:06:00', '16:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4510, 'P000006', '2023-01-12', 'W', '08:35:00', '19:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4511, 'P000005', '2023-01-12', 'W', '08:46:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4512, 'P000002', '2023-01-12', 'W', '06:15:00', '21:24:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4513, 'P000004', '2023-01-12', 'W', '06:19:00', '19:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4514, 'P000003', '2023-01-12', 'W', '09:01:00', '18:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4515, 'P000005', '2023-01-12', 'W', '08:46:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4516, '1', '2023-01-12', 'W', '06:15:00', '18:38:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4517, 'P000007', '2023-01-12', 'W', '08:06:00', '16:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4518, 'P000006', '2023-01-12', 'W', '08:35:00', '19:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4519, 'P000002', '2023-01-12', 'W', '06:15:00', '21:24:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4520, 'P000004', '2023-01-12', 'W', '06:19:00', '19:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4521, 'P000003', '2023-01-12', 'W', '09:01:00', '18:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4522, '800', '2023-01-12', 'W', '08:22:00', '20:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4523, '1', '2023-01-12', 'W', '06:15:00', '18:38:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4524, 'P000007', '2023-01-12', 'W', '08:06:00', '16:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4525, 'P000006', '2023-01-12', 'W', '08:35:00', '19:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4526, 'P000004', '2023-01-12', 'W', '06:19:00', '19:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4527, 'P000005', '2023-01-12', 'W', '08:46:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4528, 'P000003', '2023-01-12', 'W', '09:01:00', '18:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4529, '800', '2023-01-12', 'W', '08:22:00', '20:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4530, '1', '2023-01-12', 'W', '06:15:00', '18:38:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4531, 'P000002', '2023-01-12', 'W', '06:15:00', '21:24:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4532, 'P000006', '2023-01-12', 'W', '08:35:00', '19:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4533, 'P000003', '2023-01-12', 'W', '09:01:00', '18:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4534, 'P000005', '2023-01-12', 'W', '08:46:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4535, '800', '2023-01-12', 'W', '08:22:00', '20:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4536, 'P000007', '2023-01-12', 'W', '08:06:00', '16:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4537, 'P000004', '2023-01-12', 'W', '06:19:00', '19:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4538, '1', '2023-01-12', 'W', '06:15:00', '18:38:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4539, 'P000002', '2023-01-12', 'W', '06:15:00', '21:24:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4540, '800', '2023-01-12', 'W', '08:22:00', '20:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4541, 'P000007', '2023-01-12', 'W', '08:06:00', '16:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4542, 'P000006', '2023-01-12', 'W', '08:35:00', '19:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4543, 'P000005', '2023-01-12', 'W', '08:46:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4544, '1', '2023-01-12', 'W', '06:15:00', '18:38:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4545, 'P000007', '2023-01-13', 'W', '08:01:00', '17:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4546, '800', '2023-01-13', 'W', '08:17:00', '19:36:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4547, 'P000004', '2023-01-13', 'W', '06:02:00', '19:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4548, 'P000003', '2023-01-13', 'W', '08:58:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4549, 'P000006', '2023-01-13', 'W', '08:34:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4550, 'P000007', '2023-01-13', 'W', '08:01:00', '17:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4551, 'P000005', '2023-01-13', 'W', '08:39:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4552, '800', '2023-01-13', 'W', '08:17:00', '19:36:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4553, 'P000002', '2023-01-13', 'W', '06:17:00', '07:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4554, 'P000003', '2023-01-13', 'W', '08:58:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4555, 'P000006', '2023-01-13', 'W', '08:34:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4556, 'P000007', '2023-01-13', 'W', '08:01:00', '17:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4557, 'P000005', '2023-01-13', 'W', '08:39:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4558, 'P000004', '2023-01-13', 'W', '06:02:00', '19:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4559, '800', '2023-01-13', 'W', '08:17:00', '19:36:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4560, 'P000002', '2023-01-13', 'W', '06:17:00', '07:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4561, 'P000004', '2023-01-13', 'W', '06:02:00', '19:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4562, 'P000003', '2023-01-13', 'W', '08:58:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4563, '800', '2023-01-13', 'W', '08:17:00', '19:36:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4564, 'P000002', '2023-01-13', 'W', '06:17:00', '07:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4565, 'P000006', '2023-01-13', 'W', '08:34:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4566, 'P000007', '2023-01-13', 'W', '08:01:00', '17:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4567, 'P000005', '2023-01-13', 'W', '08:39:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4568, '800', '2023-01-13', 'W', '08:17:00', '19:36:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4569, 'P000007', '2023-01-13', 'W', '08:01:00', '17:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4570, 'P000002', '2023-01-13', 'W', '06:17:00', '07:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4571, 'P000006', '2023-01-13', 'W', '08:34:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4572, 'P000005', '2023-01-13', 'W', '08:39:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4573, 'P000004', '2023-01-13', 'W', '06:02:00', '19:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4574, 'P000003', '2023-01-13', 'W', '08:58:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4575, '800', '2023-01-13', 'W', '08:17:00', '19:36:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4576, 'P000002', '2023-01-13', 'W', '06:17:00', '07:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4577, 'P000006', '2023-01-13', 'W', '08:34:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4578, 'P000005', '2023-01-13', 'W', '08:39:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4579, 'P000004', '2023-01-13', 'W', '06:02:00', '19:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4580, 'P000003', '2023-01-13', 'W', '08:58:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4581, 'P000007', '2023-01-13', 'W', '08:01:00', '17:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4582, 'P000002', '2023-01-13', 'W', '06:17:00', '07:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4583, 'P000005', '2023-01-13', 'W', '08:39:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4584, 'P000004', '2023-01-13', 'W', '06:02:00', '19:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4585, 'P000003', '2023-01-13', 'W', '08:58:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4586, 'P000006', '2023-01-13', 'W', '08:34:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4587, '800', '2023-01-14', 'W', '08:51:00', '16:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4588, 'P000006', '2023-01-14', 'W', '08:56:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4589, 'P000007', '2023-01-14', 'W', '08:31:00', '15:52:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4590, 'P000004', '2023-01-14', 'W', '06:38:00', '15:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4591, 'P000003', '2023-01-14', 'W', '09:07:00', '14:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4592, '800', '2023-01-14', 'W', '08:51:00', '16:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4593, 'P000006', '2023-01-14', 'W', '08:56:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4594, 'P000004', '2023-01-14', 'W', '06:38:00', '15:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4595, 'P000003', '2023-01-14', 'W', '09:07:00', '14:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4596, '800', '2023-01-14', 'W', '08:51:00', '16:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4597, 'P000006', '2023-01-14', 'W', '08:56:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4598, 'P000007', '2023-01-14', 'W', '08:31:00', '15:52:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4599, 'P000004', '2023-01-14', 'W', '06:38:00', '15:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4600, 'P000003', '2023-01-14', 'W', '09:07:00', '14:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4601, 'P000007', '2023-01-14', 'W', '08:31:00', '15:52:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4602, 'P000006', '2023-01-14', 'W', '08:56:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4603, 'P000004', '2023-01-14', 'W', '06:38:00', '15:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4604, '800', '2023-01-14', 'W', '08:51:00', '16:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4605, 'P000003', '2023-01-14', 'W', '09:07:00', '14:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4606, 'P000007', '2023-01-14', 'W', '08:31:00', '15:52:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4607, 'P000006', '2023-01-14', 'W', '08:56:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4608, 'P000003', '2023-01-14', 'W', '09:07:00', '14:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4609, '800', '2023-01-14', 'W', '08:51:00', '16:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4610, 'P000007', '2023-01-14', 'W', '08:31:00', '15:52:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4611, 'P000004', '2023-01-14', 'W', '06:38:00', '15:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4612, 'P000006', '2023-01-14', 'W', '08:56:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4613, '800', '2023-01-14', 'W', '08:51:00', '16:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4614, 'P000004', '2023-01-14', 'W', '06:38:00', '15:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4615, 'P000003', '2023-01-14', 'W', '09:07:00', '14:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4616, 'P000007', '2023-01-14', 'W', '08:31:00', '15:52:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:12', '2023-01-24 15:56:46'),
	(4618, 'P000004', '2023-01-02', 'W', '07:37:00', '18:19:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4619, 'P000007', '2023-01-02', 'W', '08:02:00', '16:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4620, 'P000003', '2023-01-02', 'W', '09:04:00', '23:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4621, 'P000002', '2023-01-02', 'W', '06:25:00', '20:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4622, 'P000006', '2023-01-03', 'W', '08:35:00', '17:51:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4623, 'P000002', '2023-01-03', 'W', '07:16:00', '18:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4624, 'P000007', '2023-01-03', 'W', '08:05:00', '16:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4625, 'P000004', '2023-01-03', 'W', '07:50:00', '18:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4626, '800', '2023-01-03', 'W', '08:28:00', '19:15:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4627, 'P000003', '2023-01-03', 'W', '09:00:00', '17:56:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4628, 'P000005', '2023-01-03', 'W', '08:56:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4629, 'P000003', '2023-01-04', 'W', '09:12:00', '18:04:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4630, '800', '2023-01-04', 'W', '08:32:00', '19:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4631, 'P000005', '2023-01-04', 'W', '08:42:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4632, 'P000007', '2023-01-04', 'W', '08:02:00', '16:35:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4633, 'P000006', '2023-01-04', 'W', '08:33:00', '19:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4634, 'P000002', '2023-01-04', 'W', '06:09:00', '18:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4635, 'P000004', '2023-01-04', 'W', '06:02:00', '18:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4636, 'P000007', '2023-01-05', 'W', '08:05:00', '16:55:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4637, 'P000006', '2023-01-05', 'W', '08:27:00', '19:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4638, 'P000002', '2023-01-05', 'W', '06:22:00', '21:12:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4639, 'P000004', '2023-01-05', 'W', '06:01:00', '17:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4640, '800', '2023-01-05', 'W', '08:29:00', '19:44:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4641, '1', '2023-01-05', 'W', '06:58:00', '18:46:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4642, 'P000005', '2023-01-05', 'W', '08:51:00', '18:05:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4643, 'P000003', '2023-01-05', 'W', '09:13:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4644, '800', '2023-01-06', 'W', '08:18:00', '17:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4645, 'P000005', '2023-01-06', 'W', '08:53:00', '18:25:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4646, 'P000007', '2023-01-06', 'W', '08:05:00', '16:42:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4647, 'P000003', '2023-01-06', 'W', '09:10:00', '18:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4648, 'P000006', '2023-01-06', 'W', '08:28:00', '17:26:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4649, 'P000002', '2023-01-06', 'W', '06:26:00', '18:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4650, '1', '2023-01-06', 'W', '07:48:00', '17:43:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4651, 'P000004', '2023-01-06', 'W', '06:26:00', '18:27:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4652, 'P000007', '2023-01-07', 'W', '08:32:00', '15:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4653, 'P000003', '2023-01-07', 'W', '14:50:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-01 00:00:00'),
	(4654, 'P000006', '2023-01-07', 'W', '09:01:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4655, 'P000002', '2023-01-07', 'W', '07:56:00', '16:11:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4656, 'P000004', '2023-01-07', 'W', '06:19:00', '15:08:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4657, '800', '2023-01-07', 'W', '08:52:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4658, '1', '2023-01-07', 'W', '06:36:00', '15:03:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4659, 'P000003', '2023-01-09', 'W', '08:58:00', '18:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4660, 'P000004', '2023-01-09', 'W', '07:26:00', '18:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4661, 'P000007', '2023-01-09', 'W', '08:05:00', '16:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4662, '800', '2023-01-09', 'W', '08:30:00', '19:28:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4663, '1', '2023-01-09', 'W', '08:40:00', '18:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4664, 'P000002', '2023-01-09', 'W', '06:23:00', '21:01:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4665, 'P000005', '2023-01-09', 'W', '08:49:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4666, 'P000006', '2023-01-09', 'W', '19:08:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-01 00:00:00'),
	(4667, 'P000006', '2023-01-10', 'W', '19:24:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-01 00:00:00'),
	(4668, 'P000004', '2023-01-10', 'W', '05:58:00', '19:22:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4669, '1', '2023-01-10', 'W', '06:36:00', '17:50:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4670, 'P000005', '2023-01-10', 'W', '08:48:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4671, 'P000002', '2023-01-10', 'W', '06:09:00', '17:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4672, 'P000003', '2023-01-10', 'W', '08:51:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4673, '800', '2023-01-10', 'W', '08:26:00', '19:48:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4674, 'P000007', '2023-01-10', 'W', '08:06:00', '16:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4675, '800', '2023-01-11', 'W', '08:26:00', '20:17:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4676, '1', '2023-01-11', 'W', '06:57:00', '18:47:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4677, 'P000003', '2023-01-11', 'W', '09:01:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4678, 'P000006', '2023-01-11', 'W', '08:43:00', '18:49:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4679, 'P000004', '2023-01-11', 'W', '06:08:00', '19:14:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4680, 'P000005', '2023-01-11', 'W', '08:58:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4681, 'P000007', '2023-01-11', 'W', '08:02:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-01 00:00:00'),
	(4682, 'P000002', '2023-01-11', 'W', '06:07:00', '21:13:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4683, 'P000003', '2023-01-12', 'W', '09:01:00', '18:16:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4684, '1', '2023-01-12', 'W', '06:15:00', '18:38:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4685, '800', '2023-01-12', 'W', '08:22:00', '20:40:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4686, 'P000005', '2023-01-12', 'W', '08:46:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4687, 'P000002', '2023-01-12', 'W', '06:15:00', '21:24:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4688, 'P000007', '2023-01-12', 'W', '08:06:00', '16:33:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4689, 'P000004', '2023-01-12', 'W', '06:19:00', '19:54:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4690, 'P000006', '2023-01-12', 'W', '08:35:00', '19:30:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4691, '800', '2023-01-13', 'W', '08:17:00', '19:36:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4692, 'P000005', '2023-01-13', 'W', '08:39:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4693, 'P000002', '2023-01-13', 'W', '06:17:00', '07:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4694, 'P000004', '2023-01-13', 'W', '06:02:00', '19:34:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4695, 'P000003', '2023-01-13', 'W', '08:58:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4696, 'P000006', '2023-01-13', 'W', '08:34:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4697, 'P000007', '2023-01-13', 'W', '08:01:00', '17:02:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4698, 'P000007', '2023-01-14', 'W', '08:31:00', '15:52:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4699, 'P000006', '2023-01-14', 'W', '08:56:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4700, '800', '2023-01-14', 'W', '08:51:00', '16:06:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4701, 'P000004', '2023-01-14', 'W', '06:38:00', '15:09:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4702, 'P000003', '2023-01-14', 'W', '09:07:00', '14:59:00', '00:00:00', 0, 1, 1, '2023-01-24 15:56:46', '2023-01-24 15:56:46'),
	(4745, 'P000003', '2023-01-24', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 0, '2023-01-24 10:06:31', '2023-01-01 00:00:00'),
	(4746, 'P000008', '2023-01-24', '', '00:00:00', '00:00:00', '00:00:00', 0, 1, 0, '2023-01-24 10:10:39', '2023-01-24 10:10:44'),
	(4747, 'P000007', '2023-01-24', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 0, '2023-01-24 10:10:45', '2023-01-01 00:00:00');

-- Dumping structure for table hris.time_management_shift
DROP TABLE IF EXISTS `time_management_shift`;
CREATE TABLE IF NOT EXISTS `time_management_shift` (
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hris.time_management_shift: ~0 rows (approximately)
INSERT INTO `time_management_shift` (`id`, `name`, `scheduleIn`, `scheduleOut`, `Sun`, `Mon`, `Tue`, `Wed`, `Thu`, `Fri`, `Sat`) VALUES
	('W', 'WEEKDAY', '06:00:00', '19:00:00', 0, 1, 1, 1, 1, 1, 1);

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
