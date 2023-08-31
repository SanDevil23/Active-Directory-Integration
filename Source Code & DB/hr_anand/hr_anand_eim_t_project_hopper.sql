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
-- Table structure for table `eim_t_project_hopper`
--

DROP TABLE IF EXISTS `eim_t_project_hopper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eim_t_project_hopper` (
  `t_project_hopper_id` bigint NOT NULL AUTO_INCREMENT,
  `project_function_id` bigint DEFAULT NULL,
  `project_methodology_id` bigint DEFAULT NULL,
  `project_type_id` bigint DEFAULT NULL,
  `m_entity_id` bigint DEFAULT NULL,
  `confidentiality` int DEFAULT NULL COMMENT '1-Non Confidential\n2-Confidential',
  `project_name` varchar(95) DEFAULT NULL,
  `project_description` varchar(150) DEFAULT NULL,
  `sponsor` bigint DEFAULT NULL,
  `problem_solving_leader` bigint DEFAULT NULL,
  `corporate_problem_solving_leader` bigint DEFAULT NULL,
  `project_leader` bigint DEFAULT NULL,
  `hopper_primary_driver` int DEFAULT NULL COMMENT '1-Productivity\\n2-Quality\\n3-Cost\\n4-Delivery\\n5-Safety\\n',
  `estimated_saving` decimal(10,2) DEFAULT NULL,
  `hopper_created_by` bigint DEFAULT NULL,
  `hopper_created_on` datetime DEFAULT NULL,
  `hopper_active` int DEFAULT NULL,
  `hopper_last_updated_by` bigint DEFAULT NULL,
  `hopper_last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`t_project_hopper_id`),
  KEY `hopperLastUpdatedBy` (`hopper_last_updated_by`),
  KEY `hopperProjectLeader` (`project_leader`),
  KEY `hopperSponsor` (`sponsor`),
  KEY `hopperType` (`project_type_id`),
  KEY `hoppperProblemSolvingLeader` (`problem_solving_leader`),
  KEY `hopperCorporateProblemSolvingLeader` (`corporate_problem_solving_leader`),
  KEY `hopperCompany` (`m_entity_id`),
  KEY `hopperMethodology` (`project_methodology_id`),
  KEY `hopperFunction` (`project_function_id`),
  CONSTRAINT `hopperCompany` FOREIGN KEY (`m_entity_id`) REFERENCES `m_entity` (`m_entity_id`),
  CONSTRAINT `hopperCorporateProblemSolvingLeader` FOREIGN KEY (`corporate_problem_solving_leader`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `hopperFunction` FOREIGN KEY (`project_function_id`) REFERENCES `eim_m_project_function` (`project_function_id`),
  CONSTRAINT `hopperLastUpdatedBy` FOREIGN KEY (`hopper_last_updated_by`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `hopperMethodology` FOREIGN KEY (`project_methodology_id`) REFERENCES `eim_m_project_methodology` (`project_methodology_id`),
  CONSTRAINT `hopperProjectLeader` FOREIGN KEY (`project_leader`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `hopperSponsor` FOREIGN KEY (`sponsor`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `hopperType` FOREIGN KEY (`project_type_id`) REFERENCES `eim_m_project_type` (`project_type_id`),
  CONSTRAINT `hoppperProblemSolvingLeader` FOREIGN KEY (`problem_solving_leader`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eim_t_project_hopper`
--

LOCK TABLES `eim_t_project_hopper` WRITE;
/*!40000 ALTER TABLE `eim_t_project_hopper` DISABLE KEYS */;
INSERT INTO `eim_t_project_hopper` VALUES (1,11,1,1,2,1,'d49d7b8cf626f24ac05727f56c1308f8','779b20196719ca438e8e8e80341e58dc602b8492b8c7d8355152d70df9024478',1,1,1,1,1,200.00,1,'2022-08-19 12:52:01',1,1,'2022-08-19 13:25:04');
/*!40000 ALTER TABLE `eim_t_project_hopper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:37
