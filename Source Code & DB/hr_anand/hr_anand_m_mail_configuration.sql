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
-- Table structure for table `m_mail_configuration`
--

DROP TABLE IF EXISTS `m_mail_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_mail_configuration` (
  `m_mail_configuration_id` bigint NOT NULL AUTO_INCREMENT,
  `mail_id` varchar(550) DEFAULT NULL,
  `mail_app_password` varchar(550) DEFAULT NULL,
  `active` int DEFAULT NULL,
  `m_user_id` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `m_user_id_update` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`m_mail_configuration_id`),
  KEY `mailConfigurationCreatedBy_idx` (`m_user_id`),
  CONSTRAINT `mailConfigurationCreatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`),
  CONSTRAINT `mailConfigurationUpdatedBy` FOREIGN KEY (`m_user_id`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_mail_configuration`
--

LOCK TABLES `m_mail_configuration` WRITE;
/*!40000 ALTER TABLE `m_mail_configuration` DISABLE KEYS */;
INSERT INTO `m_mail_configuration` VALUES (1,'b7e5c566ffa33eb9d232f4038acaa92d','ba970e771f53495455b22729fd4aee58',1,1,'2022-08-11 11:38:38',1,'2022-08-11 12:00:33'),(2,'f68f25bf1090ff47affed4cd5471da49','b0fcb44fbf522884815844ef0d9b1327',1,1,'2022-08-11 11:53:09',1,'2022-08-11 12:00:44'),(3,'444bbb1961d77fee471d06a79640aacfb089cc42a2b6da97eafbbfb6e3d176c7','59f4b91fb4bf0a4db00ee862ee584350',1,1,'2022-08-11 11:59:02',1,'2022-09-21 11:47:37'),(4,'444bbb1961d77fee471d06a79640aacfa1082d202ab3e0ffd04b6be9d9378fa8','5123449bb832f3362b630d74bc521815',1,1,'2022-10-26 12:15:36',1,'2022-10-26 12:15:40');
/*!40000 ALTER TABLE `m_mail_configuration` ENABLE KEYS */;
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
