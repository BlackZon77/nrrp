CREATE TABLE `warehouse` (
	`identifier` varchar(50) NOT NULL,
    `warehouse` longtext COLLATE utf8mb4_bin NOT NULL,
	PRIMARY KEY (`identifier`)
);

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('warehouse_key', 'Chave da Warehouse', -1),
	('access_key', 'Chave de acesso', -1)
;