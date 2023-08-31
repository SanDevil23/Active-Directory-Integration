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
-- Table structure for table `eim_t_project_contract_approval`
--

DROP TABLE IF EXISTS `eim_t_project_contract_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eim_t_project_contract_approval` (
  `t_project_contract_approval_id` bigint NOT NULL AUTO_INCREMENT,
  `t_project_charter_id` bigint DEFAULT NULL,
  `approver_type` int DEFAULT NULL,
  `approver_id` bigint DEFAULT NULL,
  `approval_submission_date` datetime DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  `approval_comments` varchar(255) DEFAULT NULL,
  `approval_status` int DEFAULT NULL,
  `active` int DEFAULT NULL,
  PRIMARY KEY (`t_project_contract_approval_id`),
  KEY `parentCharter_idx` (`t_project_charter_id`),
  KEY `contractApprover_idx` (`approver_id`),
  CONSTRAINT `contractApprover` FOREIGN KEY (`approver_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `parentContract` FOREIGN KEY (`t_project_charter_id`) REFERENCES `eim_t_project_charter` (`t_project_charter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eim_t_project_contract_approval`
--

LOCK TABLES `eim_t_project_contract_approval` WRITE;
/*!40000 ALTER TABLE `eim_t_project_contract_approval` DISABLE KEYS */;
INSERT INTO `eim_t_project_contract_approval` VALUES (17,2,1,7,'2023-02-10 09:31:28','2023-02-10 09:31:57','Approved',1,1),(18,2,2,12,NULL,'2023-02-10 09:32:37','Approved',1,1),(19,2,3,9,NULL,'2023-02-10 09:33:18','Approved',1,1),(20,2,4,10,NULL,'2023-02-10 09:33:53','Approved',1,1),(21,2,5,15,NULL,'2023-02-10 09:34:44','Approved',1,1),(22,2,6,11,NULL,'2023-02-10 09:35:25','Approved',1,1),(24,3,1,7,'2023-02-13 14:16:05','2023-02-13 14:16:46','Approved',1,1),(25,3,2,12,NULL,'2023-02-13 14:17:08','Approved',1,1),(26,3,3,9,NULL,'2023-02-13 14:17:30','Approved',1,1),(27,3,4,10,NULL,'2023-02-13 14:31:07','Approved',1,1),(28,3,5,15,NULL,'2023-02-13 14:31:26','Approved',1,1),(29,3,6,11,NULL,'2023-02-13 14:31:43','Approved',1,1),(35,4,1,7,'2023-02-14 10:53:54','2023-02-14 10:54:19','Approved',1,1),(36,4,2,12,'2023-02-14 10:54:19','2023-02-14 10:54:46','Approved',1,1),(37,4,3,9,'2023-02-14 10:54:46','2023-02-14 10:55:08','Approved',1,1),(38,4,4,10,'2023-02-14 10:55:08','2023-02-14 10:55:24','Approved',1,1),(39,4,5,15,'2023-02-14 10:55:24','2023-02-14 10:55:48','Approved',1,1),(40,4,6,11,'2023-02-14 10:55:48','2023-02-14 10:57:37','Approved',1,1),(42,5,1,7,'2023-02-16 14:20:00','2023-02-16 14:21:33','Approved',1,1),(43,5,2,12,'2023-02-16 14:21:33','2023-02-16 14:21:52','Approved',1,1),(44,5,3,9,'2023-02-16 14:21:52','2023-02-16 14:22:08','Approved',1,1),(45,5,4,10,'2023-02-16 14:22:08','2023-02-16 14:22:25','Approved',1,1),(46,5,5,15,'2023-02-16 14:22:25','2023-02-16 14:22:39','Approved',1,1),(47,5,6,11,'2023-02-16 14:22:39','2023-02-16 14:23:04','Approved',1,1),(48,6,1,7,'2023-02-17 15:04:31','2023-02-17 15:04:56','Approved',1,1),(49,6,2,12,'2023-02-17 15:04:56','2023-02-17 15:15:47','Approved',1,1),(50,6,3,9,'2023-02-17 15:15:47','2023-02-17 15:17:17','Approved',1,1),(51,6,4,10,'2023-02-17 15:17:17','2023-02-17 15:19:36','Approved',1,1),(52,6,5,15,'2023-02-17 15:19:36','2023-02-17 15:19:51','Approved',1,1),(53,6,6,11,'2023-02-17 15:19:51','2023-02-17 15:20:11','Approved',1,1);
/*!40000 ALTER TABLE `eim_t_project_contract_approval` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:37
