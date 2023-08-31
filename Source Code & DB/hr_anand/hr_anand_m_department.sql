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
-- Table structure for table `m_department`
--

DROP TABLE IF EXISTS `m_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_department` (
  `m_department_id` bigint NOT NULL AUTO_INCREMENT,
  `department_name` varchar(250) DEFAULT NULL,
  `department_description` varchar(550) DEFAULT NULL,
  `department_active` int DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `m_user_id_update` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`m_department_id`),
  KEY `departmentCreated_idx` (`m_user_id`),
  KEY `departmentUpdatedBy_idx` (`m_user_id_update`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_department`
--

LOCK TABLES `m_department` WRITE;
/*!40000 ALTER TABLE `m_department` DISABLE KEYS */;
INSERT INTO `m_department` VALUES (1,'Information Technology','IT for all digital needs',1,1,'2022-08-09 14:58:57',NULL,NULL),(2,'Human Resource And Admin','HR Department',1,1,'2022-08-11 10:40:57',1,'2022-10-26 11:27:53'),(3,'Aftermarket','Aftermarket',1,1,'2022-09-21 09:40:44',1,'2022-09-21 09:45:51'),(4,'Automation & Technology','Automation & Technology',1,1,'2022-09-21 09:40:59',1,'2022-09-21 09:46:04'),(5,'Business Development','Business Development',1,1,'2022-09-21 09:41:12',1,'2022-09-21 09:46:17'),(6,'Corporate Communications','Corporate Communications',1,1,'2022-09-21 09:41:21',1,'2022-09-21 09:46:30'),(7,'Environment Health & Safety','Environment Health & Safety',1,1,'2022-09-21 09:41:37',1,'2022-09-21 09:46:40'),(8,'Excellence in Manufacturing','Excellence in Manufacturing',1,1,'2022-09-21 09:41:44',1,'2022-09-21 09:46:52'),(9,'Finance','Finance',1,1,'2022-09-21 09:43:56',NULL,NULL),(10,'Infrastructure','Infrastructure',1,1,'2022-09-21 09:44:07',NULL,NULL),(11,'Innovation','Innovation',1,1,'2022-09-21 09:44:12',NULL,NULL),(12,'Internal Audit','Internal Audit',1,1,'2022-09-21 09:44:21',NULL,NULL),(13,'Legal and Secretarial','Legal and Secretarial',1,1,'2022-09-21 09:44:29',NULL,NULL),(14,'Maintenance','Maintenance',1,1,'2022-09-21 09:44:46',NULL,NULL),(15,'Admin','Admin',1,1,'2022-09-21 09:44:53',NULL,NULL),(16,'Research & Development','Research & Development',1,1,'2022-09-21 09:45:03',NULL,NULL),(17,'Strategy & Planning','Strategy & Planning',1,1,'2022-09-21 09:45:15',NULL,NULL),(18,'Supply Chain Management','Supply Chain Management',1,1,'2022-09-21 09:45:22',NULL,NULL),(19,'Operations','Operations',1,1,'2022-09-21 09:45:30',NULL,NULL),(20,'Corporate Material','Corporate Material',1,1,'2022-09-21 09:45:38',NULL,NULL),(21,'Supplier Quality Development','Supplier Quality Development',1,1,'2022-09-21 09:47:19',NULL,NULL);
/*!40000 ALTER TABLE `m_department` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:43
