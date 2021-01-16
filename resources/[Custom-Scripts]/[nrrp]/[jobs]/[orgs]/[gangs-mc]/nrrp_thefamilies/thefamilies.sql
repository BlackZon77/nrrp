INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_thefamilies', 'The Families', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_thefamilies', 'The Families', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_thefamilies', 'The Families', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('thefamilies', 'The Families')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('thefamilies',0,'recruit','Recruta',20,'{}','{}'),
	('thefamilies',1,'member','Membro',40,'{}','{}'),
	('thefamilies',2,'intercircle','Circulo Interno',60,'{}','{}'),
	('thefamilies',3,'boss','Líder',85,'{}','{}')
;