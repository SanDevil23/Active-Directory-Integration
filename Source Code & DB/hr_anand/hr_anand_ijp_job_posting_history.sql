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
-- Table structure for table `ijp_job_posting_history`
--

DROP TABLE IF EXISTS `ijp_job_posting_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ijp_job_posting_history` (
  `job_posting_history_id` bigint NOT NULL AUTO_INCREMENT,
  `job_posting_id` bigint DEFAULT NULL,
  `ijp_number` varchar(105) DEFAULT NULL,
  `job_status` int DEFAULT NULL COMMENT '1-Save, 2-Approval Waiting, 3-On-Hold, 4-Open, 5-Closed, 6-Rejected',
  `m_entity_id` bigint DEFAULT NULL,
  `m_designation_id` bigint DEFAULT NULL,
  `m_department_id` bigint DEFAULT NULL,
  `m_level_id` bigint DEFAULT NULL,
  `job_purpose` mediumtext,
  `job_duties` mediumtext,
  `min_exp` int DEFAULT NULL,
  `max_exp` int DEFAULT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `skill_set` mediumtext,
  `other_pre_requisite` mediumtext,
  `poc_email` varchar(155) DEFAULT NULL,
  `manpower_requisition_no` varchar(155) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `last_application_date` datetime DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `active` int DEFAULT NULL,
  PRIMARY KEY (`job_posting_history_id`),
  KEY `parentJob_idx` (`job_posting_id`),
  KEY `jobHistoryEntity_idx` (`m_entity_id`),
  KEY `jobHistoryDepartment_idx` (`m_department_id`),
  KEY `jobHistoryDesignation_idx` (`m_designation_id`),
  KEY `jobHistoryCreatedBy_idx` (`m_user_id`),
  KEY `jobLevel_idx` (`m_level_id`),
  CONSTRAINT `jobHistoryCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `jobHistoryDepartment` FOREIGN KEY (`m_department_id`) REFERENCES `m_department` (`m_department_id`),
  CONSTRAINT `jobHistoryDesignation` FOREIGN KEY (`m_designation_id`) REFERENCES `m_designation` (`m_designation_id`),
  CONSTRAINT `jobHistoryEntity` FOREIGN KEY (`m_entity_id`) REFERENCES `m_entity` (`m_entity_id`),
  CONSTRAINT `jobLevelHistory` FOREIGN KEY (`m_level_id`) REFERENCES `m_level` (`m_level_id`),
  CONSTRAINT `parentJob` FOREIGN KEY (`job_posting_id`) REFERENCES `ijp_job_posting` (`job_posting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ijp_job_posting_history`
--

LOCK TABLES `ijp_job_posting_history` WRITE;
/*!40000 ALTER TABLE `ijp_job_posting_history` DISABLE KEYS */;
INSERT INTO `ijp_job_posting_history` VALUES (1,5,NULL,1,79,2,18,5,'t1\r\nt2\r\nt3','d1\r\nd2\r\nd3',8,14,'1','s1\r\ns2\r\ns3','o1\r\no2\r\no3',NULL,'JD-09099-SD-01','2023-07-31 16:32:21',NULL,1,1),(2,5,NULL,1,79,2,18,5,'t1\r\nt2\r\nt3','d1\r\nd2\r\nd3',8,14,'1','s1\r\ns2\r\ns3','o1\r\no2\r\no3',NULL,'JD-09099-SD-01','2023-07-31 16:34:27',NULL,1,1),(3,5,NULL,1,79,2,18,5,'t1\r\nt2\r\nt3','d1\r\nd2\r\nd3',8,14,'1,2','s1\r\ns2\r\ns3','o1\r\no2\r\no3',NULL,'JD-09099-SD-01','2023-07-31 16:37:51',NULL,1,1),(4,5,NULL,1,79,2,18,5,'t1\r\nt2\r\nt3','d1\r\nd2\r\nd3',8,14,'4,5','s1\r\ns2\r\ns3','o1\r\no2\r\no3',NULL,'JD-09099-SD-01','2023-07-31 16:40:37',NULL,1,1),(5,5,NULL,1,79,3,18,6,'t11\r\nt2\r\nt3','d1\r\nd2\r\nd33',8,14,'4,5','s1\r\ns22\r\ns3','o1\r\no22\r\no3',NULL,'JD-09099-SD-01','2023-07-31 18:57:24',NULL,1,1);
/*!40000 ALTER TABLE `ijp_job_posting_history` ENABLE KEYS */;
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
