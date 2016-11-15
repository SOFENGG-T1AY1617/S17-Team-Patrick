
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ord
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
  `campusName` varchar(70) NOT NULL,
  PRIMARY KEY (`campusId`),
  UNIQUE KEY `campusId_UNIQUE` (`campusId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campus`
--

LOCK TABLES `campus` WRITE;
/*!40000 ALTER TABLE `campus` DISABLE KEYS */;
INSERT INTO `campus` VALUES (1,'De La Salle University - Manila'),(2,'De La Salle University Science and Technology Complex'),(3,'De La Salle-College of Saint Benilde'),(4,'De La Salle University-Dasmariñas'),(18,'De La Salle Health Sciences Institute'),(19,'De La Salle Araneta University'),(20,'De La Salle Andres Soriano Memorial College'),(21,'De La Salle John Bosco College'),(22,'De La Salle Lipa'),(23,'De La Salle Santiago Zobel School'),(24,'Jaime Hilario Integrated School-La Salle'),(25,'La Salle Academy'),(26,'La Salle College Antipolo'),(27,'La Salle Green Hills'),(28,'La Salle University'),(29,'St. Joseph School-La Salle'),(30,'University of St. La Salle');
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
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
INSERT INTO `degree` VALUES (1,'BSCS-ST',1,'Bachelor of Science in Computer Science with specialization in Software Technology','U'),(2,'BSCS-NE',1,'Bachelor of Science in Computer Science with specialization in Network Engineering','U'),(3,'BSCS-CSE',1,'Bachelor of Science in Computer Science, Major in Computer Systems Engineering','U'),(4,'BSCS-IST',1,'Bachelor of Science in Computer Science with specialization in Instructional Systems Technology','U'),(5,'BSIS',1,'Bachelor of Science in Information System','U'),(6,'BSIT',1,'Bachelor of Science in Information Technology','U'),(7,'BEED-ECED',1,'Bachelor of Elementary Education Major in Early Childhood Eduction ','U'),(8,'BSED-ENGL',1,'Bachelor of Secondary Education Major in English','U'),(9,'BSED-BIO',1,'Bachelor of Secondary Education Major in Biology ','U'),(10,'BSED-CHY',1,'Bachelor of Secondary Education Major in Chemistry ','U'),(11,'BSED-MTH',1,'Bachelor of Secondary Education Major in Mathematics','U'),(12,'BSED-MTH-C',1,'Bachelor of Secondary Education Major in Mathematics with specialization in Computer Applications','U'),(13,'BSED-PHY',1,'Bachelor of Secondary Education Major in Physics','U'),(14,'BSED-PHYSC',1,'Bachelor of Secondary Education Major in Physical Sciences','U'),(15,'ABBHS-OSSD',1,'Bachelor of Arts in Behavioral Sciences major in Organizational and Social Systems Development','U'),(16,'AB-DVS',1,'Bachelor of Arts in Development Studies','U'),(17,'AB-HIS',1,'Bachelor of Arts in History','U'),(18,'ABIS-AMS',1,'Bachelor of Arts in International Studies Major in American Studies','U'),(19,'ABIS-EUS',1,'Bachelor of Arts in International Studies Major in European Studies','U'),(20,'ABIS-JPS',1,'Bachelor of Arts in International Studies Major in Japanese Studies','U'),(21,'AB-ISC',1,'Bachelor of Arts in International Studies Major in Chinese Studies','U'),(22,'AB-LIT',1,'Bachelor of Arts in Literature','U'),(23,'AB-PHS',1,'Bachelor of Arts in Philippine Studies Major in Filipino in Mass Media','U'),(24,'AB-PLS',1,'Bachelor of Arts in Political Science','U'),(25,'AB-CA',1,'Bachelor of Arts in Communication Arts','U'),(26,'AB-OC',1,'Bachelor of Arts in Organizational Communication','U'),(27,'AB-PHL',1,'Bachelor of Arts Major in Philosophy','U'),(28,'AB-PSY',1,'Bachelor of Arts in Psychology','U'),(29,'BSPSY',1,'Bachelor of Science in Psychology','U'),(30,'AB-SA',1,'Bachelor of Arts in Southeast Asian Studies','U'),(31,'BSADV ',1,'Bachelor of Science in Advertising Management','U'),(32,'BSAPC',1,'Bachelor of Science in Applied Corporate Management','U'),(33,'BSA',1,'Bachelor of Science in Accountancy','U'),(34,'BSFIN',1,'Bachelor of Science in Management of Financial Institutions','U'),(35,'BSLGL',1,'Bachelor of Science in Legal Management','U'),(36,'BSMGT',1,'Bachelor of Science in Business Management','U'),(37,'BSMKT',1,'Bachelor of Science in Marketing Management','U'),(38,'BSBCH',1,'Bachelor of Science in Biochemistry','U'),(39,'BSBIO',1,'Bachelor of Science in Biology','U'),(40,'BSCHY',1,'Bachelor of Science in Human Biology','U'),(41,'BSMTH-BAP',1,'Bachelor of Science in Mathematics with specialization in Business Application','U'),(42,'BSSTT',1,'Bachelor of Science in Statistics Major in Actuarial Science','U'),(43,'BSPHY-MS',1,'Bachelor of Science in Physis with specialization in Materials Science','U'),(44,'BSPHY-MI',1,'Bachelor of Science in Physics with specialization in Medical Instrumentation','U'),(45,'BPMPH',1,'Bachelor of Science in Premed Physics','U'),(46,'BSMTH-CAP',1,'Bachelor of Science in Mathematics with specialization in Computer Application','U'),(47,'BSCHE',1,'Bachelor of Science in Chemical Engineering','U'),(48,'BSCE-CTM',1,'Bachelor of Science in Civil Engineering with specialization in Construction Technology','U'),(49,'BSCE-HWR',1,'Bachelor of Science in Civil Engineering with specialization in Hydraulics and Water Resources','U'),(50,'BSCE-STE',1,'Bachelor of Science in Civil Engineering with specialization in Structural Engineering','U'),(51,'BSCE-TRE',1,'Bachelor of Science in Civil Engineering with specialization in Transporation Engineering','U'),(52,'BSCPE',1,'Bachelor of Science in Computer Engineering','U'),(53,'BSECE',1,'Bachelor of Science in Electronics Engineering','U'),(54,'BSIE',1,'Bachelor of Science in Industrial Engineering','U'),(55,'BSIME-IT',1,'BS in Industrial Management Engineering Minor in Information Technology','U'),(56,'BSIME-SM',1,'BS in Industrial Management Engineering Minor in Service Management','U'),(57,'BSMEM-MRE',1,'BS in Manufacturing Engineering and Management with specialization in Mechatronics and Robotics','U'),(58,'BSMEM-BME',1,'BS in Manufacturing Engineering and Management with specialization in Biomedical Engineering','U'),(59,'BSME',1,'BS in Mechanical Engineering w/ concentration in Mechatronics Engineering ','U'),(60,'BSENT',1,'Bachelor of Science in Entrepreneurship','U'),(61,'BSIBS',1,'Bachelor of Science in Interdisciplinary Business Studies','U'),(62,'BSAEC-IE',1,'BS in Applied Economics Major in Industrial Economics','U'),(63,'BSAE-I/ACC',1,'BS in Applied Economics major in Industrial Economics and BS in Accountancy ','U'),(64,'BSAE-I/ADV',1,'BS in Applied Economics major in Industrial Economics and BS in Advertising Management','U'),(65,'BSAE-I/APC',1,'BS in Applied Economics major in Industrial Economics and BS in Applied Corporate Management','U'),(66,'BSAE-I/MGT',1,'BS in Applied Economics major in Industrial Economics and BS in Business Management','U'),(67,'BSAE-I/LGL',1,'BS in Applied Economics major in Industrial Economics and BS in Legal Management','U'),(68,'BSAE-I/FIN',1,'BS in Applied Economics major in Industrial Economics and BS in Management of Financial Institutions','U'),(69,'BSAE-I/MKT',1,'BS in Applied Economics major in Industrial Economics and BS in Market Management','U'),(70,'BSAE-FE',1,'BS in Applied Economics Major in Financial Economics','U'),(71,'BSAE-F/ACC',1,'BS in Applied Economics Major in Financial Economics and BS in Accountancy','U'),(72,'BSAE-F/ADV',1,'BS in Applied Economics Major in Financial Economics and BS in Advertising Management','U'),(73,'BSAE-F/APC',1,'BS in Applied Economics Major in Financial Economics and BS in Applied Corporate Management','U'),(74,'BSAE-F/MGT',1,'BS in Applied Economics Major in Financial Economics and BS in Business Management','U'),(75,'BSAE-F/LGL',1,'BS in Applied Economics Major in Financial Economics and BS in Legal Management','U'),(76,'BSAE-F/FIN',1,'BS in Applied Economics Major in Financial Economics and BS in Management of Financial Institutions','U'),(77,'BSAE-F/MKT',1,'BS in Applied Economics Major in Financial Economics and BS in Marketing Management','U'),(78,'ABECO',1,'Bachelor of Arts Major in Economics','U'),(79,'AB-ECO/BSA',1,'AB Major in Economics and BS in Accountancy','U'),(80,'AB-ECO/ADV',1,'AB Major in Economics and BS in Advertising Management','U'),(81,'AB-ECO/APC',1,'AB Major in Economics and BS in Applied Corporate Management','U'),(82,'AB-ECO/MGT',1,'AB Major in Economics and BS in Business Management','U'),(83,'AB-ECO/LGL',1,'AB Major in Economics and BS in Legal Management','U'),(84,'AB-ECO/FIN',1,'AB Major in Economics and BS in Management of Financial Institutions','U'),(85,'AB-ECO/MKT',1,'AB Major in Economics and BS in Marketing Management','U'),(86,'BSCS-ST-GD',2,'BS in Computer Science with specialization in Software Technology minor in Game Development','U'),(87,'BSCS-NE',2,'BS in Computer Science with specialiaztion in Network Engineering','U'),(88,'BSCS-CSE',2,'BS in Computer Science Major in Computer Systems Engineering','U'),(89,'BSIS',2,'BS in Information System','U'),(90,'BSIT',2,'BS in Information Technology','U'),(91,'BEED-ECED',2,'Bachelor of Elementary Education Major in Early Childhood Eduction ','U'),(92,'BSED-ENGL',2,'Bachelor of Secondary Education Major in English','U'),(93,'BSED-BIO',2,'Bachelor of Secondary Education Major in Biology ','U'),(94,'BSED-CHY',2,'Bachelor of Secondary Education Major in Chemistry ','U'),(95,'BSED-MTH',2,'Bachelor of Secondary Education Major in Mathematics','U'),(96,'BSED-MTH-C',2,'Bachelor of Secondary Education Major in Mathematics with specialization in Computer Applications','U'),(97,'BSED-PHY',2,'Bachelor of Secondary Education Major in Physics','U'),(98,'BSED-PHYSC',2,'Bachelor of Secondary Education Major in Physical Sciences','U'),(99,'ABBHS-OSSD',2,'Bachelor of Arts in Behavioral Sciences major in Organizational and Social Systems Development','U'),(100,'AB-DVS',2,'Bachelor of Arts in Development Studies','U'),(101,'AB-HIS',2,'Bachelor of Arts in History','U'),(102,'ABIS-AMS',2,'Bachelor of Arts in International Studies Major in American Studies','U'),(103,'ABIS-EUS',2,'Bachelor of Arts in International Studies Major in European Studies','U'),(104,'ABIS-JPS',2,'Bachelor of Arts in International Studies Major in Japanese Studies','U'),(105,'AB-ISC',2,'Bachelor of Arts in International Studies Major in Chinese Studies','U'),(106,'AB-LIT',2,'Bachelor of Arts in Literature','U'),(107,'AB-PHS',2,'Bachelor of Arts in Philippine Studies Major in Filipino in Mass Media','U'),(108,'AB-PLS',2,'Bachelor of Arts in Political Science','U'),(109,'AB-CA',2,'Bachelor of Arts in Communication Arts','U'),(110,'AB-OC',2,'Bachelor of Arts in Organizational Communication','U'),(111,'AB-PHL',2,'Bachelor of Arts Major in Philosophy','U'),(112,'AB-PSY',2,'Bachelor of Arts in Psychology','U'),(113,'BSPSY',2,'Bachelor of Science in Psychology','U'),(114,'AB-SA',2,'Bachelor of Arts in Southeast Asian Studies','U'),(115,'BSADV ',2,'Bachelor of Science in Advertising Management','U'),(116,'BSAPC',2,'Bachelor of Science in Applied Corporate Management','U'),(117,'BSA',2,'Bachelor of Science in Accountancy','U'),(118,'BSFIN',2,'Bachelor of Science in Management of Financial Institutions','U'),(119,'BSLGL',2,'Bachelor of Science in Legal Management','U'),(120,'BSMGT',2,'Bachelor of Science in Business Management','U'),(121,'BSMKT',2,'Bachelor of Science in Marketing Management','U'),(122,'BSBCH',2,'Bachelor of Science in Biochemistry','U'),(123,'BSBIO',2,'Bachelor of Science in Biology','U'),(124,'BSCHY',2,'Bachelor of Science in Human Biology','U'),(125,'BSMTH-BAP',2,'Bachelor of Science in Mathematics with specialization in Business Application','U'),(126,'BSSTT',2,'Bachelor of Science in Statistics Major in Actuarial Science','U'),(127,'BSPHY-MS',2,'Bachelor of Science in Physis with specialization in Materials Science','U'),(128,'BSPHY-MI',2,'Bachelor of Science in Physics with specialization in Medical Instrumentation','U'),(129,'BPMPH',2,'Bachelor of Science in Premed Physics','U'),(130,'BSMTH-CAP',2,'Bachelor of Science in Mathematics with specialization in Computer Application','U'),(131,'BSCHE',2,'Bachelor of Science in Chemical Engineering','U'),(132,'BSCE-CTM',2,'Bachelor of Science in Civil Engineering with specialization in Construction Technology','U'),(133,'BSCE-HWR',2,'Bachelor of Science in Civil Engineering with specialization in Hydraulics and Water Resources','U'),(134,'BSCE-STE',2,'Bachelor of Science in Civil Engineering with specialization in Structural Engineering','U'),(135,'BSCE-TRE',2,'Bachelor of Science in Civil Engineering with specialization in Transporation Engineering','U'),(136,'BSCPE',2,'Bachelor of Science in Computer Engineering','U'),(137,'BSECE',2,'Bachelor of Science in Electronics Engineering','U'),(138,'BSIE',2,'Bachelor of Science in Industrial Engineering','U'),(139,'BSIME-IT',2,'BS in Industrial Management Engineering Minor in Information Technology','U'),(140,'BSIME-SM',2,'BS in Industrial Management Engineering Minor in Service Management','U'),(141,'BSMEM-MRE',2,'BS in Manufacturing Engineering and Management with specialization in Mechatronics and Robotics','U'),(142,'BSMEM-BME',2,'BS in Manufacturing Engineering and Management with specialization in Biomedical Engineering','U'),(143,'BSME',2,'BS in Mechanical Engineering w/ concentration in Mechatronics Engineering ','U'),(144,'BSENT',2,'Bachelor of Science in Entrepreneurship','U'),(145,'BSIBS',2,'Bachelor of Science in Interdisciplinary Business Studies','U'),(146,'BSAEC-IE',2,'BS in Applied Economics Major in Industrial Economics','U'),(147,'BSAE-I/ACC',2,'BS in Applied Economics major in Industrial Economics and BS in Accountancy ','U'),(148,'BSAE-I/ADV',2,'BS in Applied Economics major in Industrial Economics and BS in Advertising Management','U'),(149,'BSAE-I/APC',2,'BS in Applied Economics major in Industrial Economics and BS in Applied Corporate Management','U'),(150,'BSAE-I/MGT',2,'BS in Applied Economics major in Industrial Economics and BS in Business Management','U'),(151,'BSAE-I/LGL',2,'BS in Applied Economics major in Industrial Economics and BS in Legal Management','U'),(152,'BSAE-I/FIN',2,'BS in Applied Economics major in Industrial Economics and BS in Management of Financial Institutions','U'),(153,'BSAE-I/MKT',2,'BS in Applied Economics major in Industrial Economics and BS in Market Management','U'),(154,'BSAE-FE',2,'BS in Applied Economics Major in Financial Economics','U'),(155,'BSAE-F/ACC',2,'BS in Applied Economics Major in Financial Economics and BS in Accountancy','U'),(156,'BSAE-F/ADV',2,'BS in Applied Economics Major in Financial Economics and BS in Advertising Management','U'),(157,'BSAE-F/APC',2,'BS in Applied Economics Major in Financial Economics and BS in Applied Corporate Management','U'),(158,'BSAE-F/MGT',2,'BS in Applied Economics Major in Financial Economics and BS in Business Management','U'),(159,'BSAE-F/LGL',2,'BS in Applied Economics Major in Financial Economics and BS in Legal Management','U'),(160,'BSAE-F/FIN',2,'BS in Applied Economics Major in Financial Economics and BS in Management of Financial Institutions','U'),(161,'BSAE-F/MKT',2,'BS in Applied Economics Major in Financial Economics and BS in Marketing Management','U'),(162,'ABECO',2,'Bachelor of Arts Major in Economics','U'),(163,'AB-ECO/BSA',2,'AB Major in Economics and BS in Accountancy','U'),(164,'AB-ECO/ADV',2,'AB Major in Economics and BS in Advertising Management','U'),(165,'AB-ECO/APC',2,'AB Major in Economics and BS in Applied Corporate Management','U'),(166,'AB-ECO/MGT',2,'AB Major in Economics and BS in Business Management','U'),(167,'AB-ECO/LGL',2,'AB Major in Economics and BS in Legal Management','U'),(168,'AB-ECO/FIN',2,'AB Major in Economics and BS in Management of Financial Institutions','U'),(169,'AB-ECO/MKT',2,'AB Major in Economics and BS in Marketing Management','U'),(170,'PhDBUS',1,'Doctor of Philosophy in Business','D'),(171,'MSCF',1,'Master of Science in Computational Finance','M'),(172,'MRIM',1,'Master in Risk and Insurance Management','M'),(173,'MMC',1,'Master of Marketing Communications','M'),(174,'MSA',1,'Master of Science in Accountancy','M'),(175,'MSE',1,'Master of Science in Entrepreneurship','M'),(176,'MSMKT',1,'Master of Science in Marketing','M'),(177,'MSFE',1,'Master of Science in Financial Engineering','M'),(178,'MSIRM',1,'Master of Science in Industrial Relations Management','M'),(179,'DBA',1,'Doctor of Business Administration','D'),(180,'MBA',1,'Master of Business Administration','M'),(181,'DIT',1,'Doctor in Information Technology','D'),(182,'PhDCS',1,'Doctor of Philosophy in Computer Science','D'),(183,'MIT',1,'Master in Information Technology','M'),(184,'MSCS',1,'Master of Science in Computer Science','M'),(185,'MS-IT',1,'Master of Science in Information Technology','M'),(186,'DSEDBIO',1,'Ph.D. in Science Education with specialization in Biology','D'),(187,'DSEDCHE',1,'Ph.D. in Science Education with specialization in Chemistry','D'),(188,'DSEDMAT',1,'Ph.D. in Science Education with specialization in Mathematics','D'),(189,'DSEDPHY',1,'Ph.D. in Science Education with specialization in Physics','D'),(190,'DEPSY',1,'Ph.D. in Educational Psychology','D'),(191,'DCPSY',1,'Ph.D. in Counseling Psychology','D'),(192,'PHDAPL',1,'Ph.D in Applied Linguistics','D'),(193,'DED-ELM',1,'Ph.D in Education, major in Education Leadership and Management','D'),(194,'MACLING',1,'Master of Arts in Counseling','M'),(195,'MAEd-SASM',1,'Master of Arts in Education, major in Student Affairs & Services Management','M'),(196,'MALT',1,'Master of Learning and Teaching','M'),(197,'MSGC',1,'Master of Science in Guidance in Counseling','M'),(198,'MATEL',1,'Master of Arts in Teaching English Language','M'),(199,'MAELED-ESP',1,'Master of Arts in English Language Education with specialization in English for Specific Purposes','M'),(200,'MAELED-SRE',1,'Master of Arts in English Language Education with specialization in Reading Education','M'),(201,'MAELED-SLT',1,'Master of Arts in English Language Education with specialization in Second Language Teaching','M'),(202,'MAEDLM',1,'Master of Arts in Education, major in Educational Leadership and Management','M'),(203,'MED-ECE',1,'Master of Education, major in Educational Leadership and Management','M'),(204,'MAEd-ECE',1,'Master of Arts in Education, major in Early Childhood Education','M'),(205,'MED-EL',1,'Master of Education, major in Early Childhood Education','M'),(206,'MAED-SPED',1,'Master of Arts in Education major in Special Education','M'),(207,'MED-SPED',1,'Master of Education major in Special Education','M'),(208,'NTMEBIO',1,'Master of Education major in Biology','M'),(209,'NTMECHE',1,'Master of Education major in Chemistry','M'),(210,'NTMEMAT',1,'Master of Education major in Mathematics','M'),(211,'NTMEPHY',1,'Master of Education major in Physics','M'),(212,'MEDGSCI',1,'Master in Teaching General Science in Basic Education','M'),(213,'MSTBIO',1,'Master of Science in Teaching major in Biology','M'),(214,'MSTCHE',1,'Master of Science in Teaching major in Chemistry','M'),(215,'MSTMAT',1,'Master of Science in Teaching major in Mathematics','M'),(216,'MSTPHY',1,'Master of Science in Teaching major in Physics','M'),(217,'PHDCHE',1,'Ph.D. in Chemical Engineering','D'),(218,'PHDCE',1,'Ph.D in Civil Engineering','D'),(219,'PHDECE',1,'Ph.D in Electronics and Communications Engineering','D'),(220,'PHDIE',1,'Ph.D in Industrial Engineering','D'),(221,'PHDME',1,'Ph.D in Mechanical Engineering','D'),(222,'MSCHE',1,'Master of Science in Chemical Engineering','M'),(223,'MSEEM',1,'Master of Science in Environmental Engineering and Management','M'),(224,'MSCE',1,'Master of Science in Civil Engineering','M'),(225,'MSECE',1,'Master of Science in Electronics and Communications Engineering','M'),(226,'MSIE',1,'Master of Science in Industrial Engineering','M'),(227,'MSMAE',1,'Master of Science in Manufacturing Engineering','M'),(228,'MSME',1,'Master of Science in Mechanical Engineering','M'),(229,'MECHE',1,'Master of Engineering in Chemical Engineering','M'),(230,'MECE',1,'Master of Engineering in Civil Engineering','M'),(231,'MEEEM',1,'Master of Engineering in Environmental Engineering and Management','M'),(232,'MEECE',1,'Master of Engineering in Electronics and Communications Engineering','M'),(233,'MEIE',1,'Master of Engineering in Industrial Engineering','M'),(234,'MEMEM',1,'Master of Engineering in Manufacturing Engineering and Management','M'),(235,'MEME',1,'Master of Engineering in Mechanical Engineering','M'),(236,'PHDPOLSCI',1,'Doctor of Philosophy in Political Science','D'),(237,'DALANGLIT',1,'Doctor of Arts in Language and Literature, major in Literature','D'),(238,'DFACW',1,'Doctor of Fine Arts in Creative Writing','D'),(239,'DERVED',1,'Doctor of Education, major in Religious and Values Education','D'),(240,'PHDTHEO',1,'Doctor of Philosophy in Applied Theology','D'),(241,'PHDDEVSTUD',1,'Doctor of Philosophy in Development Studies','D'),(242,'PHDLITT',1,'Doctor of Philosophy in Literature','D'),(243,'PHDPHL',1,'Doctor of Philosophy in Philosophy','D'),(244,'PHARFIL',1,'Doctor of Philosophy in Philippine Studies - Language, Culture and Media','D'),(245,'PHDPSY',1,'Doctor of Philosophy in Psychology','D'),(246,'PHDSOC',1,'Doctor of Philosophy in Sociology','D'),(247,'MBEOSD11',1,'MA in Behavioral Science, track in Organization and Social Systems Development','M'),(248,'MBESES11',1,'MA in Behavioral Science, track in Environmental Studies','M'),(249,'MABESC',1,'MA in Behavioral Science','M'),(250,'MACAMS',1,'MA in Communication Major in Applied Media Studies','M'),(251,'MADEPOL',1,'MA in Development Policy','M'),(252,'MAINSEUS',1,'MA in International Studies major in European Studies','M'),(253,'MAPOLSCI',1,'MA in Political Science','M'),(254,'MARELED',1,'MA Major in Religious and Values Education','M'),(255,'NTMERVE',1,'Master of Education Major in Religious and Values Education','M'),(256,'MAHIS',1,'MA in History','M'),(257,'MALANGLIT',1,'MA in Language and Literature, major in Literature','M'),(258,'MPHL',1,'Master in Philosophy','M'),(259,'MFACW',1,'Master in Fine Arts major in Creative Writing','M'),(260,'MSPSY',1,'Master of Science in Psychology','M'),(261,'MAHESOS',1,'Master of Health Social Science','M'),(262,'MAARFIL',1,'Master of Arts in Phil. Studies - Language, Culture, Media','M'),(263,'MA-THEO',1,'Master of Arts in Applied Theology','M'),(264,'NTMTHEO',1,'MA in Applied Theology (non-thesis)','M'),(265,'MENVSOS',1,'Master of Environmental Social Science','M'),(266,'MAASJS',1,'Master of Arts in Asian Studies Major in Japanese Studies','M'),(267,'PHDBIO',1,'Ph.D in Biology','D'),(268,'PHDCHEM',1,'Ph.D in Chemistry','D'),(269,'PHDMATH',1,'Ph.D in Mathematics','D'),(270,'PHDPHY',1,'Ph.D in Physics','D'),(271,'MSBIO',1,'Master of Science in Biology','M'),(272,'MSChem',1,'Master of Science in Chemistry','M'),(273,'MS-ESEM',1,'Master of Science in Environmental Science and Ecosystem Management','M'),(274,'MS-MATH',1,'Master of Science in Mathematics','M'),(275,'MS-PHY',1,'Master of Science in Physics','M'),(276,'MS-STAT',1,'Master of Science in Statistics','M'),(277,'NTMSBIO',1,'Master in Biology','M'),(278,'NTMSCHEM',1,'Master in Chemistry','M'),(279,'NTMSMATH',1,'Master in Mathematics','M'),(280,'NTMSPHY',1,'Master in Physics','M'),(281,'MAAECO',1,'Master in Applied Economics','M'),(282,'MSECO',1,'Master of Science in Economics','M'),(283,'ECO-PHD',1,'Doctor of Philosophy in Economics','D');
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
  `minDaysToDeliver` int(11) NOT NULL,
  `maxDaysToDeliver` int(11) NOT NULL,
  PRIMARY KEY (`deliveryAreaId`),
  UNIQUE KEY `deliveryAreaId_UNIQUE` (`deliveryAreaId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryarea`
--

LOCK TABLES `deliveryarea` WRITE;
/*!40000 ALTER TABLE `deliveryarea` DISABLE KEYS */;
INSERT INTO `deliveryarea` VALUES (1,'Africa',2544,3,4),(2,'Australia',1400,1,2),(3,'Brunei',1200,1,2),(4,'Canada',1650,1,2),(5,'China',1400,2,3),(6,'Europe',2350,3,4),(7,'Fiji Island',2544,3,4),(8,'Guam',2500,2,3),(9,'Hongkong',950,1,2),(10,'Singapore',950,1,2),(11,'Indonesia',1200,1,2),(12,'Malaysia',1200,1,2),(13,'Taiwan',1200,1,2),(14,'Thailand',1200,1,2),(15,'Japan',1200,1,2),(16,'Luzon',128,1,1),(17,'Metro Manila',128,1,1),(18,'Mexico City',2500,1,2),(19,'Middle East',2400,2,3),(20,'Mindanao',158,1,1),(21,'New Zealand',1400,1,2),(22,'Papua New Guinea',2600,2,3),(23,'Pickup - DLSU Manila',0,1,1),(24,'South America',3178,2,3),(25,'South Korea',1200,2,3),(26,'USA',1650,1,2),(27,'Vietnam',1400,1,1),(28,'Visayas',142,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (1,'TOR for Evalutaion',1,10,150,300,2,1,1,1),(2,'TOR for Employment',1,10,150,300,2,1,1,1),(3,'Course Subject Desciption',2,10,110,NULL,2,1,1,1),(4,'Ranking by Degree Program',2,10,110,200,2,1,1,0),(5,'Transcript of Records',3,10,50,NULL,2,1,1,1),(6,'Form 137',3,10,50,NULL,2,1,1,1),(7,'Ranking by College',2,10,110,220,2,1,1,0),(8,'Trimestral Calendar',2,10,110,220,2,1,1,1),(9,'Completion of Academic Units',2,10,110,NULL,2,1,0,1),(10,'Cumulative GPA',2,10,110,220,2,1,1,1),(11,'Deans List',2,10,110,220,2,1,1,0),(12,'Special Credentials',4,10,0,NULL,2,1,1,1);
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
  `studentInfoID` int(11) NOT NULL,
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
INSERT INTO `mailinginfo` VALUES (1,1,'Blk 22 Lot 22 Corndog',1747,1,'09272707318'),(2,2,'FIEOJ 22. 2oko',1747,2,'9111111'),(3,3,'Tapat ng Ate Rica\'s',1740,3,'8328'),(4,3,'Jollibee',8700,4,'8700');
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
  `studentDegreeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`dtsNo`),
  UNIQUE KEY `dtsNo_UNIQUE` (`dtsNo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,1,1,1,1,0,1,1,2016,1),(2,4,2,2,1,1,1,2,2015,2),(3,5,3,3,2,2,0,3,2014,3),(4,2,5,4,10,0,0,1,2017,3),(5,3,4,1,999,2,1,1,2014,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentinfo`
--

LOCK TABLES `studentinfo` WRITE;
/*!40000 ALTER TABLE `studentinfo` DISABLE KEYS */;
INSERT INTO `studentinfo` VALUES (1,'Mouse','Mickey','D','M','mickey@gmail.com','1996-10-02','Filipino','Clubhouse','8700','DIDNEY','Disney'),(2,'Duck','Donald','D','M','ddquackers@gmail.com','1996-12-10','Filipino','Clubhouse','8700','DIDNEY','Disney'),(3,'Bee','Jolli','B','M','jbforevs@gmail.com','1990-01-12','Filipino','CantoPls','8700','Mascot Ph','Quezon '),(4,'ef,we;l,','lmelmf;kl','kmeklfmwel','M','okwoek','2013-12-25','sdwp','okowko','okwoek','okwoek','okowe');
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

-- Dump completed on 2016-11-14 21:46:16
