CREATE DATABASE  IF NOT EXISTS `a3lbr` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `a3lbr`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 54.39.105.74    Database: a3lbr
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `faction_ranks`
--

DROP TABLE IF EXISTS `faction_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `faction_ranks` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `fid` int(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `paycheck` int(100) NOT NULL DEFAULT '1000',
  `cap` int(100) NOT NULL DEFAULT '1000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faction_vehicle_shop`
--

DROP TABLE IF EXISTS `faction_vehicle_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `faction_vehicle_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `var` varchar(50) NOT NULL,
  `type` enum('fifr','police','uscg','uscg_h','uscg_b','dmv','faa','doj') NOT NULL,
  `stock` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factions`
--

DROP TABLE IF EXISTS `factions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `factions` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `leader` varchar(17) NOT NULL,
  `type` varchar(50) NOT NULL,
  `max_rank` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `government_balances`
--

DROP TABLE IF EXISTS `government_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `government_balances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `var` varchar(50) DEFAULT NULL,
  `balance` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='Contains balances for government fund and the current tax rates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `government_laws`
--

DROP TABLE IF EXISTS `government_laws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `government_laws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `law` text NOT NULL,
  `added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `houses`
--

DROP TABLE IF EXISTS `houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `houses` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(17) DEFAULT NULL,
  `location` text NOT NULL,
  `pitems` text NOT NULL,
  `vitems` text NOT NULL,
  `furnitures` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `import_export`
--

DROP TABLE IF EXISTS `import_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `import_export` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `item` varchar(50) DEFAULT NULL,
  `import` int(25) DEFAULT NULL,
  `export` int(25) DEFAULT NULL,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_admin`
--

DROP TABLE IF EXISTS `logs_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logs_admin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(50) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_anticheat`
--

DROP TABLE IF EXISTS `logs_anticheat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logs_anticheat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_chat`
--

DROP TABLE IF EXISTS `logs_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logs_chat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext,
  `steamid` tinytext,
  `chatmessage` tinytext,
  `messageinfo` varchar(500) DEFAULT '[``,`#ed7202`,`#B5B5B5`]',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_debug`
--

DROP TABLE IF EXISTS `logs_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logs_debug` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_events`
--

DROP TABLE IF EXISTS `logs_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logs_events` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_factory`
--

DROP TABLE IF EXISTS `logs_factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logs_factory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `factory` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_misc`
--

DROP TABLE IF EXISTS `logs_misc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logs_misc` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_shop`
--

DROP TABLE IF EXISTS `logs_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logs_shop` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `shop` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `item` varchar(50) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `cashtotal` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `persistent_vars`
--

DROP TABLE IF EXISTS `persistent_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `persistent_vars` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `var` varchar(50) DEFAULT NULL,
  `value` text,
  `pv` tinyint(1) DEFAULT '0',
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `players` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(17) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `age` varchar(3) NOT NULL DEFAULT '',
  `gender` varchar(10) NOT NULL DEFAULT '',
  `cash` int(11) NOT NULL DEFAULT '0',
  `bank` int(11) NOT NULL DEFAULT '0',
  `job` varchar(20) DEFAULT 'unemployed',
  `faction` varchar(20) DEFAULT 'citizen',
  `faction_rank` int(3) NOT NULL DEFAULT '0',
  `licenses` text NOT NULL,
  `gear` text NOT NULL,
  `inventory` text NOT NULL,
  `factory` text NOT NULL,
  `position` varchar(64) NOT NULL DEFAULT '[]',
  `stats` text NOT NULL,
  `jail` int(10) NOT NULL DEFAULT '0',
  `admin` text NOT NULL COMMENT '[`debug`,`spectate`,`players`,`editplayer`,`vehicles`,`cursortarget`,`admintag`,`globalmessage`,`factories`,`mapmarkers`,`mapteleporting`,`twitter`,`createfire`,`removefire`,`mayorvote`]',
  `twitter` varchar(500) NOT NULL DEFAULT '[`\\cauedev.github.io\\twitter\\citizen.paa`,`#ed7202`,`#B5B5B5`,[[`\\cauedev.github.io\\twitter\\citizen.paa`,`Cidadao`]],[[`#B5B5B5`,`Padrao`]]]' COMMENT '[`DIRECTORTAG`,`#fff200`,[[`DIRECTORTAG`,Director`],[`CIVTAG`,`Civ`]],[]]',
  `insert_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `policedatabase`
--

DROP TABLE IF EXISTS `policedatabase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `policedatabase` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `UID` varchar(50) DEFAULT NULL,
  `Actiontype` varchar(50) DEFAULT NULL,
  `Info` varchar(500) DEFAULT NULL,
  `Time` varchar(50) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Amount` mediumint(20) unsigned DEFAULT '0',
  `IssuedBy` varchar(50) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shops` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `shop` varchar(50) NOT NULL DEFAULT 'Shop_Vehicles_Supplies_Vendor',
  `stock` text NOT NULL,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(10) NOT NULL,
  `type` varchar(20) NOT NULL,
  `class` varchar(50) NOT NULL,
  `uid` varchar(17) NOT NULL,
  `garage` tinyint(1) NOT NULL DEFAULT '0',
  `impounded` tinyint(1) NOT NULL DEFAULT '0',
  `fuel` float NOT NULL DEFAULT '1',
  `color` text NOT NULL,
  `tuning` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'a3lbr'
--

--
-- Dumping routines for database 'a3lbr'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-11 10:32:38
