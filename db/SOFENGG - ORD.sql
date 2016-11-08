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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mailinginfo`
--

DROP TABLE IF EXISTS `mailinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailinginfo` (
  `mailingId` int(11) NOT NULL AUTO_INCREMENT,
  `idStudent` int(11) NOT NULL,
  `mailingAddress` varchar(200) NOT NULL,
  `zipCode` int(11) NOT NULL,
  `deliveryAreaId` int(11) NOT NULL,
  `contactNo` varchar(20) NOT NULL,
  PRIMARY KEY (`mailingId`),
  UNIQUE KEY `mailingId_UNIQUE` (`mailingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `referenceNo` int(11) NOT NULL AUTO_INCREMENT,
  `transactionDate` datetime NOT NULL,
  `dateDue` date NOT NULL,
  `courierBillNumber` int(11) DEFAULT NULL,
  `dateReleased` date DEFAULT NULL,
  `newDateDue` date DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`referenceNo`),
  UNIQUE KEY `referenceNo_UNIQUE` (`referenceNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderlist` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `middleName` varchar(100) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-08 23:49:46
