-- == Queries for database "Map" == --
-- Geekbrains -> Database -> Homework 1
CREATE DATABASE `map` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_country` int NOT NULL,
  `id_region` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_city_country_idx` (`id_country`),
  KEY `id_region_city_idx` (`id_region`),
  CONSTRAINT `id_country_city` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`),
  CONSTRAINT `id_region_city` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `region` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_country` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_country_region_idx` (`id_country`),
  CONSTRAINT `id_country_region` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
