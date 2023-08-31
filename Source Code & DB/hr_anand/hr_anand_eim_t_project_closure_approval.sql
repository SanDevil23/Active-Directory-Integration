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
-- Table structure for table `eim_t_project_closure_approval`
--

DROP TABLE IF EXISTS `eim_t_project_closure_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eim_t_project_closure_approval` (
  `t_project_closure_approval_id` bigint NOT NULL AUTO_INCREMENT,
  `t_project_charter_id` bigint DEFAULT NULL,
  `approver_type` int DEFAULT NULL COMMENT '1-Sponsor, 2-ProcessOwner, 3-ProblemSolvingLeaderPrimary, 4-FinanceController, 5-BusinessLeaderCoo, 6-CorporateProblemSolvingLeader',
  `approver_id` bigint DEFAULT NULL,
  `approval_submission_date` datetime DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  `approval_comments` varchar(255) DEFAULT NULL,
  `approval_status` int DEFAULT NULL COMMENT '0-Waiting, 1-Approved, 2-Rejected',
  `first_criteria` int DEFAULT NULL,
  `second_criteria` int DEFAULT NULL,
  `third_criteria` int DEFAULT NULL,
  `fourth_criteria` int DEFAULT NULL,
  `fifth_criteria` int DEFAULT NULL,
  `total_score` int DEFAULT NULL,
  `survey_comments` varchar(255) DEFAULT NULL,
  `active` int DEFAULT NULL COMMENT '0-InActive, 1-Active',
  PRIMARY KEY (`t_project_closure_approval_id`),
  KEY `closureApprover` (`approver_id`),
  KEY `parentCharter` (`t_project_charter_id`),
  CONSTRAINT `closureApprover` FOREIGN KEY (`approver_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `parentClosure` FOREIGN KEY (`t_project_charter_id`) REFERENCES `eim_t_project_charter` (`t_project_charter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eim_t_project_closure_approval`
--

LOCK TABLES `eim_t_project_closure_approval` WRITE;
/*!40000 ALTER TABLE `eim_t_project_closure_approval` DISABLE KEYS */;
INSERT INTO `eim_t_project_closure_approval` VALUES (23,2,1,7,'2023-02-13 11:23:55','2023-02-13 11:24:28','Approved',1,5,5,3,5,3,NULL,NULL,1),(24,2,2,12,NULL,'2023-02-13 11:25:32','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(25,2,3,9,NULL,'2023-02-13 11:25:57','Approved',1,5,5,3,4,3,NULL,NULL,1),(26,2,4,10,NULL,'2023-02-13 11:26:14','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(27,2,5,15,NULL,'2023-02-13 11:26:36','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(28,2,6,11,NULL,'2023-02-13 12:21:58','Approved',1,1,3,4,3,1,NULL,'Survey Test Comments',1),(36,3,1,7,'2023-02-13 15:55:19','2023-02-13 15:55:52','Approved',1,5,5,5,5,5,NULL,'Survey Test Comments',1),(37,3,2,12,NULL,'2023-02-13 16:06:05','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(38,3,3,9,NULL,'2023-02-13 16:09:25','Approved',1,5,5,5,5,5,70,'Survey Test Comments',1),(39,3,4,10,NULL,'2023-02-13 16:50:04','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(40,3,5,15,'2023-02-13 16:50:04','2023-02-14 09:50:08','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(41,3,6,11,'2023-02-14 09:50:08','2023-02-14 13:48:21','Approved',1,5,3,3,4,4,54,'Survey Test Comments',1),(42,4,1,7,'2023-02-15 14:31:24','2023-02-17 14:46:03','Approved',1,5,5,5,5,5,70,'Survey Test Comments',1),(44,5,1,7,'2023-02-16 16:17:31','2023-02-16 16:48:40','Approved',1,1,5,2,4,5,40,'Survey Test Comments',1),(45,5,2,12,'2023-02-16 16:48:40','2023-02-16 16:54:09','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(46,5,3,9,'2023-02-16 16:54:09','2023-02-16 16:54:45','Approved',1,1,2,3,4,5,31,'Survey Test Comments',1),(47,5,4,10,'2023-02-16 16:54:45','2023-02-17 14:48:41','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(48,4,2,12,'2023-02-17 14:46:03','2023-02-17 15:16:52','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(49,5,5,15,'2023-02-17 14:48:41','2023-02-17 14:49:08','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(50,5,6,11,'2023-02-17 14:49:08',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(51,4,3,9,'2023-02-17 15:16:52','2023-02-17 15:17:46','Approved',1,5,5,5,5,5,70,'Survey Test Comments',1),(52,4,4,10,'2023-02-17 15:17:46','2023-02-17 15:36:56','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(53,6,1,7,'2023-02-17 15:21:46','2023-02-17 15:27:35','Approved',1,5,5,5,5,5,70,'Survey Test Comments',1),(54,6,2,12,'2023-02-17 15:27:35','2023-02-17 15:33:49','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(55,6,3,9,'2023-02-17 15:33:49','2023-02-17 15:34:27','Approved',1,5,5,5,5,5,70,'Survey Test Comments',1),(56,6,4,10,'2023-02-17 15:34:27','2023-02-17 15:36:48','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(57,6,5,15,'2023-02-17 15:36:48','2023-02-17 15:38:21','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(58,4,5,15,'2023-02-17 15:36:56','2023-02-17 15:38:30','Approved',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(59,6,6,11,'2023-02-17 15:38:21','2023-02-17 15:40:39','Approved',1,5,5,5,5,5,70,'Survey Test Comments',1),(60,4,6,11,'2023-02-17 15:38:30',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `eim_t_project_closure_approval` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:30
