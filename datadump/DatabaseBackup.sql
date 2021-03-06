-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: otrs
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.2

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
-- Table structure for table `acl`
--

DROP TABLE IF EXISTS `acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `stop_after_match` smallint(6) DEFAULT NULL,
  `config_match` longblob,
  `config_change` longblob,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `acl_name` (`name`),
  KEY `FK_acl_create_by_id` (`create_by`),
  KEY `FK_acl_change_by_id` (`change_by`),
  KEY `FK_acl_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_acl_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_acl_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_acl_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl`
--

LOCK TABLES `acl` WRITE;
/*!40000 ALTER TABLE `acl` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_sync`
--

DROP TABLE IF EXISTS `acl_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_sync` (
  `acl_id` varchar(200) NOT NULL,
  `sync_state` varchar(30) NOT NULL,
  `create_time` datetime NOT NULL,
  `change_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_sync`
--

LOCK TABLES `acl_sync` WRITE;
/*!40000 ALTER TABLE `acl_sync` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) NOT NULL,
  `article_type_id` smallint(6) NOT NULL,
  `article_sender_type_id` smallint(6) NOT NULL,
  `a_from` text,
  `a_reply_to` text,
  `a_to` text,
  `a_cc` text,
  `a_subject` text,
  `a_message_id` text,
  `a_message_id_md5` varchar(32) DEFAULT NULL,
  `a_in_reply_to` text,
  `a_references` text,
  `a_content_type` varchar(250) DEFAULT NULL,
  `a_body` mediumtext NOT NULL,
  `incoming_time` int(11) NOT NULL,
  `content_path` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_article_sender_type_id` (`article_sender_type_id`),
  KEY `article_article_type_id` (`article_type_id`),
  KEY `article_message_id_md5` (`a_message_id_md5`),
  KEY `article_ticket_id` (`ticket_id`),
  KEY `FK_article_create_by_id` (`create_by`),
  KEY `FK_article_change_by_id` (`change_by`),
  KEY `FK_article_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_article_article_sender_type_id_id` FOREIGN KEY (`article_sender_type_id`) REFERENCES `article_sender_type` (`id`),
  CONSTRAINT `FK_article_article_type_id_id` FOREIGN KEY (`article_type_id`) REFERENCES `article_type` (`id`),
  CONSTRAINT `FK_article_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_article_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_article_ticket_id_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `FK_article_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,1,1,3,'OTRS Feedback <marketing@otrs.com>',NULL,'Your OTRS System <otrs@localhost>',NULL,'Welcome to OTRS!','<007@localhost>',NULL,NULL,NULL,NULL,'Welcome to OTRS!\n\nThank you for installing OTRS, the world’s most popular service management software available in 34 languages and used by 150,000 users worldwide.\n\nYou can find updates and patches for OTRS Free at\nhttps://www.otrs.com/download-open-source-help-desk-software-otrs-free/.\n\nPlease be aware that we do not offer official vendor support for OTRS Free. In case of questions, please use our:\n\n- online documentation available at http://otrs.github.io/doc/\n- mailing lists available at http://lists.otrs.org/\n- webinars at https://www.otrs.com/category/webinar/\n\nTo meet higher business requirements, we recommend to use the OTRS Business Solution™, that offers\n\n- exclusive business features like chat, integration of data from external databases etc.\n- included professional updates & services\n- implementation and configuration by our experts\n\nFind more information about it at https://www.otrs.com/solutions/.\n\nBest regards and ((enjoy)) OTRS,\n\nYour OTRS Group\n',1436949030,'2015/07/15',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_attachment`
--

DROP TABLE IF EXISTS `article_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `content_size` varchar(30) DEFAULT NULL,
  `content_type` text,
  `content_id` varchar(250) DEFAULT NULL,
  `content_alternative` varchar(50) DEFAULT NULL,
  `disposition` varchar(15) DEFAULT NULL,
  `content` longblob NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_attachment_article_id` (`article_id`),
  KEY `FK_article_attachment_create_by_id` (`create_by`),
  KEY `FK_article_attachment_change_by_id` (`change_by`),
  CONSTRAINT `FK_article_attachment_article_id_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `FK_article_attachment_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_article_attachment_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_attachment`
--

LOCK TABLES `article_attachment` WRITE;
/*!40000 ALTER TABLE `article_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_flag`
--

DROP TABLE IF EXISTS `article_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_flag` (
  `article_id` bigint(20) NOT NULL,
  `article_key` varchar(50) NOT NULL,
  `article_value` varchar(50) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  KEY `article_flag_article_id` (`article_id`),
  KEY `article_flag_article_id_create_by` (`article_id`,`create_by`),
  KEY `FK_article_flag_create_by_id` (`create_by`),
  CONSTRAINT `FK_article_flag_article_id_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `FK_article_flag_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_flag`
--

LOCK TABLES `article_flag` WRITE;
/*!40000 ALTER TABLE `article_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_plain`
--

DROP TABLE IF EXISTS `article_plain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_plain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `body` longblob NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_plain_article_id` (`article_id`),
  KEY `FK_article_plain_create_by_id` (`create_by`),
  KEY `FK_article_plain_change_by_id` (`change_by`),
  CONSTRAINT `FK_article_plain_article_id_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `FK_article_plain_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_article_plain_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_plain`
--

LOCK TABLES `article_plain` WRITE;
/*!40000 ALTER TABLE `article_plain` DISABLE KEYS */;
INSERT INTO `article_plain` VALUES (1,1,'From: OTRS Feedback <marketing@otrs.com>\nTo: Your OTRS System <otrs@localhost>\nSubject: Welcome to OTRS!\nContent-Type: text/plain; charset=utf-8\nContent-Transfer-Encoding: 8bit\n\nWelcome to OTRS!\n\nThank you for installing OTRS, the world’s most popular service management software available in 34 languages and used by 150,000 users worldwide.\n\nYou can find updates and patches for OTRS Free at\nhttps://www.otrs.com/download-open-source-help-desk-software-otrs-free/.\n\nPlease be aware that we do not offer official vendor support for OTRS Free. In case of questions, please use our:\n\n- online documentation available at http://otrs.github.io/doc/\n- mailing lists available at http://lists.otrs.org/\n- webinars at https://www.otrs.com/category/webinar/\n\nTo meet higher business requirements, we recommend to use the OTRS Business Solution™, that offers\n\n- exclusive business features like chat, integration of data from external databases etc.\n- included professional updates & services\n- implementation and configuration by our experts\n\nFind more information about it at https://www.otrs.com/solutions/.\n\nBest regards and ((enjoy)) OTRS,\n\nYour OTRS Group\n','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `article_plain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_search`
--

DROP TABLE IF EXISTS `article_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_search` (
  `id` bigint(20) NOT NULL,
  `ticket_id` bigint(20) NOT NULL,
  `article_type_id` smallint(6) NOT NULL,
  `article_sender_type_id` smallint(6) NOT NULL,
  `a_from` text,
  `a_to` text,
  `a_cc` text,
  `a_subject` text,
  `a_body` mediumtext NOT NULL,
  `incoming_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_search_article_sender_type_id` (`article_sender_type_id`),
  KEY `article_search_article_type_id` (`article_type_id`),
  KEY `article_search_ticket_id` (`ticket_id`),
  CONSTRAINT `FK_article_search_article_sender_type_id_id` FOREIGN KEY (`article_sender_type_id`) REFERENCES `article_sender_type` (`id`),
  CONSTRAINT `FK_article_search_article_type_id_id` FOREIGN KEY (`article_type_id`) REFERENCES `article_type` (`id`),
  CONSTRAINT `FK_article_search_ticket_id_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_search`
--

LOCK TABLES `article_search` WRITE;
/*!40000 ALTER TABLE `article_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_sender_type`
--

DROP TABLE IF EXISTS `article_sender_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_sender_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_sender_type_name` (`name`),
  KEY `FK_article_sender_type_create_by_id` (`create_by`),
  KEY `FK_article_sender_type_change_by_id` (`change_by`),
  KEY `FK_article_sender_type_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_article_sender_type_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_article_sender_type_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_article_sender_type_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_sender_type`
--

LOCK TABLES `article_sender_type` WRITE;
/*!40000 ALTER TABLE `article_sender_type` DISABLE KEYS */;
INSERT INTO `article_sender_type` VALUES (1,'agent',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'system',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'customer',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `article_sender_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_type`
--

DROP TABLE IF EXISTS `article_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_type_name` (`name`),
  KEY `FK_article_type_create_by_id` (`create_by`),
  KEY `FK_article_type_change_by_id` (`change_by`),
  KEY `FK_article_type_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_article_type_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_article_type_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_article_type_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_type`
--

LOCK TABLES `article_type` WRITE;
/*!40000 ALTER TABLE `article_type` DISABLE KEYS */;
INSERT INTO `article_type` VALUES (1,'email-external',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'email-internal',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'email-notification-ext',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(4,'email-notification-int',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(5,'phone',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(6,'fax',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(7,'sms',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(8,'webrequest',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(9,'note-internal',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(10,'note-external',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(11,'note-report',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `article_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_response`
--

DROP TABLE IF EXISTS `auto_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `text0` text,
  `text1` text,
  `type_id` smallint(6) NOT NULL,
  `system_address_id` smallint(6) NOT NULL,
  `content_type` varchar(250) DEFAULT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auto_response_name` (`name`),
  KEY `FK_auto_response_type_id_id` (`type_id`),
  KEY `FK_auto_response_system_address_id_id` (`system_address_id`),
  KEY `FK_auto_response_create_by_id` (`create_by`),
  KEY `FK_auto_response_change_by_id` (`change_by`),
  KEY `FK_auto_response_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_auto_response_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_auto_response_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_auto_response_system_address_id_id` FOREIGN KEY (`system_address_id`) REFERENCES `system_address` (`id`),
  CONSTRAINT `FK_auto_response_type_id_id` FOREIGN KEY (`type_id`) REFERENCES `auto_response_type` (`id`),
  CONSTRAINT `FK_auto_response_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_response`
--

LOCK TABLES `auto_response` WRITE;
/*!40000 ALTER TABLE `auto_response` DISABLE KEYS */;
INSERT INTO `auto_response` VALUES (1,'default reply (after new ticket has been created)','This is a demo text which is send to every inquiry.\nIt could contain something like:\n\nThanks for your email. A new ticket has been created.\n\nYou wrote:\n<OTRS_CUSTOMER_EMAIL[6]>\n\nYour email will be answered by a human ASAP\n\nHave fun with OTRS! :-)\n\nYour OTRS Team\n','RE: <OTRS_CUSTOMER_SUBJECT[24]>',1,1,'text/plain','',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'default reject (after follow-up and rejected of a closed ticket)','Your previous ticket is closed.\n\n-- Your follow-up has been rejected. --\n\nPlease create a new ticket.\n\nYour OTRS Team\n','Your email has been rejected! (RE: <OTRS_CUSTOMER_SUBJECT[24]>)',2,1,'text/plain','',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'default follow-up (after a ticket follow-up has been added)','Thanks for your follow-up email\n\nYou wrote:\n<OTRS_CUSTOMER_EMAIL[6]>\n\nYour email will be answered by a human ASAP.\n\nHave fun with OTRS!\n\nYour OTRS Team\n','RE: <OTRS_CUSTOMER_SUBJECT[24]>',3,1,'text/plain','',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(4,'default reject/new ticket created (after closed follow-up with new ticket creation)','Your previous ticket is closed.\n\n-- A new ticket has been created for you. --\n\nYou wrote:\n<OTRS_CUSTOMER_EMAIL[6]>\n\nYour email will be answered by a human ASAP.\n\nHave fun with OTRS!\n\nYour OTRS Team\n','New ticket has been created! (RE: <OTRS_CUSTOMER_SUBJECT[24]>)',4,1,'text/plain','',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `auto_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_response_type`
--

DROP TABLE IF EXISTS `auto_response_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_response_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auto_response_type_name` (`name`),
  KEY `FK_auto_response_type_create_by_id` (`create_by`),
  KEY `FK_auto_response_type_change_by_id` (`change_by`),
  KEY `FK_auto_response_type_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_auto_response_type_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_auto_response_type_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_auto_response_type_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_response_type`
--

LOCK TABLES `auto_response_type` WRITE;
/*!40000 ALTER TABLE `auto_response_type` DISABLE KEYS */;
INSERT INTO `auto_response_type` VALUES (1,'auto reply','Automatic reply which will be sent out after a new ticket has been created.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'auto reject','Automatic reject which will be sent out after a follow-up has been rejected (in case queue follow-up option is \"reject\").',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'auto follow up','Automatic confirmation which is sent out after a follow-up has been received for a ticket (in case queue follow-up option is \"possible\").',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(4,'auto reply/new ticket','Automatic response which will be sent out after a follow-up has been rejected and a new ticket has been created (in case queue follow-up option is \"new ticket\").',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(5,'auto remove','Auto remove will be sent out after a customer removed the request.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `auto_response_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_service_config`
--

DROP TABLE IF EXISTS `cloud_service_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud_service_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `config` longblob NOT NULL,
  `config_md5` varchar(32) NOT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cloud_service_config_config_md5` (`config_md5`),
  UNIQUE KEY `cloud_service_config_name` (`name`),
  KEY `FK_cloud_service_config_create_by_id` (`create_by`),
  KEY `FK_cloud_service_config_change_by_id` (`change_by`),
  KEY `FK_cloud_service_config_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_cloud_service_config_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_cloud_service_config_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_cloud_service_config_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_service_config`
--

LOCK TABLES `cloud_service_config` WRITE;
/*!40000 ALTER TABLE `cloud_service_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_service_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_company`
--

DROP TABLE IF EXISTS `customer_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_company` (
  `customer_id` varchar(150) NOT NULL,
  `name` varchar(200) NOT NULL,
  `street` varchar(200) DEFAULT NULL,
  `zip` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_company_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_company`
--

LOCK TABLES `customer_company` WRITE;
/*!40000 ALTER TABLE `customer_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_preferences`
--

DROP TABLE IF EXISTS `customer_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_preferences` (
  `user_id` varchar(250) NOT NULL,
  `preferences_key` varchar(150) NOT NULL,
  `preferences_value` varchar(250) DEFAULT NULL,
  KEY `customer_preferences_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_preferences`
--

LOCK TABLES `customer_preferences` WRITE;
/*!40000 ALTER TABLE `customer_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user`
--

DROP TABLE IF EXISTS `customer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(200) NOT NULL,
  `email` varchar(150) NOT NULL,
  `customer_id` varchar(150) NOT NULL,
  `pw` varchar(64) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `fax` varchar(150) DEFAULT NULL,
  `mobile` varchar(150) DEFAULT NULL,
  `street` varchar(150) DEFAULT NULL,
  `zip` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_user_login` (`login`),
  KEY `FK_customer_user_create_by_id` (`create_by`),
  KEY `FK_customer_user_change_by_id` (`change_by`),
  KEY `FK_customer_user_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_customer_user_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_customer_user_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_customer_user_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user`
--

LOCK TABLES `customer_user` WRITE;
/*!40000 ALTER TABLE `customer_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_field`
--

DROP TABLE IF EXISTS `dynamic_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamic_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `internal_field` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL,
  `label` varchar(200) NOT NULL,
  `field_order` int(11) NOT NULL,
  `field_type` varchar(200) NOT NULL,
  `object_type` varchar(200) NOT NULL,
  `config` longblob,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dynamic_field_name` (`name`),
  KEY `FK_dynamic_field_create_by_id` (`create_by`),
  KEY `FK_dynamic_field_change_by_id` (`change_by`),
  KEY `FK_dynamic_field_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_dynamic_field_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_dynamic_field_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_dynamic_field_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_field`
--

LOCK TABLES `dynamic_field` WRITE;
/*!40000 ALTER TABLE `dynamic_field` DISABLE KEYS */;
INSERT INTO `dynamic_field` VALUES (1,1,'ProcessManagementProcessID','Process',1,'ProcessID','Ticket','---\nDefaultValue: \'\'\n',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,1,'ProcessManagementActivityID','Activity',1,'ActivityID','Ticket','---\nDefaultValue: \'\'\n',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `dynamic_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_field_value`
--

DROP TABLE IF EXISTS `dynamic_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamic_field_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `value_text` text,
  `value_date` datetime DEFAULT NULL,
  `value_int` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dynamic_field_value_field_values` (`object_id`,`field_id`),
  KEY `dynamic_field_value_search_date` (`field_id`,`value_date`),
  KEY `dynamic_field_value_search_int` (`field_id`,`value_int`),
  CONSTRAINT `FK_dynamic_field_value_field_id_id` FOREIGN KEY (`field_id`) REFERENCES `dynamic_field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_field_value`
--

LOCK TABLES `dynamic_field_value` WRITE;
/*!40000 ALTER TABLE `dynamic_field_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_field_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_up_possible`
--

DROP TABLE IF EXISTS `follow_up_possible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow_up_possible` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `follow_up_possible_name` (`name`),
  KEY `FK_follow_up_possible_create_by_id` (`create_by`),
  KEY `FK_follow_up_possible_change_by_id` (`change_by`),
  KEY `FK_follow_up_possible_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_follow_up_possible_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_follow_up_possible_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_follow_up_possible_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_up_possible`
--

LOCK TABLES `follow_up_possible` WRITE;
/*!40000 ALTER TABLE `follow_up_possible` DISABLE KEYS */;
INSERT INTO `follow_up_possible` VALUES (1,'possible','Follow-ups for closed tickets are possible. Ticket will be reopened.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'reject','Follow-ups for closed tickets are not possible. No new ticket will be created.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'new ticket','Follow-ups for closed tickets are not possible. A new ticket will be created..',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `follow_up_possible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generic_agent_jobs`
--

DROP TABLE IF EXISTS `generic_agent_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generic_agent_jobs` (
  `job_name` varchar(200) NOT NULL,
  `job_key` varchar(200) NOT NULL,
  `job_value` varchar(200) DEFAULT NULL,
  KEY `generic_agent_jobs_job_name` (`job_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_agent_jobs`
--

LOCK TABLES `generic_agent_jobs` WRITE;
/*!40000 ALTER TABLE `generic_agent_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `generic_agent_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gi_debugger_entry`
--

DROP TABLE IF EXISTS `gi_debugger_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gi_debugger_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `communication_id` varchar(32) NOT NULL,
  `communication_type` varchar(50) NOT NULL,
  `remote_ip` varchar(50) DEFAULT NULL,
  `webservice_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gi_debugger_entry_communication_id` (`communication_id`),
  KEY `gi_debugger_entry_create_time` (`create_time`),
  KEY `FK_gi_debugger_entry_webservice_id_id` (`webservice_id`),
  CONSTRAINT `FK_gi_debugger_entry_webservice_id_id` FOREIGN KEY (`webservice_id`) REFERENCES `gi_webservice_config` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gi_debugger_entry`
--

LOCK TABLES `gi_debugger_entry` WRITE;
/*!40000 ALTER TABLE `gi_debugger_entry` DISABLE KEYS */;
INSERT INTO `gi_debugger_entry` VALUES (1,'f7d4c8b7d98bad88a89815fef303192f','Provider','192.168.88.21',1,'2017-04-07 10:39:32'),(2,'209dbf13d16ecdba8b4f9f1a6d8b7d78','Provider','192.168.88.21',1,'2017-04-07 10:41:16');
/*!40000 ALTER TABLE `gi_debugger_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gi_debugger_entry_content`
--

DROP TABLE IF EXISTS `gi_debugger_entry_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gi_debugger_entry_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gi_debugger_entry_id` bigint(20) NOT NULL,
  `debug_level` varchar(50) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` longblob,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gi_debugger_entry_content_create_time` (`create_time`),
  KEY `gi_debugger_entry_content_debug_level` (`debug_level`),
  KEY `FK_gi_debugger_entry_content_gi_debugger_entry_id_id` (`gi_debugger_entry_id`),
  CONSTRAINT `FK_gi_debugger_entry_content_gi_debugger_entry_id_id` FOREIGN KEY (`gi_debugger_entry_id`) REFERENCES `gi_debugger_entry` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gi_debugger_entry_content`
--

LOCK TABLES `gi_debugger_entry_content` WRITE;
/*!40000 ALTER TABLE `gi_debugger_entry_content` DISABLE KEYS */;
INSERT INTO `gi_debugger_entry_content` VALUES (1,1,'debug','Communication sequence started','$VAR1 = {\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/opt/otrs/bin/cgi-bin/\',\n  \'CONTEXT_PREFIX\' => \'/otrs/\',\n  \'DOCUMENT_ROOT\' => \'/var/www/html\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'HTTP_ACCEPT\' => \'*/*\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip;q=1.0,deflate;q=0.6,identity;q=0.3\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_HOST\' => \'192.168.88.140\',\n  \'HTTP_USER_AGENT\' => \'Ruby\',\n  \'MOD_PERL\' => \'mod_perl/2.0.9\',\n  \'MOD_PERL_API_VERSION\' => \'2\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'PATH_INFO\' => \'/Webservice/test/Ticket/1\',\n  \'PATH_TRANSLATED\' => \'/var/www/html/Webservice/test/Ticket/1\',\n  \'QUERY_STRING\' => \'UserLogin=root@localhost&Password=Xljkfuk5HfFhwax8&AllArticles=1\',\n  \'REMOTE_ADDR\' => \'192.168.88.21\',\n  \'REMOTE_PORT\' => \'63737\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'REQUEST_URI\' => \'/otrs/nph-genericinterface.pl/Webservice/test/Ticket/1?UserLogin=root@localhost&Password=Xljkfuk5HfFhwax8&AllArticles=1\',\n  \'SCRIPT_FILENAME\' => \'/opt/otrs/bin/cgi-bin/nph-genericinterface.pl\',\n  \'SCRIPT_NAME\' => \'/otrs/nph-genericinterface.pl\',\n  \'SERVER_ADDR\' => \'192.168.88.140\',\n  \'SERVER_ADMIN\' => \'webmaster@localhost\',\n  \'SERVER_NAME\' => \'192.168.88.140\',\n  \'SERVER_PORT\' => \'80\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at 192.168.88.140 Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\'\n};\n','2017-04-07 10:39:32'),(2,1,'debug','Detected operation \'TicketGet\'','No data provided','2017-04-07 10:39:32'),(3,1,'debug','Incoming data before mapping','$VAR1 = {\n  \'AllArticles\' => \'1\',\n  \'Password\' => \'Xljkfuk5HfFhwax8\',\n  \'RequestMethod\' => \'GET\',\n  \'TicketID\' => \'1\',\n  \'UserLogin\' => \'root@localhost\'\n};\n','2017-04-07 10:39:32'),(4,1,'debug','Outgoing data before mapping','$VAR1 = {\n  \'Ticket\' => [\n    {\n      \'Age\' => 54605343,\n      \'ArchiveFlag\' => \'n\',\n      \'Article\' => [\n        {\n          \'Age\' => 54605343,\n          \'AgeTimeUnix\' => 65031,\n          \'ArticleID\' => \'1\',\n          \'ArticleType\' => \'email-external\',\n          \'ArticleTypeID\' => \'1\',\n          \'Body\' => \'Welcome to OTRS!\n\nThank you for installing OTRS, the world’s most popular service management software available in 34 languages and used by 150,000 users worldwide.\n\nYou can find updates and patches for OTRS Free at\nhttps://www.otrs.com/download-open-source-help-desk-software-otrs-free/.\n\nPlease be aware that we do not offer official vendor support for OTRS Free. In case of questions, please use our:\n\n- online documentation available at http://otrs.github.io/doc/\n- mailing lists available at http://lists.otrs.org/\n- webinars at https://www.otrs.com/category/webinar/\n\nTo meet higher business requirements, we recommend to use the OTRS Business Solution™, that offers\n\n- exclusive business features like chat, integration of data from external databases etc.\n- included professional updates & services\n- implementation and configuration by our experts\n\nFind more information about it at https://www.otrs.com/solutions/.\n\nBest regards and ((enjoy)) OTRS,\n\nYour OTRS Group\n\',\n          \'Cc\' => undef,\n          \'Changed\' => \'2017-04-06 16:35:42\',\n          \'Charset\' => \'\',\n          \'ContentCharset\' => \'\',\n          \'ContentType\' => undef,\n          \'CreateTimeUnix\' => \'1436949030\',\n          \'Created\' => \'2015-07-15 10:30:30\',\n          \'CreatedBy\' => \'1\',\n          \'CustomerID\' => undef,\n          \'CustomerUserID\' => undef,\n          \'EscalationResponseTime\' => \'0\',\n          \'EscalationSolutionTime\' => \'0\',\n          \'EscalationTime\' => \'0\',\n          \'EscalationUpdateTime\' => \'0\',\n          \'From\' => \'OTRS Feedback <marketing@otrs.com>\',\n          \'FromRealname\' => \'OTRS Feedback\',\n          \'InReplyTo\' => undef,\n          \'IncomingTime\' => \'1436949030\',\n          \'Lock\' => \'unlock\',\n          \'LockID\' => \'1\',\n          \'MessageID\' => \'<007@localhost>\',\n          \'MimeType\' => \'\',\n          \'Owner\' => \'root@localhost\',\n          \'OwnerID\' => \'1\',\n          \'Priority\' => \'3 normal\',\n          \'PriorityID\' => \'3\',\n          \'Queue\' => \'Raw\',\n          \'QueueID\' => \'2\',\n          \'RealTillTimeNotUsed\' => \'0\',\n          \'References\' => undef,\n          \'ReplyTo\' => undef,\n          \'Responsible\' => \'root@localhost\',\n          \'ResponsibleID\' => \'1\',\n          \'SLA\' => \'\',\n          \'SLAID\' => undef,\n          \'SenderType\' => \'customer\',\n          \'SenderTypeID\' => \'3\',\n          \'Service\' => \'\',\n          \'ServiceID\' => undef,\n          \'State\' => \'new\',\n          \'StateID\' => \'1\',\n          \'StateType\' => \'new\',\n          \'Subject\' => \'Welcome to OTRS!\',\n          \'TicketID\' => \'1\',\n          \'TicketNumber\' => \'2015071510123456\',\n          \'Title\' => \'Welcome to OTRS!\',\n          \'To\' => \'Your OTRS System <otrs@localhost>\',\n          \'ToRealname\' => \'Your OTRS System\',\n          \'Type\' => \'Unclassified\',\n          \'TypeID\' => undef,\n          \'UntilTime\' => 0\n        }\n      ],\n      \'ChangeBy\' => \'1\',\n      \'Changed\' => \'2017-04-06 16:35:42\',\n      \'CreateBy\' => \'1\',\n      \'CreateTimeUnix\' => \'1436949030\',\n      \'Created\' => \'2015-07-15 10:30:30\',\n      \'CustomerID\' => undef,\n      \'CustomerUserID\' => undef,\n      \'EscalationResponseTime\' => \'0\',\n      \'EscalationSolutionTime\' => \'0\',\n      \'EscalationTime\' => \'0\',\n      \'EscalationUpdateTime\' => \'0\',\n      \'GroupID\' => \'1\',\n      \'Lock\' => \'unlock\',\n      \'LockID\' => \'1\',\n      \'Owner\' => \'root@localhost\',\n      \'OwnerID\' => \'1\',\n      \'Priority\' => \'3 normal\',\n      \'PriorityID\' => \'3\',\n      \'Queue\' => \'Raw\',\n      \'QueueID\' => \'2\',\n      \'RealTillTimeNotUsed\' => \'0\',\n      \'Responsible\' => \'root@localhost\',\n      \'ResponsibleID\' => \'1\',\n      \'SLAID\' => \'\',\n      \'ServiceID\' => \'\',\n      \'State\' => \'new\',\n      \'StateID\' => \'1\',\n      \'StateType\' => \'new\',\n      \'TicketID\' => \'1\',\n      \'TicketNumber\' => \'2015071510123456\',\n      \'Title\' => \'Welcome to OTRS!\',\n      \'Type\' => \'Unclassified\',\n      \'TypeID\' => 1,\n      \'UnlockTimeout\' => \'0\',\n      \'UntilTime\' => 0\n    }\n  ]\n};\n','2017-04-07 10:39:33'),(5,1,'debug','Returning provider data to remote system (HTTP Code: 200)','{\"Ticket\":[{\"EscalationSolutionTime\":\"0\",\"StateID\":\"1\",\"Article\":[{\"StateID\":\"1\",\"EscalationSolutionTime\":\"0\",\"MessageID\":\"<007@localhost>\",\"Responsible\":\"root@localhost\",\"Lock\":\"unlock\",\"SenderTypeID\":\"3\",\"SenderType\":\"customer\",\"UntilTime\":0,\"CustomerID\":null,\"ContentType\":null,\"QueueID\":\"2\",\"Priority\":\"3 normal\",\"CustomerUserID\":null,\"Title\":\"Welcome to OTRS!\",\"ResponsibleID\":\"1\",\"CreateTimeUnix\":\"1436949030\",\"SLAID\":null,\"SLA\":\"\",\"ReplyTo\":null,\"Subject\":\"Welcome to OTRS!\",\"From\":\"OTRS Feedback <marketing@otrs.com>\",\"Owner\":\"root@localhost\",\"StateType\":\"new\",\"TicketID\":\"1\",\"PriorityID\":\"3\",\"ToRealname\":\"Your OTRS System\",\"Queue\":\"Raw\",\"MimeType\":\"\",\"FromRealname\":\"OTRS Feedback\",\"RealTillTimeNotUsed\":\"0\",\"OwnerID\":\"1\",\"Age\":54605343,\"Changed\":\"2017-04-06 16:35:42\",\"TypeID\":null,\"Type\":\"Unclassified\",\"Created\":\"2015-07-15 10:30:30\",\"EscalationTime\":\"0\",\"EscalationUpdateTime\":\"0\",\"Body\":\"Welcome to OTRS!\\n\\nThank you for installing OTRS, the world’s most popular service management software available in 34 languages and used by 150,000 users worldwide.\\n\\nYou can find updates and patches for OTRS Free at\\nhttps://www.otrs.com/download-open-source-help-desk-software-otrs-free/.\\n\\nPlease be aware that we do not offer official vendor support for OTRS Free. In case of questions, please use our:\\n\\n- online documentation available at http://otrs.github.io/doc/\\n- mailing lists available at http://lists.otrs.org/\\n- webinars at https://www.otrs.com/category/webinar/\\n\\nTo meet higher business requirements, we recommend to use the OTRS Business Solution™, that offers\\n\\n- exclusive business features like chat, integration of data from external databases etc.\\n- included professional updates & services\\n- implementation and configuration by our experts\\n\\nFind more information about it at https://www.otrs.com/solutions/.\\n\\nBest regards and ((enjoy)) OTRS,\\n\\nYour OTRS Group\\n\",\"IncomingTime\":\"1436949030\",\"State\":\"new\",\"AgeTimeUnix\":65031,\"ServiceID\":null,\"Service\":\"\",\"ArticleTypeID\":\"1\",\"InReplyTo\":null,\"ArticleType\":\"email-external\",\"References\":null,\"EscalationResponseTime\":\"0\",\"LockID\":\"1\",\"To\":\"Your OTRS System <otrs@localhost>\",\"Charset\":\"\",\"ContentCharset\":\"\",\"CreatedBy\":\"1\",\"ArticleID\":\"1\",\"TicketNumber\":\"2015071510123456\",\"Cc\":null}],\"Responsible\":\"root@localhost\",\"Lock\":\"unlock\",\"UntilTime\":0,\"CustomerID\":null,\"CustomerUserID\":null,\"QueueID\":\"2\",\"Priority\":\"3 normal\",\"Title\":\"Welcome to OTRS!\",\"ResponsibleID\":\"1\",\"ChangeBy\":\"1\",\"CreateTimeUnix\":\"1436949030\",\"SLAID\":\"\",\"Owner\":\"root@localhost\",\"StateType\":\"new\",\"ArchiveFlag\":\"n\",\"TicketID\":\"1\",\"PriorityID\":\"3\",\"Queue\":\"Raw\",\"OwnerID\":\"1\",\"RealTillTimeNotUsed\":\"0\",\"Age\":54605343,\"Changed\":\"2017-04-06 16:35:42\",\"TypeID\":1,\"Type\":\"Unclassified\",\"Created\":\"2015-07-15 10:30:30\",\"EscalationTime\":\"0\",\"EscalationUpdateTime\":\"0\",\"State\":\"new\",\"ServiceID\":\"\",\"CreateBy\":\"1\",\"UnlockTimeout\":\"0\",\"EscalationResponseTime\":\"0\",\"LockID\":\"1\",\"GroupID\":\"1\",\"TicketNumber\":\"2015071510123456\"}]}','2017-04-07 10:39:33'),(6,2,'debug','Communication sequence started','$VAR1 = {\n  \'CONTEXT_DOCUMENT_ROOT\' => \'/opt/otrs/bin/cgi-bin/\',\n  \'CONTEXT_PREFIX\' => \'/otrs/\',\n  \'DOCUMENT_ROOT\' => \'/var/www/html\',\n  \'GATEWAY_INTERFACE\' => \'CGI/1.1\',\n  \'HTTP_ACCEPT\' => \'*/*\',\n  \'HTTP_ACCEPT_ENCODING\' => \'gzip;q=1.0,deflate;q=0.6,identity;q=0.3\',\n  \'HTTP_CONNECTION\' => \'close\',\n  \'HTTP_HOST\' => \'192.168.88.140\',\n  \'HTTP_USER_AGENT\' => \'Ruby\',\n  \'MOD_PERL\' => \'mod_perl/2.0.9\',\n  \'MOD_PERL_API_VERSION\' => \'2\',\n  \'PATH\' => \'/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\',\n  \'PATH_INFO\' => \'/Webservice/test/Ticket/2\',\n  \'PATH_TRANSLATED\' => \'/var/www/html/Webservice/test/Ticket/2\',\n  \'QUERY_STRING\' => \'UserLogin=root@localhost&Password=Xljkfuk5HfFhwax8&AllArticles=1\',\n  \'REMOTE_ADDR\' => \'192.168.88.21\',\n  \'REMOTE_PORT\' => \'63804\',\n  \'REQUEST_METHOD\' => \'GET\',\n  \'REQUEST_SCHEME\' => \'http\',\n  \'REQUEST_URI\' => \'/otrs/nph-genericinterface.pl/Webservice/test/Ticket/2?UserLogin=root@localhost&Password=Xljkfuk5HfFhwax8&AllArticles=1\',\n  \'SCRIPT_FILENAME\' => \'/opt/otrs/bin/cgi-bin/nph-genericinterface.pl\',\n  \'SCRIPT_NAME\' => \'/otrs/nph-genericinterface.pl\',\n  \'SERVER_ADDR\' => \'192.168.88.140\',\n  \'SERVER_ADMIN\' => \'webmaster@localhost\',\n  \'SERVER_NAME\' => \'192.168.88.140\',\n  \'SERVER_PORT\' => \'80\',\n  \'SERVER_PROTOCOL\' => \'HTTP/1.1\',\n  \'SERVER_SIGNATURE\' => \'<address>Apache/2.4.18 (Ubuntu) Server at 192.168.88.140 Port 80</address>\n\',\n  \'SERVER_SOFTWARE\' => \'Apache/2.4.18 (Ubuntu)\'\n};\n','2017-04-07 10:41:16'),(7,2,'debug','Detected operation \'TicketGet\'','No data provided','2017-04-07 10:41:17'),(8,2,'debug','Incoming data before mapping','$VAR1 = {\n  \'AllArticles\' => \'1\',\n  \'Password\' => \'Xljkfuk5HfFhwax8\',\n  \'RequestMethod\' => \'GET\',\n  \'TicketID\' => \'2\',\n  \'UserLogin\' => \'root@localhost\'\n};\n','2017-04-07 10:41:17'),(9,2,'error','TicketGet.AccessDenied','TicketGet: User does not have access to the ticket!','2017-04-07 10:41:17'),(10,2,'debug','Outgoing data before mapping','$VAR1 = {\n  \'Error\' => {\n    \'ErrorCode\' => \'TicketGet.AccessDenied\',\n    \'ErrorMessage\' => \'TicketGet: User does not have access to the ticket!\'\n  }\n};\n','2017-04-07 10:41:17'),(11,2,'debug','Returning provider data to remote system (HTTP Code: 200)','{\"Error\":{\"ErrorMessage\":\"TicketGet: User does not have access to the ticket!\",\"ErrorCode\":\"TicketGet.AccessDenied\"}}','2017-04-07 10:41:17');
/*!40000 ALTER TABLE `gi_debugger_entry_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gi_object_lock_state`
--

DROP TABLE IF EXISTS `gi_object_lock_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gi_object_lock_state` (
  `webservice_id` int(11) NOT NULL,
  `object_type` varchar(30) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `lock_state` varchar(30) NOT NULL,
  `lock_state_counter` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `change_time` datetime NOT NULL,
  UNIQUE KEY `gi_object_lock_state_list` (`webservice_id`,`object_type`,`object_id`),
  KEY `object_lock_state_list_state` (`webservice_id`,`object_type`,`object_id`,`lock_state`),
  CONSTRAINT `FK_gi_object_lock_state_webservice_id_id` FOREIGN KEY (`webservice_id`) REFERENCES `gi_webservice_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gi_object_lock_state`
--

LOCK TABLES `gi_object_lock_state` WRITE;
/*!40000 ALTER TABLE `gi_object_lock_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `gi_object_lock_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gi_webservice_config`
--

DROP TABLE IF EXISTS `gi_webservice_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gi_webservice_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `config` longblob NOT NULL,
  `config_md5` varchar(32) NOT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gi_webservice_config_config_md5` (`config_md5`),
  UNIQUE KEY `gi_webservice_config_name` (`name`),
  KEY `FK_gi_webservice_config_create_by_id` (`create_by`),
  KEY `FK_gi_webservice_config_change_by_id` (`change_by`),
  KEY `FK_gi_webservice_config_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_gi_webservice_config_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_gi_webservice_config_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_gi_webservice_config_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gi_webservice_config`
--

LOCK TABLES `gi_webservice_config` WRITE;
/*!40000 ALTER TABLE `gi_webservice_config` DISABLE KEYS */;
INSERT INTO `gi_webservice_config` VALUES (1,'test','---\nDebugger:\n  DebugThreshold: debug\n  TestMode: \'0\'\nDescription: Ticket Connector REST Sample\nProvider:\n  Operation:\n    SessionCreate:\n      Description: Creates a Session\n      MappingInbound: {}\n      MappingOutbound: {}\n      Type: Session::SessionCreate\n    TicketCreate:\n      Description: Creates a Ticket\n      MappingInbound: {}\n      MappingOutbound: {}\n      Type: Ticket::TicketCreate\n    TicketGet:\n      Description: Retrieves Ticket data\n      MappingInbound: {}\n      MappingOutbound: {}\n      Type: Ticket::TicketGet\n    TicketSearch:\n      Description: Search for Tickets\n      MappingInbound: {}\n      MappingOutbound: {}\n      Type: Ticket::TicketSearch\n    TicketUpdate:\n      Description: Updates a Ticket\n      MappingInbound: {}\n      MappingOutbound: {}\n      Type: Ticket::TicketUpdate\n  Transport:\n    Config:\n      KeepAlive: \'\'\n      MaxLength: \'100000000\'\n      RouteOperationMapping:\n        SessionCreate:\n          RequestMethod:\n          - POST\n          Route: /Session\n        TicketCreate:\n          RequestMethod:\n          - POST\n          Route: /Ticket\n        TicketGet:\n          RequestMethod:\n          - GET\n          Route: /Ticket/:TicketID\n        TicketSearch:\n          RequestMethod:\n          - GET\n          Route: /Ticket\n        TicketUpdate:\n          RequestMethod:\n          - PATCH\n          Route: /Ticket/:TicketID\n    Type: HTTP::REST\nRemoteSystem: \'\'\nRequester:\n  Transport:\n    Type: \'\'\n','bb907f973c63d9ea8aeeb2e07b9d8afa',1,'2017-04-07 10:22:27',1,'2017-04-07 10:22:27',1);
/*!40000 ALTER TABLE `gi_webservice_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gi_webservice_config_history`
--

DROP TABLE IF EXISTS `gi_webservice_config_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gi_webservice_config_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL,
  `config` longblob NOT NULL,
  `config_md5` varchar(32) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gi_webservice_config_history_config_md5` (`config_md5`),
  KEY `FK_gi_webservice_config_history_config_id_id` (`config_id`),
  KEY `FK_gi_webservice_config_history_create_by_id` (`create_by`),
  KEY `FK_gi_webservice_config_history_change_by_id` (`change_by`),
  CONSTRAINT `FK_gi_webservice_config_history_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_gi_webservice_config_history_config_id_id` FOREIGN KEY (`config_id`) REFERENCES `gi_webservice_config` (`id`),
  CONSTRAINT `FK_gi_webservice_config_history_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gi_webservice_config_history`
--

LOCK TABLES `gi_webservice_config_history` WRITE;
/*!40000 ALTER TABLE `gi_webservice_config_history` DISABLE KEYS */;
INSERT INTO `gi_webservice_config_history` VALUES (1,1,'---\nDebugger:\n  DebugThreshold: debug\n  TestMode: \'0\'\nDescription: Ticket Connector REST Sample\nProvider:\n  Operation:\n    SessionCreate:\n      Description: Creates a Session\n      MappingInbound: {}\n      MappingOutbound: {}\n      Type: Session::SessionCreate\n    TicketCreate:\n      Description: Creates a Ticket\n      MappingInbound: {}\n      MappingOutbound: {}\n      Type: Ticket::TicketCreate\n    TicketGet:\n      Description: Retrieves Ticket data\n      MappingInbound: {}\n      MappingOutbound: {}\n      Type: Ticket::TicketGet\n    TicketSearch:\n      Description: Search for Tickets\n      MappingInbound: {}\n      MappingOutbound: {}\n      Type: Ticket::TicketSearch\n    TicketUpdate:\n      Description: Updates a Ticket\n      MappingInbound: {}\n      MappingOutbound: {}\n      Type: Ticket::TicketUpdate\n  Transport:\n    Config:\n      KeepAlive: \'\'\n      MaxLength: \'100000000\'\n      RouteOperationMapping:\n        SessionCreate:\n          RequestMethod:\n          - POST\n          Route: /Session\n        TicketCreate:\n          RequestMethod:\n          - POST\n          Route: /Ticket\n        TicketGet:\n          RequestMethod:\n          - GET\n          Route: /Ticket/:TicketID\n        TicketSearch:\n          RequestMethod:\n          - GET\n          Route: /Ticket\n        TicketUpdate:\n          RequestMethod:\n          - PATCH\n          Route: /Ticket/:TicketID\n    Type: HTTP::REST\nRemoteSystem: \'\'\nRequester:\n  Transport:\n    Type: \'\'\n','4be463ec4f53e4aab816b5ca5c689d8e','2017-04-07 10:22:27',1,'2017-04-07 10:22:27',1);
/*!40000 ALTER TABLE `gi_webservice_config_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_customer_user`
--

DROP TABLE IF EXISTS `group_customer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_customer_user` (
  `user_id` varchar(100) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_key` varchar(20) NOT NULL,
  `permission_value` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  KEY `group_customer_user_group_id` (`group_id`),
  KEY `group_customer_user_user_id` (`user_id`),
  KEY `FK_group_customer_user_create_by_id` (`create_by`),
  KEY `FK_group_customer_user_change_by_id` (`change_by`),
  CONSTRAINT `FK_group_customer_user_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_group_customer_user_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_group_customer_user_group_id_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_customer_user`
--

LOCK TABLES `group_customer_user` WRITE;
/*!40000 ALTER TABLE `group_customer_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_customer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_role`
--

DROP TABLE IF EXISTS `group_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_role` (
  `role_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_key` varchar(20) NOT NULL,
  `permission_value` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  KEY `group_role_group_id` (`group_id`),
  KEY `group_role_role_id` (`role_id`),
  KEY `FK_group_role_create_by_id` (`create_by`),
  KEY `FK_group_role_change_by_id` (`change_by`),
  CONSTRAINT `FK_group_role_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_group_role_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_group_role_group_id_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK_group_role_role_id_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_role`
--

LOCK TABLES `group_role` WRITE;
/*!40000 ALTER TABLE `group_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_key` varchar(20) NOT NULL,
  `permission_value` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  KEY `group_user_group_id` (`group_id`),
  KEY `group_user_user_id` (`user_id`),
  KEY `FK_group_user_create_by_id` (`create_by`),
  KEY `FK_group_user_change_by_id` (`change_by`),
  CONSTRAINT `FK_group_user_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_group_user_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_group_user_group_id_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK_group_user_user_id_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_user`
--

LOCK TABLES `group_user` WRITE;
/*!40000 ALTER TABLE `group_user` DISABLE KEYS */;
INSERT INTO `group_user` VALUES (1,1,'rw',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(1,2,'rw',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(1,3,'rw',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name` (`name`),
  KEY `FK_groups_create_by_id` (`create_by`),
  KEY `FK_groups_change_by_id` (`change_by`),
  KEY `FK_groups_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_groups_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_groups_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_groups_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'users','Group for default access.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'admin','Group of all administrators.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'stats','Group for statistics access.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_object`
--

DROP TABLE IF EXISTS `link_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_object` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link_object_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_object`
--

LOCK TABLES `link_object` WRITE;
/*!40000 ALTER TABLE `link_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_relation`
--

DROP TABLE IF EXISTS `link_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_relation` (
  `source_object_id` smallint(6) NOT NULL,
  `source_key` varchar(50) NOT NULL,
  `target_object_id` smallint(6) NOT NULL,
  `target_key` varchar(50) NOT NULL,
  `type_id` smallint(6) NOT NULL,
  `state_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  UNIQUE KEY `link_relation_view` (`source_object_id`,`source_key`,`target_object_id`,`target_key`,`type_id`),
  KEY `link_relation_list_source` (`source_object_id`,`source_key`,`state_id`),
  KEY `link_relation_list_target` (`target_object_id`,`target_key`,`state_id`),
  KEY `FK_link_relation_state_id_id` (`state_id`),
  KEY `FK_link_relation_type_id_id` (`type_id`),
  KEY `FK_link_relation_create_by_id` (`create_by`),
  CONSTRAINT `FK_link_relation_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_link_relation_source_object_id_id` FOREIGN KEY (`source_object_id`) REFERENCES `link_object` (`id`),
  CONSTRAINT `FK_link_relation_state_id_id` FOREIGN KEY (`state_id`) REFERENCES `link_state` (`id`),
  CONSTRAINT `FK_link_relation_target_object_id_id` FOREIGN KEY (`target_object_id`) REFERENCES `link_object` (`id`),
  CONSTRAINT `FK_link_relation_type_id_id` FOREIGN KEY (`type_id`) REFERENCES `link_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_relation`
--

LOCK TABLES `link_relation` WRITE;
/*!40000 ALTER TABLE `link_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `link_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_state`
--

DROP TABLE IF EXISTS `link_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_state` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link_state_name` (`name`),
  KEY `FK_link_state_create_by_id` (`create_by`),
  KEY `FK_link_state_change_by_id` (`change_by`),
  KEY `FK_link_state_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_link_state_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_link_state_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_link_state_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_state`
--

LOCK TABLES `link_state` WRITE;
/*!40000 ALTER TABLE `link_state` DISABLE KEYS */;
INSERT INTO `link_state` VALUES (1,'Valid',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'Temporary',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `link_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_type`
--

DROP TABLE IF EXISTS `link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link_type_name` (`name`),
  KEY `FK_link_type_create_by_id` (`create_by`),
  KEY `FK_link_type_change_by_id` (`change_by`),
  KEY `FK_link_type_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_link_type_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_link_type_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_link_type_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_type`
--

LOCK TABLES `link_type` WRITE;
/*!40000 ALTER TABLE `link_type` DISABLE KEYS */;
INSERT INTO `link_type` VALUES (1,'Normal',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'ParentChild',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `link_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_account`
--

DROP TABLE IF EXISTS `mail_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(200) NOT NULL,
  `pw` varchar(200) NOT NULL,
  `host` varchar(200) NOT NULL,
  `account_type` varchar(20) NOT NULL,
  `queue_id` int(11) NOT NULL,
  `trusted` smallint(6) NOT NULL,
  `imap_folder` varchar(250) DEFAULT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mail_account_create_by_id` (`create_by`),
  KEY `FK_mail_account_change_by_id` (`change_by`),
  KEY `FK_mail_account_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_mail_account_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_mail_account_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_mail_account_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_account`
--

LOCK TABLES `mail_account` WRITE;
/*!40000 ALTER TABLE `mail_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_event`
--

DROP TABLE IF EXISTS `notification_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `valid_id` smallint(6) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notification_event_name` (`name`),
  KEY `FK_notification_event_create_by_id` (`create_by`),
  KEY `FK_notification_event_change_by_id` (`change_by`),
  KEY `FK_notification_event_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_notification_event_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_notification_event_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_notification_event_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_event`
--

LOCK TABLES `notification_event` WRITE;
/*!40000 ALTER TABLE `notification_event` DISABLE KEYS */;
INSERT INTO `notification_event` VALUES (1,'Ticket create notification',1,'','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'Ticket follow-up notification (unlocked)',1,'','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'Ticket follow-up notification (locked)',1,'','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(4,'Ticket lock timeout notification',1,'','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(5,'Ticket owner update notification',1,'','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(6,'Ticket responsible update notification',1,'','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(7,'Ticket new note notification',1,'','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(8,'Ticket queue update notification',1,'','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(9,'Ticket pending reminder notification (locked)',1,'','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(10,'Ticket pending reminder notification (unlocked)',1,'','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(11,'Ticket escalation notification',1,'','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(12,'Ticket escalation warning notification',1,'','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(13,'Ticket service update notification',1,'','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `notification_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_event_item`
--

DROP TABLE IF EXISTS `notification_event_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_event_item` (
  `notification_id` int(11) NOT NULL,
  `event_key` varchar(200) NOT NULL,
  `event_value` varchar(200) NOT NULL,
  KEY `notification_event_item_event_key` (`event_key`),
  KEY `notification_event_item_event_value` (`event_value`),
  KEY `notification_event_item_notification_id` (`notification_id`),
  CONSTRAINT `FK_notification_event_item_notification_id_id` FOREIGN KEY (`notification_id`) REFERENCES `notification_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_event_item`
--

LOCK TABLES `notification_event_item` WRITE;
/*!40000 ALTER TABLE `notification_event_item` DISABLE KEYS */;
INSERT INTO `notification_event_item` VALUES (1,'VisibleForAgent','1'),(1,'VisibleForAgentTooltip','You will receive a notification each time a new ticket is created in one of your \"My Queues\" or \"My Services\".'),(1,'Events','NotificationNewTicket'),(1,'Recipients','AgentMyQueues'),(1,'Recipients','AgentMyServices'),(1,'SendOnOutOfOffice','1'),(1,'Transports','Email'),(1,'AgentEnabledByDefault','Email'),(2,'VisibleForAgent','1'),(2,'VisibleForAgentTooltip','You will receive a notification if a customer sends a follow-up to an unlocked ticket which is in your \"My Queues\" or \"My Services\".'),(2,'Events','NotificationFollowUp'),(2,'Recipients','AgentOwner'),(2,'Recipients','AgentWatcher'),(2,'Recipients','AgentMyQueues'),(2,'Recipients','AgentMyServices'),(2,'SendOnOutOfOffice','1'),(2,'LockID','1'),(2,'Transports','Email'),(2,'AgentEnabledByDefault','Email'),(3,'VisibleForAgent','1'),(3,'VisibleForAgentTooltip','You will receive a notification if a customer sends a follow-up to a locked ticket of which you are the ticket owner or responsible.'),(3,'Events','NotificationFollowUp'),(3,'Recipients','AgentOwner'),(3,'Recipients','AgentResponsible'),(3,'Recipients','AgentWatcher'),(3,'SendOnOutOfOffice','1'),(3,'LockID','2'),(3,'LockID','3'),(3,'Transports','Email'),(3,'AgentEnabledByDefault','Email'),(4,'VisibleForAgent','1'),(4,'VisibleForAgentTooltip','You will receive a notification as soon as a ticket owned by you is automatically unlocked.'),(4,'Events','NotificationLockTimeout'),(4,'Recipients','AgentOwner'),(4,'SendOnOutOfOffice','1'),(4,'Transports','Email'),(4,'AgentEnabledByDefault','Email'),(5,'Events','NotificationOwnerUpdate'),(5,'Recipients','AgentOwner'),(5,'SendOnOutOfOffice','1'),(5,'Transports','Email'),(6,'Events','NotificationResponsibleUpdate'),(6,'Recipients','AgentResponsible'),(6,'SendOnOutOfOffice','1'),(6,'Transports','Email'),(7,'Events','NotificationAddNote'),(7,'Recipients','AgentOwner'),(7,'Recipients','AgentResponsible'),(7,'Recipients','AgentWatcher'),(7,'SendOnOutOfOffice','1'),(7,'Transports','Email'),(8,'VisibleForAgent','1'),(8,'VisibleForAgentTooltip','You will receive a notification if a ticket is moved into one of your \"My Queues\".'),(8,'Events','NotificationMove'),(8,'Recipients','AgentMyQueues'),(8,'SendOnOutOfOffice','1'),(8,'Transports','Email'),(8,'AgentEnabledByDefault','Email'),(9,'Events','NotificationPendingReminder'),(9,'Recipients','AgentOwner'),(9,'Recipients','AgentResponsible'),(9,'SendOnOutOfOffice','1'),(9,'OncePerDay','1'),(9,'LockID','2'),(9,'LockID','3'),(9,'Transports','Email'),(10,'Events','NotificationPendingReminder'),(10,'Recipients','AgentOwner'),(10,'Recipients','AgentResponsible'),(10,'Recipients','AgentMyQueues'),(10,'SendOnOutOfOffice','1'),(10,'OncePerDay','1'),(10,'LockID','1'),(10,'Transports','Email'),(11,'Events','NotificationEscalation'),(11,'Recipients','AgentMyQueues'),(11,'Recipients','AgentWritePermissions'),(11,'SendOnOutOfOffice','1'),(11,'OncePerDay','1'),(11,'Transports','Email'),(12,'Events','NotificationEscalationNotifyBefore'),(12,'Recipients','AgentMyQueues'),(12,'Recipients','AgentWritePermissions'),(12,'SendOnOutOfOffice','1'),(12,'OncePerDay','1'),(12,'Transports','Email'),(13,'VisibleForAgent','1'),(13,'VisibleForAgentTooltip','You will receive a notification if a ticket\'s service is changed to one of your \"My Services\".'),(13,'Events','NotificationServiceUpdate'),(13,'Recipients','AgentMyServices'),(13,'SendOnOutOfOffice','1'),(13,'Transports','Email'),(13,'AgentEnabledByDefault','Email');
/*!40000 ALTER TABLE `notification_event_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_event_message`
--

DROP TABLE IF EXISTS `notification_event_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_event_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `content_type` varchar(250) NOT NULL,
  `language` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notification_event_message_notification_id_language` (`notification_id`,`language`),
  KEY `notification_event_message_language` (`language`),
  KEY `notification_event_message_notification_id` (`notification_id`),
  CONSTRAINT `FK_notification_event_message_notification_id_id` FOREIGN KEY (`notification_id`) REFERENCES `notification_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_event_message`
--

LOCK TABLES `notification_event_message` WRITE;
/*!40000 ALTER TABLE `notification_event_message` DISABLE KEYS */;
INSERT INTO `notification_event_message` VALUES (1,1,'','','text/plain','en'),(2,2,'','','text/plain','en'),(3,3,'','','text/plain','en'),(4,4,'','','text/plain','en'),(5,5,'','','text/plain','en'),(6,6,'','','text/plain','en'),(7,7,'','','text/plain','en'),(8,8,'','','text/plain','en'),(9,9,'','','text/plain','en'),(10,10,'','','text/plain','en'),(11,11,'','','text/plain','en'),(12,12,'','','text/plain','en'),(13,13,'','','text/plain','en'),(14,1,'','','text/plain','de'),(15,2,'','','text/plain','de'),(16,3,'','','text/plain','de'),(17,4,'','','text/plain','de'),(18,5,'','','text/plain','de'),(19,6,'','','text/plain','de'),(20,7,'','','text/plain','de'),(21,8,'','','text/plain','de'),(22,9,'','','text/plain','de'),(23,10,'','','text/plain','de'),(24,11,'','','text/plain','de'),(25,12,'','','text/plain','de'),(26,13,'','','text/plain','de'),(27,1,'','','text/plain','es_MX'),(28,2,'','','text/plain','es_MX'),(29,3,'','','text/plain','es_MX'),(30,4,'','','text/plain','es_MX'),(31,5,'','','text/plain','es_MX'),(32,6,'','','text/plain','es_MX'),(33,7,'','','text/plain','es_MX'),(34,8,'','','text/plain','es_MX'),(35,9,'','','text/plain','es_MX'),(36,10,'','','text/plain','es_MX'),(37,11,'','','text/plain','es_MX'),(38,12,'','','text/plain','es_MX'),(39,13,'','','text/plain','es_MX'),(40,1,'','','text/plain','zh_CN'),(41,2,'','','text/plain','zh_CN'),(42,3,'','','text/plain','zh_CN'),(43,4,'','','text/plain','zh_CN'),(44,5,'','','text/plain','zh_CN'),(45,6,'','','text/plain','zh_CN'),(46,7,'','','text/plain','zh_CN'),(47,8,'','','text/plain','zh_CN'),(48,9,'','','text/plain','zh_CN'),(49,10,'','','text/plain','zh_CN'),(50,11,'','','text/plain','zh_CN'),(51,12,'','','text/plain','zh_CN'),(52,13,'','','text/plain','zh_CN'),(53,1,'','','text/plain','pt_BR'),(54,2,'','','text/plain','pt_BR'),(55,3,'','','text/plain','pt_BR'),(56,4,'','','text/plain','pt_BR'),(57,5,'','','text/plain','pt_BR'),(58,6,'','','text/plain','pt_BR'),(59,7,'','','text/plain','pt_BR'),(60,8,'','','text/plain','pt_BR'),(61,9,'','','text/plain','pt_BR'),(62,10,'','','text/plain','pt_BR'),(63,11,'','','text/plain','pt_BR'),(64,12,'','','text/plain','pt_BR'),(65,13,'','','text/plain','pt_BR'),(66,1,'','','text/plain','hu'),(67,2,'','','text/plain','hu'),(68,3,'','','text/plain','hu'),(69,4,'','','text/plain','hu'),(70,5,'','','text/plain','hu'),(71,6,'','','text/plain','hu'),(72,7,'','','text/plain','hu'),(73,8,'','','text/plain','hu'),(74,9,'','','text/plain','hu'),(75,10,'','','text/plain','hu'),(76,11,'','','text/plain','hu'),(77,12,'','','text/plain','hu'),(78,13,'','','text/plain','hu');
/*!40000 ALTER TABLE `notification_event_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_repository`
--

DROP TABLE IF EXISTS `package_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_repository` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `version` varchar(250) NOT NULL,
  `vendor` varchar(250) NOT NULL,
  `install_status` varchar(250) NOT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `content_type` varchar(250) DEFAULT NULL,
  `content` longblob NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_package_repository_create_by_id` (`create_by`),
  KEY `FK_package_repository_change_by_id` (`change_by`),
  CONSTRAINT `FK_package_repository_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_package_repository_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_repository`
--

LOCK TABLES `package_repository` WRITE;
/*!40000 ALTER TABLE `package_repository` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_queues`
--

DROP TABLE IF EXISTS `personal_queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_queues` (
  `user_id` int(11) NOT NULL,
  `queue_id` int(11) NOT NULL,
  KEY `personal_queues_queue_id` (`queue_id`),
  KEY `personal_queues_user_id` (`user_id`),
  CONSTRAINT `FK_personal_queues_queue_id_id` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`id`),
  CONSTRAINT `FK_personal_queues_user_id_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_queues`
--

LOCK TABLES `personal_queues` WRITE;
/*!40000 ALTER TABLE `personal_queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_queues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_services`
--

DROP TABLE IF EXISTS `personal_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_services` (
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  KEY `personal_services_service_id` (`service_id`),
  KEY `personal_services_user_id` (`user_id`),
  CONSTRAINT `FK_personal_services_service_id_id` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `FK_personal_services_user_id_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_services`
--

LOCK TABLES `personal_services` WRITE;
/*!40000 ALTER TABLE `personal_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_activity`
--

DROP TABLE IF EXISTS `pm_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `config` longblob NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pm_activity_entity_id` (`entity_id`),
  KEY `FK_pm_activity_create_by_id` (`create_by`),
  KEY `FK_pm_activity_change_by_id` (`change_by`),
  CONSTRAINT `FK_pm_activity_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_pm_activity_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_activity`
--

LOCK TABLES `pm_activity` WRITE;
/*!40000 ALTER TABLE `pm_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_activity_dialog`
--

DROP TABLE IF EXISTS `pm_activity_dialog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_activity_dialog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `config` longblob NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pm_activity_dialog_entity_id` (`entity_id`),
  KEY `FK_pm_activity_dialog_create_by_id` (`create_by`),
  KEY `FK_pm_activity_dialog_change_by_id` (`change_by`),
  CONSTRAINT `FK_pm_activity_dialog_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_pm_activity_dialog_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_activity_dialog`
--

LOCK TABLES `pm_activity_dialog` WRITE;
/*!40000 ALTER TABLE `pm_activity_dialog` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_activity_dialog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_entity_sync`
--

DROP TABLE IF EXISTS `pm_entity_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_entity_sync` (
  `entity_type` varchar(30) NOT NULL,
  `entity_id` varchar(50) NOT NULL,
  `sync_state` varchar(30) NOT NULL,
  `create_time` datetime NOT NULL,
  `change_time` datetime NOT NULL,
  UNIQUE KEY `pm_entity_sync_list` (`entity_type`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_entity_sync`
--

LOCK TABLES `pm_entity_sync` WRITE;
/*!40000 ALTER TABLE `pm_entity_sync` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_entity_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_process`
--

DROP TABLE IF EXISTS `pm_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `state_entity_id` varchar(50) NOT NULL,
  `layout` longblob NOT NULL,
  `config` longblob NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pm_process_entity_id` (`entity_id`),
  KEY `FK_pm_process_create_by_id` (`create_by`),
  KEY `FK_pm_process_change_by_id` (`change_by`),
  CONSTRAINT `FK_pm_process_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_pm_process_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_process`
--

LOCK TABLES `pm_process` WRITE;
/*!40000 ALTER TABLE `pm_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_transition`
--

DROP TABLE IF EXISTS `pm_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_transition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `config` longblob NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pm_transition_entity_id` (`entity_id`),
  KEY `FK_pm_transition_create_by_id` (`create_by`),
  KEY `FK_pm_transition_change_by_id` (`change_by`),
  CONSTRAINT `FK_pm_transition_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_pm_transition_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_transition`
--

LOCK TABLES `pm_transition` WRITE;
/*!40000 ALTER TABLE `pm_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_transition_action`
--

DROP TABLE IF EXISTS `pm_transition_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_transition_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `config` longblob NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pm_transition_action_entity_id` (`entity_id`),
  KEY `FK_pm_transition_action_create_by_id` (`create_by`),
  KEY `FK_pm_transition_action_change_by_id` (`change_by`),
  CONSTRAINT `FK_pm_transition_action_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_pm_transition_action_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_transition_action`
--

LOCK TABLES `pm_transition_action` WRITE;
/*!40000 ALTER TABLE `pm_transition_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_transition_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postmaster_filter`
--

DROP TABLE IF EXISTS `postmaster_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postmaster_filter` (
  `f_name` varchar(200) NOT NULL,
  `f_stop` smallint(6) DEFAULT NULL,
  `f_type` varchar(20) NOT NULL,
  `f_key` varchar(200) NOT NULL,
  `f_value` varchar(200) NOT NULL,
  `f_not` smallint(6) DEFAULT NULL,
  KEY `postmaster_filter_f_name` (`f_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postmaster_filter`
--

LOCK TABLES `postmaster_filter` WRITE;
/*!40000 ALTER TABLE `postmaster_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `postmaster_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_id`
--

DROP TABLE IF EXISTS `process_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_id` (
  `process_name` varchar(200) NOT NULL,
  `process_id` varchar(200) NOT NULL,
  `process_host` varchar(200) NOT NULL,
  `process_create` int(11) NOT NULL,
  `process_change` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_id`
--

LOCK TABLES `process_id` WRITE;
/*!40000 ALTER TABLE `process_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `group_id` int(11) NOT NULL,
  `unlock_timeout` int(11) DEFAULT NULL,
  `first_response_time` int(11) DEFAULT NULL,
  `first_response_notify` smallint(6) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `update_notify` smallint(6) DEFAULT NULL,
  `solution_time` int(11) DEFAULT NULL,
  `solution_notify` smallint(6) DEFAULT NULL,
  `system_address_id` smallint(6) NOT NULL,
  `calendar_name` varchar(100) DEFAULT NULL,
  `default_sign_key` varchar(100) DEFAULT NULL,
  `salutation_id` smallint(6) NOT NULL,
  `signature_id` smallint(6) NOT NULL,
  `follow_up_id` smallint(6) NOT NULL,
  `follow_up_lock` smallint(6) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `queue_name` (`name`),
  KEY `queue_group_id` (`group_id`),
  KEY `FK_queue_follow_up_id_id` (`follow_up_id`),
  KEY `FK_queue_salutation_id_id` (`salutation_id`),
  KEY `FK_queue_signature_id_id` (`signature_id`),
  KEY `FK_queue_system_address_id_id` (`system_address_id`),
  KEY `FK_queue_create_by_id` (`create_by`),
  KEY `FK_queue_change_by_id` (`change_by`),
  KEY `FK_queue_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_queue_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_queue_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_queue_follow_up_id_id` FOREIGN KEY (`follow_up_id`) REFERENCES `follow_up_possible` (`id`),
  CONSTRAINT `FK_queue_group_id_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK_queue_salutation_id_id` FOREIGN KEY (`salutation_id`) REFERENCES `salutation` (`id`),
  CONSTRAINT `FK_queue_signature_id_id` FOREIGN KEY (`signature_id`) REFERENCES `signature` (`id`),
  CONSTRAINT `FK_queue_system_address_id_id` FOREIGN KEY (`system_address_id`) REFERENCES `system_address` (`id`),
  CONSTRAINT `FK_queue_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
INSERT INTO `queue` VALUES (1,'Postmaster',1,0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,1,1,0,'Postmaster queue.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'Raw',1,0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,1,1,0,'All default incoming tickets.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'Junk',1,0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,1,1,0,'All junk tickets.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(4,'Misc',1,0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,1,1,0,'All misc tickets.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_auto_response`
--

DROP TABLE IF EXISTS `queue_auto_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_auto_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queue_id` int(11) NOT NULL,
  `auto_response_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_queue_auto_response_auto_response_id_id` (`auto_response_id`),
  KEY `FK_queue_auto_response_queue_id_id` (`queue_id`),
  KEY `FK_queue_auto_response_create_by_id` (`create_by`),
  KEY `FK_queue_auto_response_change_by_id` (`change_by`),
  CONSTRAINT `FK_queue_auto_response_auto_response_id_id` FOREIGN KEY (`auto_response_id`) REFERENCES `auto_response` (`id`),
  CONSTRAINT `FK_queue_auto_response_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_queue_auto_response_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_queue_auto_response_queue_id_id` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_auto_response`
--

LOCK TABLES `queue_auto_response` WRITE;
/*!40000 ALTER TABLE `queue_auto_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_auto_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_preferences`
--

DROP TABLE IF EXISTS `queue_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_preferences` (
  `queue_id` int(11) NOT NULL,
  `preferences_key` varchar(150) NOT NULL,
  `preferences_value` varchar(250) DEFAULT NULL,
  KEY `queue_preferences_queue_id` (`queue_id`),
  CONSTRAINT `FK_queue_preferences_queue_id_id` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_preferences`
--

LOCK TABLES `queue_preferences` WRITE;
/*!40000 ALTER TABLE `queue_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_standard_template`
--

DROP TABLE IF EXISTS `queue_standard_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_standard_template` (
  `queue_id` int(11) NOT NULL,
  `standard_template_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  KEY `FK_queue_standard_template_queue_id_id` (`queue_id`),
  KEY `FK_queue_standard_template_standard_template_id_id` (`standard_template_id`),
  KEY `FK_queue_standard_template_create_by_id` (`create_by`),
  KEY `FK_queue_standard_template_change_by_id` (`change_by`),
  CONSTRAINT `FK_queue_standard_template_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_queue_standard_template_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_queue_standard_template_queue_id_id` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`id`),
  CONSTRAINT `FK_queue_standard_template_standard_template_id_id` FOREIGN KEY (`standard_template_id`) REFERENCES `standard_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_standard_template`
--

LOCK TABLES `queue_standard_template` WRITE;
/*!40000 ALTER TABLE `queue_standard_template` DISABLE KEYS */;
INSERT INTO `queue_standard_template` VALUES (1,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(4,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `queue_standard_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  KEY `role_user_role_id` (`role_id`),
  KEY `role_user_user_id` (`user_id`),
  KEY `FK_role_user_create_by_id` (`create_by`),
  KEY `FK_role_user_change_by_id` (`change_by`),
  CONSTRAINT `FK_role_user_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_role_user_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_role_user_user_id_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name` (`name`),
  KEY `FK_roles_create_by_id` (`create_by`),
  KEY `FK_roles_change_by_id` (`change_by`),
  KEY `FK_roles_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_roles_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_roles_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_roles_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salutation`
--

DROP TABLE IF EXISTS `salutation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salutation` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `content_type` varchar(250) DEFAULT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `salutation_name` (`name`),
  KEY `FK_salutation_create_by_id` (`create_by`),
  KEY `FK_salutation_change_by_id` (`change_by`),
  KEY `FK_salutation_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_salutation_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_salutation_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_salutation_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salutation`
--

LOCK TABLES `salutation` WRITE;
/*!40000 ALTER TABLE `salutation` DISABLE KEYS */;
INSERT INTO `salutation` VALUES (1,'system standard salutation (en)','Dear <OTRS_CUSTOMER_REALNAME>,\n\nThank you for your request.\n\n','text/plain; charset=utf-8','Standard Salutation.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `salutation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_future_task`
--

DROP TABLE IF EXISTS `scheduler_future_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_future_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ident` bigint(20) NOT NULL,
  `execution_time` datetime NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `task_type` varchar(150) NOT NULL,
  `task_data` longblob NOT NULL,
  `attempts` smallint(6) NOT NULL,
  `lock_key` bigint(20) NOT NULL,
  `lock_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scheduler_future_task_ident` (`ident`),
  KEY `scheduler_future_task_ident_id` (`ident`,`id`),
  KEY `scheduler_future_task_lock_key_id` (`lock_key`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_future_task`
--

LOCK TABLES `scheduler_future_task` WRITE;
/*!40000 ALTER TABLE `scheduler_future_task` DISABLE KEYS */;
INSERT INTO `scheduler_future_task` VALUES (1,149148978371726,'2017-04-06 16:43:23','PluginAsynchronous::ConcurrentUser','AsynchronousExecutor','BQoDAAAAAgpPS2VybmVsOjpTeXN0ZW06OlN1cHBvcnREYXRhQ29sbGVjdG9yOjpQbHVnaW5Bc3lu\nY2hyb25vdXM6Ok9UUlM6OkNvbmN1cnJlbnRVc2VycwAAAAZPYmplY3QKD1J1bkFzeW5jaHJvbm91\ncwAAAAhGdW5jdGlvbg==\n',1,0,NULL,'2017-04-06 16:43:03');
/*!40000 ALTER TABLE `scheduler_future_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_recurrent_task`
--

DROP TABLE IF EXISTS `scheduler_recurrent_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_recurrent_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `task_type` varchar(150) NOT NULL,
  `last_execution_time` datetime NOT NULL,
  `last_worker_task_id` bigint(20) DEFAULT NULL,
  `last_worker_status` smallint(6) DEFAULT NULL,
  `last_worker_running_time` int(11) DEFAULT NULL,
  `lock_key` bigint(20) NOT NULL,
  `lock_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `change_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scheduler_recurrent_task_name_task_type` (`name`,`task_type`),
  KEY `scheduler_recurrent_task_lock_key_id` (`lock_key`,`id`),
  KEY `scheduler_recurrent_task_task_type_name` (`task_type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_recurrent_task`
--

LOCK TABLES `scheduler_recurrent_task` WRITE;
/*!40000 ALTER TABLE `scheduler_recurrent_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduler_recurrent_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_task`
--

DROP TABLE IF EXISTS `scheduler_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ident` bigint(20) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `task_type` varchar(150) NOT NULL,
  `task_data` longblob NOT NULL,
  `attempts` smallint(6) NOT NULL,
  `lock_key` bigint(20) NOT NULL,
  `lock_time` datetime DEFAULT NULL,
  `lock_update_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scheduler_task_ident` (`ident`),
  KEY `scheduler_task_ident_id` (`ident`,`id`),
  KEY `scheduler_task_lock_key_id` (`lock_key`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_task`
--

LOCK TABLES `scheduler_task` WRITE;
/*!40000 ALTER TABLE `scheduler_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduler_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_profile`
--

DROP TABLE IF EXISTS `search_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_profile` (
  `login` varchar(200) NOT NULL,
  `profile_name` varchar(200) NOT NULL,
  `profile_type` varchar(30) NOT NULL,
  `profile_key` varchar(200) NOT NULL,
  `profile_value` varchar(200) DEFAULT NULL,
  KEY `search_profile_login` (`login`),
  KEY `search_profile_profile_name` (`profile_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_profile`
--

LOCK TABLES `search_profile` WRITE;
/*!40000 ALTER TABLE `search_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `valid_id` smallint(6) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_name` (`name`),
  KEY `FK_service_create_by_id` (`create_by`),
  KEY `FK_service_change_by_id` (`change_by`),
  CONSTRAINT `FK_service_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_service_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_customer_user`
--

DROP TABLE IF EXISTS `service_customer_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_customer_user` (
  `customer_user_login` varchar(200) NOT NULL,
  `service_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  KEY `service_customer_user_customer_user_login` (`customer_user_login`(10)),
  KEY `service_customer_user_service_id` (`service_id`),
  KEY `FK_service_customer_user_create_by_id` (`create_by`),
  CONSTRAINT `FK_service_customer_user_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_service_customer_user_service_id_id` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_customer_user`
--

LOCK TABLES `service_customer_user` WRITE;
/*!40000 ALTER TABLE `service_customer_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_customer_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_preferences`
--

DROP TABLE IF EXISTS `service_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_preferences` (
  `service_id` int(11) NOT NULL,
  `preferences_key` varchar(150) NOT NULL,
  `preferences_value` varchar(250) DEFAULT NULL,
  KEY `service_preferences_service_id` (`service_id`),
  CONSTRAINT `FK_service_preferences_service_id_id` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_preferences`
--

LOCK TABLES `service_preferences` WRITE;
/*!40000 ALTER TABLE `service_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_sla`
--

DROP TABLE IF EXISTS `service_sla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_sla` (
  `service_id` int(11) NOT NULL,
  `sla_id` int(11) NOT NULL,
  UNIQUE KEY `service_sla_service_sla` (`service_id`,`sla_id`),
  KEY `FK_service_sla_sla_id_id` (`sla_id`),
  CONSTRAINT `FK_service_sla_service_id_id` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `FK_service_sla_sla_id_id` FOREIGN KEY (`sla_id`) REFERENCES `sla` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_sla`
--

LOCK TABLES `service_sla` WRITE;
/*!40000 ALTER TABLE `service_sla` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_sla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL,
  `data_key` varchar(100) NOT NULL,
  `data_value` text,
  `serialized` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_data_key` (`data_key`),
  KEY `sessions_session_id_data_key` (`session_id`,`data_key`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (111,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','AdminDynamicFieldsOverviewPageShown','25',0),(112,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','ChangeTime','2017-04-07 14:32:44',0),(113,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','CreateTime','2017-04-06 16:35:42',0),(114,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','NotificationTransport','{\"Notification-3-Email\":\"1\",\"Notification-8-Email\":\"1\",\"Notification-2-Email\":\"1\",\"Notification-4-Email\":\"1\",\"Notification-13-Email\":\"1\",\"Notification-1-Email\":\"1\"}',0),(115,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','OutOfOffice','0',0),(116,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','OutOfOfficeEndDay','8',0),(117,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','OutOfOfficeEndMonth','4',0),(118,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','OutOfOfficeEndYear','2017',0),(119,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','OutOfOfficeStartDay','7',0),(120,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','OutOfOfficeStartMonth','4',0),(121,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','OutOfOfficeStartYear','2017',0),(122,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserAuthBackend','',0),(123,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserChallengeToken','7TWNY3Hm5AHU6FAZmpDVuhFEML6sgnoz',0),(124,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserComment','',0),(125,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserCreateNextMask','0',0),(126,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserEmail','root@localhost',0),(127,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserFirstname','Admin',0),(128,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserFullname','Admin OTRS',0),(129,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserGoogleAuthenticatorSecretKey','',0),(130,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserID','1',0),(131,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserIsGroupRo[admin]','Yes',0),(132,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserIsGroupRo[stats]','Yes',0),(133,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserIsGroupRo[users]','Yes',0),(134,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserIsGroup[admin]','Yes',0),(135,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserIsGroup[stats]','Yes',0),(136,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserIsGroup[users]','Yes',0),(137,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserLanguage','en',0),(138,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserLastLogin','1491568374',0),(139,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserLastLoginTimestamp','2017-04-07 14:32:54',0),(141,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserLastname','OTRS',0),(142,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserLogin','root@localhost',0),(143,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserLoginFailed','0',0),(144,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserMobile','',0),(145,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserPw','4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2',0),(146,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserRefreshTime','0',0),(147,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserRemoteAddr','192.168.88.21',0),(148,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserRemoteUserAgent','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.8 (KHTML, like Gecko) Version/9.1.3 Safari/601.7.8',0),(149,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserSessionStart','1491568374',0),(150,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserSkin','default',0),(151,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserTicketOverviewMediumPageShown','20',0),(152,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserTicketOverviewPreviewPageShown','15',0),(153,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserTicketOverviewSmallPageShown','25',0),(154,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserTitle','',0),(155,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserType','User',0),(156,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','ValidID','1',0),(157,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','LastScreenOverview','',0),(158,'l3pCn0Zc6TrRMtzIK1emUkjPXzL5aiAw','UserLastRequest','1491568375',0);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signature`
--

DROP TABLE IF EXISTS `signature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signature` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `content_type` varchar(250) DEFAULT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `signature_name` (`name`),
  KEY `FK_signature_create_by_id` (`create_by`),
  KEY `FK_signature_change_by_id` (`change_by`),
  KEY `FK_signature_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_signature_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_signature_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_signature_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signature`
--

LOCK TABLES `signature` WRITE;
/*!40000 ALTER TABLE `signature` DISABLE KEYS */;
INSERT INTO `signature` VALUES (1,'system standard signature (en)','\nYour Ticket-Team\n\n <OTRS_Agent_UserFirstname> <OTRS_Agent_UserLastname>\n\n--\n Super Support - Waterford Business Park\n 5201 Blue Lagoon Drive - 8th Floor & 9th Floor - Miami, 33126 USA\n Email: hot@example.com - Web: http://www.example.com/\n--','text/plain; charset=utf-8','Standard Signature.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `signature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sla`
--

DROP TABLE IF EXISTS `sla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `calendar_name` varchar(100) DEFAULT NULL,
  `first_response_time` int(11) NOT NULL,
  `first_response_notify` smallint(6) DEFAULT NULL,
  `update_time` int(11) NOT NULL,
  `update_notify` smallint(6) DEFAULT NULL,
  `solution_time` int(11) NOT NULL,
  `solution_notify` smallint(6) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sla_name` (`name`),
  KEY `FK_sla_create_by_id` (`create_by`),
  KEY `FK_sla_change_by_id` (`change_by`),
  CONSTRAINT `FK_sla_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_sla_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sla`
--

LOCK TABLES `sla` WRITE;
/*!40000 ALTER TABLE `sla` DISABLE KEYS */;
/*!40000 ALTER TABLE `sla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sla_preferences`
--

DROP TABLE IF EXISTS `sla_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sla_preferences` (
  `sla_id` int(11) NOT NULL,
  `preferences_key` varchar(150) NOT NULL,
  `preferences_value` varchar(250) DEFAULT NULL,
  KEY `sla_preferences_sla_id` (`sla_id`),
  CONSTRAINT `FK_sla_preferences_sla_id_id` FOREIGN KEY (`sla_id`) REFERENCES `sla` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sla_preferences`
--

LOCK TABLES `sla_preferences` WRITE;
/*!40000 ALTER TABLE `sla_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sla_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smime_signer_cert_relations`
--

DROP TABLE IF EXISTS `smime_signer_cert_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smime_signer_cert_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cert_hash` varchar(8) NOT NULL,
  `cert_fingerprint` varchar(59) NOT NULL,
  `ca_hash` varchar(8) NOT NULL,
  `ca_fingerprint` varchar(59) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_smime_signer_cert_relations_create_by_id` (`create_by`),
  KEY `FK_smime_signer_cert_relations_change_by_id` (`change_by`),
  CONSTRAINT `FK_smime_signer_cert_relations_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_smime_signer_cert_relations_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smime_signer_cert_relations`
--

LOCK TABLES `smime_signer_cert_relations` WRITE;
/*!40000 ALTER TABLE `smime_signer_cert_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `smime_signer_cert_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standard_attachment`
--

DROP TABLE IF EXISTS `standard_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standard_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `content_type` varchar(250) NOT NULL,
  `content` longblob NOT NULL,
  `filename` varchar(250) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `standard_attachment_name` (`name`),
  KEY `FK_standard_attachment_create_by_id` (`create_by`),
  KEY `FK_standard_attachment_change_by_id` (`change_by`),
  KEY `FK_standard_attachment_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_standard_attachment_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_standard_attachment_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_standard_attachment_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standard_attachment`
--

LOCK TABLES `standard_attachment` WRITE;
/*!40000 ALTER TABLE `standard_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `standard_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standard_template`
--

DROP TABLE IF EXISTS `standard_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standard_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `text` text,
  `content_type` varchar(250) DEFAULT NULL,
  `template_type` varchar(100) NOT NULL DEFAULT 'Answer',
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `standard_template_name` (`name`),
  KEY `FK_standard_template_create_by_id` (`create_by`),
  KEY `FK_standard_template_change_by_id` (`change_by`),
  KEY `FK_standard_template_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_standard_template_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_standard_template_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_standard_template_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standard_template`
--

LOCK TABLES `standard_template` WRITE;
/*!40000 ALTER TABLE `standard_template` DISABLE KEYS */;
INSERT INTO `standard_template` VALUES (1,'empty answer','','text/plain; charset=utf-8','Answer',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'test answer','Some test answer to show how a standard template can be used.','text/plain; charset=utf-8','Answer',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `standard_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standard_template_attachment`
--

DROP TABLE IF EXISTS `standard_template_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standard_template_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standard_attachment_id` int(11) NOT NULL,
  `standard_template_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_standard_template_attachment_standard_attachment_id_id` (`standard_attachment_id`),
  KEY `FK_standard_template_attachment_standard_template_id_id` (`standard_template_id`),
  KEY `FK_standard_template_attachment_create_by_id` (`create_by`),
  KEY `FK_standard_template_attachment_change_by_id` (`change_by`),
  CONSTRAINT `FK_standard_template_attachment_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_standard_template_attachment_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_standard_template_attachment_standard_attachment_id_id` FOREIGN KEY (`standard_attachment_id`) REFERENCES `standard_attachment` (`id`),
  CONSTRAINT `FK_standard_template_attachment_standard_template_id_id` FOREIGN KEY (`standard_template_id`) REFERENCES `standard_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standard_template_attachment`
--

LOCK TABLES `standard_template_attachment` WRITE;
/*!40000 ALTER TABLE `standard_template_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `standard_template_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_address`
--

DROP TABLE IF EXISTS `system_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_address` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value0` varchar(200) NOT NULL,
  `value1` varchar(200) NOT NULL,
  `value2` varchar(200) DEFAULT NULL,
  `value3` varchar(200) DEFAULT NULL,
  `queue_id` int(11) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_system_address_create_by_id` (`create_by`),
  KEY `FK_system_address_change_by_id` (`change_by`),
  KEY `FK_system_address_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_system_address_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_system_address_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_system_address_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_address`
--

LOCK TABLES `system_address` WRITE;
/*!40000 ALTER TABLE `system_address` DISABLE KEYS */;
INSERT INTO `system_address` VALUES (1,'otrs@localhost','OTRS System',NULL,NULL,1,'Standard Address.',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `system_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_data`
--

DROP TABLE IF EXISTS `system_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_data` (
  `data_key` varchar(160) NOT NULL,
  `data_value` longblob,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`data_key`),
  KEY `FK_system_data_create_by_id` (`create_by`),
  KEY `FK_system_data_change_by_id` (`change_by`),
  CONSTRAINT `FK_system_data_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_system_data_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_data`
--

LOCK TABLES `system_data` WRITE;
/*!40000 ALTER TABLE `system_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_maintenance`
--

DROP TABLE IF EXISTS `system_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_maintenance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` int(11) NOT NULL,
  `stop_date` int(11) NOT NULL,
  `comments` varchar(250) NOT NULL,
  `login_message` varchar(250) DEFAULT NULL,
  `show_login_message` smallint(6) DEFAULT NULL,
  `notify_message` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_system_maintenance_create_by_id` (`create_by`),
  KEY `FK_system_maintenance_change_by_id` (`change_by`),
  KEY `FK_system_maintenance_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_system_maintenance_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_system_maintenance_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_system_maintenance_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_maintenance`
--

LOCK TABLES `system_maintenance` WRITE;
/*!40000 ALTER TABLE `system_maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tn` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `queue_id` int(11) NOT NULL,
  `ticket_lock_id` smallint(6) NOT NULL,
  `type_id` smallint(6) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `sla_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `responsible_user_id` int(11) NOT NULL,
  `ticket_priority_id` smallint(6) NOT NULL,
  `ticket_state_id` smallint(6) NOT NULL,
  `customer_id` varchar(150) DEFAULT NULL,
  `customer_user_id` varchar(250) DEFAULT NULL,
  `timeout` int(11) NOT NULL,
  `until_time` int(11) NOT NULL,
  `escalation_time` int(11) NOT NULL,
  `escalation_update_time` int(11) NOT NULL,
  `escalation_response_time` int(11) NOT NULL,
  `escalation_solution_time` int(11) NOT NULL,
  `archive_flag` smallint(6) NOT NULL DEFAULT '0',
  `create_time_unix` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_tn` (`tn`),
  KEY `ticket_archive_flag` (`archive_flag`),
  KEY `ticket_create_time` (`create_time`),
  KEY `ticket_create_time_unix` (`create_time_unix`),
  KEY `ticket_customer_id` (`customer_id`),
  KEY `ticket_customer_user_id` (`customer_user_id`),
  KEY `ticket_escalation_response_time` (`escalation_response_time`),
  KEY `ticket_escalation_solution_time` (`escalation_solution_time`),
  KEY `ticket_escalation_time` (`escalation_time`),
  KEY `ticket_escalation_update_time` (`escalation_update_time`),
  KEY `ticket_queue_id` (`queue_id`),
  KEY `ticket_queue_view` (`ticket_state_id`,`ticket_lock_id`),
  KEY `ticket_responsible_user_id` (`responsible_user_id`),
  KEY `ticket_ticket_lock_id` (`ticket_lock_id`),
  KEY `ticket_ticket_priority_id` (`ticket_priority_id`),
  KEY `ticket_ticket_state_id` (`ticket_state_id`),
  KEY `ticket_timeout` (`timeout`),
  KEY `ticket_title` (`title`),
  KEY `ticket_type_id` (`type_id`),
  KEY `ticket_until_time` (`until_time`),
  KEY `ticket_user_id` (`user_id`),
  KEY `FK_ticket_service_id_id` (`service_id`),
  KEY `FK_ticket_sla_id_id` (`sla_id`),
  KEY `FK_ticket_create_by_id` (`create_by`),
  KEY `FK_ticket_change_by_id` (`change_by`),
  CONSTRAINT `FK_ticket_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_queue_id_id` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`id`),
  CONSTRAINT `FK_ticket_responsible_user_id_id` FOREIGN KEY (`responsible_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_service_id_id` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `FK_ticket_sla_id_id` FOREIGN KEY (`sla_id`) REFERENCES `sla` (`id`),
  CONSTRAINT `FK_ticket_ticket_lock_id_id` FOREIGN KEY (`ticket_lock_id`) REFERENCES `ticket_lock_type` (`id`),
  CONSTRAINT `FK_ticket_ticket_priority_id_id` FOREIGN KEY (`ticket_priority_id`) REFERENCES `ticket_priority` (`id`),
  CONSTRAINT `FK_ticket_ticket_state_id_id` FOREIGN KEY (`ticket_state_id`) REFERENCES `ticket_state` (`id`),
  CONSTRAINT `FK_ticket_type_id_id` FOREIGN KEY (`type_id`) REFERENCES `ticket_type` (`id`),
  CONSTRAINT `FK_ticket_user_id_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'2015071510123456','Welcome to OTRS!',2,1,NULL,NULL,NULL,1,1,3,1,NULL,NULL,0,0,0,0,0,0,0,1436949030,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_flag`
--

DROP TABLE IF EXISTS `ticket_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_flag` (
  `ticket_id` bigint(20) NOT NULL,
  `ticket_key` varchar(50) NOT NULL,
  `ticket_value` varchar(50) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  UNIQUE KEY `ticket_flag_per_user` (`ticket_id`,`ticket_key`,`create_by`),
  KEY `ticket_flag_ticket_id` (`ticket_id`),
  KEY `ticket_flag_ticket_id_create_by` (`ticket_id`,`create_by`),
  KEY `ticket_flag_ticket_id_ticket_key` (`ticket_id`,`ticket_key`),
  KEY `FK_ticket_flag_create_by_id` (`create_by`),
  CONSTRAINT `FK_ticket_flag_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_flag_ticket_id_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_flag`
--

LOCK TABLES `ticket_flag` WRITE;
/*!40000 ALTER TABLE `ticket_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_history`
--

DROP TABLE IF EXISTS `ticket_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `history_type_id` smallint(6) NOT NULL,
  `ticket_id` bigint(20) NOT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `type_id` smallint(6) NOT NULL,
  `queue_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `priority_id` smallint(6) NOT NULL,
  `state_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_history_create_time` (`create_time`),
  KEY `ticket_history_history_type_id` (`history_type_id`),
  KEY `ticket_history_owner_id` (`owner_id`),
  KEY `ticket_history_priority_id` (`priority_id`),
  KEY `ticket_history_queue_id` (`queue_id`),
  KEY `ticket_history_state_id` (`state_id`),
  KEY `ticket_history_ticket_id` (`ticket_id`),
  KEY `ticket_history_type_id` (`type_id`),
  KEY `FK_ticket_history_article_id_id` (`article_id`),
  KEY `FK_ticket_history_create_by_id` (`create_by`),
  KEY `FK_ticket_history_change_by_id` (`change_by`),
  CONSTRAINT `FK_ticket_history_article_id_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `FK_ticket_history_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_history_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_history_history_type_id_id` FOREIGN KEY (`history_type_id`) REFERENCES `ticket_history_type` (`id`),
  CONSTRAINT `FK_ticket_history_owner_id_id` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_history_priority_id_id` FOREIGN KEY (`priority_id`) REFERENCES `ticket_priority` (`id`),
  CONSTRAINT `FK_ticket_history_queue_id_id` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`id`),
  CONSTRAINT `FK_ticket_history_state_id_id` FOREIGN KEY (`state_id`) REFERENCES `ticket_state` (`id`),
  CONSTRAINT `FK_ticket_history_ticket_id_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `FK_ticket_history_type_id_id` FOREIGN KEY (`type_id`) REFERENCES `ticket_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_history`
--

LOCK TABLES `ticket_history` WRITE;
/*!40000 ALTER TABLE `ticket_history` DISABLE KEYS */;
INSERT INTO `ticket_history` VALUES (1,'New Ticket [2015071510123456] created.',1,1,1,1,1,1,3,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `ticket_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_history_type`
--

DROP TABLE IF EXISTS `ticket_history_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_history_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_history_type_name` (`name`),
  KEY `FK_ticket_history_type_create_by_id` (`create_by`),
  KEY `FK_ticket_history_type_change_by_id` (`change_by`),
  KEY `FK_ticket_history_type_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_ticket_history_type_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_history_type_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_history_type_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_history_type`
--

LOCK TABLES `ticket_history_type` WRITE;
/*!40000 ALTER TABLE `ticket_history_type` DISABLE KEYS */;
INSERT INTO `ticket_history_type` VALUES (1,'NewTicket',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'FollowUp',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'SendAutoReject',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(4,'SendAutoReply',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(5,'SendAutoFollowUp',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(6,'Forward',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(7,'Bounce',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(8,'SendAnswer',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(9,'SendAgentNotification',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(10,'SendCustomerNotification',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(11,'EmailAgent',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(12,'EmailCustomer',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(13,'PhoneCallAgent',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(14,'PhoneCallCustomer',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(15,'AddNote',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(16,'Move',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(17,'Lock',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(18,'Unlock',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(19,'Remove',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(20,'TimeAccounting',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(21,'CustomerUpdate',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(22,'PriorityUpdate',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(23,'OwnerUpdate',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(24,'LoopProtection',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(25,'Misc',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(26,'SetPendingTime',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(27,'StateUpdate',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(28,'TicketDynamicFieldUpdate',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(29,'WebRequestCustomer',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(30,'TicketLinkAdd',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(31,'TicketLinkDelete',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(32,'SystemRequest',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(33,'Merged',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(34,'ResponsibleUpdate',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(35,'Subscribe',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(36,'Unsubscribe',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(37,'TypeUpdate',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(38,'ServiceUpdate',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(39,'SLAUpdate',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(40,'ArchiveFlagUpdate',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(41,'EscalationSolutionTimeStop',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(42,'EscalationResponseTimeStart',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(43,'EscalationUpdateTimeStart',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(44,'EscalationSolutionTimeStart',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(45,'EscalationResponseTimeNotifyBefore',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(46,'EscalationUpdateTimeNotifyBefore',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(47,'EscalationSolutionTimeNotifyBefore',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(48,'EscalationResponseTimeStop',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(49,'EscalationUpdateTimeStop',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(50,'TitleUpdate',NULL,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `ticket_history_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_index`
--

DROP TABLE IF EXISTS `ticket_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_index` (
  `ticket_id` bigint(20) NOT NULL,
  `queue_id` int(11) NOT NULL,
  `queue` varchar(200) NOT NULL,
  `group_id` int(11) NOT NULL,
  `s_lock` varchar(200) NOT NULL,
  `s_state` varchar(200) NOT NULL,
  `create_time_unix` bigint(20) NOT NULL,
  KEY `ticket_index_group_id` (`group_id`),
  KEY `ticket_index_queue_id` (`queue_id`),
  KEY `ticket_index_ticket_id` (`ticket_id`),
  CONSTRAINT `FK_ticket_index_group_id_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK_ticket_index_queue_id_id` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`id`),
  CONSTRAINT `FK_ticket_index_ticket_id_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_index`
--

LOCK TABLES `ticket_index` WRITE;
/*!40000 ALTER TABLE `ticket_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_lock_index`
--

DROP TABLE IF EXISTS `ticket_lock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_lock_index` (
  `ticket_id` bigint(20) NOT NULL,
  KEY `ticket_lock_index_ticket_id` (`ticket_id`),
  CONSTRAINT `FK_ticket_lock_index_ticket_id_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_lock_index`
--

LOCK TABLES `ticket_lock_index` WRITE;
/*!40000 ALTER TABLE `ticket_lock_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_lock_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_lock_type`
--

DROP TABLE IF EXISTS `ticket_lock_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_lock_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_lock_type_name` (`name`),
  KEY `FK_ticket_lock_type_create_by_id` (`create_by`),
  KEY `FK_ticket_lock_type_change_by_id` (`change_by`),
  KEY `FK_ticket_lock_type_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_ticket_lock_type_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_lock_type_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_lock_type_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_lock_type`
--

LOCK TABLES `ticket_lock_type` WRITE;
/*!40000 ALTER TABLE `ticket_lock_type` DISABLE KEYS */;
INSERT INTO `ticket_lock_type` VALUES (1,'unlock',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'lock',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'tmp_lock',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `ticket_lock_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_loop_protection`
--

DROP TABLE IF EXISTS `ticket_loop_protection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_loop_protection` (
  `sent_to` varchar(250) NOT NULL,
  `sent_date` varchar(150) NOT NULL,
  KEY `ticket_loop_protection_sent_date` (`sent_date`),
  KEY `ticket_loop_protection_sent_to` (`sent_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_loop_protection`
--

LOCK TABLES `ticket_loop_protection` WRITE;
/*!40000 ALTER TABLE `ticket_loop_protection` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_loop_protection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_priority`
--

DROP TABLE IF EXISTS `ticket_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_priority` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_priority_name` (`name`),
  KEY `FK_ticket_priority_create_by_id` (`create_by`),
  KEY `FK_ticket_priority_change_by_id` (`change_by`),
  CONSTRAINT `FK_ticket_priority_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_priority_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_priority`
--

LOCK TABLES `ticket_priority` WRITE;
/*!40000 ALTER TABLE `ticket_priority` DISABLE KEYS */;
INSERT INTO `ticket_priority` VALUES (1,'1 very low',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'2 low',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'3 normal',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(4,'4 high',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(5,'5 very high',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `ticket_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_state`
--

DROP TABLE IF EXISTS `ticket_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_state` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `type_id` smallint(6) NOT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_state_name` (`name`),
  KEY `FK_ticket_state_type_id_id` (`type_id`),
  KEY `FK_ticket_state_create_by_id` (`create_by`),
  KEY `FK_ticket_state_change_by_id` (`change_by`),
  KEY `FK_ticket_state_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_ticket_state_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_state_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_state_type_id_id` FOREIGN KEY (`type_id`) REFERENCES `ticket_state_type` (`id`),
  CONSTRAINT `FK_ticket_state_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_state`
--

LOCK TABLES `ticket_state` WRITE;
/*!40000 ALTER TABLE `ticket_state` DISABLE KEYS */;
INSERT INTO `ticket_state` VALUES (1,'new','New ticket created by customer.',1,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'closed successful','Ticket is closed successful.',3,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'closed unsuccessful','Ticket is closed unsuccessful.',3,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(4,'open','Open tickets.',2,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(5,'removed','Customer removed ticket.',6,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(6,'pending reminder','Ticket is pending for agent reminder.',4,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(7,'pending auto close+','Ticket is pending for automatic close.',5,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(8,'pending auto close-','Ticket is pending for automatic close.',5,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(9,'merged','State for merged tickets.',7,1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `ticket_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_state_type`
--

DROP TABLE IF EXISTS `ticket_state_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_state_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_state_type_name` (`name`),
  KEY `FK_ticket_state_type_create_by_id` (`create_by`),
  KEY `FK_ticket_state_type_change_by_id` (`change_by`),
  CONSTRAINT `FK_ticket_state_type_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_state_type_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_state_type`
--

LOCK TABLES `ticket_state_type` WRITE;
/*!40000 ALTER TABLE `ticket_state_type` DISABLE KEYS */;
INSERT INTO `ticket_state_type` VALUES (1,'new','All new state types (default: viewable).','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'open','All open state types (default: viewable).','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'closed','All closed state types (default: not viewable).','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(4,'pending reminder','All \'pending reminder\' state types (default: viewable).','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(5,'pending auto','All \'pending auto *\' state types (default: viewable).','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(6,'removed','All \'removed\' state types (default: not viewable).','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(7,'merged','State type for merged tickets (default: not viewable).','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `ticket_state_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_type`
--

DROP TABLE IF EXISTS `ticket_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_type_name` (`name`),
  KEY `FK_ticket_type_create_by_id` (`create_by`),
  KEY `FK_ticket_type_change_by_id` (`change_by`),
  KEY `FK_ticket_type_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_ticket_type_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_type_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_type_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_type`
--

LOCK TABLES `ticket_type` WRITE;
/*!40000 ALTER TABLE `ticket_type` DISABLE KEYS */;
INSERT INTO `ticket_type` VALUES (1,'Unclassified',1,'2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `ticket_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_watcher`
--

DROP TABLE IF EXISTS `ticket_watcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_watcher` (
  `ticket_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  KEY `ticket_watcher_ticket_id` (`ticket_id`),
  KEY `ticket_watcher_user_id` (`user_id`),
  KEY `FK_ticket_watcher_create_by_id` (`create_by`),
  KEY `FK_ticket_watcher_change_by_id` (`change_by`),
  CONSTRAINT `FK_ticket_watcher_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_watcher_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_ticket_watcher_ticket_id_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `FK_ticket_watcher_user_id_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_watcher`
--

LOCK TABLES `ticket_watcher` WRITE;
/*!40000 ALTER TABLE `ticket_watcher` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_watcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_accounting`
--

DROP TABLE IF EXISTS `time_accounting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_accounting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) NOT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `time_unit` decimal(10,2) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_accounting_ticket_id` (`ticket_id`),
  KEY `FK_time_accounting_article_id_id` (`article_id`),
  KEY `FK_time_accounting_create_by_id` (`create_by`),
  KEY `FK_time_accounting_change_by_id` (`change_by`),
  CONSTRAINT `FK_time_accounting_article_id_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `FK_time_accounting_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_time_accounting_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_time_accounting_ticket_id_id` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_accounting`
--

LOCK TABLES `time_accounting` WRITE;
/*!40000 ALTER TABLE `time_accounting` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_accounting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `user_id` int(11) NOT NULL,
  `preferences_key` varchar(150) NOT NULL,
  `preferences_value` longblob,
  KEY `user_preferences_user_id` (`user_id`),
  CONSTRAINT `FK_user_preferences_user_id_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,'UserAuthBackend',''),(1,'UserLoginFailed','0'),(1,'UserMobile',''),(1,'UserComment',''),(1,'UserCreateNextMask','0'),(1,'UserGoogleAuthenticatorSecretKey',''),(1,'UserLanguage','en'),(1,'NotificationTransport','{\"Notification-3-Email\":\"1\",\"Notification-8-Email\":\"1\",\"Notification-2-Email\":\"1\",\"Notification-4-Email\":\"1\",\"Notification-13-Email\":\"1\",\"Notification-1-Email\":\"1\"}'),(1,'OutOfOffice','0'),(1,'OutOfOfficeStartYear','2017'),(1,'OutOfOfficeStartMonth','4'),(1,'OutOfOfficeStartDay','7'),(1,'OutOfOfficeEndYear','2017'),(1,'OutOfOfficeEndMonth','4'),(1,'OutOfOfficeEndDay','8'),(1,'UserSkin','default'),(1,'UserLastLogin','1491568374');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(200) NOT NULL,
  `pw` varchar(64) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `valid_id` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_login` (`login`),
  KEY `FK_users_create_by_id` (`create_by`),
  KEY `FK_users_change_by_id` (`change_by`),
  KEY `FK_users_valid_id_id` (`valid_id`),
  CONSTRAINT `FK_users_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_users_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_users_valid_id_id` FOREIGN KEY (`valid_id`) REFERENCES `valid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'root@localhost','4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2','','Admin','OTRS',1,'2017-04-06 16:35:42',1,'2017-04-07 14:32:44',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valid`
--

DROP TABLE IF EXISTS `valid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valid` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `valid_name` (`name`),
  KEY `FK_valid_create_by_id` (`create_by`),
  KEY `FK_valid_change_by_id` (`change_by`),
  CONSTRAINT `FK_valid_change_by_id` FOREIGN KEY (`change_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_valid_create_by_id` FOREIGN KEY (`create_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valid`
--

LOCK TABLES `valid` WRITE;
/*!40000 ALTER TABLE `valid` DISABLE KEYS */;
INSERT INTO `valid` VALUES (1,'valid','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(2,'invalid','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1),(3,'invalid-temporarily','2017-04-06 16:35:42',1,'2017-04-06 16:35:42',1);
/*!40000 ALTER TABLE `valid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_fs`
--

DROP TABLE IF EXISTS `virtual_fs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_fs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filename` text NOT NULL,
  `backend` varchar(60) NOT NULL,
  `backend_key` varchar(160) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `virtual_fs_backend` (`backend`),
  KEY `virtual_fs_filename` (`filename`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_fs`
--

LOCK TABLES `virtual_fs` WRITE;
/*!40000 ALTER TABLE `virtual_fs` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_fs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_fs_db`
--

DROP TABLE IF EXISTS `virtual_fs_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_fs_db` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filename` text NOT NULL,
  `content` longblob NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `virtual_fs_db_filename` (`filename`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_fs_db`
--

LOCK TABLES `virtual_fs_db` WRITE;
/*!40000 ALTER TABLE `virtual_fs_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_fs_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_fs_preferences`
--

DROP TABLE IF EXISTS `virtual_fs_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_fs_preferences` (
  `virtual_fs_id` bigint(20) NOT NULL,
  `preferences_key` varchar(150) NOT NULL,
  `preferences_value` text,
  KEY `virtual_fs_preferences_key_value` (`preferences_key`,`preferences_value`(150)),
  KEY `virtual_fs_preferences_virtual_fs_id` (`virtual_fs_id`),
  CONSTRAINT `FK_virtual_fs_preferences_virtual_fs_id_id` FOREIGN KEY (`virtual_fs_id`) REFERENCES `virtual_fs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_fs_preferences`
--

LOCK TABLES `virtual_fs_preferences` WRITE;
/*!40000 ALTER TABLE `virtual_fs_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_fs_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_upload_cache`
--

DROP TABLE IF EXISTS `web_upload_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_upload_cache` (
  `form_id` varchar(250) DEFAULT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `content_id` varchar(250) DEFAULT NULL,
  `content_size` varchar(30) DEFAULT NULL,
  `content_type` varchar(250) DEFAULT NULL,
  `disposition` varchar(15) DEFAULT NULL,
  `content` longblob NOT NULL,
  `create_time_unix` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_upload_cache`
--

LOCK TABLES `web_upload_cache` WRITE;
/*!40000 ALTER TABLE `web_upload_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_upload_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xml_storage`
--

DROP TABLE IF EXISTS `xml_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xml_storage` (
  `xml_type` varchar(200) NOT NULL,
  `xml_key` varchar(250) NOT NULL,
  `xml_content_key` varchar(250) NOT NULL,
  `xml_content_value` mediumtext,
  KEY `xml_storage_key_type` (`xml_key`(10),`xml_type`(10)),
  KEY `xml_storage_xml_content_key` (`xml_content_key`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xml_storage`
--

LOCK TABLES `xml_storage` WRITE;
/*!40000 ALTER TABLE `xml_storage` DISABLE KEYS */;
INSERT INTO `xml_storage` VALUES ('Stats','1','[0]{\'TagKey\'}','[0]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'Content\'}','0'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'Content\'}','2017-04-06 16:43:04'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'Content\'}','1'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Content\'}','\n'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'Content\'}','2017-04-06 16:43:04'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'Content\'}','1'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'Content\'}','List of open tickets, sorted by time left until response deadline expires.\n\nNOTE: Please check the output and configuration of the statistics carefully to make sure that it produces the results you expect. If necessary, change the configuration before using the statistics in a production environment.'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'Content\'}',''),('Stats','1','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'File\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'Content\'}','CSV'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'Content\'}','Excel'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'Content\'}','Print'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'Content\'}',''),('Stats','1','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'Content\'}','TicketList'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'Content\'}','Kernel::System::Stats::Dynamic::TicketList'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'Content\'}','Ticketlist'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'Content\'}','3'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'Content\'}','10001'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'Content\'}','dynamic'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'Content\'}','0'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'Content\'}','0'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'Content\'}','List of open tickets, sorted by time left until response deadline expires'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Content\'}','\n'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Element\'}','StateIDs'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Fixed\'}','1'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','1'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[2]{\'Content\'}','4'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[2]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[3]{\'Content\'}','8'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[3]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[4]{\'Content\'}','7'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[4]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[4]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[5]{\'Content\'}','6'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[5]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[5]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Content\'}','\n'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Element\'}','OrderBy'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Fixed\'}','1'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','UpdateTimeDestinationDate'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Content\'}','\n'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Element\'}','SortSequence'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Fixed\'}','1'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'Content\'}','Up'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Content\'}','\n'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Element\'}','TicketAttributes'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Fixed\'}','1'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'Content\'}','1'),('Stats','1','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]'),('Stats','2','[0]{\'TagKey\'}','[0]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'Content\'}','0'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'Content\'}','2017-04-06 16:43:07'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'Content\'}','1'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Content\'}','\n'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'Content\'}','2017-04-06 16:43:07'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'Content\'}','1'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'Content\'}','List of open tickets, sorted by time left until solution deadline expires.\n\nNOTE: Please check the output and configuration of the statistics carefully to make sure that it produces the results you expect. If necessary, change the configuration before using the statistics in a production environment.'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'Content\'}',''),('Stats','2','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'File\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'Content\'}','CSV'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'Content\'}','Excel'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'Content\'}','Print'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'Content\'}',''),('Stats','2','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'Content\'}','TicketList'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'Content\'}','Kernel::System::Stats::Dynamic::TicketList'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'Content\'}','Ticketlist'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'Content\'}','3'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'Content\'}','10002'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'Content\'}','dynamic'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'Content\'}','0'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'Content\'}','0'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'Content\'}','List of open tickets, sorted by time left until solution deadline expires'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Content\'}','\n'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Element\'}','StateIDs'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Fixed\'}','1'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','1'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[2]{\'Content\'}','4'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[2]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[3]{\'Content\'}','8'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[3]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[4]{\'Content\'}','7'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[4]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[4]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[5]{\'Content\'}','6'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[5]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[5]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Content\'}','\n'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Element\'}','OrderBy'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Fixed\'}','1'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','SolutionTimeDestinationDate'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Content\'}','\n'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Element\'}','SortSequence'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Fixed\'}','1'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'Content\'}','Up'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Content\'}','\n'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Element\'}','TicketAttributes'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Fixed\'}','1'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'Content\'}','1'),('Stats','2','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]'),('Stats','3','[0]{\'TagKey\'}','[0]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'Content\'}','0'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'Content\'}','2017-04-06 16:43:10'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'Content\'}','1'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Content\'}','\n'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'Content\'}','2017-04-06 16:43:10'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'Content\'}','1'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'Content\'}','List of tickets closed last month which required the most time to process.\n\nNOTE: Please check the output and configuration of the statistics carefully to make sure that it produces the results you expect. If necessary, change the configuration before using the statistics in a production environment.'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'Content\'}',''),('Stats','3','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'File\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'Content\'}','CSV'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'Content\'}','Excel'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'Content\'}','Print'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'Content\'}',''),('Stats','3','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'Content\'}','TicketList'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'Content\'}','Kernel::System::Stats::Dynamic::TicketList'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'Content\'}','Ticketlist'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'Content\'}','3'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'Content\'}','10003'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'Content\'}','dynamic'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'Content\'}','0'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'Content\'}','0'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'Content\'}','List of the most time-consuming tickets'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Content\'}','\n'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Element\'}','Limit'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Fixed\'}','1'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','5'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'Content\'}','\n'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'Element\'}','CloseTime'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'Fixed\'}','1'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'TimeRelativeCount\'}','1'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'TimeRelativeUnit\'}','Month'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'TimeRelativeUpcomingCount\'}','0'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Content\'}','\n'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Element\'}','OrderBy'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Fixed\'}','1'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','AccountedTime'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Content\'}','\n'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Element\'}','SortSequence'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Fixed\'}','1'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'Content\'}','Down'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Content\'}','\n'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Element\'}','TicketAttributes'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Fixed\'}','1'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'Content\'}','1'),('Stats','3','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]'),('Stats','4','[0]{\'TagKey\'}','[0]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'Content\'}','0'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'Content\'}','2017-04-06 16:43:13'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'Content\'}','1'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Content\'}','\n'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'Content\'}','2017-04-06 16:43:13'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'Content\'}','1'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'Content\'}','List of all tickets closed last month. Order by age.\n\nNOTE: Please check the output and configuration of the statistics carefully to make sure that it produces the results you expect. If necessary, change the configuration before using the statistics in a production environment.'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'Content\'}',''),('Stats','4','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'File\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'Content\'}','CSV'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'Content\'}','Excel'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'Content\'}','Print'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'Content\'}',''),('Stats','4','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'Content\'}','TicketList'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'Content\'}','Kernel::System::Stats::Dynamic::TicketList'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'Content\'}','Ticketlist'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'Content\'}','3'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'Content\'}','10004'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'Content\'}','dynamic'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'Content\'}','0'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'Content\'}','0'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'Content\'}','List of tickets closed last month'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Content\'}','\n'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Element\'}','Limit'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Fixed\'}','1'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','unlimited'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'Content\'}','\n'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'Element\'}','CloseTime'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'Fixed\'}','1'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'TimeRelativeCount\'}','1'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'TimeRelativeUnit\'}','Month'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'TimeRelativeUpcomingCount\'}','0'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Content\'}','\n'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Element\'}','OrderBy'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Fixed\'}','1'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','Age'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Content\'}','\n'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Element\'}','SortSequence'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Fixed\'}','1'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'Content\'}','Down'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Content\'}','\n'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Element\'}','TicketAttributes'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Fixed\'}','1'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'Content\'}','1'),('Stats','4','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]'),('Stats','5','[0]{\'TagKey\'}','[0]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'Content\'}','0'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'Content\'}','2017-04-06 16:43:16'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'Content\'}','1'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Content\'}','\n'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'Content\'}','2017-04-06 16:43:16'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'Content\'}','1'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'Content\'}','List of all tickets created last month. Order by age.\n\nNOTE: Please check the output and configuration of the statistics carefully to make sure that it produces the results you expect. If necessary, change the configuration before using the statistics in a production environment.'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'Content\'}',''),('Stats','5','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'File\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'Content\'}','CSV'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'Content\'}','Excel'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'Content\'}','Print'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'Content\'}',''),('Stats','5','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'Content\'}','TicketList'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'Content\'}','Kernel::System::Stats::Dynamic::TicketList'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'Content\'}','Ticketlist'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'Content\'}','3'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'Content\'}','10005'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'Content\'}','dynamic'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'Content\'}','0'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'Content\'}','0'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'Content\'}','List of tickets created last month'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Content\'}','\n'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Element\'}','Limit'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Fixed\'}','1'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','unlimited'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'Content\'}','\n'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'Element\'}','CreateTime'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'Fixed\'}','1'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'TimeRelativeCount\'}','1'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'TimeRelativeUnit\'}','Month'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[2]{\'TimeRelativeUpcomingCount\'}','0'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Content\'}','\n'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Element\'}','OrderBy'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Fixed\'}','1'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','Age'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Content\'}','\n'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Element\'}','SortSequence'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Fixed\'}','1'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'Content\'}','Up'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Content\'}','\n'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Element\'}','TicketAttributes'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Fixed\'}','1'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'Content\'}','1'),('Stats','5','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]'),('Stats','6','[0]{\'TagKey\'}','[0]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'Content\'}','0'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'Content\'}','2017-04-06 16:43:19'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'Content\'}','1'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Content\'}','\n'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'Content\'}','2017-04-06 16:43:19'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'Content\'}','1'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'Content\'}','List of tickets closed last month, sorted by response time.\n\nNOTE: Please check the output and configuration of the statistics carefully to make sure that it produces the results you expect. If necessary, change the configuration before using the statistics in a production environment.'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'Content\'}',''),('Stats','6','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'File\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'Content\'}','CSV'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'Content\'}','Excel'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'Content\'}','Print'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'Content\'}',''),('Stats','6','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'Content\'}','TicketList'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'Content\'}','Kernel::System::Stats::Dynamic::TicketList'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'Content\'}','Ticketlist'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'Content\'}','3'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'Content\'}','10006'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'Content\'}','dynamic'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'Content\'}','0'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'Content\'}','0'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'Content\'}','List of tickets closed, sorted by response time.'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Content\'}','\n'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Element\'}','CloseTime'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Fixed\'}','1'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TimeRelativeCount\'}','1'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TimeRelativeUnit\'}','Month'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TimeRelativeUpcomingCount\'}','0'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Content\'}','\n'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Element\'}','OrderBy'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Fixed\'}','1'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','FirstResponseDiffInMin'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Content\'}','\n'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Element\'}','SortSequence'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Fixed\'}','1'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'Content\'}','Up'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Content\'}','\n'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Element\'}','TicketAttributes'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Fixed\'}','1'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'Content\'}','1'),('Stats','6','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]'),('Stats','7','[0]{\'TagKey\'}','[0]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'Content\'}','0'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'Content\'}','2017-04-06 16:43:21'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'Content\'}','1'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Content\'}','\n'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'Content\'}','2017-04-06 16:43:21'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'Content\'}','1'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'Content\'}','Current state of all tickets in the system without time restrictions.'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'Content\'}','CSV'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'Content\'}','D3::BarChart'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'Content\'}','D3::LineChart'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Format\'}[4]{\'Content\'}','D3::StackedAreaChart'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Format\'}[4]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[4]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Format\'}[5]{\'Content\'}','Excel'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Format\'}[5]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[5]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Format\'}[6]{\'Content\'}','Print'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Format\'}[6]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[6]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'Content\'}','Ticket'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'Content\'}','Kernel::System::Stats::Dynamic::Ticket'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'Content\'}','3'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'Content\'}','10007'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'Content\'}','dynamic'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'Content\'}','1'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'Content\'}','1'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'Content\'}','Overview about all tickets in the system'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Content\'}','\n'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Element\'}','QueueIDs'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Fixed\'}','1'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Content\'}','\n'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Element\'}','StateIDs'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Fixed\'}','1'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'Content\'}','1'),('Stats','7','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]'),('Stats','8','[0]{\'TagKey\'}','[0]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'Content\'}','1'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'Content\'}','2017-04-06 16:43:23'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'Content\'}','1'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Content\'}','\n'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'Content\'}','2017-04-06 16:43:23'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'Content\'}','1'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'Content\'}','Total number of new tickets per day and queue which have been created during the last month.'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'Content\'}','CSV'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'Content\'}','D3::BarChart'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'Content\'}','D3::LineChart'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Format\'}[4]{\'Content\'}','D3::StackedAreaChart'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Format\'}[4]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[4]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Format\'}[5]{\'Content\'}','Excel'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Format\'}[5]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[5]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Format\'}[6]{\'Content\'}','Print'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Format\'}[6]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[6]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'Content\'}','Ticket'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'Content\'}','Kernel::System::Stats::Dynamic::Ticket'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'Content\'}','3'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'Content\'}','10008'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'Content\'}','dynamic'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'Content\'}','1'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'Content\'}','1'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'Content\'}','New Tickets'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Content\'}','\n'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Element\'}','QueueIDs'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Fixed\'}','1'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Content\'}','\n'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Element\'}','CreateTime'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Fixed\'}','1'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','Day'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'SelectedValues\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TimeRelativeCount\'}','1'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TimeRelativeUnit\'}','Month'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TimeRelativeUpcomingCount\'}','0'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TimeScaleCount\'}','1'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'Content\'}','1'),('Stats','8','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]'),('Stats','9','[0]{\'TagKey\'}','[0]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'Content\'}','0'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'Content\'}','2017-04-06 16:43:26'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'Content\'}','1'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Content\'}','\n'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'Content\'}','2017-04-06 16:43:26'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'Content\'}','1'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'Content\'}','List of open tickets, sorted by time left until escalation deadline expires.\n\nNOTE: Please check the output and configuration of the statistics carefully to make sure that it produces the results you expect. If necessary, change the configuration before using the statistics in a production environment.'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'Content\'}',''),('Stats','9','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'File\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'Content\'}','CSV'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'Content\'}','Excel'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'Content\'}','Print'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'Content\'}',''),('Stats','9','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'Content\'}','TicketList'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'Content\'}','Kernel::System::Stats::Dynamic::TicketList'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'Content\'}','Ticketlist'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'Content\'}','3'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'Content\'}','10009'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'Content\'}','dynamic'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'Content\'}','0'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'Content\'}','0'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'Content\'}','List of open tickets, sorted by time left until escalation deadline expires'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Content\'}','\n'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Element\'}','StateIDs'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Fixed\'}','1'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','1'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[2]{\'Content\'}','4'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[2]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[3]{\'Content\'}','8'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[3]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[4]{\'Content\'}','7'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[4]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[4]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[5]{\'Content\'}','6'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[5]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'SelectedValues\'}[5]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Content\'}','\n'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Element\'}','OrderBy'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Fixed\'}','1'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','EscalationTimeWorkingTime'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Content\'}','\n'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Element\'}','SortSequence'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Fixed\'}','1'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'Content\'}','Up'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Content\'}','\n'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Element\'}','TicketAttributes'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Fixed\'}','1'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'Content\'}','1'),('Stats','9','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]'),('Stats','10','[0]{\'TagKey\'}','[0]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'Content\'}','1'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'Content\'}','2017-04-06 16:43:29'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'Content\'}','1'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Content\'}','\n'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'Content\'}','2017-04-06 16:43:29'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'Content\'}','1'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'Content\'}','Monthly overview, which reports status changes per day of a selected month.'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'Content\'}','StateAction'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'File\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'Content\'}','CSV'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'Content\'}','D3::BarChart'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'Content\'}','D3::LineChart'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Format\'}[4]{\'Content\'}','D3::StackedAreaChart'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Format\'}[4]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[4]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Format\'}[5]{\'Content\'}','Excel'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Format\'}[5]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[5]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Format\'}[6]{\'Content\'}','Print'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Format\'}[6]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[6]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'Content\'}',''),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'Content\'}','Kernel::System::Stats::Static::StateAction'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'Content\'}','3'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'Content\'}','10010'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'Content\'}','static'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'Content\'}','1'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'Content\'}','1'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'Content\'}','Changes of status in a monthly overview'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'Content\'}','1'),('Stats','10','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]'),('Stats','11','[0]{\'TagKey\'}','[0]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'Content\'}','0'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Cache\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'Content\'}','2017-04-06 16:43:31'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Changed\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'Content\'}','1'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ChangedBy\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Content\'}','\n'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'Content\'}','2017-04-06 16:43:31'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Created\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'Content\'}','1'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'CreatedBy\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'Content\'}','List of tickets closed last month, sorted by solution time.\n\nNOTE: Please check the output and configuration of the statistics carefully to make sure that it produces the results you expect. If necessary, change the configuration before using the statistics in a production environment.'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Description\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'Content\'}',''),('Stats','11','[0]{\'otrs_stats\'}[1]{\'File\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'File\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'Content\'}','CSV'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'Content\'}','Excel'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[2]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'Content\'}','Print'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Format\'}[3]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'Content\'}',''),('Stats','11','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'GraphSize\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'Content\'}','TicketList'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Object\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'Content\'}','Kernel::System::Stats::Dynamic::TicketList'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectModule\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'Content\'}','Ticketlist'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'ObjectName\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'Content\'}','3'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Permission\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'Content\'}','10011'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatNumber\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'Content\'}','dynamic'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'StatType\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'Content\'}','0'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumCol\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'Content\'}','0'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'SumRow\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'Content\'}','List of tickets closed, sorted by solution time'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Title\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Content\'}','\n'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Element\'}','CloseTime'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'Fixed\'}','1'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TimeRelativeCount\'}','1'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TimeRelativeUnit\'}','Month'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsRestriction\'}[1]{\'TimeRelativeUpcomingCount\'}','0'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Content\'}','\n'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Element\'}','OrderBy'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'Fixed\'}','1'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'Content\'}','SolutionDiffInMin'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'SelectedValues\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Content\'}','\n'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Element\'}','SortSequence'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'Fixed\'}','1'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'Content\'}','Up'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'SelectedValues\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsValueSeries\'}[2]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Content\'}','\n'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Element\'}','TicketAttributes'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'Fixed\'}','1'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'UseAsXvalue\'}[1]'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'Content\'}','1'),('Stats','11','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]{\'TagKey\'}','[0]{\'otrs_stats\'}[1]{\'Valid\'}[1]');
/*!40000 ALTER TABLE `xml_storage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-07 14:34:15
