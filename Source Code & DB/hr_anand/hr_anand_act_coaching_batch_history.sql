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
-- Table structure for table `act_coaching_batch_history`
--

DROP TABLE IF EXISTS `act_coaching_batch_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_coaching_batch_history` (
  `act_coaching_batch_history_id` bigint NOT NULL AUTO_INCREMENT,
  `act_coaching_batch_id` bigint NOT NULL,
  `batch_name` varchar(150) DEFAULT NULL,
  `batch_description` varchar(150) DEFAULT NULL,
  `batch_start_date` datetime DEFAULT NULL,
  `batch_end_date` datetime DEFAULT NULL,
  `batch_active` int DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`act_coaching_batch_history_id`),
  KEY `coachingBatchHistoryCreatedOn` (`m_user_id`),
  KEY `parentCoachingBatchDetail` (`act_coaching_batch_id`),
  CONSTRAINT `coachingBatchHistoryCreatedOn` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `parentCoachingBatchDetail` FOREIGN KEY (`act_coaching_batch_id`) REFERENCES `act_coaching_batch` (`act_coaching_batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_coaching_batch_history`
--

LOCK TABLES `act_coaching_batch_history` WRITE;
/*!40000 ALTER TABLE `act_coaching_batch_history` DISABLE KEYS */;
INSERT INTO `act_coaching_batch_history` VALUES (3,1,'Batch 1','Batch 1',NULL,NULL,1,1,'2023-04-18 09:11:14'),(4,1,'Batch 2a','Batch 2a',NULL,NULL,1,1,'2023-04-18 09:11:28'),(5,9,'Batch 3','Batch 3',NULL,NULL,1,1,'2023-04-20 08:44:23'),(15,9,'Batch 3','Batch 3',NULL,NULL,1,1,'2023-05-01 09:47:58'),(16,9,'Batch 3','Batch 3',NULL,NULL,1,1,'2023-05-01 12:27:42');
/*!40000 ALTER TABLE `act_coaching_batch_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:31
