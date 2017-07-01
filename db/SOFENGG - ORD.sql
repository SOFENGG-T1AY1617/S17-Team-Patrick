CREATE DATABASE  IF NOT EXISTS `dlsu_ord` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dlsu_ord`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: dlsu_ord
-- ------------------------------------------------------
-- Server version	5.7.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `campus`
--

DROP TABLE IF EXISTS `campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campus` (
  `id` int(11) NOT NULL,
  `campusName` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campus`
--

LOCK TABLES `campus` WRITE;
/*!40000 ALTER TABLE `campus` DISABLE KEYS */;
INSERT INTO `campus` VALUES (1,'De La Salle University - Manila'),(2,'De La Salle University - STC'),(3,'De La Salle University - Dasmariñas'),(4,'De La Salle - College of Saint Benilde');
/*!40000 ALTER TABLE `campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `courseID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `acronym` varchar(10) NOT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Web Application Development','WEBAPDE'),(2,'Machine Learning','MACLERN'),(3,'Intelligent Systems','INTESYS'),(4,'Calculus 2','CCSCAL2'),(5,'Graphics','GRAPHIX'),(6,'Software Engineering','SOFENGG');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degrees`
--

DROP TABLE IF EXISTS `degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `acronym` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degrees`
--

LOCK TABLES `degrees` WRITE;
/*!40000 ALTER TABLE `degrees` DISABLE KEYS */;
/*!40000 ALTER TABLE `degrees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degreesofuser`
--

DROP TABLE IF EXISTS `degreesofuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degreesofuser` (
  `id` int(11) NOT NULL,
  `degreeID` varchar(100) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `yearAdmitted` int(4) DEFAULT NULL,
  `campusID` int(11) DEFAULT NULL,
  `admittedAs` varchar(1) DEFAULT NULL,
  `graduated` varchar(45) DEFAULT NULL,
  `yearLevel` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `lastSchoolAttended` varchar(100) DEFAULT NULL,
  `graduatedYear` int(11) DEFAULT NULL,
  `graduatedMonth` int(11) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `academicYear` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degreesofuser`
--

LOCK TABLES `degreesofuser` WRITE;
/*!40000 ALTER TABLE `degreesofuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `degreesofuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryrates`
--

DROP TABLE IF EXISTS `deliveryrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveryrates` (
  `locationID` int(11) NOT NULL AUTO_INCREMENT,
  `price` float NOT NULL,
  `minDelay` int(11) NOT NULL,
  `maxDelay` int(11) NOT NULL,
  `location` varchar(45) NOT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryrates`
--

LOCK TABLES `deliveryrates` WRITE;
/*!40000 ALTER TABLE `deliveryrates` DISABLE KEYS */;
INSERT INTO `deliveryrates` VALUES (1,1200,2,3,'Brunei'),(2,1650,2,3,'Canada'),(3,1400,3,4,'China'),(4,2350,4,5,'Europe'),(5,2544,4,5,'Fiji Island\n'),(6,2500,3,4,'Guam'),(7,950,2,3,'Hongkong/Singapore'),(8,1200,2,3,'Indonesia/ Malaysia/ Taiwan/ Thailand'),(9,1200,2,3,'Japan'),(10,128,1,2,'Luzon'),(11,128,1,2,'Metro Manila'),(12,2500,2,3,'Mexico City\n'),(13,2400,3,4,'Middle East'),(14,158,1,2,'Mindanao'),(15,1400,2,3,'New Zealand'),(16,2600,3,4,'Papua New Guinea'),(17,0,1,2,'Pickup - DLSU Manila'),(18,3178,3,4,'South America'),(19,1200,2,3,'South Korea'),(20,1650,2,3,'USA'),(21,1400,1,2,'Vietnam'),(22,142,1,2,'Visayas'),(23,2544,4,5,'Africa'),(24,1400,2,3,'Australia');
/*!40000 ALTER TABLE `deliveryrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentcategory`
--

DROP TABLE IF EXISTS `documentcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentcategory` (
  `categoryId` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentcategory`
--

LOCK TABLES `documentcategory` WRITE;
/*!40000 ALTER TABLE `documentcategory` DISABLE KEYS */;
INSERT INTO `documentcategory` VALUES (0,'Others'),(1,'Transcript of Records'),(2,'Certification'),(3,'Certified True Copy');
/*!40000 ALTER TABLE `documentcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docuName` varchar(100) NOT NULL,
  `regularPrice` float NOT NULL,
  `expressPrice` float DEFAULT NULL,
  `category` int(11) NOT NULL DEFAULT '0',
  `note` varchar(250) DEFAULT NULL,
  `weight` float NOT NULL,
  `maxCopy` int(11) NOT NULL DEFAULT '0',
  `isAvailable` tinyint(1) NOT NULL DEFAULT '1',
  `forUndergraduate` tinyint(1) NOT NULL,
  `forGraduate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'Official Transcript of Records for Employment (Batch 1980)',150,NULL,1,' *for Students with ID no. 80XXXX (those who entered DLSU-M in 1980) and below',1,0,1,1,1),(2,'Official Transcript of Records for Employment',150,300,1,NULL,2,0,1,1,1),(3,'Official Transcript of Records for Evaluation',150,300,1,NULL,3,0,1,1,1),(4,'Ranking in Degree Program',110,200,2,NULL,4,0,1,1,0),(5,'Ranking by College',110,220,2,NULL,5,0,1,1,0),(6,'Dean\'s List',110,220,2,NULL,6,0,1,1,0),(7,'Completion for Academic Units',110,NULL,2,NULL,7,0,1,0,1),(8,'Trimestral Calendar',110,220,2,NULL,8,0,1,1,1),(9,'Cumulative GPA',110,220,2,NULL,9,0,1,1,1),(10,'Enrollment',110,220,2,NULL,10,0,1,1,1),(11,'Grading System',110,220,2,NULL,11,0,1,1,1),(12,'Graduation / With Honors',110,220,2,NULL,12,0,1,1,1),(13,'Medium of Instruction (English)',110,220,2,NULL,13,0,1,1,1),(14,'Tuition and Miscellaneous Fees Breakdown (Current Term)',40,NULL,2,NULL,14,0,1,1,1),(15,'Tuition and Miscellaneous Fees Breakdown (starting SY2000-01)',110,220,2,NULL,15,0,1,1,1),(16,'Units Earned',110,220,2,NULL,16,0,1,1,1),(17,'Course (Subject) Description',110,NULL,2,' - Max of 5 courses per certification) *IMPORTANT*: Indicate the title of the course in the *Other Instructions*',17,0,1,1,1),(18,'Official Transcript of Records (Previous to DLSU)',50,NULL,3,NULL,18,0,1,1,1),(19,'Form 137 (High School Transcript)',50,NULL,3,NULL,19,0,1,1,1),(20,'Form 138 (High School Card)',50,NULL,3,NULL,20,0,1,1,1),(21,'Espiritu, Paolo Montesa',200,NULL,3,'(CTC TOR-2 and Cert of Grad-2)',21,0,1,1,1),(22,'Special Credentials',0,NULL,0,NULL,22,0,1,1,1),(23,'Special Handling (WES)',150,300,0,NULL,23,0,1,1,1);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailingaddress`
--

DROP TABLE IF EXISTS `mailingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zipcode` varchar(11) NOT NULL,
  `streetName` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `locationID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `addressline` varchar(200) DEFAULT NULL,
  `contactperson` varchar(45) NOT NULL,
  `contactnumber` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailingaddress`
--

LOCK TABLES `mailingaddress` WRITE;
/*!40000 ALTER TABLE `mailingaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline`
--

DROP TABLE IF EXISTS `offline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline` (
  `date` date NOT NULL,
  `addedByPersonelID` int(11) NOT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline`
--

LOCK TABLES `offline` WRITE;
/*!40000 ALTER TABLE `offline` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordercoursedescs`
--

DROP TABLE IF EXISTS `ordercoursedescs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordercoursedescs` (
  `orderCourseDescID` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  PRIMARY KEY (`orderCourseDescID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordercoursedescs`
--

LOCK TABLES `ordercoursedescs` WRITE;
/*!40000 ALTER TABLE `ordercoursedescs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordercoursedescs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transactionID` int(11) NOT NULL,
  `docuID` int(11) NOT NULL,
  `mailingID` int(11) NOT NULL,
  `type` char(1) NOT NULL,
  `packaging` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL,
  `term` tinyint(1) DEFAULT NULL,
  `sy` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`,`transactionID`,`docuID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,2,0,'R',0,1,NULL,NULL),(2,2,2,0,'R',1,1,NULL,NULL),(3,3,3,0,'R',1,1,NULL,NULL),(4,4,5,0,'R',0,1,NULL,NULL),(5,5,4,0,'R',1,0,NULL,NULL),(6,6,2,0,'R',1,1,NULL,NULL),(7,6,9,0,'R',0,1,NULL,NULL),(8,6,7,0,'R',1,1,NULL,NULL),(9,6,3,0,'R',1,1,NULL,NULL),(10,6,4,0,'R',0,1,NULL,NULL),(11,6,9,0,'R',2,1,NULL,NULL),(12,10,2,0,'R',0,1,NULL,NULL),(13,11,2,0,'R',1,1,NULL,NULL),(14,12,2,0,'R',0,1,NULL,NULL),(15,13,2,0,'R',1,1,NULL,NULL),(16,14,2,0,'R',1,1,NULL,NULL),(17,15,1,0,'R',1,1,NULL,NULL),(18,15,2,0,'R',2,2,NULL,NULL),(19,16,1,0,'R',1,1,NULL,NULL),(20,16,2,0,'R',2,2,NULL,NULL),(21,17,1,0,'R',1,1,NULL,NULL),(22,17,2,0,'R',2,2,NULL,NULL),(23,18,1,0,'R',1,1,NULL,NULL),(24,18,2,0,'R',2,2,NULL,NULL),(25,19,1,0,'R',1,1,NULL,NULL),(26,19,2,0,'R',2,2,NULL,NULL),(27,20,1,0,'R',1,1,NULL,NULL),(28,20,2,0,'R',2,2,NULL,NULL),(29,21,1,0,'R',1,1,NULL,NULL),(30,21,2,0,'R',2,2,NULL,NULL),(31,22,1,0,'R',1,1,NULL,NULL),(32,22,2,0,'R',2,2,NULL,NULL),(33,23,1,0,'E',1,1,NULL,NULL),(34,23,2,0,'R',2,2,NULL,NULL),(35,24,1,0,'E',1,1,NULL,NULL),(36,24,2,0,'R',2,2,NULL,NULL),(37,25,1,0,'E',1,5,NULL,NULL),(38,25,2,0,'E',1,4,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personel`
--

DROP TABLE IF EXISTS `personel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personel` (
  `personelID` int(11) NOT NULL AUTO_INCREMENT,
  `lastName` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`personelID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personel`
--

LOCK TABLES `personel` WRITE;
/*!40000 ALTER TABLE `personel` DISABLE KEYS */;
/*!40000 ALTER TABLE `personel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionlogs`
--

DROP TABLE IF EXISTS `transactionlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactionlogs` (
  `logID` int(11) NOT NULL AUTO_INCREMENT,
  `transactionID` int(11) NOT NULL,
  `dateLogged` datetime NOT NULL,
  `personelID` int(11) NOT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`logID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionlogs`
--

LOCK TABLES `transactionlogs` WRITE;
/*!40000 ALTER TABLE `transactionlogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactionlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `dateRequested` datetime NOT NULL,
  `dateDue` date NOT NULL,
  `newDateDue` date NOT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `courierBillNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idNumber` varchar(45) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `citizenship` varchar(45) DEFAULT NULL,
  `placeOfBirth` varchar(45) DEFAULT NULL,
  `currentAddress` varchar(100) DEFAULT NULL,
  `phoneNo` varchar(45) DEFAULT NULL,
  `alternatePhoneNo` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `alternateEmail` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `verified` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-20 20:05:08
