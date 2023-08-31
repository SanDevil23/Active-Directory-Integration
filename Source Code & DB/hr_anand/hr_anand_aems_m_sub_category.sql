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
-- Table structure for table `aems_m_sub_category`
--

DROP TABLE IF EXISTS `aems_m_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aems_m_sub_category` (
  `m_aems_sub_category_id` bigint NOT NULL AUTO_INCREMENT,
  `aems_sub_category_name` varchar(150) DEFAULT NULL,
  `m_aems_category_id` bigint DEFAULT NULL,
  `aems_sub_category_active` int DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `m_user_id_updated` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`m_aems_sub_category_id`),
  KEY `aemsSubCategoryCreatedBy` (`m_user_id`),
  KEY `aemsSubCatCategory` (`m_aems_category_id`),
  KEY `aemsSubCategoryUpdatedBy_idx` (`m_user_id_updated`),
  CONSTRAINT `aemsSubCatCategory` FOREIGN KEY (`m_aems_category_id`) REFERENCES `aems_m_category` (`m_aems_category_id`),
  CONSTRAINT `aemsSubCategoryCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `aemsSubCategoryUpdatedBy` FOREIGN KEY (`m_user_id_updated`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aems_m_sub_category`
--

LOCK TABLES `aems_m_sub_category` WRITE;
/*!40000 ALTER TABLE `aems_m_sub_category` DISABLE KEYS */;
INSERT INTO `aems_m_sub_category` VALUES (1,'PNG (SCM)',1,1,1,'2023-04-04 15:57:45',NULL,NULL),(2,'LPG',1,1,1,'2023-04-04 15:58:02',1,'2023-04-04 16:06:29'),(3,'Diesel',1,1,1,'2023-04-04 15:58:17',1,'2023-04-04 16:06:41'),(4,'Propane',1,1,1,'2023-04-04 15:58:31',1,'2023-04-04 16:06:54'),(5,'Grid Electricity',1,1,1,'2023-04-04 15:58:47',1,'2023-04-04 16:06:49'),(6,'Renewable Energy',1,1,1,'2023-04-04 15:58:59',NULL,NULL),(7,'CO2 Emitted (Direct Use)',2,1,1,'2023-04-04 16:00:46',1,'2023-04-04 16:07:02'),(8,'Municipal Water',3,1,1,'2023-04-04 16:01:11',NULL,NULL),(9,'Tanker Water',3,1,1,'2023-04-04 16:01:21',NULL,NULL),(10,'Borewell Water',3,1,1,'2023-04-04 16:01:31',NULL,NULL),(11,'STP Treated',3,1,1,'2023-04-04 16:01:54',1,'2023-04-04 16:02:13'),(12,'ETP Treated',3,1,1,'2023-04-04 16:02:05',NULL,NULL),(13,'Annual Rainwater Harvesting Potential (Plant)',3,1,1,'2023-04-04 16:02:50',1,'2023-04-04 16:03:12'),(14,'Annual Rainwater Harvesting Potential (CSR)',3,1,1,'2023-04-04 16:03:22',NULL,NULL),(15,'Hazardous Waste',4,1,1,'2023-04-04 16:03:50',NULL,NULL),(16,'Non-Hazardous Waste',4,1,1,'2023-04-04 16:04:38',NULL,NULL),(17,'Recycled or Reused',4,1,1,'2023-04-04 16:05:00',NULL,NULL),(18,'Co-Processed or Incinerated With Recovery',4,1,1,'2023-04-04 16:05:30',NULL,NULL),(19,'Incinerated',4,1,1,'2023-04-04 16:05:46',NULL,NULL),(20,'To Landfill',4,1,1,'2023-04-04 16:05:58',NULL,NULL);
/*!40000 ALTER TABLE `aems_m_sub_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:30
