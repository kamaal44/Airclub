-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: airclub
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `tailNumber` varchar(45) DEFAULT NULL,
  `sectionID` int(11) NOT NULL,
  `timeFlown` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_aircraft_section1_idx` (`sectionID`),
  CONSTRAINT `fk_aircraft_section1` FOREIGN KEY (`sectionID`) REFERENCES `section` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'Cessna 172','SP-ARK',1,3052),(2,'Grumman Cheetah','N26297',1,5249),(3,'Piper Twin Comanche','N329P',1,627.9),(4,'Bocian','SP-3236',2,8128.2),(5,'Puchacz','SP-2821',2,14507.5),(6,'Pirat','SP-2241',2,824.2),(7,'Junior','SP-3304',2,286),(8,'Robinson R-22','SP-423',4,342.3);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airports` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(4) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airports`
--

LOCK TABLES `airports` WRITE;
/*!40000 ALTER TABLE `airports` DISABLE KEYS */;
INSERT INTO `airports` VALUES (1,'EPLL','Łódź','Poland'),(2,'EPPK','Kobylnica','Poland'),(3,'KRBD','Dallas','USA'),(4,'KLNC','Lancaster','USA'),(5,'EDDF','Frankfurt','Germany'),(6,'LEPA','Palma de Mallorca','Spain'),(7,'EPLU','Lubin','Poland'),(8,'EGLL','London','UK');
/*!40000 ALTER TABLE `airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fees` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(45) DEFAULT NULL,
  `hourlyFee` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES (1,'instructor',80),(2,'airplane',690),(3,'glider',90),(4,'hot air baloon',470),(5,'helicopter',2200);
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructors` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `totalTime` float DEFAULT NULL,
  `loginID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `loginID` (`loginID`),
  CONSTRAINT `instructors_ibfk_1` FOREIGN KEY (`loginID`) REFERENCES `loginInfo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructors`
--

LOCK TABLES `instructors` WRITE;
/*!40000 ALTER TABLE `instructors` DISABLE KEYS */;
INSERT INTO `instructors` VALUES (1,'Robert','Fox','1970-12-09',492.2,1),(2,'Anna','Kot','1979-10-20',637.9,2),(3,'Michał','Pies','1988-03-12',750.5,3),(4,'Wojtek','Lew','1992-06-30',304.6,4),(5,'Paul','Spears','1966-11-28',3891.3,5),(6,'Arkadiusz','Tulipan','1959-06-23',2683.9,6),(7,'Aleksandra','Osa','1988-05-19',382.4,7),(8,'Aneta','Foka','1979-10-09',219.7,8),(9,'Kamil','Sroka','1974-07-26',3890.4,9);
/*!40000 ALTER TABLE `instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginInfo`
--

DROP TABLE IF EXISTS `loginInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginInfo` (
  `id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `access` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginInfo`
--

LOCK TABLES `loginInfo` WRITE;
/*!40000 ALTER TABLE `loginInfo` DISABLE KEYS */;
INSERT INTO `loginInfo` VALUES (1,'robfox','robfox',1),(2,'annkot','annkot',1),(3,'micpie','micpie',1),(4,'wojlew','wojlew',1),(5,'pauspe','pauspe',1),(6,'arktul','arktul',1),(7,'aleosa','aleosa',1),(8,'anefok','anefok',1),(9,'kamsro','kamsro',1),(10,'piodab','piodab',0),(11,'kampap','kampap',0),(12,'micles','micles',0),(13,'kajszp','kajszp',0),(14,'johdee','johdee',0),(15,'paljez','paljez',0),(16,'karjod','karjod',0),(17,'ameear','ameear',0),(18,'ernwil','ernwil',0),(19,'fabjab','fabjab',0),(20,'jusmag','jusmag',0);
/*!40000 ALTER TABLE `loginInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `flightTime` float DEFAULT NULL,
  `pilotsID` int(11) NOT NULL,
  `instructorsID` int(11) NOT NULL,
  `aircraftID` int(11) NOT NULL,
  `takeOffAirportsID` int(11) NOT NULL,
  `landAirportsID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_logs_pilots1_idx` (`pilotsID`),
  KEY `fk_logs_instructors1_idx` (`instructorsID`),
  KEY `fk_logs_aircraft1_idx` (`aircraftID`),
  KEY `fk_logs_airports1_idx` (`takeOffAirportsID`),
  KEY `fk_logs_airports2_idx` (`landAirportsID`),
  CONSTRAINT `fk_logs_aircraft1` FOREIGN KEY (`aircraftID`) REFERENCES `aircraft` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_logs_airports1` FOREIGN KEY (`takeOffAirportsID`) REFERENCES `airports` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_logs_airports2` FOREIGN KEY (`landAirportsID`) REFERENCES `airports` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_logs_instructors1` FOREIGN KEY (`instructorsID`) REFERENCES `instructors` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_logs_pilots1` FOREIGN KEY (`pilotsID`) REFERENCES `pilots` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'2017-09-01',1.4,3,4,1,5,5),(2,'2017-09-02',2.8,7,9,4,4,4),(3,'2017-09-04',2.1,3,3,2,1,1),(4,'2017-09-05',3,7,1,2,2,2),(5,'2017-09-02',0.8,3,3,2,1,2),(6,'2017-09-07',4.2,3,1,5,3,4),(7,'2017-09-09',2.7,5,5,5,5,5),(8,'2017-09-11',4.1,3,1,5,6,6),(9,'2017-09-14',4.8,2,4,2,3,4),(10,'2017-09-18',2.3,2,1,2,2,1),(15,'2017-09-20',1,1,1,2,2,2),(16,'2017-09-22',1,1,1,1,1,1),(18,'2018-03-11',1.1,11,7,1,4,3),(23,'2018-03-12',2.1,8,7,2,3,4),(24,'2018-03-12',1.4,9,4,1,7,7),(25,'2018-03-10',1,2,4,6,3,3),(26,'2018-01-17',3,1,1,4,2,2),(27,'2018-02-01',2.1,4,4,3,8,8),(28,'2018-02-28',1.3,5,5,3,4,4),(29,'2018-03-02',4.2,9,6,2,4,4),(30,'2018-02-03',1.1,3,3,3,2,2);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilots`
--

DROP TABLE IF EXISTS `pilots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilots` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `totalTime` float DEFAULT NULL,
  `loginID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `loginID` (`loginID`),
  CONSTRAINT `pilots_ibfk_1` FOREIGN KEY (`loginID`) REFERENCES `loginInfo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilots`
