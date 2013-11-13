-- MySQL dump 10.13  Distrib 5.1.50, for Win32 (ia32)
--
-- Host: localhost    Database: sms_server
-- ------------------------------------------------------
-- Server version	5.1.50-community

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` varchar(50) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `billing_id` varchar(50) NOT NULL,
  `accept_sms` tinyint(1) DEFAULT '1',
  `send_sms` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permitted_applications`
--

DROP TABLE IF EXISTS `permitted_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permitted_applications` (
  `id` varchar(50) NOT NULL,
  `application_name` varchar(50) NOT NULL,
  `accept_sms` tinyint(1) DEFAULT '1',
  `send_sms` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `primary_queue`
--

DROP TABLE IF EXISTS `primary_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `primary_queue` (
  `id` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `message_text` varchar(1000) NOT NULL,
  `schedule` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `posted` int(1) DEFAULT '0',
  `notified` int(1) DEFAULT '0',
  `billed` int(1) DEFAULT '0',
  `posted_last_attempt` timestamp NULL DEFAULT NULL,
  `notified_last_attempt` timestamp NULL DEFAULT NULL,
  `billed_last_attempt` timestamp NULL DEFAULT NULL,
  `billing_id` varchar(50) NOT NULL,
  `callback_page` varchar(200) NOT NULL,
  `application_id` varchar(50) NOT NULL,
  `queued_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `postage_workload_id` varchar(50) DEFAULT NULL,
  `notify_workload_id` varchar(50) DEFAULT NULL,
  `biller_workload_id` varchar(50) DEFAULT NULL,
  `provider_used` varchar(100) DEFAULT NULL,
  `provider_return_information` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `return_sms`
--

DROP TABLE IF EXISTS `return_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_sms` (
  `id` varchar(50) NOT NULL,
  `message_to` varchar(20) DEFAULT NULL,
  `message_from` varchar(20) DEFAULT NULL,
  `originating_id` varchar(50) DEFAULT NULL,
  `message_received_gateway_time` datetime DEFAULT NULL,
  `message_received_time` datetime DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `worker_secret_keys`
--

DROP TABLE IF EXISTS `worker_secret_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_secret_keys` (
  `id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workers` (
  `id` varchar(50) NOT NULL,
  `worker_name` varchar(50) NOT NULL,
  `secret_key_used` varchar(50) DEFAULT NULL,
  `worker_last_seen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workload`
--

DROP TABLE IF EXISTS `workload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workload` (
  `id` varchar(50) NOT NULL,
  `worker_id` varchar(50) NOT NULL,
  `worker_started` datetime DEFAULT NULL,
  `worker_last_seen` datetime DEFAULT NULL,
  `worker_finished` datetime DEFAULT NULL,
  `units_attempted` int(11) DEFAULT NULL,
  `workload_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-20  8:19:53
