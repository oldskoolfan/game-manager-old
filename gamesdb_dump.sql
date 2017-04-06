CREATE DATABASE  IF NOT EXISTS `gamesdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gamesdb`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: gamesdb
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `game_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `game_title` varchar(100) NOT NULL,
  `release_year` year(4) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT '0',
  `developer_id` int(10) unsigned DEFAULT NULL,
  `system_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `developer_id` (`developer_id`),
  KEY `system_id` (`system_id`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`developer_id`) REFERENCES `game_developer` (`developer_id`),
  CONSTRAINT `game_ibfk_2` FOREIGN KEY (`system_id`) REFERENCES `game_system` (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (16,'super mario bros 3',1990,1,7,6),(18,'zelda',1986,0,7,6);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_category`
--

DROP TABLE IF EXISTS `game_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_category` (
  `game_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`category_id`,`game_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `game_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `game_category_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_category`
--

LOCK TABLES `game_category` WRITE;
/*!40000 ALTER TABLE `game_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_developer`
--

DROP TABLE IF EXISTS `game_developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_developer` (
  `developer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `developer_name` varchar(50) NOT NULL,
  PRIMARY KEY (`developer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_developer`
--

LOCK TABLES `game_developer` WRITE;
/*!40000 ALTER TABLE `game_developer` DISABLE KEYS */;
INSERT INTO `game_developer` VALUES (7,'Nintendo'),(8,'Capcom'),(9,'Konami');
/*!40000 ALTER TABLE `game_developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_system`
--

DROP TABLE IF EXISTS `game_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_system` (
  `system_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system_name` varchar(50) NOT NULL,
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_system`
--

LOCK TABLES `game_system` WRITE;
/*!40000 ALTER TABLE `game_system` DISABLE KEYS */;
INSERT INTO `game_system` VALUES (6,'Nintendo'),(7,'Super Nintendo'),(8,'Genesis');
/*!40000 ALTER TABLE `game_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` char(60) DEFAULT NULL,
  `can_edit` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11,'andrew','2017-04-06 14:06:14','$2y$10$msG5ZWusujUMlsT3sDPhYOUVNdHBL8vkfE4djRghfBJB6PlZDFalS',0),(12,'bob','2017-04-06 15:14:32','$2y$10$4CNjs6Zm616WQ.w4WsVZf.Gt4ZJQ0zhUvw2o2VrRvn09pzQgXPU9a',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-06 13:30:07
