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
-- Table structure for table `m_level`
--

DROP TABLE IF EXISTS `m_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_level` (
  `m_level_id` bigint NOT NULL AUTO_INCREMENT,
  `level_name` varchar(45) DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `m_user_id_updated` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` int DEFAULT NULL,
  PRIMARY KEY (`m_level_id`),
  KEY `levelCreatedBy_idx` (`m_user_id`),
  KEY `levelUpdatedBy_idx` (`m_user_id_updated`),
  CONSTRAINT `levelCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `levelUpdatedBy` FOREIGN KEY (`m_user_id_updated`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_level`
--

LOCK TABLES `m_level` WRITE;
/*!40000 ALTER TABLE `m_level` DISABLE KEYS */;
INSERT INTO `m_level` VALUES (1,'L0-M2',1,'2023-07-14 19:17:18',NULL,NULL,1),(2,'L0-M3',1,'2023-07-14 19:17:18',NULL,NULL,1),(3,'L1-M4',1,'2023-07-14 19:17:18',NULL,NULL,1),(4,'L1-M5',1,'2023-07-14 19:17:18',NULL,NULL,1),(5,'L2-M6',1,'2023-07-14 19:17:18',NULL,NULL,1),(6,'L2-M7',1,'2023-07-14 19:17:18',NULL,NULL,1),(7,'L3-M8',1,'2023-07-14 19:17:18',NULL,NULL,1),(8,'L3-M9',1,'2023-07-14 19:17:18',NULL,NULL,1),(9,'L4-M10',1,'2023-07-14 19:17:18',NULL,NULL,1),(10,'L4-M11',1,'2023-07-14 19:17:18',NULL,NULL,1),(11,'L5-M12',1,'2023-07-14 19:17:18',NULL,NULL,1),(12,'L5-M13',1,'2023-07-14 19:17:18',NULL,NULL,1),(13,'RETAINER-R',1,'2023-07-14 19:17:18',NULL,NULL,1);
/*!40000 ALTER TABLE `m_level` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:42
