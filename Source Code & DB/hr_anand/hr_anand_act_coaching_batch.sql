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
-- Table structure for table `act_coaching_batch`
--

DROP TABLE IF EXISTS `act_coaching_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_coaching_batch` (
  `act_coaching_batch_id` bigint NOT NULL AUTO_INCREMENT,
  `batch_name` varchar(150) DEFAULT NULL,
  `batch_description` varchar(150) DEFAULT NULL,
  `batch_start_date` datetime DEFAULT NULL,
  `batch_end_date` datetime DEFAULT NULL,
  `batch_active` int DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `m_user_id_updated` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`act_coaching_batch_id`),
  KEY `coachingBatchCreatedOn_idx` (`m_user_id`),
  CONSTRAINT `coachingBatchCreatedOn` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_coaching_batch`
--

LOCK TABLES `act_coaching_batch` WRITE;
/*!40000 ALTER TABLE `act_coaching_batch` DISABLE KEYS */;
INSERT INTO `act_coaching_batch` VALUES (1,'Batch 1','Batch 1','2023-03-01 00:00:00','2023-04-29 00:00:00',1,1,'2023-04-17 20:39:15',1,'2023-04-18 09:11:28'),(2,'Batch 2','Batch 2','2022-10-01 00:00:00','2022-12-27 00:00:00',1,1,'2023-04-18 09:07:36',NULL,NULL),(9,'Batch 3','Batch 3','2023-01-01 00:00:00','2023-12-31 00:00:00',1,1,'2023-04-20 08:44:23',1,'2023-05-30 18:33:21');
/*!40000 ALTER TABLE `act_coaching_batch` ENABLE KEYS */;
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
