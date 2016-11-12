CREATE DATABASE  IF NOT EXISTS `ord` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ord`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: ord
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
  `campusId` int(11) NOT NULL AUTO_INCREMENT,
  `campusName` varchar(45) NOT NULL,
  PRIMARY KEY (`campusId`),
  UNIQUE KEY `campusId_UNIQUE` (`campusId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT,
  `courseAbbrv` varchar(10) NOT NULL,
  `courseName` varchar(100) NOT NULL,
  PRIMARY KEY (`courseId`),
  UNIQUE KEY `courseId_UNIQUE` (`courseId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'WEBAPDE','Web App'),(2,'MACLERN','Machine Learning'),(3,'INTESYS','Intelligent System'),(4,'CCSCAL2','Calculus 2'),(5,'GRAPHIX','Graphics'),(6,'SOFENGG','Software Engineering');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degree` (
  `degreeid` int(11) NOT NULL AUTO_INCREMENT,
  `degreeAbbrv` varchar(10) NOT NULL,
  `campusOfferedId` int(11) NOT NULL,
  `degreeName` varchar(100) NOT NULL,
  `level` char(1) NOT NULL,
  PRIMARY KEY (`degreeid`,`degreeAbbrv`,`campusOfferedId`),
  UNIQUE KEY `degreeid_UNIQUE` (`degreeid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
INSERT INTO `degree` VALUES (1,'CS-ST',1,'Computer Science specializing in Software Technology','1'),(12,'CS-NE',1,'Computer Science specializing in Network Engineering','1'),(13,'CS-CSE',1,'Computer Science specializing in Computer Systems Engineering','1'),(14,'ISJ',1,'Internation Studies major in Jap Stud','1'),(15,'PSY',1,'Psychologoy','1'),(16,'IT',1,'Information Technologies','1'),(17,'INTSYS',1,'tugs tugs','1'),(18,'GAMEDEV',2,'gamedevelopment','1'),(19,'ARCHITEC',3,'Architecture','1'),(20,'FILM',4,'Film','1'),(21,'MSCS',1,'Masters','2'),(22,'PHDPO',1,'Doctorate','3');
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryarea`
--

DROP TABLE IF EXISTS `deliveryarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveryarea` (
  `deliveryAreaId` int(11) NOT NULL AUTO_INCREMENT,
  `areaName` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `daysToDeliver` varchar(45) NOT NULL,
  PRIMARY KEY (`deliveryAreaId`),
  UNIQUE KEY `deliveryAreaId_UNIQUE` (`deliveryAreaId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryarea`
--

LOCK TABLES `deliveryarea` WRITE;
/*!40000 ALTER TABLE `deliveryarea` DISABLE KEYS */;
INSERT INTO `deliveryarea` VALUES (1,'Metro Manila',0,'1'),(2,'Luzon',20,'1'),(3,'Visayas',50,'2'),(4,'Mindanao',50,'2');
/*!40000 ALTER TABLE `deliveryarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `documentId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `weight` float NOT NULL,
  `regularPrice` float DEFAULT NULL,
  `expressPrice` float DEFAULT NULL,
  `maxCopy` int(11) NOT NULL,
  `isAvailable` tinyint(1) NOT NULL DEFAULT '0',
  `forUndergraduate` tinyint(1) NOT NULL DEFAULT '0',
  `forGraduate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`documentId`),
  UNIQUE KEY `id_UNIQUE` (`documentId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (1,'Transcript of Records',3,1,150,250,1,1,1,1),(2,'Hotdawg',1,10,999,99999,1,1,1,1),(3,'Shawarma',2,10,10,12,10,1,1,0),(4,'Corndog',4,999,9999,999999,1,1,0,1),(5,'CheesKnorr',3,10,20,100,1,0,1,1);
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentcategory`
--

DROP TABLE IF EXISTS `documentcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentcategory` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `documentCategoryId_UNIQUE` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentcategory`
--

LOCK TABLES `documentcategory` WRITE;
/*!40000 ALTER TABLE `documentcategory` DISABLE KEYS */;
INSERT INTO `documentcategory` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E');
/*!40000 ALTER TABLE `documentcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailinginfo`
--

DROP TABLE IF EXISTS `mailinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailinginfo` (
  `mailingId` int(11) NOT NULL AUTO_INCREMENT,
  `studentInfoId` int(11) NOT NULL,
  `mailingAddress` varchar(200) NOT NULL,
  `zipCode` int(11) NOT NULL,
  `deliveryAreaId` int(11) NOT NULL,
  `contactNo` varchar(20) NOT NULL,
  PRIMARY KEY (`mailingId`),
  UNIQUE KEY `mailingId_UNIQUE` (`mailingId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailinginfo`
--

LOCK TABLES `mailinginfo` WRITE;
/*!40000 ALTER TABLE `mailinginfo` DISABLE KEYS */;
INSERT INTO `mailinginfo` VALUES (1,1,'Blk 22 Lot 22 Corndog',1747,1,'09272707318'),(2,2,'FIEOJ 22. 2oko',1747,2,'9111111'),(3,3,'Tapat ng Ate Rica\'s',1740,3,'8328'),(4,4,'Jollibee',8700,4,'8700');
/*!40000 ALTER TABLE `mailinginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordercoursedesc`
--

DROP TABLE IF EXISTS `ordercoursedesc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordercoursedesc` (
  `orderCourseDescId` int(11) NOT NULL AUTO_INCREMENT,
  `referenceNo` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  PRIMARY KEY (`orderCourseDescId`),
  UNIQUE KEY `orderCourseDescId_UNIQUE` (`orderCourseDescId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordercoursedesc`
--

LOCK TABLES `ordercoursedesc` WRITE;
/*!40000 ALTER TABLE `ordercoursedesc` DISABLE KEYS */;
INSERT INTO `ordercoursedesc` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6);
/*!40000 ALTER TABLE `ordercoursedesc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `dtsNo` int(11) NOT NULL AUTO_INCREMENT,
  `referenceNo` int(11) NOT NULL,
  `documentId` int(11) NOT NULL,
  `mailingId` int(11) NOT NULL,
  `noOfCopies` int(11) NOT NULL,
  `packaging` tinyint(1) NOT NULL,
  `orderType` tinyint(1) NOT NULL,
  `specificationTerm` tinyint(1) DEFAULT NULL,
  `specificationYear` year(4) DEFAULT NULL,
  PRIMARY KEY (`dtsNo`),
  UNIQUE KEY `dtsNo_UNIQUE` (`dtsNo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,1,1,1,1,0,1,1,2016),(2,4,2,2,1,1,1,2,2015),(3,5,3,3,2,2,0,3,2014),(4,2,5,4,10,0,0,1,2017),(5,3,4,1,999,2,1,1,2014);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderlist` (
  `referenceNo` int(11) NOT NULL AUTO_INCREMENT,
  `transactionDate` datetime NOT NULL,
  `dateDue` date NOT NULL,
  `courierBillNumber` int(11) DEFAULT NULL,
  `dateReleased` date DEFAULT NULL,
  `newDateDue` date DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`referenceNo`),
  UNIQUE KEY `referenceNo_UNIQUE` (`referenceNo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (1,'2016-11-12 00:00:00','2016-11-15',91111,NULL,NULL,NULL),(2,'2016-11-10 00:00:00','2016-11-13',91111,NULL,NULL,NULL),(3,'2016-11-11 00:00:00','2016-11-12',91111,'2016-11-13','2016-11-13','Typo'),(4,'2016-11-09 00:00:00','2016-11-15',91111,'2016-11-16','2016-11-20',NULL),(5,'2016-11-12 00:00:00','2016-11-12',8700,'2016-11-12',NULL,NULL);
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderstatus` (
  `orderStatusId` int(11) NOT NULL AUTO_INCREMENT,
  `referenceNo` int(11) NOT NULL,
  `dateLogged` datetime NOT NULL,
  `personelInCharge` int(11) NOT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`orderStatusId`),
  UNIQUE KEY `orderStatusId_UNIQUE` (`orderStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,2,'2016-11-12 00:00:00',1,'SIR BRIANE IS LOVE, SIR BRIANE IS TAKING A WHILE.');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personel`
--

DROP TABLE IF EXISTS `personel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personel` (
  `personelId` int(11) NOT NULL AUTO_INCREMENT,
  `lastName` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  PRIMARY KEY (`personelId`),
  UNIQUE KEY `personelId_UNIQUE` (`personelId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personel`
--

LOCK TABLES `personel` WRITE;
/*!40000 ALTER TABLE `personel` DISABLE KEYS */;
INSERT INTO `personel` VALUES (1,'Samson','Briane'),(2,'Penaranda','Brandon'),(3,'Gan','Patrick'),(4,'Reamon','Gelo'),(5,'Nieva','Dyan'),(6,'Ang','Nikolai'),(7,'Abedejos','Jason'),(8,'Venzon','Tyler'),(9,'Abutog','JJ');
/*!40000 ALTER TABLE `personel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentdegree`
--

DROP TABLE IF EXISTS `studentdegree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentdegree` (
  `studentDegreeId` int(11) NOT NULL AUTO_INCREMENT,
  `studentInfoId` int(11) NOT NULL,
  `idNumber` int(8) NOT NULL,
  `degreeId` int(11) NOT NULL,
  `yearAdmitted` year(4) NOT NULL,
  `admittedAs` char(1) NOT NULL,
  PRIMARY KEY (`studentDegreeId`,`studentInfoId`,`idNumber`),
  UNIQUE KEY `studentDegreeId_UNIQUE` (`studentDegreeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentdegree`
--

LOCK TABLES `studentdegree` WRITE;
/*!40000 ALTER TABLE `studentdegree` DISABLE KEYS */;
INSERT INTO `studentdegree` VALUES (1,1,11302968,1,2013,'1'),(2,2,11555555,4,2015,'1'),(3,3,11666666,5,2016,'1');
/*!40000 ALTER TABLE `studentdegree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentinfo`
--

DROP TABLE IF EXISTS `studentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentinfo` (
  `studentInfoId` int(8) NOT NULL AUTO_INCREMENT,
  `lastName` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `middleName` varchar(10) DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `email` varchar(30) NOT NULL,
  `birthDate` date NOT NULL,
  `citizenship` varchar(45) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `highSchoolAttended` varchar(200) NOT NULL,
  `placeOfBirth` varchar(100) NOT NULL,
  PRIMARY KEY (`studentInfoId`),
  UNIQUE KEY `studentInfoId_UNIQUE` (`studentInfoId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentinfo`
--

LOCK TABLES `studentinfo` WRITE;
/*!40000 ALTER TABLE `studentinfo` DISABLE KEYS */;
INSERT INTO `studentinfo` VALUES (1,'Mouse','Mickey','D','M','mickey@gmail.com','1996-10-02','Filipino','Clubhouse','8700','DIDNEY','Disney'),(2,'Duck','Donald','D','M','ddquackers@gmail.com','1996-12-10','Filipino','Clubhouse','8700','DIDNEY','Disney'),(3,'Bee','Jolli','B','M','jbforevs@gmail.com','1990-01-12','Filipino','CantoPls','8700','Mascot Ph','Quezon ');
/*!40000 ALTER TABLE `studentinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-12 23:25:31
