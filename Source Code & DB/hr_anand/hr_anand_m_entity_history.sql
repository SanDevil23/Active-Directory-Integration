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
-- Table structure for table `m_entity_history`
--

DROP TABLE IF EXISTS `m_entity_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_entity_history` (
  `m_entity_history_id` bigint NOT NULL AUTO_INCREMENT,
  `m_entity_id` bigint NOT NULL,
  `entity_name` varchar(250) DEFAULT NULL,
  `entity_short_name` varchar(150) DEFAULT NULL,
  `entity_acronym` varchar(50) DEFAULT NULL,
  `entity_source` bigint DEFAULT NULL,
  `m_location_id` bigint DEFAULT NULL,
  `entity_active` int DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`m_entity_history_id`),
  KEY `entityHistoryCreatedBy` (`m_user_id`),
  KEY `entityHistoryLocation` (`m_location_id`),
  KEY `parentEntitySource` (`m_entity_id`),
  CONSTRAINT `entityHistoryCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `entityHistoryLocation` FOREIGN KEY (`m_location_id`) REFERENCES `m_location` (`m_location_id`),
  CONSTRAINT `parentEntitySource` FOREIGN KEY (`m_entity_id`) REFERENCES `m_entity` (`m_entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_entity_history`
--

LOCK TABLES `m_entity_history` WRITE;
/*!40000 ALTER TABLE `m_entity_history` DISABLE KEYS */;
INSERT INTO `m_entity_history` VALUES (1,10,'GIL Casting Plant','Gariel India','GIL',5,8,1,1,'2023-01-13 14:30:02'),(2,82,'AiPL Castings Plant','ANAND I-Power Limited','AiPL',8,17,1,1,'2023-01-13 14:31:23');
/*!40000 ALTER TABLE `m_entity_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:34
