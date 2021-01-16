INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_lsvagos', 'LS Vagos', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_lsvagos', 'LS Vagos', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_lsvagos', 'LS Vagos', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('lsvagos', 'LS Vagos')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('lsvagos',0,'recruit','Recruta',20,'{}','{}'),
	('lsvagos',1,'member','Membro',40,'{}','{}'),
	('lsvagos',2,'intercircle','Circulo Interno',60,'{}','{}'),
	('lsvagos',3,'boss','Líder',85,'{}','{}')
;