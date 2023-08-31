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
-- Table structure for table `eim_t_project_charter_request_terminate_approval`
--

DROP TABLE IF EXISTS `eim_t_project_charter_request_terminate_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eim_t_project_charter_request_terminate_approval` (
  `t_project_charter_request_terminate_approval_id` bigint NOT NULL AUTO_INCREMENT,
  `t_project_charter_id` bigint DEFAULT NULL,
  `approver_type` int DEFAULT NULL COMMENT '1-Sponsor, 2-ProcessOwner, 3-ProblemSolvingLeaderPrimary, 4-FinanceController, 5-BusinessLeaderCoo, 6-CorporateProblemSolvingLeader',
  `approver_id` bigint DEFAULT NULL,
  `approval_submission_date` datetime DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  `approval_comments` varchar(255) DEFAULT NULL,
  `approval_status` int DEFAULT NULL COMMENT '0-Waiting, 1-Approved, 2-Rejected',
  `active` int DEFAULT NULL COMMENT '0-InActive, 1-Active',
  PRIMARY KEY (`t_project_charter_request_terminate_approval_id`),
  KEY `charterApproverRequestTerminate` (`approver_id`),
  KEY `parentCharterRequestTerminated_idx` (`t_project_charter_id`),
  CONSTRAINT `charterApproverRequestTerminate` FOREIGN KEY (`approver_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `parentCharterRequestTerminated` FOREIGN KEY (`t_project_charter_id`) REFERENCES `eim_t_project_charter` (`t_project_charter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eim_t_project_charter_request_terminate_approval`
--

LOCK TABLES `eim_t_project_charter_request_terminate_approval` WRITE;
/*!40000 ALTER TABLE `eim_t_project_charter_request_terminate_approval` DISABLE KEYS */;
INSERT INTO `eim_t_project_charter_request_terminate_approval` VALUES (2,1,1,7,NULL,NULL,NULL,0,1);
/*!40000 ALTER TABLE `eim_t_project_charter_request_terminate_approval` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:39
