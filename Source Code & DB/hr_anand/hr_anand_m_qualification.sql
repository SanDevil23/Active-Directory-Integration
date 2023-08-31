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
-- Table structure for table `m_qualification`
--

DROP TABLE IF EXISTS `m_qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_qualification` (
  `qualification_id` bigint NOT NULL AUTO_INCREMENT,
  `qualification_name` varchar(150) DEFAULT NULL,
  `qualification_is_master` int DEFAULT NULL,
  `qualification_created_by` bigint DEFAULT NULL,
  `qualification_created_on` datetime DEFAULT NULL,
  `qualification_updated_by` bigint DEFAULT NULL,
  `qualification_last_updated_on` datetime DEFAULT NULL,
  `active` int DEFAULT NULL,
  PRIMARY KEY (`qualification_id`),
  KEY `qualificationCreatedBy` (`qualification_created_by`),
  KEY `qualificationUpdatedBy_idx` (`qualification_updated_by`),
  CONSTRAINT `qualificationCreatedBy` FOREIGN KEY (`qualification_created_by`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `qualificationUpdatedBy` FOREIGN KEY (`qualification_updated_by`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_qualification`
--

LOCK TABLES `m_qualification` WRITE;
/*!40000 ALTER TABLE `m_qualification` DISABLE KEYS */;
INSERT INTO `m_qualification` VALUES (1,'B.Tech/B.E Meachanical Engineering',0,1,'2022-07-30 19:03:43',NULL,'2022-08-01 19:17:54',1),(2,'B.Tech/B.E Automobile Engineering',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(3,'B.Tech/B.E Production/Industrial Engineering',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(4,'B.Tech/B.E MAE',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(5,'B.Tech/B.E IT',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(6,'B.Tech/B.E Mechatronics',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(7,'B.Tech/B.E Electronics Engineering',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(8,'B.Tech/B.E Electrical Engineering',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(9,'B.Tech/B.E Civil Engineering',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(10,'B.Tech',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(11,'M.Tech',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(12,'BBA/BMS',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(13,'MBA/PGDM',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(14,'PGDHRM',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(15,'PGDBM',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(16,'BSc',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(17,'MSc',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(18,'B.Comm',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(19,'M.Comm',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(20,'B.Arch',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(21,'M.Arch',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(22,'BCA',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(23,'MCA',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(24,'LLB',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(25,'LLM',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(26,'CA',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(27,'ICWA',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(28,'BA',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(29,'MA',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(30,'MMS',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1),(31,'MPM',NULL,1,'2023-07-14 19:28:46',NULL,NULL,1);
/*!40000 ALTER TABLE `m_qualification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:38
