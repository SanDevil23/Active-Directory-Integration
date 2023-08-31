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
-- Table structure for table `act_coachee_goals`
--

DROP TABLE IF EXISTS `act_coachee_goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_coachee_goals` (
  `act_coachee_goals_id` bigint NOT NULL AUTO_INCREMENT,
  `act_coach_coachee_map_id` bigint DEFAULT NULL,
  `coaching_goal` varchar(150) DEFAULT NULL,
  `coaching_goal_description` tinytext,
  `coaching_goal_active` int DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `m_user_id_updated` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`act_coachee_goals_id`),
  KEY `coachingGoalCreatedBy` (`m_user_id`),
  KEY `coachCoacheeMapId_idx` (`act_coach_coachee_map_id`),
  KEY `coachingGoalUpdatedBy_idx` (`m_user_id_updated`),
  CONSTRAINT `coachCoacheeMapId` FOREIGN KEY (`act_coach_coachee_map_id`) REFERENCES `act_coach_coachee_map` (`act_coach_coachee_map_id`),
  CONSTRAINT `coachingGoalCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `coachingGoalUpdatedBy` FOREIGN KEY (`m_user_id_updated`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_coachee_goals`
--

LOCK TABLES `act_coachee_goals` WRITE;
/*!40000 ALTER TABLE `act_coachee_goals` DISABLE KEYS */;
INSERT INTO `act_coachee_goals` VALUES (1,8,'Test 8 Edit 1','Test\r\ntest 2\r\nTest 3',1,1,'2023-05-21 10:26:40',1,'2023-05-21 11:58:23'),(3,8,'Test 8 Test','Edit\r\nEdit 1\r\nEdit 2\r\nEdit 3',1,1,'2023-05-21 10:26:40',1,'2023-05-21 11:57:03'),(4,8,'Test 8 Test 1','Test\r\ntest 2\r\nTest 3',1,1,'2023-05-21 10:29:18',NULL,NULL),(5,8,'Test 8 Test 2','Test\r\ntest 2\r\nTest 3',1,1,'2023-05-21 10:33:07',NULL,NULL),(6,7,'Test 8','Test\r\nTest 1\r\nTest 2',1,1,'2023-05-21 10:40:55',NULL,NULL),(7,7,'Test 8 Test','Test',0,1,'2023-05-21 10:43:26',NULL,NULL),(8,7,'Test 8 Test 1','Test',1,1,'2023-05-21 10:51:04',NULL,NULL),(9,8,'Edit Goal 1 D','Goal Edit 1 E GOAL GOAL\r\nGoal Edit 2 E GOAL\r\nGoal Edit 3 E Goal Goal\r\nGoal Edit 4 E Goal\r\nGoal Edit 4 E Goal Goal',0,1,'2023-05-21 11:54:55',1,'2023-05-21 20:49:36'),(10,8,'New Goal Add','New Goal Add1\r\nNew Goal Add2\r\nNew Goal Add3',0,1,'2023-05-21 11:55:19',NULL,NULL),(12,9,'Goal Coach AAPL','1. Goal Coach AAPL\r\n2. Goal Coach AAPL 1\r\n3. Goal Coach AAPL 2',1,1,'2023-06-10 19:37:47',NULL,NULL),(13,7,'','',NULL,1,'2023-07-31 13:33:59',NULL,NULL);
/*!40000 ALTER TABLE `act_coachee_goals` ENABLE KEYS */;
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
