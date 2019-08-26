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
  `furncCODE` char(1) NOT NULL,
  `furncNAME` varchar(45) NOT NULL,
  `furncDESC` varchar(45) DEFAULT NULL,
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
  `furncCODE` char(1) DEFAULT NULL,
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
  `furnsDESC` varchar(45) DEFAULT NULL,
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
/*!40000 ALTER TABLE `furniture_style` ENABLE KEYS */;
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
  `userLNAME` varchar(45) NOT NULL,
  `userPASSWORD` varchar(100) NOT NULL,
  `usertCODE` char(1) NOT NULL,
  `userFNAME` varchar(45) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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
  `usertDESC` varchar(45) NOT NULL,
  PRIMARY KEY (`usertCODE`),
  UNIQUE KEY `userSTATUS_DESC_UNIQUE` (`usertDESC`),
  UNIQUE KEY `userSTATUS_UNIQUE` (`usertCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
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

-- Dump completed on 2019-08-26 12:16:08
