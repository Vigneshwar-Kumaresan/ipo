-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: zipo
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `logger`
--

DROP TABLE IF EXISTS `logger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logger` (
  `dtime` datetime DEFAULT NULL,
  `cid` varchar(255) DEFAULT NULL,
  `counter` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logger`
--

LOCK TABLES `logger` WRITE;
/*!40000 ALTER TABLE `logger` DISABLE KEYS */;
INSERT INTO `logger` VALUES ('2021-04-05 11:30:07','JAMAL',1),('2021-04-05 11:31:41','JAMAL',2),('2021-04-05 11:41:19','JAMAL',3),('2021-04-05 11:43:44','JAMAL',4),('2021-04-05 11:57:39','JAMAL',5),('2021-04-05 12:02:15','JAMAL',6),('2021-04-05 12:02:58','JAMAL',7),('2021-04-05 12:03:41','JAMAL',8),('2021-04-05 12:12:39','JAMAL',9),('2021-04-05 12:13:47','JAMAL',10),('2021-04-05 12:30:24','JAMAL',11),('2021-04-05 12:51:21','JAMAL',12),('2021-04-05 12:52:29','JAMAL',13),('2021-04-05 12:54:08','JAMAL',14),('2021-04-05 12:56:48','JAMAL',15),('2021-04-05 13:01:36','JAMAL',16),('2021-04-05 13:02:34','JAMAL',17),('2021-04-05 13:06:39','JAMAL',18),('2021-04-05 13:12:01','JAMAL',19),('2021-04-05 14:03:27','JAMAL',20),('2021-04-05 14:05:01','JAMAL',21),('2021-04-05 14:06:25','JAMAL',22),('2021-04-05 14:06:53','10099',23),('2021-04-05 14:08:38','JAMAL',24),('2021-04-05 14:09:07','JAMAL',25),('2021-04-05 14:09:35','10099',26),('2021-04-05 14:19:46','10099',27),('2021-04-05 14:21:17','10099',28),('2021-04-05 14:22:59','10099',29),('2021-04-05 14:23:56','10099',30),('2021-04-05 14:27:11','JAMAL',31),('2021-04-05 14:28:11','JAMAL',32),('2021-04-05 14:29:20','JAMAL',33),('2021-04-05 14:31:31','JAMAL',34),('2021-04-05 14:47:07','JAMAL',35),('2021-04-05 14:50:01','JAMAL',36),('2021-04-05 14:52:18','JAMAL',37),('2021-04-05 14:53:09','JAMAL',38),('2021-04-05 15:02:05','JAMAL',39),('2021-04-05 15:02:31','10099',40),('2021-04-05 15:03:05','ZR001',41),('2021-04-05 15:51:27','JAMAL',42),('2021-04-05 16:00:49','JAMAL',43),('2021-04-05 16:02:29','JAMAL',44),('2021-04-05 16:41:34','JAMAL',45),('2021-04-05 17:03:53','JAMAL',46),('2021-04-05 17:05:41','JAMAL',47),('2021-04-05 17:06:26','JAMAL',48),('2021-04-05 17:07:05','JAMAL',49),('2021-04-05 17:07:07','JAMAL',50),('2021-04-05 17:08:04','JAMAL',51),('2021-04-05 17:08:08','JAMAL',52),('2021-04-05 17:09:16','JAMAL',53),('2021-04-05 17:11:44','10099',54),('2021-04-05 17:14:44','10099',55),('2021-04-05 17:23:33','10099',56),('2021-04-05 17:25:51','10099',57),('2021-04-05 17:26:25','JAMAL',58),('2021-04-05 17:27:33','JAMAL',59),('2021-04-05 17:27:50','JAMAL',60),('2021-04-05 17:29:28','JAMAL',61),('2021-04-05 17:29:38','JAMAL',62),('2021-04-05 17:29:50','JAMAL',63),('2021-04-05 17:31:43','JAMAL',64),('2021-04-05 17:31:52','JAMAL',65),('2021-04-05 17:32:08','JAMAL',66),('2021-04-05 17:35:01','JAMAL',67),('2021-04-05 17:35:17','JAMAL',68),('2021-04-05 17:37:00','JAMAL',69),('2021-04-05 17:40:46','JAMAL',70),('2021-04-05 17:41:07','JAMAL',71),('2021-04-05 17:41:39','JAMAL',72),('2021-04-05 17:41:47','JAMAL',73),('2021-04-05 17:42:40','JAMAL',74),('2021-04-05 17:43:13','JAMAL',75),('2021-04-05 17:43:50','JAMAL',76),('2021-04-05 17:44:00','JAMAL',77),('2021-04-05 17:44:15','JAMAL',78),('2021-04-05 17:44:39','JAMAL',79),('2021-04-05 17:45:01','JAMAL',80),('2021-04-05 17:45:23','JAMAL',81),('2021-04-05 17:45:34','JAMAL',82),('2021-04-05 17:45:40','JAMAL',83),('2021-04-05 17:46:02','JAMAL',84),('2021-04-05 17:47:03','JAMAL',85),('2021-04-05 17:47:42','JAMAL',86),('2021-04-05 17:48:34','JAMAL',87),('2021-04-05 17:54:40','10099',88),('2021-04-05 17:58:05','10099',89),('2021-04-06 10:46:47','JAMAL',90),('2021-04-07 11:20:25','JAMAL',91),('2021-04-07 11:22:34','JAMAL',92),('2021-04-07 11:47:40','JAMAL',93),('2021-04-08 14:47:12','JAMAL',94),('2021-04-08 14:56:47','JAMAL',95),('2021-04-08 14:56:53','JAMAL',96),('2021-04-09 09:34:42','JAMAL',97),('2021-04-09 09:49:31','JAMAL',98),('2021-04-09 17:17:55','JAMAL',99),('2021-04-10 13:08:34','ZR001',100),('2021-04-10 15:58:26','ZR001',101),('2021-04-10 16:06:24','ZR001',102),('2021-04-10 16:12:50','ZR001',103),('2021-04-10 16:17:33','ZR001',104);
/*!40000 ALTER TABLE `logger` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-15 10:58:42