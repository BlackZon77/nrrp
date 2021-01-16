CREATE TABLE IF NOT EXiSTS `erp_apreendidos` (
  `plate` varchar(12) NOT NULL,
  `officer` varchar(255) DEFAULT NULL,
  `mechanic` varchar(255) DEFAULT NULL,
  `releasedate` date NOT NULL,
  `fee` double NOT NULL,
  `reason` text NOT NULL,
  `notes` text,
  `vehicle` text NOT NULL,
  `identifier` varchar(30) NOT NULL,
  PRIMARY KEY (`plate`)
);

-- Update 01
ALTER TABLE `erp_apreendidos`
	ADD COLUMN `hold_o` boolean default false,
	ADD COLUMN `hold_m` boolean default false;

-- Update 03 Hours
ALTER TABLE erp_apreendidos  MODIFY COLUMN `releasedate` VARCHAR(25);