-- --------------------------------------------------------
-- Host:                         128.199.94.89
-- Server version:               8.0.32-0ubuntu0.22.10.2 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             12.4.0.6659
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
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idx` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `dateIn` varchar(50) DEFAULT NULL,
  `timeScan` varchar(50) DEFAULT NULL,
  `checkIn` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.attendance: ~0 rows (approximately)

-- Dumping structure for table hris.attendance_log
CREATE TABLE IF NOT EXISTS `attendance_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fileSize` double NOT NULL,
  `fileName` varchar(250) NOT NULL,
  `note` varchar(250) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `presence` int NOT NULL DEFAULT '1',
  `inputDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.attendance_log: ~4 rows (approximately)
INSERT INTO `attendance_log` (`id`, `fileSize`, `fileName`, `note`, `status`, `presence`, `inputDate`, `updateDate`) VALUES
	(17, 58.48, '1674735843Attendance3.txt', 'Upload Success', 0, 1, '2023-01-26 13:24:04', NULL),
	(18, 58.48, '1674735880Attendance3.txt', 'Upload Success', 0, 1, '2023-01-26 13:24:40', NULL),
	(19, 58.48, '1674735990Attendance3.txt', 'Sync Success', 1, 1, '2023-01-26 13:26:30', '2023-01-26 13:26:30'),
	(20, 58.48, '1674736252Attendance3.txt', 'Sync Success', 1, 1, '2023-01-26 13:30:52', '2023-01-26 13:30:52'),
	(21, 58.48, '1676369701Attendance3.txt', 'Sync Success', 1, 1, '2023-02-14 11:15:01', '2023-02-14 11:15:02');

-- Dumping structure for table hris.auto_number
CREATE TABLE IF NOT EXISTS `auto_number` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `prefix` varchar(50) NOT NULL DEFAULT '',
  `digit` int NOT NULL DEFAULT '1',
  `runningNumber` int NOT NULL DEFAULT '1',
  `updateDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.auto_number: ~7 rows (approximately)
INSERT INTO `auto_number` (`id`, `name`, `prefix`, `digit`, `runningNumber`, `updateDate`) VALUES
	(1, 'personal', 'P', 6, 10, '0000-00-00 00:00:00'),
	(2, 'employment', 'E', 6, 40, '0000-00-00 00:00:00'),
	(3, 'payroll', 'PYL', 6, 23, '0000-00-00 00:00:00'),
	(4, 'reimbursement', 'REM', 6, 33, '0000-00-00 00:00:00'),
	(5, 'loan', 'LN', 6, 26, '0000-00-00 00:00:00'),
	(6, 'salery', 'S', 6, 31, '0000-00-00 00:00:00'),
	(7, 'maintenance', 'M', 6, 12, '0000-00-00 00:00:00'),
	(8, 'mlog', 'MS', 6, 17, '0000-00-00 00:00:00');

-- Dumping structure for table hris.bpjs_setting
CREATE TABLE IF NOT EXISTS `bpjs_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `company` float NOT NULL DEFAULT '0',
  `employee` float NOT NULL DEFAULT '0',
  `presence` int NOT NULL DEFAULT '1',
  `updateDate` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.bpjs_setting: ~6 rows (approximately)
INSERT INTO `bpjs_setting` (`id`, `label`, `company`, `employee`, `presence`, `updateDate`) VALUES
	(100, 'JHT (Jaminan Hari Tua)', 3.7, 2, 1, '2023-02-14 12:42:17'),
	(110, 'JKK (Jaminan Kecelakaan Kerja)', 0.24, 0, 1, '2023-02-14 12:42:17'),
	(111, 'JKM (Jaminan Kematian)', 0.3, 0, 1, '2023-02-14 12:42:17'),
	(112, 'JP (Jaminan Pensiun)', 2, 1, 1, '2023-02-14 12:42:17'),
	(113, 'JKP (Jaminan Kehilangan Pekerjaan)', 0, 0, 1, '2023-02-14 12:42:17'),
	(200, 'BPJS Kesehaatan', 4, 1, 1, '2023-02-14 12:42:17');

