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
-- Table structure for table `m_designation`
--

DROP TABLE IF EXISTS `m_designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_designation` (
  `m_designation_id` bigint NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(150) DEFAULT NULL,
  `designation_active` int DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `m_user_id_update` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`m_designation_id`),
  KEY `designationCreatedBy_idx` (`m_user_id`),
  KEY `designationUpdatedBy_idx` (`m_user_id_update`),
  CONSTRAINT `designationCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `designationUpdatedBy` FOREIGN KEY (`m_user_id_update`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_designation`
--

LOCK TABLES `m_designation` WRITE;
/*!40000 ALTER TABLE `m_designation` DISABLE KEYS */;
INSERT INTO `m_designation` VALUES (1,'Assistant Manager',1,1,'2022-08-09 13:31:31',NULL,NULL),(2,'Manager',1,1,'2022-08-09 13:31:31',NULL,NULL),(3,'Senior Manager',1,1,'2022-08-09 13:31:31',1,'2022-10-26 16:32:58'),(4,'Deputy General Manager',1,1,'2022-08-09 13:31:31',NULL,NULL),(5,'General Manager',1,1,'2022-08-09 13:31:31',1,'2022-09-21 11:31:10'),(6,'Vice President',1,1,'2022-08-09 13:31:31',NULL,NULL),(7,'Senior Vice President',1,1,'2022-08-09 13:31:31',NULL,NULL),(8,'President',1,1,'2022-08-09 13:31:31',NULL,NULL),(9,'Group CEO',1,1,'2022-08-11 11:17:58',1,'2022-08-11 11:19:37');
/*!40000 ALTER TABLE `m_designation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:41
