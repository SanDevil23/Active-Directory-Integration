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
-- Table structure for table `act_coachee_report_history`
--

DROP TABLE IF EXISTS `act_coachee_report_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_coachee_report_history` (
  `act_coachee_report_history_id` bigint NOT NULL AUTO_INCREMENT,
  `act_coachee_report_id` bigint DEFAULT NULL,
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
  `report_active` int DEFAULT NULL COMMENT '0-In-Active, 1-Active',
  PRIMARY KEY (`act_coachee_report_history_id`),
  KEY `coachCoacheeMapRefHistory` (`act_coach_coachee_map_id`),
  KEY `parentCoacheeReport` (`act_coachee_report_id`),
  KEY `reportCreatedByHistory` (`m_user_id`),
  CONSTRAINT `coachCoacheeMapRefHistory` FOREIGN KEY (`act_coach_coachee_map_id`) REFERENCES `act_coach_coachee_map` (`act_coach_coachee_map_id`),
  CONSTRAINT `parentCoacheeReport` FOREIGN KEY (`act_coachee_report_id`) REFERENCES `act_coachee_report` (`act_coachee_report_id`),
  CONSTRAINT `reportCreatedByHistory` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_coachee_report_history`
--

LOCK TABLES `act_coachee_report_history` WRITE;
/*!40000 ALTER TABLE `act_coachee_report_history` DISABLE KEYS */;
INSERT INTO `act_coachee_report_history` VALUES (1,4,9,'2023-06-06 00:00:00',2,1,'Test 1\r\nTest 2',NULL,NULL,NULL,NULL,NULL,1,'2023-06-10 19:53:51',1);
/*!40000 ALTER TABLE `act_coachee_report_history` ENABLE KEYS */;
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
