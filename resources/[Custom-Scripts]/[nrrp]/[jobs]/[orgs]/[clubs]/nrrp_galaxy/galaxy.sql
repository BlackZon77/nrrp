INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_galaxy', 'Galaxy', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_galaxy', 'Galaxy', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_galaxy', 'Galaxy', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('galaxy', 'Galaxy')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('galaxy',0,'recruit','Recruta',20,'{}','{}'),
	('galaxy',1,'barmen','Bar Men',40,'{}','{}'),
	('galaxy',2,'security','Segurança',60,'{}','{}'),
	('galaxy',3,'boss','Líder',85,'{}','{}')
;