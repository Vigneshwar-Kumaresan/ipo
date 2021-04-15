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
-- Table structure for table `bidorder`
--

DROP TABLE IF EXISTS `bidorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bidorder` (
  `scripid` varchar(255) DEFAULT NULL,
  `applicationno` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `applicantname` varchar(255) DEFAULT NULL,
  `depository` varchar(255) DEFAULT NULL,
  `dpid` varchar(255) DEFAULT NULL,
  `clientbenfid` varchar(255) DEFAULT NULL,
  `chequereceivedflag` varchar(255) DEFAULT NULL,
  `chequeamount` varchar(255) DEFAULT NULL,
  `panno` varchar(255) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `accountnumber_upiid` varchar(255) DEFAULT NULL,
  `ifsccode` varchar(255) DEFAULT NULL,
  `referenceno` varchar(255) DEFAULT NULL,
  `entrydatetime` varchar(255) DEFAULT NULL,
  `lastmodifieddatetime` varchar(255) DEFAULT NULL,
  `dpstatus` varchar(255) DEFAULT NULL,
  `dpremarks` varchar(255) DEFAULT NULL,
  `sponsorbankpaystatus` varchar(255) DEFAULT NULL,
  `sponsorbankactiontime` varchar(255) DEFAULT NULL,
  `sponsorbankamtblocked` varchar(255) DEFAULT NULL,
  `rejectreason` varchar(255) DEFAULT NULL,
  `loginid` varchar(255) DEFAULT NULL,
  `branchcode` varchar(255) DEFAULT NULL,
  `chequeno` varchar(255) DEFAULT NULL,
  `subbrokercode` varchar(255) DEFAULT NULL,
  `errorcode` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `bids` varchar(255) DEFAULT NULL,
  `bidid` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `cuttoffflag` varchar(255) DEFAULT NULL,
  `orderno` varchar(255) DEFAULT NULL,
  `orderstatus` varchar(255) DEFAULT NULL,
  UNIQUE KEY `applicationno` (`applicationno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidorder`
--

LOCK TABLES `bidorder` WRITE;
/*!40000 ALTER TABLE `bidorder` DISABLE KEYS */;
INSERT INTO `bidorder` VALUES ('LODHA','oqar','ind','MUNUSWAMY KRISHNAN','cdsl','0','1208040000078571','N','14580.00','AZFPK4823R','8888','UPIIDL','9941003409@okicici','','','07-04-2021 16:19:20','07-04-2021 16:19:20','S','','11','07-04-2021 16:19:54','0.00','11-- BLOCK/RELEASE REQUEST REJECTED BY SPONSOR BANK DUE TO INVALID UPI HANDLE INVALID VIRTUAL ADDRESS','','999999','123456','123456','','',NULL,'88950656','30','486.00','0','1234','N   '),('LODHA','qjzb','ind','KAMALI BOOPATHI','cdsl','0','1208040000233411','N','14580.00','EQJPB2316D','8888','UPIIDL','902841498@upi','','','07-04-2021 15:40:17','07-04-2021 15:40:17','S','','11','07-04-2021 15:40:36','0.00','11-- BLOCK/RELEASE REQUEST REJECTED BY SPONSOR BANK DUE TO INVALID UPI HANDLE INVALID VIRTUAL ADDRESS','','999999','123456','123456','','',NULL,'88945216','30','486.00','0','1234','N   '),('LODHA','sfni','ind','NISHANTH','cdsl','0','1208040000233407','N','14580.00','AYIPN2394L','8888','UPIIDL','9092841498@upi','','','07-04-2021 15:41:26','07-04-2021 15:41:26','S','','22','07-04-2021 20:06:09','0.00','22-- BLOCK/RELEASE REQUEST REJECTED BY CLIENT BANK DUE TO  TECHNICAL REASON RespMandate timeout at remitter end','','999999','123456','123456','','',NULL,'88945226','30','486.00','0','1234','N   '),('LODHA','drsw','ind','VENKATACHALAM SUNDARAM','cdsl','0','1208040000254121','N','14580.00','AJCPS1490B','8888','UPIIDL','sundaramvenkatachalam4@oksbi','','','07-04-2021 15:50:21','07-04-2021 15:50:21','S','','10','07-04-2021 15:51:40','0.00','10-- REQUEST SENT TO INVESTORS UPI APP FOR ACCEPTANCE ','','999999','123456','123456','','',NULL,'88945309','30','486.00','0','1234','N   '),('LODHA','xpti','ind','CHANDRASEKAR RAMESH','cdsl','0','1208040000239660','N','14490.00','AKDPR8257K','8888','UPIIDL','rameshraga@okhdfcbank','','','08-04-2021 10:40:52','08-04-2021 10:40:52','S','','31','08-04-2021 10:46:59','0.00','31-- BLOCK/RELEASE REQUEST REJECTED BY CLIENT Transaction Declined by Customer','','999999','123456','123456','','',NULL,'88957542','30','483.00','0','1234','N   '),('LODHA','sgms','ind','CHANDRASEKAR RAMESH','cdsl','0','1208040000239660','N','14490.00','AKDPR8257K','8888','UPIIDL','rameshraga@okhdfcbank','','','08-04-2021 10:50:41','08-04-2021 10:50:41','S','','31','08-04-2021 10:54:18','0.00','31-- BLOCK/RELEASE REQUEST REJECTED BY CLIENT Transaction Declined by Customer','','999999','123456','123456','','',NULL,'88957715','30','483.00','0','1234','N   '),('LODHA','iunn','ind','ABDULJABBAR NOORMOHAMED','cdsl','0','1208040000247042','N','14580.00','AEUPN5928E','8888','UPIIDL','9994500575@upi','','','08-04-2021 10:53:26','08-04-2021 10:53:26','S','','100','08-04-2021 10:56:05','14580.00','100-- BLOCK REQUEST ACCEPTED BY CLIENT. PAYMENT SUCCESSFUL. ','','999999','123456','123456','','',NULL,'88957755','30','486.00','0','1234','N   '),('LODHA','ubpa','ind','NOOR MOHAMED SHIHAAB HUVAIRISH','cdsl','0','1208040000247665','N','14580.00','MWIPS8854C','8888','UPIIDL','9677720575@upi','','','08-04-2021 10:54:42','08-04-2021 10:54:42','S','','100','08-04-2021 11:01:33','14580.00','100-- BLOCK REQUEST ACCEPTED BY CLIENT. PAYMENT SUCCESSFUL. ','','999999','123456','123456','','',NULL,'88958161','30','486.00','0','1234','N   '),('LODHA','xhta','ind','CHANDRASEKAR RAMESH','cdsl','0','1208040000239660','N','14580.00','AKDPR8257K','8888','UPIIDL','rameshraga@okhdfcbank','','','08-04-2021 11:05:36','08-04-2021 11:05:36','P','','','','',' ','','999999','123456','123456','','',NULL,'88958362','30','9999.00','1','1234','N   ');
/*!40000 ALTER TABLE `bidorder` ENABLE KEYS */;
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
