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
-- Table structure for table `ifc_rcm_plant`
--

DROP TABLE IF EXISTS `ifc_rcm_plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ifc_rcm_plant` (
  `rcm_plant_id` bigint NOT NULL AUTO_INCREMENT,
  `rcm_id` bigint NOT NULL,
  `plant_id` bigint DEFAULT NULL,
  `soh_by` bigint DEFAULT NULL,
  `line_manager` bigint DEFAULT NULL,
  `praac` bigint DEFAULT NULL,
  `plant_created_by` bigint DEFAULT NULL,
  `plant_created_on` datetime DEFAULT NULL,
  `plant_active` int DEFAULT NULL,
  PRIMARY KEY (`rcm_plant_id`),
  KEY `rcm_id_idx` (`rcm_id`),
  KEY `sohPerson_idx` (`soh_by`),
  KEY `plant_idx` (`plant_id`),
  KEY `lineManager_idx` (`line_manager`),
  KEY `plantCreatedBy_idx` (`plant_created_by`),
  KEY `praac_idx` (`praac`),
  CONSTRAINT `lineManager` FOREIGN KEY (`line_manager`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `plant` FOREIGN KEY (`plant_id`) REFERENCES `m_entity` (`m_entity_id`),
  CONSTRAINT `plantCreatedBy` FOREIGN KEY (`plant_created_by`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `praac` FOREIGN KEY (`praac`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `rcm_id` FOREIGN KEY (`rcm_id`) REFERENCES `ifc_rcm_master` (`rcm_id`),
  CONSTRAINT `sohPerson` FOREIGN KEY (`soh_by`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_rcm_plant`
--

LOCK TABLES `ifc_rcm_plant` WRITE;
/*!40000 ALTER TABLE `ifc_rcm_plant` DISABLE KEYS */;
INSERT INTO `ifc_rcm_plant` VALUES (7,2,2,41,43,NULL,1,'2023-01-17 14:49:37',1),(8,2,82,41,42,NULL,1,'2023-01-17 16:17:54',1),(9,4,82,41,42,NULL,1,'2023-01-17 16:20:45',1),(10,5,82,41,43,NULL,1,'2023-01-17 16:22:52',1),(13,2,81,41,43,NULL,1,'2023-01-18 08:47:02',0),(14,6,82,41,42,43,1,'2023-01-20 16:34:36',1);
/*!40000 ALTER TABLE `ifc_rcm_plant` ENABLE KEYS */;
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
