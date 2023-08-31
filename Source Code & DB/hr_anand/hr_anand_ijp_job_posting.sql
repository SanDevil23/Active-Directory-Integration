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
-- Table structure for table `ijp_job_posting`
--

DROP TABLE IF EXISTS `ijp_job_posting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ijp_job_posting` (
  `job_posting_id` bigint NOT NULL AUTO_INCREMENT,
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
  `updated_on` datetime DEFAULT NULL,
  `m_user_updated_by` bigint DEFAULT NULL,
  `active` int DEFAULT NULL,
  PRIMARY KEY (`job_posting_id`),
  UNIQUE KEY `ijp_number_UNIQUE` (`ijp_number`),
  UNIQUE KEY `manpower_requisition_no_UNIQUE` (`manpower_requisition_no`),
  KEY `jobEntity_idx` (`m_entity_id`),
  KEY `jobDepartment_idx` (`m_department_id`),
  KEY `jobDesignation_idx` (`m_designation_id`),
  KEY `jobCreatedBy_idx` (`m_user_id`),
  KEY `jobUpdatedBy_idx` (`m_user_updated_by`),
  KEY `jobLevel_idx` (`m_level_id`),
  CONSTRAINT `jobCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `jobDepartment` FOREIGN KEY (`m_department_id`) REFERENCES `m_department` (`m_department_id`),
  CONSTRAINT `jobDesignation` FOREIGN KEY (`m_designation_id`) REFERENCES `m_designation` (`m_designation_id`),
  CONSTRAINT `jobEntity` FOREIGN KEY (`m_entity_id`) REFERENCES `m_entity` (`m_entity_id`),
  CONSTRAINT `jobLevel` FOREIGN KEY (`m_level_id`) REFERENCES `m_level` (`m_level_id`),
  CONSTRAINT `jobUpdatedBy` FOREIGN KEY (`m_user_updated_by`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ijp_job_posting`
--

LOCK TABLES `ijp_job_posting` WRITE;
/*!40000 ALTER TABLE `ijp_job_posting` DISABLE KEYS */;
INSERT INTO `ijp_job_posting` VALUES (1,NULL,1,2,3,1,6,'Job Purpose 1\r\nJob Purpose 2\r\nJob Purpose 3','Job Duties 1\r\nJob Duties 2\r\nJob Duties 3',10,15,'10,13','Skill Set 1\r\nSkill Set 2\r\nSkill Set 3','Skill Set 11\r\nSkill Set 22\r\nSkill Set 33',NULL,'JD-09099-SD',NULL,NULL,NULL,NULL,NULL,1),(4,NULL,1,82,3,19,6,'JP 1\r\nJP 2\r\nJP 3','JD 1\r\nJD 2\r\nJD 3',5,17,'2','SS 1\r\nSS 2\r\nSS 3','OPR 1\r\nOPR 2\r\nOPR 3',NULL,'asdf-asdf2se-FDF','2023-07-31 13:40:05',NULL,1,NULL,NULL,1),(5,NULL,1,42,3,18,6,'t11\r\nt2\r\nt3','d1\r\nd2\r\nd33',8,14,'4,5','s1\r\ns22\r\ns3','o1\r\no22\r\no3',NULL,'JD-09099-SD-01','2023-07-31 13:49:06',NULL,1,'2023-07-31 18:57:24',1,1);
/*!40000 ALTER TABLE `ijp_job_posting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:35
