CREATE TABLE `board` (
	`seq` INT(11) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(50) NULL DEFAULT NULL,
	`content` TEXT NULL DEFAULT NULL,
	`ymdFrt` VARCHAR(8) NULL DEFAULT NULL,
	INDEX `index1` (`seq`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


