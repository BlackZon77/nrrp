INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_uvanilla', 'Vanilla', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_uvanilla', 'Vanilla', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_uvanilla', 'Vanilla', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('uvanilla', 'Vanilla')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('uvanilla',0,'recruit','Recruta',20,'{}','{}'),
	('uvanilla',1,'barmen','Bar Men',40,'{}','{}'),
	('uvanilla',2,'security','Segurança',60,'{}','{}'),
	('uvanilla',3,'boss','Líder',85,'{}','{}')
;