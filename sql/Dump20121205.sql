CREATE DATABASE  IF NOT EXISTS `chat_app` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `chat_app`;
-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: chat_app
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.04.2

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,13);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `senderId` int(11) DEFAULT NULL,
  `message` text,
  `datecreated` datetime DEFAULT NULL,
  `lastupdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  KEY `senderId` (`senderId`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group_info` (`id`),
  CONSTRAINT `chat_ibfk_3` FOREIGN KEY (`senderId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_info`
--

DROP TABLE IF EXISTS `group_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_info`
--

LOCK TABLES `group_info` WRITE;
/*!40000 ALTER TABLE `group_info` DISABLE KEYS */;
INSERT INTO `group_info` VALUES (3,'geeks'),(4,'hackers'),(2,'love'),(1,'private'),(5,'tech');
/*!40000 ALTER TABLE `group_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_msg`
--

DROP TABLE IF EXISTS `status_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message` (`message`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `status_msg_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_msg`
--

LOCK TABLES `status_msg` WRITE;
/*!40000 ALTER TABLE `status_msg` DISABLE KEYS */;
INSERT INTO `status_msg` VALUES (1,'Busy at work DND',1),(2,'In the depth of winter I finally learned that there was in me an invincible summer.',2),(3,'In order to succeed your desire for success should be greater than your fear of failure.',3),(4,'A successful man is one who can lay a firm foundation with the bricks others have thrown at him.',4),(5,'A life spent making mistakes is not only more honorable; but more useful than a life spent doing nothing.',12),(6,'All life is an experiment. The more experiments you make the better.',13);
/*!40000 ALTER TABLE `status_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `cellPhone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `lastupdated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'stevenw','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bb','Steven','Wells','781-000-0012','swells@fakemail.com','steven_wells.jpg','M','8d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44','2012-10-29 02:58:44'),(2,'jamesk','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bb','James','King','781-000-0001','jking@fakemail.com','james_king.jpg','M','9d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44','2012-10-29 02:58:44'),(3,'juliet','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bb','Julie','Taylor','781-000-0002','jtaylor@fakemail.com','julie_taylor.jpg','F','10d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44','2012-10-29 02:58:44'),(4,'elee','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bb','Eugene','Lee','781-000-0003','elee@fakemail.com','eugene_lee.jpg','M','11d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44','2012-10-29 02:58:44'),(5,'johnw','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bb','John','Williams','781-000-0004','jwilliams@fakemail.com','john_williams.jpg','M','12d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44','2012-10-29 02:58:44'),(6,'raymo','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bb','Ray','Moore','781-000-0005','rmoore@fakemail.com','ray_moore.jpg','M','13d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44','2012-10-29 02:58:44'),(7,'pauljj','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bb','Paul','Jones','781-000-0006','pjones@fakemail.com','paul_jones.jpg','M','14d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44','2012-10-29 02:58:44'),(8,'paulag','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bb','Paula','Gates','781-000-0007','pgates@fakemail.com','paula_gates.jpg','F','15d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44','2012-10-29 02:58:44'),(9,'lisaw','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bb','Lisa','Wong','781-000-0008','lwong@fakemail.com','lisa_wong.jpg','F','16d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44','2012-10-29 02:58:44'),(10,'garyd','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bb','Gary','Donovan','781-000-0009','gdonovan@fakemail.com','gary_donovan.jpg','M','17d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44','2012-10-29 02:58:44'),(11,'kathleenb','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bb','Kathleen','Bryne','781-000-0010','kbyrne@fakemail.com','kathleen_byrne.jpg','F','18d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44','2012-10-29 02:58:44'),(12,'anyjj','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bb','Amy','James','781-000-0011','ajones@fakemail.com','amy_jones.jpg','F','19d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44','2012-10-29 02:58:44'),(13,'ferronrsmith','sha1$vgLpXM1p$ae49e63581951ebc613ff1993f07685420bb','Ferron','Smith','781-000-0013','ferron@fakemail.com','ferron_smith.jpg','M','20d41e5a4-2174-11e2-9b2b-5cac4caa5fae','2012-10-29 02:58:44','2012-10-29 02:58:44');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `user_group_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,1,3),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,3),(7,7,2),(8,8,3),(9,9,4),(10,10,5);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-05 15:08:28
