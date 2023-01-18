RENAME TABLE `shift` TO `time_management_shift`;

ALTER TABLE `time_management`
	CHANGE COLUMN `shiftId` `shift` VARCHAR(50) NOT NULL DEFAULT '0' AFTER `date`;
ALTER TABLE `time_management`
	ADD COLUMN `scheduleIn` TIME NOT NULL DEFAULT '00:00:00' AFTER `shift`,
	ADD COLUMN `scheduleOut` TIME NOT NULL DEFAULT '00:00:00' AFTER `scheduleIn`,
	CHANGE COLUMN `checkIn` `checkIn` TIME NOT NULL DEFAULT '00:00:00' AFTER `scheduleOut`;
