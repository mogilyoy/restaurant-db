-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_15
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Table structure for table `clients`


DROP DATABASE IF EXISTS rest;
CREATE DATABASE rest;
USE rest;

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` bigint(20) unsigned DEFAULT NULL,
  `pwd_hash` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Marcelina Mraz',89137325515,'b3fbd3cf9e854fd5618767a4aec6a5913b27f977'),(2,'Mr. Pierre Ortiz',89663443072,'dfa06a830edd8967f183a83620e2769336b9e41d'),(3,'Aryanna Homenick V',89680688261,'dc8622c484ed5461ad745c3ac54ee2a458f30bcb'),(4,'Prof. Veronica Daniel MD',89115787945,'40b6505421d88082004cae56b4f04d8bb61ee55f'),(5,'Leora Collins',89828048491,'c2b9f15b3c40821f09c270c7bf7d46176a3dfa0d'),(6,'Dr. Dimitri McCullough Sr.',89115644488,'51ab9d6949e162cb548fbd6093400b324754ba1e'),(7,'Dr. Irma Prohaska DVM',89048451758,'779150b51fcc77a56c664d98628f0712aae8b36d'),(8,'Twila Stroman',89910090916,'a2a403399dbc68f5fb39b22be2e1e05556c4b022'),(9,'Freida Schoen',89621929245,'ccde031ff67c1b00e2573ee548d0d49b416c89df'),(10,'Mrs. Keira Collins',89468747228,'d2fb0796d493350fc48f27ca861bae0d7593e7d5');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveries` (
  `order_id` bigint(20) unsigned NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delievery_time` datetime DEFAULT current_timestamp(),
  `courier_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  KEY `courier_id` (`courier_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `staff` (`id`),
  CONSTRAINT `deliveries_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `weight` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `category_id` (`category_id`),
  KEY `name` (`name`,`price`,`weight`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `menu_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'quis','Itaque veniam ut et eos qui deleniti vel laudantium. Iste odit id at ut.',5,1,126),(2,'officia','Laudantium sed occaecati vel at et soluta. Atque repudiandae qui porro blanditiis facilis. Aut vero et vel eaque. Et quisquam et velit et ab pariatur.',34,2,347),(3,'nostrum','Aut praesentium eos voluptate. Velit similique atque voluptatum id ea voluptas quia. Eligendi voluptates aliquam consequatur.',7,3,137),(4,'et','Earum temporibus vero iusto et aliquid. Possimus repellat iste temporibus sapiente illo eum. Harum et corrupti quae vel consequatur temporibus est in.',24,4,59),(5,'unde','Quae voluptate deleniti sed quaerat dolores enim. Dolore sint officia sit cupiditate repellat occaecati. Qui quas repellendus est cum vel minus illo debitis. Eligendi adipisci veritatis ab autem animi laborum.',18,5,165),(6,'assumenda','Et at nam voluptatem quo. Vel quia reprehenderit pariatur tempora eum. Occaecati cumque ut ea cumque.',25,6,398),(7,'praesentium','Adipisci hic est sint enim ratione rerum incidunt. Tempore enim facere magni perferendis recusandae magnam molestiae modi. Ducimus cum ab voluptatibus pariatur.',15,7,18),(8,'ut','Aut quis quae omnis quam expedita porro rerum similique. Possimus necessitatibus minima eos quidem unde quibusdam. Optio iusto error reprehenderit voluptatibus neque et et quaerat.',9,8,453),(9,'fugiat','Dolorem corrupti praesentium iure quos dolorem similique dolorum. Illum quo molestiae earum enim non. Ut omnis natus consequatur harum rem cumque veniam.',5,9,395),(10,'et','Magnam molestias qui odit qui aut id eum. Qui sunt nesciunt vitae sit error nihil. Officiis rem corporis excepturi. Nostrum autem qui aut.',26,10,176);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_categories`
--

DROP TABLE IF EXISTS `menu_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_categories`
--

LOCK TABLES `menu_categories` WRITE;
/*!40000 ALTER TABLE `menu_categories` DISABLE KEYS */;
INSERT INTO `menu_categories` VALUES (9,'dolores'),(10,'earum'),(1,'expedita'),(6,'ipsa'),(4,'labore'),(5,'molestias'),(7,'qui'),(8,'quidem'),(3,'ut'),(2,'voluptatem');
/*!40000 ALTER TABLE `menu_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`body`)),
  `created_at` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `id` (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1, 1, '{"hot_dog": 2, "latte": 1}', NOW()),(2, 2, '{"hot_dog": 5, "latte": 5}', NOW()),(3, 3, '{"hot_dog": 1, "latte": 2}', NOW()),(4, 4, '{"hot_dog": 3, "latte": 3}', NOW()),(5, 5, '{"hot_dog": 4, "latte": 1}', NOW()),(6, 6, '{"hot_dog": 1, "latte": 1}', NOW()),(7, 7, '{"hot_dog": 1, "latte": 1}', NOW()),(8, 8, '{"hot_dog": 1, "latte": 0}', NOW()),(9, 9, '{"hot_dog": 4, "latte": 0}', NOW()),(10, 10, '{"hot_dog": 0, "latte": 4}', NOW());
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` bigint(20) unsigned DEFAULT NULL,
  `salary` int(10) unsigned DEFAULT NULL,
  `hierarchy_id` bigint(20) unsigned DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `firstname` (`firstname`,`lastname`),
  KEY `hierarchy_id` (`hierarchy_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`hierarchy_id`) REFERENCES `staff_hierarchy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Percival','Lowe',89346656921,6568,1),(2,'Kathryn','Gibson',89852501608,5990,2),(3,'Christiana','Parisian',89221459788,3727,3),(4,'Fatima','Ruecker',89672667264,8413,4),(5,'Stephany','Fadel',89678424238,4197,5),(6,'Jillian','McClure',89557667274,9093,6),(7,'Evert','Leannon',89434184046,5868,7),(8,'Denis','Rosenbaum',89031238840,3798,8),(9,'Benny','Schumm',89505266514,9216,9),(10,'Freeman','Wuckert',89604251439,2971,10);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_hierarchy`
--

DROP TABLE IF EXISTS `staff_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_hierarchy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_hierarchy`
--

LOCK TABLES `staff_hierarchy` WRITE;
/*!40000 ALTER TABLE `staff_hierarchy` DISABLE KEYS */;
INSERT INTO `staff_hierarchy` VALUES (1,'officia'),(2,'officiis'),(3,'laborum'),(4,'sed'),(5,'est'),(6,'mollitia'),(7,'saepe'),(8,'consectetur'),(9,'exercitationem'),(10,'quis');
/*!40000 ALTER TABLE `staff_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouse`
--

DROP TABLE IF EXISTS `storehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouse` (
  `product_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` bigint(20) unsigned DEFAULT NULL,
  `supplier_id` bigint(20) unsigned NOT NULL,
  `last_supply` datetime DEFAULT current_timestamp(),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `name` (`name`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `storehouse_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouse`
--

LOCK TABLES `storehouse` WRITE;
/*!40000 ALTER TABLE `storehouse` DISABLE KEYS */;
INSERT INTO `storehouse` VALUES (1,'nisi',32,1,'1971-09-19 06:28:11'),(2,'quis',30,2,'1989-08-31 00:07:11'),(3,'id',11,3,'1977-01-13 15:42:05'),(4,'deleniti',10,4,'2007-01-26 02:04:08'),(5,'placeat',28,5,'2008-11-21 22:30:04'),(6,'iusto',32,6,'2019-05-28 08:38:15'),(7,'tenetur',18,7,'1983-01-06 14:34:30'),(8,'unde',37,8,'1984-08-17 00:33:13'),(9,'quos',15,9,'2008-01-19 03:51:57'),(10,'consequatur',5,10,'2015-03-23 20:39:59');
/*!40000 ALTER TABLE `storehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adress` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` bigint(20) unsigned DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Murphy-Kuhn','2423 Bogisich Pines\nEast Alexzanderfort, TX 44924-6282',89760989115),(2,'Zboncak-Herzog','71148 Bergstrom Crossing\nPort Avis, OH 37511',89489051240),(3,'Hirthe-Crona','9010 O\'Hara Oval\nEmeraldmouth, WA 31486',89688695332),(4,'Murray-Lubowitz','238 Beahan Trail Suite 178\nEast Darenhaven, NJ 80895-3084',89840821624),(5,'Kirlin, Steuber and Casper','9608 Kuvalis Islands Apt. 337\nDewittshire, AK 98047',89671270218),(6,'O\'Connell LLC','11350 Nat Hills\nNorth Effie, MA 33552-6134',89639509899),(7,'Walter, Kshlerin and Schmitt','84352 McLaughlin Crest\nLeschburgh, PA 04797-7204',89066094263),(8,'Hamill, Johnson and Lynch','6261 Pacocha Wall\nDestanystad, AL 86517-0550',89491520130),(9,'Langworth, Donnelly and Huel','9425 Shanelle Throughway\nNorth Pamelaport, KS 61780',89233473020),(10,'Jones-Davis','34377 Becker Overpass Suite 343\nNew Emile, WA 35102-0378',89703150904);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_reservation`
--

DROP TABLE IF EXISTS `table_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_reservation` (
  `table_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `reserved_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  KEY `client_id` (`client_id`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `table_reservation_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `table_reservation_ibfk_2` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_reservation`
--

LOCK TABLES `table_reservation` WRITE;
/*!40000 ALTER TABLE `table_reservation` DISABLE KEYS */;
INSERT INTO `table_reservation` VALUES (1,1,'2022-09-01 11:59:42'),(2,2,'2022-09-06 03:13:59'),(3,3,'2022-09-03 07:53:38'),(4,4,'2022-09-12 16:35:20'),(5,5,'2022-09-24 13:49:06'),(6,6,'2022-09-17 08:20:05'),(7,7,'2022-08-27 09:08:00'),(8,8,'2022-09-10 12:39:51'),(9,9,'2022-09-07 17:19:42'),(10,10,'2022-09-29 00:57:50');
/*!40000 ALTER TABLE `table_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('free','reserved') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_client_id` bigint(20) unsigned NOT NULL,
  `last_waiter_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `last_client_id` (`last_client_id`),
  KEY `last_waiter_id` (`last_waiter_id`),
  KEY `status` (`status`),
  CONSTRAINT `tables_ibfk_1` FOREIGN KEY (`last_client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `tables_ibfk_2` FOREIGN KEY (`last_waiter_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,'reserved',1,1),(2,'free',2,2),(3,'free',3,3),(4,'reserved',4,4),(5,'reserved',5,5),(6,'free',6,6),(7,'free',7,7),(8,'free',8,8),(9,'reserved',9,9),(10,'free',10,10);
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-23  5:57:36
