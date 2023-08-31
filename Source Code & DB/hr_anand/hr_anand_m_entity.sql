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
-- Table structure for table `m_entity`
--

DROP TABLE IF EXISTS `m_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_entity` (
  `m_entity_id` bigint NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(250) DEFAULT NULL,
  `entity_short_name` varchar(150) DEFAULT NULL,
  `entity_acronym` varchar(50) DEFAULT NULL,
  `entity_source` bigint DEFAULT NULL,
  `m_location_id` bigint DEFAULT NULL,
  `entity_active` int DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `m_user_id_updated` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`m_entity_id`),
  KEY `entityCreatedBy_idx` (`m_user_id`),
  KEY `entityLocation_idx` (`m_location_id`),
  CONSTRAINT `entityCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `entityLocation` FOREIGN KEY (`m_location_id`) REFERENCES `m_location` (`m_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_entity`
--

LOCK TABLES `m_entity` WRITE;
/*!40000 ALTER TABLE `m_entity` DISABLE KEYS */;
INSERT INTO `m_entity` VALUES (1,'ANAND Automotive Private Limited','ANAND Automotive','AAPL',NULL,NULL,1,1,'2022-08-09 13:31:31',NULL,NULL),(2,'AAPL Corporate Office New Delhi','ANAND Automotive','AAPL',1,1,1,1,'2022-08-09 13:31:31',1,'2022-10-27 09:45:30'),(3,'AAPL Corporate Office Chennai','ANAND Automotive','AAPL',1,2,1,1,'2022-08-09 13:31:31',1,'2022-10-27 09:45:14'),(4,'AAPL Corporate Office Pune','ANAND Automotive','AAPL',1,3,1,1,'2022-08-09 13:31:31',1,'2022-10-27 09:44:44'),(5,'Gabriel India Limited','Gariel India','GIL',NULL,NULL,1,1,'2022-08-09 13:31:31',NULL,NULL),(6,'ANAND I-Power Limited','ANAND I-Power Limited','AiPL',NULL,NULL,1,1,'2022-08-11 17:03:37',NULL,NULL),(7,'AiPL Ring Plan','ANAND I-Power Limited','AiPL',6,3,1,1,'2022-08-11 17:04:49',1,'2022-08-11 17:31:42'),(8,'GIL HO','Gariel India','GIL',5,8,1,1,'2022-10-26 11:35:52',1,'2022-10-27 08:46:51'),(9,'GIL AM','Gariel India','GIL',5,14,1,1,'2022-10-27 08:47:05',NULL,NULL),(10,'GIL Casting Plant','Gariel India','GIL',6,8,1,1,'2022-10-27 08:47:31',1,'2023-01-13 14:30:02'),(11,'GIL Plant','Gariel India','GIL',5,24,1,1,'2022-10-27 08:49:11',NULL,NULL),(12,'GIL Plant','Gariel India','GIL',5,17,1,1,'2022-10-27 08:49:30',NULL,NULL),(13,'GIL Plant','Gariel India','GIL',5,9,1,1,'2022-10-27 08:49:44',NULL,NULL),(14,'GIL Plant','Gariel India','GIL',5,21,1,1,'2022-10-27 08:50:00',NULL,NULL),(15,'GIL Plant','Gariel India','GIL',5,5,1,1,'2022-10-27 08:50:13',NULL,NULL),(16,'GIL Plant','Gariel India','GIL',5,14,1,1,'2022-10-27 08:50:32',NULL,NULL),(17,'GIL Plant','Gariel India','GIL',5,4,1,1,'2022-10-27 08:50:50',NULL,NULL),(18,'GIL SSO','Gariel India','GIL',5,8,1,1,'2022-10-27 09:14:14',NULL,NULL),(19,'GIL Plant','Gariel India','GIL',5,8,1,1,'2022-10-27 09:14:36',NULL,NULL),(20,'ANAND CY Myutec Automotive Private Limited','ANAND CY Myutec','ACYM',NULL,NULL,1,1,'2022-10-27 09:15:36',1,'2022-10-27 09:19:26'),(21,'ACYM Plant','CY Myutec','ACYM',20,10,1,1,'2022-10-27 09:15:57',NULL,NULL),(22,'Ansysco ANAND LLP Anchemco ANAND LLP Anchemco Limited','Ansysco Anchemco ANAND','Ansysco Anchemco',NULL,NULL,1,1,'2022-10-27 09:17:48',NULL,NULL),(23,'Ansysco Plant Anchemco Plant','Ansysco Anchemco ANAND','Ansysco Anchemco',22,21,1,1,'2022-10-27 09:18:15',NULL,NULL),(24,'CY Myutec ANAND Private Limited','CY Myutec ANAND','CYMA',NULL,NULL,1,1,'2022-10-27 09:19:01',NULL,NULL),(25,'CYMA Plant','CY Myutec ANAND','CYMA',24,2,1,1,'2022-10-27 09:19:46',NULL,NULL),(26,'Dana ANAND India Private Limited','Dana ANAND','DAIPL',NULL,NULL,1,1,'2022-10-27 09:20:25',NULL,NULL),(27,'DAIPL HO','Dana ANAND','DAIPL',26,8,1,1,'2022-10-27 09:20:39',NULL,NULL),(28,'DAIPL Plant','Dana ANAND','DAIPL',26,23,1,1,'2022-10-27 09:20:54',NULL,NULL),(29,'DAIPL Plant','Dana ANAND','DAIPL',26,13,1,1,'2022-10-27 09:21:14',NULL,NULL),(30,'DAIPL Plant','Dana ANAND','DAIPL',26,4,1,1,'2022-10-27 09:21:25',NULL,NULL),(31,'DAIPL Plant','Dana ANAND','DAIPL',26,24,1,1,'2022-10-27 09:21:37',NULL,NULL),(32,'DAIPL Plant','Dana ANAND','DAIPL',26,20,1,1,'2022-10-27 09:21:45',NULL,NULL),(33,'DAIPL Plant','Dana ANAND','DAIPL',26,8,1,1,'2022-10-27 09:21:57',NULL,NULL),(34,'DAIPL SSO','Dana ANAND','DAIPL',26,8,1,1,'2022-10-27 09:22:13',NULL,NULL),(35,'Faurecia Clean Mobility','Faurecia Clean ','FCM',NULL,NULL,1,1,'2022-10-27 09:22:50',NULL,NULL),(36,'FCM Plant','Faurecia Clean ','FCM',35,2,1,1,'2022-10-27 09:23:06',NULL,NULL),(37,'FCM Plant','Faurecia Clean ','FCM',35,6,1,1,'2022-10-27 09:23:15',NULL,NULL),(38,'FCM Plant','Faurecia Clean ','FCM',35,3,1,1,'2022-10-27 09:23:26',NULL,NULL),(39,'FCM SSO','Faurecia Clean ','FCM',35,3,1,1,'2022-10-27 09:23:36',NULL,NULL),(40,'Haldex ANAND India Private Limited','Haldex ANAND','HIPL',NULL,NULL,1,1,'2022-10-27 09:23:59',NULL,NULL),(41,'HIPL Plant','Haldex ANAND','HIPL',40,17,1,1,'2022-10-27 09:24:16',NULL,NULL),(42,'HIPL Plant','Haldex ANAND','HIPL',40,3,1,1,'2022-10-27 09:24:27',NULL,NULL),(43,'Joyson ANAND Abhishek Safety Systems Private Limited','Joyson ANAND','JAAI',NULL,NULL,1,1,'2022-10-27 09:25:05',NULL,NULL),(44,'JAAI Plant','Joyson ANAND','JAAI',43,18,1,1,'2022-10-27 09:25:21',NULL,NULL),(45,'JAAI Plant','Joyson ANAND','JAAI',43,2,1,1,'2022-10-27 09:25:33',NULL,NULL),(46,'JAAI Plant','Joyson ANAND','JAAI',43,4,1,1,'2022-10-27 09:25:43',NULL,NULL),(47,'JAAI Plant','Joyson ANAND','JAAI',43,3,1,1,'2022-10-27 09:25:55',NULL,NULL),(48,'MAHLE ANAND Filter Systems Private Limited','MAHLE ANAND Filter','MAFS',NULL,NULL,1,1,'2022-10-27 09:26:29',NULL,NULL),(49,'MAFS AM','MAHLE ANAND Filter','MAFS',48,14,1,1,'2022-10-27 09:26:45',NULL,NULL),(50,'MAFS HO','MAHLE ANAND Filter','MAFS',48,14,1,1,'2022-10-27 09:27:06',NULL,NULL),(51,'MAFS Plant','MAHLE ANAND Filter','MAFS',48,14,1,1,'2022-10-27 09:27:29',NULL,NULL),(52,'MAFS Plant','MAHLE ANAND Filter','MAFS',48,3,1,1,'2022-10-27 09:27:39',NULL,NULL),(53,'MAFS Plant','MAHLE ANAND Filter','MAFS',48,2,1,1,'2022-10-27 09:28:03',NULL,NULL),(54,'MAFS Plant','MAHLE ANAND Filter','MAFS',48,21,1,1,'2022-10-27 09:28:14',NULL,NULL),(55,'MAHLE ANAND Thermal Systems Private Limited','MAHLE ANAND Thermal','MATS',NULL,NULL,1,1,'2022-10-27 09:28:39',NULL,NULL),(56,'MATS Plant','MAHLE ANAND Thermal','MATS',55,19,1,1,'2022-10-27 09:28:56',NULL,NULL),(57,'MATS Plant','MAHLE ANAND Thermal','MATS',55,2,1,1,'2022-10-27 09:29:07',NULL,NULL),(58,'MATS Plant','MAHLE ANAND Thermal','MATS',55,5,1,1,'2022-10-27 09:29:23',NULL,NULL),(59,'MATS Plant 1','MAHLE ANAND Thermal','MATS',55,8,1,1,'2022-10-27 09:29:35',NULL,NULL),(60,'MATS Plant 2','MAHLE ANAND Thermal','MATS',55,8,1,1,'2022-10-27 09:29:43',NULL,NULL),(61,'SNS Foundation','SNS Foundation','SNSF',NULL,NULL,1,1,'2022-10-27 09:30:03',NULL,NULL),(62,'SNS Offices','SNS Foundation','SNSF',61,10,1,1,'2022-10-27 09:30:18',NULL,NULL),(63,'SUJÁN Luxury Hospitality Private Limited','SUJÁN Luxury','SUJÁN',NULL,NULL,1,1,'2022-10-27 09:30:42',NULL,NULL),(64,'Desert Friendly Camps Private Limited THE SERAI','SUJÁN Luxury','SUJÁN',63,11,1,1,'2022-10-27 09:31:04',NULL,NULL),(65,'Forest Friendly Camps Private Limited JAWAI','SUJÁN Luxury','SUJÁN',63,12,1,1,'2022-10-27 09:38:19',NULL,NULL),(66,'Forest Friendly Camps Private Limited Sher Bagh','SUJÁN Luxury','SUJÁN',63,22,1,1,'2022-10-27 09:38:33',NULL,NULL),(67,'SUJÁN H O','SUJÁN Luxury','SUJÁN',63,1,1,1,'2022-10-27 09:38:46',NULL,NULL),(68,'Valeo Friction Materials India Private Limited','Valeo Friction','VFMI',NULL,NULL,1,1,'2022-10-27 09:39:13',NULL,NULL),(69,'VFMI Plant','Valeo Friction','VFMI',68,2,1,1,'2022-10-27 09:39:26',NULL,NULL),(70,'Deep C Anand Educational Trust','Deep C Anand Educational Trust','ANAND School',NULL,NULL,1,1,'2022-10-27 09:40:06',NULL,NULL),(71,'Anand School','Deep C Anand Educational Trust','ANAND School',70,21,1,1,'2022-10-27 09:40:23',NULL,NULL),(72,'Mando Automotive India Private Limited','Mando Automotive','MAIPL',NULL,NULL,1,1,'2022-10-27 09:40:50',NULL,NULL),(73,'MAIPL Plant','Mando Automotive','MAIPL',72,2,1,1,'2022-10-27 09:41:03',NULL,NULL),(74,'Henkel ANAND India Private Limited','Henkel ANAND','HAIPL',NULL,NULL,1,1,'2022-10-27 09:41:32',NULL,NULL),(75,'HAIPL HO','Henkel ANAND','HAIPL',74,16,1,1,'2022-10-27 09:41:48',NULL,NULL),(76,'HAIPL Plant','Henkel ANAND','HAIPL',74,2,1,1,'2022-10-27 09:41:59',NULL,NULL),(77,'HAIPL Plant','Henkel ANAND','HAIPL',74,10,1,1,'2022-10-27 09:42:09',NULL,NULL),(78,'HAIPL Plant','Henkel ANAND','HAIPL',74,21,1,1,'2022-10-27 09:42:22',NULL,NULL),(79,'HAIPL Plant','Henkel ANAND','HAIPL',74,15,1,1,'2022-10-27 09:42:32',NULL,NULL),(80,'ANAND Mando E Mobility Private Limited','ANAND Mando E Mobility','AMeM',NULL,NULL,1,1,'2022-10-27 09:43:36',NULL,NULL),(81,'AMeM Plant','ANAND Mando E Mobility','AMeM',80,7,1,1,'2022-10-27 09:43:49',NULL,NULL),(82,'AiPL Castings Plant','ANAND I-Power Limited','AiPL',6,17,1,1,'2022-10-27 09:46:26',1,'2023-01-13 14:31:23');
/*!40000 ALTER TABLE `m_entity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-18 12:05:40
