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
-- Table structure for table `m_location`
--

DROP TABLE IF EXISTS `m_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_location` (
  `m_location_id` bigint NOT NULL AUTO_INCREMENT,
  `location_name` varchar(150) DEFAULT NULL,
  `m_zone_id` bigint DEFAULT NULL,
  `location_active` int DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `m_user_id_updated` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`m_location_id`),
  KEY `locationCreatedBy_idx` (`m_user_id`),
  KEY `locationZone_idx` (`m_zone_id`),
  CONSTRAINT `locationCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `locationZone` FOREIGN KEY (`m_zone_id`) REFERENCES `m_zone` (`m_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_location`
--

LOCK TABLES `m_location` WRITE;
/*!40000 ALTER TABLE `m_location` DISABLE KEYS */;
INSERT INTO `m_location` VALUES (1,'New Delhi',1,1,1,'2022-08-09 13:31:31',1,'2022-09-08 14:06:49'),(2,'Chennai',2,1,1,'2022-08-09 13:31:31',NULL,NULL),(3,'Pune',3,1,1,'2022-08-09 13:31:31',1,'2022-08-11 10:17:06'),(4,'Manesar',1,1,1,'2022-08-11 10:17:28',1,'2022-08-11 10:18:15'),(5,'Sanand',3,1,1,'2022-10-26 12:14:28',1,'2022-10-26 12:14:37'),(6,'Bangalore',2,1,1,'2022-10-26 16:16:54',NULL,NULL),(7,'Bhiwadi',1,1,1,'2022-10-26 16:17:01',NULL,NULL),(8,'Chakan',3,1,1,'2022-10-26 16:17:08',NULL,NULL),(9,'Dewas',3,1,1,'2022-10-26 16:17:24',NULL,NULL),(10,'Gurgaon',1,1,1,'2022-10-26 16:17:32',NULL,NULL),(11,'Jaisalmer',1,1,1,'2022-10-26 16:17:40',NULL,NULL),(12,'Jawai',1,1,1,'2022-10-26 16:17:47',NULL,NULL),(13,'Jodali',3,1,1,'2022-10-26 16:17:54',NULL,NULL),(14,'Khandsa',1,1,1,'2022-10-26 16:18:13',NULL,NULL),(15,'Kurkumbh',3,1,1,'2022-10-26 16:18:19',NULL,NULL),(16,'Mumbai',3,1,1,'2022-10-26 16:18:30',NULL,NULL),(17,'Nashik',3,1,1,'2022-10-26 16:18:37',NULL,NULL),(18,'Neemrana',1,1,1,'2022-10-26 16:18:44',NULL,NULL),(19,'Noida',1,1,1,'2022-10-26 16:18:57',NULL,NULL),(20,'Pantnagar',1,1,1,'2022-10-26 16:19:07',NULL,NULL),(21,'Parwanoo',1,1,1,'2022-10-26 16:19:18',NULL,NULL),(22,'Ranathambore',1,1,1,'2022-10-26 16:19:30',NULL,NULL),(23,'Satara',3,1,1,'2022-10-26 16:19:49',NULL,NULL),(24,'Hosur',2,1,1,'2022-10-27 08:48:11',NULL,NULL);
/*!40000 ALTER TABLE `m_location` ENABLE KEYS */;
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
