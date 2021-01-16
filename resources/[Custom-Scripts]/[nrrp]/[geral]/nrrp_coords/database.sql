CREATE TABLE `saved_coords` (
  `description` longtext DEFAULT NULL,
  `x` int(255) DEFAULT NULL,
  `y` int(255) DEFAULT NULL,
  `z` int(255) DEFAULT NULL,
  `h` int(255) DEFAULT NULL,
  `type` int(255) DEFAULT NULL,
  `savedby` varchar(255) NOT NULL,
  PRIMARY KEY (`savedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
