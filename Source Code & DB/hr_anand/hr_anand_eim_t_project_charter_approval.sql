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
-- Table structure for table `eim_t_project_charter_approval`
--

DROP TABLE IF EXISTS `eim_t_project_charter_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eim_t_project_charter_approval` (
  `t_project_charter_approval_id` bigint NOT NULL AUTO_INCREMENT,
  `t_project_charter_id` bigint DEFAULT NULL,
  `approver_type` int DEFAULT NULL COMMENT '1-Sponsor, 2-ProcessOwner, 3-ProblemSolvingLeaderPrimary, 4-FinanceController, 5-BusinessLeaderCoo, 6-CorporateProblemSolvingLeader',
  `approver_id` bigint DEFAULT NULL,
  `approval_submission_date` datetime DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  `approval_comments` varchar(255) DEFAULT NULL,
  `approval_status` int DEFAULT NULL COMMENT '0-Waiting, 1-Approved, 2-Rejected',
  `active` int DEFAULT NULL COMMENT '0-InActive, 1-Active',
  PRIMARY KEY (`t_project_charter_approval_id`),
  KEY `charterApprover` (`approver_id`),
  KEY `parentCharter` (`t_project_charter_id`),
  CONSTRAINT `charterApprover` FOREIGN KEY (`approver_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `parentCharter` FOREIGN KEY (`t_project_charter_id`) REFERENCES `eim_t_project_charter` (`t_project_charter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eim_t_project_charter_approval`
--

LOCK TABLES `eim_t_project_charter_approval` WRITE;
/*!40000 ALTER TABLE `eim_t_project_charter_approval` DISABLE KEYS */;
INSERT INTO `eim_t_project_charter_approval` VALUES (1,1,1,1,'2022-08-19 16:38:55','2022-08-19 17:37:31','Approved',1,1),(2,1,2,1,NULL,'2022-08-19 17:38:31','Approved',1,1),(3,1,3,1,NULL,'2022-08-19 18:17:11','Approved',1,1),(5,2,1,7,'2023-01-18 09:52:08','2023-01-18 09:54:34','Approved',1,1),(6,2,2,12,NULL,'2023-01-18 09:55:06','Approved',1,1),(7,2,3,9,NULL,'2023-01-18 09:55:37','Approved',1,1),(8,2,4,10,NULL,'2023-01-18 09:56:46','Approved',1,1),(9,2,5,15,NULL,'2023-01-18 09:58:27','Approved',1,1),(10,2,6,11,NULL,'2023-01-18 09:59:44','Approved',1,1),(11,1,1,7,'2023-02-09 16:46:25','2023-02-09 16:52:28','Terminated',3,1),(12,3,1,7,'2023-02-13 14:02:37','2023-02-13 14:03:26','Approved',1,1),(13,3,2,12,NULL,'2023-02-13 14:03:44','Approved',1,1),(14,3,3,9,NULL,'2023-02-13 14:04:22','Approved',1,1),(15,3,4,10,NULL,'2023-02-13 14:09:09','Approved',1,1),(16,3,5,15,NULL,'2023-02-13 14:09:34','Approved',1,1),(17,3,6,11,NULL,'2023-02-13 14:10:55','Approved',1,1),(18,4,1,7,'2023-02-14 09:31:50','2023-02-14 09:41:15','Approved',1,1),(19,4,2,12,'2023-02-14 09:41:15','2023-02-14 09:42:24','Approved',1,1),(20,4,3,9,'2023-02-14 09:42:24','2023-02-14 09:48:54','Approved',1,1),(21,4,4,10,'2023-02-14 09:48:54','2023-02-14 09:49:49','Approved',1,1),(22,4,5,15,'2023-02-14 09:49:49','2023-02-14 09:50:25','Approved',1,1),(23,4,6,11,'2023-02-14 09:50:25','2023-02-14 09:51:04','Approved',1,1),(24,5,1,7,'2023-02-14 11:00:40','2023-02-14 11:01:03','Approved',1,1),(25,5,2,12,'2023-02-14 11:01:03','2023-02-14 11:01:22','Approved',1,1),(26,5,3,9,'2023-02-14 11:01:22','2023-02-14 11:01:49','Approved',1,1),(27,5,4,10,'2023-02-14 11:01:49','2023-02-14 11:02:13','Approved',1,1),(28,5,5,15,'2023-02-14 11:02:13','2023-02-14 11:02:33','Approved',1,1),(29,5,6,11,'2023-02-14 11:02:33','2023-02-14 11:03:21','Approved',1,1),(30,6,1,7,'2023-02-17 14:44:34','2023-02-17 14:45:32','Approved',1,1),(31,6,2,12,'2023-02-17 14:45:32','2023-02-17 14:47:43','Approved',1,1),(32,6,3,9,'2023-02-17 14:47:43','2023-02-17 14:48:01','Approved',1,1),(33,6,4,10,'2023-02-17 14:48:01','2023-02-17 14:48:20','Approved',1,1),(34,6,5,15,'2023-02-17 14:48:20','2023-02-17 14:48:59','Approved',1,1),(35,6,6,11,'2023-02-17 14:48:59','2023-02-17 15:02:29','Approved',1,1);
/*!40000 ALTER TABLE `eim_t_project_charter_approval` ENABLE KEYS */;
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