--

LOCK TABLES `pilots` WRITE;
/*!40000 ALTER TABLE `pilots` DISABLE KEYS */;
INSERT INTO `pilots` VALUES (1,'Piotr','Dąb','1998-07-07',18.7,10),(2,'Kamil','Papryka','1988-09-22',46.3,11),(3,'Michalina','Leszczyna','1991-08-04',1.1,12),(4,'Kaja','Szpak','1987-11-23',458.2,13),(5,'John','Deer','1970-12-12',3477.6,14),(6,'Paloma','Jeż','1989-04-18',63.6,15),(7,'Karol','Jodła','2001-04-26',2.5,16),(8,'Amelia','Earhart','1950-11-24',6682.4,17),(9,'Ernest','Wilk','1979-03-02',33.8,18),(10,'Fabian','Jabłonka','1977-01-03',99.2,19),(11,'Justin','Magnolia','1990-09-30',209.5,20);
/*!40000 ALTER TABLE `pilots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'airplane'),(2,'glider'),(3,'hot air baloon'),(4,'helicopter');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vcurrent_pilots`
--

DROP TABLE IF EXISTS `vcurrent_pilots`;
/*!50001 DROP VIEW IF EXISTS `vcurrent_pilots`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vcurrent_pilots` AS SELECT 
 1 AS `ID`,
 1 AS `firstName`,
 1 AS `lastName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vlogs`
--

DROP TABLE IF EXISTS `vlogs`;
/*!50001 DROP VIEW IF EXISTS `vlogs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vlogs` AS SELECT 
 1 AS `Flight ID`,
 1 AS `Date`,
 1 AS `Flight time`,
 1 AS `Pilot`,
 1 AS `Instructor`,
 1 AS `Tail number`,
 1 AS `Take off`,
 1 AS `Landing`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vprices`
--

DROP TABLE IF EXISTS `vprices`;
/*!50001 DROP VIEW IF EXISTS `vprices`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vprices` AS SELECT 
 1 AS `ID`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vcurrent_pilots`
--

/*!50001 DROP VIEW IF EXISTS `vcurrent_pilots`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vcurrent_pilots` AS select distinct `p`.`ID` AS `ID`,`p`.`firstName` AS `firstName`,`p`.`lastName` AS `lastName` from (`pilots` `p` join `logs` `l` on((`l`.`pilotsID` = `p`.`ID`))) where (`l`.`date` > (curdate() - interval 6 month)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vlogs`
--

/*!50001 DROP VIEW IF EXISTS `vlogs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vlogs` AS select `l`.`ID` AS `Flight ID`,`l`.`date` AS `Date`,`l`.`flightTime` AS `Flight time`,`p`.`lastName` AS `Pilot`,`i`.`lastName` AS `Instructor`,`a`.`tailNumber` AS `Tail number`,`ap`.`code` AS `Take off`,`apt`.`code` AS `Landing` from (((((`logs` `l` join `pilots` `p` on((`l`.`pilotsID` = `p`.`ID`))) join `instructors` `i` on((`l`.`instructorsID` = `i`.`ID`))) join `aircraft` `a` on((`l`.`aircraftID` = `a`.`ID`))) join `airports` `ap` on((`l`.`takeOffAirportsID` = `ap`.`ID`))) join `airports` `apt` on((`l`.`landAirportsID` = `apt`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vprices`
--

/*!50001 DROP VIEW IF EXISTS `vprices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vprices` AS select `l`.`ID` AS `ID`,round((`l`.`flightTime` * `f`.`hourlyFee`),2) AS `Price` from (`logs` `l` join `fees` `f`) where (`f`.`service` = (select `s`.`name` from `section` `s` where (`s`.`ID` = (select `a`.`sectionID` from `aircraft` `a` where (`a`.`ID` = `l`.`aircraftID`))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-15 12:39:38
