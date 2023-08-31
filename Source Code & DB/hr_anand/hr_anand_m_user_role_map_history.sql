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
-- Table structure for table `m_user_role_map_history`
--

DROP TABLE IF EXISTS `m_user_role_map_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_user_role_map_history` (
  `m_user_role_map_history_id` bigint NOT NULL AUTO_INCREMENT,
  `m_user_role_map_id` bigint NOT NULL,
  `m_user_history_id` bigint DEFAULT NULL,
  `m_role_id` bigint DEFAULT NULL,
  `user_role_active` int DEFAULT NULL,
  `user_role_created_on` datetime DEFAULT NULL,
  `user_role_created_by` bigint DEFAULT NULL,
  PRIMARY KEY (`m_user_role_map_history_id`),
  KEY `parentUserRoleMap` (`m_user_role_map_id`),
  KEY `mRoleHistoryId` (`m_role_id`),
  KEY `userRoleHistoryCreatedby` (`user_role_created_by`),
  KEY `mUserHistoryId_idx` (`m_user_history_id`),
  CONSTRAINT `mRoleHistoryId` FOREIGN KEY (`m_role_id`) REFERENCES `m_role` (`m_role_id`),
  CONSTRAINT `mUserHistoryId` FOREIGN KEY (`m_user_history_id`) REFERENCES `m_user_history` (`m_user_history_id`),
  CONSTRAINT `parentUserRoleMap` FOREIGN KEY (`m_user_role_map_id`) REFERENCES `m_user_role_map` (`m_user_role_map_id`),
  CONSTRAINT `userRoleHistoryCreatedby` FOREIGN KEY (`user_role_created_by`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_user_role_map_history`
--

LOCK TABLES `m_user_role_map_history` WRITE;
/*!40000 ALTER TABLE `m_user_role_map_history` DISABLE KEYS */;
INSERT INTO `m_user_role_map_history` VALUES (1,4,22,2,1,'2023-01-07 12:35:25',1),(2,1,23,1,1,'2023-01-09 12:22:18',1),(3,3,23,2,0,'2023-01-09 12:22:18',1),(4,3,33,2,0,'2023-01-10 14:28:14',1),(5,5,33,15,1,'2023-01-10 14:28:14',1),(6,1,33,1,1,'2023-01-10 14:28:14',1),(7,14,61,20,1,'2023-01-12 09:31:01',1),(8,3,67,2,0,'2023-01-21 09:03:27',1),(9,5,67,15,1,'2023-01-21 09:03:27',1),(10,1,67,1,1,'2023-01-21 09:03:27',1),(11,1,68,1,1,'2023-02-10 08:32:04',1),(12,5,68,15,1,'2023-02-10 08:32:04',1),(13,3,68,2,0,'2023-02-10 08:32:04',1),(14,5,69,15,1,'2023-02-10 08:37:34',1),(15,3,69,2,0,'2023-02-10 08:37:34',1),(16,1,69,1,1,'2023-02-10 08:37:34',1),(17,1,70,1,1,'2023-04-03 17:56:50',1),(18,5,70,15,1,'2023-04-03 17:56:50',1),(19,3,70,2,0,'2023-04-03 17:56:50',1),(20,48,79,9,1,'2023-05-30 18:29:33',1),(21,17,81,5,1,'2023-07-14 11:31:02',1),(22,1,82,1,1,'2023-07-27 18:34:52',1),(23,5,82,15,1,'2023-07-27 18:34:52',1),(24,3,82,2,0,'2023-07-27 18:34:52',1);
/*!40000 ALTER TABLE `m_user_role_map_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:40
