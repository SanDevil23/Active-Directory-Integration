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
-- Table structure for table `act_coachee_goals_history`
--

DROP TABLE IF EXISTS `act_coachee_goals_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_coachee_goals_history` (
  `act_coachee_goals_history_id` bigint NOT NULL AUTO_INCREMENT,
  `act_coachee_goals_id` bigint DEFAULT NULL,
  `coaching_goal` varchar(150) DEFAULT NULL,
  `coaching_goal_description` varchar(150) DEFAULT NULL,
  `coaching_goal_active` int DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`act_coachee_goals_history_id`),
  KEY `parentCoachingGoal` (`act_coachee_goals_id`),
  KEY `coachingGoalHistoryCreatedBy` (`m_user_id`),
  CONSTRAINT `coachingGoalHistoryCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `parentCoachingGoal` FOREIGN KEY (`act_coachee_goals_id`) REFERENCES `act_coachee_goals` (`act_coachee_goals_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_coachee_goals_history`
--

LOCK TABLES `act_coachee_goals_history` WRITE;
/*!40000 ALTER TABLE `act_coachee_goals_history` DISABLE KEYS */;
INSERT INTO `act_coachee_goals_history` VALUES (1,3,'Test 8 Test','Test\r\ntest 2\r\nTest 3',0,1,'2023-05-21 10:26:40'),(2,3,'Test 8 Test','Test Edit\r\ntest 2 Edit\r\nTest 3 Edit',0,1,'2023-05-21 11:54:12'),(3,3,'Test 8 Test','Edit\r\nEdit 1\r\nEdit 2',0,1,'2023-05-21 11:54:30'),(4,1,'Test 8','Test<br>\ntest 2<br>\nTest 3',1,1,'2023-05-21 10:26:40'),(5,1,'Test 8','Test\r\ntest 2\r\nTest 3',1,1,'2023-05-21 11:57:41'),(6,9,'Edit Goal','Goal Edit 1\r\nGoal Edit 2\r\nGoal Edit 3',0,1,'2023-05-21 11:54:55'),(7,9,'Edit Goal 1','Goal Edit 1\r\nGoal Edit 2\r\nGoal Edit 3\r\nGoal Edit 4',0,1,'2023-05-21 12:00:36'),(8,9,'Edit Goal 1 D','Goal Edit 1 E\r\nGoal Edit 2 E\r\nGoal Edit 3 E\r\nGoal Edit 4 E',0,1,'2023-05-21 20:48:05'),(9,9,'Edit Goal 1 D','Goal Edit 1\r-Goal Edit 2 E\r-Goal Edit 3 E\r-Goal Edit 4 E',0,1,'2023-05-21 20:48:34');
/*!40000 ALTER TABLE `act_coachee_goals_history` ENABLE KEYS */;
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
