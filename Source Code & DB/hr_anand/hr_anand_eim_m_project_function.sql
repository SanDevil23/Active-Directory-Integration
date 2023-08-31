-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hr_anand
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `eim_m_project_function`
--

DROP TABLE IF EXISTS `eim_m_project_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eim_m_project_function` (
  `project_function_id` bigint NOT NULL AUTO_INCREMENT,
  `project_function_name` varchar(95) DEFAULT NULL,
  `project_function_active` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`project_function_id`),
  KEY `projectFunctionCreatedBy` (`m_user_id`),
  CONSTRAINT `projectFunctionCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eim_m_project_function`
--

LOCK TABLES `eim_m_project_function` WRITE;
/*!40000 ALTER TABLE `eim_m_project_function` DISABLE KEYS */;
INSERT INTO `eim_m_project_function` VALUES (1,'Management and Governance (MGMNT)',1,'2022-01-16 09:48:24',1),(2,'Finance (FIN)',1,'2022-01-16 09:48:24',1),(3,'Excellence in Manufacturing (EIM)',1,'2022-01-16 09:48:24',1),(4,'Internal Audit (IA)',1,'2022-01-16 09:48:24',1),(5,'Human Resource and Administration (HRA)',1,'2022-01-16 09:48:24',1),(6,'Technology and Innovation (AT)',1,'2022-01-16 09:48:24',1),(7,'Aftermarket (AM)',1,'2022-01-16 09:48:24',1),(8,'ANAND U (AU)',1,'2022-01-16 09:48:24',1),(9,'Infrastructure (IFS)',1,'2022-01-16 09:48:24',1),(10,'Manufacturing Engineering (ME)',1,'2022-01-16 09:48:24',1),(11,'Information Technology (IT)',1,'2022-01-16 09:48:24',1),(12,'Business Development (BDM)',1,'2022-01-16 09:48:24',1),(13,'Corporate Communications (CCOMM)',1,'2022-01-16 09:48:24',1),(14,'Innovation (INNOV)',1,'2022-01-16 09:48:24',1),(15,'Legal (LS)',1,'2022-01-16 09:48:24',1),(16,'Production (PRD)',1,'2022-01-16 09:48:24',1),(17,'Supply Chain Management (SCM)',1,'2022-01-16 09:48:24',1),(18,'Quality (QUAL)',1,'2022-01-16 09:48:24',1),(19,'Corporate Strategy and Planning (SP)',1,'2022-01-16 09:48:24',1),(20,'Research and Development (R&D)',1,'2022-01-16 09:48:24',1),(21,'Exports (EXP)',1,'2022-01-16 09:48:24',1),(22,'Maintenance (MAINT)',1,'2022-01-16 09:48:24',1),(23,'Environment Health and Safety (EHS)',1,'2022-01-16 09:48:24',1),(24,'EOHS & Utility (EOHS)',1,'2022-01-16 09:48:24',1);
/*!40000 ALTER TABLE `eim_m_project_function` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:31
