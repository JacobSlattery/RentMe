CREATE DATABASE  IF NOT EXISTS `project1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project1`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: project1
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `furnature_category`
--

DROP TABLE IF EXISTS `furnature_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `furnature_category` (
  `furncCODE` varchar(5) NOT NULL,
  `furncNAME` varchar(45) NOT NULL,
  `furncDESC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`furncCODE`),
  UNIQUE KEY `furncCODE_UNIQUE` (`furncCODE`),
  UNIQUE KEY `furncNAME_UNIQUE` (`furncNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furnature_category`
--

LOCK TABLES `furnature_category` WRITE;
/*!40000 ALTER TABLE `furnature_category` DISABLE KEYS */;
INSERT INTO `furnature_category` VALUES ('BEANB','Bean Bag',NULL),('BED','Bed',NULL),('BENCH','Bench',NULL),('CABNT','Cabinet',NULL),('CHEST','Chest',NULL),('CHR','Chair',NULL),('COUCH','Couch',NULL),('DESK','Desk',NULL),('DRWER','Drawer',NULL),('FUTON','Futon',NULL),('LCHR','Left Chair',NULL),('MATTR','Mattress',NULL),('NSTND','Nightstand',NULL),('ROCKC','Rocking Chair',NULL),('TABLE','Table',NULL),('WRDRB','Wardrobe',NULL);
/*!40000 ALTER TABLE `furnature_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `furniture`
--

DROP TABLE IF EXISTS `furniture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `furniture` (
  `furnID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `furnNAME` varchar(45) NOT NULL,
  `furnDESC` varchar(255) DEFAULT NULL,
  `furnPRICE` decimal(10,0) DEFAULT NULL,
  `furnsCODE` char(1) DEFAULT NULL,
  `furncCODE` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`furnID`),
  UNIQUE KEY `furnID_UNIQUE` (`furnID`),
  UNIQUE KEY `furnNAME_UNIQUE` (`furnNAME`),
  KEY `furncCODE_idx` (`furncCODE`),
  KEY `furnsCODE_idx` (`furnsCODE`),
  CONSTRAINT `furncCODE` FOREIGN KEY (`furncCODE`) REFERENCES `furnature_category` (`furncNAME`),
  CONSTRAINT `furnsCODE` FOREIGN KEY (`furnsCODE`) REFERENCES `furniture_style` (`furnsCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furniture`
--

LOCK TABLES `furniture` WRITE;
/*!40000 ALTER TABLE `furniture` DISABLE KEYS */;
/*!40000 ALTER TABLE `furniture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `furniture_style`
--

DROP TABLE IF EXISTS `furniture_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `furniture_style` (
  `furnsCODE` char(1) NOT NULL,
  `furnsNAME` varchar(45) NOT NULL,
  `furnsDESC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`furnsCODE`),
  UNIQUE KEY `furnsCODE_UNIQUE` (`furnsCODE`),
  UNIQUE KEY `furnsNAME_UNIQUE` (`furnsNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furniture_style`
--

LOCK TABLES `furniture_style` WRITE;
/*!40000 ALTER TABLE `furniture_style` DISABLE KEYS */;
INSERT INTO `furniture_style` VALUES ('A','Antique','At least 100 years old. Typically made from wood.'),('C','Contemporary','Contemporary style refers to furniture that is popular today.'),('M','Modern','Modern style came out of the early 1900s modernist movement. It’s best known for its use of monochromatic color palettes and materials like steel, vinyl, leather, and plastic.'),('R','Rustic','Rustic furniture brings warmth and coziness home. This style is typically made with timber or other natural materials, including hide, cotton, and linen.'),('T','Traditional','The traditional furniture typically features graceful ornamentation, straightened lines, and tapered legs.'),('V','Vintage','Vintage pieces capture the best details from a certain era. Pieces are younger than antiques but may be decades old.');
/*!40000 ALTER TABLE `furniture_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `rentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rentEMPLOYEE_ID` int(10) unsigned NOT NULL,
  `rentMEMBER_ID` int(10) unsigned NOT NULL,
  `rentITEM_ID` int(10) unsigned NOT NULL,
  `rentSTART` datetime NOT NULL,
  `rentEND` datetime NOT NULL,
  `tranNUM` int(11) NOT NULL,
  PRIMARY KEY (`rentID`),
  UNIQUE KEY `rentalID_UNIQUE` (`rentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userUSERNAME` varchar(45) NOT NULL,
  `userPASSWORD` varchar(100) NOT NULL,
  `usertCODE` char(1) NOT NULL,
  `userFNAME` varchar(45) DEFAULT NULL,
  `userLNAME` varchar(45) DEFAULT NULL,
  `userADDRESS` varchar(45) DEFAULT NULL,
  `userPHONE` varchar(45) DEFAULT NULL,
  `userEMAIL` varchar(45) DEFAULT NULL,
  `userSSN` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`),
  UNIQUE KEY `userUSERNAME_UNIQUE` (`userUSERNAME`),
  UNIQUE KEY `userSSN_UNIQUE` (`userSSN`),
  UNIQUE KEY `userEMAIL_UNIQUE` (`userEMAIL`),
  KEY `usertCODE_idx` (`usertCODE`),
  CONSTRAINT `usertCODE` FOREIGN KEY (`usertCODE`) REFERENCES `user_type` (`usertCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','password','E',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `usertCODE` char(1) NOT NULL,
  `usertNAME` varchar(45) NOT NULL,
  `usertDESC` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usertCODE`),
  UNIQUE KEY `userSTATUS_UNIQUE` (`usertCODE`),
  UNIQUE KEY `usertNAME_UNIQUE` (`usertNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES ('D','Deactivated','Deactivated Account'),('E','Employee',NULL),('M','Member',NULL);
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'project1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-26 13:39:44
