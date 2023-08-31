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
-- Table structure for table `ifc_m_process`
--

DROP TABLE IF EXISTS `ifc_m_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ifc_m_process` (
  `m_process_id` bigint NOT NULL AUTO_INCREMENT,
  `process_name` varchar(55) DEFAULT NULL,
  `process_active` int DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`m_process_id`),
  KEY `processCreatedBy_idx` (`created_by`),
  KEY `processUpdatedBy_idx` (`updated_by`),
  CONSTRAINT `processCreatedBy` FOREIGN KEY (`created_by`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `processUpdatedBy` FOREIGN KEY (`updated_by`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_m_process`
--

LOCK TABLES `ifc_m_process` WRITE;
/*!40000 ALTER TABLE `ifc_m_process` DISABLE KEYS */;
INSERT INTO `ifc_m_process` VALUES (1,'Inventory Management',1,1,'2022-10-27 18:38:13',NULL,NULL),(2,'Procure to Pay',1,1,'2022-10-27 18:47:41',NULL,NULL),(3,'Record to Report',1,1,'2022-10-27 18:52:47',NULL,NULL),(4,'Order to Cash',1,1,'2022-10-27 18:54:07',NULL,NULL),(5,'Capex Management',1,1,'2022-10-27 18:54:21',NULL,NULL),(6,'Human Resources and Admin',1,1,'2022-10-27 18:54:35',NULL,NULL),(7,'General IT Controls',1,1,'2022-10-27 18:54:46',NULL,NULL),(8,'Statutory Compliances',1,1,'2022-10-27 18:55:20',NULL,NULL);
/*!40000 ALTER TABLE `ifc_m_process` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:41
