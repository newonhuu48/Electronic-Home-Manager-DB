-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: house_manager
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apartment`
--

DROP TABLE IF EXISTS `apartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apartment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `floor` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `area` int DEFAULT NULL,
  `owner_name` varchar(45) DEFAULT NULL,
  `building_address` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`building_address`),
  KEY `fk_apartment_building1_idx` (`building_address`),
  CONSTRAINT `fk_apartment_building1` FOREIGN KEY (`building_address`) REFERENCES `building` (`address`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment`
--

LOCK TABLES `apartment` WRITE;
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
INSERT INTO `apartment` VALUES (1,8,4,70,'Boyko Manev','Svoboda 17'),(2,4,6,50,'Ilko Penchev','Svoboda 17'),(3,10,1,140,'Dimitar Savov','Manush Voyvoda 33'),(4,1,3,120,'Lyudmil Valov','Gotse Delchev 85'),(5,4,2,90,'Violeta Chergarska','Gotse Delchev 85'),(6,6,4,60,'Malina Karapetrova','Gotse Delchev 85'),(7,3,1,45,'Ralitsa Yankova','Iskar 33'),(8,7,1,60,'Viktor Atanasov','Iskar 33'),(9,9,4,80,'Bogomil Boychev','Simeon Radev 157'),(10,4,5,110,'Nencho Atanasov','Simeon Radev 157'),(11,16,4,80,'Orlin Paskalaev','Opalchenska 121'),(12,12,1,100,'Pavlina Yaneva','Haydushka Gora 10'),(13,2,2,90,'Radoslava Zheleva','Tsar Boris III 56'),(14,8,2,70,'Georgi Glavchev','Tsar Boris III 56'),(15,7,4,60,'Hristo Bakalov','Oborishte 21'),(16,5,3,110,'Veselin Dobrev','Oborishte 21');
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `address` varchar(45) NOT NULL,
  `district` varchar(45) DEFAULT NULL,
  `floors` int DEFAULT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES ('Gotse Delchev 85','Lyulin',10),('Haydushka Gora 10','Mladost',20),('Iskar 33','Nadezhda',10),('Manush Voyvoda 33','Lyulin',10),('Oborishte 21','Lozenets',10),('Opalchenska 121','Mladost',20),('Simeon Radev 157','Nadezhda',10),('Svoboda 17','Lyulin',10),('Tsar Boris III 56','Lozenets',10);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building_contracts`
--

DROP TABLE IF EXISTS `building_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building_contracts` (
  `contract_num` varchar(10) NOT NULL,
  `building_address` varchar(45) NOT NULL,
  `company_id` int NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`contract_num`,`building_address`,`company_id`),
  KEY `fk_building_has_company_company1_idx` (`company_id`),
  KEY `fk_building_has_company_building1_idx` (`building_address`),
  CONSTRAINT `fk_building_has_company_building1` FOREIGN KEY (`building_address`) REFERENCES `building` (`address`),
  CONSTRAINT `fk_building_has_company_company1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building_contracts`
--

LOCK TABLES `building_contracts` WRITE;
/*!40000 ALTER TABLE `building_contracts` DISABLE KEYS */;
INSERT INTO `building_contracts` VALUES ('0177860269','Iskar 33',4,'2026-04-04'),('0679890229','Tsar Boris III 56',3,'2024-04-13'),('1347637135','Svoboda 17',1,'2026-04-03'),('2006225644','Svoboda 17',4,'2026-04-12'),('2300239348','Opalchenska 121',1,'2026-04-06'),('2488179525','Oborishte 21',5,'2024-04-07'),('4224724664','Simeon Radev 157',5,'2026-04-11'),('4585147215','Haydushka Gora 10',2,'2026-04-12'),('5456258080','Iskar 33',4,'2026-04-08'),('6144044675','Manush Voyvoda 33',2,'2026-04-08'),('6884305215','Manush Voyvoda 33',3,'2026-04-11'),('7090024661','Tsar Boris III 56',4,'2026-04-16'),('7582310748','Opalchenska 121',5,'2026-04-05'),('7698627514','Gotse Delchev 85',3,'2026-04-12');
/*!40000 ALTER TABLE `building_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `income` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Pure Glow',6300),(2,'The Hasty Cleaners',6000),(3,'The Dust Wipers',9150),(4,'Sparkle Pro',21000),(5,'Scrub Hub Services',11200);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_company1_idx` (`company_id`),
  CONSTRAINT `fk_employee_company1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Ivan Petrov',2000,1),(2,'Maria Ivanova',1500,1),(3,'Stanimir Petkov',1200,1),(4,'Petar Karaivanov',1500,2),(5,'Ilko savov',1200,2),(6,'Phuong Bao Duy',1200,2),(7,'Dragan Tonchev',2100,3),(8,'Matey Dobrev',2000,3),(9,'Chavdar Zhelyazkov',1800,3),(10,'Zhivko Vasilev',2800,4),(11,'Anna Kirilova',2500,4),(12,'Bozhidar Dimitrov',3000,4),(13,'Manush Zhelev',2000,5),(14,'Denitsa Koleva',2500,5),(15,'Iva Hristova',2100,5);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoice_num` varchar(10) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `owner_egn` varchar(10) NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`owner_egn`,`company_id`),
  KEY `fk_owner_has_company_company1_idx` (`company_id`),
  KEY `fk_owner_has_company_owner1_idx` (`owner_egn`),
  CONSTRAINT `fk_owner_has_company_company1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `fk_owner_has_company_owner1` FOREIGN KEY (`owner_egn`) REFERENCES `owner` (`egn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES ('5378073005',140,'2026-05-20','0650704667',3),('1763041787',160,'2026-05-12','0934595618',5),('9043915503',120,'2026-05-20','1499207067',5),('8684868313',220,'2026-05-20','2010049205',5),('2581346434',180,'2026-05-17','2954092318',3),('6126029274',280,'2026-05-04','5284124879',2),('8259984724',90,'2026-05-02','5378598287',4),('9287980308',220,'2026-05-13','5511570951',5),('3258983060',240,'2026-05-06','5933326975',3),('8881288738',160,'2026-05-16','7285667971',1),('9845293190',120,'2026-05-04','7616922655',4),('3347316848',140,'2026-05-06','8453324650',1),('0334843239',200,'2026-05-18','8524780239',2),('1321199691',100,'2026-05-01','8615205793',1),('2022047528',120,'2026-05-08','8850364237',3),('1820822645',180,'2026-05-07','9898341171',3);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `egn` varchar(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `building_address` varchar(45) NOT NULL,
  `id_apartment` int NOT NULL,
  PRIMARY KEY (`egn`,`building_address`,`id_apartment`),
  KEY `fk_owner_apartment1_idx` (`id_apartment`),
  CONSTRAINT `fk_owner_apartment1` FOREIGN KEY (`id_apartment`) REFERENCES `apartment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES ('0650704667','Georgi Glavchev','Tsar Boris III 56',14),('0934595618','Bogomil Boychev','Simeon Radev 157',9),('1499207067','Hristo Bakalov','Oborishte 21',15),('2010049205','Veselin Dobrev','Oborishte 21',16),('2954092318','Radoslava Zheleva','Tsar Boris III 56',13),('5284124879','Dimitar Savov','Manush Voyvoda 33',3),('5378598287','Ralitsa Yankova','Iskar 33',7),('5511570951','Nencho Atanasov','Simeon Radev 157',10),('5933326975','Lyudmil Valov','Gotse Delchev 85',4),('7285667971','Orlin Paskalev','Opalchenska 121',11),('7616922655','Viktor Atanasov','Iskar 33',8),('8453324650','Boyko Manev','Svoboda 17',1),('8524780239','Pavlina Yaneva','Haydushka Gora 10',12),('8615205793','Ilko Penchev','Svoboda 17',2),('8850364237','Malina Karapetrova','Gotse Delchev 85',6),('9898341171','Violeta Chergarska','Gotse Delchev 85',5);
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-06 18:20:09
