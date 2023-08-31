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
-- Table structure for table `aems_m_sub_category_history`
--

DROP TABLE IF EXISTS `aems_m_sub_category_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aems_m_sub_category_history` (
  `m_aems_sub_category_history_id` bigint NOT NULL AUTO_INCREMENT,
  `m_aems_sub_category_id` bigint NOT NULL,
  `aems_sub_category_name` varchar(150) DEFAULT NULL,
  `m_aems_category_id` bigint DEFAULT NULL,
  `aems_sub_category_active` int DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`m_aems_sub_category_history_id`),
  KEY `parentAemsSubCategory` (`m_aems_sub_category_id`),
  KEY `aemsSubCategoryHistoryCreatedBy` (`m_user_id`),
  KEY `parentAemsSubCatPareCategory` (`m_aems_category_id`),
  CONSTRAINT `aemsSubCategoryHistoryCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `parentAemsSubCategory` FOREIGN KEY (`m_aems_sub_category_id`) REFERENCES `aems_m_sub_category` (`m_aems_sub_category_id`),
  CONSTRAINT `parentAemsSubCatPareCategory` FOREIGN KEY (`m_aems_category_id`) REFERENCES `aems_m_category` (`m_aems_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aems_m_sub_category_history`
--

LOCK TABLES `aems_m_sub_category_history` WRITE;
/*!40000 ALTER TABLE `aems_m_sub_category_history` DISABLE KEYS */;
INSERT INTO `aems_m_sub_category_history` VALUES (1,11,'STP Treated',4,1,1,'2023-04-04 16:02:13'),(2,13,'Annual Rainwater Harvesting Potential',3,1,1,'2023-04-04 16:03:12'),(3,2,'LPG (kg)',1,1,1,'2023-04-04 16:06:29'),(4,3,'Diesel (Litres)',1,1,1,'2023-04-04 16:06:41'),(5,5,'Grid Electricity (kWh)',1,1,1,'2023-04-04 16:06:49'),(6,4,'Propane (kg)',1,1,1,'2023-04-04 16:06:54'),(7,7,'CO2 Emitted (Direct Use) (kg CO2)',2,1,1,'2023-04-04 16:07:02');
/*!40000 ALTER TABLE `aems_m_sub_category_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:32
