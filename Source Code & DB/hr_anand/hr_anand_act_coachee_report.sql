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
-- Table structure for table `act_coachee_report`
--

DROP TABLE IF EXISTS `act_coachee_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_coachee_report` (
  `act_coachee_report_id` bigint NOT NULL AUTO_INCREMENT,
  `act_coach_coachee_map_id` bigint DEFAULT NULL,
  `session_date` datetime DEFAULT NULL,
  `meeting_conducted_status` int DEFAULT NULL COMMENT '1-Conducted, 2-Not-Conducted',
  `report_status` int DEFAULT NULL COMMENT '1-Submitted, 2-Draft',
  `reason_for_not_conducting` tinytext,
  `discussion_and_inputs_from_coach` tinytext,
  `coachee_additional_comments` tinytext,
  `coach_additional_comments` tinytext,
  `any_concern_or_observation` tinytext,
  `coach_reason_for_not_conducting` tinytext,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `m_user_id_updated` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `report_active` int DEFAULT NULL COMMENT '0-In-Active, 1-Active',
  PRIMARY KEY (`act_coachee_report_id`),
  KEY `coachCoacheeMapRef_idx` (`act_coach_coachee_map_id`),
  KEY `reportCreatedBy_idx` (`m_user_id`),
  KEY `reportUpdatedBy_idx` (`m_user_id_updated`),
  CONSTRAINT `coachCoacheeMapRef` FOREIGN KEY (`act_coach_coachee_map_id`) REFERENCES `act_coach_coachee_map` (`act_coach_coachee_map_id`),
  CONSTRAINT `reportCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `reportUpdatedBy` FOREIGN KEY (`m_user_id_updated`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_coachee_report`
--

LOCK TABLES `act_coachee_report` WRITE;
/*!40000 ALTER TABLE `act_coachee_report` DISABLE KEYS */;
INSERT INTO `act_coachee_report` VALUES (1,9,'2023-06-01 00:00:00',2,3,'Test 1\r\nTest 2',NULL,NULL,NULL,NULL,NULL,1,'2023-06-09 09:00:32',52,'2023-06-10 15:34:09',1),(2,9,'2023-06-02 00:00:00',1,1,NULL,'Check 1\r\nCheck 2','Check 1\r\nCheck 2','Comment 1\r\nComment 2','Concern\r\nObservation',NULL,46,'2023-06-09 18:43:16',52,'2023-06-10 15:31:42',1),(3,9,'2023-06-05 00:00:00',2,3,'Test',NULL,NULL,NULL,NULL,'Test Shesha',46,'2023-06-09 20:46:48',1,'2023-06-10 16:50:24',1),(4,9,'2023-06-06 00:00:00',2,3,'Test 1\r\nTest 2',NULL,NULL,NULL,NULL,'Test 1 Check\r\nTest 2 Check',46,'2023-06-09 20:52:00',1,'2023-06-10 19:53:51',1),(5,8,'2023-06-01 00:00:00',1,3,'GIL Not Conducted\r\nGIL Not Conducted 1','GIL Not Conducted','GIL Not Conducted','Comments 1\r\nComments 2','Concern\r\nObservation',NULL,51,'2023-06-10 14:10:21',46,'2023-06-10 15:21:26',1),(6,9,'2023-06-08 00:00:00',1,2,NULL,'Test 2','Test 1',NULL,NULL,NULL,46,'2023-06-10 16:54:26',NULL,NULL,1),(7,9,'2023-06-10 00:00:00',2,2,'Test 3',NULL,NULL,NULL,NULL,NULL,46,'2023-06-10 16:54:55',NULL,NULL,1),(9,8,'2023-06-03 00:00:00',1,2,NULL,'Test 12','test 21',NULL,NULL,NULL,1,'2023-06-11 21:31:30',NULL,NULL,1);
/*!40000 ALTER TABLE `act_coachee_report` ENABLE KEYS */;
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
