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
-- Table structure for table `m_app_history`
--

DROP TABLE IF EXISTS `m_app_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_app_history` (
  `m_app_history_id` bigint NOT NULL AUTO_INCREMENT,
  `m_app_id` bigint NOT NULL,
  `app_name` varchar(155) DEFAULT NULL,
  `app_description` varchar(255) DEFAULT NULL,
  `app_active` int DEFAULT NULL,
  `app_history_created_by` bigint DEFAULT NULL,
  `app_history_created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`m_app_history_id`),
  KEY `appHistoryCreatedBy` (`app_history_created_by`),
  KEY `parentApp` (`m_app_id`),
  CONSTRAINT `appHistoryCreatedBy` FOREIGN KEY (`app_history_created_by`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `parentApp` FOREIGN KEY (`m_app_id`) REFERENCES `m_app` (`m_app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_app_history`
--

LOCK TABLES `m_app_history` WRITE;
/*!40000 ALTER TABLE `m_app_history` DISABLE KEYS */;
INSERT INTO `m_app_history` VALUES (1,3,'IJP','Internal Job Posting',1,1,'2022-11-01 13:46:52');
/*!40000 ALTER TABLE `m_app_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:36
