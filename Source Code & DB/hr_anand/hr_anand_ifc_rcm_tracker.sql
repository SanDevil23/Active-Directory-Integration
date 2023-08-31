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
-- Table structure for table `ifc_rcm_tracker`
--

DROP TABLE IF EXISTS `ifc_rcm_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ifc_rcm_tracker` (
  `rcm_tracker_id` bigint NOT NULL AUTO_INCREMENT,
  `rcm_transaction_id` bigint DEFAULT NULL,
  `approved_rejected` int DEFAULT NULL,
  `approver_type` int DEFAULT NULL,
  `comments` varchar(150) DEFAULT NULL,
  `approval_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`rcm_tracker_id`),
  KEY `rcm_transaction_id_idx` (`rcm_transaction_id`),
  CONSTRAINT `rcm_transaction_id` FOREIGN KEY (`rcm_transaction_id`) REFERENCES `ifc_rcm_transaction` (`rcm_transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_rcm_tracker`
--

LOCK TABLES `ifc_rcm_tracker` WRITE;
/*!40000 ALTER TABLE `ifc_rcm_tracker` DISABLE KEYS */;
INSERT INTO `ifc_rcm_tracker` VALUES (3,9,1,1,'Approved','2023-02-07 12:12:50'),(4,9,0,2,'Rejected PRAAC','2023-02-07 12:20:57'),(5,9,0,1,'Rejected','2023-02-07 12:21:42'),(6,9,1,1,'Approved','2023-02-10 08:36:02');
/*!40000 ALTER TABLE `ifc_rcm_tracker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:36
