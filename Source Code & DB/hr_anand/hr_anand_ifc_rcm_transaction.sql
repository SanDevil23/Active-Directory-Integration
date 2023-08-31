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
-- Table structure for table `ifc_rcm_transaction`
--

DROP TABLE IF EXISTS `ifc_rcm_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ifc_rcm_transaction` (
  `rcm_transaction_id` bigint NOT NULL AUTO_INCREMENT,
  `rcm_id` bigint DEFAULT NULL,
  `rcm_plant_id` bigint DEFAULT NULL,
  `soh_by` bigint DEFAULT NULL,
  `line_manager` bigint DEFAULT NULL,
  `praac` bigint DEFAULT NULL,
  `validity` datetime DEFAULT NULL,
  `transaction_active` int DEFAULT NULL,
  `compliance_flag` int DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `proof_attachment_name` varchar(350) DEFAULT NULL,
  `proof_attachment_type` varchar(550) DEFAULT NULL,
  `proof_attachment` blob,
  `approval_status` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`rcm_transaction_id`),
  KEY `rcm_id_idx` (`rcm_id`),
  KEY `sohPerson_idx` (`soh_by`),
  KEY `lineManager_idx` (`line_manager`),
  KEY `praac_idx` (`praac`),
  KEY `plant_id_idx` (`rcm_plant_id`),
  CONSTRAINT `line_Manager` FOREIGN KEY (`line_manager`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `prac` FOREIGN KEY (`praac`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `rcm_plant_id` FOREIGN KEY (`rcm_plant_id`) REFERENCES `ifc_rcm_plant` (`rcm_plant_id`),
  CONSTRAINT `rcmId` FOREIGN KEY (`rcm_id`) REFERENCES `ifc_rcm_master` (`rcm_id`),
  CONSTRAINT `soh_By` FOREIGN KEY (`soh_by`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_rcm_transaction`
--

LOCK TABLES `ifc_rcm_transaction` WRITE;
/*!40000 ALTER TABLE `ifc_rcm_transaction` DISABLE KEYS */;
INSERT INTO `ifc_rcm_transaction` VALUES (5,2,7,41,43,NULL,'2023-02-28 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-28 00:00:00',NULL),(6,2,8,41,42,NULL,'2023-02-28 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-28 00:00:00',NULL),(7,4,9,41,42,NULL,'2023-02-28 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-28 00:00:00',NULL),(8,5,10,41,43,NULL,'2023-02-28 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-28 00:00:00',NULL),(9,6,14,41,42,43,'2023-02-28 00:00:00',1,1,'Sheshadhri Comments','Table & ReSet Auto Increment.txt','text/plain',_binary 'SET FOREIGN_KEY_CHECKS=0;\r\n\r\ntruncate table ia_tool.audit_plan_original;\r\nALTER TABLE ia_tool.audit_plan_original AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_plan_entity_original;\r\nALTER TABLE ia_tool.audit_plan_entity_original AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_plan_entity_original_approval_history;\r\nALTER TABLE ia_tool.audit_plan_entity_original_approval_history AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_yearly_resource;\r\nALTER TABLE ia_tool.audit_yearly_resource AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_yearly_resource_rolling;\r\nALTER TABLE ia_tool.audit_yearly_resource_rolling AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_plan_entity_cycle_original;\r\nALTER TABLE ia_tool.audit_plan_entity_cycle_original AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_plan_entity_cycle_original_approval;\r\nALTER TABLE ia_tool.audit_plan_entity_cycle_original_approval AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_plan_entity_cycle_rolling;\r\nALTER TABLE ia_tool.audit_plan_entity_cycle_rolling AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_plan_entity_cycle_rolling_approval;\r\nALTER TABLE ia_tool.audit_plan_entity_cycle_rolling_approval AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_plan_entity_cycle_execution;\r\nALTER TABLE ia_tool.audit_plan_entity_cycle_execution AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_plan_entity_cycle_execution_approval;\r\nALTER TABLE ia_tool.audit_plan_entity_cycle_execution_approval AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_execution_rcm_map;\r\nALTER TABLE ia_tool.audit_execution_rcm_map AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_execution_rcm_transaction;\r\nALTER TABLE ia_tool.audit_execution_rcm_transaction AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_execution_rcm_transaction_approval;\r\nALTER TABLE ia_tool.audit_execution_rcm_transaction_approval AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_execution_rcm_transaction_da_analytics;\r\nALTER TABLE ia_tool.audit_execution_rcm_transaction_da_analytics AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_execution_rcm_transaction_observation;\r\nALTER TABLE ia_tool.audit_execution_rcm_transaction_observation AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_execution_rcm_transaction_observation_automation;\r\nALTER TABLE ia_tool.audit_execution_rcm_transaction_observation_automation AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_execution_rcm_transaction_observation_best_practice;\r\nALTER TABLE ia_tool.audit_execution_rcm_transaction_observation_best_practice AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_execution_rcm_transaction_observation_cost_saving;\r\nALTER TABLE ia_tool.audit_execution_rcm_transaction_observation_cost_saving AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_execution_rcm_transaction_observation_ifc_details;\r\nALTER TABLE ia_tool.audit_execution_rcm_transaction_observation_ifc_details AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_execution_rcm_transaction_recommendation;\r\nALTER TABLE ia_tool.audit_execution_rcm_transaction_recommendation AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_execution_rcm_transaction_recommendation_changes;\r\nALTER TABLE ia_tool.audit_execution_rcm_transaction_recommendation_changes AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_execution_rcm_transaction_work_performed;\r\nALTER TABLE ia_tool.audit_execution_rcm_transaction_work_performed AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.audit_execution_dates_documents;\r\nALTER TABLE ia_tool.audit_execution_dates_documents AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.automation_realization;\r\nALTER TABLE ia_tool.automation_realization AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.best_practice_realization;\r\nALTER TABLE ia_tool.best_practice_realization AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.cost_saving_realization;\r\nALTER TABLE ia_tool.cost_saving_realization AUTO_INCREMENT = 1;\r\n\r\ntruncate table ia_tool.user_dashboard_graph;\r\nALTER TABLE ia_tool.user_dashboard_graph AUTO_INCREMENT = 1;\r\n\r\nSET FOREIGN_KEY_CHECKS=1;',2,'2023-02-28 00:00:00',NULL),(10,2,7,41,43,NULL,'2023-02-28 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-28 00:00:00',NULL),(11,2,8,41,42,NULL,'2023-02-28 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-28 00:00:00',NULL),(12,4,9,41,42,NULL,'2023-02-28 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-28 00:00:00',NULL),(13,5,10,41,43,NULL,'2023-02-28 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-02-28 00:00:00',NULL),(14,6,14,41,42,43,'2023-02-28 00:00:00',1,1,'sdfasdf','SVN URL.txt','text/plain',_binary '**************************************** EIM Six Sigma *****************************************\r\n----------------------------------------- Six Sigma Dev ----------------------------------------\r\nhttps://172.16.6.33:90/svn/repositoryatAnand/Branches/Code/dmaic/dev_release\r\n\r\n----------------------------------------- Six SigmaPROD ----------------------------------------\r\nhttps://172.16.6.33:90/svn/repositoryatAnand/Branches/Code/dmaic/prod_release\r\n\r\n\r\n**************************************** EMC Tracker *****************************************\r\n---------------------------------------- DEV SVN LINK ----------------------------------------\r\nhttps://172.16.6.33:90/svn/repositoryatAnand/Branches/Code/sec_coaching_tracker/dev_release\r\n\r\n---------------------------------------- PROD SVN LINK ----------------------------------------\r\nhttps://172.16.6.33:90/svn/repositoryatAnand/Branches/Code/sec_coaching_tracker/prod_release\r\n\r\n\r\n**************************************** ALDP Tracker *****************************************\r\n---------------------------------------- DEV SVN LINK ----------------------------------------\r\nhttps://172.16.6.33:90/svn/repositoryatAnand/Branches/Code/coaching_tracker/dev_release\r\n\r\n---------------------------------------- PROD SVN LINK ----------------------------------------\r\nhttps://172.16.6.33:90/svn/repositoryatAnand/Branches/Code/coaching_tracker/prod_release\r\n\r\n\r\n**************************************** IJP Tracker *****************************************\r\n---------------------------------------- DEV SVN LINK ----------------------------------------\r\nhttps://172.16.6.33:90/svn/repositoryatAnand/Branches/Code/ijp/dev_release\r\n\r\n---------------------------------------- PROD SVN LINK ----------------------------------------\r\nhttps://172.16.6.33:90/svn/repositoryatAnand/Branches/Code/ijp/prod_release\r\n\r\n\r\n****************************************** IA Tool *******************************************\r\n---------------------------------------- DEV SVN LINK ----------------------------------------\r\nhttps://172.16.6.33:90/svn/repositoryatAnand/Branches/Code/Internal-Audit/Dev-Release\r\n\r\n---------------------------------------- PROD SVN LINK ----------------------------------------\r\nhttps://172.16.6.33:90/svn/repositoryatAnand/Branches/Code/Internal-Audit/Prod-Release',0,'2023-02-28 00:00:00',NULL),(15,2,7,41,43,NULL,'2023-04-30 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-04-20 00:00:00',NULL),(16,2,8,41,42,NULL,'2023-04-30 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-04-20 00:00:00',NULL),(17,4,9,41,42,NULL,'2023-04-30 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-04-20 00:00:00',NULL),(18,5,10,41,43,NULL,'2023-04-30 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-04-20 00:00:00',NULL),(19,6,14,41,42,43,'2023-04-30 00:00:00',1,NULL,NULL,NULL,NULL,NULL,NULL,'2023-04-20 00:00:00',NULL);
/*!40000 ALTER TABLE `ifc_rcm_transaction` ENABLE KEYS */;
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
