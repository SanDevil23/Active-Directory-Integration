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
-- Table structure for table `eim_t_project_hopper_history`
--

DROP TABLE IF EXISTS `eim_t_project_hopper_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eim_t_project_hopper_history` (
  `t_project_hopper_history_id` bigint NOT NULL AUTO_INCREMENT,
  `t_project_hopper_id` bigint DEFAULT NULL,
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
  `hopper_primary_driver` int DEFAULT NULL COMMENT '1-Productivity\\\\n2-Quality\\\\n3-Cost\\\\n4-Delivery\\\\n5-Safety\\\\n',
  `estimated_saving` decimal(10,2) DEFAULT NULL,
  `hopper_created_by` bigint DEFAULT NULL,
  `hopper_created_on` datetime DEFAULT NULL,
  `hopper_active` bigint DEFAULT NULL,
  PRIMARY KEY (`t_project_hopper_history_id`),
  KEY `hopperCompanyHistory` (`m_entity_id`),
  KEY `hopperCorporateProblemSolvingLeaderHistory` (`corporate_problem_solving_leader`),
  KEY `hopperCreatedByHistory` (`hopper_created_by`),
  KEY `hopperFunctionHistory` (`project_function_id`),
  KEY `hopperMethodologyHistory` (`project_methodology_id`),
  KEY `hopperProjectLeaderHistory` (`project_leader`),
  KEY `hopperSponsorHistory` (`sponsor`),
  KEY `hopperTypeHistory` (`project_type_id`),
  KEY `hoppperProblemSolvingLeaderHistory` (`problem_solving_leader`),
  KEY `parentHopperProject` (`t_project_hopper_id`),
  CONSTRAINT `hopperCompanyHistory` FOREIGN KEY (`m_entity_id`) REFERENCES `m_entity` (`m_entity_id`),
  CONSTRAINT `hopperCorporateProblemSolvingLeaderHistory` FOREIGN KEY (`corporate_problem_solving_leader`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `hopperCreatedByHistory` FOREIGN KEY (`hopper_created_by`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `hopperFunctionHistory` FOREIGN KEY (`project_function_id`) REFERENCES `eim_m_project_function` (`project_function_id`),
  CONSTRAINT `hopperMethodologyHistory` FOREIGN KEY (`project_methodology_id`) REFERENCES `eim_m_project_methodology` (`project_methodology_id`),
  CONSTRAINT `hopperProjectLeaderHistory` FOREIGN KEY (`project_leader`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `hopperSponsorHistory` FOREIGN KEY (`sponsor`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `hopperTypeHistory` FOREIGN KEY (`project_type_id`) REFERENCES `eim_m_project_type` (`project_type_id`),
  CONSTRAINT `hoppperProblemSolvingLeaderHistory` FOREIGN KEY (`problem_solving_leader`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `parentHopperProject` FOREIGN KEY (`t_project_hopper_id`) REFERENCES `t_project_hopper` (`t_project_hopper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eim_t_project_hopper_history`
--

LOCK TABLES `eim_t_project_hopper_history` WRITE;
/*!40000 ALTER TABLE `eim_t_project_hopper_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `eim_t_project_hopper_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:34
