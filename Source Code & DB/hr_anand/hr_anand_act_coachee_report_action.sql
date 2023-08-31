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
-- Table structure for table `act_coachee_report_action`
--

DROP TABLE IF EXISTS `act_coachee_report_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_coachee_report_action` (
  `act_coachee_report_action_id` bigint NOT NULL AUTO_INCREMENT,
  `act_coachee_report_id` bigint DEFAULT NULL,
  `act_coach_caochee_map_id` bigint DEFAULT NULL,
  `act_coachee_goal_id` bigint DEFAULT NULL,
  `goal_action` tinytext,
  `coachee_comment` tinytext,
  `coach_comment` tinytext,
  `report_action_status` int DEFAULT NULL COMMENT '1 - Yet to start, 2 - In-Progress, 3 - Completed',
  `target_date` datetime DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `m_user_id_updated` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `report_action_active` int DEFAULT NULL,
  PRIMARY KEY (`act_coachee_report_action_id`),
  KEY `relatedReport_idx` (`act_coachee_report_id`),
  KEY `relatedCoachCoacheeMap_idx` (`act_coach_caochee_map_id`),
  KEY `relatedGoal_idx` (`act_coachee_goal_id`),
  KEY `reportActionCreatedBy_idx` (`m_user_id`),
  KEY `reportActionUpdatedBy_idx` (`m_user_id_updated`),
  CONSTRAINT `relatedCoachCoacheeMap` FOREIGN KEY (`act_coach_caochee_map_id`) REFERENCES `act_coach_coachee_map` (`act_coach_coachee_map_id`),
  CONSTRAINT `relatedGoal` FOREIGN KEY (`act_coachee_goal_id`) REFERENCES `act_coachee_goals` (`act_coachee_goals_id`),
  CONSTRAINT `relatedReport` FOREIGN KEY (`act_coachee_report_id`) REFERENCES `act_coachee_report` (`act_coachee_report_id`),
  CONSTRAINT `reportActionCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `reportActionUpdatedBy` FOREIGN KEY (`m_user_id_updated`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_coachee_report_action`
--

LOCK TABLES `act_coachee_report_action` WRITE;
/*!40000 ALTER TABLE `act_coachee_report_action` DISABLE KEYS */;
INSERT INTO `act_coachee_report_action` VALUES (1,9,8,5,'Test 8 Test 2 Action 1\r\nTest 8 Test 2 Action 2\r\nTest 8 Test 2 Action 3',NULL,NULL,1,NULL,1,'2023-06-11 21:31:30',NULL,NULL,1);
/*!40000 ALTER TABLE `act_coachee_report_action` ENABLE KEYS */;
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