-- Dumping structure for table hris.branch
CREATE TABLE IF NOT EXISTS `branch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `organizationId` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `presence` int DEFAULT '1',
  `inputDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `inputBy` varchar(50) DEFAULT NULL,
  `updateBy` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.branch: ~14 rows (approximately)
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
CREATE TABLE IF NOT EXISTS `employment` (
  `id` varchar(9) NOT NULL,
  `personalId` varchar(10) NOT NULL,
  `approvalLineId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `employmentStatusId` int NOT NULL DEFAULT '0',
  `timeManagementShiftId` varchar(3) NOT NULL,
  `dateJoinStart` date NOT NULL,
  `dateJoinEnd` date NOT NULL DEFAULT '2030-01-01',
  `jobPositionId` int NOT NULL,
  `jobLevelId` int NOT NULL,
  `branchId` int NOT NULL,
  `organizationId` int NOT NULL,
  `presence` int NOT NULL DEFAULT '1',
  `status` int NOT NULL DEFAULT '1',
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `updateDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `personalId` (`personalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.employment: ~10 rows (approximately)
INSERT INTO `employment` (`id`, `personalId`, `approvalLineId`, `employmentStatusId`, `timeManagementShiftId`, `dateJoinStart`, `dateJoinEnd`, `jobPositionId`, `jobLevelId`, `branchId`, `organizationId`, `presence`, `status`, `inputDate`, `updateDate`) VALUES
	('E000031', '1', '1', 1, '', '0000-00-00', '2030-01-01', 1, 0, 0, 0, 1, 1, '2023-01-25 10:50:22', '2023-01-01 00:00:00'),
	('E000032', 'P000003', '1', 2, '', '2023-01-01', '2024-03-01', 6, 6, 4, 2, 1, 1, '2023-01-25 11:13:08', '2023-03-29 05:24:28'),
	('E000033', 'P000004', '1', 2, '', '0000-00-00', '2030-01-01', 8, 4, 14, 880, 1, 1, '2023-01-25 11:28:32', '2023-01-25 11:31:22'),
	('E000034', 'P000010', '1', 0, '', '0000-00-00', '2030-01-01', 0, 0, 0, 0, 1, 1, '2023-01-25 11:45:14', '2023-01-01 00:00:00'),
	('E000035', 'P000005', '1', 3, '', '0000-00-00', '2030-01-01', 1, 5, 5, 2, 1, 1, '2023-02-08 07:52:50', '2023-02-08 07:54:35'),
	('E000036', 'P000006', '', 0, '', '0000-00-00', '2030-01-01', 0, 0, 0, 0, 1, 1, '2023-03-28 08:12:30', '2023-01-01 00:00:00'),
	('E000037', 'P000007', '', 0, '', '0000-00-00', '2030-01-01', 0, 0, 0, 0, 1, 1, '2023-03-28 08:12:36', '2023-01-01 00:00:00'),
	('E000038', 'P000009', '', 0, '', '0000-00-00', '2030-01-01', 0, 0, 0, 0, 1, 1, '2023-03-28 08:12:42', '2023-01-01 00:00:00'),
	('E000039', 'P000008', '', 0, '', '0000-00-00', '2030-01-01', 0, 0, 0, 0, 1, 1, '2023-03-28 08:13:07', '2023-01-01 00:00:00'),
	('E000040', 'E000032', '', 0, '', '0000-00-00', '2030-01-01', 0, 0, 0, 0, 1, 1, '2023-03-28 09:36:50', '2023-01-01 00:00:00');

-- Dumping structure for table hris.employment_joblevel
CREATE TABLE IF NOT EXISTS `employment_joblevel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `presence` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.employment_joblevel: ~9 rows (approximately)
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
CREATE TABLE IF NOT EXISTS `employment_jobposition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `_masterData` int NOT NULL DEFAULT '0',
  `_timeManagement` int NOT NULL DEFAULT '0',
  `_reimbursement` int NOT NULL DEFAULT '0',
  `_loan` int NOT NULL DEFAULT '0',
  `_payroll` int NOT NULL DEFAULT '0',
  `_maintenance` int NOT NULL DEFAULT '0',
  `presence` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.employment_jobposition: ~7 rows (approximately)
INSERT INTO `employment_jobposition` (`id`, `name`, `_masterData`, `_timeManagement`, `_reimbursement`, `_loan`, `_payroll`, `_maintenance`, `presence`) VALUES
	(1, 'Administrator', 1, 1, 1, 1, 1, 1, 1),
	(5, 'Manager', 0, 0, 0, 0, 0, 1, 1),
	(6, 'Staft', 0, 0, 0, 0, 0, 1, 1),
	(7, 'General Manager', 0, 0, 0, 0, 0, 1, 1),
	(8, 'IT Staft', 0, 0, 0, 0, 0, 1, 1),
	(9, 'Office Boy', 0, 0, 0, 0, 0, 1, 1),
	(11, 'haha', 1, 0, 0, 1, 0, 1, 0);

-- Dumping structure for table hris.employment_status
CREATE TABLE IF NOT EXISTS `employment_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.employment_status: ~3 rows (approximately)
INSERT INTO `employment_status` (`id`, `name`) VALUES
	(1, 'Probation'),
	(2, 'Contract'),
	(3, 'Permanent');

-- Dumping structure for table hris.global_setting
CREATE TABLE IF NOT EXISTS `global_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.global_setting: ~8 rows (approximately)
INSERT INTO `global_setting` (`id`, `name`, `value`) VALUES
	(2, 'CompanyName', 'PT Lorem Ipsum Tbk'),
	(3, 'CompanyAddress', 'Jalan M.H. Thamrin No.1, RT.1/RW.5. Kelurahan Menteng, Kecamatan Menteng · Kota Jakarta Pusat 10310'),
	(51, 'periodDateStart', '25'),
	(52, 'periodDateEnd', '25'),
	(100, 'jabatanPercent', '0.05'),
	(101, 'jabatanMaxAmount', '500000'),
	(112, 'min UMP for BPJS', '4800000'),
	(200, 'reminderContractExpired', '30');

-- Dumping structure for table hris.loan
CREATE TABLE IF NOT EXISTS `loan` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `personalId` varchar(50) NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `installment` int NOT NULL DEFAULT '0',
  `description` varchar(250) NOT NULL DEFAULT '',
  `effectiveDate` date DEFAULT NULL,
  `approved` int DEFAULT '0',
  `approvedBy` varchar(50) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `presence` int NOT NULL DEFAULT '1',
  `status` int NOT NULL DEFAULT '1',
  `inputDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.loan: ~8 rows (approximately)
INSERT INTO `loan` (`id`, `personalId`, `amount`, `installment`, `description`, `effectiveDate`, `approved`, `approvedBy`, `approvedDate`, `presence`, `status`, `inputDate`, `updateDate`) VALUES
	('LN000017', 'P000004', 100000000, 12, '', '2023-01-19', 0, NULL, NULL, 0, 1, '2023-01-19 14:52:08', '2023-02-07 10:43:31'),
	('LN000018', 'P000003', 180000000, 12, 'DP beli rumah', '2023-02-09', 0, NULL, NULL, 0, 1, '2023-02-07 08:39:17', '2023-02-07 09:25:23'),
	('LN000019', 'P000003', 444000020, 12, 'Description 213', '2023-02-07', 1, 'P000003', '2023-02-07 10:56:15', 1, 1, '2023-02-07 09:23:58', '2023-02-07 10:56:15'),
	('LN000020', 'P000003', 180000000, 7, 'DP beli rumah', '2023-02-09', 0, NULL, NULL, 1, 1, '2023-02-07 09:20:09', NULL),
	('LN000021', 'P000003', 180000000, 5, 'DP beli rumah', '2023-02-09', 1, 'P000003', '2023-02-07 11:05:37', 1, 1, '2023-02-07 09:13:54', '2023-02-07 11:05:37'),
	('LN000022', 'P000003', 180000000, 3, 'DP beli rumah', '2023-02-09', 0, NULL, NULL, 0, 1, '2023-02-07 09:13:59', '2023-02-07 09:25:29'),
	('LN000023', 'P000003', 80000000, 6, 'PD mobile', '2023-02-07', 1, 'P000003', '2023-02-07 10:56:32', 1, 1, '2023-02-07 09:53:57', '2023-02-07 10:56:32'),
	('LN000025', 'P000003', 177700000, 12, '', '2023-02-08', 0, NULL, NULL, 1, 1, '2023-02-08 05:43:18', NULL),
	('LN000026', '1', 100000000, 12, 'Description Description', '2023-02-14', 0, NULL, NULL, 1, 1, '2023-02-14 10:51:02', NULL);

-- Dumping structure for table hris.loan_detail
CREATE TABLE IF NOT EXISTS `loan_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loanId` varchar(50) NOT NULL,
  `employmentId` varchar(50) NOT NULL,
  `personalId` varchar(50) NOT NULL,
  `installment` int NOT NULL DEFAULT '1',
  `paymentDate` date DEFAULT NULL,
  `paymentAmount` double NOT NULL DEFAULT '0',
  `paidDate` date DEFAULT NULL,
  `paidAmount` double NOT NULL DEFAULT '0',
  `balance` double NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `presence` int NOT NULL DEFAULT '1',
  `inputDate` datetime DEFAULT NULL,
  `inputBy` varchar(50) NOT NULL DEFAULT '',
  `updateDate` datetime DEFAULT NULL,
  `updateBy` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.loan_detail: ~22 rows (approximately)
INSERT INTO `loan_detail` (`id`, `loanId`, `employmentId`, `personalId`, `installment`, `paymentDate`, `paymentAmount`, `paidDate`, `paidAmount`, `balance`, `status`, `presence`, `inputDate`, `inputBy`, `updateDate`, `updateBy`) VALUES
	(133, 'LN000019', 'LN000018', 'P000003', 1, '2023-03-07', 37000002, NULL, 0, 37000002, 1, 1, '2023-02-07 10:56:16', '', NULL, ''),
	(134, 'LN000019', 'LN000018', 'P000003', 2, '2023-04-07', 37000002, NULL, 0, 37000002, 1, 1, '2023-02-07 10:56:16', '', NULL, ''),
	(135, 'LN000019', 'LN000018', 'P000003', 3, '2023-05-07', 37000002, NULL, 0, 37000002, 1, 1, '2023-02-07 10:56:16', '', NULL, ''),
	(136, 'LN000019', 'LN000018', 'P000003', 4, '2023-06-07', 37000002, NULL, 0, 37000002, 1, 1, '2023-02-07 10:56:16', '', NULL, ''),
	(137, 'LN000019', 'LN000018', 'P000003', 5, '2023-07-07', 37000002, NULL, 0, 37000002, 1, 1, '2023-02-07 10:56:16', '', NULL, ''),
	(138, 'LN000019', 'LN000018', 'P000003', 6, '2023-08-07', 37000002, NULL, 0, 37000002, 1, 1, '2023-02-07 10:56:16', '', NULL, ''),
	(139, 'LN000019', 'LN000018', 'P000003', 7, '2023-09-07', 37000002, NULL, 0, 37000002, 1, 1, '2023-02-07 10:56:16', '', NULL, ''),
	(140, 'LN000019', 'LN000018', 'P000003', 8, '2023-10-07', 37000002, NULL, 0, 37000002, 1, 1, '2023-02-07 10:56:16', '', NULL, ''),
	(141, 'LN000019', 'LN000018', 'P000003', 9, '2023-11-07', 37000002, NULL, 0, 37000002, 1, 1, '2023-02-07 10:56:16', '', NULL, ''),
	(142, 'LN000019', 'LN000018', 'P000003', 10, '2023-12-07', 37000002, NULL, 0, 37000002, 1, 1, '2023-02-07 10:56:16', '', NULL, ''),
	(143, 'LN000019', 'LN000018', 'P000003', 11, '2024-01-07', 37000002, NULL, 0, 37000002, 1, 1, '2023-02-07 10:56:16', '', NULL, ''),
	(144, 'LN000019', 'LN000018', 'P000003', 12, '2024-02-07', 37000002, NULL, 0, 37000002, 1, 1, '2023-02-07 10:56:16', '', NULL, ''),
	(145, 'LN000023', 'LN000018', 'P000003', 1, '2023-03-07', 13333334, NULL, 0, 13333334, 1, 1, '2023-02-07 10:56:32', '', NULL, ''),
	(146, 'LN000023', 'LN000018', 'P000003', 2, '2023-04-07', 13333334, NULL, 0, 13333334, 1, 1, '2023-02-07 10:56:32', '', NULL, ''),
	(147, 'LN000023', 'LN000018', 'P000003', 3, '2023-05-07', 13333334, NULL, 0, 13333334, 1, 1, '2023-02-07 10:56:32', '', NULL, ''),
	(148, 'LN000023', 'LN000018', 'P000003', 4, '2023-06-07', 13333334, NULL, 0, 13333334, 1, 1, '2023-02-07 10:56:32', '', NULL, ''),
	(149, 'LN000023', 'LN000018', 'P000003', 5, '2023-07-07', 13333334, NULL, 0, 13333334, 1, 1, '2023-02-07 10:56:32', '', NULL, ''),
	(150, 'LN000023', 'LN000018', 'P000003', 6, '2023-08-07', 13333334, NULL, 0, 13333334, 1, 1, '2023-02-07 10:56:32', '', NULL, ''),
	(151, 'LN000021', 'LN000018', 'P000003', 1, '2023-03-09', 36000000, NULL, 0, 36000000, 1, 1, '2023-02-07 11:05:37', '', NULL, ''),
	(152, 'LN000021', 'LN000018', 'P000003', 2, '2023-04-09', 36000000, NULL, 0, 36000000, 1, 1, '2023-02-07 11:05:37', '', NULL, ''),
	(153, 'LN000021', 'LN000018', 'P000003', 3, '2023-05-09', 36000000, NULL, 0, 36000000, 1, 1, '2023-02-07 11:05:37', '', NULL, ''),
	(154, 'LN000021', 'LN000018', 'P000003', 4, '2023-06-09', 36000000, NULL, 0, 36000000, 1, 1, '2023-02-07 11:05:37', '', NULL, ''),
	(155, 'LN000021', 'LN000018', 'P000003', 5, '2023-07-09', 36000000, NULL, 0, 36000000, 1, 1, '2023-02-07 11:05:37', '', NULL, '');

-- Dumping structure for table hris.maintenance
CREATE TABLE IF NOT EXISTS `maintenance` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `equipment` varchar(250) NOT NULL DEFAULT '',
  `description` text,
  `brand` varchar(250) DEFAULT NULL,
  `typeItem` varchar(250) DEFAULT NULL,
  `capacity` varchar(250) DEFAULT NULL,
  `serialNumber` varchar(250) DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  `locationId` int DEFAULT NULL,
  `sparepartId` int DEFAULT NULL,
  `purchaseDate` date DEFAULT '2000-01-01',
  `supplier` varchar(250) DEFAULT NULL,
  `warantyUntil` date DEFAULT NULL,
  `schedule` int NOT NULL DEFAULT '3',
  `lastDate` date DEFAULT '2020-01-01',
  `presence` int NOT NULL DEFAULT '1',
  `status` int NOT NULL DEFAULT '1',
  `inputDate` datetime DEFAULT '2020-01-01 00:00:00',
  `inputBy` varchar(50) DEFAULT NULL,
  `updateDate` datetime DEFAULT '2020-01-01 00:00:00',
  `updateBy` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hris.maintenance: ~10 rows (approximately)
INSERT INTO `maintenance` (`id`, `equipment`, `description`, `brand`, `typeItem`, `capacity`, `serialNumber`, `categoryId`, `locationId`, `sparepartId`, `purchaseDate`, `supplier`, `warantyUntil`, `schedule`, `lastDate`, `presence`, `status`, `inputDate`, `inputBy`, `updateDate`, `updateBy`) VALUES
	('M2023000002', 'AC', 'Description', 'B1', 'Ty', 'cag', 'SN888854', 5, 3, 7, '2023-02-24', 'Supplier', '2025-02-17', 2, '2020-01-01', 1, 1, '2023-02-13 09:02:48', 'P000005', '2023-04-05 11:35:13', '1'),
	('M2023000003', 'MOTOR', '33232', NULL, NULL, NULL, NULL, 5, NULL, NULL, '2013-02-01', '1111', '2025-02-08', 1, '2020-01-01', 1, 1, '2023-02-13 09:59:35', 'P000005', '2023-02-16 06:19:13', '1'),
	('M23000005', 'SCREEN', 'Description', NULL, NULL, NULL, NULL, 6, NULL, NULL, '2023-02-19', '', '2023-02-22', 1, '2020-01-01', 1, 1, '2023-02-15 07:07:03', '1', '2023-02-16 06:19:32', '1'),
	('M23000006', 'QQ MSN', '', NULL, NULL, NULL, NULL, 6, NULL, NULL, '2023-02-18', '', '2023-02-22', 4, '2020-01-01', 1, 1, '2023-02-15 07:36:32', '1', '2023-02-16 06:19:24', '1'),
	('M23000007', 'QQ MSN2', 'AC Panasonic 1PK', NULL, NULL, NULL, NULL, 5, NULL, NULL, '2023-01-01', 'Best Denki', '2023-01-31', 3, '2020-01-01', 1, 1, '2023-02-16 06:11:39', '1', '2020-01-01 00:00:00', NULL),
	('M23000008', 'AC2', 'Mobil Innova B 2121 AAS', NULL, NULL, NULL, NULL, 6, NULL, NULL, '2023-01-01', 'Auto 2000', '2027-02-27', 6, '2020-01-01', 1, 1, '2023-02-16 06:13:22', '1', '2023-02-17 10:02:03', '1'),
	('M23000009', 'AC3', '', NULL, NULL, NULL, NULL, 7, NULL, NULL, '2023-02-18', '', '2025-02-22', 1, '2020-01-01', 1, 1, '2023-02-17 09:28:41', '1', '2020-01-01 00:00:00', NULL),
	('M23000010', 'AC4', '', NULL, NULL, NULL, NULL, 8, NULL, NULL, '2023-02-18', '', '2025-02-22', 1, '2020-01-01', 1, 1, '2023-02-17 09:29:55', '1', '2020-01-01 00:00:00', NULL),
	('M23000011', 'Equipment Terbaru Update', 'De123 1', 'B1 c', 'Ty 4', 'Ca 1', 'SN888854 4', 6, 3, 2, '2023-03-15', 'S01 1', '2026-03-28', 2, '2020-01-01', 1, 1, '2023-03-15 10:23:40', '1', '2023-03-17 12:00:11', '1'),
	('M23000012', 'Epson A1', '', 'Epson', 'Type M1234', '', '77777-2039-11123', 9, 1, 1, '2023-03-01', 'Mangga Dua', '2024-05-18', 1, '2020-01-01', 1, 1, '2023-03-29 05:14:40', '1', '2023-03-29 05:15:11', '1');

-- Dumping structure for table hris.maintenance_category
CREATE TABLE IF NOT EXISTS `maintenance_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `presence` int DEFAULT '1',
  `inputDate` datetime DEFAULT '2020-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.maintenance_category: ~10 rows (approximately)
INSERT INTO `maintenance_category` (`id`, `name`, `presence`, `inputDate`) VALUES
	(1, 'A', 0, '2020-01-01 00:00:00'),
	(2, 'B', 0, '2020-01-01 00:00:00'),
	(3, 'C', 0, '2020-01-01 00:00:00'),
	(4, 'D', 0, '2023-02-15 07:36:32'),
	(5, 'AC', 1, '2023-02-16 06:11:39'),
	(6, 'Mobil', 1, '2023-02-16 06:13:22'),
	(7, 'Rumah', 1, '2023-02-17 09:28:41'),
	(8, 'Rumah', 1, '2023-02-17 09:29:55'),
	(9, 'Printer123', 1, '2023-03-29 05:14:40'),
	(10, 'bace', 1, '2020-01-01 00:00:00');

-- Dumping structure for table hris.maintenance_equipment
CREATE TABLE IF NOT EXISTS `maintenance_equipment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `presence` int NOT NULL DEFAULT '1',
  `inputDate` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.maintenance_equipment: ~8 rows (approximately)
INSERT INTO `maintenance_equipment` (`id`, `name`, `presence`, `inputDate`) VALUES
	(1, 'AC', 1, '2000-01-01 00:00:00'),
	(2, 'Mobil 1', 1, '2000-01-01 00:00:00'),
	(3, 'Mobil 2', 1, '2000-01-01 00:00:00'),
	(4, 'Server 133', 0, '2000-01-01 00:00:00'),
	(5, 'abca123', 0, '2023-02-15 07:05:20'),
	(6, 'abbbbcccc', 0, '2023-02-15 07:07:03'),
	(7, 'Ac Panasonic', 1, '2023-02-16 06:11:39'),
	(8, 'Mobil Innova B 2121 AAS', 1, '2023-02-16 06:13:22');

-- Dumping structure for table hris.maintenance_images
CREATE TABLE IF NOT EXISTS `maintenance_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maintenanceId` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `name` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `presence` int DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.maintenance_images: ~1 rows (approximately)
INSERT INTO `maintenance_images` (`id`, `maintenanceId`, `name`, `url`, `presence`) VALUES
	(4, 'M2023000002', 'test', 'https://dummyimage.com/600x400/000/fff', 1);

-- Dumping structure for table hris.maintenance_location
CREATE TABLE IF NOT EXISTS `maintenance_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `presence` int NOT NULL DEFAULT '1',
  `inputDate` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.maintenance_location: ~10 rows (approximately)
INSERT INTO `maintenance_location` (`id`, `name`, `presence`, `inputDate`) VALUES
	(1, 'Location 1', 1, '2000-01-01 00:00:00'),
	(2, 'Location 2', 1, '2000-01-01 00:00:00'),
	(3, 'Location 13', 1, '2000-01-01 00:00:00'),
	(4, 'Location 4', 1, '2000-01-01 00:00:00'),
	(5, 'Location 41', 1, '2000-01-01 00:00:00'),
	(6, 'Location 42', 1, '2000-01-01 00:00:00'),
	(7, 'Location 77', 1, '2000-01-01 00:00:00'),
	(8, 'Location 84', 1, '2000-01-01 00:00:00'),
	(9, 'Location 42b', 1, '2000-01-01 00:00:00'),
	(10, 'Location 99', 1, '2000-01-01 00:00:00');

-- Dumping structure for table hris.maintenance_schedule
CREATE TABLE IF NOT EXISTS `maintenance_schedule` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `maintenanceId` varchar(50) NOT NULL,
  `scheduleDate` date NOT NULL DEFAULT '2023-01-01',
  `maintenanceDate` date NOT NULL DEFAULT '2023-01-01',
  `supplier` varchar(250) NOT NULL DEFAULT '',
  `cost` double NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `presence` int NOT NULL DEFAULT '1',
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `updateDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `inputBy` varchar(50) NOT NULL DEFAULT '',
  `updateBy` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hris.maintenance_schedule: ~15 rows (approximately)
INSERT INTO `maintenance_schedule` (`id`, `maintenanceId`, `scheduleDate`, `maintenanceDate`, `supplier`, `cost`, `note`, `status`, `presence`, `inputDate`, `updateDate`, `inputBy`, `updateBy`) VALUES
	('MS202313000002', 'M2023000003', '2023-02-24', '2023-01-01', '', 5555510, '123213123', 1, 0, '2023-02-13 12:11:23', '2023-02-15 09:37:25', 'P000005', ''),
	('MS202313000003', 'M2023000003', '2023-02-26', '2023-01-01', '', 57770, '123123', 100, 0, '2023-02-13 12:11:58', '2023-02-15 09:38:59', 'P000005', ''),
	('MS2313000004', 'M2023000003', '2022-12-26', '2023-01-01', '', 10000, 'Note 123', 100, 1, '2023-02-13 12:13:19', '2023-02-13 13:18:17', 'P000005', ''),
	('MS2313000005', 'M2023000003', '2023-03-19', '2023-02-15', 'supplier', 245510, 'sdsfsdfsdf', 100, 1, '2023-02-13 12:17:51', '2023-02-15 10:23:34', 'P000005', ''),
	('MS2315000007', 'M2023000003', '2023-05-19', '2023-02-15', '', 0, '', 100, 1, '2023-02-15 10:24:13', '2023-02-15 10:30:53', '1', ''),
	('MS2315000008', 'M2023000003', '2023-06-19', '2023-01-01', '', 0, '', 1, 1, '2023-02-15 10:30:53', '2023-01-01 00:00:00', '1', ''),
	('MS2317000009', 'M23000010', '2023-03-18', '2023-02-17', 'Supplier', 588830, '', 100, 1, '2023-02-17 09:56:33', '2023-02-17 09:57:16', '1', ''),
	('MS2317000010', 'M23000010', '2023-04-18', '2023-01-01', '', 0, '', 1, 1, '2023-02-17 09:57:16', '2023-01-01 00:00:00', '1', ''),
	('MS2317000011', 'M23000008', '2023-07-01', '2023-02-17', 'Supplier', 999910, '', 100, 1, '2023-02-17 10:03:28', '2023-02-17 10:03:54', '1', ''),
	('MS2317000012', 'M23000008', '2023-08-01', '2023-02-17', '', 0, '', 100, 1, '2023-02-17 10:03:54', '2023-02-17 10:04:53', '1', ''),
	('MS2317000013', 'M23000008', '2024-02-01', '2023-01-01', '', 0, '', 1, 1, '2023-02-17 10:04:54', '2023-01-01 00:00:00', '1', ''),
	('MS2317000014', 'M2023000002', '2023-04-24', '2023-02-17', 'av', 500000, '', 100, 1, '2023-02-17 09:14:42', '2023-02-17 09:14:46', '1', ''),
	('MS2317000015', 'M2023000002', '2023-06-24', '2023-01-01', '', 0, '', 1, 0, '2023-02-17 09:14:46', '2023-03-17 10:45:20', '1', ''),
	('MS2317000016', 'M2023000002', '2023-06-24', '2023-01-01', 'Supplier baru', 500020, '', 1, 1, '2023-03-17 10:45:44', '2023-01-01 00:00:00', '1', ''),
	('MS2329000017', 'M23000012', '2023-04-01', '2023-01-01', 'TOkopedia', 500000, 'ganti tabung', 1, 1, '2023-03-29 05:15:28', '2023-01-01 00:00:00', '1', '');

-- Dumping structure for table hris.maintenance_sparepart
CREATE TABLE IF NOT EXISTS `maintenance_sparepart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `presence` int NOT NULL DEFAULT '1',
  `inputDate` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.maintenance_sparepart: ~12 rows (approximately)
INSERT INTO `maintenance_sparepart` (`id`, `name`, `presence`, `inputDate`) VALUES
	(1, 'Spare Part H-0332-0153', 1, '2000-01-01 00:00:00'),
	(2, 'Spare Part 332', 1, '2000-01-01 00:00:00'),
	(3, 'Spare Part 5444444', 1, '2000-01-01 00:00:00'),
	(4, 'Spare Part X4432', 1, '2000-01-01 00:00:00'),
	(5, 'Spare Part 88843234', 1, '2000-01-01 00:00:00'),
	(6, 'Spare Part X13', 0, '2000-01-01 00:00:00'),
	(7, 'Spare Part Z092', 1, '2000-01-01 00:00:00'),
	(8, 'Spare Part UCX145', 1, '2000-01-01 00:00:00'),
	(9, 'Spare Part 553', 1, '2000-01-01 00:00:00'),
	(10, 'Spare Part H-0042-19953', 1, '2000-01-01 00:00:00'),
	(11, 'Spare Part H-0923-15335', 1, '2000-01-01 00:00:00'),
	(12, 'SP003344-12222', 1, '2000-01-01 00:00:00');

-- Dumping structure for table hris.maintenance_sperepart_log
CREATE TABLE IF NOT EXISTS `maintenance_sperepart_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maintenanceId` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `sparepartIdLog` int NOT NULL DEFAULT '0',
  `sparepartId` int NOT NULL DEFAULT '0',
  `note` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `presence` int NOT NULL DEFAULT '1',
  `status` int NOT NULL DEFAULT '1',
  `inputDate` datetime DEFAULT '2020-01-01 00:00:00',
  `inputBy` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updateDate` datetime DEFAULT '2020-01-01 00:00:00',
  `updateBy` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.maintenance_sperepart_log: ~2 rows (approximately)
INSERT INTO `maintenance_sperepart_log` (`id`, `maintenanceId`, `sparepartIdLog`, `sparepartId`, `note`, `presence`, `status`, `inputDate`, `inputBy`, `updateDate`, `updateBy`) VALUES
	(7, 'M2023000002', 3, 10, '', 1, 1, '2023-04-05 11:25:50', '1', '2020-01-01 00:00:00', NULL),
	(8, 'M2023000002', 10, 7, 'Notes 123', 1, 1, '2023-04-05 11:35:13', '1', '2020-01-01 00:00:00', NULL);

-- Dumping structure for table hris.maintenance_status
CREATE TABLE IF NOT EXISTS `maintenance_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.maintenance_status: ~2 rows (approximately)
INSERT INTO `maintenance_status` (`id`, `name`) VALUES
	(1, 'Schedule'),
	(100, 'Done');

-- Dumping structure for table hris.maintenance_transfer_log
CREATE TABLE IF NOT EXISTS `maintenance_transfer_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maintenanceId` varchar(50) NOT NULL DEFAULT '0',
  `locationId` int NOT NULL DEFAULT '0',
  `scheduleDate` date NOT NULL DEFAULT '2023-01-01',
  `note` varchar(250) NOT NULL DEFAULT '',
  `presence` int NOT NULL DEFAULT '1',
  `status` int NOT NULL DEFAULT '1',
  `inputDate` datetime DEFAULT '2020-01-01 00:00:00',
  `inputBy` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updateDate` datetime DEFAULT '2020-01-01 00:00:00',
  `updateBy` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.maintenance_transfer_log: ~5 rows (approximately)
INSERT INTO `maintenance_transfer_log` (`id`, `maintenanceId`, `locationId`, `scheduleDate`, `note`, `presence`, `status`, `inputDate`, `inputBy`, `updateDate`, `updateBy`) VALUES
	(1, 'M23000011', 10, '2023-03-18', 'notes123', 1, 1, '2023-03-17 11:38:42', '1', '2020-01-01 00:00:00', NULL),
	(3, 'M23000011', 3, '2023-03-22', 'Notes 123', 1, 1, '2023-03-17 12:00:12', '1', '2020-01-01 00:00:00', NULL),
	(4, 'M2023000002', 2, '2023-03-11', 'notes123', 1, 1, '2023-03-28 09:39:03', '1', '2020-01-01 00:00:00', NULL),
	(5, 'M2023000002', 7, '2023-03-11', 'notes123', 1, 1, '2023-03-28 09:39:13', '1', '2020-01-01 00:00:00', NULL),
	(6, 'M2023000002', 3, '2023-03-30', 'ini terbaru dipidah', 1, 1, '2023-03-29 05:11:05', '1', '2020-01-01 00:00:00', NULL);

-- Dumping structure for table hris.offtime
CREATE TABLE IF NOT EXISTS `offtime` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `presence` int DEFAULT '1',
  `inputDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `inputBy` varchar(50) DEFAULT NULL,
  `updateBy` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=888 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.offtime: ~2 rows (approximately)
INSERT INTO `offtime` (`id`, `name`, `presence`, `inputDate`, `updateDate`, `inputBy`, `updateBy`) VALUES
	(886, 'Cuti Stress', 1, NULL, NULL, NULL, NULL),
	(887, 'Cuti Ga Jelas', 1, NULL, NULL, NULL, NULL);

-- Dumping structure for table hris.organization
CREATE TABLE IF NOT EXISTS `organization` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `presence` int DEFAULT '1',
  `inputDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `inputBy` varchar(50) DEFAULT NULL,
  `updateBy` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=886 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.organization: ~11 rows (approximately)
INSERT INTO `organization` (`id`, `name`, `presence`, `inputDate`, `updateDate`, `inputBy`, `updateBy`) VALUES
	(1, 'PT Astra TBK', 1, NULL, NULL, NULL, NULL),
	(2, 'PT Panasonic', 1, NULL, NULL, NULL, NULL),
	(3, 'PT Samsung Tbk', 1, NULL, NULL, NULL, NULL),
	(878, 'hahahah', 0, '2023-01-17 11:44:16', '2023-01-17 11:44:16', NULL, NULL),
	(879, 'PT ASTRA TBK', 1, '2023-01-17 11:44:57', '2023-01-17 11:44:57', NULL, NULL),
	(880, 'PT Samudra', 1, '2023-01-17 11:49:40', '2023-01-17 11:49:40', NULL, NULL),
	(881, '1231244234', 0, '2023-01-17 11:50:05', '2023-01-17 11:50:05', NULL, NULL),
	(882, 'PT Samudra', 1, '2023-01-17 12:14:22', '2023-01-17 12:14:22', NULL, NULL),
	(883, 'gasdfasdf', 0, '2023-01-17 12:14:44', '2023-01-17 12:14:44', NULL, NULL),
	(884, 'asdfsadfasdf34345', 0, '2023-01-17 12:25:47', '2023-01-17 12:25:47', NULL, NULL),
	(885, 'gagagsdsdfgsdfggfdfgd', 0, '2023-01-17 12:26:48', '2023-01-17 12:26:48', NULL, NULL);

-- Dumping structure for table hris.payroll
CREATE TABLE IF NOT EXISTS `payroll` (
  `id` varchar(9) NOT NULL,
  `personalId` varchar(50) NOT NULL DEFAULT '',
  `salary` double NOT NULL DEFAULT '0',
  `salaryType` varchar(2) NOT NULL DEFAULT '',
  `bankName` varchar(50) NOT NULL DEFAULT '',
  `bankAccountNumber` varchar(50) NOT NULL DEFAULT '',
  `bankAccountHolderName` varchar(50) NOT NULL DEFAULT '',
  `hourlyRate` double NOT NULL DEFAULT '0',
  `tunjangan` double NOT NULL DEFAULT '0',
  `taxNpwp` varchar(50) NOT NULL DEFAULT '',
  `taxMethod` varchar(50) NOT NULL DEFAULT '',
  `taxableDate` date NOT NULL DEFAULT '2020-01-01',
  `taxHolderName` varchar(50) NOT NULL DEFAULT '',
  `taxPtkpStatus` varchar(50) NOT NULL DEFAULT '',
  `taxSalary` double NOT NULL DEFAULT '0',
  `EmploymentTaxStatus` varchar(50) NOT NULL DEFAULT '0',
  `taxPktpAccountHolder` varchar(50) NOT NULL DEFAULT '0',
  `bpsjTkNo` varchar(50) NOT NULL DEFAULT '',
  `bpsjKesehatanNo` varchar(50) NOT NULL DEFAULT '',
  `JhtCost` double NOT NULL DEFAULT '0',
  `JaminanPensiunCost` double NOT NULL DEFAULT '0',
  `bpjsTkDate` date NOT NULL DEFAULT '2023-01-01',
  `bpjsKesehatanFamily` varchar(50) NOT NULL DEFAULT '',
  `JaminanPensiunDate` date NOT NULL DEFAULT '2023-01-01',
  `status` int NOT NULL DEFAULT '1',
  `presence` int NOT NULL DEFAULT '1',
  `updateDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `personalId` (`personalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.payroll: ~10 rows (approximately)
INSERT INTO `payroll` (`id`, `personalId`, `salary`, `salaryType`, `bankName`, `bankAccountNumber`, `bankAccountHolderName`, `hourlyRate`, `tunjangan`, `taxNpwp`, `taxMethod`, `taxableDate`, `taxHolderName`, `taxPtkpStatus`, `taxSalary`, `EmploymentTaxStatus`, `taxPktpAccountHolder`, `bpsjTkNo`, `bpsjKesehatanNo`, `JhtCost`, `JaminanPensiunCost`, `bpjsTkDate`, `bpjsKesehatanFamily`, `JaminanPensiunDate`, `status`, `presence`, `updateDate`, `inputDate`) VALUES
	('PYL000014', 'P000003', 12000000, 'M', 'Paypal', '09999777774', 'maria sarapova Bank', 0, 0, 'NPWP00001111', '', '2020-01-01', 'Account Holder Name', 'TK/3', 12000000, '0', 'Tax PKTP Account Holder Name', '666555', '234234324', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-04-05 13:48:28', '2023-01-25 11:15:20'),
	('PYL000015', 'P000010', 12000000, '', '', '', '', 0, 500000, '', '', '2020-01-01', '', 'TK/3', 12000000, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-01-01 00:00:00', '2023-01-25 11:45:16'),
	('PYL000016', '1', 8000000, '', '', '', '', 0, 0, '', '', '2020-01-01', '', 'K/3', 8000000, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-01-01 00:00:00', '2023-01-26 08:54:28'),
	('PYL000017', 'P000005', 42000000, 'M', '', '', '', 0, 500000, '', '', '2020-01-01', '', 'TK/3', 40000000, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-03-10 04:17:42', '2023-02-08 07:52:52'),
	('PYL000018', 'P000004', 52000000, 'M', '', '', '', 0, 500000, '', '', '2020-01-01', '', 'TK/3', 50000000, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-03-10 04:12:44', '2023-03-10 04:12:06'),
	('PYL000019', 'P000006', 6000000, '', '', '', '', 0, 500000, '', '', '2020-01-01', '', 'TK/3', 4000000, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-01-01 00:00:00', '2023-03-28 08:12:28'),
	('PYL000020', 'P000007', 62000000, '', '', '', '', 0, 500000, '', '', '2020-01-01', '', 'TK/3', 62000000, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-01-01 00:00:00', '2023-03-28 08:12:35'),
	('PYL000021', 'P000009', 152000000, '', '', '', '', 0, 500000, '', '', '2020-01-01', '', 'TK/3', 150000000, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-01-01 00:00:00', '2023-03-28 08:12:41'),
	('PYL000022', 'P000008', 25000000, '', '', '', '', 0, 500000, '', '', '2020-01-01', '', 'TK/3', 25000000, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-03-29 05:35:59', '2023-03-28 08:13:05'),
	('PYL000023', 'E000032', 0, '', '', '', '', 0, 0, '', '', '2020-01-01', '', '', 0, '0', '0', '', '', 0, 0, '2023-01-01', '', '2023-01-01', 1, 1, '2023-01-01 00:00:00', '2023-03-28 09:36:50');

-- Dumping structure for table hris.personal
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
  `marital` int NOT NULL DEFAULT '0',
  `blood` varchar(2) NOT NULL DEFAULT '',
  `religion` int NOT NULL DEFAULT '0',
  `idType` int DEFAULT '1',
  `idNumber` varchar(50) DEFAULT '',
  `expDate` date DEFAULT '2023-01-01',
  `permanent` int DEFAULT '0',
  `postalCode` varchar(6) DEFAULT '',
  `address` varchar(250) DEFAULT '',
  `presence` int DEFAULT '1',
  `status` int DEFAULT '1',
  `inputDate` datetime DEFAULT '2023-01-01 00:00:00',
  `updateDate` datetime DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.personal: ~11 rows (approximately)
INSERT INTO `personal` (`id`, `idx`, `name`, `phone`, `email`, `password`, `birthPlace`, `birthDate`, `gender`, `marital`, `blood`, `religion`, `idType`, `idNumber`, `expDate`, `permanent`, `postalCode`, `address`, `presence`, `status`, `inputDate`, `updateDate`) VALUES
	('1', '11223344', 'administrator', '007', 'hris@admin.com', '25f9e794323b453885f5181f1b624d0b', '', '', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-01-16 13:32:39', '2023-01-16 13:32:39'),
	('800', '20190001', 'asd', '', '', '', '', '', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 0, 0, '2023-01-16 13:32:58', '2023-01-16 13:32:58'),
	('P000002', '20189900', 'asd', '', '', '', '', '', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 0, 0, '2023-01-16 13:43:32', '2023-01-16 13:43:32'),
	('P000003', '20050082', 'Maria Sarapova Kave', '234234324', 'maria@abc.com', '25f9e794323b453885f5181f1b624d0b', 'gagagagagag', '1990-1-27', 'F', 4, 'A', 3, 2, '88854454520000454', '2023-03-17', 1, '12345', 'Jl. Labu no 32', 1, 1, '2023-02-21 04:20:19', '2023-02-21 04:20:19'),
	('P000004', '20120542', 'AkanShari', '', '', '', '', '1990-1-19', '0', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-01-16 13:14:47', '2023-01-16 13:14:47'),
	('P000005', '20130588', 'joni yes papa', '1234234', 'joni@admin.com', 'e99a18c428cb38d5f260853678922e03', '', '1990-1-1', 'M', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-02-08 08:25:33', '2023-02-08 08:27:37'),
	('P000006', '20130607', 'Kitaro', '43234234', 'rey_nave@yahoo.com', '', '', '1990-1-1', 'M', 0, '', 0, 1, '', '2023-01-01', 1, '', '', 1, 1, '2023-01-16 13:17:41', '2023-01-16 13:17:41'),
	('P000007', '20140622', 'Olive alson', '999976666', 'alson@email.com', '', '', '1981-1-2', 'M', 0, '', 0, 1, '', '2023-01-01', 0, '', '', 1, 1, '2023-01-18 10:06:42', '2023-01-18 10:06:42'),
	('P000008', '', 'Melanisa', '78988565555', 'admi223n@jasa.com', '', '', '1990-1-1', 'M', 0, '', 0, 1, '', '2023-01-01', 0, '', '', 1, 1, '2023-01-24 10:10:18', '2023-01-24 10:10:18'),
	('P000009', '', 'Leonhard', '77774434', 'Leonhard@email.com', '', '', '1990-1-19', 'M', 0, '', 0, 1, '', '2023-01-01', 0, '', '', 1, 1, '2023-01-25 10:01:18', '2023-01-25 10:01:18'),
	('P000010', '', 'talita', '009944333333', 'talita@uaoo.com', '', '', '1981-1-2', 'F', 2, '', 0, 1, '', '2023-01-01', 0, '', '', 1, 1, '2023-01-25 11:45:02', '2023-01-25 11:45:02');

-- Dumping structure for table hris.personal_access
CREATE TABLE IF NOT EXISTS `personal_access` (
  `id` int NOT NULL AUTO_INCREMENT,
  `personalId` varchar(50) NOT NULL DEFAULT '',
  `token` varchar(50) NOT NULL DEFAULT '',
  `agent` varchar(250) NOT NULL DEFAULT '',
  `client_ip` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(2) NOT NULL DEFAULT '1',
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.personal_access: ~15 rows (approximately)
INSERT INTO `personal_access` (`id`, `personalId`, `token`, `agent`, `client_ip`, `status`, `inputDate`) VALUES
	(1, '1', '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(2, '1', '4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(3, '1', 'c', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(4, '1', 'g', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(6, '1', 'e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(7, '1', '3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(10, '1', 'TT-80706a987e5f0c49364827264baf44af', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '128.199.94.89', '1', '0000-00-00 00:00:00'),
	(16, '1', 'TT-2cd903653c091985e9a44e83c1c9b272', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(18, '1', 'TT-eb6aaa20fd886155953df5abdf0007ac', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '128.199.94.89', '1', '0000-00-00 00:00:00'),
	(27, '1', 'TT-3fede38dc45d1fd97a3b94de24753a97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '128.199.94.89', '1', '0000-00-00 00:00:00'),
	(28, '1', 'TT-8c7ec20dc9349e4288bafbaa5a7fbb64', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(29, '1', 'TT-f028f9b845edfb94fe0dd8fc4a0be9a6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '128.199.94.89', '1', '0000-00-00 00:00:00'),
	(31, '1', 'TT-c6c5e793872543993d96700129a9081f', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '128.199.94.89', '1', '0000-00-00 00:00:00'),
	(34, '1', 'TT-be36ff4d9f0e75bfba405bd22de30525', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '::1', '1', '0000-00-00 00:00:00'),
	(35, '1', 'TT-40a8c51ddf6c3b131c43d46ff1d04351', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '128.199.94.89', '1', '0000-00-00 00:00:00');

-- Dumping structure for table hris.personal_id
CREATE TABLE IF NOT EXISTS `personal_id` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `other` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.personal_id: ~3 rows (approximately)
INSERT INTO `personal_id` (`id`, `name`, `other`) VALUES
	(1, 'KTP', 0),
	(2, 'Passport', 0),
	(3, 'Other', 0);

-- Dumping structure for table hris.personal_load
CREATE TABLE IF NOT EXISTS `personal_load` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loadId` int NOT NULL DEFAULT '0',
  `personalId` varchar(9) NOT NULL DEFAULT '',
  `loadAmount` double NOT NULL DEFAULT '0',
  `installment` int NOT NULL DEFAULT '0',
  `interest` int NOT NULL DEFAULT '0',
  `effectiveDate` date NOT NULL DEFAULT '2023-01-01',
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `updateDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.personal_load: ~0 rows (approximately)

-- Dumping structure for table hris.personal_marital
CREATE TABLE IF NOT EXISTS `personal_marital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `other` int NOT NULL DEFAULT '0',
  `presence` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.personal_marital: ~4 rows (approximately)
INSERT INTO `personal_marital` (`id`, `name`, `other`, `presence`) VALUES
	(1, 'Single', 0, 1),
	(2, 'married', 0, 1),
	(3, 'Widow', 0, 1),
	(4, 'Widower', 0, 1);

-- Dumping structure for table hris.personal_religion
CREATE TABLE IF NOT EXISTS `personal_religion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `other` int NOT NULL DEFAULT '0',
  `presence` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.personal_religion: ~6 rows (approximately)
INSERT INTO `personal_religion` (`id`, `name`, `other`, `presence`) VALUES
	(1, 'Islam', 0, 1),
	(2, 'Christian', 0, 1),
	(3, 'Catholic', 0, 1),
	(4, 'Buddhist', 0, 1),
	(5, 'Hindu', 0, 1),
	(6, 'Others', 0, 1);

-- Dumping structure for table hris.potongan_absen
CREATE TABLE IF NOT EXISTS `potongan_absen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `note` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `minute` time NOT NULL DEFAULT '00:00:00',
  `price` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.potongan_absen: ~0 rows (approximately)

-- Dumping structure for table hris.potongan_keterlambatan
CREATE TABLE IF NOT EXISTS `potongan_keterlambatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `note` varchar(250) NOT NULL DEFAULT '',
  `minute` time NOT NULL DEFAULT '00:00:00',
  `price` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.potongan_keterlambatan: ~4 rows (approximately)
INSERT INTO `potongan_keterlambatan` (`id`, `note`, `minute`, `price`) VALUES
	(1, 'Telat 5 menit', '00:05:00', 10000),
	(11, 'Telat 6-15 menit', '00:06:00', 20000),
	(12, 'Telat 15-30 menit', '00:15:00', 30000),
	(13, 'Telat 30-60 menit', '00:30:00', 100000),
	(100, 'Telat diatas 60 menit', '01:00:00', 10000000);

-- Dumping structure for table hris.pph21_ptkp
CREATE TABLE IF NOT EXISTS `pph21_ptkp` (
  `id` varchar(9) NOT NULL,
  `sorting` int NOT NULL DEFAULT '0',
  `jumlahAnak` int NOT NULL DEFAULT '0',
  `label` varchar(50) NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `presence` int NOT NULL DEFAULT '1',
  `updateDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.pph21_ptkp: ~12 rows (approximately)
INSERT INTO `pph21_ptkp` (`id`, `sorting`, `jumlahAnak`, `label`, `amount`, `presence`, `updateDate`) VALUES
	('K/0', 1, 0, 'PTKP Kawin ', 58500000, 1, '2023-04-05 11:35:51'),
	('K/1', 2, 1, 'PTKP Kawin ', 63000000, 1, '2023-04-05 11:35:51'),
	('K/2', 3, 2, 'PTKP Kawin ', 67500000, 1, '2023-04-05 11:35:51'),
	('K/3', 4, 3, 'PTKP Kawin ', 72000000, 1, '2023-04-05 11:35:51'),
	('K/I/0', 21, 0, 'PTKP Gabungan Suami-Istri', 112500000, 1, '2023-04-05 11:35:51'),
	('K/I/1', 22, 1, 'PTKP Gabungan Suami-Istri', 117000000, 1, '2023-04-05 11:35:51'),
	('K/I/2', 23, 2, 'PTKP Gabungan Suami-Istri', 121500000, 1, '2023-04-05 11:35:51'),
	('K/I/3', 24, 3, 'PTKP Gabungan Suami-Istri', 126500000, 1, '2023-04-05 11:35:51'),
	('TK/0', 11, 0, 'PTKP Tidak Kawin ', 54000000, 1, '2023-04-05 11:35:51'),
	('TK/1', 12, 1, 'PTKP Tidak Kawin ', 58500000, 1, '2023-04-05 11:35:51'),
	('TK/2', 13, 2, 'PTKP Tidak Kawin ', 63000000, 1, '2023-04-05 11:35:51'),
	('TK/3', 14, 3, 'PTKP Tidak Kawin ', 67500000, 1, '2023-04-05 11:35:51');

-- Dumping structure for table hris.pph21_tarif_pajak
CREATE TABLE IF NOT EXISTS `pph21_tarif_pajak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `note` varchar(250) NOT NULL DEFAULT '',
  `minAmount` double NOT NULL DEFAULT '0',
  `maxAmount` double NOT NULL DEFAULT '0',
  `taxPercent` float NOT NULL DEFAULT '0',
  `presence` int NOT NULL DEFAULT '1',
  `updateDate` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.pph21_tarif_pajak: ~5 rows (approximately)
INSERT INTO `pph21_tarif_pajak` (`id`, `note`, `minAmount`, `maxAmount`, `taxPercent`, `presence`, `updateDate`) VALUES
	(1, '', 0, 60000000, 5, 1, '2023-04-05 11:35:51'),
	(2, '', 60000001, 250000000, 15, 1, '2023-04-05 11:35:51'),
	(3, '', 250000001, 500000000, 25, 1, '2023-04-05 11:35:51'),
	(4, '', 500000001, 5000000000, 30, 1, '2023-04-05 11:35:51'),
	(5, '', 5000000001, 99999999999, 35, 1, '2023-04-05 11:35:51');

-- Dumping structure for table hris.reimbursement
CREATE TABLE IF NOT EXISTS `reimbursement` (
  `id` varchar(50) NOT NULL,
  `personalId` varchar(50) NOT NULL DEFAULT '',
  `reimbursementNameId` int NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `requestAmount` double NOT NULL DEFAULT '0',
  `paidAmount` double NOT NULL DEFAULT '0',
  `requestDate` date NOT NULL,
  `approved` int NOT NULL DEFAULT '0',
  `approvedBy` varchar(50) NOT NULL DEFAULT '',
  `approvedDate` datetime DEFAULT NULL,
  `presence` int NOT NULL DEFAULT '1',
  `inputDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.reimbursement: ~12 rows (approximately)
INSERT INTO `reimbursement` (`id`, `personalId`, `reimbursementNameId`, `description`, `requestAmount`, `paidAmount`, `requestDate`, `approved`, `approvedBy`, `approvedDate`, `presence`, `inputDate`, `updateDate`) VALUES
	('REM000019', 'P000003', 5, 'Description Description', 80000, 2444220, '2023-01-19', 0, 'P0004', '2023-01-19 11:47:52', 0, '2023-01-19 11:54:50', '2023-01-19 11:54:50'),
	('REM000020', 'P000004', 6, 'ok', 555530, 555530, '2023-01-19', 0, '0', '2023-01-19 11:34:46', 0, '2023-01-19 11:54:54', '2023-01-19 11:54:54'),
	('REM000021', 'P000007', 6, '123123', 33320, 33320, '2023-01-19', 0, '0', '2023-01-19 11:34:59', 1, '2023-01-19 09:47:16', '2023-01-19 11:34:59'),
	('REM000023', 'P000003', 5, '234234324', 312320, 23440, '2023-01-19', 1, '1', '2023-02-06 13:25:34', 1, '2023-01-19 11:33:24', '2023-02-06 13:25:34'),
	('REM000024', 'P000004', 5, 'Description', 444110, 0, '2023-01-24', 4, '1', '2023-02-06 13:25:42', 1, '2023-01-24 10:07:40', '2023-02-06 13:25:42'),
	('REM000025', 'P000003', 4, 'SPG stuf', 50000000, 0, '2023-02-06', 0, '', NULL, 1, '2023-02-06 11:12:06', NULL),
	('REM000026', '1', 4, 'Description hhh332333', 88888650, 60006500, '2023-02-09', 1, '1', '2023-02-06 13:27:49', 1, '2023-02-06 11:53:35', '2023-02-06 13:27:49'),
	('REM000027', 'P000003', 6, '', 2222250, 2222250, '2023-02-06', 1, '1', '2023-02-06 13:25:52', 1, '2023-02-06 12:14:02', '2023-02-06 13:25:52'),
	('REM000028', 'P000003', 6, '', 2222250, 0, '2023-02-06', 0, '', NULL, 0, '2023-02-06 12:14:17', '2023-02-06 12:14:17'),
	('REM000029', 'P000003', 5, '', 41130, 0, '2023-02-06', 0, '', NULL, 0, '2023-02-06 13:26:45', '2023-02-06 13:26:45'),
	('REM000030', 'P000003', 6, '', 41441, 41441, '2023-02-06', 4, '1', '2023-02-06 13:26:55', 1, '2023-02-06 12:16:30', '2023-02-06 13:26:55'),
	('REM000031', 'P000003', 5, '31', 333120, 0, '2023-02-06', 0, '', NULL, 1, '2023-02-06 12:17:14', NULL),
	('REM000032', 'P000003', 5, '', 6000000, 0, '2023-02-08', 0, '', NULL, 1, '2023-02-08 05:43:01', NULL),
	('REM000033', '1', 5, 'Description', 44221110, 0, '2023-02-14', 0, '', NULL, 1, '2023-02-14 10:43:55', NULL);

-- Dumping structure for table hris.reimbursement_name
CREATE TABLE IF NOT EXISTS `reimbursement_name` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `presence` int NOT NULL DEFAULT '1',
  `inputDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.reimbursement_name: ~4 rows (approximately)
INSERT INTO `reimbursement_name` (`id`, `name`, `presence`, `inputDate`) VALUES
	(4, 'Pewaratan', 1, NULL),
	(5, 'kaca mata', 1, NULL),
	(6, 'transportasi', 1, NULL),
	(7, '123123', 1, NULL);

-- Dumping structure for table hris.salary
CREATE TABLE IF NOT EXISTS `salary` (
  `id` varchar(50) NOT NULL,
  `periodStartDate` date DEFAULT NULL,
  `periodEndDate` date DEFAULT NULL,
  `asLock` int NOT NULL DEFAULT '0',
  `personalId` varchar(50) DEFAULT NULL,
  `tunjanganTetap` double DEFAULT '0',
  `tunjanganTidakTetap` double DEFAULT '0',
  `potongan` double DEFAULT '0',
  `takeHomePay` double DEFAULT '0',
  `presence` int NOT NULL DEFAULT '1',
  `inputDate` datetime DEFAULT '2023-01-01 00:00:00',
  `updateDate` datetime DEFAULT '2023-01-01 00:00:00',
  `inputBy` varchar(50) DEFAULT NULL,
  `updateBy` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hris.salary: ~8 rows (approximately)
INSERT INTO `salary` (`id`, `periodStartDate`, `periodEndDate`, `asLock`, `personalId`, `tunjanganTetap`, `tunjanganTidakTetap`, `potongan`, `takeHomePay`, `presence`, `inputDate`, `updateDate`, `inputBy`, `updateBy`) VALUES
	('S000027.643420fb206c4', '2023-01-01', '2023-04-25', 0, 'P000003', 0, 0, 0, 0, 0, '2023-04-10 16:45:15', '2023-01-01 00:00:00', '0', NULL),
	('S000028.643421c2e0ce8', '2023-01-01', '2023-04-25', 0, 'P000003', 0, 0, 0, 0, 0, '2023-04-10 16:48:34', '2023-01-01 00:00:00', '0', NULL),
	('S000029.643422466ae1c', '2023-01-01', '2023-01-25', 0, 'P000003', 12000000, 20000, 0, 12020000, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	('S000030.64342766023b9', '2023-01-01', '2023-01-25', 0, 'P000003', 0, 0, 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	('S000031.643427bb8034d', '2023-01-01', '2023-01-25', 0, 'P000003', 0, 0, 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL);

-- Dumping structure for table hris.salary_detail
CREATE TABLE IF NOT EXISTS `salary_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salaryId` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sorting` int DEFAULT NULL,
  `label` varchar(50) DEFAULT '',
  `value` double DEFAULT '0',
  `asLock` int NOT NULL DEFAULT '0',
  `presence` int NOT NULL DEFAULT '1',
  `inputDate` datetime DEFAULT '2023-01-01 00:00:00',
  `updateDate` datetime DEFAULT '2023-01-01 00:00:00',
  `inputBy` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updateBy` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.salary_detail: ~0 rows (approximately)
INSERT INTO `salary_detail` (`id`, `salaryId`, `sorting`, `label`, `value`, `asLock`, `presence`, `inputDate`, `updateDate`, `inputBy`, `updateBy`) VALUES
	(141, 'S000027.643420fb206c4', 100, 'Gaji Pokok', 12000000, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:19', '0', '0'),
	(142, 'S000027.643420fb206c4', 101, 'Transport', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:19', '0', '0'),
	(143, 'S000027.643420fb206c4', 102, 'ACA', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:19', '0', '0'),
	(144, 'S000027.643420fb206c4', 103, 'U/Makan', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(145, 'S000027.643420fb206c4', 104, 'T.Gol', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(146, 'S000027.643420fb206c4', 105, 'Askes', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(147, 'S000027.643420fb206c4', 202, 'U/Makan Tidak Tetap', 10000, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(148, 'S000027.643420fb206c4', 201, 'U/Transport', 10000, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(149, 'S000027.643420fb206c4', 203, 'T. Jabatan', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(150, 'S000027.643420fb206c4', 204, 'B. Absen', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(151, 'S000027.643420fb206c4', 205, 'Lembur', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(152, 'S000027.643420fb206c4', 206, 'T. Kasir', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(153, 'S000027.643420fb206c4', 207, 'Kekurangan Bulan Lalu', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(154, 'S000027.643420fb206c4', 301, 'Kelebihan Bulan Lalu', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(155, 'S000027.643420fb206c4', 302, 'Keterlambatan', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(156, 'S000027.643420fb206c4', 303, 'Izin Tidak Resmi', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(157, 'S000027.643420fb206c4', 304, 'ALPA', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(158, 'S000027.643420fb206c4', 305, 'Kasbon', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(159, 'S000027.643420fb206c4', 306, 'JAMSOSTEK', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(160, 'S000027.643420fb206c4', 307, 'PPH psl 21', 0, 0, 0, '2023-04-10 16:45:15', '2023-04-10 16:45:20', '0', '0'),
	(161, 'S000028.643421c2e0ce8', 100, 'Gaji Pokok', 12000000, 0, 0, '2023-04-10 16:48:34', '2023-01-01 00:00:00', '0', NULL),
	(162, 'S000028.643421c2e0ce8', 101, 'Transport', 0, 0, 0, '2023-04-10 16:48:34', '2023-01-01 00:00:00', '0', NULL),
	(163, 'S000028.643421c2e0ce8', 102, 'ACA', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(164, 'S000028.643421c2e0ce8', 103, 'U/Makan', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(165, 'S000028.643421c2e0ce8', 104, 'T.Gol', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(166, 'S000028.643421c2e0ce8', 105, 'Askes', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(167, 'S000028.643421c2e0ce8', 202, 'U/Makan Tidak Tetap', 10000, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(168, 'S000028.643421c2e0ce8', 201, 'U/Transport', 10000, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(169, 'S000028.643421c2e0ce8', 203, 'T. Jabatan', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(170, 'S000028.643421c2e0ce8', 204, 'B. Absen', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(171, 'S000028.643421c2e0ce8', 205, 'Lembur', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(172, 'S000028.643421c2e0ce8', 206, 'T. Kasir', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(173, 'S000028.643421c2e0ce8', 207, 'Kekurangan Bulan Lalu', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(174, 'S000028.643421c2e0ce8', 301, 'Kelebihan Bulan Lalu', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(175, 'S000028.643421c2e0ce8', 302, 'Keterlambatan', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(176, 'S000028.643421c2e0ce8', 303, 'Izin Tidak Resmi', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(177, 'S000028.643421c2e0ce8', 304, 'ALPA', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(178, 'S000028.643421c2e0ce8', 305, 'Kasbon', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(179, 'S000028.643421c2e0ce8', 306, 'JAMSOSTEK', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(180, 'S000028.643421c2e0ce8', 307, 'PPH psl 21', 0, 0, 0, '2023-04-10 16:48:35', '2023-01-01 00:00:00', '0', NULL),
	(181, 'S000029.643422466ae1c', 100, 'Gaji Pokok', 12000000, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(182, 'S000029.643422466ae1c', 101, 'Transport', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(183, 'S000029.643422466ae1c', 102, 'ACA', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(184, 'S000029.643422466ae1c', 103, 'U/Makan', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(185, 'S000029.643422466ae1c', 104, 'T.Gol', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(186, 'S000029.643422466ae1c', 105, 'Askes', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(187, 'S000029.643422466ae1c', 202, 'U/Makan Tidak Tetap', 10000, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(188, 'S000029.643422466ae1c', 201, 'U/Transport', 10000, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(189, 'S000029.643422466ae1c', 203, 'T. Jabatan', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(190, 'S000029.643422466ae1c', 204, 'B. Absen', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(191, 'S000029.643422466ae1c', 205, 'Lembur', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(192, 'S000029.643422466ae1c', 206, 'T. Kasir', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(193, 'S000029.643422466ae1c', 207, 'Kekurangan Bulan Lalu', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(194, 'S000029.643422466ae1c', 301, 'Kelebihan Bulan Lalu', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(195, 'S000029.643422466ae1c', 302, 'Keterlambatan', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(196, 'S000029.643422466ae1c', 303, 'Izin Tidak Resmi', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(197, 'S000029.643422466ae1c', 304, 'ALPA', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(198, 'S000029.643422466ae1c', 305, 'Kasbon', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(199, 'S000029.643422466ae1c', 306, 'JAMSOSTEK', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(200, 'S000029.643422466ae1c', 307, 'PPH psl 21', 0, 0, 0, '2023-04-10 16:50:46', '2023-04-10 16:54:50', '0', '0'),
	(201, 'S000030.64342766023b9', 100, 'Gaji Pokok', 12000000, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(202, 'S000030.64342766023b9', 101, 'Transport', 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(203, 'S000030.64342766023b9', 102, 'ACA', 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(204, 'S000030.64342766023b9', 103, 'U/Makan', 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(205, 'S000030.64342766023b9', 104, 'T.Gol', 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(206, 'S000030.64342766023b9', 105, 'Askes', 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(207, 'S000030.64342766023b9', 202, 'U/Makan Tidak Tetap', 10000, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(208, 'S000030.64342766023b9', 201, 'U/Transport', 10000, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(209, 'S000030.64342766023b9', 203, 'T. Jabatan', 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(210, 'S000030.64342766023b9', 204, 'B. Absen', 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(211, 'S000030.64342766023b9', 205, 'Lembur', 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(212, 'S000030.64342766023b9', 206, 'T. Kasir', 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(213, 'S000030.64342766023b9', 207, 'Kekurangan Bulan Lalu', 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(214, 'S000030.64342766023b9', 301, 'Kelebihan Bulan Lalu', 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(215, 'S000030.64342766023b9', 302, 'Keterlambatan', 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(216, 'S000030.64342766023b9', 303, 'Izin Tidak Resmi', 0, 0, 1, '2023-04-10 17:12:38', '2023-01-01 00:00:00', '0', NULL),
	(217, 'S000030.64342766023b9', 304, 'ALPA', 0, 0, 1, '2023-04-10 17:12:39', '2023-01-01 00:00:00', '0', NULL),
	(218, 'S000030.64342766023b9', 305, 'Kasbon', 0, 0, 1, '2023-04-10 17:12:39', '2023-01-01 00:00:00', '0', NULL),
	(219, 'S000030.64342766023b9', 306, 'JAMSOSTEK', 0, 0, 1, '2023-04-10 17:12:39', '2023-01-01 00:00:00', '0', NULL),
	(220, 'S000030.64342766023b9', 307, 'PPH psl 21', 0, 0, 1, '2023-04-10 17:12:39', '2023-01-01 00:00:00', '0', NULL),
	(221, 'S000031.643427bb8034d', 100, 'Gaji Pokok', 12000000, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(222, 'S000031.643427bb8034d', 101, 'Transport', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(223, 'S000031.643427bb8034d', 102, 'ACA', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(224, 'S000031.643427bb8034d', 103, 'U/Makan', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(225, 'S000031.643427bb8034d', 104, 'T.Gol', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(226, 'S000031.643427bb8034d', 105, 'Askes', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(227, 'S000031.643427bb8034d', 202, 'U/Makan Tidak Tetap', 10000, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(228, 'S000031.643427bb8034d', 201, 'U/Transport', 10000, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(229, 'S000031.643427bb8034d', 203, 'T. Jabatan', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(230, 'S000031.643427bb8034d', 204, 'B. Absen', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(231, 'S000031.643427bb8034d', 205, 'Lembur', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(232, 'S000031.643427bb8034d', 206, 'T. Kasir', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(233, 'S000031.643427bb8034d', 207, 'Kekurangan Bulan Lalu', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(234, 'S000031.643427bb8034d', 301, 'Kelebihan Bulan Lalu', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(235, 'S000031.643427bb8034d', 302, 'Keterlambatan', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(236, 'S000031.643427bb8034d', 303, 'Izin Tidak Resmi', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(237, 'S000031.643427bb8034d', 304, 'ALPA', 0, 0, 1, '2023-04-10 17:14:03', '2023-01-01 00:00:00', '0', NULL),
	(238, 'S000031.643427bb8034d', 305, 'Kasbon', 0, 0, 1, '2023-04-10 17:14:04', '2023-01-01 00:00:00', '0', NULL),
	(239, 'S000031.643427bb8034d', 306, 'JAMSOSTEK', 0, 0, 1, '2023-04-10 17:14:04', '2023-01-01 00:00:00', '0', NULL),
	(240, 'S000031.643427bb8034d', 307, 'PPH psl 21', 0, 0, 1, '2023-04-10 17:14:04', '2023-01-01 00:00:00', '0', NULL);

-- Dumping structure for table hris.salary_label
CREATE TABLE IF NOT EXISTS `salary_label` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(50) DEFAULT NULL,
  `value` double DEFAULT '0',
  `sorting` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.salary_label: ~0 rows (approximately)
INSERT INTO `salary_label` (`id`, `label`, `value`, `sorting`, `status`) VALUES
	(1, 'Gaji Pokok', 0, 100, 1),
	(2, 'Transport', 0, 101, 1),
	(3, 'ACA', 0, 102, 1),
	(4, 'U/Makan', 0, 103, 1),
	(5, 'T.Gol', 0, 104, 1),
	(6, 'Askes', 0, 105, 1),
	(7, 'U/Makan Tidak Tetap', 10000, 202, 1),
	(8, 'U/Transport', 10000, 201, 1),
	(9, 'T. Jabatan', 0, 203, 1),
	(10, 'B. Absen', 0, 204, 1),
	(11, 'Lembur', 0, 205, 1),
	(12, 'T. Kasir', 0, 206, 1),
	(13, 'Kekurangan Bulan Lalu', 0, 207, 1),
	(15, 'Kelebihan Bulan Lalu', 0, 301, 1),
	(16, 'Keterlambatan', 0, 302, 1),
	(17, 'Izin Tidak Resmi', 0, 303, 1),
	(18, 'ALPA', 0, 304, 1),
	(19, 'Kasbon', 0, 305, 1),
	(20, 'JAMSOSTEK', 0, 306, 1),
	(21, 'PPH psl 21', 0, 307, 1),
	(148, 'Lain lain', 0, 1000, 0);

-- Dumping structure for table hris.salary_time
CREATE TABLE IF NOT EXISTS `salary_time` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salaryId` varchar(50) NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '2023-01-01',
  `hour` varchar(50) NOT NULL DEFAULT '0',
  `job` varchar(50) NOT NULL DEFAULT '0',
  `checkIn` time NOT NULL DEFAULT '00:00:00',
  `checkOut` time NOT NULL DEFAULT '00:00:00',
  `workingHour` time NOT NULL DEFAULT '00:00:00',
  `late` time NOT NULL DEFAULT '00:00:00',
  `quickly` time NOT NULL DEFAULT '00:00:00',
  `overtime` time NOT NULL DEFAULT '00:00:00',
  `workDay` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `shiftId` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `timeManagementId` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `presence` int NOT NULL DEFAULT '1',
  `inputDate` datetime NOT NULL DEFAULT '2022-01-01 00:00:00',
  `inputBy` varchar(50) NOT NULL DEFAULT '',
  `updateDate` datetime NOT NULL DEFAULT '2022-01-01 00:00:00',
  `updateBy` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=latin1;

-- Dumping data for table hris.salary_time: ~0 rows (approximately)
INSERT INTO `salary_time` (`id`, `salaryId`, `amount`, `date`, `hour`, `job`, `checkIn`, `checkOut`, `workingHour`, `late`, `quickly`, `overtime`, `workDay`, `shiftId`, `timeManagementId`, `presence`, `inputDate`, `inputBy`, `updateDate`, `updateBy`) VALUES
	(197, 'S000027.643420fb206c4', 0, '2023-01-01', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '4960', 0, '2023-04-10 16:45:15', '0', '2023-04-10 16:45:15', '0'),
	(198, 'S000027.643420fb206c4', 0, '2023-01-02', '06:00-19:00', 'WEEKDAY', '23:50:00', '23:50:00', '14:46:00', '03:04:00', '00:00:00', '04:50:00', '1', 'W', '4969', 0, '2023-04-10 16:45:15', '0', '2023-04-10 16:45:15', '0'),
	(199, 'S000027.643420fb206c4', 0, '2023-01-03', '06:00-19:00', 'WEEKDAY', '17:56:00', '17:56:00', '08:56:00', '03:00:00', '01:04:00', '00:00:00', '1', 'W', '4983', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(200, 'S000027.643420fb206c4', 0, '2023-01-04', '06:00-19:00', 'WEEKDAY', '18:04:00', '18:04:00', '08:52:00', '03:12:00', '00:56:00', '00:00:00', '1', 'W', '4984', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(201, 'S000027.643420fb206c4', 0, '2023-01-05', '06:00-19:00', 'WEEKDAY', '18:02:00', '18:02:00', '08:49:00', '03:13:00', '00:58:00', '00:00:00', '1', 'W', '4998', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(202, 'S000027.643420fb206c4', 0, '2023-01-06', '06:00-19:00', 'WEEKDAY', '18:08:00', '18:08:00', '08:58:00', '03:10:00', '00:52:00', '00:00:00', '1', 'W', '5007', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(203, 'S000027.643420fb206c4', 0, '2023-01-07', '06:00-19:00', 'WEEKDAY', '20:00:00', '20:00:00', '05:10:00', '08:50:00', '00:00:00', '01:00:00', '1', 'W', '5009', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(204, 'S000027.643420fb206c4', 0, '2023-01-08', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '5023', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(205, 'S000027.643420fb206c4', 0, '2023-01-09', '06:00-19:00', 'WEEKDAY', '18:06:00', '18:06:00', '09:08:00', '02:58:00', '00:54:00', '00:00:00', '1', 'W', '5029', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(206, 'S000027.643420fb206c4', 0, '2023-01-10', '06:00-19:00', 'WEEKDAY', '18:02:00', '18:02:00', '09:11:00', '02:51:00', '00:58:00', '00:00:00', '1', 'W', '5037', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(207, 'S000027.643420fb206c4', 0, '2023-01-11', '06:00-19:00', 'WEEKDAY', '18:00:00', '18:00:00', '08:59:00', '03:01:00', '01:00:00', '00:00:00', '1', 'W', '5044', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(208, 'S000027.643420fb206c4', 0, '2023-01-12', '06:00-19:00', 'WEEKDAY', '18:16:00', '18:16:00', '09:15:00', '03:01:00', '00:44:00', '00:00:00', '1', 'W', '5051', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(209, 'S000027.643420fb206c4', 0, '2023-01-13', '06:00-19:00', 'WEEKDAY', '18:07:00', '18:07:00', '09:09:00', '02:58:00', '00:53:00', '00:00:00', '1', 'W', '5059', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(210, 'S000027.643420fb206c4', 0, '2023-01-14', '06:00-19:00', 'WEEKDAY', '14:59:00', '14:59:00', '05:52:00', '03:07:00', '04:01:00', '00:00:00', '1', 'W', '5066', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(211, 'S000027.643420fb206c4', 0, '2023-01-15', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '5073', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(212, 'S000027.643420fb206c4', 0, '2023-01-16', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5087', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(213, 'S000027.643420fb206c4', 0, '2023-01-17', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5091', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(214, 'S000027.643420fb206c4', 0, '2023-01-18', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5098', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(215, 'S000027.643420fb206c4', 0, '2023-01-19', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5108', 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(216, 'S000027.643420fb206c4', 0, '2023-01-20', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(217, 'S000027.643420fb206c4', 0, '2023-01-21', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(218, 'S000027.643420fb206c4', 0, '2023-01-22', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(219, 'S000027.643420fb206c4', 0, '2023-01-23', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(220, 'S000027.643420fb206c4', 0, '2023-01-24', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(221, 'S000027.643420fb206c4', 0, '2023-01-25', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(222, 'S000027.643420fb206c4', 0, '2023-01-26', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(223, 'S000027.643420fb206c4', 0, '2023-01-27', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(224, 'S000027.643420fb206c4', 0, '2023-01-28', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(225, 'S000027.643420fb206c4', 0, '2023-01-29', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(226, 'S000027.643420fb206c4', 0, '2023-01-30', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(227, 'S000027.643420fb206c4', 0, '2023-01-31', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(228, 'S000027.643420fb206c4', 0, '2023-02-01', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(229, 'S000027.643420fb206c4', 0, '2023-02-02', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(230, 'S000027.643420fb206c4', 0, '2023-02-03', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(231, 'S000027.643420fb206c4', 0, '2023-02-04', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(232, 'S000027.643420fb206c4', 0, '2023-02-05', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(233, 'S000027.643420fb206c4', 0, '2023-02-06', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(234, 'S000027.643420fb206c4', 0, '2023-02-07', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(235, 'S000027.643420fb206c4', 0, '2023-02-08', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(236, 'S000027.643420fb206c4', 0, '2023-02-09', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:16', '0', '2023-04-10 16:45:16', '0'),
	(237, 'S000027.643420fb206c4', 0, '2023-02-10', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(238, 'S000027.643420fb206c4', 0, '2023-02-11', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(239, 'S000027.643420fb206c4', 0, '2023-02-12', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(240, 'S000027.643420fb206c4', 0, '2023-02-13', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(241, 'S000027.643420fb206c4', 0, '2023-02-14', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(242, 'S000027.643420fb206c4', 0, '2023-02-15', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(243, 'S000027.643420fb206c4', 0, '2023-02-16', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(244, 'S000027.643420fb206c4', 0, '2023-02-17', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(245, 'S000027.643420fb206c4', 0, '2023-02-18', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(246, 'S000027.643420fb206c4', 0, '2023-02-19', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(247, 'S000027.643420fb206c4', 0, '2023-02-20', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(248, 'S000027.643420fb206c4', 0, '2023-02-21', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(249, 'S000027.643420fb206c4', 0, '2023-02-22', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(250, 'S000027.643420fb206c4', 0, '2023-02-23', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(251, 'S000027.643420fb206c4', 0, '2023-02-24', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(252, 'S000027.643420fb206c4', 0, '2023-02-25', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(253, 'S000027.643420fb206c4', 0, '2023-02-26', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(254, 'S000027.643420fb206c4', 0, '2023-02-27', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(255, 'S000027.643420fb206c4', 0, '2023-02-28', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(256, 'S000027.643420fb206c4', 0, '2023-03-01', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(257, 'S000027.643420fb206c4', 0, '2023-03-02', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(258, 'S000027.643420fb206c4', 0, '2023-03-03', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(259, 'S000027.643420fb206c4', 0, '2023-03-04', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(260, 'S000027.643420fb206c4', 0, '2023-03-05', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(261, 'S000027.643420fb206c4', 0, '2023-03-06', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(262, 'S000027.643420fb206c4', 0, '2023-03-07', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(263, 'S000027.643420fb206c4', 0, '2023-03-08', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(264, 'S000027.643420fb206c4', 0, '2023-03-09', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(265, 'S000027.643420fb206c4', 0, '2023-03-10', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(266, 'S000027.643420fb206c4', 0, '2023-03-11', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(267, 'S000027.643420fb206c4', 0, '2023-03-12', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(268, 'S000027.643420fb206c4', 0, '2023-03-13', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(269, 'S000027.643420fb206c4', 0, '2023-03-14', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(270, 'S000027.643420fb206c4', 0, '2023-03-15', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(271, 'S000027.643420fb206c4', 0, '2023-03-16', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(272, 'S000027.643420fb206c4', 0, '2023-03-17', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(273, 'S000027.643420fb206c4', 0, '2023-03-18', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(274, 'S000027.643420fb206c4', 0, '2023-03-19', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(275, 'S000027.643420fb206c4', 0, '2023-03-20', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:17', '0', '2023-04-10 16:45:17', '0'),
	(276, 'S000027.643420fb206c4', 0, '2023-03-21', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(277, 'S000027.643420fb206c4', 0, '2023-03-22', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(278, 'S000027.643420fb206c4', 0, '2023-03-23', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(279, 'S000027.643420fb206c4', 0, '2023-03-24', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(280, 'S000027.643420fb206c4', 0, '2023-03-25', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(281, 'S000027.643420fb206c4', 0, '2023-03-26', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(282, 'S000027.643420fb206c4', 0, '2023-03-27', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(283, 'S000027.643420fb206c4', 0, '2023-03-28', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(284, 'S000027.643420fb206c4', 0, '2023-03-29', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(285, 'S000027.643420fb206c4', 0, '2023-03-30', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(286, 'S000027.643420fb206c4', 0, '2023-03-31', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(287, 'S000027.643420fb206c4', 0, '2023-04-01', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(288, 'S000027.643420fb206c4', 0, '2023-04-02', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(289, 'S000027.643420fb206c4', 0, '2023-04-03', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(290, 'S000027.643420fb206c4', 0, '2023-04-04', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(291, 'S000027.643420fb206c4', 0, '2023-04-05', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(292, 'S000027.643420fb206c4', 0, '2023-04-06', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(293, 'S000027.643420fb206c4', 0, '2023-04-07', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(294, 'S000027.643420fb206c4', 0, '2023-04-08', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(295, 'S000027.643420fb206c4', 0, '2023-04-09', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(296, 'S000027.643420fb206c4', 0, '2023-04-10', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:18', '0', '2023-04-10 16:45:18', '0'),
	(297, 'S000027.643420fb206c4', 0, '2023-04-11', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(298, 'S000027.643420fb206c4', 0, '2023-04-12', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(299, 'S000027.643420fb206c4', 0, '2023-04-13', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(300, 'S000027.643420fb206c4', 0, '2023-04-14', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(301, 'S000027.643420fb206c4', 0, '2023-04-15', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(302, 'S000027.643420fb206c4', 0, '2023-04-16', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(303, 'S000027.643420fb206c4', 0, '2023-04-17', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(304, 'S000027.643420fb206c4', 0, '2023-04-18', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(305, 'S000027.643420fb206c4', 0, '2023-04-19', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(306, 'S000027.643420fb206c4', 0, '2023-04-20', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(307, 'S000027.643420fb206c4', 0, '2023-04-21', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(308, 'S000027.643420fb206c4', 0, '2023-04-22', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(309, 'S000027.643420fb206c4', 0, '2023-04-23', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(310, 'S000027.643420fb206c4', 0, '2023-04-24', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(311, 'S000027.643420fb206c4', 0, '2023-04-25', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:45:19', '0', '2023-04-10 16:45:19', '0'),
	(312, 'S000028.643421c2e0ce8', 0, '2023-01-01', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '4960', 0, '2023-04-10 16:48:35', '0', '2023-04-10 16:48:35', '0'),
	(313, 'S000028.643421c2e0ce8', 0, '2023-01-02', '06:00-19:00', 'WEEKDAY', '23:50:00', '23:50:00', '14:46:00', '03:04:00', '00:00:00', '04:50:00', '1', 'W', '4969', 0, '2023-04-10 16:48:35', '0', '2023-04-10 16:48:35', '0'),
	(314, 'S000028.643421c2e0ce8', 0, '2023-01-03', '06:00-19:00', 'WEEKDAY', '17:56:00', '17:56:00', '08:56:00', '03:00:00', '01:04:00', '00:00:00', '1', 'W', '4983', 0, '2023-04-10 16:48:35', '0', '2023-04-10 16:48:35', '0'),
	(315, 'S000028.643421c2e0ce8', 0, '2023-01-04', '06:00-19:00', 'WEEKDAY', '18:04:00', '18:04:00', '08:52:00', '03:12:00', '00:56:00', '00:00:00', '1', 'W', '4984', 0, '2023-04-10 16:48:35', '0', '2023-04-10 16:48:35', '0'),
	(316, 'S000028.643421c2e0ce8', 0, '2023-01-05', '06:00-19:00', 'WEEKDAY', '18:02:00', '18:02:00', '08:49:00', '03:13:00', '00:58:00', '00:00:00', '1', 'W', '4998', 0, '2023-04-10 16:48:35', '0', '2023-04-10 16:48:35', '0'),
	(317, 'S000028.643421c2e0ce8', 0, '2023-01-06', '06:00-19:00', 'WEEKDAY', '18:08:00', '18:08:00', '08:58:00', '03:10:00', '00:52:00', '00:00:00', '1', 'W', '5007', 0, '2023-04-10 16:48:35', '0', '2023-04-10 16:48:35', '0'),
	(318, 'S000028.643421c2e0ce8', 0, '2023-01-07', '06:00-19:00', 'WEEKDAY', '20:00:00', '20:00:00', '05:10:00', '08:50:00', '00:00:00', '01:00:00', '1', 'W', '5009', 0, '2023-04-10 16:48:35', '0', '2023-04-10 16:48:35', '0'),
	(319, 'S000028.643421c2e0ce8', 0, '2023-01-08', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '5023', 0, '2023-04-10 16:48:35', '0', '2023-04-10 16:48:35', '0'),
	(320, 'S000028.643421c2e0ce8', 0, '2023-01-09', '06:00-19:00', 'WEEKDAY', '18:06:00', '18:06:00', '09:08:00', '02:58:00', '00:54:00', '00:00:00', '1', 'W', '5029', 0, '2023-04-10 16:48:35', '0', '2023-04-10 16:48:35', '0'),
	(321, 'S000028.643421c2e0ce8', 0, '2023-01-10', '06:00-19:00', 'WEEKDAY', '18:02:00', '18:02:00', '09:11:00', '02:51:00', '00:58:00', '00:00:00', '1', 'W', '5037', 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(322, 'S000028.643421c2e0ce8', 0, '2023-01-11', '06:00-19:00', 'WEEKDAY', '18:00:00', '18:00:00', '08:59:00', '03:01:00', '01:00:00', '00:00:00', '1', 'W', '5044', 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(323, 'S000028.643421c2e0ce8', 0, '2023-01-12', '06:00-19:00', 'WEEKDAY', '18:16:00', '18:16:00', '09:15:00', '03:01:00', '00:44:00', '00:00:00', '1', 'W', '5051', 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(324, 'S000028.643421c2e0ce8', 0, '2023-01-13', '06:00-19:00', 'WEEKDAY', '18:07:00', '18:07:00', '09:09:00', '02:58:00', '00:53:00', '00:00:00', '1', 'W', '5059', 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(325, 'S000028.643421c2e0ce8', 0, '2023-01-14', '06:00-19:00', 'WEEKDAY', '14:59:00', '14:59:00', '05:52:00', '03:07:00', '04:01:00', '00:00:00', '1', 'W', '5066', 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(326, 'S000028.643421c2e0ce8', 0, '2023-01-15', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '5073', 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(327, 'S000028.643421c2e0ce8', 0, '2023-01-16', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5087', 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(328, 'S000028.643421c2e0ce8', 0, '2023-01-17', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5091', 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(329, 'S000028.643421c2e0ce8', 0, '2023-01-18', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5098', 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(330, 'S000028.643421c2e0ce8', 0, '2023-01-19', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5108', 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(331, 'S000028.643421c2e0ce8', 0, '2023-01-20', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(332, 'S000028.643421c2e0ce8', 0, '2023-01-21', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(333, 'S000028.643421c2e0ce8', 0, '2023-01-22', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(334, 'S000028.643421c2e0ce8', 0, '2023-01-23', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(335, 'S000028.643421c2e0ce8', 0, '2023-01-24', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(336, 'S000028.643421c2e0ce8', 0, '2023-01-25', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(337, 'S000028.643421c2e0ce8', 0, '2023-01-26', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(338, 'S000028.643421c2e0ce8', 0, '2023-01-27', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(339, 'S000028.643421c2e0ce8', 0, '2023-01-28', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(340, 'S000028.643421c2e0ce8', 0, '2023-01-29', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(341, 'S000028.643421c2e0ce8', 0, '2023-01-30', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(342, 'S000028.643421c2e0ce8', 0, '2023-01-31', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(343, 'S000028.643421c2e0ce8', 0, '2023-02-01', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(344, 'S000028.643421c2e0ce8', 0, '2023-02-02', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(345, 'S000028.643421c2e0ce8', 0, '2023-02-03', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(346, 'S000028.643421c2e0ce8', 0, '2023-02-04', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(347, 'S000028.643421c2e0ce8', 0, '2023-02-05', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(348, 'S000028.643421c2e0ce8', 0, '2023-02-06', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(349, 'S000028.643421c2e0ce8', 0, '2023-02-07', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(350, 'S000028.643421c2e0ce8', 0, '2023-02-08', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(351, 'S000028.643421c2e0ce8', 0, '2023-02-09', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(352, 'S000028.643421c2e0ce8', 0, '2023-02-10', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(353, 'S000028.643421c2e0ce8', 0, '2023-02-11', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(354, 'S000028.643421c2e0ce8', 0, '2023-02-12', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(355, 'S000028.643421c2e0ce8', 0, '2023-02-13', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(356, 'S000028.643421c2e0ce8', 0, '2023-02-14', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(357, 'S000028.643421c2e0ce8', 0, '2023-02-15', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:36', '0', '2023-04-10 16:48:36', '0'),
	(358, 'S000028.643421c2e0ce8', 0, '2023-02-16', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(359, 'S000028.643421c2e0ce8', 0, '2023-02-17', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(360, 'S000028.643421c2e0ce8', 0, '2023-02-18', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(361, 'S000028.643421c2e0ce8', 0, '2023-02-19', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(362, 'S000028.643421c2e0ce8', 0, '2023-02-20', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(363, 'S000028.643421c2e0ce8', 0, '2023-02-21', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(364, 'S000028.643421c2e0ce8', 0, '2023-02-22', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(365, 'S000028.643421c2e0ce8', 0, '2023-02-23', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(366, 'S000028.643421c2e0ce8', 0, '2023-02-24', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(367, 'S000028.643421c2e0ce8', 0, '2023-02-25', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(368, 'S000028.643421c2e0ce8', 0, '2023-02-26', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(369, 'S000028.643421c2e0ce8', 0, '2023-02-27', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(370, 'S000028.643421c2e0ce8', 0, '2023-02-28', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(371, 'S000028.643421c2e0ce8', 0, '2023-03-01', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(372, 'S000028.643421c2e0ce8', 0, '2023-03-02', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(373, 'S000028.643421c2e0ce8', 0, '2023-03-03', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(374, 'S000028.643421c2e0ce8', 0, '2023-03-04', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(375, 'S000028.643421c2e0ce8', 0, '2023-03-05', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(376, 'S000028.643421c2e0ce8', 0, '2023-03-06', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(377, 'S000028.643421c2e0ce8', 0, '2023-03-07', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(378, 'S000028.643421c2e0ce8', 0, '2023-03-08', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:37', '0', '2023-04-10 16:48:37', '0'),
	(379, 'S000028.643421c2e0ce8', 0, '2023-03-09', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(380, 'S000028.643421c2e0ce8', 0, '2023-03-10', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(381, 'S000028.643421c2e0ce8', 0, '2023-03-11', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(382, 'S000028.643421c2e0ce8', 0, '2023-03-12', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(383, 'S000028.643421c2e0ce8', 0, '2023-03-13', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(384, 'S000028.643421c2e0ce8', 0, '2023-03-14', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(385, 'S000028.643421c2e0ce8', 0, '2023-03-15', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(386, 'S000028.643421c2e0ce8', 0, '2023-03-16', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(387, 'S000028.643421c2e0ce8', 0, '2023-03-17', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(388, 'S000028.643421c2e0ce8', 0, '2023-03-18', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(389, 'S000028.643421c2e0ce8', 0, '2023-03-19', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(390, 'S000028.643421c2e0ce8', 0, '2023-03-20', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(391, 'S000028.643421c2e0ce8', 0, '2023-03-21', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(392, 'S000028.643421c2e0ce8', 0, '2023-03-22', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(393, 'S000028.643421c2e0ce8', 0, '2023-03-23', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(394, 'S000028.643421c2e0ce8', 0, '2023-03-24', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(395, 'S000028.643421c2e0ce8', 0, '2023-03-25', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(396, 'S000028.643421c2e0ce8', 0, '2023-03-26', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(397, 'S000028.643421c2e0ce8', 0, '2023-03-27', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(398, 'S000028.643421c2e0ce8', 0, '2023-03-28', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:38', '0', '2023-04-10 16:48:38', '0'),
	(399, 'S000028.643421c2e0ce8', 0, '2023-03-29', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(400, 'S000028.643421c2e0ce8', 0, '2023-03-30', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(401, 'S000028.643421c2e0ce8', 0, '2023-03-31', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(402, 'S000028.643421c2e0ce8', 0, '2023-04-01', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(403, 'S000028.643421c2e0ce8', 0, '2023-04-02', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(404, 'S000028.643421c2e0ce8', 0, '2023-04-03', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(405, 'S000028.643421c2e0ce8', 0, '2023-04-04', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(406, 'S000028.643421c2e0ce8', 0, '2023-04-05', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(407, 'S000028.643421c2e0ce8', 0, '2023-04-06', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(408, 'S000028.643421c2e0ce8', 0, '2023-04-07', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(409, 'S000028.643421c2e0ce8', 0, '2023-04-08', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(410, 'S000028.643421c2e0ce8', 0, '2023-04-09', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(411, 'S000028.643421c2e0ce8', 0, '2023-04-10', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(412, 'S000028.643421c2e0ce8', 0, '2023-04-11', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(413, 'S000028.643421c2e0ce8', 0, '2023-04-12', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(414, 'S000028.643421c2e0ce8', 0, '2023-04-13', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(415, 'S000028.643421c2e0ce8', 0, '2023-04-14', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(416, 'S000028.643421c2e0ce8', 0, '2023-04-15', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(417, 'S000028.643421c2e0ce8', 0, '2023-04-16', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(418, 'S000028.643421c2e0ce8', 0, '2023-04-17', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(419, 'S000028.643421c2e0ce8', 0, '2023-04-18', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(420, 'S000028.643421c2e0ce8', 0, '2023-04-19', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(421, 'S000028.643421c2e0ce8', 0, '2023-04-20', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(422, 'S000028.643421c2e0ce8', 0, '2023-04-21', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(423, 'S000028.643421c2e0ce8', 0, '2023-04-22', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(424, 'S000028.643421c2e0ce8', 0, '2023-04-23', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(425, 'S000028.643421c2e0ce8', 0, '2023-04-24', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(426, 'S000028.643421c2e0ce8', 0, '2023-04-25', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:48:39', '0', '2023-04-10 16:48:39', '0'),
	(427, 'S000029.643422466ae1c', 0, '2023-01-01', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '4960', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(428, 'S000029.643422466ae1c', 0, '2023-01-02', '06:00-19:00', 'WEEKDAY', '23:50:00', '23:50:00', '14:46:00', '03:04:00', '00:00:00', '04:50:00', '1', 'W', '4969', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(429, 'S000029.643422466ae1c', 0, '2023-01-03', '06:00-19:00', 'WEEKDAY', '17:56:00', '17:56:00', '08:56:00', '03:00:00', '01:04:00', '00:00:00', '1', 'W', '4983', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(430, 'S000029.643422466ae1c', 0, '2023-01-04', '06:00-19:00', 'WEEKDAY', '18:04:00', '18:04:00', '08:52:00', '03:12:00', '00:56:00', '00:00:00', '1', 'W', '4984', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(431, 'S000029.643422466ae1c', 0, '2023-01-05', '06:00-19:00', 'WEEKDAY', '18:02:00', '18:02:00', '08:49:00', '03:13:00', '00:58:00', '00:00:00', '1', 'W', '4998', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(432, 'S000029.643422466ae1c', 0, '2023-01-06', '06:00-19:00', 'WEEKDAY', '18:08:00', '18:08:00', '08:58:00', '03:10:00', '00:52:00', '00:00:00', '1', 'W', '5007', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(433, 'S000029.643422466ae1c', 0, '2023-01-07', '06:00-19:00', 'WEEKDAY', '20:00:00', '20:00:00', '05:10:00', '08:50:00', '00:00:00', '01:00:00', '1', 'W', '5009', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(434, 'S000029.643422466ae1c', 0, '2023-01-08', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '5023', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(435, 'S000029.643422466ae1c', 0, '2023-01-09', '06:00-19:00', 'WEEKDAY', '18:06:00', '18:06:00', '09:08:00', '02:58:00', '00:54:00', '00:00:00', '1', 'W', '5029', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(436, 'S000029.643422466ae1c', 0, '2023-01-10', '06:00-19:00', 'WEEKDAY', '18:02:00', '18:02:00', '09:11:00', '02:51:00', '00:58:00', '00:00:00', '1', 'W', '5037', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(437, 'S000029.643422466ae1c', 0, '2023-01-11', '06:00-19:00', 'WEEKDAY', '18:00:00', '18:00:00', '08:59:00', '03:01:00', '01:00:00', '00:00:00', '1', 'W', '5044', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(438, 'S000029.643422466ae1c', 0, '2023-01-12', '06:00-19:00', 'WEEKDAY', '18:16:00', '18:16:00', '09:15:00', '03:01:00', '00:44:00', '00:00:00', '1', 'W', '5051', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(439, 'S000029.643422466ae1c', 0, '2023-01-13', '06:00-19:00', 'WEEKDAY', '18:07:00', '18:07:00', '09:09:00', '02:58:00', '00:53:00', '00:00:00', '1', 'W', '5059', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(440, 'S000029.643422466ae1c', 0, '2023-01-14', '06:00-19:00', 'WEEKDAY', '14:59:00', '14:59:00', '05:52:00', '03:07:00', '04:01:00', '00:00:00', '1', 'W', '5066', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(441, 'S000029.643422466ae1c', 0, '2023-01-15', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '5073', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(442, 'S000029.643422466ae1c', 0, '2023-01-16', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5087', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(443, 'S000029.643422466ae1c', 0, '2023-01-17', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5091', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(444, 'S000029.643422466ae1c', 0, '2023-01-18', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5098', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(445, 'S000029.643422466ae1c', 0, '2023-01-19', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5108', 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(446, 'S000029.643422466ae1c', 0, '2023-01-20', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(447, 'S000029.643422466ae1c', 0, '2023-01-21', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(448, 'S000029.643422466ae1c', 0, '2023-01-22', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(449, 'S000029.643422466ae1c', 0, '2023-01-23', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(450, 'S000029.643422466ae1c', 0, '2023-01-24', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(451, 'S000029.643422466ae1c', 0, '2023-01-25', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 0, '2023-04-10 16:50:47', '0', '2023-04-10 16:50:47', '0'),
	(452, 'S000030.64342766023b9', 0, '2023-01-01', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '4960', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(453, 'S000030.64342766023b9', 0, '2023-01-02', '06:00-19:00', 'WEEKDAY', '23:50:00', '23:50:00', '14:46:00', '03:04:00', '00:00:00', '04:50:00', '1', 'W', '4969', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(454, 'S000030.64342766023b9', 0, '2023-01-03', '06:00-19:00', 'WEEKDAY', '17:56:00', '17:56:00', '08:56:00', '03:00:00', '01:04:00', '00:00:00', '1', 'W', '4983', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(455, 'S000030.64342766023b9', 0, '2023-01-04', '06:00-19:00', 'WEEKDAY', '18:04:00', '18:04:00', '08:52:00', '03:12:00', '00:56:00', '00:00:00', '1', 'W', '4984', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(456, 'S000030.64342766023b9', 0, '2023-01-05', '06:00-19:00', 'WEEKDAY', '18:02:00', '18:02:00', '08:49:00', '03:13:00', '00:58:00', '00:00:00', '1', 'W', '4998', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(457, 'S000030.64342766023b9', 0, '2023-01-06', '06:00-19:00', 'WEEKDAY', '18:08:00', '18:08:00', '08:58:00', '03:10:00', '00:52:00', '00:00:00', '1', 'W', '5007', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(458, 'S000030.64342766023b9', 0, '2023-01-07', '06:00-19:00', 'WEEKDAY', '20:00:00', '20:00:00', '05:10:00', '08:50:00', '00:00:00', '01:00:00', '1', 'W', '5009', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(459, 'S000030.64342766023b9', 0, '2023-01-08', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '5023', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(460, 'S000030.64342766023b9', 0, '2023-01-09', '06:00-19:00', 'WEEKDAY', '18:06:00', '18:06:00', '09:08:00', '02:58:00', '00:54:00', '00:00:00', '1', 'W', '5029', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(461, 'S000030.64342766023b9', 0, '2023-01-10', '06:00-19:00', 'WEEKDAY', '18:02:00', '18:02:00', '09:11:00', '02:51:00', '00:58:00', '00:00:00', '1', 'W', '5037', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(462, 'S000030.64342766023b9', 0, '2023-01-11', '06:00-19:00', 'WEEKDAY', '18:00:00', '18:00:00', '08:59:00', '03:01:00', '01:00:00', '00:00:00', '1', 'W', '5044', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(463, 'S000030.64342766023b9', 0, '2023-01-12', '06:00-19:00', 'WEEKDAY', '18:16:00', '18:16:00', '09:15:00', '03:01:00', '00:44:00', '00:00:00', '1', 'W', '5051', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(464, 'S000030.64342766023b9', 0, '2023-01-13', '06:00-19:00', 'WEEKDAY', '18:07:00', '18:07:00', '09:09:00', '02:58:00', '00:53:00', '00:00:00', '1', 'W', '5059', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(465, 'S000030.64342766023b9', 0, '2023-01-14', '06:00-19:00', 'WEEKDAY', '14:59:00', '14:59:00', '05:52:00', '03:07:00', '04:01:00', '00:00:00', '1', 'W', '5066', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(466, 'S000030.64342766023b9', 0, '2023-01-15', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '5073', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(467, 'S000030.64342766023b9', 0, '2023-01-16', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5087', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(468, 'S000030.64342766023b9', 0, '2023-01-17', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5091', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(469, 'S000030.64342766023b9', 0, '2023-01-18', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5098', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(470, 'S000030.64342766023b9', 0, '2023-01-19', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5108', 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(471, 'S000030.64342766023b9', 0, '2023-01-20', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(472, 'S000030.64342766023b9', 0, '2023-01-21', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 1, '2023-04-10 17:12:39', '0', '2023-04-10 17:12:39', '0'),
	(473, 'S000030.64342766023b9', 0, '2023-01-22', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 1, '2023-04-10 17:12:40', '0', '2023-04-10 17:12:40', '0'),
	(474, 'S000030.64342766023b9', 0, '2023-01-23', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 1, '2023-04-10 17:12:40', '0', '2023-04-10 17:12:40', '0'),
	(475, 'S000030.64342766023b9', 0, '2023-01-24', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 1, '2023-04-10 17:12:40', '0', '2023-04-10 17:12:40', '0'),
	(476, 'S000030.64342766023b9', 0, '2023-01-25', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 1, '2023-04-10 17:12:40', '0', '2023-04-10 17:12:40', '0'),
	(477, 'S000031.643427bb8034d', 0, '2023-01-01', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '4960', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(478, 'S000031.643427bb8034d', 0, '2023-01-02', '06:00-19:00', 'WEEKDAY', '23:50:00', '23:50:00', '14:46:00', '03:04:00', '00:00:00', '04:50:00', '1', 'W', '4969', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(479, 'S000031.643427bb8034d', 0, '2023-01-03', '06:00-19:00', 'WEEKDAY', '17:56:00', '17:56:00', '08:56:00', '03:00:00', '01:04:00', '00:00:00', '1', 'W', '4983', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(480, 'S000031.643427bb8034d', 0, '2023-01-04', '06:00-19:00', 'WEEKDAY', '18:04:00', '18:04:00', '08:52:00', '03:12:00', '00:56:00', '00:00:00', '1', 'W', '4984', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(481, 'S000031.643427bb8034d', 0, '2023-01-05', '06:00-19:00', 'WEEKDAY', '18:02:00', '18:02:00', '08:49:00', '03:13:00', '00:58:00', '00:00:00', '1', 'W', '4998', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(482, 'S000031.643427bb8034d', 0, '2023-01-06', '06:00-19:00', 'WEEKDAY', '18:08:00', '18:08:00', '08:58:00', '03:10:00', '00:52:00', '00:00:00', '1', 'W', '5007', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(483, 'S000031.643427bb8034d', 0, '2023-01-07', '06:00-19:00', 'WEEKDAY', '20:00:00', '20:00:00', '05:10:00', '08:50:00', '00:00:00', '01:00:00', '1', 'W', '5009', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(484, 'S000031.643427bb8034d', 0, '2023-01-08', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '5023', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(485, 'S000031.643427bb8034d', 0, '2023-01-09', '06:00-19:00', 'WEEKDAY', '18:06:00', '18:06:00', '09:08:00', '02:58:00', '00:54:00', '00:00:00', '1', 'W', '5029', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(486, 'S000031.643427bb8034d', 0, '2023-01-10', '06:00-19:00', 'WEEKDAY', '18:02:00', '18:02:00', '09:11:00', '02:51:00', '00:58:00', '00:00:00', '1', 'W', '5037', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(487, 'S000031.643427bb8034d', 0, '2023-01-11', '06:00-19:00', 'WEEKDAY', '18:00:00', '18:00:00', '08:59:00', '03:01:00', '01:00:00', '00:00:00', '1', 'W', '5044', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(488, 'S000031.643427bb8034d', 0, '2023-01-12', '06:00-19:00', 'WEEKDAY', '18:16:00', '18:16:00', '09:15:00', '03:01:00', '00:44:00', '00:00:00', '1', 'W', '5051', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(489, 'S000031.643427bb8034d', 0, '2023-01-13', '06:00-19:00', 'WEEKDAY', '18:07:00', '18:07:00', '09:09:00', '02:58:00', '00:53:00', '00:00:00', '1', 'W', '5059', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(490, 'S000031.643427bb8034d', 0, '2023-01-14', '06:00-19:00', 'WEEKDAY', '14:59:00', '14:59:00', '05:52:00', '03:07:00', '04:01:00', '00:00:00', '1', 'W', '5066', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(491, 'S000031.643427bb8034d', 0, '2023-01-15', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', 'W', '5073', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(492, 'S000031.643427bb8034d', 0, '2023-01-16', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5087', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(493, 'S000031.643427bb8034d', 0, '2023-01-17', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5091', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(494, 'S000031.643427bb8034d', 0, '2023-01-18', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5098', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(495, 'S000031.643427bb8034d', 0, '2023-01-19', '', 'WEEKDAY', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', 'W', '5108', 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(496, 'S000031.643427bb8034d', 0, '2023-01-20', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(497, 'S000031.643427bb8034d', 0, '2023-01-21', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(498, 'S000031.643427bb8034d', 0, '2023-01-22', '', 'Holiday', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '0', NULL, NULL, 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(499, 'S000031.643427bb8034d', 0, '2023-01-23', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(500, 'S000031.643427bb8034d', 0, '2023-01-24', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0'),
	(501, 'S000031.643427bb8034d', 0, '2023-01-25', '', 'Work', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '1', NULL, NULL, 1, '2023-04-10 17:14:04', '0', '2023-04-10 17:14:04', '0');

-- Dumping structure for procedure hris.spTest
DELIMITER //
CREATE PROCEDURE `spTest`()
BEGIN
	SELECT *  FROM time_management;
END//
DELIMITER ;

-- Dumping structure for table hris.time_management
CREATE TABLE IF NOT EXISTS `time_management` (
  `id` int NOT NULL AUTO_INCREMENT,
  `personalId` varchar(50) NOT NULL DEFAULT '',
  `date` date DEFAULT NULL,
  `shiftId` varchar(50) NOT NULL DEFAULT 'W',
  `checkIn` time NOT NULL DEFAULT '00:00:00',
  `checkOut` time NOT NULL DEFAULT '00:00:00',
  `overTime` time NOT NULL DEFAULT '00:00:00',
  `offTimeId` int NOT NULL DEFAULT '0',
  `presence` int NOT NULL DEFAULT '1',
  `importData` int NOT NULL DEFAULT '0',
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  `updateDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.time_management: ~322 rows (approximately)
INSERT INTO `time_management` (`id`, `personalId`, `date`, `shiftId`, `checkIn`, `checkOut`, `overTime`, `offTimeId`, `presence`, `importData`, `inputDate`, `updateDate`) VALUES
	(4748, 'P000007', '2023-01-02', 'W', '08:02:00', '16:50:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4749, 'P000003', '2023-01-02', 'W', '09:04:00', '23:50:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4750, 'P000002', '2023-01-02', 'W', '06:25:00', '20:14:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4751, 'P000004', '2023-01-02', 'W', '07:37:00', '18:19:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4752, 'P000006', '2023-01-03', 'W', '08:35:00', '17:51:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4753, 'P000002', '2023-01-03', 'W', '07:16:00', '18:13:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4754, 'P000007', '2023-01-03', 'W', '08:05:00', '16:30:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4755, 'P000004', '2023-01-03', 'W', '07:50:00', '18:28:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4756, '800', '2023-01-03', 'W', '08:28:00', '19:15:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4757, 'P000003', '2023-01-03', 'W', '09:00:00', '17:56:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4758, 'P000005', '2023-01-03', 'W', '08:56:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4759, '800', '2023-01-04', 'W', '08:32:00', '19:17:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4760, 'P000003', '2023-01-04', 'W', '09:12:00', '18:04:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4761, 'P000005', '2023-01-04', 'W', '08:42:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4762, 'P000007', '2023-01-04', 'W', '08:02:00', '16:35:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4763, 'P000006', '2023-01-04', 'W', '08:33:00', '19:07:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4764, 'P000002', '2023-01-04', 'W', '06:09:00', '18:09:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4765, 'P000004', '2023-01-04', 'W', '06:02:00', '18:33:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4766, 'P000006', '2023-01-05', 'W', '08:27:00', '19:27:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4767, 'P000002', '2023-01-05', 'W', '06:22:00', '21:12:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4768, 'P000004', '2023-01-05', 'W', '06:01:00', '17:16:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4769, '800', '2023-01-05', 'W', '08:29:00', '19:44:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4770, '1', '2023-01-05', 'W', '06:58:00', '18:46:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4771, 'P000005', '2023-01-05', 'W', '08:51:00', '18:05:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4772, 'P000003', '2023-01-05', 'W', '09:13:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4773, 'P000007', '2023-01-05', 'W', '08:05:00', '16:55:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4774, '800', '2023-01-06', 'W', '08:18:00', '17:54:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4775, 'P000005', '2023-01-06', 'W', '08:53:00', '18:25:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4776, 'P000007', '2023-01-06', 'W', '08:05:00', '16:42:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4777, 'P000003', '2023-01-06', 'W', '09:10:00', '18:08:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4778, 'P000006', '2023-01-06', 'W', '08:28:00', '17:26:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4779, 'P000002', '2023-01-06', 'W', '06:26:00', '18:03:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4780, '1', '2023-01-06', 'W', '07:48:00', '17:43:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4781, 'P000004', '2023-01-06', 'W', '06:26:00', '18:27:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4782, 'P000007', '2023-01-07', 'W', '08:32:00', '15:01:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4783, 'P000006', '2023-01-07', 'W', '09:01:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4784, 'P000003', '2023-01-07', 'W', '14:50:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4785, 'P000002', '2023-01-07', 'W', '07:56:00', '16:11:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4786, 'P000004', '2023-01-07', 'W', '06:19:00', '15:08:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4787, '800', '2023-01-07', 'W', '08:52:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4788, '1', '2023-01-07', 'W', '06:36:00', '15:03:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4789, 'P000003', '2023-01-09', 'W', '08:58:00', '18:06:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4790, 'P000007', '2023-01-09', 'W', '08:05:00', '16:49:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4791, '800', '2023-01-09', 'W', '08:30:00', '19:28:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4792, 'P000004', '2023-01-09', 'W', '07:26:00', '18:40:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4793, '1', '2023-01-09', 'W', '08:40:00', '18:30:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4794, 'P000002', '2023-01-09', 'W', '06:23:00', '21:01:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4795, 'P000005', '2023-01-09', 'W', '08:49:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4796, 'P000006', '2023-01-09', 'W', '19:08:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4797, 'P000004', '2023-01-10', 'W', '05:58:00', '19:22:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4798, '1', '2023-01-10', 'W', '06:36:00', '17:50:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4799, 'P000005', '2023-01-10', 'W', '08:48:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4800, 'P000002', '2023-01-10', 'W', '06:09:00', '17:59:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4801, 'P000003', '2023-01-10', 'W', '08:51:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4802, '800', '2023-01-10', 'W', '08:26:00', '19:48:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4803, 'P000007', '2023-01-10', 'W', '08:06:00', '16:59:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4804, 'P000006', '2023-01-10', 'W', '19:24:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4805, '800', '2023-01-11', 'W', '08:26:00', '20:17:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4806, '1', '2023-01-11', 'W', '06:57:00', '18:47:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4807, 'P000006', '2023-01-11', 'W', '08:43:00', '18:49:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4808, 'P000003', '2023-01-11', 'W', '09:01:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4809, 'P000004', '2023-01-11', 'W', '06:08:00', '19:14:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4810, 'P000005', '2023-01-11', 'W', '08:58:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4811, 'P000007', '2023-01-11', 'W', '08:02:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4812, 'P000002', '2023-01-11', 'W', '06:07:00', '21:13:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4813, '1', '2023-01-12', 'W', '06:15:00', '18:38:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4814, '800', '2023-01-12', 'W', '08:22:00', '20:40:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4815, 'P000005', '2023-01-12', 'W', '08:46:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4816, 'P000002', '2023-01-12', 'W', '06:15:00', '21:24:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4817, 'P000007', '2023-01-12', 'W', '08:06:00', '16:33:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4818, 'P000004', '2023-01-12', 'W', '06:19:00', '19:54:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4819, 'P000006', '2023-01-12', 'W', '08:35:00', '19:30:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4820, 'P000003', '2023-01-12', 'W', '09:01:00', '18:16:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4821, 'P000002', '2023-01-13', 'W', '06:17:00', '07:34:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4822, 'P000005', '2023-01-13', 'W', '08:39:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4823, 'P000004', '2023-01-13', 'W', '06:02:00', '19:34:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4824, 'P000006', '2023-01-13', 'W', '08:34:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4825, 'P000003', '2023-01-13', 'W', '08:58:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4826, 'P000007', '2023-01-13', 'W', '08:01:00', '17:02:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4827, '800', '2023-01-13', 'W', '08:17:00', '19:36:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4828, 'P000007', '2023-01-14', 'W', '08:31:00', '15:52:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4829, 'P000006', '2023-01-14', 'W', '08:56:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4830, '800', '2023-01-14', 'W', '08:51:00', '16:06:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4831, 'P000004', '2023-01-14', 'W', '06:38:00', '15:09:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4832, 'P000003', '2023-01-14', 'W', '09:07:00', '14:59:00', '00:00:00', 0, 1, 1, '2023-01-26 19:26:30', '2023-02-14 10:15:01'),
	(4875, 'P000007', '2023-01-02', 'W', '08:02:00', '16:50:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4876, 'P000003', '2023-01-02', 'W', '09:04:00', '23:50:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4877, 'P000002', '2023-01-02', 'W', '06:25:00', '20:14:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4878, 'P000004', '2023-01-02', 'W', '07:37:00', '18:19:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4879, 'P000006', '2023-01-03', 'W', '08:35:00', '17:51:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4880, 'P000002', '2023-01-03', 'W', '07:16:00', '18:13:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4881, 'P000007', '2023-01-03', 'W', '08:05:00', '16:30:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4882, 'P000004', '2023-01-03', 'W', '07:50:00', '18:28:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4883, '800', '2023-01-03', 'W', '08:28:00', '19:15:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4884, 'P000003', '2023-01-03', 'W', '09:00:00', '17:56:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4885, 'P000005', '2023-01-03', 'W', '08:56:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4886, '800', '2023-01-04', 'W', '08:32:00', '19:17:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4887, 'P000003', '2023-01-04', 'W', '09:12:00', '18:04:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4888, 'P000005', '2023-01-04', 'W', '08:42:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4889, 'P000007', '2023-01-04', 'W', '08:02:00', '16:35:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4890, 'P000006', '2023-01-04', 'W', '08:33:00', '19:07:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4891, 'P000002', '2023-01-04', 'W', '06:09:00', '18:09:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4892, 'P000004', '2023-01-04', 'W', '06:02:00', '18:33:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4893, 'P000006', '2023-01-05', 'W', '08:27:00', '19:27:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4894, 'P000002', '2023-01-05', 'W', '06:22:00', '21:12:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4895, 'P000004', '2023-01-05', 'W', '06:01:00', '17:16:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4896, '800', '2023-01-05', 'W', '08:29:00', '19:44:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4897, '1', '2023-01-05', 'W', '06:58:00', '18:46:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4898, 'P000005', '2023-01-05', 'W', '08:51:00', '18:05:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4899, 'P000003', '2023-01-05', 'W', '09:13:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4900, 'P000007', '2023-01-05', 'W', '08:05:00', '16:55:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4901, '800', '2023-01-06', 'W', '08:18:00', '17:54:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4902, 'P000005', '2023-01-06', 'W', '08:53:00', '18:25:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4903, 'P000007', '2023-01-06', 'W', '08:05:00', '16:42:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4904, 'P000003', '2023-01-06', 'W', '09:10:00', '18:08:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4905, 'P000006', '2023-01-06', 'W', '08:28:00', '17:26:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4906, 'P000002', '2023-01-06', 'W', '06:26:00', '18:03:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4907, '1', '2023-01-06', 'W', '07:48:00', '17:43:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4908, 'P000004', '2023-01-06', 'W', '06:26:00', '18:27:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4909, 'P000007', '2023-01-07', 'W', '08:32:00', '15:01:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4910, 'P000006', '2023-01-07', 'W', '09:01:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4911, 'P000003', '2023-01-07', 'W', '14:50:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4912, 'P000002', '2023-01-07', 'W', '07:56:00', '16:11:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4913, 'P000004', '2023-01-07', 'W', '06:19:00', '15:08:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4914, '800', '2023-01-07', 'W', '08:52:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4915, '1', '2023-01-07', 'W', '06:36:00', '15:03:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4916, 'P000003', '2023-01-09', 'W', '08:58:00', '18:06:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4917, 'P000007', '2023-01-09', 'W', '08:05:00', '16:49:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4918, '800', '2023-01-09', 'W', '08:30:00', '19:28:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4919, 'P000004', '2023-01-09', 'W', '07:26:00', '18:40:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4920, '1', '2023-01-09', 'W', '08:40:00', '18:30:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4921, 'P000002', '2023-01-09', 'W', '06:23:00', '21:01:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4922, 'P000005', '2023-01-09', 'W', '08:49:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4923, 'P000006', '2023-01-09', 'W', '19:08:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4924, 'P000004', '2023-01-10', 'W', '05:58:00', '19:22:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4925, '1', '2023-01-10', 'W', '06:36:00', '17:50:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4926, 'P000005', '2023-01-10', 'W', '08:48:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4927, 'P000002', '2023-01-10', 'W', '06:09:00', '17:59:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4928, 'P000003', '2023-01-10', 'W', '08:51:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4929, '800', '2023-01-10', 'W', '08:26:00', '19:48:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4930, 'P000007', '2023-01-10', 'W', '08:06:00', '16:59:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4931, 'P000006', '2023-01-10', 'W', '19:24:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4932, '800', '2023-01-11', 'W', '08:26:00', '20:17:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4933, '1', '2023-01-11', 'W', '06:57:00', '18:47:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4934, 'P000006', '2023-01-11', 'W', '08:43:00', '18:49:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4935, 'P000003', '2023-01-11', 'W', '09:01:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4936, 'P000004', '2023-01-11', 'W', '06:08:00', '19:14:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4937, 'P000005', '2023-01-11', 'W', '08:58:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4938, 'P000007', '2023-01-11', 'W', '08:02:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4939, 'P000002', '2023-01-11', 'W', '06:07:00', '21:13:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4940, '1', '2023-01-12', 'W', '06:15:00', '18:38:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4941, '800', '2023-01-12', 'W', '08:22:00', '20:40:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4942, 'P000005', '2023-01-12', 'W', '08:46:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4943, 'P000002', '2023-01-12', 'W', '06:15:00', '21:24:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4944, 'P000007', '2023-01-12', 'W', '08:06:00', '16:33:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4945, 'P000004', '2023-01-12', 'W', '06:19:00', '19:54:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4946, 'P000006', '2023-01-12', 'W', '08:35:00', '19:30:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4947, 'P000003', '2023-01-12', 'W', '09:01:00', '18:16:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4948, 'P000002', '2023-01-13', 'W', '06:17:00', '07:34:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4949, 'P000005', '2023-01-13', 'W', '08:39:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4950, 'P000004', '2023-01-13', 'W', '06:02:00', '19:34:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4951, 'P000006', '2023-01-13', 'W', '08:34:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4952, 'P000003', '2023-01-13', 'W', '08:58:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4953, 'P000007', '2023-01-13', 'W', '08:01:00', '17:02:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4954, '800', '2023-01-13', 'W', '08:17:00', '19:36:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4955, 'P000007', '2023-01-14', 'W', '08:31:00', '15:52:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4956, 'P000006', '2023-01-14', 'W', '08:56:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4957, '800', '2023-01-14', 'W', '08:51:00', '16:06:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4958, 'P000004', '2023-01-14', 'W', '06:38:00', '15:09:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4959, 'P000003', '2023-01-14', 'W', '09:07:00', '14:59:00', '00:00:00', 0, 1, 1, '2023-01-26 19:30:52', '2023-02-14 10:15:01'),
	(4960, 'P000003', '2023-01-01', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4961, 'P000006', '2023-01-01', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4962, 'P000005', '2023-01-01', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4963, 'P000004', '2023-01-01', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4964, 'P000007', '2023-01-01', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4965, 'P000002', '2023-01-01', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4966, '1', '2023-01-01', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4967, '800', '2023-01-01', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4968, 'P000005', '2023-01-02', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4969, 'P000003', '2023-01-02', 'W', '09:04:00', '23:50:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4970, 'P000004', '2023-01-02', 'W', '07:37:00', '18:19:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4971, 'P000002', '2023-01-02', 'W', '06:25:00', '20:14:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4972, 'P000006', '2023-01-02', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4973, 'P000007', '2023-01-02', 'W', '08:02:00', '16:50:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4974, '800', '2023-01-02', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4975, '1', '2023-01-02', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4976, '1', '2023-01-03', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4977, 'P000006', '2023-01-03', 'W', '08:35:00', '17:51:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4978, 'P000005', '2023-01-03', 'W', '08:56:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4979, '800', '2023-01-03', 'W', '08:28:00', '19:15:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4980, 'P000002', '2023-01-03', 'W', '07:16:00', '18:13:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4981, 'P000007', '2023-01-03', 'W', '08:05:00', '16:30:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4982, 'P000004', '2023-01-03', 'W', '07:50:00', '18:28:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4983, 'P000003', '2023-01-03', 'W', '09:00:00', '17:56:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4984, 'P000003', '2023-01-04', 'W', '09:12:00', '18:04:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4985, 'P000007', '2023-01-04', 'W', '08:02:00', '16:35:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4986, '800', '2023-01-04', 'W', '08:32:00', '19:17:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4987, 'P000005', '2023-01-04', 'W', '08:42:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4988, 'P000004', '2023-01-04', 'W', '06:02:00', '18:33:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4989, 'P000002', '2023-01-04', 'W', '06:09:00', '18:09:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4990, 'P000006', '2023-01-04', 'W', '08:33:00', '19:07:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4991, '1', '2023-01-04', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4992, 'P000004', '2023-01-05', 'W', '06:01:00', '17:16:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4993, 'P000006', '2023-01-05', 'W', '08:27:00', '19:27:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4994, 'P000007', '2023-01-05', 'W', '08:05:00', '16:55:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4995, '1', '2023-01-05', 'W', '06:58:00', '18:46:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4996, 'P000005', '2023-01-05', 'W', '08:51:00', '18:05:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4997, '800', '2023-01-05', 'W', '08:29:00', '19:44:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4998, 'P000003', '2023-01-05', 'W', '09:13:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(4999, 'P000002', '2023-01-05', 'W', '06:22:00', '21:12:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5000, 'P000005', '2023-01-06', 'W', '08:53:00', '18:25:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5001, '1', '2023-01-06', 'W', '07:48:00', '17:43:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5002, 'P000006', '2023-01-06', 'W', '08:28:00', '17:26:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5003, 'P000002', '2023-01-06', 'W', '06:26:00', '18:03:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5004, '800', '2023-01-06', 'W', '08:18:00', '17:54:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5005, 'P000004', '2023-01-06', 'W', '06:26:00', '18:27:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5006, 'P000007', '2023-01-06', 'W', '08:05:00', '16:42:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5007, 'P000003', '2023-01-06', 'W', '09:10:00', '18:08:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5008, '1', '2023-01-07', 'W', '06:36:00', '15:03:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5009, 'P000003', '2023-01-07', 'W', '14:50:00', '20:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-04-10 09:11:20'),
	(5010, '800', '2023-01-07', 'W', '08:52:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5011, 'P000006', '2023-01-07', 'W', '09:01:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5012, 'P000007', '2023-01-07', 'W', '08:32:00', '15:01:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5013, 'P000002', '2023-01-07', 'W', '07:56:00', '16:11:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5014, 'P000005', '2023-01-07', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5015, 'P000004', '2023-01-07', 'W', '06:19:00', '15:08:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5016, 'P000002', '2023-01-08', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5017, 'P000005', '2023-01-08', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5018, 'P000006', '2023-01-08', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5019, 'P000007', '2023-01-08', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5020, '1', '2023-01-08', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5021, 'P000004', '2023-01-08', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5022, '800', '2023-01-08', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5023, 'P000003', '2023-01-08', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5024, 'P000004', '2023-01-09', 'W', '07:26:00', '18:40:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5025, 'P000005', '2023-01-09', 'W', '08:49:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5026, 'P000006', '2023-01-09', 'W', '19:08:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5027, 'P000007', '2023-01-09', 'W', '08:05:00', '16:49:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5028, 'P000002', '2023-01-09', 'W', '06:23:00', '21:01:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5029, 'P000003', '2023-01-09', 'W', '08:58:00', '18:06:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5030, '1', '2023-01-09', 'W', '08:40:00', '18:30:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5031, '800', '2023-01-09', 'W', '08:30:00', '19:28:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5032, 'P000007', '2023-01-10', 'W', '08:06:00', '16:59:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5033, '800', '2023-01-10', 'W', '08:26:00', '19:48:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5034, 'P000002', '2023-01-10', 'W', '06:09:00', '17:59:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5035, 'P000006', '2023-01-10', 'W', '19:24:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5036, '1', '2023-01-10', 'W', '06:36:00', '17:50:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5037, 'P000003', '2023-01-10', 'W', '08:51:00', '18:02:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5038, 'P000005', '2023-01-10', 'W', '08:48:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5039, 'P000004', '2023-01-10', 'W', '05:58:00', '19:22:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5040, '1', '2023-01-11', 'W', '06:57:00', '18:47:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5041, 'P000006', '2023-01-11', 'W', '08:43:00', '18:49:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5042, '800', '2023-01-11', 'W', '08:26:00', '20:17:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5043, 'P000002', '2023-01-11', 'W', '06:07:00', '21:13:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5044, 'P000003', '2023-01-11', 'W', '09:01:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5045, 'P000007', '2023-01-11', 'W', '08:02:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5046, 'P000004', '2023-01-11', 'W', '06:08:00', '19:14:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5047, 'P000005', '2023-01-11', 'W', '08:58:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5048, '800', '2023-01-12', 'W', '08:22:00', '20:40:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5049, 'P000004', '2023-01-12', 'W', '06:19:00', '19:54:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5050, 'P000002', '2023-01-12', 'W', '06:15:00', '21:24:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5051, 'P000003', '2023-01-12', 'W', '09:01:00', '18:16:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5052, 'P000007', '2023-01-12', 'W', '08:06:00', '16:33:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5053, 'P000005', '2023-01-12', 'W', '08:46:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5054, '1', '2023-01-12', 'W', '06:15:00', '18:38:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5055, 'P000006', '2023-01-12', 'W', '08:35:00', '19:30:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5056, 'P000005', '2023-01-13', 'W', '08:39:00', '18:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5057, 'P000006', '2023-01-13', 'W', '08:34:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5058, '800', '2023-01-13', 'W', '08:17:00', '19:36:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5059, 'P000003', '2023-01-13', 'W', '08:58:00', '18:07:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5060, '1', '2023-01-13', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5061, 'P000007', '2023-01-13', 'W', '08:01:00', '17:02:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5062, 'P000002', '2023-01-13', 'W', '06:17:00', '07:34:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5063, 'P000004', '2023-01-13', 'W', '06:02:00', '19:34:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5064, '800', '2023-01-14', 'W', '08:51:00', '16:06:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5065, 'P000002', '2023-01-14', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5066, 'P000003', '2023-01-14', 'W', '09:07:00', '14:59:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5067, '1', '2023-01-14', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5068, 'P000004', '2023-01-14', 'W', '06:38:00', '15:09:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5069, 'P000007', '2023-01-14', 'W', '08:31:00', '15:52:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5070, 'P000006', '2023-01-14', 'W', '08:56:00', '15:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5071, 'P000005', '2023-01-14', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5072, 'P000005', '2023-01-15', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5073, 'P000003', '2023-01-15', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5074, 'P000007', '2023-01-15', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5075, '1', '2023-01-15', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5076, 'P000002', '2023-01-15', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5077, 'P000006', '2023-01-15', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5078, '800', '2023-01-15', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5079, 'P000004', '2023-01-15', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5080, 'P000002', '2023-01-16', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5081, '1', '2023-01-16', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5082, 'P000005', '2023-01-16', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5083, 'P000006', '2023-01-16', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5084, 'P000004', '2023-01-16', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5085, 'P000007', '2023-01-16', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5086, '800', '2023-01-16', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5087, 'P000003', '2023-01-16', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5088, 'P000007', '2023-01-17', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5089, 'P000006', '2023-01-17', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5090, '800', '2023-01-17', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5091, 'P000003', '2023-01-17', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5092, 'P000002', '2023-01-17', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5093, '1', '2023-01-17', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5094, 'P000004', '2023-01-17', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5095, 'P000005', '2023-01-17', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5096, '800', '2023-01-18', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5097, '1', '2023-01-18', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5098, 'P000003', '2023-01-18', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5099, 'P000005', '2023-01-18', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5100, 'P000007', '2023-01-18', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5101, 'P000002', '2023-01-18', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5102, 'P000006', '2023-01-18', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5103, 'P000004', '2023-01-18', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5104, 'P000007', '2023-01-19', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5105, '800', '2023-01-19', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5106, '1', '2023-01-19', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5107, 'P000004', '2023-01-19', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5108, 'P000003', '2023-01-19', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5109, 'P000006', '2023-01-19', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5110, 'P000005', '2023-01-19', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01'),
	(5111, 'P000002', '2023-01-19', 'W', '00:00:00', '00:00:00', '00:00:00', 0, 1, 1, '2023-02-14 10:15:01', '2023-02-14 10:15:01');

-- Dumping structure for table hris.time_management_shift
CREATE TABLE IF NOT EXISTS `time_management_shift` (
  `idAuto` int NOT NULL AUTO_INCREMENT,
  `id` varchar(9) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `scheduleIn` time NOT NULL DEFAULT '00:00:00',
  `scheduleOut` time NOT NULL DEFAULT '00:00:00',
  `Sun` int NOT NULL DEFAULT '0',
  `Mon` int NOT NULL DEFAULT '1',
  `Tue` int NOT NULL DEFAULT '1',
  `Wed` int NOT NULL DEFAULT '1',
  `Thu` int NOT NULL DEFAULT '1',
  `Fri` int NOT NULL DEFAULT '1',
  `Sat` int NOT NULL DEFAULT '1',
  `presence` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idAuto`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.time_management_shift: ~3 rows (approximately)
INSERT INTO `time_management_shift` (`idAuto`, `id`, `name`, `scheduleIn`, `scheduleOut`, `Sun`, `Mon`, `Tue`, `Wed`, `Thu`, `Fri`, `Sat`, `presence`) VALUES
	(1, 'W', 'WEEKDAY', '06:00:00', '19:00:00', 0, 1, 1, 1, 1, 1, 1, 1),
	(2, 'BC', 'Part Time', '14:00:00', '19:00:00', 0, 1, 1, 1, 1, 1, 0, 1),
	(3, '', '', '00:00:00', '00:00:00', 0, 1, 1, 1, 1, 1, 1, 0);

-- Dumping structure for table hris.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.user: ~0 rows (approximately)

-- Dumping structure for table hris.user_access
CREATE TABLE IF NOT EXISTS `user_access` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL DEFAULT '',
  `inputDate` datetime NOT NULL DEFAULT '2023-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hris.user_access: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
