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
-- Table structure for table `m_member_type`
--

DROP TABLE IF EXISTS `m_member_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_member_type` (
  `member_type_id` bigint NOT NULL AUTO_INCREMENT,
  `member_type_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `member_type_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `member_type_active` int DEFAULT NULL,
  `member_type_created_by` bigint DEFAULT NULL,
  `member_type_created_on` datetime DEFAULT NULL,
  `member_type_last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`member_type_id`),
  KEY `memberTypeCreatedBy_idx` (`member_type_created_by`),
  CONSTRAINT `memberTypeCreatedBy` FOREIGN KEY (`member_type_created_by`) REFERENCES `m_user` (`m_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_member_type`
--

LOCK TABLES `m_member_type` WRITE;
/*!40000 ALTER TABLE `m_member_type` DISABLE KEYS */;
INSERT INTO `m_member_type` VALUES (1,'Internal','Corresponds to all in payroll employees',1,1,'2021-06-19 14:31:11','2021-06-22 12:33:04'),(2,'External','Corresponds to all external employees like contractual employees etc',1,1,'2021-06-19 14:31:58','2021-06-22 12:34:05');
/*!40000 ALTER TABLE `m_member_type` ENABLE KEYS */;
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
