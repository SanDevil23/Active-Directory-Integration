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
-- Table structure for table `eim_m_project_methodology`
--

DROP TABLE IF EXISTS `eim_m_project_methodology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eim_m_project_methodology` (
  `project_methodology_id` bigint NOT NULL AUTO_INCREMENT,
  `project_methodology_name` varchar(150) DEFAULT NULL,
  `project_methodology_active` int DEFAULT NULL COMMENT '0-In-Active, 1-Active',
  `created_on` datetime DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`project_methodology_id`),
  KEY `projectMethodologyCreatedBy` (`m_user_id`),
  CONSTRAINT `projectMethodologyCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eim_m_project_methodology`
--

LOCK TABLES `eim_m_project_methodology` WRITE;
/*!40000 ALTER TABLE `eim_m_project_methodology` DISABLE KEYS */;
INSERT INTO `eim_m_project_methodology` VALUES (1,'DMAIC',1,'2022-01-15 19:11:49',1),(2,'DFSS',1,'2022-01-15 19:11:49',1),(3,'MBF',1,'2022-01-15 19:11:49',1),(4,'RED X/Shainin DOE',1,'2022-01-15 19:11:49',1),(5,'QC Story',1,'2022-01-15 19:11:49',1);
/*!40000 ALTER TABLE `eim_m_project_methodology` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:33
