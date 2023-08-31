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
-- Table structure for table `act_coach_coachee_map_history`
--

DROP TABLE IF EXISTS `act_coach_coachee_map_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_coach_coachee_map_history` (
  `act_coach_coachee_map_history_id` bigint NOT NULL AUTO_INCREMENT,
  `act_coaching_batch_history_id` bigint DEFAULT NULL,
  `coach_user_id` bigint DEFAULT NULL,
  `coachee_user_id` bigint DEFAULT NULL,
  `act_coachee_program` int DEFAULT NULL COMMENT '1-ANAND Mentee, 2-ANAND Talent, 3-ANAND Leader',
  `supervisor_user_id` bigint DEFAULT NULL,
  `act_coach_coachee_map_history_active` int DEFAULT NULL,
  `act_coach_coachee_map_history_created_by` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`act_coach_coachee_map_history_id`),
  KEY `parentCoachingBatch_idx` (`act_coaching_batch_history_id`),
  KEY `coachUserId_idx` (`coach_user_id`),
  KEY `coacheeUserId_idx` (`coachee_user_id`),
  KEY `coachCoacheeMapCreatedBy_idx` (`act_coach_coachee_map_history_created_by`),
  KEY `supervisorUserId_idx` (`supervisor_user_id`),
  CONSTRAINT `coachCoacheeMapCreatedByHistory` FOREIGN KEY (`act_coach_coachee_map_history_created_by`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `coacheeUserIdHistory` FOREIGN KEY (`coachee_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `coachUserIdHistory` FOREIGN KEY (`coach_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `parentCoachingBatchHistory` FOREIGN KEY (`act_coaching_batch_history_id`) REFERENCES `act_coaching_batch_history` (`act_coaching_batch_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_coach_coachee_map_history`
--

LOCK TABLES `act_coach_coachee_map_history` WRITE;
/*!40000 ALTER TABLE `act_coach_coachee_map_history` DISABLE KEYS */;
INSERT INTO `act_coach_coachee_map_history` VALUES (1,5,46,47,2,48,1,1,'2023-04-20 08:44:23'),(11,15,46,47,2,48,1,1,'2023-05-01 09:47:58'),(12,16,46,47,2,48,1,1,'2023-05-01 12:27:42'),(13,16,46,51,1,48,1,1,'2023-05-01 12:27:42');
/*!40000 ALTER TABLE `act_coach_coachee_map_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:33
