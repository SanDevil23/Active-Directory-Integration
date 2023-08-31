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
-- Table structure for table `eim_t_project_charter_control`
--

DROP TABLE IF EXISTS `eim_t_project_charter_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eim_t_project_charter_control` (
  `t_project_charter_control_id` bigint NOT NULL AUTO_INCREMENT,
  `t_project_charter_id` bigint DEFAULT NULL,
  `control_action` varchar(450) DEFAULT NULL,
  `control_established_in_system` varchar(450) DEFAULT NULL,
  `control_established_date` datetime DEFAULT NULL,
  `sustenance_presence_of_control` int DEFAULT NULL COMMENT '1-Yes\n2-No',
  `sustenance_audit_comments` varchar(450) DEFAULT NULL,
  `control_created_by` bigint DEFAULT NULL,
  `control_created_on` datetime DEFAULT NULL,
  `active` int DEFAULT NULL,
  PRIMARY KEY (`t_project_charter_control_id`),
  KEY `parentChater_idx` (`t_project_charter_id`),
  KEY `actionCreatedBy_idx` (`control_created_by`),
  CONSTRAINT `actionCreatedBy` FOREIGN KEY (`control_created_by`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `parentChater` FOREIGN KEY (`t_project_charter_id`) REFERENCES `eim_t_project_charter` (`t_project_charter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eim_t_project_charter_control`
--

LOCK TABLES `eim_t_project_charter_control` WRITE;
/*!40000 ALTER TABLE `eim_t_project_charter_control` DISABLE KEYS */;
INSERT INTO `eim_t_project_charter_control` VALUES (1,2,'test','test','2023-01-17 00:02:00',1,'Test',1,'2023-02-10 10:17:07',1),(2,2,'test 2','test 2','2023-01-18 00:02:00',1,'Test',1,'2023-02-10 10:43:12',1),(3,2,'test 3','test 3','2023-01-17 00:02:00',2,'Test',1,'2023-02-10 11:12:56',1),(4,3,'test','test','2023-01-14 00:02:00',1,'Test 1',1,'2023-02-13 14:33:18',1),(5,3,'Test 2','Test','2023-01-14 00:02:00',1,'Test 2',1,'2023-02-13 14:33:18',1),(13,4,'test','test 2','2023-01-16 00:02:00',NULL,NULL,40,'2023-02-15 14:31:24',1),(14,5,'test','test','2023-01-05 00:01:00',NULL,NULL,40,'2023-02-16 16:14:15',1),(15,5,'test','test','2023-01-26 00:02:00',NULL,NULL,40,'2023-02-16 16:16:03',1),(16,6,'test','test','2023-01-18 00:02:00',1,'Test 1',40,'2023-02-17 15:21:01',1),(17,6,'test 2','test 2','2023-01-19 00:02:00',1,'Test 2',40,'2023-02-17 15:21:39',1),(18,6,'Test 3','Test 3','2023-01-19 00:02:00',2,'Test 3',40,'2023-02-17 15:21:39',1);
/*!40000 ALTER TABLE `eim_t_project_charter_control` ENABLE KEYS */;
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
