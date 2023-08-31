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
-- Table structure for table `m_app`
--

DROP TABLE IF EXISTS `m_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_app` (
  `m_app_id` bigint NOT NULL AUTO_INCREMENT,
  `app_name` varchar(155) DEFAULT NULL,
  `app_description` varchar(255) DEFAULT NULL,
  `app_active` int DEFAULT NULL,
  `app_created_by` bigint DEFAULT NULL,
  `app_created_on` datetime DEFAULT NULL,
  `app_updated_by` bigint DEFAULT NULL,
  `app_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`m_app_id`),
  KEY `appCreatedBy_idx` (`app_created_by`),
  KEY `appUpdatedBy_idx` (`app_updated_by`),
  CONSTRAINT `appCreatedBy` FOREIGN KEY (`app_created_by`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `appUpdatedBy` FOREIGN KEY (`app_updated_by`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_app`
--

LOCK TABLES `m_app` WRITE;
/*!40000 ALTER TABLE `m_app` DISABLE KEYS */;
INSERT INTO `m_app` VALUES (1,'ALDP','ANAND Leadership Development Program ALDP Coaching Tracker',1,1,'2022-11-01 13:44:23',NULL,NULL),(2,'EMC','Executive Mentoring And Coaching - Sr Executive Coaching Tracker SECT',1,1,'2022-11-01 13:46:23',NULL,NULL),(3,'IJP','ANAND Group Internal Job Posting',1,1,'2022-11-01 13:46:33',1,'2022-11-01 13:46:52'),(4,'EIM','Six Sigma',1,1,'2022-11-01 16:43:10',NULL,NULL),(5,'IFC','Internal Financial Control',1,1,'2023-01-04 09:13:00',NULL,NULL),(6,'ANAND HR Central','ANAND HR Central',1,1,'2023-01-11 14:58:27',NULL,NULL),(7,'AEMS','ANAND Energy Management System',1,1,'2023-04-03 17:43:11',NULL,NULL),(8,'MR','ANAND Group Manpower Requisition Portal',1,1,'2023-07-27 18:30:32',NULL,NULL);
/*!40000 ALTER TABLE `m_app` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:35
