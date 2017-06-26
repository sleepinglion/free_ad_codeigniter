-- MySQL dump 10.15  Distrib 10.0.19-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	10.0.19-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('02e05bf7240a51bf29c172b4d108bf6e3478c700','::1',1435883779,''),('241387aaaeef54346719fc7b8e2ab36df1d79962','::1',1437038383,''),('3184c895a1dc14a3563fa6bf38f35bba19eacb1d','::1',1435298894,'__ci_last_regenerate|i:1435298894;'),('41789297714e711556ed097c8ebb306dc68f5a06','::1',1435213702,''),('4997e775e417cf98739664a3d2d79a7184bc1875','::1',1437385746,'__ci_last_regenerate|i:1437379390;user_id|s:2:\"32\";nickname|s:12:\"235123512351\";admin|s:1:\"1\";'),('4b066c796ef6869cccc54740a9d53da1bc856795','::1',1437370706,''),('58df8b68029c993479630171f45ba4d0e0643809','::1',1435026566,''),('5cf08f53e49e151c7e88c31e086024f643b1afe0','::1',1435298316,'__ci_last_regenerate|i:1435297240;'),('62ae359c57021e25b7d2857c09920e4014ba02b5','::1',1437091339,''),('63933f2e0b6dc3916ebf8def6a1fc6f0e2ec58f9','::1',1437452799,'__ci_last_regenerate|i:1437439374;user_id|s:2:\"32\";nickname|s:12:\"235123512351\";admin|s:1:\"1\";'),('6a405a847fc267c15ad341412b849a923ccf8123','::1',1435036091,''),('81de4cb03eb1b5f454773cfb49ceb253063f38ca','::1',1436831342,''),('830a1f8ce6cc76936972ba80f4d295dad5d434ae','::1',1437356090,'__ci_last_regenerate|i:1437353105;user_id|s:2:\"32\";nickname|s:12:\"235123512351\";admin|s:1:\"1\";'),('83412202a1e19f36fa50f1eca9b63178ef8c03e4','::1',1436943556,''),('872250a6d111aa45b2f2d6ef395d3dc9945b524f','::1',1435296901,'__ci_last_regenerate|i:1435296901;'),('966b3f62f38c5c55bc48c0338842da35ce35123a','::1',1435294859,'__ci_last_regenerate|i:1435294673;'),('97973d584bab3ff5698a267f4de6f4839906077e','::1',1435285973,''),('9ad6e43e644e3b91101488bd6f591313360d02d3','::1',1435904216,''),('9ec79da84189a2303a821fbe2c537632d457d1d4','::1',1436780411,'__ci_last_regenerate|i:1436780371;user_id|s:2:\"32\";nickname|s:12:\"235123512351\";admin|s:1:\"1\";'),('aac18052b79acbe4345f331efb05af201f52dc6e','::1',1437020592,''),('ab0fc455c0420cc69c9fcc9d8a5ad10af005b00c','::1',1436833380,'__ci_last_regenerate|i:1436831881;user_id|s:2:\"32\";nickname|s:12:\"235123512351\";admin|s:1:\"1\";'),('b6d4fffdb35bd0afc55cc765f4a7f5b6112aebab','::1',1435305535,'__ci_last_regenerate|i:1435299952;'),('bc4a9b9fe61b259df82e4e88a55a1ba05b6cbfe2','::1',1435309352,'__ci_last_regenerate|i:1435306055;'),('bcd57336a5aa9f1594fee20c078fa9f0fc57b3bc','::1',1435298331,'__ci_last_regenerate|i:1435298326;'),('d3c547ea345175ced36d9524e7fd1440f067d5a3','127.0.0.1',1434961861,''),('d713424d792430a738672725b28e2ec3fe090d6a','::1',1435305788,'__ci_last_regenerate|i:1435305558;');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `recommend_count` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (2,32,'3462346','','',1,2,0,6,'2015-06-19 13:13:43',NULL),(3,32,'12351235','','',1,2,0,0,'2015-06-19 15:25:54',NULL),(4,32,'123512','','',1,2,0,0,'2015-06-19 15:29:18',NULL),(5,32,'23151235','','',1,2,0,0,'2015-06-19 15:40:02',NULL),(6,32,'23451235','','',1,2,1,0,'2015-06-22 14:46:34',NULL),(7,32,'12361236','','',1,2,0,0,'2015-06-22 14:46:43',NULL),(8,32,'2346t12346','','',1,2,1,0,'2015-06-22 14:50:03',NULL),(9,32,'1234561236','','',1,2,0,1,'2015-06-22 14:50:09',NULL),(10,32,'1235235','','',1,2,0,0,'2015-06-22 14:50:17',NULL),(11,32,'21351235','','',1,2,0,0,'2015-06-22 14:50:33',NULL),(12,32,'21356123','','',1,2,0,2,'2015-06-22 14:50:40',NULL),(13,32,'21351236','','',1,0,0,0,'2015-07-20 16:23:19',NULL),(14,32,'12361236','','',1,1,1,0,'2015-07-20 16:23:34',NULL),(15,32,'1235235','1236','3905c1a76ecf786f97705f82867e14aa.jpeg',1,1,0,0,'2015-07-20 16:37:02',NULL),(16,32,'1235235','1236','193b021756dd62aeebf7c6b5e039a085.jpeg',1,1,0,0,'2015-07-20 16:38:06',NULL),(17,32,'1235235','1236','d9bbe1aedd0b439f3a60dca565f8381a.jpeg',1,1,0,0,'2015-07-20 16:38:33',NULL),(18,32,'1235235','1236','b82d40b26eb7644f433f85c40a2e9942.jpeg',1,1,1,0,'2015-07-20 16:38:51',NULL),(19,32,'123512352135','2351235123523','b2290f6e7a5f89383b966726024e9cc1.jpg',1,1,1,0,'2015-07-20 16:46:44',NULL),(20,32,'12361236','12361236236','a4777aa37bab66c589045a7bfb44a346.jpeg',1,1,1,0,'2015-07-21 11:24:44',NULL),(21,32,'213451235','waerhaweh','',1,0,0,0,'2015-07-21 12:50:40',NULL),(23,32,'23651236','12361236','',1,0,0,0,'2015-07-21 13:04:14',NULL),(24,32,'12361236','23t235125','',1,0,0,0,'2015-07-21 13:06:18',NULL),(25,32,'12361236','23t235125','',1,0,0,0,'2015-07-21 13:06:45',NULL),(26,32,'12351235','1236','',1,1,0,0,'2015-07-21 13:15:58',NULL);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_categories`
--

DROP TABLE IF EXISTS `article_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_categories`
--

LOCK TABLES `article_categories` WRITE;
/*!40000 ALTER TABLE `article_categories` DISABLE KEYS */;
INSERT INTO `article_categories` VALUES (1,'픽공유',1,'2015-03-25 13:26:01'),(2,'라인업 / 직관',1,'2015-03-25 13:26:01'),(3,'자유',1,'2015-03-25 13:28:18'),(4,'유머',1,'2015-03-25 13:28:18'),(5,'포토',1,'2015-03-25 13:28:41'),(6,'감동',1,'2015-03-25 13:28:41');
/*!40000 ALTER TABLE `article_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_comment_comments`
--

DROP TABLE IF EXISTS `article_comment_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_comment_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_comment_id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `board_id` (`article_comment_id`),
  KEY `poll_id` (`poll_id`),
  CONSTRAINT `article_comment_comments_ibfk_1` FOREIGN KEY (`article_comment_id`) REFERENCES `article_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_comment_comments`
--

