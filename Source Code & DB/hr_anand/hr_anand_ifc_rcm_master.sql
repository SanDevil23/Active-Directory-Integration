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
-- Table structure for table `ifc_rcm_master`
--

DROP TABLE IF EXISTS `ifc_rcm_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ifc_rcm_master` (
  `rcm_id` bigint NOT NULL AUTO_INCREMENT,
  `cntrl_no` varchar(150) DEFAULT NULL,
  `cntrl_freq` int DEFAULT NULL,
  `cntrl_start_date` datetime DEFAULT NULL,
  `key_info` int DEFAULT NULL,
  `sub_process` varchar(150) DEFAULT NULL,
  `process_owner` varchar(150) DEFAULT NULL,
  `cntrl_objective` varchar(150) DEFAULT NULL,
  `risk` varchar(150) DEFAULT NULL,
  `entity_cntrl` varchar(150) DEFAULT NULL,
  `self_certificate_check` varchar(150) DEFAULT NULL,
  `department` int DEFAULT NULL,
  `remarks` varchar(150) DEFAULT NULL,
  `process_cycle` int DEFAULT NULL,
  `risk_rating` int DEFAULT NULL,
  `upload_freq` int DEFAULT NULL,
  `validity_date` datetime DEFAULT NULL,
  `fraud_risk` int DEFAULT NULL,
  `unique_referred` int DEFAULT NULL,
  `preventive_detective` int DEFAULT NULL,
  `cntrl_type` int DEFAULT NULL,
  `rcm_status` int DEFAULT NULL,
  `rcm_created_by` bigint DEFAULT NULL,
  `rcm_created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`rcm_id`),
  KEY `rcmCreatedBy_idx` (`rcm_created_by`),
  CONSTRAINT `rcmCreatedBy` FOREIGN KEY (`rcm_created_by`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_rcm_master`
--

LOCK TABLES `ifc_rcm_master` WRITE;
/*!40000 ALTER TABLE `ifc_rcm_master` DISABLE KEYS */;
INSERT INTO `ifc_rcm_master` VALUES (1,'TTTT',-1,NULL,NULL,'','','','','','',1,'',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Test Control No',1,'2022-01-17 00:00:00',0,'Test Sub Process','Test Process Owner','Control Objective','Test Risk','Test Entity Control Revised','Test Self Certification Check',20,'Test Remarks',8,1,1,'2023-01-17 00:00:00',0,1,0,1,1,NULL,'2023-01-17 14:49:37'),(3,'TTTT',1,'2023-01-17 00:00:00',0,'One Test','One Test','One Test','One Test','One Test','One Test',21,'One Test',7,1,1,'2023-01-17 00:00:00',1,1,0,0,1,NULL,'2023-01-17 16:17:54'),(4,'Two Test',1,'2023-01-12 00:00:00',2,'Two Test','Two Test','Two Test','Two Test','Two Test','Two Test',20,'Two Test',6,2,1,'2023-01-17 00:00:00',0,0,0,0,1,NULL,'2023-01-17 16:20:45'),(5,'Three Test',3,'2023-01-17 00:00:00',1,'Three Test','Three Test','Three Test','Three Test','Three Test','Three Test',19,'Three Test',6,3,1,'2023-01-17 00:00:00',0,0,1,0,1,NULL,'2023-01-17 16:22:52'),(6,'Test',1,'2023-01-20 00:00:00',0,'Test','Test','Test','Test','Test','Test',19,'Test',5,2,1,'2023-01-20 00:00:00',0,1,0,1,1,NULL,'2023-01-20 16:34:36');
/*!40000 ALTER TABLE `ifc_rcm_master` ENABLE KEYS */;
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
