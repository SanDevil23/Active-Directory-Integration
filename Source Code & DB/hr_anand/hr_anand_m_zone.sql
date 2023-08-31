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
-- Table structure for table `m_zone`
--

DROP TABLE IF EXISTS `m_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_zone` (
  `m_zone_id` bigint NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(45) DEFAULT NULL,
  `zone_active` int DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `m_user_id_updated` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`m_zone_id`),
  KEY `zoneCreatedBy_idx` (`m_user_id`),
  KEY `zoneUpdatedBy_idx` (`m_user_id_updated`),
  CONSTRAINT `zoneCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `zoneUpdatedBy` FOREIGN KEY (`m_user_id_updated`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_zone`
--

LOCK TABLES `m_zone` WRITE;
/*!40000 ALTER TABLE `m_zone` DISABLE KEYS */;
INSERT INTO `m_zone` VALUES (1,'North',1,1,'2022-08-09 13:31:31',1,'2022-09-21 12:15:04'),(2,'South',1,1,'2022-08-09 13:31:31',NULL,NULL),(3,'West',1,1,'2022-08-09 13:31:31',NULL,NULL),(4,'East',1,1,'2022-08-09 13:31:31',1,'2022-08-10 17:01:33'),(5,'Central',0,1,'2022-08-09 13:31:31',1,'2022-10-27 09:53:03');
/*!40000 ALTER TABLE `m_zone` ENABLE KEYS */;
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
