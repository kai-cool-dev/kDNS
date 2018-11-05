-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 10.0.1.68    Database: kdns
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.11-MariaDB-10.2.11+maria~stretch-log

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
-- Table structure for table `changelog`
--

DROP TABLE IF EXISTS `changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `data` varchar(1024) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changelog`
--

LOCK TABLES `changelog` WRITE;
/*!40000 ALTER TABLE `changelog` DISABLE KEYS */;
INSERT INTO `changelog` VALUES (16,'DELETE','{\"id\":\"304\",\"name\":\"test.pep\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":\"2018-08-14 21:12:36\",\"description\":null}','2018-08-14 21:49:37',5),(18,'CREATE','{\"id\":\"306\",\"name\":\"test.pep\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":null,\"description\":null}','2018-08-14 21:49:51',5),(20,'UPDATED','{\"id\":\"306\",\"name\":\"test.pep\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":\"2018-08-14 21:49:51\",\"description\":\"asdf\"}','2018-08-14 21:50:24',5),(22,'EDITED','{\"id\":\"2590\",\"domain_id\":\"306\",\"name\":\"test.pep\",\"type\":\"SOA\",\"content\":\"ns2.fastnameserver.eu ich.kai.cool 2018081400 86400 7200 3600000 3600\",\"ttl\":\"3600\",\"prio\":null,\"change_date\":1534276227,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-14 21:50:27',5),(24,'EDITED','{\"id\":\"2592\",\"domain_id\":\"306\",\"name\":\"test.pep\",\"type\":\"NS\",\"content\":\"ns2.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1534276235,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-14 21:50:35',5),(26,'EDITED','{\"id\":\"2594\",\"domain_id\":\"306\",\"name\":\"test.pep\",\"type\":\"NS\",\"content\":\"ns1.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1534276240,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-14 21:50:40',5),(28,'DELETE','{\"id\":\"306\",\"name\":\"test.pep\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":\"2018-08-14 21:49:51\",\"description\":\"asdf\"}','2018-08-14 21:50:50',5),(30,'PURGED','{\"id\":\"2590\",\"domain_id\":\"306\",\"name\":\"test.pep\",\"type\":\"SOA\",\"content\":\"ns2.fastnameserver.eu ich.kai.cool 2018081400 86400 7200 3600000 3600\",\"ttl\":\"3600\",\"prio\":null,\"change_date\":\"1534276227\",\"disabled\":\"0\",\"ordername\":null,\"auth\":\"1\"}','2018-08-14 21:50:50',5),(32,'PURGED','{\"id\":\"2592\",\"domain_id\":\"306\",\"name\":\"test.pep\",\"type\":\"NS\",\"content\":\"ns2.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":\"1534276235\",\"disabled\":\"0\",\"ordername\":null,\"auth\":\"1\"}','2018-08-14 21:50:50',5),(34,'PURGED','{\"id\":\"2594\",\"domain_id\":\"306\",\"name\":\"test.pep\",\"type\":\"NS\",\"content\":\"ns1.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":\"1534276240\",\"disabled\":\"0\",\"ordername\":null,\"auth\":\"1\"}','2018-08-14 21:50:50',5),(36,'CREATE','{\"id\":\"308\",\"name\":\"test.pep\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":null,\"description\":\"This is the Test Domain\"}','2018-08-14 22:29:18',5),(38,'EDITED','{\"id\":\"2596\",\"domain_id\":\"308\",\"name\":\"test.pep\",\"type\":\"SOA\",\"content\":\"ns2.fastnameserver.eu ich.kai.cool 2018081400 86400 7200 3600000 3600\",\"ttl\":\"3600\",\"prio\":null,\"change_date\":1534278563,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-14 22:29:23',5),(40,'EDITED','{\"id\":\"2598\",\"domain_id\":\"308\",\"name\":\"test.pep\",\"type\":\"NS\",\"content\":\"ns2.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1534278568,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-14 22:29:28',5),(42,'EDITED','{\"id\":\"2600\",\"domain_id\":\"308\",\"name\":\"test.pep\",\"type\":\"NS\",\"content\":\"ns1.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1534278576,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-14 22:29:36',5),(44,'PURGED','{\"id\":\"2596\",\"domain_id\":null,\"name\":\"test.pep\",\"type\":\"SOA\",\"content\":\"ns2.fastnameserver.eu ich.kai.cool 2018081400 86400 7200 3600000 3600\",\"ttl\":\"3600\",\"prio\":null,\"change_date\":null,\"disabled\":null,\"ordername\":null,\"auth\":null}','2018-08-14 22:29:48',5),(46,'PURGED','{\"id\":\"2598\",\"domain_id\":null,\"name\":\"test.pep\",\"type\":\"NS\",\"content\":\"ns2.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":null,\"change_date\":null,\"disabled\":null,\"ordername\":null,\"auth\":null}','2018-08-14 22:29:52',5),(48,'DELETE','{\"id\":\"308\",\"name\":\"test.pep\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":\"2018-08-14 22:29:18\",\"description\":\"This is the Test Domain\"}','2018-08-14 22:43:00',5),(50,'PURGED','{\"id\":\"2600\",\"domain_id\":\"308\",\"name\":\"test.pep\",\"type\":\"NS\",\"content\":\"ns1.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":\"1534278576\",\"disabled\":\"0\",\"ordername\":null,\"auth\":\"1\"}','2018-08-14 22:43:00',5),(52,'CREATE','{\"id\":\"310\",\"name\":\"test.pep\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":null,\"description\":null}','2018-08-14 22:43:07',5),(54,'EDITED','{\"id\":\"2602\",\"domain_id\":\"310\",\"name\":\"test.pep\",\"type\":\"SOA\",\"content\":\"ns2.fastnameserver.eu ich.kai.cool 2018081400 86400 7200 3600000 3600\",\"ttl\":\"3600\",\"prio\":null,\"change_date\":1534279403,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-14 22:43:23',5),(56,'EDITED','{\"id\":\"2604\",\"domain_id\":\"310\",\"name\":\"test.pep\",\"type\":\"NS\",\"content\":\"ns2.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1534279853,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-14 22:50:53',5),(58,'EDITED','{\"id\":\"2606\",\"domain_id\":\"310\",\"name\":\"test.pep\",\"type\":\"NS\",\"content\":\"ns1.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1534279860,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-14 22:51:00',5),(60,'UPDATED','{\"id\":\"310\",\"name\":\"test.pep\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":\"2018-08-14 22:43:07\",\"description\":\"This is the Test Domain\"}','2018-08-14 22:53:05',5),(62,'EDITED','{\"id\":\"2608\",\"domain_id\":\"310\",\"name\":\"test.pep\",\"type\":\"MX\",\"content\":\"claire.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1534321257,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-15 10:20:57',5),(64,'CREATE','{\"id\":\"312\",\"name\":\"Blah.you\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":null,\"description\":null}','2018-08-23 15:58:09',5),(66,'EDITED','{\"id\":\"2610\",\"domain_id\":\"312\",\"name\":\"Blah.you\",\"type\":\"SOA\",\"content\":\"ns2.fastnameserver.eu ich.kai.cool 2018082300 86400 7200 3600000 3600\",\"ttl\":\"3600\",\"prio\":null,\"change_date\":1535032701,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-23 15:58:22',5),(68,'EDITED','{\"id\":\"2612\",\"domain_id\":\"312\",\"name\":\"Blah.you\",\"type\":\"NS\",\"content\":\"ns2.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1535032712,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-23 15:58:32',5),(70,'EDITED','{\"id\":\"2614\",\"domain_id\":\"312\",\"name\":\"Blah.you\",\"type\":\"NS\",\"content\":\"ns1.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1535032719,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-23 15:58:40',5),(72,'DELETE','{\"id\":\"312\",\"name\":\"Blah.you\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":\"2018-08-23 15:58:09\",\"description\":null}','2018-08-24 22:29:09',5),(74,'PURGED','{\"id\":\"2610\",\"domain_id\":\"312\",\"name\":\"Blah.you\",\"type\":\"SOA\",\"content\":\"ns2.fastnameserver.eu ich.kai.cool 2018082300 86400 7200 3600000 3600\",\"ttl\":\"3600\",\"prio\":null,\"change_date\":\"1535032701\",\"disabled\":\"0\",\"ordername\":null,\"auth\":\"1\"}','2018-08-24 22:29:09',5),(76,'PURGED','{\"id\":\"2612\",\"domain_id\":\"312\",\"name\":\"Blah.you\",\"type\":\"NS\",\"content\":\"ns2.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":\"1535032712\",\"disabled\":\"0\",\"ordername\":null,\"auth\":\"1\"}','2018-08-24 22:29:09',5),(78,'PURGED','{\"id\":\"2614\",\"domain_id\":\"312\",\"name\":\"Blah.you\",\"type\":\"NS\",\"content\":\"ns1.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":\"1535032719\",\"disabled\":\"0\",\"ordername\":null,\"auth\":\"1\"}','2018-08-24 22:29:09',5),(80,'EDITED','{\"id\":\"2616\",\"domain_id\":\"234\",\"name\":\"my.server.pep\",\"type\":\"A\",\"content\":\"10.0.1.70\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1535142932,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-24 22:35:32',5),(82,'EDITED','{\"id\":\"2618\",\"domain_id\":\"234\",\"name\":\"cloud.server.pep\",\"type\":\"A\",\"content\":\"10.0.1.36\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1535280856,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-26 12:54:16',5),(84,'DELETE','{\"id\":\"310\",\"name\":\"test.pep\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":\"2018-08-14 22:43:07\",\"description\":\"This is the Test Domain\"}','2018-08-26 15:14:12',5),(86,'PURGED','{\"id\":\"2602\",\"domain_id\":\"310\",\"name\":\"test.pep\",\"type\":\"SOA\",\"content\":\"ns2.fastnameserver.eu ich.kai.cool 2018081400 86400 7200 3600000 3600\",\"ttl\":\"3600\",\"prio\":null,\"change_date\":\"1534279403\",\"disabled\":\"0\",\"ordername\":null,\"auth\":\"1\"}','2018-08-26 15:14:12',5),(88,'PURGED','{\"id\":\"2604\",\"domain_id\":\"310\",\"name\":\"test.pep\",\"type\":\"NS\",\"content\":\"ns2.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":\"1534279853\",\"disabled\":\"0\",\"ordername\":null,\"auth\":\"1\"}','2018-08-26 15:14:12',5),(90,'PURGED','{\"id\":\"2606\",\"domain_id\":\"310\",\"name\":\"test.pep\",\"type\":\"NS\",\"content\":\"ns1.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":\"1534279860\",\"disabled\":\"0\",\"ordername\":null,\"auth\":\"1\"}','2018-08-26 15:14:12',5),(92,'PURGED','{\"id\":\"2608\",\"domain_id\":\"310\",\"name\":\"test.pep\",\"type\":\"MX\",\"content\":\"claire.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":\"1534321257\",\"disabled\":\"0\",\"ordername\":null,\"auth\":\"1\"}','2018-08-26 15:14:12',5),(94,'EDITED','{\"id\":\"2620\",\"domain_id\":\"234\",\"name\":\"livestream.server.pep\",\"type\":\"A\",\"content\":\"10.0.1.41\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1535310363,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-26 21:06:03',5),(96,'CREATE','{\"id\":\"314\",\"name\":\"blabh.aaa\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":null,\"description\":null}','2018-08-31 17:10:59',5),(98,'DELETE','{\"id\":\"314\",\"name\":\"blabh.aaa\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":\"2018-08-31 17:10:59\",\"description\":null}','2018-08-31 17:12:02',5),(100,'CREATE','{\"id\":\"316\",\"name\":\"free-teamspeak.com\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"12\",\"created\":null,\"description\":\"dopest fucking domain ever lol\"}','2018-08-31 18:40:05',12),(102,'EDITED','{\"id\":\"2622\",\"domain_id\":\"316\",\"name\":\"free-teamspeak.com\",\"type\":\"SOA\",\"content\":\"ns2.fastnameserver.eu rfxmusic.gmail.com 2018083100 86400 7200 3600000 1800\",\"ttl\":\"1800\",\"prio\":null,\"change_date\":1535733660,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-31 18:41:00',12),(104,'EDITED','{\"id\":\"2624\",\"domain_id\":\"316\",\"name\":\"free-teamspeak.com\",\"type\":\"NS\",\"content\":\"ns2.fastnameserver.eu\",\"ttl\":\"1800\",\"prio\":\"10\",\"change_date\":1535733667,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-31 18:41:07',12),(106,'EDITED','{\"id\":\"2626\",\"domain_id\":\"316\",\"name\":\"free-teamspeak.com\",\"type\":\"NS\",\"content\":\"ns1.fastnameserver.eu\",\"ttl\":\"1800\",\"prio\":\"10\",\"change_date\":1535733675,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-08-31 18:41:15',12),(108,'PURGED','{\"id\":\"655\",\"domain_id\":null,\"name\":\"ts.gamingplay.de\",\"type\":\"CNAME\",\"content\":\"_ts3._udp.gamingplay.de\",\"ttl\":\"180\",\"prio\":null,\"change_date\":null,\"disabled\":null,\"ordername\":null,\"auth\":null}','2018-08-31 18:44:46',5),(110,'PURGED','{\"id\":\"652\",\"domain_id\":null,\"name\":\"ts-server.gamingplay.de\",\"type\":\"CNAME\",\"content\":\"alex.fastnameserver.eu\",\"ttl\":\"180\",\"prio\":null,\"change_date\":null,\"disabled\":null,\"ordername\":null,\"auth\":null}','2018-08-31 18:44:56',5),(112,'EDITED','{\"id\":\"2628\",\"domain_id\":\"316\",\"name\":\"free-teamspeak.com\",\"type\":\"A\",\"content\":\"209.250.244.55\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1535972859,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-09-03 13:07:39',5),(114,'EDITED','{\"id\":\"2630\",\"domain_id\":\"316\",\"name\":\"www.free-teamspeak.com\",\"type\":\"CNAME\",\"content\":\"free-teamspeak.com\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1535972875,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-09-03 13:07:56',5),(116,'EDITED','{\"id\":\"2632\",\"domain_id\":\"316\",\"name\":\"www.free-teamspeak.com\",\"type\":\"MX\",\"content\":\"claire.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1535972890,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-09-03 13:08:10',5),(118,'UPDATED','{\"id\":\"212\",\"name\":\"2.168.192.in-addr.arpa\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":\"2018-08-12 10:59:14\",\"description\":\"Home Network\"}','2018-09-03 13:13:43',5),(120,'UPDATED','{\"id\":\"232\",\"name\":\"1.0.10.in-addr.arpa\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":\"2018-08-12 10:59:14\",\"description\":\"Server Network\"}','2018-09-03 13:14:12',5),(122,'EDITED','{\"id\":\"2634\",\"domain_id\":\"316\",\"name\":\"download.free-teamspeak.com\",\"type\":\"A\",\"content\":\"209.250.244.55\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1537479016,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-09-20 23:30:17',5),(124,'EDITED','{\"id\":\"2636\",\"domain_id\":\"316\",\"name\":\"wiki.free-teamspeak.com\",\"type\":\"A\",\"content\":\"209.250.244.55\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1537536173,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-09-21 15:22:53',5),(126,'EDITED','{\"id\":\"2638\",\"domain_id\":\"316\",\"name\":\"support.free-teamspeak.com\",\"type\":\"A\",\"content\":\"5 9987 alex.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1538400743,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-10-01 15:32:48',5),(128,'EDITED','{\"id\":\"2640\",\"domain_id\":\"316\",\"name\":\"support.free-teamspeak.com\",\"type\":\"SRV\",\"content\":\"5 9987 alex.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1538400753,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-10-01 15:32:48',5),(130,'PURGED','{\"id\":\"2638\",\"domain_id\":null,\"name\":\"support.free-teamspeak.com\",\"type\":\"A\",\"content\":\"5 9987 alex.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":null,\"change_date\":null,\"disabled\":null,\"ordername\":null,\"auth\":null}','2018-10-01 15:34:49',5),(132,'PURGED','{\"id\":\"2638\",\"domain_id\":null,\"name\":\"support.free-teamspeak.com\",\"type\":\"A\",\"content\":\"5 9987 alex.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":null,\"change_date\":null,\"disabled\":null,\"ordername\":null,\"auth\":null}','2018-10-01 15:34:53',5),(134,'EDITED','{\"id\":\"2642\",\"domain_id\":\"16\",\"name\":\"monitoring.peppermint.cloud\",\"type\":\"A\",\"content\":\"209.250.244.55\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1538584247,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-10-03 18:30:52',5),(136,'EDITED','{\"id\":\"2644\",\"domain_id\":\"16\",\"name\":\"terminal.peppermint.cloud\",\"type\":\"A\",\"content\":\"95.179.158.233\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1538596651,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-10-03 21:57:31',5),(138,'EDITED','{\"id\":\"2646\",\"domain_id\":\"22\",\"name\":\"pavel.fastnameserver.eu\",\"type\":\"A\",\"content\":\"185.28.101.233\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1539787511,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-10-17 16:45:17',5),(140,'EDITED','{\"id\":\"2648\",\"domain_id\":\"234\",\"name\":\"pavel.server.pep\",\"type\":\"A\",\"content\":\"10.0.1.22\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1539807117,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-10-17 22:11:58',5),(142,'CREATE','{\"id\":\"318\",\"name\":\"cdn.pep\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":null,\"description\":\"Domain for the CDN\"}','2018-10-30 20:57:43',5),(144,'UPDATED','{\"id\":\"318\",\"name\":\"cdn.pep\",\"master\":null,\"last_check\":null,\"type\":\"NATIVE\",\"notified_serial\":null,\"account\":\"5\",\"created\":\"2018-10-30 20:57:42\",\"description\":\"Domain for the internal Content Delivery Network\"}','2018-10-30 20:58:14',5),(146,'EDITED','{\"id\":\"2650\",\"domain_id\":\"318\",\"name\":\"cdn.pep\",\"type\":\"SOA\",\"content\":\"ns1.fastnameserver.eu ich.kai.cool 2018103000 86400 7200 3600000 3600\",\"ttl\":\"3600\",\"prio\":null,\"change_date\":1540929500,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-10-30 20:58:24',5),(148,'EDITED','{\"id\":\"2652\",\"domain_id\":\"318\",\"name\":\"cdn.pep\",\"type\":\"NS\",\"content\":\"ns1.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1540929525,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-10-30 20:58:45',5),(150,'EDITED','{\"id\":\"2654\",\"domain_id\":\"318\",\"name\":\"cdn.pep\",\"type\":\"NS\",\"content\":\"ns2.fastnameserver.eu\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1540929532,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-10-30 20:58:53',5),(152,'EDITED','{\"id\":\"2656\",\"domain_id\":\"318\",\"name\":\"origin.cdn.pep\",\"type\":\"A\",\"content\":\"10.0.1.37\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1540929549,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-10-30 20:59:09',5),(154,'EDITED','{\"id\":\"2658\",\"domain_id\":\"16\",\"name\":\"cloud.peppermint.cloud\",\"type\":\"A\",\"content\":\"85.10.244.162\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1541190907,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-11-02 21:35:13',5),(156,'PURGED','{\"id\":\"1414\",\"domain_id\":null,\"name\":\"atlas.peppermint.cloud\",\"type\":\"A\",\"content\":\"209.250.244.55\",\"ttl\":\"180\",\"prio\":null,\"change_date\":null,\"disabled\":null,\"ordername\":null,\"auth\":null}','2018-11-02 21:35:26',5),(158,'PURGED','{\"id\":\"1412\",\"domain_id\":null,\"name\":\"invoice.peppermint.cloud\",\"type\":\"A\",\"content\":\"209.250.244.55\",\"ttl\":\"180\",\"prio\":null,\"change_date\":null,\"disabled\":null,\"ordername\":null,\"auth\":null}','2018-11-02 21:35:28',5),(160,'EDITED','{\"id\":\"2660\",\"domain_id\":\"16\",\"name\":\"office.peppermint.cloud\",\"type\":\"A\",\"content\":\"85.10.244.162\",\"ttl\":\"3600\",\"prio\":\"10\",\"change_date\":1541195311,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-11-02 22:48:31',5),(162,'PURGED','{\"id\":\"2446\",\"domain_id\":null,\"name\":\"*.proxmox.fastnameserver.eu\",\"type\":\"CNAME\",\"content\":\"proxmox.fastnameserver.eu\",\"ttl\":\"180\",\"prio\":null,\"change_date\":null,\"disabled\":null,\"ordername\":null,\"auth\":null}','2018-11-02 22:51:55',5),(164,'PURGED','{\"id\":\"2448\",\"domain_id\":null,\"name\":\"www.proxmox.fastnameserver.eu\",\"type\":\"CNAME\",\"content\":\"proxmox.fastnameserver.eu\",\"ttl\":\"180\",\"prio\":null,\"change_date\":null,\"disabled\":null,\"ordername\":null,\"auth\":null}','2018-11-02 22:52:02',5),(166,'EDITED','{\"id\":\"2662\",\"domain_id\":\"252\",\"name\":\"nuernberg.proxmox.fastnameserver.eu\",\"type\":\"A\",\"content\":\"85.10.244.162\",\"ttl\":\"180\",\"prio\":\"10\",\"change_date\":1541195539,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-11-02 22:52:19',5),(168,'EDITED','{\"id\":\"2664\",\"domain_id\":\"252\",\"name\":\"offenbach.proxmox.fastnameserver.eu\",\"type\":\"A\",\"content\":\"85.10.244.162\",\"ttl\":\"180\",\"prio\":\"10\",\"change_date\":1541195547,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-11-02 22:52:27',5),(170,'PURGED','{\"id\":\"2428\",\"domain_id\":null,\"name\":\"*.ntopng.fastnameserver.eu\",\"type\":\"CNAME\",\"content\":\"ntopng.fastnameserver.eu\",\"ttl\":\"180\",\"prio\":null,\"change_date\":null,\"disabled\":null,\"ordername\":null,\"auth\":null}','2018-11-02 22:52:50',5),(172,'PURGED','{\"id\":\"2430\",\"domain_id\":null,\"name\":\"www.ntopng.fastnameserver.eu\",\"type\":\"CNAME\",\"content\":\"ntopng.fastnameserver.eu\",\"ttl\":\"180\",\"prio\":null,\"change_date\":null,\"disabled\":null,\"ordername\":null,\"auth\":null}','2018-11-02 22:52:54',5),(174,'PURGED','{\"id\":\"2436\",\"domain_id\":null,\"name\":\"ntopng.fastnameserver.eu\",\"type\":\"MX\",\"content\":\"ntopng.fastnameserver.eu\",\"ttl\":\"180\",\"prio\":\"10\",\"change_date\":null,\"disabled\":null,\"ordername\":null,\"auth\":null}','2018-11-02 22:53:07',5),(176,'EDITED','{\"id\":\"2666\",\"domain_id\":\"250\",\"name\":\"nuernberg.ntopng.fastnameserver.eu\",\"type\":\"A\",\"content\":\"85.10.244.162\",\"ttl\":\"180\",\"prio\":\"10\",\"change_date\":1541195610,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-11-02 22:53:30',5),(178,'EDITED','{\"id\":\"2668\",\"domain_id\":\"250\",\"name\":\"offenbach.ntopng.fastnameserver.eu\",\"type\":\"A\",\"content\":\"85.10.244.162\",\"ttl\":\"180\",\"prio\":\"10\",\"change_date\":1541195626,\"disabled\":0,\"ordername\":null,\"auth\":1}','2018-11-02 22:53:46',5);
/*!40000 ALTER TABLE `changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `modified_at` int(11) NOT NULL,
  `account` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `comment` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_name_type_idx` (`name`,`type`),
  KEY `comments_order_idx` (`domain_id`,`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cryptokeys`
--

DROP TABLE IF EXISTS `cryptokeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cryptokeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `flags` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domainidindex` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cryptokeys`
--

LOCK TABLES `cryptokeys` WRITE;
/*!40000 ALTER TABLE `cryptokeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `cryptokeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domainmetadata`
--

DROP TABLE IF EXISTS `domainmetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domainmetadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `kind` varchar(32) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domainmetadata_idx` (`domain_id`,`kind`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domainmetadata`
--

LOCK TABLES `domainmetadata` WRITE;
/*!40000 ALTER TABLE `domainmetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `domainmetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `master` varchar(128) DEFAULT NULL,
  `last_check` int(11) DEFAULT NULL,
  `type` varchar(6) NOT NULL,
  `notified_serial` int(11) DEFAULT NULL,
  `account` varchar(40) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES (4,'pazdzewicz.de',NULL,NULL,'NATIVE',NULL,'10','2018-08-12 10:59:14','Coole Domain'),(5,'kai.cool',NULL,NULL,'NATIVE',NULL,'10','2018-08-12 10:59:14',NULL),(10,'fahrschule-fleischmann.eu',NULL,NULL,'MASTER',NULL,'10','2018-08-12 10:59:14',NULL),(13,'germanhoster.de',NULL,NULL,'NATIVE',NULL,'10','2018-08-12 10:59:14',NULL),(16,'peppermint.cloud',NULL,NULL,'NATIVE',NULL,'10','2018-08-12 10:59:14',NULL),(17,'fahrschule.rocks',NULL,NULL,'NATIVE',NULL,'10','2018-08-12 10:59:14',NULL),(22,'fastnameserver.eu',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(56,'gamingplay.de',NULL,NULL,'NATIVE',NULL,'10','2018-08-12 10:59:14',NULL),(85,'1.e.1.1.9.1.e.5.1.0.d.f.ip6.arpa',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(93,'speedport.ip',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(106,'bgp.fastnameserver.eu',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(114,'spoc.me',NULL,NULL,'NATIVE',NULL,'10','2018-08-12 10:59:14',NULL),(190,'pep',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(194,'kai.pep',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(210,'kai.fur',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(212,'2.168.192.in-addr.arpa',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14','Home Network'),(214,'cdn.fastnameserver.eu',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(228,'testcloud.c.peppermint.cloud',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(232,'1.0.10.in-addr.arpa',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14','Server Network'),(234,'server.pep',NULL,NULL,'MASTER',NULL,'5','2018-08-12 10:59:14',NULL),(236,'pki.pep',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(238,'vidoo.ga',NULL,NULL,'NATIVE',NULL,'10','2018-08-12 10:59:14',NULL),(242,'dnsbl.pep',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(244,'arator.ml',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(246,'cloudporn.ml',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(248,'peppermint.pep',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(250,'ntopng.fastnameserver.eu',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(252,'proxmox.fastnameserver.eu',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(254,'forever-rudi.de',NULL,NULL,'NATIVE',NULL,'10','2018-08-12 10:59:14',NULL),(256,'flp-academy.de',NULL,NULL,'NATIVE',NULL,'10','2018-08-12 10:59:14',NULL),(258,'255.0.10.in-addr.arpa',NULL,NULL,'NATIVE',NULL,'5','2018-08-12 10:59:14',NULL),(316,'free-teamspeak.com',NULL,NULL,'NATIVE',NULL,'12','2018-08-31 18:40:05','dopest fucking domain ever lol'),(318,'cdn.pep',NULL,NULL,'NATIVE',NULL,'5','2018-10-30 20:57:42','Domain for the internal Content Delivery Network');
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_confirmations`
--

DROP TABLE IF EXISTS `email_confirmations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_confirmations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `code` char(32) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `modifiedAt` int(10) unsigned DEFAULT NULL,
  `confirmed` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_confirmations`
--

LOCK TABLES `email_confirmations` WRITE;
/*!40000 ALTER TABLE `email_confirmations` DISABLE KEYS */;
INSERT INTO `email_confirmations` VALUES (2,10,'7Clw80Yi7uvfFvkzI0LtVJwZKtaUnY9r',1534618603,NULL,'N'),(4,12,'7ws3lghx717zZuc8gOGene1aFsajkvF',1535727847,1535728105,'Y');
/*!40000 ALTER TABLE `email_confirmations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_logins`
--

DROP TABLE IF EXISTS `failed_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned DEFAULT NULL,
  `ipAddress` char(15) NOT NULL,
  `attempted` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_logins`
--

LOCK TABLES `failed_logins` WRITE;
/*!40000 ALTER TABLE `failed_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nameserver`
--

DROP TABLE IF EXISTS `nameserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nameserver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `fqdn` varchar(45) DEFAULT NULL,
  `ip4` varchar(45) DEFAULT NULL,
  `ip6` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `fqdn_UNIQUE` (`fqdn`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nameserver`
--

LOCK TABLES `nameserver` WRITE;
/*!40000 ALTER TABLE `nameserver` DISABLE KEYS */;
INSERT INTO `nameserver` VALUES (14,'Offenbach','ns2.fastnameserver.eu','95.179.138.32',''),(16,'NÃ¼rnberg','ns1.fastnameserver.eu','85.10.244.164','2a01:4f8:a0:90c5::164');
/*!40000 ALTER TABLE `nameserver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_changes`
--

DROP TABLE IF EXISTS `password_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_changes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `ipAddress` char(15) NOT NULL,
  `userAgent` text NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_changes`
--

LOCK TABLES `password_changes` WRITE;
/*!40000 ALTER TABLE `password_changes` DISABLE KEYS */;
INSERT INTO `password_changes` VALUES (2,12,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36 OPR/54.0.2952.64',1535728130);
/*!40000 ALTER TABLE `password_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profilesId` int(10) unsigned NOT NULL,
  `resource` varchar(16) NOT NULL,
  `action` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profilesId` (`profilesId`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (84,3,'users','changePassword'),(86,3,'dns','index'),(88,3,'dns','search'),(90,2,'users','changePassword'),(92,2,'dns','index'),(94,2,'dns','search'),(96,2,'dns','create'),(98,2,'dns','edit'),(100,2,'dns','delete'),(316,1,'users','index'),(318,1,'users','search'),(320,1,'users','edit'),(322,1,'users','create'),(324,1,'users','delete'),(326,1,'users','changePassword'),(328,1,'profiles','index'),(330,1,'profiles','search'),(332,1,'profiles','edit'),(334,1,'profiles','create'),(336,1,'profiles','delete'),(338,1,'permissions','index'),(340,1,'dns','index'),(342,1,'dns','search'),(344,1,'dns','create'),(346,1,'dns','edit'),(348,1,'dns','delete'),(350,1,'dns','administrate'),(352,1,'dns','administrateNS'),(354,1,'dns','administrateTLD'),(356,1,'dns','administrateType'),(358,1,'dns','administrateRecursor'),(360,1,'dns','administrateChangelog');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Administrators','Y'),(2,'Users','Y'),(3,'Read-Only','Y');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_types`
--

DROP TABLE IF EXISTS `record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`value`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_types`
--

LOCK TABLES `record_types` WRITE;
/*!40000 ALTER TABLE `record_types` DISABLE KEYS */;
INSERT INTO `record_types` VALUES (38,'A'),(40,'AAAA'),(42,'AFSDB'),(44,'ALIAS'),(46,'CAA'),(48,'CERT'),(50,'CDNSKEY'),(52,'CDS'),(54,'CNAME'),(56,'DNSKEY'),(58,'DNAME'),(60,'DS'),(62,'HINFO'),(64,'KEY'),(66,'LOC'),(68,'MX'),(70,'NAPTR'),(72,'NS'),(74,'NSEC'),(76,'NSEC3'),(78,'NSEC3PARAM'),(80,'OPENPGPKEY'),(82,'PTR'),(84,'RP'),(86,'RRSIG'),(88,'SOA'),(90,'SPF'),(92,'SSHFP'),(94,'SRV'),(96,'TKEY'),(98,'TSIG'),(100,'TLSA'),(102,'SMIMEA'),(104,'TXT'),(106,'URI');
/*!40000 ALTER TABLE `record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `content` varchar(64000) DEFAULT NULL,
  `ttl` int(11) DEFAULT NULL,
  `prio` int(11) DEFAULT NULL,
  `change_date` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT 0,
  `ordername` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `auth` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `nametype_index` (`name`,`type`),
  KEY `domain_id` (`domain_id`),
  KEY `recordorder` (`domain_id`,`ordername`)
) ENGINE=InnoDB AUTO_INCREMENT=2670 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (21,4,'*.pazdzewicz.de','CNAME','pazdzewicz.de',120,0,1527682470,0,NULL,1),(26,4,'pazdzewicz.de','SOA','ns1.fastnameserver.eu hostmaster.pazdzewicz.de 2018053000 28800 7200 604800 1200',120,0,1471794999,0,NULL,1),(28,4,'pazdzewicz.de','MX','claire.fastnameserver.eu',120,10,1527682471,0,NULL,1),(29,4,'pazdzewicz.de','TXT','\"v=spf1 a mx ip4:209.250.250.30 ~all\"',120,0,1527682471,0,NULL,1),(30,4,'pazdzewicz.de','NS','ns1.fastnameserver.eu',120,0,1527682469,0,NULL,1),(31,4,'pazdzewicz.de','NS','ns2.fastnameserver.eu',120,0,1527682469,0,NULL,1),(35,4,'pazdzewicz.de','TXT','\"keybase-site-verification=n9vI985gvrMNDU6pfX7icIfqrvDXl64RTFUpbWLWLw0\"',86400,0,1527682470,0,NULL,1),(36,5,'*.kai.cool','CNAME','kai.cool',120,0,1527686637,0,NULL,1),(41,5,'kai.cool','SOA','ns1.fastnameserver.eu dns.dediwerk.de 2018071901 28800 7200 604800 120',120,0,1480409096,0,NULL,1),(42,5,'kai.cool','NS','ns1.fastnameserver.eu',120,0,1527686637,0,NULL,1),(43,5,'kai.cool','TXT','\"v=spf1 a mx ~all\"',120,0,1527686638,0,NULL,1),(44,5,'kai.cool','MX','claire.fastnameserver.eu',120,10,1527686637,0,NULL,1),(46,5,'kai.cool','NS','ns2.fastnameserver.eu',120,0,1527686637,0,NULL,1),(51,5,'kai.cool','TXT','\"keybase-site-verification=qbqLt0AoSFZMu0YqFm6Sgd0ESufcLQ4VMmNIUX5wOgE\"',120,0,1527686638,0,NULL,1),(104,10,'*.fahrschule-fleischmann.eu','CNAME','fahrschule-fleischmann.eu',180,0,1527957593,0,NULL,1),(109,10,'fahrschule-fleischmann.eu','A','209.250.244.55',180,0,1527957593,0,NULL,1),(110,10,'fahrschule-fleischmann.eu','SOA','ns1.fastnameserver.eu dns.dediwerk.de 2018060204 28800 7200 604800 120',180,0,1472032593,0,NULL,1),(111,10,'fahrschule-fleischmann.eu','TXT','\"v=spf1 a mx ip4:209.250.250.30 ~all\"',180,0,1527957594,0,NULL,1),(112,10,'fahrschule-fleischmann.eu','MX','claire.fastnameserver.eu',180,10,1527957594,0,NULL,1),(114,10,'fahrschule-fleischmann.eu','NS','ns2.fastnameserver.eu',180,0,1527957593,0,NULL,1),(116,10,'fahrschule-fleischmann.eu','NS','ns1.fastnameserver.eu',180,0,1527957593,0,NULL,1),(143,13,'*.germanhoster.de','CNAME','germanhoster.de',180,0,1527300871,0,NULL,1),(148,13,'germanhoster.de','A','209.250.244.55',180,0,1527300873,0,NULL,1),(149,13,'germanhoster.de','SOA','ns1.fastnameserver.eu dns.dediwerk.de 2018052600 28800 7200 604800 120',180,0,1476874786,0,NULL,1),(150,13,'germanhoster.de','TXT','\"v=spf1 a mx ~all\"',180,0,1527300873,0,NULL,1),(151,13,'germanhoster.de','MX','germanhoster.de',180,10,1527300872,0,NULL,1),(153,13,'germanhoster.de','NS','ns2.fastnameserver.eu',180,0,1527300869,0,NULL,1),(155,13,'germanhoster.de','NS','ns1.fastnameserver.eu',180,0,1527300870,0,NULL,1),(182,16,'*.peppermint.cloud','CNAME','peppermint.cloud',180,0,1527292379,0,NULL,1),(187,16,'www.peppermint.cloud','CNAME','peppermint.cloud',180,0,1527292381,0,NULL,1),(189,16,'peppermint.cloud','NS','ns2.fastnameserver.eu',180,0,1527292378,0,NULL,1),(190,16,'peppermint.cloud','A','209.250.244.55',180,0,1527292380,0,NULL,1),(191,16,'peppermint.cloud','MX','claire.fastnameserver.eu',180,10,1527292380,0,NULL,1),(192,16,'peppermint.cloud','TXT','\"v=spf1 a mx ~all\"',180,0,1527292380,0,NULL,1),(193,16,'peppermint.cloud','SOA','ns1.fastnameserver.eu dns.dediwerk.de 2018071201 28800 7200 604800 120',180,0,1480422871,0,NULL,1),(194,16,'peppermint.cloud','NS','ns1.fastnameserver.eu',180,0,1527292379,0,NULL,1),(195,17,'*.fahrschule.rocks','CNAME','fahrschule.rocks',180,0,1527300810,0,NULL,1),(200,17,'www.fahrschule.rocks','CNAME','fahrschule.rocks',180,0,1527300814,0,NULL,1),(201,17,'fahrschule.rocks','SOA','ns1.fastnameserver.eu dns.dediwerk.de 2018052600 28800 7200 604800 120',180,0,1472033836,0,NULL,1),(202,17,'fahrschule.rocks','TXT','\"v=spf1 a mx ~all\"',180,0,1527300813,0,NULL,1),(203,17,'fahrschule.rocks','MX','fahrschule.rocks',180,10,1527300812,0,NULL,1),(204,17,'fahrschule.rocks','A','209.250.244.55',180,0,1527300811,0,NULL,1),(205,17,'fahrschule.rocks','NS','ns2.fastnameserver.eu',180,0,1527300808,0,NULL,1),(207,17,'fahrschule.rocks','NS','ns1.fastnameserver.eu',180,0,1527300809,0,NULL,1),(223,0,'f.a.e.1.0.0.0.0.0.0.0.0.0.0.0.0.a.d.d.0.9.1.0.0.0.7.4.0.1.0.0.2.ip6.arpa','PTR','srv-ru1.dediwerk.de',180,0,1472746034,0,NULL,1),(239,22,'fastnameserver.eu','SOA','ns1.fastnameserver.eu dns.dediwerk.de 2018073100 28800 7200 604800 120',180,0,1473076278,0,NULL,1),(240,22,'fastnameserver.eu','TXT','\"v=spf1 a mx ~all\"',180,0,1527364888,0,NULL,1),(241,22,'fastnameserver.eu','MX','claire.fastnameserver.eu',180,10,1527364888,0,NULL,1),(243,22,'fastnameserver.eu','NS','ns2.fastnameserver.eu',180,0,1527364887,0,NULL,1),(245,22,'fastnameserver.eu','NS','ns1.fastnameserver.eu',180,0,1527364887,0,NULL,1),(621,22,'ns2.fastnameserver.eu','A','95.179.138.32',180,0,1527364890,0,NULL,1),(642,56,'www.gamingplay.de','A','209.250.244.55',180,0,1527296905,0,NULL,1),(643,56,'gamingplay.de','NS','ns1.fastnameserver.eu',180,0,1527296898,0,NULL,1),(644,56,'gamingplay.de','TXT','\"v=spf1 a mx ~all\"',180,0,1527296900,0,NULL,1),(645,56,'gamingplay.de','MX','claire.fastnameserver.eu',180,10,1527296901,0,NULL,1),(646,56,'gamingplay.de','A','209.250.244.55',180,0,1527296902,0,NULL,1),(647,56,'gamingplay.de','NS','ns2.fastnameserver.eu',180,0,1527296898,0,NULL,1),(651,56,'gamingplay.de','SOA','ns1.fastnameserver.eu dns.dediwerk.de 2018060500 28800 7200 604800 120',180,0,1481615813,0,NULL,1),(654,56,'_ts3._udp.gamingplay.de','SRV','5 10001 alex.fastnameserver.eu',180,10,1527296899,0,NULL,1),(705,22,'ns1.fastnameserver.eu','AAAA','2a01:4f8:a0:90c5::164',180,0,1527364889,0,NULL,1),(706,22,'ns1.fastnameserver.eu','A','85.10.244.164',180,0,1527364890,0,NULL,1),(980,5,'kai.cool','A','209.250.244.55',180,0,1527686638,0,NULL,1),(983,10,'www.fahrschule-fleischmann.eu','CNAME','fahrschule-fleischmann.eu',180,0,1527957594,0,NULL,1),(984,5,'www.kai.cool','CNAME','kai.cool',180,0,1527686638,0,NULL,1),(985,22,'fastnameserver.eu','A','209.250.244.55',180,0,1527364888,0,NULL,1),(987,22,'www.fastnameserver.eu','CNAME','fastnameserver.eu',180,0,1527364890,0,NULL,1),(989,13,'www.germanhoster.de','CNAME','germanhoster.de',180,0,1527300875,0,NULL,1),(990,4,'www.pazdzewicz.de','CNAME','pazdzewicz.de',180,NULL,1534089249,0,NULL,1),(1070,85,'1.e.1.1.9.1.e.5.1.0.d.f.ip6.arpa','NS','ns2.fastnameserver.eu',180,0,1496839442,0,NULL,1),(1071,85,'1.e.1.1.9.1.e.5.1.0.d.f.ip6.arpa','SOA','ns1.fastnameserver.eu dns.dediwerk.de 2017060702 28800 7200 604800 120',180,0,1496839442,0,NULL,1),(1072,85,'1.e.1.1.9.1.e.5.1.0.d.f.ip6.arpa','NS','ns1.fastnameserver.eu',180,0,1496839442,0,NULL,1),(1073,85,'1.e.1.1.9.1.e.5.1.0.d.f.ip6.arpa','NS','dn42-ns1.AS4242422506.dn42',180,0,1496839442,0,NULL,1),(1074,85,'2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.e.1.1.9.1.e.5.1.0.d.f.ip6.arpa','PTR','gw-fstein.AS4242422506.dn42',180,0,1496839495,0,NULL,1),(1075,85,'4.6.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.e.1.1.9.1.e.5.1.0.d.f.ip6.arpa','PTR','kai-server.dn42',180,0,1496839975,0,NULL,1),(1141,22,'shaw.fastnameserver.eu','A','213.133.103.165',180,0,1527364890,0,NULL,1),(1142,22,'shaw.fastnameserver.eu','AAAA','2a01:4f8:a0:90c5::2',180,0,1527364890,0,NULL,1),(1143,22,'gateway.fastnameserver.eu','A','85.10.244.161',180,0,1527364888,0,NULL,1),(1144,22,'gateway.fastnameserver.eu','AAAA','2a01:4f8:a0:90c5::3',180,0,1527364888,0,NULL,1),(1149,5,'nfs.kai.cool','A','85.10.244.163',180,0,1527686638,0,NULL,1),(1150,5,'nfs.kai.cool','AAAA','2a01:4f8:a0:90c5::163',180,0,1527686638,0,NULL,1),(1187,93,'*.speedport.ip','CNAME','speedport.ip',180,0,1507389559,0,NULL,1),(1188,93,'www.speedport.ip','CNAME','speedport.ip',180,0,1507389559,0,NULL,1),(1189,93,'speedport.ip','NS','ns1.fastnameserver.eu',180,0,1507389559,0,NULL,1),(1190,93,'speedport.ip','TXT','\"v=spf1 a mx ~all\"',180,0,1507389559,0,NULL,1),(1191,93,'speedport.ip','MX','speedport.ip',180,10,1507389559,0,NULL,1),(1192,93,'speedport.ip','A','192.168.2.1',180,0,1507389559,0,NULL,1),(1193,93,'speedport.ip','NS','ns2.fastnameserver.eu',180,0,1507389559,0,NULL,1),(1195,93,'speedport.ip','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2017100702 28800 7200 604800 120',180,0,1507389542,0,NULL,1),(1337,16,'admin.peppermint.cloud','A','108.61.189.13',180,0,1527292379,0,NULL,1),(1339,16,'mail.peppermint.cloud','A','108.61.189.13',180,0,1527292380,0,NULL,1),(1340,16,'default._domainkey.peppermint.cloud','TXT','\"v=DKIM1; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw6ZLwxnZrHXQsTsI8AkRMNaDvfqpOs+LQBMaCA0KzHQXindV78VEnbmnoSZpEPbnGyg+jqb86pH2tdEDxZsyvlSpdYIesvaCoku053TeoIh5WiBoV7fRPKHUdcC8F0ULg1wT9Fpz/zkgcCe83r1OB1cl0jpwCsm6X5BBN2x1mZwak8QliZsOZF51eeZriJCHP0UwpamReN89zLotEXGJAIy9GhmlWQvNzuFNLxkJa22Kv89PviZrFsz6CG+8zXoSIHAeOk0CehtNJK0JWYAHdkE83ugyO9cOb6qjtQLrHVCUGOVl0XAZ6k+k54PPjl0THqnzJShl2//j40DbChSAQwIDAQAB\"',180,0,1527292379,0,NULL,1),(1342,22,'default._domainkey.fastnameserver.eu','TXT','\"v=DKIM1; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA36SwphIdL6GhVFH+g6TOMLvh3IR27fmL+z9wkPtlpl/0WbeIO/Kay0jcQ/aA0jQvp6b7q4wVrysGJaSFRyROhxECC1iWK9ulUF2AQu6ZOrrH6Qkesw/IgFCoxYkqM6bBP7fgehqnbV1x0IqJXbbQ\"MEsIrZ4MnlMZryvDZizLUZcXejq4m+TIanGO/mTcs8O3z3sTVYKlThNRK6XPZFbxohGdIlMrTGcoitXY5orFQXHUnhOV2aAk7rcAEE5sNCOAP9S8QwPi2RALjlKp2n7eg5PDtYuc7Gfm8pAmijNJEhTnk9aSmU2QqCrJhbPk2hPlQcMwNA9LsgvGLs/4CE3kdwIDAQAB\"',180,0,1527364887,0,NULL,1),(1345,4,'pazdzewicz.de','A','209.250.244.55',180,0,1527682470,0,NULL,1),(1351,4,'default._domainkey.pazdzewicz.de','TXT','\"v=DKIM1; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3zacqkLWh+uNu4HQtQIrgysy7GO9Bi0C8sglYn1jeFrOLa5v4vzretmVpWpwK01Y2FUlnprXUx1enfpi2UA9xBCRoGjyUINyACpKqiGC3mDA0E+nLudsJ5kFvEBpD2+z7a0DHiN3P/htQRI23G5TEWjqqJgBucQLCe9Tq2sWOYCRoWGmYFaTst+zmDy9s4qymhIS8BBfufZ14VfcPXW294lKilxUTR7WP/afqGLQyfbli16YL+BusLO0KOLk7pQWN3jr2JL2vgle04BeZMq5P8Md5UOSp0P/bXsEco+ktxErlViayJ+sYoCrLZfK9rydkmh7LHHh7BxFSKK3vmhAXwIDAQAB\"',180,0,1527682470,0,NULL,1),(1352,5,'default._domainkey.kai.cool','TXT','\"v=DKIM1; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4C5e93IuvoJeVjngR+2TG14EPFiFZjYxczsYUZCWKKgWJpRsT/wmdmj6G/jGYLbtP3U4NhjFgu7zXUp3aet+h8ig/uKLCd8oLp3/EadLRAkSegtlAixMwUw7RDx+40CmZ0P3VJGezXOX9mJ0yVi7YNKIFiyJqdk6h6tRFTWxngHQgOZ+FUiljJcgrgR/e/g0KBjW0l7/wGQ/RWxTkStlI8eJOqTYqmLuYCBwUXqW53BHhpA8MqMWyzUUkxao4gr1S7MYZgJrvyiHaGw6eCsDQsLdmFDfAZULjsDleFnDt7HQXDJQXw0GSmScTRSvk2FcWrmNfOSo9iQYwl2DrXG/+wIDAQAB\"',180,0,1527686637,0,NULL,1),(1356,16,'portainer.peppermint.cloud','A','209.250.244.55',180,0,1527292381,0,NULL,1),(1357,10,'default._domainkey.fahrschule-fleischmann.eu','TXT','\"v=DKIM1; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyZvX5GiYul47SVODKfNIjVg+iH5tHk8vOh7E5r5hsOhO3NdmkCWjLdc2HPCuOh5TZUJ09KGeyRB3432ZLOg5hS+mDZ3k5BUAY9O+Cac0kP19ARSrz4kcImYZ73pl/6Ell2QBAl2bwcX29F0xeAY7mIVArAcmagKjLIEeiq/U0h6fDm6TGTowLmhufdioPfGl1tG2R/J+c1M31KGiyUMA1zGvYRhe+uWlyUxj6XMKDwiGBeuRhgRy+QHsrnrW+EJi1cXf0pGUGI03bl7uX0YD+rnSnjqjl9lkYYZ6qexoRlp/6q25n9zLpnyDyk0eW1kUQn1zJegf690HZuuqLOhJPwIDAQAB\"',180,0,1527957593,0,NULL,1),(1360,22,'mitchell.fastnameserver.eu','A','85.10.244.164',180,0,1527364889,0,NULL,1),(1361,22,'mitchell.fastnameserver.eu','AAAA','2a01:4f8:a0:90c5::164',180,0,1527364889,0,NULL,1),(1392,106,'bgp.fastnameserver.eu','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018052413 28800 7200 604800 120',180,0,1519152638,0,NULL,1),(1394,106,'bgp.fastnameserver.eu','NS','ns1.fastnameserver.eu',180,0,1527195549,0,NULL,1),(1396,106,'bgp.fastnameserver.eu','NS','ns2.fastnameserver.eu',180,0,1527195549,0,NULL,1),(1400,106,'amsterdam.bgp.fastnameserver.eu','A','209.250.250.30',180,0,1527195549,0,NULL,1),(1530,0,'e.b.a.b.0.0.0.0.0.0.0.0.0.0.0.0.3.0.0.0.4.0.0.0.0.c.b.b.b.0.a.2.ip6.arpa','PTR','moss.fastnameserver.eu',180,0,1524677901,0,NULL,1),(1566,114,'*.spoc.me','CNAME','spoc.me',180,0,1527682568,0,NULL,1),(1568,114,'www.spoc.me','CNAME','spoc.me',180,0,1527682571,0,NULL,1),(1570,114,'spoc.me','NS','ns1.fastnameserver.eu',180,0,1527682566,0,NULL,1),(1572,114,'spoc.me','TXT','\"v=spf1 a mx ip4:209.250.250.30 ~all\"',180,0,1527682570,0,NULL,1),(1574,114,'spoc.me','MX','claire.fastnameserver.eu',180,10,1527682570,0,NULL,1),(1576,114,'spoc.me','A','209.250.244.55',180,0,1527682569,0,NULL,1),(1578,114,'spoc.me','NS','ns2.fastnameserver.eu',180,0,1527682567,0,NULL,1),(1582,114,'spoc.me','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018053000 28800 7200 604800 120',180,0,1525330807,0,NULL,1),(1588,16,'my.peppermint.cloud','A','209.250.244.55',180,0,1527292380,0,NULL,1),(1848,190,'pep','SOA','ns1.fastnameserver.eu hostmaster.pep 2018051304 28800 7200 604800 1200',180,0,1526169730,0,NULL,1),(1850,190,'pep','NS','ns1.fastnameserver.eu',180,0,1526169730,0,NULL,1),(1852,190,'pep','NS','ns2.fastnameserver.eu',180,0,1526169730,0,NULL,1),(1854,190,'www.pep','CNAME','pep',180,0,1526169730,0,NULL,1),(1856,190,'pep','A','185.189.57.3',180,0,1526169730,0,NULL,1),(1858,190,'pep','MX','ancast-mx.fastnameserver.eu',180,10,1526169730,0,NULL,1),(1860,190,'pep','TXT','v=spf1 a mx ~all',180,0,1526169730,0,NULL,1),(1862,190,'nic.pep','A','185.189.57.3',120,0,1526169772,0,NULL,1),(1882,194,'kai.pep','SOA','ns1.fastnameserver.eu hostmaster.kai.pep 2018051400 28800 7200 604800 1200',180,0,1526294593,0,NULL,1),(1884,194,'kai.pep','NS','ns1.fastnameserver.eu',180,0,1526294593,0,NULL,1),(1886,194,'kai.pep','NS','ns2.fastnameserver.eu',180,0,1526294593,0,NULL,1),(1888,194,'www.kai.pep','CNAME','kai.pep',180,0,1526294593,0,NULL,1),(1890,194,'kai.pep','A','185.189.57.3',180,0,1526294593,0,NULL,1),(1892,194,'kai.pep','MX','ancast-mx.fastnameserver.eu',180,10,1526294593,0,NULL,1),(1894,194,'kai.pep','TXT','v=spf1 a mx ~all',180,0,1526294593,0,NULL,1),(2002,210,'kai.fur','SOA','ns1.fastnameserver.eu hostmaster.kai.fur 2018051900 28800 7200 604800 1200',180,0,1526684317,0,NULL,1),(2004,210,'kai.fur','NS','ns1.fastnameserver.eu',180,0,1526684317,0,NULL,1),(2006,210,'kai.fur','NS','ns2.fastnameserver.eu',180,0,1526684317,0,NULL,1),(2008,210,'www.kai.fur','CNAME','kai.fur',180,0,1526684317,0,NULL,1),(2010,210,'kai.fur','A','185.189.57.3',180,0,1526684317,0,NULL,1),(2012,210,'kai.fur','MX','anycast-mx.fastnameserver.eu',180,10,1526684317,0,NULL,1),(2014,210,'kai.fur','TXT','v=spf1 a mx ~all',180,0,1526684317,0,NULL,1),(2016,212,'2.168.192.in-addr.arpa','NS','ns2.fastnameserver.eu',180,0,1526685880,0,NULL,1),(2018,212,'2.168.192.in-addr.arpa','SOA','ns1.fastnameserver.eu dns.dediwerk.de 2018051805 28800 7200 604800 120',180,0,1526685510,0,NULL,1),(2020,212,'2.168.192.in-addr.arpa','NS','ns1.fastnameserver.eu',180,0,1526685880,0,NULL,1),(2024,212,'1.2.168.192.in-addr.arpa','PTR','speedport.ip',180,0,1526685881,0,NULL,1),(2026,212,'106.2.168.192.in-addr.arpa','PTR','pve.home.kai',180,0,1526685881,0,NULL,1),(2028,212,'192.168.2.114.2.168.192.in-addr.arpa','PTR','osama.home.kai',180,0,1526685881,0,NULL,1),(2030,212,'112.2.168.192.in-addr.arpa','PTR','hue.home.kai',180,0,1526685881,0,NULL,1),(2044,214,'cdn.fastnameserver.eu','NS','ns1.fastnameserver.eu',180,0,1527198272,0,NULL,1),(2050,214,'cdn.fastnameserver.eu','A','209.250.244.55',180,0,1527198272,0,NULL,1),(2052,214,'cdn.fastnameserver.eu','NS','ns2.fastnameserver.eu',180,0,1527198272,0,NULL,1),(2056,214,'cdn.fastnameserver.eu','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018052403 28800 7200 604800 120',180,0,1526688559,0,NULL,1),(2058,214,'any.cdn.fastnameserver.eu','A','209.250.244.55',180,0,1527198272,0,NULL,1),(2066,214,'_acme-challenge.cdn.fastnameserver.eu','TXT','\"MjFObR9-n4cp0CIahiFSR_6kBOKfAv-hHXaQWpBL7Cs\"',180,0,1527198272,0,NULL,1),(2068,214,'*.cdn.fastnameserver.eu','CNAME','any.cdn.fastnameserver.eu',180,0,1527198272,0,NULL,1),(2072,5,'pki.kai.cool','A','209.250.244.55',180,0,1527686638,0,NULL,1),(2120,228,'testcloud.c.peppermint.cloud','SOA','ns1.fastnameserver.eu hostmaster.testcloud.c.peppermint.cloud 2018052200 28800 7200 604800 1200',180,0,1526943985,0,NULL,1),(2122,228,'testcloud.c.peppermint.cloud','NS','ns1.fastnameserver.eu',180,0,1526943985,0,NULL,1),(2124,228,'testcloud.c.peppermint.cloud','NS','ns2.fastnameserver.eu',180,0,1526943985,0,NULL,1),(2126,228,'www.testcloud.c.peppermint.cloud','CNAME','testcloud.c.peppermint.cloud',180,0,1526943985,0,NULL,1),(2128,228,'testcloud.c.peppermint.cloud','A','185.189.57.3',180,0,1526943985,0,NULL,1),(2130,228,'testcloud.c.peppermint.cloud','MX','anycast-mx.fastnameserver.eu',180,10,1526943985,0,NULL,1),(2132,228,'testcloud.c.peppermint.cloud','TXT','v=spf1 a mx ~all',180,0,1526943985,0,NULL,1),(2138,16,'dns.peppermint.cloud','A','209.250.244.55',180,0,1527292379,0,NULL,1),(2142,232,'1.0.10.in-addr.arpa','NS','ns2.fastnameserver.eu',180,0,1527168972,0,NULL,1),(2144,232,'1.0.10.in-addr.arpa','SOA','ns1.fastnameserver.eu dns.dediwerk.de 2018073000 28800 7200 604800 120',180,0,1527168972,0,NULL,1),(2146,232,'1.0.10.in-addr.arpa','NS','ns1.fastnameserver.eu',180,0,1527168972,0,NULL,1),(2150,232,'1.1.0.10.in-addr.arpa','PTR','amsterdam.bgp.fastnameserver.eu',180,0,1527169054,0,NULL,1),(2152,106,'amsterdam.bgp.fastnameserver.eu','A','10.0.1.1',180,0,1527195549,0,NULL,1),(2154,232,'2.1.0.10.in-addr.arpa','PTR','nuernberg.bgp.fastnameserver.eu',180,0,1527169069,0,NULL,1),(2156,106,'nuernberg.bgp.fastnameserver.eu','A','10.0.1.2',180,0,1527195549,0,NULL,1),(2164,214,'mx.cdn.fastnameserver.eu','A','108.61.189.13',180,0,1527198302,0,NULL,1),(2170,232,'9.1.0.10.in-addr.arpa','PTR','offenbach.bgp.fastnameserver.eu',180,0,1527199080,0,NULL,1),(2172,106,'offenbach.bgp.fastnameserver.eu','A','10.0.1.9',180,0,1527199080,0,NULL,1),(2174,232,'65.1.0.10.in-addr.arpa','PTR','offenbach.bgp.fastnameserver.eu',180,0,1527199095,0,NULL,1),(2176,106,'offenbach.bgp.fastnameserver.eu','A','10.0.1.65',180,0,1527199095,0,NULL,1),(2178,234,'*.server.pep','CNAME','server.pep',180,0,1527294094,0,NULL,1),(2180,234,'www.server.pep','CNAME','server.pep',180,0,1527294095,0,NULL,1),(2182,234,'server.pep','NS','ns1.fastnameserver.eu',180,0,1527294094,0,NULL,1),(2184,234,'server.pep','TXT','\"v=spf1 a mx ~all\"',180,0,1527294095,0,NULL,1),(2186,234,'server.pep','MX','server.pep',180,10,1527294095,0,NULL,1),(2188,234,'server.pep','A','10.0.1.70',180,0,1527294095,0,NULL,1),(2190,234,'server.pep','NS','ns2.fastnameserver.eu',180,0,1527294094,0,NULL,1),(2194,234,'server.pep','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018073001 28800 7200 604800 120',180,0,1527247404,0,NULL,1),(2196,232,'70.1.0.10.in-addr.arpa','PTR','moss.server.pep',180,0,1527293889,0,NULL,1),(2198,234,'moss.server.pep','A','10.0.1.70',180,0,1527294094,0,NULL,1),(2200,232,'66.1.0.10.in-addr.arpa','PTR','utility.server.pep',180,0,1527293907,0,NULL,1),(2202,234,'utility.server.pep','A','10.0.1.66',180,0,1527294095,0,NULL,1),(2204,232,'67.1.0.10.in-addr.arpa','PTR','claire.server.pep',180,0,1527293920,0,NULL,1),(2206,234,'claire.server.pep','A','10.0.1.67',180,0,1527294094,0,NULL,1),(2208,232,'68.1.0.10.in-addr.arpa','PTR','roy.server.pep',180,0,1527293936,0,NULL,1),(2210,234,'roy.server.pep','A','10.0.1.68',180,0,1527294095,0,NULL,1),(2212,232,'69.1.0.10.in-addr.arpa','PTR','luke.server.pep',180,0,1527293944,0,NULL,1),(2214,234,'luke.server.pep','A','10.0.1.69',180,0,1527294094,0,NULL,1),(2216,232,'71.1.0.10.in-addr.arpa','PTR','phil.server.pep',180,0,1527293960,0,NULL,1),(2218,234,'phil.server.pep','A','10.0.1.71',180,0,1527294095,0,NULL,1),(2232,232,'35.1.0.10.in-addr.arpa','PTR','mitchell.server.pep',180,0,1527294303,0,NULL,1),(2234,234,'mitchell.server.pep','A','10.0.1.35',180,0,1527294303,0,NULL,1),(2236,232,'36.1.0.10.in-addr.arpa','PTR','donald.server.pep',180,0,1527294311,0,NULL,1),(2238,234,'donald.server.pep','A','10.0.1.36',180,0,1527294312,0,NULL,1),(2240,22,'gitlab.fastnameserver.eu','A','209.250.244.55',180,0,1527364889,0,NULL,1),(2242,22,'phil.fastnameserver.eu','A','10.0.1.71',180,0,1527364890,0,NULL,1),(2244,22,'kim.fastnameserver.eu','A','85.10.244.165',180,0,1527364889,0,NULL,1),(2246,22,'alex.fastnameserver.eu','A','85.10.244.162',180,0,1527364887,0,NULL,1),(2248,232,'37.1.0.10.in-addr.arpa','PTR','alex.server.pep',180,0,1527297120,0,NULL,1),(2250,234,'alex.server.pep','A','10.0.1.37',180,0,1527297120,0,NULL,1),(2252,232,'33.1.0.10.in-addr.arpa','PTR','kim.server.pep',180,0,1527299850,0,NULL,1),(2254,234,'kim.server.pep','A','10.0.1.33',180,0,1527299850,0,NULL,1),(2256,232,'39.1.0.10.in-addr.arpa','PTR','nfs.server.pep',180,0,1527301387,0,NULL,1),(2258,234,'nfs.server.pep','A','10.0.1.39',180,0,1527301389,0,NULL,1),(2262,234,'homerouter.server.pep','A','10.0.1.65',180,0,1527303091,0,NULL,1),(2264,234,'amsterdam.server.pep','A','10.0.1.1',180,0,1527345092,0,NULL,1),(2266,234,'ocsp.server.pep','A','10.0.1.66',180,0,1527348266,0,NULL,1),(2268,234,'pki.server.pep','A','10.0.1.66',180,0,1527348333,0,NULL,1),(2270,236,'*.pki.pep','CNAME','pki.pep',180,0,1527351774,0,NULL,1),(2272,236,'www.pki.pep','CNAME','pki.pep',180,0,1527351775,0,NULL,1),(2274,236,'pki.pep','NS','ns1.fastnameserver.eu',180,0,1527351774,0,NULL,1),(2276,236,'pki.pep','TXT','\"v=spf1 a mx ~all\"',180,0,1527351775,0,NULL,1),(2278,236,'pki.pep','MX','pki.pep',180,10,1527351775,0,NULL,1),(2280,236,'pki.pep','A','10.0.1.66',180,0,1527351775,0,NULL,1),(2282,236,'pki.pep','NS','ns2.fastnameserver.eu',180,0,1527351774,0,NULL,1),(2284,236,'pki.pep','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018052602 28800 7200 604800 120',180,0,1527351706,0,NULL,1),(2286,236,'ocsp.pki.pep','A','10.0.1.66',180,0,1527352574,0,NULL,1),(2288,22,'luke.fastnameserver.eu','A','95.179.138.32',180,0,1527364896,0,NULL,1),(2290,22,'lg.fastnameserver.eu','A','209.250.244.55',180,0,1527378152,0,NULL,1),(2292,5,'flix.kai.cool','A','209.250.244.55',180,0,1527686637,0,NULL,1),(2294,238,'*.vidoo.ga','CNAME','vidoo.ga',180,0,1527434652,0,NULL,1),(2296,238,'www.vidoo.ga','CNAME','vidoo.ga',180,0,1527434652,0,NULL,1),(2298,238,'vidoo.ga','NS','ns1.fastnameserver.eu',180,0,1527434652,0,NULL,1),(2300,238,'vidoo.ga','TXT','v=spf1 a mx ~all',180,0,1527434652,0,NULL,1),(2302,238,'vidoo.ga','MX','vidoo.ga',180,10,1527434652,0,NULL,1),(2304,238,'vidoo.ga','A','209.250.244.55',180,0,1527434652,0,NULL,1),(2306,238,'vidoo.ga','NS','ns2.fastnameserver.eu',180,0,1527434652,0,NULL,1),(2308,238,'vidoo.ga','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018052800 28800 7200 604800 120',180,0,1527434652,0,NULL,1),(2310,22,'claire.fastnameserver.eu','A','108.61.189.13',180,0,1527495754,0,NULL,1),(2312,238,'app.vidoo.ga','A','209.250.244.55',180,0,1527522649,0,NULL,1),(2314,232,'73.1.0.10.in-addr.arpa','PTR','tor.server.pep',180,0,1527679429,0,NULL,1),(2316,234,'tor.server.pep','A','10.0.1.73',180,0,1527679430,0,NULL,1),(2318,234,'dnsbl.server.pep','A','10.0.1.66',180,0,1527855787,0,NULL,1),(2336,242,'*.dnsbl.pep','CNAME','dnsbl.pep',180,0,1527855930,0,NULL,1),(2338,242,'www.dnsbl.pep','CNAME','dnsbl.pep',180,0,1527855934,0,NULL,1),(2340,242,'dnsbl.pep','NS','ns1.fastnameserver.eu',180,0,1527855928,0,NULL,1),(2342,242,'dnsbl.pep','TXT','\"v=spf1 a mx ~all\"',180,0,1527855933,0,NULL,1),(2344,242,'dnsbl.pep','MX','dnsbl.pep',180,10,1527855932,0,NULL,1),(2346,242,'dnsbl.pep','A','10.0.1.66',180,0,1527855931,0,NULL,1),(2348,242,'dnsbl.pep','NS','ns2.fastnameserver.eu',180,0,1527855929,0,NULL,1),(2350,242,'dnsbl.pep','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018060105 28800 7200 604800 120',180,0,1527855869,0,NULL,1),(2352,242,'231.212.216.185.dnsbl.pep','A','127.0.0.3',180,0,1527856069,0,NULL,1),(2354,242,'231.212.216.185.dnsbl.pep','TXT','\"No contact allowed.\"',180,0,1527856095,0,NULL,1),(2356,242,'212.85.100.185.dnsbl.pep','A','127.0.0.3',180,0,1527856216,0,NULL,1),(2358,242,'212.85.100.185.dnsbl.pep','TXT','\"Its a test\"',180,0,1527856231,0,NULL,1),(2360,10,'new.fahrschule-fleischmann.eu','A','209.250.244.55',180,0,1527957594,0,NULL,1),(2364,234,'whois.server.pep','A','10.0.1.74',180,0,1527878763,0,NULL,1),(2366,232,'74.1.0.10.in-addr.arpa','PTR','whois.server.pep',180,0,1527878765,0,NULL,1),(2368,234,'whois.server.pep','A','10.0.1.74',180,0,1527878766,0,NULL,1),(2370,244,'*.arator.ml','CNAME','arator.ml',180,0,1527963870,0,NULL,1),(2372,244,'www.arator.ml','CNAME','arator.ml',180,0,1527963870,0,NULL,1),(2374,244,'arator.ml','NS','ns1.fastnameserver.eu',180,0,1527963870,0,NULL,1),(2376,244,'arator.ml','TXT','v=spf1 a mx ~all',180,0,1527963870,0,NULL,1),(2378,244,'arator.ml','MX','arator.ml',180,10,1527963870,0,NULL,1),(2380,244,'arator.ml','A','209.250.244.55',180,0,1527963870,0,NULL,1),(2382,244,'arator.ml','NS','ns2.fastnameserver.eu',180,0,1527963870,0,NULL,1),(2384,244,'arator.ml','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018060200 28800 7200 604800 120',180,0,1527963870,0,NULL,1),(2386,232,'72.1.0.10.in-addr.arpa','PTR','pve.server.pep',180,0,1527977632,0,NULL,1),(2388,234,'pve.server.pep','A','10.0.1.72',180,0,1527977632,0,NULL,1),(2390,246,'*.cloudporn.ml','CNAME','cloudporn.ml',180,0,1528226965,0,NULL,1),(2392,246,'www.cloudporn.ml','CNAME','cloudporn.ml',180,0,1528226965,0,NULL,1),(2394,246,'cloudporn.ml','NS','ns1.fastnameserver.eu',180,0,1528226965,0,NULL,1),(2396,246,'cloudporn.ml','TXT','\"v=spf1 a mx ~all\"',180,0,1528226965,0,NULL,1),(2398,246,'cloudporn.ml','MX','cloudporn.ml',180,10,1528226965,0,NULL,1),(2400,246,'cloudporn.ml','A','209.250.244.55',180,0,1528226965,0,NULL,1),(2402,246,'cloudporn.ml','NS','ns2.fastnameserver.eu',180,0,1528226965,0,NULL,1),(2404,246,'cloudporn.ml','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018060500 28800 7200 604800 120',180,0,1528025593,0,NULL,1),(2406,246,'data.cloudporn.ml','A','209.250.244.55',180,0,1528226965,0,NULL,1),(2408,56,'wi.gamingplay.de','A','209.250.244.55',180,0,1528222547,0,NULL,1),(2410,248,'*.peppermint.pep','CNAME','peppermint.pep',180,0,1530480212,0,NULL,1),(2412,248,'www.peppermint.pep','CNAME','peppermint.pep',180,0,1530480213,0,NULL,1),(2414,248,'peppermint.pep','NS','ns1.fastnameserver.eu',180,0,1530480212,0,NULL,1),(2416,248,'peppermint.pep','TXT','\"v=spf1 a mx ~all\"',180,0,1530480213,0,NULL,1),(2418,248,'peppermint.pep','MX','peppermint.pep',180,10,1530480212,0,NULL,1),(2420,248,'peppermint.pep','A','10.0.1.70',180,0,1530480212,0,NULL,1),(2422,248,'peppermint.pep','NS','ns2.fastnameserver.eu',180,0,1530480212,0,NULL,1),(2424,248,'peppermint.pep','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018070102 28800 7200 604800 120',180,0,1530480176,0,NULL,1),(2426,248,'api.peppermint.pep','A','10.0.1.70',180,0,1530480219,0,NULL,1),(2432,250,'ntopng.fastnameserver.eu','NS','ns1.fastnameserver.eu',180,0,1531406585,0,NULL,1),(2434,250,'ntopng.fastnameserver.eu','TXT','v=spf1 a mx ~all',180,0,1531406585,0,NULL,1),(2438,250,'ntopng.fastnameserver.eu','A','209.250.244.55',180,0,1531406585,0,NULL,1),(2440,250,'ntopng.fastnameserver.eu','NS','ns2.fastnameserver.eu',180,0,1531406585,0,NULL,1),(2442,250,'ntopng.fastnameserver.eu','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018071200 28800 7200 604800 120',180,0,1531406585,0,NULL,1),(2444,22,'dns.fastnameserver.eu','A','209.250.244.55',180,0,1531413989,0,NULL,1),(2450,252,'proxmox.fastnameserver.eu','NS','ns1.fastnameserver.eu',180,0,1531414312,0,NULL,1),(2452,252,'proxmox.fastnameserver.eu','TXT','v=spf1 a mx ~all',180,0,1531414312,0,NULL,1),(2454,252,'proxmox.fastnameserver.eu','MX','proxmox.fastnameserver.eu',180,10,1531414312,0,NULL,1),(2456,252,'proxmox.fastnameserver.eu','A','209.250.244.55',180,0,1531414312,0,NULL,1),(2458,252,'proxmox.fastnameserver.eu','NS','ns2.fastnameserver.eu',180,0,1531414312,0,NULL,1),(2460,252,'proxmox.fastnameserver.eu','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018071200 28800 7200 604800 120',180,0,1531414312,0,NULL,1),(2464,22,'pki.fastnameserver.eu','A','209.250.244.55',180,0,1531416217,0,NULL,1),(2476,232,'17.1.0.10.in-addr.arpa','PTR','vpn.server.pep',180,0,1532469047,0,NULL,1),(2478,234,'vpn.server.pep','A','10.0.1.17',180,0,1532469048,0,NULL,1),(2480,254,'*.forever-rudi.de','CNAME','forever-rudi.de',180,0,1532897938,0,NULL,1),(2482,254,'www.forever-rudi.de','CNAME','forever-rudi.de',180,0,1532897938,0,NULL,1),(2484,254,'forever-rudi.de','NS','ns1.fastnameserver.eu',180,0,1532897938,0,NULL,1),(2486,254,'forever-rudi.de','TXT','v=spf1 a mx ~all',180,0,1532897938,0,NULL,1),(2488,254,'forever-rudi.de','MX','forever-rudi.de',180,10,1532897938,0,NULL,1),(2490,254,'forever-rudi.de','A','209.250.244.55',180,0,1532897938,0,NULL,1),(2492,254,'forever-rudi.de','NS','ns2.fastnameserver.eu',180,0,1532897938,0,NULL,1),(2494,254,'forever-rudi.de','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018072900 28800 7200 604800 120',180,0,1532897938,0,NULL,1),(2496,256,'*.flp-academy.de','CNAME','flp-academy.de',180,0,1532971649,0,NULL,1),(2498,256,'www.flp-academy.de','CNAME','flp-academy.de',180,0,1532971649,0,NULL,1),(2500,256,'flp-academy.de','NS','ns1.fastnameserver.eu',180,0,1532971649,0,NULL,1),(2502,256,'flp-academy.de','TXT','v=spf1 a mx ~all',180,0,1532971649,0,NULL,1),(2504,256,'flp-academy.de','MX','flp-academy.de',180,10,1532971649,0,NULL,1),(2506,256,'flp-academy.de','A','209.250.244.55',180,0,1532971649,0,NULL,1),(2508,256,'flp-academy.de','NS','ns2.fastnameserver.eu',180,0,1532971649,0,NULL,1),(2510,256,'flp-academy.de','SOA','ns1.fastnameserver.eu dns.fastnameserver.eu 2018073000 28800 7200 604800 120',180,0,1532971649,0,NULL,1),(2512,22,'vpn.fastnameserver.eu','A','95.179.158.233',180,0,1532977947,0,NULL,1),(2514,232,'40.1.0.10.in-addr.arpa','PTR','customervpn.server.pep',180,0,1532977998,0,NULL,1),(2516,234,'customervpn.server.pep','A','10.0.1.40',180,0,1532977999,0,NULL,1),(2518,258,'255.0.10.in-addr.arpa','NS','ns2.fastnameserver.eu',180,0,1532984967,0,NULL,1),(2520,258,'255.0.10.in-addr.arpa','SOA','ns1.fastnameserver.eu dns.dediwerk.de 2018073001 28800 7200 604800 120',180,0,1532984967,0,NULL,1),(2522,258,'255.0.10.in-addr.arpa','NS','ns1.fastnameserver.eu',180,0,1532984967,0,NULL,1),(2524,258,'255.0.10.in-addr.arpa','NS','dn42-ns1.AS4242422506.dn42',180,0,1532984967,0,NULL,1),(2526,258,'1.255.0.10.in-addr.arpa','PTR','customergateway.server.pep',180,0,1532985009,0,NULL,1),(2528,234,'customergateway.server.pep','A','10.0.255.1',180,0,1532985010,0,NULL,1),(2530,22,'grafana.fastnameserver.eu','A','209.250.244.55',180,0,1533043805,0,NULL,1),(2616,234,'my.server.pep','A','10.0.1.70',3600,10,1535142932,0,NULL,1),(2618,234,'cloud.server.pep','A','10.0.1.36',3600,10,1535280856,0,NULL,1),(2620,234,'livestream.server.pep','A','10.0.1.41',3600,10,1535310363,0,NULL,1),(2622,316,'free-teamspeak.com','SOA','ns2.fastnameserver.eu rfxmusic.gmail.com 2018083100 86400 7200 3600000 1800',1800,NULL,1535733660,0,NULL,1),(2624,316,'free-teamspeak.com','NS','ns2.fastnameserver.eu',1800,10,1535733667,0,NULL,1),(2626,316,'free-teamspeak.com','NS','ns1.fastnameserver.eu',1800,10,1535733675,0,NULL,1),(2628,316,'free-teamspeak.com','A','209.250.244.55',3600,10,1535972859,0,NULL,1),(2630,316,'www.free-teamspeak.com','CNAME','free-teamspeak.com',3600,10,1535972875,0,NULL,1),(2632,316,'www.free-teamspeak.com','MX','claire.fastnameserver.eu',3600,10,1535972890,0,NULL,1),(2634,316,'download.free-teamspeak.com','A','209.250.244.55',3600,10,1537479016,0,NULL,1),(2636,316,'wiki.free-teamspeak.com','A','209.250.244.55',3600,10,1537536173,0,NULL,1),(2640,316,'support.free-teamspeak.com','SRV','5 9987 alex.fastnameserver.eu',3600,10,1538400753,0,NULL,1),(2642,16,'monitoring.peppermint.cloud','A','209.250.244.55',3600,10,1538584247,0,NULL,1),(2644,16,'terminal.peppermint.cloud','A','95.179.158.233',3600,10,1538596651,0,NULL,1),(2646,22,'pavel.fastnameserver.eu','A','185.28.101.233',3600,10,1539787511,0,NULL,1),(2648,234,'pavel.server.pep','A','10.0.1.22',3600,10,1539807117,0,NULL,1),(2650,318,'cdn.pep','SOA','ns1.fastnameserver.eu ich.kai.cool 2018103000 86400 7200 3600000 3600',3600,NULL,1540929500,0,NULL,1),(2652,318,'cdn.pep','NS','ns1.fastnameserver.eu',3600,10,1540929525,0,NULL,1),(2654,318,'cdn.pep','NS','ns2.fastnameserver.eu',3600,10,1540929532,0,NULL,1),(2656,318,'origin.cdn.pep','A','10.0.1.37',3600,10,1540929549,0,NULL,1),(2658,16,'cloud.peppermint.cloud','A','85.10.244.162',3600,10,1541190907,0,NULL,1),(2660,16,'office.peppermint.cloud','A','85.10.244.162',3600,10,1541195311,0,NULL,1),(2662,252,'nuernberg.proxmox.fastnameserver.eu','A','85.10.244.162',180,10,1541195539,0,NULL,1),(2664,252,'offenbach.proxmox.fastnameserver.eu','A','85.10.244.162',180,10,1541195547,0,NULL,1),(2666,250,'nuernberg.ntopng.fastnameserver.eu','A','85.10.244.162',180,10,1541195610,0,NULL,1),(2668,250,'offenbach.ntopng.fastnameserver.eu','A','85.10.244.162',180,10,1541195626,0,NULL,1);
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recursor`
--

DROP TABLE IF EXISTS `recursor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recursor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(512) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recursor`
--

LOCK TABLES `recursor` WRITE;
/*!40000 ALTER TABLE `recursor` DISABLE KEYS */;
INSERT INTO `recursor` VALUES (2,'.','176.103.130.130','AdGuard'),(4,'.','176.103.130.131','AdGuard'),(42,'bbs','193.183.98.66','OpenNIC'),(44,'chan','193.183.98.66','OpenNIC'),(46,'cyb','193.183.98.66','OpenNIC'),(48,'dyn','193.183.98.66','OpenNIC'),(50,'geek','193.183.98.66','OpenNIC'),(52,'gopher','193.183.98.66','OpenNIC'),(54,'indy','193.183.98.66','OpenNIC'),(56,'libre','193.183.98.66','OpenNIC'),(58,'neo','193.183.98.66','OpenNIC'),(60,'null','193.183.98.66','OpenNIC'),(62,'o','193.183.98.66','OpenNIC'),(64,'oss','193.183.98.66','OpenNIC'),(66,'oz','193.183.98.66','OpenNIC'),(68,'parody','193.183.98.66','OpenNIC'),(70,'pirate','193.183.98.66','OpenNIC'),(72,'bit','193.183.98.66','OpenNIC'),(74,'lib','193.183.98.66','OpenNIC'),(76,'coin','193.183.98.66','OpenNIC'),(78,'emc','193.183.98.66','OpenNIC'),(80,'bazar','193.183.98.66','OpenNIC'),(82,'fur','193.183.98.66','OpenNIC');
/*!40000 ALTER TABLE `recursor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remember_tokens`
--

DROP TABLE IF EXISTS `remember_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remember_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `token` char(32) NOT NULL,
  `userAgent` varchar(120) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remember_tokens`
--

LOCK TABLES `remember_tokens` WRITE;
/*!40000 ALTER TABLE `remember_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `remember_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reset_passwords`
--

DROP TABLE IF EXISTS `reset_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reset_passwords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `code` varchar(48) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `modifiedAt` int(10) unsigned DEFAULT NULL,
  `reset` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reset_passwords`
--

LOCK TABLES `reset_passwords` WRITE;
/*!40000 ALTER TABLE `reset_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `reset_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `success_logins`
--

DROP TABLE IF EXISTS `success_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `success_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `ipAddress` char(15) NOT NULL,
  `userAgent` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `success_logins`
--

LOCK TABLES `success_logins` WRITE;
/*!40000 ALTER TABLE `success_logins` DISABLE KEYS */;
INSERT INTO `success_logins` VALUES (2,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0'),(4,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0'),(6,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0'),(8,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0'),(10,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0'),(12,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(14,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(16,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(18,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(20,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(22,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(24,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(26,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(28,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(30,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(32,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(34,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(36,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(38,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(40,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(42,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(44,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(46,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(48,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(50,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(52,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(54,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(56,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36'),(58,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(60,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(62,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(64,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(66,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(68,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(70,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(72,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0'),(74,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(76,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(78,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(80,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(82,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(84,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(86,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(88,5,'127.0.0.1','Mozilla/5.0 (Linux; Android 8.1.0; EML-L29 Build/HUAWEIEML-L29) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.91 Mobile Safari/537.36'),(90,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(92,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(94,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(96,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(98,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(100,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(102,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(104,10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(106,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(108,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(110,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(112,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(114,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(116,10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(118,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(120,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(122,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(124,5,'127.0.0.1','Mozilla/5.0 (Linux; Android 8.1.0; EML-L29 Build/HUAWEIEML-L29) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.91 Mobile Safari/537.36'),(126,10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(128,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(130,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(132,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(134,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(136,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(138,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(140,12,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36 OPR/54.0.2952.64'),(142,12,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(144,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(146,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(148,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),(150,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(152,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(154,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(156,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(158,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(160,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(162,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(164,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(166,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(168,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(170,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(172,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(174,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(176,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.75 Safari/537.36'),(178,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(180,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(182,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(184,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(186,5,'127.0.0.1','Mozilla/5.0 (Linux; Android 8.1.0; EML-L29 Build/HUAWEIEML-L29) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Mobile Safari/537.36'),(188,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(190,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36'),(192,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(194,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36'),(196,5,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36'),(198,5,'172.21.0.3','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(200,5,'172.21.0.3','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(202,5,'172.21.0.3','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(204,5,'192.168.208.3','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(206,5,'192.168.208.3','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(208,5,'192.168.208.3','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36'),(210,5,'172.29.0.8','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36'),(212,5,'172.30.0.5','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36'),(214,5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36');
/*!40000 ALTER TABLE `success_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supermasters`
--

DROP TABLE IF EXISTS `supermasters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supermasters` (
  `ip` varchar(64) NOT NULL,
  `nameserver` varchar(255) NOT NULL,
  `account` varchar(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ip`,`nameserver`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supermasters`
--

LOCK TABLES `supermasters` WRITE;
/*!40000 ALTER TABLE `supermasters` DISABLE KEYS */;
/*!40000 ALTER TABLE `supermasters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_domains`
--

DROP TABLE IF EXISTS `top_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_domains` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_domains`
--

LOCK TABLES `top_domains` WRITE;
/*!40000 ALTER TABLE `top_domains` DISABLE KEYS */;
INSERT INTO `top_domains` VALUES ('aaa','aaa'),('aarp','aarp'),('abarth','abarth'),('abb','abb'),('abbott','abbott'),('abbvie','abbvie'),('abc','abc'),('able','able'),('abogado','abogado'),('abudhabi','abudhabi'),('ac','ac'),('academy','academy'),('accenture','accenture'),('accountant','accountant'),('accountants','accountants'),('aco','aco'),('active','active'),('actor','actor'),('ad','ad'),('adac','adac'),('ads','ads'),('adult','adult'),('ae','ae'),('aeg','aeg'),('aero','aero'),('aetna','aetna'),('af','af'),('afamilycompany','afamilycompany'),('afl','afl'),('africa','africa'),('ag','ag'),('agakhan','agakhan'),('agency','agency'),('ai','ai'),('aig','aig'),('aigo','aigo'),('airbus','airbus'),('airforce','airforce'),('airtel','airtel'),('akdn','akdn'),('al','al'),('alfaromeo','alfaromeo'),('alibaba','alibaba'),('alipay','alipay'),('allfinanz','allfinanz'),('allstate','allstate'),('ally','ally'),('alsace','alsace'),('alstom','alstom'),('am','am'),('americanexpress','americanexpress'),('americanfamily','americanfamily'),('amex','amex'),('amfam','amfam'),('amica','amica'),('amsterdam','amsterdam'),('analytics','analytics'),('android','android'),('anquan','anquan'),('anz','anz'),('ao','ao'),('aol','aol'),('apartments','apartments'),('app','app'),('apple','apple'),('aq','aq'),('aquarelle','aquarelle'),('ar','ar'),('arab','arab'),('aramco','aramco'),('archi','archi'),('army','army'),('arpa','arpa'),('art','art'),('arte','arte'),('as','as'),('asda','asda'),('asia','asia'),('associates','associates'),('at','at'),('athleta','athleta'),('attorney','attorney'),('au','au'),('auction','auction'),('audi','audi'),('audible','audible'),('audio','audio'),('auspost','auspost'),('author','author'),('auto','auto'),('autos','autos'),('avianca','avianca'),('aw','aw'),('aws','aws'),('ax','ax'),('axa','axa'),('az','az'),('azure','azure'),('ba','ba'),('baby','baby'),('baidu','baidu'),('banamex','banamex'),('bananarepublic','bananarepublic'),('band','band'),('bank','bank'),('bar','bar'),('barcelona','barcelona'),('barclaycard','barclaycard'),('barclays','barclays'),('barefoot','barefoot'),('bargains','bargains'),('baseball','baseball'),('basketball','basketball'),('bauhaus','bauhaus'),('bayern','bayern'),('bb','bb'),('bbc','bbc'),('bbt','bbt'),('bbva','bbva'),('bcg','bcg'),('bcn','bcn'),('bd','bd'),('be','be'),('beats','beats'),('beauty','beauty'),('beer','beer'),('bentley','bentley'),('berlin','berlin'),('best','best'),('bestbuy','bestbuy'),('bet','bet'),('bf','bf'),('bg','bg'),('bh','bh'),('bharti','bharti'),('bi','bi'),('bible','bible'),('bid','bid'),('bike','bike'),('bing','bing'),('bingo','bingo'),('bio','bio'),('biz','biz'),('bj','bj'),('black','black'),('blackfriday','blackfriday'),('blanco','blanco'),('blockbuster','blockbuster'),('blog','blog'),('bloomberg','bloomberg'),('blue','blue'),('bm','bm'),('bms','bms'),('bmw','bmw'),('bn','bn'),('bnl','bnl'),('bnpparibas','bnpparibas'),('bo','bo'),('boats','boats'),('boehringer','boehringer'),('bofa','bofa'),('bom','bom'),('bond','bond'),('boo','boo'),('book','book'),('booking','booking'),('bosch','bosch'),('bostik','bostik'),('boston','boston'),('bot','bot'),('boutique','boutique'),('box','box'),('br','br'),('bradesco','bradesco'),('bridgestone','bridgestone'),('broadway','broadway'),('broker','broker'),('brother','brother'),('brussels','brussels'),('bs','bs'),('bt','bt'),('budapest','budapest'),('bugatti','bugatti'),('build','build'),('builders','builders'),('business','business'),('buy','buy'),('buzz','buzz'),('bv','bv'),('bw','bw'),('by','by'),('bz','bz'),('bzh','bzh'),('ca','ca'),('cab','cab'),('cafe','cafe'),('cal','cal'),('call','call'),('calvinklein','calvinklein'),('cam','cam'),('camera','camera'),('camp','camp'),('cancerresearch','cancerresearch'),('canon','canon'),('capetown','capetown'),('capital','capital'),('capitalone','capitalone'),('car','car'),('caravan','caravan'),('cards','cards'),('care','care'),('career','career'),('careers','careers'),('cars','cars'),('cartier','cartier'),('casa','casa'),('case','case'),('caseih','caseih'),('cash','cash'),('casino','casino'),('cat','cat'),('catering','catering'),('catholic','catholic'),('cba','cba'),('cbn','cbn'),('cbre','cbre'),('cbs','cbs'),('cc','cc'),('cd','cd'),('ceb','ceb'),('center','center'),('ceo','ceo'),('cern','cern'),('cf','cf'),('cfa','cfa'),('cfd','cfd'),('cg','cg'),('ch','ch'),('chanel','chanel'),('channel','channel'),('chase','chase'),('chat','chat'),('cheap','cheap'),('chintai','chintai'),('christmas','christmas'),('chrome','chrome'),('chrysler','chrysler'),('church','church'),('ci','ci'),('cipriani','cipriani'),('circle','circle'),('cisco','cisco'),('citadel','citadel'),('citi','citi'),('citic','citic'),('city','city'),('cityeats','cityeats'),('ck','ck'),('cl','cl'),('claims','claims'),('cleaning','cleaning'),('click','click'),('clinic','clinic'),('clinique','clinique'),('clothing','clothing'),('cloud','cloud'),('club','club'),('clubmed','clubmed'),('cm','cm'),('cn','cn'),('co','co'),('coach','coach'),('codes','codes'),('coffee','coffee'),('college','college'),('cologne','cologne'),('com','com'),('comcast','comcast'),('commbank','commbank'),('community','community'),('company','company'),('compare','compare'),('computer','computer'),('comsec','comsec'),('condos','condos'),('construction','construction'),('consulting','consulting'),('contact','contact'),('contractors','contractors'),('cooking','cooking'),('cookingchannel','cookingchannel'),('cool','cool'),('coop','coop'),('corsica','corsica'),('country','country'),('coupon','coupon'),('coupons','coupons'),('courses','courses'),('cr','cr'),('credit','credit'),('creditcard','creditcard'),('creditunion','creditunion'),('cricket','cricket'),('crown','crown'),('crs','crs'),('cruise','cruise'),('cruises','cruises'),('csc','csc'),('cu','cu'),('cuisinella','cuisinella'),('cv','cv'),('cw','cw'),('cx','cx'),('cy','cy'),('cymru','cymru'),('cyou','cyou'),('cz','cz'),('dabur','dabur'),('dad','dad'),('dance','dance'),('data','data'),('date','date'),('dating','dating'),('datsun','datsun'),('day','day'),('dclk','dclk'),('dds','dds'),('de','de'),('deal','deal'),('dealer','dealer'),('deals','deals'),('degree','degree'),('delivery','delivery'),('dell','dell'),('deloitte','deloitte'),('delta','delta'),('democrat','democrat'),('dental','dental'),('dentist','dentist'),('desi','desi'),('design','design'),('dev','dev'),('dhl','dhl'),('diamonds','diamonds'),('diet','diet'),('digital','digital'),('direct','direct'),('directory','directory'),('discount','discount'),('discover','discover'),('dish','dish'),('diy','diy'),('dj','dj'),('dk','dk'),('dm','dm'),('dnp','dnp'),('do','do'),('docs','docs'),('doctor','doctor'),('dodge','dodge'),('dog','dog'),('doha','doha'),('domains','domains'),('dot','dot'),('download','download'),('drive','drive'),('dtv','dtv'),('dubai','dubai'),('duck','duck'),('dunlop','dunlop'),('duns','duns'),('dupont','dupont'),('durban','durban'),('dvag','dvag'),('dvr','dvr'),('dz','dz'),('earth','earth'),('eat','eat'),('ec','ec'),('eco','eco'),('edeka','edeka'),('edu','edu'),('education','education'),('ee','ee'),('eg','eg'),('email','email'),('emerck','emerck'),('energy','energy'),('engineer','engineer'),('engineering','engineering'),('enterprises','enterprises'),('epost','epost'),('epson','epson'),('equipment','equipment'),('er','er'),('ericsson','ericsson'),('erni','erni'),('es','es'),('esq','esq'),('estate','estate'),('esurance','esurance'),('et','et'),('etisalat','etisalat'),('eu','eu'),('eurovision','eurovision'),('eus','eus'),('events','events'),('everbank','everbank'),('exchange','exchange'),('expert','expert'),('exposed','exposed'),('express','express'),('extraspace','extraspace'),('fage','fage'),('fail','fail'),('fairwinds','fairwinds'),('faith','faith'),('family','family'),('fan','fan'),('fans','fans'),('farm','farm'),('farmers','farmers'),('fashion','fashion'),('fast','fast'),('fedex','fedex'),('feedback','feedback'),('ferrari','ferrari'),('ferrero','ferrero'),('fi','fi'),('fiat','fiat'),('fidelity','fidelity'),('fido','fido'),('film','film'),('final','final'),('finance','finance'),('financial','financial'),('fire','fire'),('firestone','firestone'),('firmdale','firmdale'),('fish','fish'),('fishing','fishing'),('fit','fit'),('fitness','fitness'),('fj','fj'),('fk','fk'),('flickr','flickr'),('flights','flights'),('flir','flir'),('florist','florist'),('flowers','flowers'),('fly','fly'),('fm','fm'),('fo','fo'),('foo','foo'),('food','food'),('foodnetwork','foodnetwork'),('football','football'),('ford','ford'),('forex','forex'),('forsale','forsale'),('forum','forum'),('foundation','foundation'),('fox','fox'),('fr','fr'),('free','free'),('fresenius','fresenius'),('frl','frl'),('frogans','frogans'),('frontdoor','frontdoor'),('frontier','frontier'),('ftr','ftr'),('fujitsu','fujitsu'),('fujixerox','fujixerox'),('fun','fun'),('fund','fund'),('furniture','furniture'),('futbol','futbol'),('fyi','fyi'),('ga','ga'),('gal','gal'),('gallery','gallery'),('gallo','gallo'),('gallup','gallup'),('game','game'),('games','games'),('gap','gap'),('garden','garden'),('gb','gb'),('gbiz','gbiz'),('gd','gd'),('gdn','gdn'),('ge','ge'),('gea','gea'),('gent','gent'),('genting','genting'),('george','george'),('gf','gf'),('gg','gg'),('ggee','ggee'),('gh','gh'),('gi','gi'),('gift','gift'),('gifts','gifts'),('gives','gives'),('giving','giving'),('gl','gl'),('glade','glade'),('glass','glass'),('gle','gle'),('global','global'),('globo','globo'),('gm','gm'),('gmail','gmail'),('gmbh','gmbh'),('gmo','gmo'),('gmx','gmx'),('gn','gn'),('godaddy','godaddy'),('gold','gold'),('goldpoint','goldpoint'),('golf','golf'),('goo','goo'),('goodhands','goodhands'),('goodyear','goodyear'),('goog','goog'),('google','google'),('gop','gop'),('got','got'),('gov','gov'),('gp','gp'),('gq','gq'),('gr','gr'),('grainger','grainger'),('graphics','graphics'),('gratis','gratis'),('green','green'),('gripe','gripe'),('grocery','grocery'),('group','group'),('gs','gs'),('gt','gt'),('gu','gu'),('guardian','guardian'),('gucci','gucci'),('guge','guge'),('guide','guide'),('guitars','guitars'),('guru','guru'),('gw','gw'),('gy','gy'),('hair','hair'),('hamburg','hamburg'),('hangout','hangout'),('haus','haus'),('hbo','hbo'),('hdfc','hdfc'),('hdfcbank','hdfcbank'),('health','health'),('healthcare','healthcare'),('help','help'),('helsinki','helsinki'),('here','here'),('hermes','hermes'),('hgtv','hgtv'),('hiphop','hiphop'),('hisamitsu','hisamitsu'),('hitachi','hitachi'),('hiv','hiv'),('hk','hk'),('hkt','hkt'),('hm','hm'),('hn','hn'),('hockey','hockey'),('holdings','holdings'),('holiday','holiday'),('homedepot','homedepot'),('homegoods','homegoods'),('homes','homes'),('homesense','homesense'),('honda','honda'),('honeywell','honeywell'),('horse','horse'),('hospital','hospital'),('host','host'),('hosting','hosting'),('hot','hot'),('hoteles','hoteles'),('hotels','hotels'),('hotmail','hotmail'),('house','house'),('how','how'),('hr','hr'),('hsbc','hsbc'),('ht','ht'),('hu','hu'),('hughes','hughes'),('hyatt','hyatt'),('hyundai','hyundai'),('ibm','ibm'),('icbc','icbc'),('ice','ice'),('icu','icu'),('id','id'),('ie','ie'),('ieee','ieee'),('ifm','ifm'),('ikano','ikano'),('il','il'),('im','im'),('imamat','imamat'),('imdb','imdb'),('immo','immo'),('immobilien','immobilien'),('in','in'),('in-addr.arpa','in-addr.arpa'),('industries','industries'),('infiniti','infiniti'),('info','info'),('ing','ing'),('ink','ink'),('institute','institute'),('insurance','insurance'),('insure','insure'),('int','int'),('intel','intel'),('international','international'),('intuit','intuit'),('investments','investments'),('io','io'),('ip6.arpa','ip6.arpa'),('ipiranga','ipiranga'),('iq','iq'),('ir','ir'),('irish','irish'),('is','is'),('iselect','iselect'),('ismaili','ismaili'),('ist','ist'),('istanbul','istanbul'),('it','it'),('itau','itau'),('itv','itv'),('iveco','iveco'),('iwc','iwc'),('jaguar','jaguar'),('java','java'),('jcb','jcb'),('jcp','jcp'),('je','je'),('jeep','jeep'),('jetzt','jetzt'),('jewelry','jewelry'),('jio','jio'),('jlc','jlc'),('jll','jll'),('jm','jm'),('jmp','jmp'),('jnj','jnj'),('jo','jo'),('jobs','jobs'),('joburg','joburg'),('jot','jot'),('joy','joy'),('jp','jp'),('jpmorgan','jpmorgan'),('jprs','jprs'),('juegos','juegos'),('juniper','juniper'),('kaufen','kaufen'),('kddi','kddi'),('ke','ke'),('kerryhotels','kerryhotels'),('kerrylogistics','kerrylogistics'),('kerryproperties','kerryproperties'),('kfh','kfh'),('kg','kg'),('kh','kh'),('ki','ki'),('kia','kia'),('kim','kim'),('kinder','kinder'),('kindle','kindle'),('kitchen','kitchen'),('kiwi','kiwi'),('km','km'),('kn','kn'),('koeln','koeln'),('komatsu','komatsu'),('kosher','kosher'),('kp','kp'),('kpmg','kpmg'),('kpn','kpn'),('kr','kr'),('krd','krd'),('kred','kred'),('kuokgroup','kuokgroup'),('kw','kw'),('ky','ky'),('kyoto','kyoto'),('kz','kz'),('la','la'),('lacaixa','lacaixa'),('ladbrokes','ladbrokes'),('lamborghini','lamborghini'),('lamer','lamer'),('lancaster','lancaster'),('lancia','lancia'),('lancome','lancome'),('land','land'),('landrover','landrover'),('lanxess','lanxess'),('lasalle','lasalle'),('lat','lat'),('latino','latino'),('latrobe','latrobe'),('law','law'),('lawyer','lawyer'),('lb','lb'),('lc','lc'),('lds','lds'),('lease','lease'),('leclerc','leclerc'),('lefrak','lefrak'),('legal','legal'),('lego','lego'),('lexus','lexus'),('lgbt','lgbt'),('li','li'),('liaison','liaison'),('lidl','lidl'),('life','life'),('lifeinsurance','lifeinsurance'),('lifestyle','lifestyle'),('lighting','lighting'),('like','like'),('lilly','lilly'),('limited','limited'),('limo','limo'),('lincoln','lincoln'),('linde','linde'),('link','link'),('lipsy','lipsy'),('live','live'),('living','living'),('lixil','lixil'),('lk','lk'),('llc','llc'),('loan','loan'),('loans','loans'),('locker','locker'),('locus','locus'),('loft','loft'),('lol','lol'),('london','london'),('lotte','lotte'),('lotto','lotto'),('love','love'),('lpl','lpl'),('lplfinancial','lplfinancial'),('lr','lr'),('ls','ls'),('lt','lt'),('ltd','ltd'),('ltda','ltda'),('lu','lu'),('lundbeck','lundbeck'),('lupin','lupin'),('luxe','luxe'),('luxury','luxury'),('lv','lv'),('ly','ly'),('ma','ma'),('macys','macys'),('madrid','madrid'),('maif','maif'),('maison','maison'),('makeup','makeup'),('man','man'),('management','management'),('mango','mango'),('map','map'),('market','market'),('marketing','marketing'),('markets','markets'),('marriott','marriott'),('marshalls','marshalls'),('maserati','maserati'),('mattel','mattel'),('mba','mba'),('mc','mc'),('mckinsey','mckinsey'),('md','md'),('me','me'),('med','med'),('media','media'),('meet','meet'),('melbourne','melbourne'),('meme','meme'),('memorial','memorial'),('men','men'),('menu','menu'),('meo','meo'),('merckmsd','merckmsd'),('metlife','metlife'),('mg','mg'),('mh','mh'),('miami','miami'),('microsoft','microsoft'),('mil','mil'),('mini','mini'),('mint','mint'),('mit','mit'),('mitsubishi','mitsubishi'),('mk','mk'),('ml','ml'),('mlb','mlb'),('mls','mls'),('mm','mm'),('mma','mma'),('mn','mn'),('mo','mo'),('mobi','mobi'),('mobile','mobile'),('mobily','mobily'),('moda','moda'),('moe','moe'),('moi','moi'),('mom','mom'),('monash','monash'),('money','money'),('monster','monster'),('mopar','mopar'),('mormon','mormon'),('mortgage','mortgage'),('moscow','moscow'),('moto','moto'),('motorcycles','motorcycles'),('mov','mov'),('movie','movie'),('movistar','movistar'),('mp','mp'),('mq','mq'),('mr','mr'),('ms','ms'),('msd','msd'),('mt','mt'),('mtn','mtn'),('mtr','mtr'),('mu','mu'),('museum','museum'),('mutual','mutual'),('mv','mv'),('mw','mw'),('mx','mx'),('my','my'),('mz','mz'),('na','na'),('nab','nab'),('nadex','nadex'),('nagoya','nagoya'),('name','name'),('nationwide','nationwide'),('natura','natura'),('navy','navy'),('nba','nba'),('nc','nc'),('ne','ne'),('nec','nec'),('net','net'),('netbank','netbank'),('netflix','netflix'),('network','network'),('neustar','neustar'),('new','new'),('newholland','newholland'),('news','news'),('next','next'),('nextdirect','nextdirect'),('nexus','nexus'),('nf','nf'),('nfl','nfl'),('ng','ng'),('ngo','ngo'),('nhk','nhk'),('ni','ni'),('nico','nico'),('nike','nike'),('nikon','nikon'),('ninja','ninja'),('nissan','nissan'),('nissay','nissay'),('nl','nl'),('no','no'),('nokia','nokia'),('northwesternmutual','northwesternmutual'),('norton','norton'),('now','now'),('nowruz','nowruz'),('nowtv','nowtv'),('np','np'),('nr','nr'),('nra','nra'),('nrw','nrw'),('ntt','ntt'),('nu','nu'),('nyc','nyc'),('nz','nz'),('obi','obi'),('observer','observer'),('off','off'),('office','office'),('okinawa','okinawa'),('olayan','olayan'),('olayangroup','olayangroup'),('oldnavy','oldnavy'),('ollo','ollo'),('om','om'),('omega','omega'),('one','one'),('ong','ong'),('onl','onl'),('online','online'),('onyourside','onyourside'),('ooo','ooo'),('open','open'),('oracle','oracle'),('orange','orange'),('org','org'),('organic','organic'),('origins','origins'),('osaka','osaka'),('otsuka','otsuka'),('ott','ott'),('ovh','ovh'),('pa','pa'),('page','page'),('panasonic','panasonic'),('panerai','panerai'),('paris','paris'),('pars','pars'),('partners','partners'),('parts','parts'),('party','party'),('passagens','passagens'),('pay','pay'),('pccw','pccw'),('pe','pe'),('pep','pep'),('pet','pet'),('pf','pf'),('pfizer','pfizer'),('pg','pg'),('ph','ph'),('pharmacy','pharmacy'),('phd','phd'),('philips','philips'),('phone','phone'),('photo','photo'),('photography','photography'),('photos','photos'),('physio','physio'),('piaget','piaget'),('pics','pics'),('pictet','pictet'),('pictures','pictures'),('pid','pid'),('pin','pin'),('ping','ping'),('pink','pink'),('pioneer','pioneer'),('pizza','pizza'),('pk','pk'),('pl','pl'),('place','place'),('play','play'),('playstation','playstation'),('plumbing','plumbing'),('plus','plus'),('pm','pm'),('pn','pn'),('pnc','pnc'),('pohl','pohl'),('poker','poker'),('politie','politie'),('porn','porn'),('post','post'),('pr','pr'),('pramerica','pramerica'),('praxi','praxi'),('press','press'),('prime','prime'),('pro','pro'),('prod','prod'),('productions','productions'),('prof','prof'),('progressive','progressive'),('promo','promo'),('properties','properties'),('property','property'),('protection','protection'),('pru','pru'),('prudential','prudential'),('ps','ps'),('pt','pt'),('pub','pub'),('pw','pw'),('pwc','pwc'),('py','py'),('qa','qa'),('qpon','qpon'),('quebec','quebec'),('quest','quest'),('qvc','qvc'),('racing','racing'),('radio','radio'),('raid','raid'),('re','re'),('read','read'),('realestate','realestate'),('realtor','realtor'),('realty','realty'),('recipes','recipes'),('red','red'),('redstone','redstone'),('redumbrella','redumbrella'),('rehab','rehab'),('reise','reise'),('reisen','reisen'),('reit','reit'),('reliance','reliance'),('ren','ren'),('rent','rent'),('rentals','rentals'),('repair','repair'),('report','report'),('republican','republican'),('rest','rest'),('restaurant','restaurant'),('review','review'),('reviews','reviews'),('rexroth','rexroth'),('rich','rich'),('richardli','richardli'),('ricoh','ricoh'),('rightathome','rightathome'),('ril','ril'),('rio','rio'),('rip','rip'),('rmit','rmit'),('ro','ro'),('rocher','rocher'),('rocks','rocks'),('rodeo','rodeo'),('rogers','rogers'),('room','room'),('rs','rs'),('rsvp','rsvp'),('ru','ru'),('rugby','rugby'),('ruhr','ruhr'),('run','run'),('rw','rw'),('rwe','rwe'),('ryukyu','ryukyu'),('sa','sa'),('saarland','saarland'),('safe','safe'),('safety','safety'),('sakura','sakura'),('sale','sale'),('salon','salon'),('samsclub','samsclub'),('samsung','samsung'),('sandvik','sandvik'),('sandvikcoromant','sandvikcoromant'),('sanofi','sanofi'),('sap','sap'),('sapo','sapo'),('sarl','sarl'),('sas','sas'),('save','save'),('saxo','saxo'),('sb','sb'),('sbi','sbi'),('sbs','sbs'),('sc','sc'),('sca','sca'),('scb','scb'),('schaeffler','schaeffler'),('schmidt','schmidt'),('scholarships','scholarships'),('school','school'),('schule','schule'),('schwarz','schwarz'),('science','science'),('scjohnson','scjohnson'),('scor','scor'),('scot','scot'),('sd','sd'),('se','se'),('search','search'),('seat','seat'),('secure','secure'),('security','security'),('seek','seek'),('select','select'),('sener','sener'),('services','services'),('ses','ses'),('seven','seven'),('sew','sew'),('sex','sex'),('sexy','sexy'),('sfr','sfr'),('sg','sg'),('sh','sh'),('shangrila','shangrila'),('sharp','sharp'),('shaw','shaw'),('shell','shell'),('shia','shia'),('shiksha','shiksha'),('shoes','shoes'),('shop','shop'),('shopping','shopping'),('shouji','shouji'),('show','show'),('showtime','showtime'),('shriram','shriram'),('si','si'),('silk','silk'),('sina','sina'),('singles','singles'),('site','site'),('sj','sj'),('sk','sk'),('ski','ski'),('skin','skin'),('sky','sky'),('skype','skype'),('sl','sl'),('sling','sling'),('sm','sm'),('smart','smart'),('smile','smile'),('sn','sn'),('sncf','sncf'),('so','so'),('soccer','soccer'),('social','social'),('softbank','softbank'),('software','software'),('sohu','sohu'),('solar','solar'),('solutions','solutions'),('song','song'),('sony','sony'),('soy','soy'),('space','space'),('spiegel','spiegel'),('sport','sport'),('spot','spot'),('spreadbetting','spreadbetting'),('sr','sr'),('srl','srl'),('srt','srt'),('st','st'),('stada','stada'),('staples','staples'),('star','star'),('starhub','starhub'),('statebank','statebank'),('statefarm','statefarm'),('statoil','statoil'),('stc','stc'),('stcgroup','stcgroup'),('stockholm','stockholm'),('storage','storage'),('store','store'),('stream','stream'),('studio','studio'),('study','study'),('style','style'),('su','su'),('sucks','sucks'),('supplies','supplies'),('supply','supply'),('support','support'),('surf','surf'),('surgery','surgery'),('suzuki','suzuki'),('sv','sv'),('swatch','swatch'),('swiftcover','swiftcover'),('swiss','swiss'),('sx','sx'),('sy','sy'),('sydney','sydney'),('symantec','symantec'),('systems','systems'),('sz','sz'),('tab','tab'),('taipei','taipei'),('talk','talk'),('taobao','taobao'),('target','target'),('tatamotors','tatamotors'),('tatar','tatar'),('tattoo','tattoo'),('tax','tax'),('taxi','taxi'),('tc','tc'),('tci','tci'),('td','td'),('tdk','tdk'),('team','team'),('tech','tech'),('technology','technology'),('tel','tel'),('telecity','telecity'),('telefonica','telefonica'),('temasek','temasek'),('tennis','tennis'),('teva','teva'),('tf','tf'),('tg','tg'),('th','th'),('thd','thd'),('theater','theater'),('theatre','theatre'),('tiaa','tiaa'),('tickets','tickets'),('tienda','tienda'),('tiffany','tiffany'),('tips','tips'),('tires','tires'),('tirol','tirol'),('tj','tj'),('tjmaxx','tjmaxx'),('tjx','tjx'),('tk','tk'),('tkmaxx','tkmaxx'),('tl','tl'),('tm','tm'),('tmall','tmall'),('tn','tn'),('to','to'),('today','today'),('tokyo','tokyo'),('tools','tools'),('top','top'),('toray','toray'),('toshiba','toshiba'),('total','total'),('tours','tours'),('town','town'),('toyota','toyota'),('toys','toys'),('tr','tr'),('trade','trade'),('trading','trading'),('training','training'),('travel','travel'),('travelchannel','travelchannel'),('travelers','travelers'),('travelersinsurance','travelersinsurance'),('trust','trust'),('trv','trv'),('tt','tt'),('tube','tube'),('tui','tui'),('tunes','tunes'),('tushu','tushu'),('tv','tv'),('tvs','tvs'),('tw','tw'),('tz','tz'),('ua','ua'),('ubank','ubank'),('ubs','ubs'),('uconnect','uconnect'),('ug','ug'),('uk','uk'),('unicom','unicom'),('university','university'),('uno','uno'),('uol','uol'),('ups','ups'),('us','us'),('uy','uy'),('uz','uz'),('va','va'),('vacations','vacations'),('vana','vana'),('vanguard','vanguard'),('vc','vc'),('ve','ve'),('vegas','vegas'),('ventures','ventures'),('verisign','verisign'),('versicherung','versicherung'),('vet','vet'),('vg','vg'),('vi','vi'),('viajes','viajes'),('video','video'),('vig','vig'),('viking','viking'),('villas','villas'),('vin','vin'),('vip','vip'),('virgin','virgin'),('visa','visa'),('vision','vision'),('vista','vista'),('vistaprint','vistaprint'),('viva','viva'),('vivo','vivo'),('vlaanderen','vlaanderen'),('vn','vn'),('vodka','vodka'),('volkswagen','volkswagen'),('volvo','volvo'),('vote','vote'),('voting','voting'),('voto','voto'),('voyage','voyage'),('vu','vu'),('vuelos','vuelos'),('wales','wales'),('walmart','walmart'),('walter','walter'),('wang','wang'),('wanggou','wanggou'),('warman','warman'),('watch','watch'),('watches','watches'),('weather','weather'),('weatherchannel','weatherchannel'),('webcam','webcam'),('weber','weber'),('website','website'),('wed','wed'),('wedding','wedding'),('weibo','weibo'),('weir','weir'),('wf','wf'),('whoswho','whoswho'),('wien','wien'),('wiki','wiki'),('williamhill','williamhill'),('win','win'),('windows','windows'),('wine','wine'),('winners','winners'),('wme','wme'),('wolterskluwer','wolterskluwer'),('woodside','woodside'),('work','work'),('works','works'),('world','world'),('wow','wow'),('ws','ws'),('wtc','wtc'),('wtf','wtf'),('xbox','xbox'),('xerox','xerox'),('xfinity','xfinity'),('xihuan','xihuan'),('xin','xin'),('xn--11b4c3d','कॉम'),('xn--1ck2e1b','セール'),('xn--1qqw23a','佛山'),('xn--2scrj9c','ಭಾರತ'),('xn--30rr7y','慈善'),('xn--3bst00m','集团'),('xn--3ds443g','在线'),('xn--3e0b707e','한국'),('xn--3hcrj9c','ଭାରତ'),('xn--3oq18vl8pn36a','大众汽车'),('xn--3pxu8k','点看'),('xn--42c2d9a','คอม'),('xn--45br5cyl','ভাৰত'),('xn--45brj9c','ভারত'),('xn--45q11c','八卦'),('xn--4gbrim','موقع'),('xn--54b7fta0cc','বাংলা'),('xn--55qw42g','公益'),('xn--55qx5d','公司'),('xn--5su34j936bgsg','香格里拉'),('xn--5tzm5g','网站'),('xn--6frz82g','移动'),('xn--6qq986b3xl','我爱你'),('xn--80adxhks','москва'),('xn--80ao21a','қаз'),('xn--80aqecdr1a','католик'),('xn--80asehdb','онлайн'),('xn--80aswg','сайт'),('xn--8y0a063a','联通'),('xn--90a3ac','срб'),('xn--90ae','бг'),('xn--90ais','бел'),('xn--9dbq2a','קום'),('xn--9et52u','时尚'),('xn--9krt00a','微博'),('xn--b4w605ferd','淡马锡'),('xn--bck1b9a5dre4c','ファッション'),('xn--c1avg','орг'),('xn--c2br7g','नेट'),('xn--cck2b3b','ストア'),('xn--cg4bki','삼성'),('xn--clchc0ea0b2g2a9gcd','சிங்கப்பூர்'),('xn--czr694b','商标'),('xn--czrs0t','商店'),('xn--czru2d','商城'),('xn--d1acj3b','дети'),('xn--d1alf','мкд'),('xn--e1a4c','ею'),('xn--eckvdtc9d','ポイント'),('xn--efvy88h','新闻'),('xn--estv75g','工行'),('xn--fct429k','家電'),('xn--fhbei','كوم'),('xn--fiq228c5hs','中文网'),('xn--fiq64b','中信'),('xn--fiqs8s','中国'),('xn--fiqz9s','中國'),('xn--fjq720a','娱乐'),('xn--flw351e','谷歌'),('xn--fpcrj9c3d','భారత్'),('xn--fzc2c9e2c','ලංකා'),('xn--fzys8d69uvgm','電訊盈科'),('xn--g2xx48c','购物'),('xn--gckr3f0f','クラウド'),('xn--gecrj9c','ભારત'),('xn--gk3at1e','通販'),('xn--h2breg3eve','भारतम्'),('xn--h2brj9c','भारत'),('xn--h2brj9c8c','भारोत'),('xn--hxt814e','网店'),('xn--i1b6b1a6a2e','संगठन'),('xn--imr513n','餐厅'),('xn--io0a7i','网络'),('xn--j1aef','ком'),('xn--j1amh','укр'),('xn--j6w193g','香港'),('xn--jlq61u9w7b','诺基亚'),('xn--jvr189m','食品'),('xn--kcrx77d1x4a','飞利浦'),('xn--kprw13d','台湾'),('xn--kpry57d','台灣'),('xn--kpu716f','手表'),('xn--kput3i','手机'),('xn--l1acc','мон'),('xn--lgbbat1ad8j','الجزائر'),('xn--mgb9awbf','عمان'),('xn--mgba3a3ejt','ارامكو'),('xn--mgba3a4f16a','ایران'),('xn--mgba7c0bbn0a','العليان'),('xn--mgbaakc7dvf','اتصالات'),('xn--mgbaam7a8h','امارات'),('xn--mgbab2bd','بازار'),('xn--mgbai9azgqp6j','پاکستان'),('xn--mgbayh7gpa','الاردن'),('xn--mgbb9fbpob','موبايلي'),('xn--mgbbh1a','بارت'),('xn--mgbbh1a71e','بھارت'),('xn--mgbc0a9azcg','المغرب'),('xn--mgbca7dzdo','ابوظبي'),('xn--mgberp4a5d4ar','السعودية'),('xn--mgbgu82a','ڀارت'),('xn--mgbi4ecexp','كاثوليك'),('xn--mgbpl2fh','سودان'),('xn--mgbt3dhd','همراه'),('xn--mgbtx2b','عراق'),('xn--mgbx4cd0ab','مليسيا'),('xn--mix891f','澳門'),('xn--mk1bu44c','닷컴'),('xn--mxtq1m','政府'),('xn--ngbc5azd','شبكة'),('xn--ngbe9e0a','بيتك'),('xn--ngbrx','عرب'),('xn--node','გე'),('xn--nqv7f','机构'),('xn--nqv7fs00ema','组织机构'),('xn--nyqy26a','健康'),('xn--o3cw4h','ไทย'),('xn--ogbpf8fl','سورية'),('xn--otu796d','招聘'),('xn--p1acf','рус'),('xn--p1ai','рф'),('xn--pbt977c','珠宝'),('xn--pgbs0dh','تونس'),('xn--pssy2u','大拿'),('xn--q9jyb4c','みんな'),('xn--qcka1pmc','グーグル'),('xn--qxam','ελ'),('xn--rhqv96g','世界'),('xn--rovu88b','書籍'),('xn--rvc1e0am3e','ഭാരതം'),('xn--s9brj9c','ਭਾਰਤ'),('xn--ses554g','网址'),('xn--t60b56a','닷넷'),('xn--tckwe','コム'),('xn--tiq49xqyj','天主教'),('xn--unup4y','游戏'),('xn--vermgensberater-ctb','vermögensberater'),('xn--vermgensberatung-pwb','vermögensberatung'),('xn--vhquv','企业'),('xn--vuq861b','信息'),('xn--w4r85el8fhu5dnra','嘉里大酒店'),('xn--w4rs40l','嘉里'),('xn--wgbh1c','مصر'),('xn--wgbl6a','قطر'),('xn--xhq521b','广东'),('xn--xkc2al3hye2a','இலங்கை'),('xn--xkc2dl3a5ee0h','இந்தியா'),('xn--y9a3aq','հայ'),('xn--yfro4i67o','新加坡'),('xn--ygbi2ammx','فلسطين'),('xn--zfr164b','政务'),('xperia','xperia'),('xxx','xxx'),('xyz','xyz'),('yachts','yachts'),('yahoo','yahoo'),('yamaxun','yamaxun'),('yandex','yandex'),('ye','ye'),('yodobashi','yodobashi'),('yoga','yoga'),('yokohama','yokohama'),('you','you'),('youtube','youtube'),('yt','yt'),('yun','yun'),('za','za'),('zappos','zappos'),('zara','zara'),('zero','zero'),('zip','zip'),('zippo','zippo'),('zm','zm'),('zone','zone'),('zuerich','zuerich'),('zw','zw');
/*!40000 ALTER TABLE `top_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsigkeys`
--

DROP TABLE IF EXISTS `tsigkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsigkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `algorithm` varchar(50) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namealgoindex` (`name`,`algorithm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsigkeys`
--

LOCK TABLES `tsigkeys` WRITE;
/*!40000 ALTER TABLE `tsigkeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsigkeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` char(60) NOT NULL,
  `mustChangePassword` char(1) DEFAULT NULL,
  `profilesId` int(10) unsigned NOT NULL,
  `banned` char(1) NOT NULL,
  `suspended` char(1) NOT NULL,
  `active` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profilesId` (`profilesId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'Kai Pazdzewicz','ich@kai.cool','$2y$08$aDV6RE8zNVZTUForS3owd.8g9.YAEKDiZqcvQGgEai5es3gNKdEVW','N',1,'N','N','Y'),(10,'Kai Pazdzewicz','kai@pazdzewicz.de','$2y$08$ODc3WHhEOHdnRjhMTTFaS.Ut/WOyRxMzlCaDxEk451sF3sSUZFJVC','N',2,'N','N','Y'),(12,'Lukas Czimenga','rfxmusic@gmail.com','$2y$08$ZGdROGZkYk5JRHU2VUk0b.PM3fQ1iz00/UtZN8sqkHDUT.ee206gW','N',1,'N','N','Y');
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

-- Dump completed on 2018-11-05 22:47:32