LOCK TABLES `article_comment_comments` WRITE;
/*!40000 ALTER TABLE `article_comment_comments` DISABLE KEYS */;
INSERT INTO `article_comment_comments` VALUES (1,3,4,32,'2346234623462347','2015-06-19 14:40:41'),(2,2,5,32,'234623463246','2015-06-19 14:40:48'),(3,2,5,32,'2346246236','2015-06-19 14:40:56');
/*!40000 ALTER TABLE `article_comment_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_comments`
--

DROP TABLE IF EXISTS `article_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `agree` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `poll_id` (`poll_id`),
  KEY `poll_article_id` (`article_id`),
  CONSTRAINT `article_comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `article_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `article_comments_ibfk_3` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_comments`
--

LOCK TABLES `article_comments` WRITE;
/*!40000 ALTER TABLE `article_comments` DISABLE KEYS */;
INSERT INTO `article_comments` VALUES (1,2,5,32,'1235123523',0,'2015-06-19 13:39:25'),(2,2,5,32,'23463246',0,'2015-06-19 14:00:10'),(3,2,6,32,'12351235',0,'2015-06-19 14:00:14'),(4,12,27,32,'12351236',0,'2015-06-22 15:00:02'),(5,12,28,32,'12351236',0,'2015-06-22 15:00:11'),(6,9,21,32,'3462347',0,'2015-06-22 15:58:56');
/*!40000 ALTER TABLE `article_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_contents`
--

DROP TABLE IF EXISTS `article_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_contents` (
  `id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `article_contents_ibfk_1` FOREIGN KEY (`id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_contents`
--

LOCK TABLES `article_contents` WRITE;
/*!40000 ALTER TABLE `article_contents` DISABLE KEYS */;
INSERT INTO `article_contents` VALUES (2,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>reywer</p>\r\n\r\n<p>ewcyw</p>\r\n\r\n<p>ryweryhwxdreh</p>\r\n</body>\r\n</html>\r\n'),(3,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p><img alt=\"\" src=\"/uploads/ckeditor/55b5646df43b915edafd5ee35fa650a0.jpeg\" style=\"width: 284px; height: 177px;\" /></p>\r\n\r\n<p>1235</p>\r\n\r\n<p>1235</p>\r\n\r\n<p>1235</p>\r\n\r\n<p>123</p>\r\n\r\n<p>512351235</p>\r\n</body>\r\n</html>\r\n'),(4,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p><img alt=\"\" src=\"/uploads/ckeditor/68da552e3304703228021b688af90dfe.jpeg\" style=\"width: 284px; height: 177px;\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>53213</p>\r\n\r\n<p>512</p>\r\n\r\n<p>35</p>\r\n\r\n<p>1235</p>\r\n\r\n<p>12</p>\r\n\r\n<p>35235325</p>\r\n</body>\r\n</html>\r\n'),(5,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p><img alt=\"\" src=\"/uploads/ckeditor/7e21d849a20eae3b55f7366df0ea1b51.jpg\" style=\"width: 204px; height: 204px;\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/ckeditor/5064452e694a8b88203915a0d04ce4e0.jpeg\" style=\"width: 284px; height: 177px;\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>235</p>\r\n\r\n<p>1235</p>\r\n\r\n<p>1235</p>\r\n\r\n<p>12</p>\r\n\r\n<p>351235</p>\r\n</body>\r\n</html>\r\n'),(6,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>123461236236</p>\r\n</body>\r\n</html>\r\n'),(7,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>2351235</p>\r\n</body>\r\n</html>\r\n'),(8,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>12361236</p>\r\n</body>\r\n</html>\r\n'),(9,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>236236</p>\r\n</body>\r\n</html>\r\n'),(10,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>23651236</p>\r\n</body>\r\n</html>\r\n'),(11,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>12361236</p>\r\n</body>\r\n</html>\r\n'),(12,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>61235123</p>\r\n</body>\r\n</html>\r\n'),(13,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>3612361236</p>\r\n</body>\r\n</html>\r\n'),(14,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>61236123</p>\r\n</body>\r\n</html>\r\n'),(15,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>51235</p>\r\n</body>\r\n</html>\r\n'),(16,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>51235</p>\r\n</body>\r\n</html>\r\n'),(17,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>51235</p>\r\n</body>\r\n</html>\r\n'),(18,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>51235</p>\r\n</body>\r\n</html>\r\n'),(19,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>2351</p>\r\n</body>\r\n</html>\r\n'),(20,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p><img alt=\"\" src=\"/uploads/ckeditor/700f92f11e02f1e898082510496ae7f7.jpg\" style=\"width: 204px; height: 204px;\" /></p>\r\n\r\n<p>awegawegaweg</p>\r\n</body>\r\n</html>\r\n'),(21,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>awehwerh</p>\r\n</body>\r\n</html>\r\n'),(23,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>1236</p>\r\n</body>\r\n</html>\r\n'),(24,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>12361236</p>\r\n</body>\r\n</html>\r\n'),(25,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>12361236</p>\r\n</body>\r\n</html>\r\n'),(26,'<html>\r\n<head>\r\n	<title></title>\r\n</head>\r\n<body>\r\n<p>12361236</p>\r\n</body>\r\n</html>\r\n');
/*!40000 ALTER TABLE `article_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_logs`
--

DROP TABLE IF EXISTS `article_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `poll_article_id` (`article_id`) USING BTREE,
  CONSTRAINT `article_logs_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_logs`
--

LOCK TABLES `article_logs` WRITE;
/*!40000 ALTER TABLE `article_logs` DISABLE KEYS */;
INSERT INTO `article_logs` VALUES (3,2,32,0,'2015-06-19 13:13:46'),(4,2,32,0,'2015-06-19 13:13:49'),(5,2,32,0,'2015-06-19 13:39:17'),(6,2,32,0,'2015-06-19 13:39:25'),(7,2,32,0,'2015-06-19 14:00:07'),(8,2,32,0,'2015-06-19 14:00:11'),(9,2,32,0,'2015-06-19 14:00:15'),(10,2,32,0,'2015-06-19 14:14:02'),(11,2,32,0,'2015-06-19 14:14:13'),(12,2,NULL,0,'2015-06-19 14:36:26'),(13,2,NULL,0,'2015-06-19 14:40:05'),(14,2,32,0,'2015-06-19 14:40:36'),(15,2,32,0,'2015-06-19 14:40:42'),(16,2,32,0,'2015-06-19 14:40:49'),(17,2,32,0,'2015-06-19 14:40:56'),(18,2,32,0,'2015-06-19 14:42:23'),(19,3,32,0,'2015-06-19 15:25:57'),(20,5,32,0,'2015-06-19 15:40:07'),(21,5,32,0,'2015-06-19 15:40:12'),(22,5,32,0,'2015-06-19 15:46:12'),(23,5,NULL,0,'2015-06-19 16:30:09'),(24,5,NULL,0,'2015-06-19 17:20:45'),(25,4,NULL,0,'2015-06-19 17:21:05'),(26,4,NULL,0,'2015-06-19 17:21:13'),(27,2,NULL,0,'2015-06-19 17:21:16'),(28,3,NULL,0,'2015-06-19 17:21:20'),(29,5,NULL,0,'2015-06-22 09:16:56'),(30,3,NULL,0,'2015-06-22 09:17:01'),(31,2,NULL,0,'2015-06-22 09:17:04'),(32,5,NULL,0,'2015-06-22 09:17:08'),(33,5,NULL,0,'2015-06-22 09:18:43'),(34,4,NULL,0,'2015-06-22 09:18:48'),(35,4,NULL,0,'2015-06-22 09:23:09'),(36,4,NULL,0,'2015-06-22 09:23:12'),(37,5,NULL,0,'2015-06-22 09:26:39'),(38,4,NULL,0,'2015-06-22 09:26:43'),(39,4,NULL,0,'2015-06-22 09:26:46'),(40,5,NULL,0,'2015-06-22 09:36:35'),(41,5,NULL,2130706433,'2015-06-22 09:58:29'),(42,4,NULL,0,'2015-06-22 09:58:48'),(43,5,NULL,0,'2015-06-22 09:59:03'),(44,5,NULL,0,'2015-06-22 09:59:35'),(45,2,NULL,0,'2015-06-22 09:59:40'),(46,4,NULL,0,'2015-06-22 10:02:10'),(47,2,NULL,0,'2015-06-22 10:02:14'),(48,2,NULL,0,'2015-06-22 10:02:17'),(49,5,NULL,0,'2015-06-22 12:42:55'),(50,2,NULL,0,'2015-06-22 13:17:43'),(51,2,NULL,0,'2015-06-22 13:17:43'),(52,5,NULL,0,'2015-06-22 13:42:36'),(53,4,NULL,0,'2015-06-22 14:11:09'),(54,4,NULL,0,'2015-06-22 14:13:20'),(55,5,NULL,2130706433,'2015-06-22 14:38:55'),(56,3,NULL,2130706433,'2015-06-22 14:45:17'),(57,3,NULL,2130706433,'2015-06-22 14:45:59'),(58,3,NULL,2130706433,'2015-06-22 14:46:06'),(59,4,NULL,2130706433,'2015-06-22 14:46:09'),(60,2,32,0,'2015-06-22 14:51:18'),(61,12,32,0,'2015-06-22 14:51:23'),(62,11,32,0,'2015-06-22 14:57:42'),(63,2,32,0,'2015-06-22 14:57:48'),(64,2,32,0,'2015-06-22 14:58:05'),(65,6,32,0,'2015-06-22 14:58:16'),(66,3,32,0,'2015-06-22 14:58:21'),(67,11,32,0,'2015-06-22 14:58:26'),(68,2,32,0,'2015-06-22 14:58:50'),(69,2,32,0,'2015-06-22 14:59:29'),(70,12,32,0,'2015-06-22 15:00:00'),(71,12,32,0,'2015-06-22 15:00:03'),(72,12,32,0,'2015-06-22 15:00:11'),(73,11,32,0,'2015-06-22 15:00:24'),(74,7,32,0,'2015-06-22 15:02:17'),(75,2,32,0,'2015-06-22 15:13:27'),(76,2,32,0,'2015-06-22 15:16:09'),(77,2,32,0,'2015-06-22 15:17:37'),(78,2,32,0,'2015-06-22 15:17:51'),(79,3,32,0,'2015-06-22 15:17:56'),(80,2,32,0,'2015-06-22 15:21:11'),(81,2,32,0,'2015-06-22 15:22:13'),(82,2,32,0,'2015-06-22 15:22:24'),(83,2,32,0,'2015-06-22 15:25:47'),(84,2,32,0,'2015-06-22 15:26:59'),(85,2,32,0,'2015-06-22 15:27:05'),(86,10,32,0,'2015-06-22 15:27:33'),(87,2,32,0,'2015-06-22 15:28:45'),(88,2,32,0,'2015-06-22 15:28:56'),(89,2,32,0,'2015-06-22 15:29:02'),(90,2,32,0,'2015-06-22 15:29:14'),(91,2,32,0,'2015-06-22 15:30:11'),(92,2,32,0,'2015-06-22 15:30:31'),(93,2,32,0,'2015-06-22 15:31:16'),(94,2,32,0,'2015-06-22 15:31:44'),(95,2,32,0,'2015-06-22 15:31:54'),(96,2,32,0,'2015-06-22 15:32:15'),(97,10,32,0,'2015-06-22 15:32:22'),(98,9,32,0,'2015-06-22 15:32:29'),(99,2,32,0,'2015-06-22 15:39:16'),(100,2,32,0,'2015-06-22 15:40:55'),(101,8,32,0,'2015-06-22 15:41:08'),(102,8,32,0,'2015-06-22 15:41:32'),(103,3,32,0,'2015-06-22 15:41:39'),(104,12,32,0,'2015-06-22 15:41:43'),(105,2,32,0,'2015-06-22 15:41:49'),(106,2,32,0,'2015-06-22 15:41:57'),(107,3,32,0,'2015-06-22 15:42:03'),(108,12,32,0,'2015-06-22 15:44:03'),(109,12,32,0,'2015-06-22 15:44:12'),(110,12,32,2130706433,'2015-06-22 15:46:22'),(111,7,32,2130706433,'2015-06-22 15:46:25'),(112,12,32,2130706433,'2015-06-22 15:46:28'),(113,7,32,2130706433,'2015-06-22 15:46:31'),(114,6,32,2130706433,'2015-06-22 15:46:36'),(115,12,32,2130706433,'2015-06-22 15:47:08'),(116,9,32,2130706433,'2015-06-22 15:47:12'),(117,4,32,2130706433,'2015-06-22 15:47:15'),(118,8,32,2130706433,'2015-06-22 15:47:26'),(119,7,32,2130706433,'2015-06-22 15:47:55'),(120,4,32,2130706433,'2015-06-22 15:47:59'),(121,8,32,2130706433,'2015-06-22 15:48:03'),(122,7,32,2130706433,'2015-06-22 15:48:06'),(123,6,32,2130706433,'2015-06-22 15:48:10'),(124,4,32,2130706433,'2015-06-22 15:48:13'),(125,9,32,2130706433,'2015-06-22 15:48:18'),(126,12,32,2130706433,'2015-06-22 15:48:25'),(127,11,NULL,0,'2015-06-22 15:57:05'),(128,2,32,0,'2015-06-22 15:58:43'),(129,9,32,0,'2015-06-22 15:58:53'),(130,9,32,0,'2015-06-22 15:58:57'),(131,11,32,0,'2015-06-22 15:59:17'),(132,12,32,0,'2015-06-22 15:59:23'),(133,10,32,0,'2015-06-22 16:00:01'),(134,10,32,0,'2015-06-22 16:00:05'),(135,7,32,0,'2015-06-22 16:25:08'),(136,11,32,0,'2015-06-22 16:25:15'),(137,12,32,0,'2015-06-22 16:25:22'),(138,3,32,0,'2015-06-22 16:25:26'),(139,12,32,0,'2015-06-22 16:25:39'),(140,12,32,0,'2015-06-22 16:25:43'),(141,8,32,0,'2015-06-22 16:26:56'),(142,6,32,0,'2015-06-22 16:27:00'),(143,9,32,0,'2015-06-22 16:27:13'),(144,12,32,2130706433,'2015-06-22 16:29:04'),(145,2,NULL,2130706433,'2015-06-22 16:29:40'),(146,12,NULL,2130706433,'2015-06-22 16:29:44'),(147,12,NULL,2130706433,'2015-06-22 17:00:07'),(148,2,NULL,2130706433,'2015-06-22 17:00:12'),(149,10,NULL,2130706433,'2015-06-22 17:00:20'),(150,11,NULL,2130706433,'2015-06-22 17:00:23'),(151,3,NULL,2130706433,'2015-06-22 17:00:26'),(152,2,NULL,2130706433,'2015-06-22 17:00:31'),(153,11,NULL,0,'2015-06-22 17:06:45'),(154,12,NULL,0,'2015-06-22 17:06:48'),(155,12,NULL,0,'2015-06-22 17:07:14'),(156,12,NULL,0,'2015-06-25 15:19:46'),(157,11,NULL,0,'2015-06-25 15:19:50'),(158,11,NULL,0,'2015-06-25 15:20:50'),(159,12,NULL,0,'2015-06-26 11:15:11'),(160,11,NULL,0,'2015-06-26 11:16:49'),(161,12,NULL,0,'2015-06-26 11:26:35'),(162,7,NULL,0,'2015-06-26 16:41:41'),(163,12,NULL,0,'2015-06-26 17:10:13'),(164,9,NULL,0,'2015-06-26 17:34:49'),(165,9,NULL,0,'2015-06-26 17:34:53'),(166,12,NULL,0,'2015-06-26 17:34:55'),(167,3,NULL,0,'2015-06-26 17:47:40'),(168,11,NULL,0,'2015-06-26 18:00:13'),(169,11,NULL,0,'2015-07-03 09:36:13'),(170,7,NULL,0,'2015-07-03 09:36:17'),(171,12,32,0,'2015-07-13 18:40:11'),(172,12,NULL,0,'2015-07-16 13:11:15'),(173,12,NULL,0,'2015-07-16 13:11:40'),(174,11,NULL,0,'2015-07-16 13:11:44'),(175,11,NULL,0,'2015-07-16 13:16:06'),(176,11,NULL,0,'2015-07-16 13:23:09'),(177,12,NULL,0,'2015-07-16 16:52:48'),(178,12,NULL,0,'2015-07-16 17:10:01'),(179,11,NULL,0,'2015-07-16 17:10:06'),(180,4,NULL,0,'2015-07-16 17:10:09'),(181,10,NULL,0,'2015-07-16 17:10:14'),(182,12,NULL,0,'2015-07-16 17:10:20'),(183,12,NULL,0,'2015-07-16 17:14:43'),(184,12,NULL,0,'2015-07-16 17:15:03'),(185,12,NULL,0,'2015-07-16 17:15:13'),(186,12,NULL,0,'2015-07-16 18:18:58'),(187,12,NULL,0,'2015-07-16 18:19:02'),(188,12,NULL,0,'2015-07-16 18:19:10'),(189,12,NULL,0,'2015-07-20 09:05:02'),(190,7,NULL,0,'2015-07-20 09:05:07'),(191,12,NULL,0,'2015-07-20 09:08:17'),(192,11,NULL,0,'2015-07-20 09:08:20'),(193,12,NULL,0,'2015-07-20 09:08:44'),(194,12,NULL,0,'2015-07-20 09:08:54'),(195,11,NULL,0,'2015-07-20 09:41:37'),(196,11,NULL,0,'2015-07-20 09:41:46'),(197,10,NULL,0,'2015-07-20 09:41:51'),(198,8,NULL,0,'2015-07-20 09:41:54'),(199,12,32,0,'2015-07-20 15:17:48'),(200,18,32,0,'2015-07-20 16:39:25'),(201,18,32,0,'2015-07-20 16:42:55'),(202,18,32,0,'2015-07-20 16:44:26'),(203,17,32,0,'2015-07-20 16:44:28'),(204,16,32,0,'2015-07-20 16:44:30'),(205,15,32,0,'2015-07-20 16:44:33'),(206,18,32,0,'2015-07-20 16:45:30'),(207,18,32,0,'2015-07-20 16:45:33'),(208,18,32,0,'2015-07-20 16:45:35'),(209,17,32,0,'2015-07-20 16:45:44'),(210,18,32,0,'2015-07-20 16:46:11'),(211,17,32,0,'2015-07-20 16:46:14'),(212,14,32,0,'2015-07-20 16:46:20'),(213,17,32,0,'2015-07-20 16:46:24'),(214,18,32,0,'2015-07-20 16:46:30'),(215,19,32,0,'2015-07-20 16:47:35'),(216,15,32,0,'2015-07-20 16:47:39'),(217,19,32,0,'2015-07-20 16:51:04'),(218,19,32,0,'2015-07-20 16:54:07'),(219,19,32,0,'2015-07-20 17:00:45'),(220,19,32,0,'2015-07-20 17:02:27'),(221,19,32,0,'2015-07-20 17:02:32'),(222,10,32,0,'2015-07-20 17:02:34'),(223,19,32,0,'2015-07-20 17:02:51'),(224,19,32,0,'2015-07-20 17:03:35'),(225,18,32,0,'2015-07-20 17:05:00'),(226,17,32,0,'2015-07-20 17:05:03'),(227,19,32,0,'2015-07-20 17:05:06'),(228,19,32,0,'2015-07-20 17:05:09'),(229,19,32,0,'2015-07-20 17:08:59'),(230,19,32,0,'2015-07-20 17:11:21'),(231,19,32,0,'2015-07-20 17:11:25'),(232,19,32,0,'2015-07-20 17:21:55'),(233,19,32,0,'2015-07-20 17:22:00'),(234,19,32,0,'2015-07-20 17:22:08'),(235,19,32,0,'2015-07-20 17:22:12'),(236,19,32,0,'2015-07-20 17:22:15'),(237,17,32,0,'2015-07-20 17:22:31'),(238,19,32,0,'2015-07-20 17:22:49'),(239,19,32,0,'2015-07-20 17:22:52'),(240,19,32,0,'2015-07-20 17:22:56'),(241,17,32,0,'2015-07-20 17:23:01'),(242,18,32,0,'2015-07-20 17:23:04'),(243,19,32,0,'2015-07-20 17:25:00'),(244,19,32,0,'2015-07-20 17:26:08'),(245,19,32,0,'2015-07-20 17:27:03'),(246,19,32,0,'2015-07-20 17:41:16'),(247,19,32,0,'2015-07-20 17:41:40'),(248,19,32,0,'2015-07-20 17:44:10'),(249,19,32,0,'2015-07-20 17:44:13'),(250,19,32,0,'2015-07-20 17:44:18'),(251,19,32,0,'2015-07-20 17:44:23'),(252,19,32,0,'2015-07-20 17:44:30'),(253,19,32,0,'2015-07-20 17:45:45'),(254,19,32,0,'2015-07-20 17:50:37'),(255,19,32,0,'2015-07-20 17:51:32'),(256,19,32,0,'2015-07-20 17:51:37'),(257,19,32,0,'2015-07-20 17:53:17'),(258,19,32,0,'2015-07-20 17:53:19'),(259,19,32,0,'2015-07-20 18:03:02'),(260,19,32,0,'2015-07-20 18:03:40'),(261,19,32,0,'2015-07-20 18:04:37'),(262,19,32,0,'2015-07-20 18:04:38'),(263,19,32,0,'2015-07-20 18:04:40'),(264,19,32,0,'2015-07-20 18:05:06'),(265,19,32,0,'2015-07-20 18:05:08'),(266,19,32,0,'2015-07-20 18:07:18'),(267,19,32,0,'2015-07-20 18:07:27'),(268,19,32,0,'2015-07-20 18:16:04'),(269,16,32,0,'2015-07-20 18:16:09'),(270,16,32,0,'2015-07-20 18:17:51'),(271,16,32,0,'2015-07-20 18:17:53'),(272,16,32,0,'2015-07-20 18:17:54'),(273,15,32,0,'2015-07-20 18:17:58'),(274,15,32,0,'2015-07-20 18:18:50'),(275,16,32,0,'2015-07-20 18:18:54'),(276,16,32,0,'2015-07-20 18:18:56'),(277,15,32,0,'2015-07-20 18:19:00'),(278,15,32,0,'2015-07-20 18:19:02'),(279,18,32,0,'2015-07-20 18:19:06'),(280,18,32,0,'2015-07-20 18:19:09'),(281,19,32,0,'2015-07-20 18:29:13'),(282,15,32,0,'2015-07-20 18:29:17'),(283,18,32,0,'2015-07-20 18:29:24'),(284,19,32,0,'2015-07-20 18:29:26'),(285,19,32,0,'2015-07-20 18:29:29'),(286,19,32,0,'2015-07-20 18:29:30'),(287,8,32,0,'2015-07-20 18:29:34'),(288,8,32,0,'2015-07-20 18:29:36'),(289,19,32,0,'2015-07-20 18:39:52'),(290,19,32,0,'2015-07-20 18:40:08'),(291,18,32,0,'2015-07-20 18:40:13'),(292,19,32,0,'2015-07-20 18:40:18'),(293,19,32,0,'2015-07-20 18:40:39'),(294,18,32,0,'2015-07-20 18:40:49'),(295,18,32,0,'2015-07-20 18:40:53'),(296,19,32,0,'2015-07-20 18:40:55'),(297,14,32,0,'2015-07-20 18:41:02'),(298,14,32,0,'2015-07-20 18:41:05'),(299,16,32,0,'2015-07-20 18:41:10'),(300,19,32,0,'2015-07-20 18:45:32'),(301,19,32,0,'2015-07-20 18:46:36'),(302,19,32,0,'2015-07-20 18:47:03'),(303,19,32,0,'2015-07-20 18:48:05'),(304,19,32,0,'2015-07-20 18:48:59'),(305,19,NULL,0,'2015-07-21 08:55:46'),(306,19,NULL,0,'2015-07-21 09:16:22'),(307,18,NULL,0,'2015-07-21 09:16:27'),(308,19,NULL,0,'2015-07-21 09:17:38'),(309,19,NULL,0,'2015-07-21 09:20:25'),(310,19,NULL,0,'2015-07-21 09:20:31'),(311,19,NULL,0,'2015-07-21 09:20:40'),(312,19,NULL,0,'2015-07-21 09:20:46'),(313,6,NULL,0,'2015-07-21 09:20:52'),(314,6,NULL,0,'2015-07-21 09:20:54'),(315,19,NULL,0,'2015-07-21 09:21:19'),(316,19,NULL,0,'2015-07-21 09:38:05'),(317,19,NULL,0,'2015-07-21 09:38:14'),(318,19,NULL,0,'2015-07-21 09:38:28'),(319,19,NULL,0,'2015-07-21 09:41:56'),(320,19,NULL,0,'2015-07-21 09:42:43'),(321,20,32,0,'2015-07-21 11:27:47'),(322,20,32,0,'2015-07-21 11:28:14'),(323,20,32,0,'2015-07-21 11:28:52'),(324,20,32,0,'2015-07-21 11:29:10'),(325,20,32,0,'2015-07-21 11:29:29'),(326,20,32,0,'2015-07-21 11:29:39'),(327,20,32,0,'2015-07-21 11:29:52'),(328,19,32,0,'2015-07-21 11:29:56'),(329,20,32,0,'2015-07-21 11:30:06'),(330,20,32,0,'2015-07-21 11:30:42'),(331,19,32,0,'2015-07-21 11:30:49'),(332,19,32,0,'2015-07-21 11:30:52'),(333,19,32,0,'2015-07-21 11:31:02'),(334,20,32,0,'2015-07-21 12:08:16'),(335,20,32,0,'2015-07-21 12:08:48'),(336,20,32,0,'2015-07-21 12:08:54'),(337,20,32,0,'2015-07-21 12:09:23'),(338,20,32,0,'2015-07-21 12:09:25'),(339,20,32,0,'2015-07-21 12:09:34'),(340,26,32,0,'2015-07-21 13:17:34'),(341,26,32,0,'2015-07-21 13:18:59'),(342,26,32,0,'2015-07-21 13:20:11'),(343,26,32,0,'2015-07-21 13:20:14'),(344,26,32,0,'2015-07-21 13:20:16'),(345,26,32,0,'2015-07-21 13:21:05'),(346,26,32,0,'2015-07-21 13:21:56'),(347,26,32,0,'2015-07-21 13:22:17'),(348,26,32,0,'2015-07-21 13:26:07'),(349,26,32,0,'2015-07-21 13:26:12');
/*!40000 ALTER TABLE `article_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_photos`
--

DROP TABLE IF EXISTS `article_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `origin_name` varchar(100) NOT NULL,
  `raw_name` varchar(100) NOT NULL,
  `ext` varchar(10) NOT NULL,
  `size` float NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`) USING BTREE,
  CONSTRAINT `article_photos_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_photos`
--

LOCK TABLES `article_photos` WRITE;
/*!40000 ALTER TABLE `article_photos` DISABLE KEYS */;
INSERT INTO `article_photos` VALUES (1,25,'af4120be8909b0ae720cecc0b4c02450.jpeg','index.jpeg','af4120be8909b0ae720cecc0b4c02450','.jpeg',9.57,284,177,'jpeg'),(2,25,'7d8f83a90ac0ec6efb001fb23b7df3b9.jpg','index.jpg','7d8f83a90ac0ec6efb001fb23b7df3b9','.jpg',9.34,204,204,'jpeg'),(3,26,'ca9f992426b24f935893d5757a24e7a2.jpeg','index.jpeg','ca9f992426b24f935893d5757a24e7a2','.jpeg',9.57,284,177,'jpeg'),(4,26,'8b26d7ba4cf5e3635d6851b527da85f0.jpg','index.jpg','8b26d7ba4cf5e3635d6851b527da85f0','.jpg',9.34,204,204,'jpeg');
/*!40000 ALTER TABLE `article_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_recommend_logs`
--

DROP TABLE IF EXISTS `article_recommend_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_recommend_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `poll_article_id` (`article_id`) USING BTREE,
  CONSTRAINT `article_recommend_logs_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_recommend_logs`
--

LOCK TABLES `article_recommend_logs` WRITE;
/*!40000 ALTER TABLE `article_recommend_logs` DISABLE KEYS */;
INSERT INTO `article_recommend_logs` VALUES (1,19,32,0,'2015-07-21 11:30:52'),(2,20,32,0,'2015-07-21 12:09:25');
/*!40000 ALTER TABLE `article_recommend_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls`
--

DROP TABLE IF EXISTS `polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poll_unique` (`article_id`,`title`),
  KEY `user_id` (`article_id`),
  KEY `poll_article_id` (`article_id`),
  CONSTRAINT `polls_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls`
--

LOCK TABLES `polls` WRITE;
/*!40000 ALTER TABLE `polls` DISABLE KEYS */;
INSERT INTO `polls` VALUES (4,2,'찬성','','',1,1,'2015-06-19 13:13:44',NULL),(5,2,'23462346','','',4,1,'2015-06-19 13:13:44',NULL),(6,2,'반대','','',1,1,'2015-06-19 13:13:44',NULL),(7,3,'찬성','','',0,1,'2015-06-19 15:25:54',NULL),(8,3,'반대','','',0,1,'2015-06-19 15:25:55',NULL),(9,4,'1235235','','',0,1,'2015-06-19 15:29:19',NULL),(10,4,'12351235','','',0,1,'2015-06-19 15:29:19',NULL),(11,4,'반대12351235','','',0,1,'2015-06-19 15:29:19',NULL),(12,5,'찬성','','',0,1,'2015-06-19 15:40:02',NULL),(13,5,'qwetqwet','','',0,1,'2015-06-19 15:40:03',NULL),(14,5,'반대','','',0,1,'2015-06-19 15:40:03',NULL),(15,6,'찬성','','',0,1,'2015-06-22 14:46:35',NULL),(16,6,'반대','','',0,1,'2015-06-22 14:46:35',NULL),(17,7,'찬성','','',0,1,'2015-06-22 14:46:44',NULL),(18,7,'반대','','',0,1,'2015-06-22 14:46:45',NULL),(19,8,'찬성','','',0,1,'2015-06-22 14:50:03',NULL),(20,8,'반대','','',0,1,'2015-06-22 14:50:03',NULL),(21,9,'찬성','','',1,1,'2015-06-22 14:50:10',NULL),(22,9,'반대','','',0,1,'2015-06-22 14:50:10',NULL),(23,10,'찬성','','',0,1,'2015-06-22 14:50:18',NULL),(24,10,'반대','','',0,1,'2015-06-22 14:50:18',NULL),(25,11,'찬성','','',0,1,'2015-06-22 14:50:34',NULL),(26,11,'반대','','',0,1,'2015-06-22 14:50:34',NULL),(27,12,'찬성','','',1,1,'2015-06-22 14:50:41',NULL),(28,12,'반대','','',1,1,'2015-06-22 14:50:41',NULL),(29,13,'찬성','','',0,1,'2015-07-20 16:23:19',NULL),(30,13,'반대','','',0,1,'2015-07-20 16:23:19',NULL),(31,14,'찬성','','',0,1,'2015-07-20 16:23:36',NULL),(32,14,'반대','','',0,1,'2015-07-20 16:23:36',NULL),(33,18,'찬성','','',0,1,'2015-07-20 16:38:51',NULL),(34,18,'반대','','',0,1,'2015-07-20 16:38:51',NULL),(35,19,'찬성','','',0,1,'2015-07-20 16:46:45',NULL),(36,19,'반대','','',0,1,'2015-07-20 16:46:45',NULL),(37,20,'찬성','','',0,1,'2015-07-21 11:24:44',NULL),(38,20,'반대','','',0,1,'2015-07-21 11:24:44',NULL),(41,23,'찬성','','',0,1,'2015-07-21 13:04:15',NULL),(42,23,'반대','','',0,1,'2015-07-21 13:04:15',NULL),(43,25,'찬성','','',0,1,'2015-07-21 13:06:46',NULL),(44,25,'반대','','',0,1,'2015-07-21 13:06:46',NULL),(45,26,'찬성','','',0,1,'2015-07-21 13:15:59',NULL),(46,26,'반대','','',0,1,'2015-07-21 13:15:59',NULL);
/*!40000 ALTER TABLE `polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `context` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggings_idx` (`tag_id`,`taggable_id`,`taggable_type`,`context`,`tagger_id`,`tagger_type`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (1,1,13,'poll_articles',NULL,NULL,'tags','2015-06-03 11:13:15'),(2,2,14,'poll_articles',NULL,NULL,'tags','2015-06-03 11:15:32'),(3,3,14,'poll_articles',NULL,NULL,'tags','2015-06-03 11:15:32'),(4,4,14,'poll_articles',NULL,NULL,'tags','2015-06-03 11:15:32'),(5,5,14,'poll_articles',NULL,NULL,'tags','2015-06-03 11:15:32'),(6,6,15,'poll_articles',NULL,NULL,'tags','2015-06-03 15:34:36'),(7,7,15,'poll_articles',NULL,NULL,'tags','2015-06-03 15:34:36'),(8,8,16,'poll_articles',NULL,NULL,'tags','2015-06-03 15:34:58'),(9,6,17,'poll_articles',NULL,NULL,'tags','2015-06-03 15:35:32'),(10,7,17,'poll_articles',NULL,NULL,'tags','2015-06-03 15:35:32'),(11,6,18,'poll_articles',NULL,NULL,'tags','2015-06-03 15:48:10'),(12,7,18,'poll_articles',NULL,NULL,'tags','2015-06-03 15:48:10'),(13,13,18,'poll_articles',NULL,NULL,'tags','2015-06-03 15:48:10'),(14,5,19,'poll_articles',NULL,NULL,'tags','2015-06-03 16:15:53'),(15,15,20,'poll_communities',NULL,NULL,'tags','2015-06-03 17:13:56'),(16,16,20,'poll_communities',NULL,NULL,'tags','2015-06-03 17:13:56'),(17,16,20,'poll_communities',NULL,NULL,'tags','2015-06-03 17:13:56'),(18,18,20,'poll_communities',NULL,NULL,'tags','2015-06-03 17:13:56'),(19,19,21,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:07'),(20,20,21,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:07'),(21,20,21,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:07'),(22,22,21,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:07'),(23,23,22,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:16'),(24,24,22,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:16'),(25,24,22,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:16'),(26,26,22,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:16'),(27,27,23,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:23'),(28,24,23,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:23'),(29,24,23,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:23'),(30,30,23,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:23'),(31,24,24,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:30'),(32,24,24,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:30'),(33,24,24,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:30'),(34,30,24,'poll_communities',NULL,NULL,'tags','2015-06-03 17:14:30'),(35,31,25,'poll_communities',NULL,NULL,'tags','2015-06-08 15:49:06'),(36,32,26,'poll_communities',NULL,NULL,'tags','2015-06-08 15:56:25'),(37,20,26,'poll_communities',NULL,NULL,'tags','2015-06-08 15:56:25'),(38,20,26,'poll_communities',NULL,NULL,'tags','2015-06-08 15:56:25'),(39,35,26,'poll_communities',NULL,NULL,'tags','2015-06-08 15:56:25'),(40,32,32,'poll_communities',NULL,NULL,'tags','2015-06-08 15:58:37'),(41,20,32,'poll_communities',NULL,NULL,'tags','2015-06-08 15:58:37'),(42,20,32,'poll_communities',NULL,NULL,'tags','2015-06-08 15:58:37'),(43,35,32,'poll_communities',NULL,NULL,'tags','2015-06-08 15:58:37'),(44,40,33,'poll_communities',NULL,NULL,'tags','2015-06-08 15:59:08'),(45,41,33,'poll_communities',NULL,NULL,'tags','2015-06-08 15:59:08'),(46,41,33,'poll_communities',NULL,NULL,'tags','2015-06-08 15:59:08'),(47,43,33,'poll_communities',NULL,NULL,'tags','2015-06-08 15:59:08'),(48,44,34,'poll_communities',NULL,NULL,'tags','2015-06-08 17:03:23'),(49,45,34,'poll_communities',NULL,NULL,'tags','2015-06-08 17:03:23'),(50,45,34,'poll_communities',NULL,NULL,'tags','2015-06-08 17:03:23'),(51,45,34,'poll_communities',NULL,NULL,'tags','2015-06-08 17:03:23'),(52,46,14,'communities',NULL,NULL,'tags',NULL),(53,47,14,'communities',NULL,NULL,'tags',NULL),(54,48,21,'communities',NULL,NULL,'tags',NULL),(55,49,21,'communities',NULL,NULL,'tags',NULL),(56,32,23,'communities',NULL,NULL,'tags',NULL),(57,32,23,'communities',NULL,NULL,'tags',NULL),(58,50,23,'communities',NULL,NULL,'tags',NULL),(59,51,23,'communities',NULL,NULL,'tags',NULL),(60,52,23,'communities',NULL,NULL,'tags',NULL),(61,53,23,'communities',NULL,NULL,'tags',NULL),(62,32,24,'communities',NULL,NULL,'tags',NULL),(63,20,24,'communities',NULL,NULL,'tags',NULL),(64,54,24,'communities',NULL,NULL,'tags',NULL),(65,55,24,'communities',NULL,NULL,'tags',NULL),(66,32,25,'communities',NULL,NULL,'tags',NULL),(67,20,25,'communities',NULL,NULL,'tags',NULL),(68,54,25,'communities',NULL,NULL,'tags',NULL),(69,55,25,'communities',NULL,NULL,'tags',NULL),(70,32,26,'communities',NULL,NULL,'tags',NULL),(71,20,26,'communities',NULL,NULL,'tags',NULL),(72,54,26,'communities',NULL,NULL,'tags',NULL),(73,55,26,'communities',NULL,NULL,'tags',NULL),(74,32,27,'communities',NULL,NULL,'tags',NULL),(75,20,27,'communities',NULL,NULL,'tags',NULL),(76,54,27,'communities',NULL,NULL,'tags',NULL),(77,55,27,'communities',NULL,NULL,'tags',NULL),(78,32,28,'communities',NULL,NULL,'tags',NULL),(79,20,28,'communities',NULL,NULL,'tags',NULL),(80,20,28,'communities',NULL,NULL,'tags',NULL),(81,32,28,'communities',NULL,NULL,'tags',NULL),(82,47,28,'communities',NULL,NULL,'tags',NULL),(83,32,29,'communities',NULL,NULL,'tags',NULL),(84,20,29,'communities',NULL,NULL,'tags',NULL),(85,20,29,'communities',NULL,NULL,'tags',NULL),(86,32,29,'communities',NULL,NULL,'tags',NULL),(87,56,29,'communities',NULL,NULL,'tags',NULL),(88,57,30,'communities',NULL,NULL,'tags',NULL),(89,43,31,'communities',NULL,NULL,'tags',NULL),(90,20,31,'communities',NULL,NULL,'tags',NULL),(91,49,31,'communities',NULL,NULL,'tags',NULL),(92,51,31,'communities',NULL,NULL,'tags',NULL),(93,58,31,'communities',NULL,NULL,'tags',NULL),(94,59,31,'communities',NULL,NULL,'tags',NULL),(95,43,32,'communities',NULL,NULL,'tags',NULL),(96,20,32,'communities',NULL,NULL,'tags',NULL),(97,49,32,'communities',NULL,NULL,'tags',NULL),(98,51,32,'communities',NULL,NULL,'tags',NULL),(99,58,32,'communities',NULL,NULL,'tags',NULL),(100,59,32,'communities',NULL,NULL,'tags',NULL),(101,32,33,'communities',NULL,NULL,'tags',NULL),(102,20,33,'communities',NULL,NULL,'tags',NULL),(103,20,33,'communities',NULL,NULL,'tags',NULL),(104,60,33,'communities',NULL,NULL,'tags',NULL),(105,61,33,'communities',NULL,NULL,'tags',NULL),(106,62,33,'communities',NULL,NULL,'tags',NULL),(107,63,34,'communities',NULL,NULL,'tags',NULL),(108,64,34,'communities',NULL,NULL,'tags',NULL),(109,65,34,'communities',NULL,NULL,'tags',NULL),(110,66,34,'communities',NULL,NULL,'tags',NULL),(111,67,34,'communities',NULL,NULL,'tags',NULL),(112,32,35,'communities',NULL,NULL,'tags',NULL),(113,32,35,'communities',NULL,NULL,'tags',NULL),(114,47,35,'communities',NULL,NULL,'tags',NULL),(115,20,35,'communities',NULL,NULL,'tags',NULL),(116,68,35,'communities',NULL,NULL,'tags',NULL),(117,32,36,'communities',NULL,NULL,'tags',NULL),(118,32,36,'communities',NULL,NULL,'tags',NULL),(119,47,36,'communities',NULL,NULL,'tags',NULL),(120,20,36,'communities',NULL,NULL,'tags',NULL),(121,68,36,'communities',NULL,NULL,'tags',NULL),(122,32,37,'communities',NULL,NULL,'tags',NULL),(123,32,37,'communities',NULL,NULL,'tags',NULL),(124,47,37,'communities',NULL,NULL,'tags',NULL),(125,20,37,'communities',NULL,NULL,'tags',NULL),(126,68,37,'communities',NULL,NULL,'tags',NULL),(127,32,38,'communities',NULL,NULL,'tags',NULL),(128,32,38,'communities',NULL,NULL,'tags',NULL),(129,47,38,'communities',NULL,NULL,'tags',NULL),(130,20,38,'communities',NULL,NULL,'tags',NULL),(131,68,38,'communities',NULL,NULL,'tags',NULL),(132,32,39,'communities',NULL,NULL,'tags',NULL),(133,69,39,'communities',NULL,NULL,'tags',NULL),(134,32,39,'communities',NULL,NULL,'tags',NULL),(135,51,39,'communities',NULL,NULL,'tags',NULL),(136,70,39,'communities',NULL,NULL,'tags',NULL),(137,32,40,'communities',NULL,NULL,'tags',NULL),(138,20,40,'communities',NULL,NULL,'tags',NULL),(139,20,40,'communities',NULL,NULL,'tags',NULL),(140,32,40,'communities',NULL,NULL,'tags',NULL),(141,51,40,'communities',NULL,NULL,'tags',NULL),(142,71,40,'communities',NULL,NULL,'tags',NULL),(143,72,40,'communities',NULL,NULL,'tags',NULL),(144,32,41,'communities',NULL,NULL,'tags',NULL),(145,20,41,'communities',NULL,NULL,'tags',NULL),(146,20,41,'communities',NULL,NULL,'tags',NULL),(147,20,41,'communities',NULL,NULL,'tags',NULL),(148,73,41,'communities',NULL,NULL,'tags',NULL),(149,32,1,'communities',NULL,NULL,'tags',NULL),(150,20,1,'communities',NULL,NULL,'tags',NULL),(151,20,1,'communities',NULL,NULL,'tags',NULL),(152,20,1,'communities',NULL,NULL,'tags',NULL),(153,49,1,'communities',NULL,NULL,'tags',NULL),(154,49,1,'communities',NULL,NULL,'tags',NULL),(155,49,1,'communities',NULL,NULL,'tags',NULL),(156,74,2,'communities',NULL,NULL,'tags',NULL),(157,75,2,'communities',NULL,NULL,'tags',NULL),(158,76,2,'communities',NULL,NULL,'tags',NULL),(159,77,2,'communities',NULL,NULL,'tags',NULL),(160,78,2,'communities',NULL,NULL,'tags',NULL),(161,79,2,'communities',NULL,NULL,'tags',NULL),(162,22,3,'communities',NULL,NULL,'tags',NULL),(163,43,3,'communities',NULL,NULL,'tags',NULL),(164,80,3,'communities',NULL,NULL,'tags',NULL),(165,20,4,'communities',NULL,NULL,'tags',NULL),(166,32,4,'communities',NULL,NULL,'tags',NULL),(167,51,4,'communities',NULL,NULL,'tags',NULL),(168,81,4,'communities',NULL,NULL,'tags',NULL),(169,82,4,'communities',NULL,NULL,'tags',NULL),(170,83,5,'communities',NULL,NULL,'tags',NULL),(171,84,5,'communities',NULL,NULL,'tags',NULL),(172,85,5,'communities',NULL,NULL,'tags',NULL),(173,86,5,'communities',NULL,NULL,'tags',NULL),(174,87,5,'communities',NULL,NULL,'tags',NULL),(175,40,6,'communities',NULL,NULL,'tags',NULL),(176,20,6,'communities',NULL,NULL,'tags',NULL),(177,20,6,'communities',NULL,NULL,'tags',NULL),(178,20,6,'communities',NULL,NULL,'tags',NULL),(179,35,7,'communities',NULL,NULL,'tags',NULL),(180,20,7,'communities',NULL,NULL,'tags',NULL),(181,40,7,'communities',NULL,NULL,'tags',NULL),(182,88,7,'communities',NULL,NULL,'tags',NULL),(183,89,7,'communities',NULL,NULL,'tags',NULL),(184,40,8,'communities',NULL,NULL,'tags',NULL),(185,20,8,'communities',NULL,NULL,'tags',NULL),(186,20,8,'communities',NULL,NULL,'tags',NULL),(187,20,8,'communities',NULL,NULL,'tags',NULL),(188,89,9,'communities',NULL,NULL,'tags',NULL),(189,90,10,'communities',NULL,NULL,'tags',NULL),(190,49,10,'communities',NULL,NULL,'tags',NULL),(191,49,10,'communities',NULL,NULL,'tags',NULL),(192,91,10,'communities',NULL,NULL,'tags',NULL),(193,92,11,'communities',NULL,NULL,'tags',NULL),(194,35,12,'communities',NULL,NULL,'tags',NULL),(195,93,13,'communities',NULL,NULL,'tags',NULL),(196,32,14,'communities',NULL,NULL,'tags',NULL),(197,20,14,'communities',NULL,NULL,'tags',NULL),(198,20,14,'communities',NULL,NULL,'tags',NULL),(199,20,14,'communities',NULL,NULL,'tags',NULL),(200,49,14,'communities',NULL,NULL,'tags',NULL),(201,49,14,'communities',NULL,NULL,'tags',NULL),(202,49,14,'communities',NULL,NULL,'tags',NULL),(203,94,15,'communities',NULL,NULL,'tags',NULL),(204,94,16,'communities',NULL,NULL,'tags',NULL),(205,94,17,'communities',NULL,NULL,'tags',NULL),(206,94,18,'communities',NULL,NULL,'tags',NULL),(207,95,19,'communities',NULL,NULL,'tags',NULL),(208,96,20,'communities',NULL,NULL,'tags',NULL),(209,97,22,'communities',NULL,NULL,'tags',NULL),(210,49,23,'communities',NULL,NULL,'tags',NULL),(211,93,25,'communities',NULL,NULL,'tags',NULL),(212,93,26,'communities',NULL,NULL,'tags',NULL);
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taggings_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (2,'we',1),(3,'tqwet',1),(4,'aegawe',1),(5,'awegaweg',2),(6,'aa',3),(7,'bb',3),(8,'aa.bb',1),(13,'cc',1),(15,'awe',1),(16,'aweg',2),(18,'qewtqt',1),(19,'1241',1),(20,'1235',0),(22,'235',0),(23,'wtwe',1),(24,'qwet',7),(26,'qwetqwey',1),(27,'wqe',1),(30,'qwetqwet',2),(31,'2351251235',1),(32,'123',0),(35,'1235235',0),(40,'12',0),(41,'1234',2),(43,'123512',0),(44,'142',1),(45,'124',3),(46,'m1235',1),(47,'51235',0),(48,'12356',0),(49,'1236',0),(50,'5123',1),(51,'512',0),(52,'31236',1),(53,'126',1),(54,'2135',0),(55,'325',0),(56,'51236',1),(57,'123512362',1),(58,'3612',0),(59,'35123',0),(60,'12351',1),(61,'236',1),(63,'2346234',1),(64,'6234',1),(65,'234',1),(66,'72',1),(67,'34734',1),(68,'346',0),(69,'5235',1),(70,'36126',1),(71,'36',1),(72,'1236236',1),(73,'1236126',1),(74,'345',1),(75,'2346',1),(76,'23471',1),(77,'347',1),(78,'1347',1),(79,'134713426',1),(80,'3512351236',1),(81,'35',1),(82,'2153',1),(83,'etq',1),(84,'qw',1),(85,'etqwe',1),(86,'tqw',1),(87,'asd',1),(88,'351',1),(89,'235235',0),(90,'2352352',1),(91,'26',1),(92,'5555555555',1),(93,'12351235',0),(94,'1235123',0),(95,'123612361236',1),(96,'12351235235',1),(97,'23523',1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL COMMENT '유저 아이디',
  `password` char(100) NOT NULL COMMENT '유저 패스워드',
  `name` varchar(50) NOT NULL COMMENT '유저 이름',
  `nickname` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL COMMENT '가입일',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '업데이트된시간',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COMMENT='회원테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'test@gmail.com','$2a$10$a4e93adaeb36b72baa71buZrG6nHoiviIEi34hzeR5YyRZhAh4kGq','1235123512','','123512351235','.face.icon',0,1,'2015-06-04 10:03:06','0000-00-00 00:00:00'),(8,'test2@gmail.com','$2a$10$2b9cfeeab988ddd734561OECmbG4yKrERpkQRlk4yhLwObha7tgby','213512351','','12351235','.face.icon',0,1,'2015-06-04 17:53:46','0000-00-00 00:00:00'),(15,'test33@sl.net','$2a$10$0ab5b984df6894123b23fO3NtzvLlGLYOcFWYVKsyJJBhVJyzcx2q','1253r235','153123','3612363','',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,'1255@etwa.net','$2a$10$854bafc8b373740516d36OMN/fpS5nDFRUOjG4P.ftw7LnjhkjBHG','12531253','12351235','12361236263','',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,'testweg33@sl.net','$2a$10$866b30953c4eb200a5237uDGVBzQcohLz.oORMuUx2aewS6doPUh.','2351235','12351235','123512353','',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,'test2333@awet.net','$2a$10$ec4b7727a132ebee19105OOLJq9g0ULEfeu4iCsu47gTgoKOBqjLe','23123521351235','2135123','512351235','',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,'32523512@sl.net','$2a$10$05ff506e7cece18f1ef5fOFZtHvnsXhZUP7f0pbtBjNXR.Ph7DDF.','12351235123','612361236','123612365236','',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,'test33513@sl.net','$2a$10$3bdcb09c97ffbb6b3f100uzHqUTEjg0YSiRqjtuL1Z/.jdjKMNIrK','12351236123','1236123612','123612361236','',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,'','$2a$10$df70a781cfcefc182a453ulN0g0.lLRVDXi4fSFDrIWLl78EDVlka','','','','',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,'toughjj23112351235h@gmail.com','$2a$10$904dc7b1e3a4c503f5d3duMUFGW1L4emVRkF.ZU/hiKf7Z3IvCKBO','12351235123','1234612','321361236','8eec12e12f291e5894e2674d21f99cd8.jpeg',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,'test333@sl.net','$2a$10$f6bac2fad71cf0831d0c0uGWw8g1IQ/8jrwVlFBMl8enf6uxUIYNW','12361236123612','1236512362136','123612362316','a4f6205f8c343519dbcb91ba36f675d8.jpeg',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,'test334@sl.net','$2a$10$e0c2bbb17c355f9b4d0f3uvspIeDElW6vbyCxAJbd.yupFnAO9H8C','1351235','123651236','2134612361236','7c769b8874616fd825858e64fc0ac8c9.jpeg',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,'test3334@sl.net','$2a$10$8ca4908b97e76af248095Osvq7SxIJBNqu51ASEM2WAszn6VhJrki','23561236','12351235123','12351236','c6ec5b5e705a56ae20ebe2f9266ed5fc.jpg',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,'test333334@sl.net','$2a$10$5d7a8af21cfb5f6a0520euMwPJ5YnJ5uWFoCrQI0NUdzR3ZdFjkqC','12351236','123561235','12351235235','8a9d9308986b7b90b8d43d3f8a68ebf6.jpg',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,'22222222222222@awet.net','$2a$10$603a17480ebcaf933a10fu21Gp//zoAzNXacQzbm7AZJPY3MlKCeu','21351235','2316512356','1512351235','f5b97c864bc1ff059eca706a64c6d867.jpg',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,'toughjjh@gmail.com','$2a$10$6fd3df6010d5c5c0cf00aOj1h.jNJRNYUd25PRFxdhoxrCkT8WQDW','3251235','235123512351','123512352135','607a259d250fbd1d6dc7492ace110fc4.jpeg',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
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

-- Dump completed on 2015-07-21 13:27:17
