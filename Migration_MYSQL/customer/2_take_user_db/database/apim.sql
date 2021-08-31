-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: 172.18.0.2    Database: apim
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `AM_ALERT_EMAILLIST`
--

DROP TABLE IF EXISTS `AM_ALERT_EMAILLIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_ALERT_EMAILLIST` (
  `EMAIL_LIST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(255) NOT NULL,
  `STAKE_HOLDER` varchar(100) NOT NULL,
  PRIMARY KEY (`EMAIL_LIST_ID`,`USER_NAME`,`STAKE_HOLDER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_ALERT_EMAILLIST`
--

LOCK TABLES `AM_ALERT_EMAILLIST` WRITE;
/*!40000 ALTER TABLE `AM_ALERT_EMAILLIST` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_ALERT_EMAILLIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_ALERT_EMAILLIST_DETAILS`
--

DROP TABLE IF EXISTS `AM_ALERT_EMAILLIST_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_ALERT_EMAILLIST_DETAILS` (
  `EMAIL_LIST_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  PRIMARY KEY (`EMAIL_LIST_ID`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_ALERT_EMAILLIST_DETAILS`
--

LOCK TABLES `AM_ALERT_EMAILLIST_DETAILS` WRITE;
/*!40000 ALTER TABLE `AM_ALERT_EMAILLIST_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_ALERT_EMAILLIST_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_ALERT_TYPES`
--

DROP TABLE IF EXISTS `AM_ALERT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_ALERT_TYPES` (
  `ALERT_TYPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ALERT_TYPE_NAME` varchar(255) NOT NULL,
  `STAKE_HOLDER` varchar(100) NOT NULL,
  PRIMARY KEY (`ALERT_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_ALERT_TYPES`
--

LOCK TABLES `AM_ALERT_TYPES` WRITE;
/*!40000 ALTER TABLE `AM_ALERT_TYPES` DISABLE KEYS */;
INSERT INTO `AM_ALERT_TYPES` VALUES (1,'AbnormalResponseTime','publisher'),(2,'AbnormalBackendTime','publisher'),(3,'AbnormalRequestsPerMin','subscriber'),(4,'AbnormalRequestPattern','subscriber'),(5,'UnusualIPAccess','subscriber'),(6,'FrequentTierLimitHitting','subscriber'),(7,'ApiHealthMonitor','publisher');
/*!40000 ALTER TABLE `AM_ALERT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_ALERT_TYPES_VALUES`
--

DROP TABLE IF EXISTS `AM_ALERT_TYPES_VALUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_ALERT_TYPES_VALUES` (
  `ALERT_TYPE_ID` int(11) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `STAKE_HOLDER` varchar(100) NOT NULL,
  PRIMARY KEY (`ALERT_TYPE_ID`,`USER_NAME`,`STAKE_HOLDER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_ALERT_TYPES_VALUES`
--

LOCK TABLES `AM_ALERT_TYPES_VALUES` WRITE;
/*!40000 ALTER TABLE `AM_ALERT_TYPES_VALUES` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_ALERT_TYPES_VALUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API`
--

DROP TABLE IF EXISTS `AM_API`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API` (
  `API_ID` int(11) NOT NULL AUTO_INCREMENT,
  `API_PROVIDER` varchar(200) DEFAULT NULL,
  `API_NAME` varchar(200) DEFAULT NULL,
  `API_VERSION` varchar(30) DEFAULT NULL,
  `CONTEXT` varchar(256) DEFAULT NULL,
  `CONTEXT_TEMPLATE` varchar(256) DEFAULT NULL,
  `API_TIER` varchar(256) DEFAULT NULL,
  `API_TYPE` varchar(10) DEFAULT NULL,
  `CREATED_BY` varchar(100) DEFAULT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(100) DEFAULT NULL,
  `UPDATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`API_ID`),
  UNIQUE KEY `API_PROVIDER` (`API_PROVIDER`,`API_NAME`,`API_VERSION`),
  KEY `IDX_AAI_CTX` (`CONTEXT`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API`
--

LOCK TABLES `AM_API` WRITE;
/*!40000 ALTER TABLE `AM_API` DISABLE KEYS */;
INSERT INTO `AM_API` VALUES (1,'apicreator1','PizzaShackAPI_1_1','1.0.0','/pizzashack_1_1/1.0.0','/pizzashack_1_1','Unlimited','HTTP','apicreator1','2021-07-20 04:23:14',NULL,'2021-07-20 04:23:13'),(2,'apicreator1','PizzaShackAPI_1_2','1.0.0','/pizzashack_1_2/1.0.0','/pizzashack_1_2','Unlimited','HTTP','apicreator1','2021-07-20 04:23:42',NULL,'2021-07-20 04:23:41'),(3,'apicreator1','PizzaShackAPI_1_3','1.0.0','/pizzashack_1_3/1.0.0','/pizzashack_1_3','Unlimited','HTTP','apicreator1','2021-07-20 04:23:59',NULL,'2021-07-20 04:23:58');
/*!40000 ALTER TABLE `AM_API` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_CATEGORIES`
--

DROP TABLE IF EXISTS `AM_API_CATEGORIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_CATEGORIES` (
  `UUID` varchar(50) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`UUID`),
  UNIQUE KEY `NAME` (`NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_CATEGORIES`
--

LOCK TABLES `AM_API_CATEGORIES` WRITE;
/*!40000 ALTER TABLE `AM_API_CATEGORIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_CATEGORIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_CLIENT_CERTIFICATE`
--

DROP TABLE IF EXISTS `AM_API_CLIENT_CERTIFICATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_CLIENT_CERTIFICATE` (
  `TENANT_ID` int(11) NOT NULL,
  `ALIAS` varchar(45) NOT NULL,
  `API_ID` int(11) NOT NULL,
  `CERTIFICATE` blob NOT NULL,
  `REMOVED` tinyint(1) NOT NULL DEFAULT '0',
  `TIER_NAME` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ALIAS`,`TENANT_ID`,`REMOVED`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `AM_API_CLIENT_CERTIFICATE_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_CLIENT_CERTIFICATE`
--

LOCK TABLES `AM_API_CLIENT_CERTIFICATE` WRITE;
/*!40000 ALTER TABLE `AM_API_CLIENT_CERTIFICATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_CLIENT_CERTIFICATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_COMMENTS`
--

DROP TABLE IF EXISTS `AM_API_COMMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_COMMENTS` (
  `COMMENT_ID` varchar(255) NOT NULL,
  `COMMENT_TEXT` varchar(512) DEFAULT NULL,
  `COMMENTED_USER` varchar(255) DEFAULT NULL,
  `DATE_COMMENTED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `API_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`COMMENT_ID`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `AM_API_COMMENTS_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_COMMENTS`
--

LOCK TABLES `AM_API_COMMENTS` WRITE;
/*!40000 ALTER TABLE `AM_API_COMMENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_COMMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_DEFAULT_VERSION`
--

DROP TABLE IF EXISTS `AM_API_DEFAULT_VERSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_DEFAULT_VERSION` (
  `DEFAULT_VERSION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `API_NAME` varchar(256) NOT NULL,
  `API_PROVIDER` varchar(256) NOT NULL,
  `DEFAULT_API_VERSION` varchar(30) DEFAULT NULL,
  `PUBLISHED_DEFAULT_API_VERSION` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DEFAULT_VERSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_DEFAULT_VERSION`
--

LOCK TABLES `AM_API_DEFAULT_VERSION` WRITE;
/*!40000 ALTER TABLE `AM_API_DEFAULT_VERSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_DEFAULT_VERSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_LC_EVENT`
--

DROP TABLE IF EXISTS `AM_API_LC_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_LC_EVENT` (
  `EVENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `API_ID` int(11) NOT NULL,
  `PREVIOUS_STATE` varchar(50) DEFAULT NULL,
  `NEW_STATE` varchar(50) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `EVENT_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`EVENT_ID`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `AM_API_LC_EVENT_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_LC_EVENT`
--

LOCK TABLES `AM_API_LC_EVENT` WRITE;
/*!40000 ALTER TABLE `AM_API_LC_EVENT` DISABLE KEYS */;
INSERT INTO `AM_API_LC_EVENT` VALUES (1,1,NULL,'CREATED','apicreator1',-1234,'2021-07-20 04:23:14'),(2,1,'CREATED','PUBLISHED','apipublisher1',-1234,'2021-07-20 04:23:20'),(3,2,NULL,'CREATED','apicreator1',-1234,'2021-07-20 04:23:42'),(4,2,'CREATED','PUBLISHED','apipublisher1',-1234,'2021-07-20 04:23:43'),(5,3,NULL,'CREATED','apicreator1',-1234,'2021-07-20 04:23:59'),(6,3,'CREATED','PUBLISHED','apipublisher1',-1234,'2021-07-20 04:24:00');
/*!40000 ALTER TABLE `AM_API_LC_EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_LC_PUBLISH_EVENTS`
--

DROP TABLE IF EXISTS `AM_API_LC_PUBLISH_EVENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_LC_PUBLISH_EVENTS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_DOMAIN` varchar(500) NOT NULL,
  `API_ID` varchar(500) NOT NULL,
  `EVENT_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_LC_PUBLISH_EVENTS`
--

LOCK TABLES `AM_API_LC_PUBLISH_EVENTS` WRITE;
/*!40000 ALTER TABLE `AM_API_LC_PUBLISH_EVENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_LC_PUBLISH_EVENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_PRODUCT_MAPPING`
--

DROP TABLE IF EXISTS `AM_API_PRODUCT_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_PRODUCT_MAPPING` (
  `API_PRODUCT_MAPPING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `API_ID` int(11) DEFAULT NULL,
  `URL_MAPPING_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`API_PRODUCT_MAPPING_ID`),
  KEY `URL_MAPPING_ID` (`URL_MAPPING_ID`),
  KEY `IDX_AAPM_AI` (`API_ID`),
  CONSTRAINT `AM_API_PRODUCT_MAPPING_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE CASCADE,
  CONSTRAINT `AM_API_PRODUCT_MAPPING_ibfk_2` FOREIGN KEY (`URL_MAPPING_ID`) REFERENCES `AM_API_URL_MAPPING` (`URL_MAPPING_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_PRODUCT_MAPPING`
--

LOCK TABLES `AM_API_PRODUCT_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_API_PRODUCT_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_PRODUCT_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_RATINGS`
--

DROP TABLE IF EXISTS `AM_API_RATINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_RATINGS` (
  `RATING_ID` varchar(255) NOT NULL,
  `API_ID` int(11) DEFAULT NULL,
  `RATING` int(11) DEFAULT NULL,
  `SUBSCRIBER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RATING_ID`),
  KEY `API_ID` (`API_ID`),
  KEY `SUBSCRIBER_ID` (`SUBSCRIBER_ID`),
  CONSTRAINT `AM_API_RATINGS_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON UPDATE CASCADE,
  CONSTRAINT `AM_API_RATINGS_ibfk_2` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `AM_SUBSCRIBER` (`SUBSCRIBER_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_RATINGS`
--

LOCK TABLES `AM_API_RATINGS` WRITE;
/*!40000 ALTER TABLE `AM_API_RATINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_RATINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_RESOURCE_SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `AM_API_RESOURCE_SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_RESOURCE_SCOPE_MAPPING` (
  `SCOPE_NAME` varchar(255) NOT NULL,
  `URL_MAPPING_ID` int(11) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`SCOPE_NAME`,`URL_MAPPING_ID`),
  KEY `URL_MAPPING_ID` (`URL_MAPPING_ID`),
  CONSTRAINT `AM_API_RESOURCE_SCOPE_MAPPING_ibfk_1` FOREIGN KEY (`URL_MAPPING_ID`) REFERENCES `AM_API_URL_MAPPING` (`URL_MAPPING_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_RESOURCE_SCOPE_MAPPING`
--

LOCK TABLES `AM_API_RESOURCE_SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_API_RESOURCE_SCOPE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_API_RESOURCE_SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_THROTTLE_POLICY`
--

DROP TABLE IF EXISTS `AM_API_THROTTLE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_THROTTLE_POLICY` (
  `POLICY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(512) NOT NULL,
  `DISPLAY_NAME` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `DEFAULT_QUOTA_TYPE` varchar(25) NOT NULL,
  `DEFAULT_QUOTA` int(11) NOT NULL,
  `DEFAULT_QUOTA_UNIT` varchar(10) DEFAULT NULL,
  `DEFAULT_UNIT_TIME` int(11) NOT NULL,
  `DEFAULT_TIME_UNIT` varchar(25) NOT NULL,
  `APPLICABLE_LEVEL` varchar(25) NOT NULL,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  `UUID` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `API_NAME_TENANT` (`NAME`,`TENANT_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `IDX_AATP_DQT` (`DEFAULT_QUOTA_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_THROTTLE_POLICY`
--

LOCK TABLES `AM_API_THROTTLE_POLICY` WRITE;
/*!40000 ALTER TABLE `AM_API_THROTTLE_POLICY` DISABLE KEYS */;
INSERT INTO `AM_API_THROTTLE_POLICY` VALUES (1,'50KPerMin','50KPerMin',-1234,'Allows 50000 requests per minute','requestCount',50000,NULL,1,'min','apiLevel',1,'0960f16c-fd66-4ac9-82b2-ef82a2173a71'),(2,'20KPerMin','20KPerMin',-1234,'Allows 20000 requests per minute','requestCount',20000,NULL,1,'min','apiLevel',1,'8951666a-e036-49f9-ac2d-292af7cd43fe'),(3,'10KPerMin','10KPerMin',-1234,'Allows 10000 requests per minute','requestCount',10000,NULL,1,'min','apiLevel',1,'98dbdb74-a186-4194-b821-dfcdccd4e5d8'),(4,'Unlimited','Unlimited',-1234,'Allows unlimited requests','requestCount',2147483647,NULL,1,'min','apiLevel',1,'44a8faef-9b01-48da-9d1d-51827b7a5ab3');
/*!40000 ALTER TABLE `AM_API_THROTTLE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_API_URL_MAPPING`
--

DROP TABLE IF EXISTS `AM_API_URL_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_URL_MAPPING` (
  `URL_MAPPING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `API_ID` int(11) NOT NULL,
  `HTTP_METHOD` varchar(20) DEFAULT NULL,
  `AUTH_SCHEME` varchar(50) DEFAULT NULL,
  `URL_PATTERN` varchar(512) DEFAULT NULL,
  `THROTTLING_TIER` varchar(512) DEFAULT NULL,
  `MEDIATION_SCRIPT` blob,
  PRIMARY KEY (`URL_MAPPING_ID`),
  KEY `IDX_AAUM_AI` (`API_ID`),
  KEY `IDX_AAUM_TT` (`THROTTLING_TIER`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_API_URL_MAPPING`
--

LOCK TABLES `AM_API_URL_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_API_URL_MAPPING` DISABLE KEYS */;
INSERT INTO `AM_API_URL_MAPPING` VALUES (1,1,'POST','Any','/order','Unlimited',NULL),(2,1,'GET','Any','/menu','Unlimited',NULL),(3,2,'POST','Any','/order','Unlimited',NULL),(4,2,'GET','Any','/menu','Unlimited',NULL),(5,3,'POST','Any','/order','Unlimited',NULL),(6,3,'GET','Any','/menu','Unlimited',NULL);
/*!40000 ALTER TABLE `AM_API_URL_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_APPLICATION`
--

DROP TABLE IF EXISTS `AM_APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_APPLICATION` (
  `APPLICATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `SUBSCRIBER_ID` int(11) DEFAULT NULL,
  `APPLICATION_TIER` varchar(50) DEFAULT 'Unlimited',
  `CALLBACK_URL` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `APPLICATION_STATUS` varchar(50) DEFAULT 'APPROVED',
  `GROUP_ID` varchar(100) DEFAULT NULL,
  `CREATED_BY` varchar(100) DEFAULT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(100) DEFAULT NULL,
  `UPDATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UUID` varchar(256) DEFAULT NULL,
  `TOKEN_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`APPLICATION_ID`),
  UNIQUE KEY `NAME` (`NAME`,`SUBSCRIBER_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `SUBSCRIBER_ID` (`SUBSCRIBER_ID`),
  KEY `IDX_AA_AT_CB` (`APPLICATION_TIER`,`CREATED_BY`),
  CONSTRAINT `AM_APPLICATION_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `AM_SUBSCRIBER` (`SUBSCRIBER_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_APPLICATION`
--

LOCK TABLES `AM_APPLICATION` WRITE;
/*!40000 ALTER TABLE `AM_APPLICATION` DISABLE KEYS */;
INSERT INTO `AM_APPLICATION` VALUES (1,'DefaultApplication',1,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_1_1','2021-07-20 04:23:23',NULL,'2021-07-20 04:23:23','ca8c6cd6-924e-4ca3-a6c7-f19d7f4af259','JWT'),(2,'application_1_1_1',1,'Unlimited',NULL,'sample app description 1_1_1','APPROVED',NULL,'apisubscriber_1_1_1','2021-07-20 04:23:23',NULL,'2021-07-20 04:23:23','65cd8057-787f-4039-9295-514e9ee2064f','JWT'),(3,'DefaultApplication',2,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_1_2','2021-07-20 04:23:30',NULL,'2021-07-20 04:23:30','7ddc08ef-9cd8-4fe0-8697-56c8afc83ff5','JWT'),(4,'application_1_1_2',2,'Unlimited',NULL,'sample app description 1_1_2','APPROVED',NULL,'apisubscriber_1_1_2','2021-07-20 04:23:30',NULL,'2021-07-20 04:23:30','4a14a3ef-85fd-4659-8378-96eb238f6547','JWT'),(5,'DefaultApplication',3,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_1_3','2021-07-20 04:23:33',NULL,'2021-07-20 04:23:33','b323be5c-65b4-4569-9bc6-6cb2bacf4a57','JWT'),(6,'application_1_1_3',3,'Unlimited',NULL,'sample app description 1_1_3','APPROVED',NULL,'apisubscriber_1_1_3','2021-07-20 04:23:33',NULL,'2021-07-20 04:23:33','5a1fe629-6b05-4bc9-b214-48739844106b','JWT'),(7,'DefaultApplication',4,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_1_4','2021-07-20 04:23:36',NULL,'2021-07-20 04:23:36','922bd880-5569-4aaa-bc17-f82a22d33d51','JWT'),(8,'application_1_1_4',4,'Unlimited',NULL,'sample app description 1_1_4','APPROVED',NULL,'apisubscriber_1_1_4','2021-07-20 04:23:35',NULL,'2021-07-20 04:23:36','8206eb93-5590-4898-bb9f-58fcaa7c9cb3','JWT'),(9,'DefaultApplication',5,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_1_5','2021-07-20 04:23:39',NULL,'2021-07-20 04:23:39','0750157a-99ed-4dc7-878d-110ce472bd1c','JWT'),(10,'application_1_1_5',5,'Unlimited',NULL,'sample app description 1_1_5','APPROVED',NULL,'apisubscriber_1_1_5','2021-07-20 04:23:39',NULL,'2021-07-20 04:23:39','54db786d-39e3-45b9-9a71-36fb53f0ab97','JWT'),(11,'DefaultApplication',6,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_2_6','2021-07-20 04:23:45',NULL,'2021-07-20 04:23:45','10381df2-ebfc-474e-8305-542d57bece75','JWT'),(12,'application_1_2_6',6,'Unlimited',NULL,'sample app description 1_2_6','APPROVED',NULL,'apisubscriber_1_2_6','2021-07-20 04:23:44',NULL,'2021-07-20 04:23:45','7557bec5-5627-4fd1-b2db-b296d0b0e132','JWT'),(13,'DefaultApplication',7,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_2_7','2021-07-20 04:23:48',NULL,'2021-07-20 04:23:48','989d4db5-d06e-494b-9ed3-cc84ea1b0293','JWT'),(14,'application_1_2_7',7,'Unlimited',NULL,'sample app description 1_2_7','APPROVED',NULL,'apisubscriber_1_2_7','2021-07-20 04:23:48',NULL,'2021-07-20 04:23:48','08dbad84-107f-4bda-b353-a0209d447ede','JWT'),(15,'DefaultApplication',8,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_2_8','2021-07-20 04:23:51',NULL,'2021-07-20 04:23:51','4d28c71c-a50f-4388-86ab-12380a9f70e3','JWT'),(16,'application_1_2_8',8,'Unlimited',NULL,'sample app description 1_2_8','APPROVED',NULL,'apisubscriber_1_2_8','2021-07-20 04:23:50',NULL,'2021-07-20 04:23:51','4e54ebae-1345-4116-81e0-91ec88bd39d7','JWT'),(17,'DefaultApplication',9,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_2_9','2021-07-20 04:23:53',NULL,'2021-07-20 04:23:53','e2d2868f-28d5-4f67-935b-616973b8b1f3','JWT'),(18,'application_1_2_9',9,'Unlimited',NULL,'sample app description 1_2_9','APPROVED',NULL,'apisubscriber_1_2_9','2021-07-20 04:23:53',NULL,'2021-07-20 04:23:53','19ce5e78-eb18-48c4-b645-75d04f779dc5','JWT'),(19,'DefaultApplication',10,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_2_10','2021-07-20 04:23:56',NULL,'2021-07-20 04:23:56','8970e1cd-27eb-4630-a3f4-c70d55f96c18','JWT'),(20,'application_1_2_10',10,'Unlimited',NULL,'sample app description 1_2_10','APPROVED',NULL,'apisubscriber_1_2_10','2021-07-20 04:23:56',NULL,'2021-07-20 04:23:56','368a4b98-8a87-4973-94ff-607aae7c6d0f','JWT'),(21,'DefaultApplication',11,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_3_11','2021-07-20 04:24:01',NULL,'2021-07-20 04:24:01','b2fd806b-f5bd-4554-a011-972304a3512c','JWT'),(22,'application_1_3_11',11,'Unlimited',NULL,'sample app description 1_3_11','APPROVED',NULL,'apisubscriber_1_3_11','2021-07-20 04:24:01',NULL,'2021-07-20 04:24:01','66028ead-cdd4-4ced-b8f6-3301e4b10899','JWT'),(23,'DefaultApplication',12,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_3_12','2021-07-20 04:24:04',NULL,'2021-07-20 04:24:04','951093f7-47c7-4e0b-8601-650637a959e9','JWT'),(24,'application_1_3_12',12,'Unlimited',NULL,'sample app description 1_3_12','APPROVED',NULL,'apisubscriber_1_3_12','2021-07-20 04:24:04',NULL,'2021-07-20 04:24:04','f3589aa9-97cd-4b7f-ab68-05c854e37a4b','JWT'),(25,'DefaultApplication',13,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_3_13','2021-07-20 04:24:08',NULL,'2021-07-20 04:24:08','f89b1c90-592f-4121-9da2-ee5bf56f86fe','JWT'),(26,'application_1_3_13',13,'Unlimited',NULL,'sample app description 1_3_13','APPROVED',NULL,'apisubscriber_1_3_13','2021-07-20 04:24:07',NULL,'2021-07-20 04:24:08','f4eac5cc-c5e0-4dde-aa29-73f6d030577d','JWT'),(27,'DefaultApplication',14,'Unlimited',NULL,'This is the default application','APPROVED','','apisubscriber_1_3_14','2021-07-20 04:24:10',NULL,'2021-07-20 04:24:10','38a86439-89b8-429b-a60e-82abb2fc5607','JWT'),(28,'application_1_3_14',14,'Unlimited',NULL,'sample app description 1_3_14','APPROVED',NULL,'apisubscriber_1_3_14','2021-07-20 04:24:10',NULL,'2021-07-20 04:24:10','b9119358-fb50-4b5b-983a-73ea8b817e33','JWT');
/*!40000 ALTER TABLE `AM_APPLICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_APPLICATION_ATTRIBUTES`
--

DROP TABLE IF EXISTS `AM_APPLICATION_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_APPLICATION_ATTRIBUTES` (
  `APPLICATION_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(1024) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`APPLICATION_ID`,`NAME`),
  CONSTRAINT `AM_APPLICATION_ATTRIBUTES_ibfk_1` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `AM_APPLICATION` (`APPLICATION_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_APPLICATION_ATTRIBUTES`
--

LOCK TABLES `AM_APPLICATION_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `AM_APPLICATION_ATTRIBUTES` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_APPLICATION_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_APPLICATION_GROUP_MAPPING`
--

DROP TABLE IF EXISTS `AM_APPLICATION_GROUP_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_APPLICATION_GROUP_MAPPING` (
  `APPLICATION_ID` int(11) NOT NULL,
  `GROUP_ID` varchar(512) NOT NULL,
  `TENANT` varchar(255) NOT NULL,
  PRIMARY KEY (`APPLICATION_ID`,`GROUP_ID`,`TENANT`),
  CONSTRAINT `AM_APPLICATION_GROUP_MAPPING_ibfk_1` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `AM_APPLICATION` (`APPLICATION_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_APPLICATION_GROUP_MAPPING`
--

LOCK TABLES `AM_APPLICATION_GROUP_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_APPLICATION_GROUP_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_APPLICATION_GROUP_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_APPLICATION_KEY_MAPPING`
--

DROP TABLE IF EXISTS `AM_APPLICATION_KEY_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_APPLICATION_KEY_MAPPING` (
  `UUID` varchar(100) DEFAULT NULL,
  `APPLICATION_ID` int(11) NOT NULL,
  `CONSUMER_KEY` varchar(255) DEFAULT NULL,
  `KEY_TYPE` varchar(512) NOT NULL,
  `STATE` varchar(30) NOT NULL,
  `CREATE_MODE` varchar(30) DEFAULT 'CREATED',
  `KEY_MANAGER` varchar(100) NOT NULL,
  `APP_INFO` blob,
  PRIMARY KEY (`APPLICATION_ID`,`KEY_TYPE`,`KEY_MANAGER`),
  KEY `IDX_AAKM_CK` (`CONSUMER_KEY`),
  CONSTRAINT `AM_APPLICATION_KEY_MAPPING_ibfk_1` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `AM_APPLICATION` (`APPLICATION_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_APPLICATION_KEY_MAPPING`
--

LOCK TABLES `AM_APPLICATION_KEY_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_APPLICATION_KEY_MAPPING` DISABLE KEYS */;
INSERT INTO `AM_APPLICATION_KEY_MAPPING` VALUES ('b583a9b8-2924-4a1d-9b7c-fbf76929937f',2,'kEX5j09zvfoQRAOHrcX3KUeC8uQa','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"kEX5j09zvfoQRAOHrcX3KUeC8uQa\",\"clientName\":\"apisubscriber_1_1_1_application_1_1_1_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"A8iIiGsIqVhgYHSiqFCDOBLMdqQa\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_1_1_application_1_1_1_PRODUCTION\",\"username\":\"apisubscriber_1_1_1\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}'),('671cf6b6-d9ec-4551-90fa-3ed32fb8a34e',4,'5YPYkwfJpx7ftCTygag2BhHYk94a','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"5YPYkwfJpx7ftCTygag2BhHYk94a\",\"clientName\":\"apisubscriber_1_1_2_application_1_1_2_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"U8r3IUa17DPsQM93J2UNXzjnBjAa\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_1_2_application_1_1_2_PRODUCTION\",\"username\":\"apisubscriber_1_1_2\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}'),('a1294739-6128-4ab4-a9ee-2d6b5cda803c',6,'aJIdU5WyC6dV_lhJ9yhGBfblzHga','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"aJIdU5WyC6dV_lhJ9yhGBfblzHga\",\"clientName\":\"apisubscriber_1_1_3_application_1_1_3_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"yYOwFvOhLwsr2bMyJgaotF20EFwa\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_1_3_application_1_1_3_PRODUCTION\",\"username\":\"apisubscriber_1_1_3\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}'),('6f8047c1-a7da-4150-8d56-b950cf356449',8,'HYtVwP6AZoQYLwDfrV81oXNlVWca','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"HYtVwP6AZoQYLwDfrV81oXNlVWca\",\"clientName\":\"apisubscriber_1_1_4_application_1_1_4_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"cfhLVaMo8dBPfVuX76CkqeF8QPsa\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_1_4_application_1_1_4_PRODUCTION\",\"username\":\"apisubscriber_1_1_4\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}'),('5bd84f14-bd67-4ee3-8b58-d365426203a3',10,'n9LyW8Lpa5PDLbj2eKxcFytphnEa','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"n9LyW8Lpa5PDLbj2eKxcFytphnEa\",\"clientName\":\"apisubscriber_1_1_5_application_1_1_5_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"Me7kEUf3R5zmUo71JqmjJsGmYQ4a\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_1_5_application_1_1_5_PRODUCTION\",\"username\":\"apisubscriber_1_1_5\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}'),('00b2655b-8471-4273-85b7-a3e227cdd1d2',12,'5GdPz2NhybYtDGMblHCUf8xnC7Ia','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"5GdPz2NhybYtDGMblHCUf8xnC7Ia\",\"clientName\":\"apisubscriber_1_2_6_application_1_2_6_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"_BH6h96Ssivqx7E7GJW8vQf27YMa\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_2_6_application_1_2_6_PRODUCTION\",\"username\":\"apisubscriber_1_2_6\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}'),('a38cc0bb-7c6d-4817-8519-7364dd2d5f83',14,'INu83DbS53iB2akgePCVxEvf9mIa','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"INu83DbS53iB2akgePCVxEvf9mIa\",\"clientName\":\"apisubscriber_1_2_7_application_1_2_7_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"iEj62DYzhkfWos70UxSTfVoVY7ga\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_2_7_application_1_2_7_PRODUCTION\",\"username\":\"apisubscriber_1_2_7\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}'),('4958e0d5-4eee-4abd-9f47-8e84a254d590',16,'quZU7LfVSkYQwljVf1WLf1shBD0a','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"quZU7LfVSkYQwljVf1WLf1shBD0a\",\"clientName\":\"apisubscriber_1_2_8_application_1_2_8_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"OcR0VRD7hZHHGK_XUvkfdTlW1rEa\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_2_8_application_1_2_8_PRODUCTION\",\"username\":\"apisubscriber_1_2_8\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}'),('fd91b850-872a-4a71-9e50-c8e651ce17a0',18,'SZjfZLAzmi0Wxirz8BRufXJ26VYa','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"SZjfZLAzmi0Wxirz8BRufXJ26VYa\",\"clientName\":\"apisubscriber_1_2_9_application_1_2_9_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"jKGRjfEEdpORa1IhTRNhsFqTHFoa\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_2_9_application_1_2_9_PRODUCTION\",\"username\":\"apisubscriber_1_2_9\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}'),('6598fc90-7d98-4768-a893-2edca1a52e95',20,'3W08GGqywwhEoyMGiusVkTDBx30a','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"3W08GGqywwhEoyMGiusVkTDBx30a\",\"clientName\":\"apisubscriber_1_2_10_application_1_2_10_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"O_ecwNgIx5i2ivrdN_m29dsf3T4a\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_2_10_application_1_2_10_PRODUCTION\",\"username\":\"apisubscriber_1_2_10\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}'),('04d54698-59f6-4475-8429-791611685687',22,'Qe6CfCgwP7werISqgkBaw3SGQbYa','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"Qe6CfCgwP7werISqgkBaw3SGQbYa\",\"clientName\":\"apisubscriber_1_3_11_application_1_3_11_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"h7rOGGKyEUlNKYGNTaIvYsO2bcAa\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_3_11_application_1_3_11_PRODUCTION\",\"username\":\"apisubscriber_1_3_11\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}'),('ecd08d1c-498b-4b7e-9ffe-9f57f4cfc83e',24,'U_2ME1uQEY__WgM5aovbcXyAJE4a','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"U_2ME1uQEY__WgM5aovbcXyAJE4a\",\"clientName\":\"apisubscriber_1_3_12_application_1_3_12_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"GaMILzvzXJVzcYAcSerSkZhYdV0a\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_3_12_application_1_3_12_PRODUCTION\",\"username\":\"apisubscriber_1_3_12\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}'),('2d7c3f4a-a69b-433f-b31b-a8ab5d3c0a43',26,'LNx2QzZf9kwuuMKR5aBL5_egUUAa','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"LNx2QzZf9kwuuMKR5aBL5_egUUAa\",\"clientName\":\"apisubscriber_1_3_13_application_1_3_13_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"ILftR4YTBWnJyRdoCkZLx5_NgSsa\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_3_13_application_1_3_13_PRODUCTION\",\"username\":\"apisubscriber_1_3_13\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}'),('cf9a35cd-6ae0-44b4-bf04-6633de68cac4',28,'HRQgUrNng7tLGcxG1hlp158gWHUa','PRODUCTION','COMPLETED','CREATED','Resident Key Manager',_binary '{\"clientId\":\"HRQgUrNng7tLGcxG1hlp158gWHUa\",\"clientName\":\"apisubscriber_1_3_14_application_1_3_14_PRODUCTION\",\"callBackURL\":\"http://sample.com/callback/url\",\"clientSecret\":\"53kkIbMk_KJaYcRfvnAfXJzvYGYa\",\"parameters\":{\"tokenScope\":[\"default\"],\"validityPeriod\":\"3600\",\"callback_url\":\"http://sample.com/callback/url\",\"grant_types\":\"password client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"redirect_uris\":\"http://sample.com/callback/url\",\"client_name\":\"apisubscriber_1_3_14_application_1_3_14_PRODUCTION\",\"username\":\"apisubscriber_1_3_14\"},\"isSaasApplication\":false,\"appAttributes\":{},\"tokenType\":\"JWT\"}');
/*!40000 ALTER TABLE `AM_APPLICATION_KEY_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_APPLICATION_REGISTRATION`
--

DROP TABLE IF EXISTS `AM_APPLICATION_REGISTRATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_APPLICATION_REGISTRATION` (
  `REG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUBSCRIBER_ID` int(11) DEFAULT NULL,
  `WF_REF` varchar(255) NOT NULL,
  `APP_ID` int(11) DEFAULT NULL,
  `TOKEN_TYPE` varchar(30) DEFAULT NULL,
  `TOKEN_SCOPE` varchar(1500) DEFAULT 'default',
  `INPUTS` varchar(1000) DEFAULT NULL,
  `ALLOWED_DOMAINS` varchar(256) DEFAULT NULL,
  `VALIDITY_PERIOD` bigint(20) DEFAULT NULL,
  `KEY_MANAGER` varchar(255) NOT NULL,
  PRIMARY KEY (`REG_ID`),
  UNIQUE KEY `SUBSCRIBER_ID` (`SUBSCRIBER_ID`,`APP_ID`,`TOKEN_TYPE`,`KEY_MANAGER`),
  KEY `APP_ID` (`APP_ID`),
  CONSTRAINT `AM_APPLICATION_REGISTRATION_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `AM_SUBSCRIBER` (`SUBSCRIBER_ID`) ON UPDATE CASCADE,
  CONSTRAINT `AM_APPLICATION_REGISTRATION_ibfk_2` FOREIGN KEY (`APP_ID`) REFERENCES `AM_APPLICATION` (`APPLICATION_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_APPLICATION_REGISTRATION`
--

LOCK TABLES `AM_APPLICATION_REGISTRATION` WRITE;
/*!40000 ALTER TABLE `AM_APPLICATION_REGISTRATION` DISABLE KEYS */;
INSERT INTO `AM_APPLICATION_REGISTRATION` VALUES (1,1,'42e59c78-7681-42b6-98a0-b39e01ab7f50',2,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_1_1\"}','ALL',0,'Resident Key Manager'),(2,2,'337b6d82-1900-4183-8dcd-909242c192db',4,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_1_2\"}','ALL',0,'Resident Key Manager'),(3,3,'b600cec5-fbd6-4059-a926-63e1870f18d1',6,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_1_3\"}','ALL',0,'Resident Key Manager'),(4,4,'d4b88181-77b9-4b7d-acc1-fc6ec87b6039',8,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_1_4\"}','ALL',0,'Resident Key Manager'),(5,5,'ec356cb9-b46e-4c18-bcc4-c861507a57b5',10,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_1_5\"}','ALL',0,'Resident Key Manager'),(6,6,'6c08b6e7-4de5-47cb-b204-76f38eac5fe4',12,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_2_6\"}','ALL',0,'Resident Key Manager'),(7,7,'0d688aba-36a3-4547-ae5d-f09732697561',14,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_2_7\"}','ALL',0,'Resident Key Manager'),(8,8,'fcadf77f-44db-48b6-b985-8d0e34371e7b',16,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_2_8\"}','ALL',0,'Resident Key Manager'),(9,9,'f5898621-eb73-409e-9458-a2a1b33b8c0e',18,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_2_9\"}','ALL',0,'Resident Key Manager'),(10,10,'9c2faa90-1b99-4fe5-9e97-ebbe08ff4ebc',20,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_2_10\"}','ALL',0,'Resident Key Manager'),(11,11,'fd1f7813-72a3-44a0-810d-2998b1291348',22,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_3_11\"}','ALL',0,'Resident Key Manager'),(12,12,'058d19cd-597f-4e0a-8e32-1fc9c17a4f3b',24,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_3_12\"}','ALL',0,'Resident Key Manager'),(13,13,'3c84555c-2167-4031-bc04-e8f49ef3d16d',26,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_3_13\"}','ALL',0,'Resident Key Manager'),(14,14,'c070c42a-e2f5-427f-8e97-74f0d7322a6f',28,'PRODUCTION','default','{\"tokenScope\":\"default\",\"validityPeriod\":\"3600\",\"callback_url\":\"http:\\/\\/sample.com\\/callback\\/url\",\"grant_types\":\"password,client_credentials\",\"key_type\":\"PRODUCTION\",\"additionalProperties\":\"{}\",\"username\":\"apisubscriber_1_3_14\"}','ALL',0,'Resident Key Manager');
/*!40000 ALTER TABLE `AM_APPLICATION_REGISTRATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_APP_KEY_DOMAIN_MAPPING`
--

DROP TABLE IF EXISTS `AM_APP_KEY_DOMAIN_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_APP_KEY_DOMAIN_MAPPING` (
  `CONSUMER_KEY` varchar(255) NOT NULL,
  `AUTHZ_DOMAIN` varchar(255) NOT NULL DEFAULT 'ALL',
  PRIMARY KEY (`CONSUMER_KEY`,`AUTHZ_DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_APP_KEY_DOMAIN_MAPPING`
--

LOCK TABLES `AM_APP_KEY_DOMAIN_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_APP_KEY_DOMAIN_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_APP_KEY_DOMAIN_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_BLOCK_CONDITIONS`
--

DROP TABLE IF EXISTS `AM_BLOCK_CONDITIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_BLOCK_CONDITIONS` (
  `CONDITION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(45) DEFAULT NULL,
  `VALUE` varchar(512) DEFAULT NULL,
  `ENABLED` varchar(45) DEFAULT NULL,
  `DOMAIN` varchar(45) DEFAULT NULL,
  `UUID` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`CONDITION_ID`),
  UNIQUE KEY `UUID` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_BLOCK_CONDITIONS`
--

LOCK TABLES `AM_BLOCK_CONDITIONS` WRITE;
/*!40000 ALTER TABLE `AM_BLOCK_CONDITIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_BLOCK_CONDITIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_CERTIFICATE_METADATA`
--

DROP TABLE IF EXISTS `AM_CERTIFICATE_METADATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_CERTIFICATE_METADATA` (
  `TENANT_ID` int(11) NOT NULL,
  `ALIAS` varchar(255) NOT NULL,
  `END_POINT` varchar(255) NOT NULL,
  PRIMARY KEY (`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_CERTIFICATE_METADATA`
--

LOCK TABLES `AM_CERTIFICATE_METADATA` WRITE;
/*!40000 ALTER TABLE `AM_CERTIFICATE_METADATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_CERTIFICATE_METADATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_CONDITION_GROUP`
--

DROP TABLE IF EXISTS `AM_CONDITION_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_CONDITION_GROUP` (
  `CONDITION_GROUP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `POLICY_ID` int(11) NOT NULL,
  `QUOTA_TYPE` varchar(25) DEFAULT NULL,
  `QUOTA` int(11) NOT NULL,
  `QUOTA_UNIT` varchar(10) DEFAULT NULL,
  `UNIT_TIME` int(11) NOT NULL,
  `TIME_UNIT` varchar(25) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`CONDITION_GROUP_ID`),
  KEY `POLICY_ID` (`POLICY_ID`),
  KEY `IDX_ACG_QT` (`QUOTA_TYPE`),
  CONSTRAINT `AM_CONDITION_GROUP_ibfk_1` FOREIGN KEY (`POLICY_ID`) REFERENCES `AM_API_THROTTLE_POLICY` (`POLICY_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_CONDITION_GROUP`
--

LOCK TABLES `AM_CONDITION_GROUP` WRITE;
/*!40000 ALTER TABLE `AM_CONDITION_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_CONDITION_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_EXTERNAL_STORES`
--

DROP TABLE IF EXISTS `AM_EXTERNAL_STORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_EXTERNAL_STORES` (
  `APISTORE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `API_ID` int(11) DEFAULT NULL,
  `STORE_ID` varchar(255) NOT NULL,
  `STORE_DISPLAY_NAME` varchar(255) NOT NULL,
  `STORE_ENDPOINT` varchar(255) NOT NULL,
  `STORE_TYPE` varchar(255) NOT NULL,
  `LAST_UPDATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`APISTORE_ID`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `AM_EXTERNAL_STORES_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_EXTERNAL_STORES`
--

LOCK TABLES `AM_EXTERNAL_STORES` WRITE;
/*!40000 ALTER TABLE `AM_EXTERNAL_STORES` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_EXTERNAL_STORES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_GRAPHQL_COMPLEXITY`
--

DROP TABLE IF EXISTS `AM_GRAPHQL_COMPLEXITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_GRAPHQL_COMPLEXITY` (
  `UUID` varchar(256) NOT NULL,
  `API_ID` int(11) NOT NULL,
  `TYPE` varchar(256) DEFAULT NULL,
  `FIELD` varchar(256) DEFAULT NULL,
  `COMPLEXITY_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  UNIQUE KEY `API_ID` (`API_ID`,`TYPE`,`FIELD`),
  CONSTRAINT `AM_GRAPHQL_COMPLEXITY_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_GRAPHQL_COMPLEXITY`
--

LOCK TABLES `AM_GRAPHQL_COMPLEXITY` WRITE;
/*!40000 ALTER TABLE `AM_GRAPHQL_COMPLEXITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_GRAPHQL_COMPLEXITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_GW_API_ARTIFACTS`
--

DROP TABLE IF EXISTS `AM_GW_API_ARTIFACTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_GW_API_ARTIFACTS` (
  `API_ID` varchar(255) NOT NULL,
  `ARTIFACT` longblob,
  `GATEWAY_INSTRUCTION` varchar(20) DEFAULT NULL,
  `GATEWAY_LABEL` varchar(255) NOT NULL,
  `TIME_STAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`GATEWAY_LABEL`,`API_ID`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `AM_GW_API_ARTIFACTS_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_GW_PUBLISHED_API_DETAILS` (`API_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_GW_API_ARTIFACTS`
--

LOCK TABLES `AM_GW_API_ARTIFACTS` WRITE;
/*!40000 ALTER TABLE `AM_GW_API_ARTIFACTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_GW_API_ARTIFACTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_GW_PUBLISHED_API_DETAILS`
--

DROP TABLE IF EXISTS `AM_GW_PUBLISHED_API_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_GW_PUBLISHED_API_DETAILS` (
  `API_ID` varchar(255) NOT NULL,
  `TENANT_DOMAIN` varchar(255) DEFAULT NULL,
  `API_PROVIDER` varchar(255) DEFAULT NULL,
  `API_NAME` varchar(255) DEFAULT NULL,
  `API_VERSION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`API_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_GW_PUBLISHED_API_DETAILS`
--

LOCK TABLES `AM_GW_PUBLISHED_API_DETAILS` WRITE;
/*!40000 ALTER TABLE `AM_GW_PUBLISHED_API_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_GW_PUBLISHED_API_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_HEADER_FIELD_CONDITION`
--

DROP TABLE IF EXISTS `AM_HEADER_FIELD_CONDITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_HEADER_FIELD_CONDITION` (
  `HEADER_FIELD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONDITION_GROUP_ID` int(11) NOT NULL,
  `HEADER_FIELD_NAME` varchar(255) DEFAULT NULL,
  `HEADER_FIELD_VALUE` varchar(255) DEFAULT NULL,
  `IS_HEADER_FIELD_MAPPING` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`HEADER_FIELD_ID`),
  KEY `CONDITION_GROUP_ID` (`CONDITION_GROUP_ID`),
  CONSTRAINT `AM_HEADER_FIELD_CONDITION_ibfk_1` FOREIGN KEY (`CONDITION_GROUP_ID`) REFERENCES `AM_CONDITION_GROUP` (`CONDITION_GROUP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_HEADER_FIELD_CONDITION`
--

LOCK TABLES `AM_HEADER_FIELD_CONDITION` WRITE;
/*!40000 ALTER TABLE `AM_HEADER_FIELD_CONDITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_HEADER_FIELD_CONDITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_IP_CONDITION`
--

DROP TABLE IF EXISTS `AM_IP_CONDITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_IP_CONDITION` (
  `AM_IP_CONDITION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `STARTING_IP` varchar(45) DEFAULT NULL,
  `ENDING_IP` varchar(45) DEFAULT NULL,
  `SPECIFIC_IP` varchar(45) DEFAULT NULL,
  `WITHIN_IP_RANGE` tinyint(1) DEFAULT '1',
  `CONDITION_GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AM_IP_CONDITION_ID`),
  KEY `fk_AM_IP_CONDITION_1_idx` (`CONDITION_GROUP_ID`),
  CONSTRAINT `fk_AM_IP_CONDITION_1` FOREIGN KEY (`CONDITION_GROUP_ID`) REFERENCES `AM_CONDITION_GROUP` (`CONDITION_GROUP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_IP_CONDITION`
--

LOCK TABLES `AM_IP_CONDITION` WRITE;
/*!40000 ALTER TABLE `AM_IP_CONDITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_IP_CONDITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_JWT_CLAIM_CONDITION`
--

DROP TABLE IF EXISTS `AM_JWT_CLAIM_CONDITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_JWT_CLAIM_CONDITION` (
  `JWT_CLAIM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONDITION_GROUP_ID` int(11) NOT NULL,
  `CLAIM_URI` varchar(512) DEFAULT NULL,
  `CLAIM_ATTRIB` varchar(1024) DEFAULT NULL,
  `IS_CLAIM_MAPPING` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`JWT_CLAIM_ID`),
  KEY `CONDITION_GROUP_ID` (`CONDITION_GROUP_ID`),
  CONSTRAINT `AM_JWT_CLAIM_CONDITION_ibfk_1` FOREIGN KEY (`CONDITION_GROUP_ID`) REFERENCES `AM_CONDITION_GROUP` (`CONDITION_GROUP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_JWT_CLAIM_CONDITION`
--

LOCK TABLES `AM_JWT_CLAIM_CONDITION` WRITE;
/*!40000 ALTER TABLE `AM_JWT_CLAIM_CONDITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_JWT_CLAIM_CONDITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_KEY_MANAGER`
--

DROP TABLE IF EXISTS `AM_KEY_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_KEY_MANAGER` (
  `UUID` varchar(50) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `DISPLAY_NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  `TYPE` varchar(45) DEFAULT NULL,
  `CONFIGURATION` blob,
  `ENABLED` tinyint(1) DEFAULT '1',
  `TENANT_DOMAIN` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UUID`),
  UNIQUE KEY `NAME` (`NAME`,`TENANT_DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_KEY_MANAGER`
--

LOCK TABLES `AM_KEY_MANAGER` WRITE;
/*!40000 ALTER TABLE `AM_KEY_MANAGER` DISABLE KEYS */;
INSERT INTO `AM_KEY_MANAGER` VALUES ('17414b3f-123f-4513-82a1-f274909ae442','Resident Key Manager',NULL,'This is Resident Key Manager','default',_binary '{\"token_format_string\":\"[{\\\"enable\\\":true,\\\"type\\\":\\\"REFERENCE\\\",\\\"value\\\":\\\"[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}\\\"}]\"}',1,'carbon.super');
/*!40000 ALTER TABLE `AM_KEY_MANAGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_LABELS`
--

DROP TABLE IF EXISTS `AM_LABELS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_LABELS` (
  `LABEL_ID` varchar(50) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `TENANT_DOMAIN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LABEL_ID`),
  UNIQUE KEY `NAME` (`NAME`,`TENANT_DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_LABELS`
--

LOCK TABLES `AM_LABELS` WRITE;
/*!40000 ALTER TABLE `AM_LABELS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_LABELS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_LABEL_URLS`
--

DROP TABLE IF EXISTS `AM_LABEL_URLS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_LABEL_URLS` (
  `LABEL_ID` varchar(50) NOT NULL,
  `ACCESS_URL` varchar(255) NOT NULL,
  PRIMARY KEY (`LABEL_ID`,`ACCESS_URL`),
  CONSTRAINT `AM_LABEL_URLS_ibfk_1` FOREIGN KEY (`LABEL_ID`) REFERENCES `AM_LABELS` (`LABEL_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_LABEL_URLS`
--

LOCK TABLES `AM_LABEL_URLS` WRITE;
/*!40000 ALTER TABLE `AM_LABEL_URLS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_LABEL_URLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_MONETIZATION_USAGE`
--

DROP TABLE IF EXISTS `AM_MONETIZATION_USAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_MONETIZATION_USAGE` (
  `ID` varchar(100) NOT NULL,
  `STATE` varchar(50) NOT NULL,
  `STATUS` varchar(50) NOT NULL,
  `STARTED_TIME` varchar(50) NOT NULL,
  `PUBLISHED_TIME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_MONETIZATION_USAGE`
--

LOCK TABLES `AM_MONETIZATION_USAGE` WRITE;
/*!40000 ALTER TABLE `AM_MONETIZATION_USAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_MONETIZATION_USAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_NOTIFICATION_SUBSCRIBER`
--

DROP TABLE IF EXISTS `AM_NOTIFICATION_SUBSCRIBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_NOTIFICATION_SUBSCRIBER` (
  `UUID` varchar(255) NOT NULL,
  `CATEGORY` varchar(255) DEFAULT NULL,
  `NOTIFICATION_METHOD` varchar(255) DEFAULT NULL,
  `SUBSCRIBER_ADDRESS` varchar(255) NOT NULL,
  PRIMARY KEY (`UUID`,`SUBSCRIBER_ADDRESS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_NOTIFICATION_SUBSCRIBER`
--

LOCK TABLES `AM_NOTIFICATION_SUBSCRIBER` WRITE;
/*!40000 ALTER TABLE `AM_NOTIFICATION_SUBSCRIBER` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_NOTIFICATION_SUBSCRIBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_POLICY_APPLICATION`
--

DROP TABLE IF EXISTS `AM_POLICY_APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_POLICY_APPLICATION` (
  `POLICY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(512) NOT NULL,
  `DISPLAY_NAME` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `QUOTA_TYPE` varchar(25) NOT NULL,
  `QUOTA` int(11) NOT NULL,
  `QUOTA_UNIT` varchar(10) DEFAULT NULL,
  `UNIT_TIME` int(11) NOT NULL,
  `TIME_UNIT` varchar(25) NOT NULL,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  `CUSTOM_ATTRIBUTES` blob,
  `UUID` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `APP_NAME_TENANT` (`NAME`,`TENANT_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `IDX_APA_QT` (`QUOTA_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_POLICY_APPLICATION`
--

LOCK TABLES `AM_POLICY_APPLICATION` WRITE;
/*!40000 ALTER TABLE `AM_POLICY_APPLICATION` DISABLE KEYS */;
INSERT INTO `AM_POLICY_APPLICATION` VALUES (1,'50PerMin','50PerMin',-1234,'Allows 50 request per minute','requestCount',50,NULL,1,'min',1,NULL,'e8c7e6e9-686c-48ce-ac4e-464f88231f22'),(2,'20PerMin','20PerMin',-1234,'Allows 20 request per minute','requestCount',20,NULL,1,'min',1,NULL,'14b2c423-1342-4d45-aed1-50faebeadf2a'),(3,'10PerMin','10PerMin',-1234,'Allows 10 request per minute','requestCount',10,NULL,1,'min',1,NULL,'95d3aacf-4ca1-45ab-a7bb-059aea16001a'),(4,'Unlimited','Unlimited',-1234,'Allows unlimited requests','requestCount',2147483647,NULL,1,'min',1,NULL,'68954195-e671-459a-99eb-8a207db18e67');
/*!40000 ALTER TABLE `AM_POLICY_APPLICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_POLICY_GLOBAL`
--

DROP TABLE IF EXISTS `AM_POLICY_GLOBAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_POLICY_GLOBAL` (
  `POLICY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(512) NOT NULL,
  `KEY_TEMPLATE` varchar(512) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `SIDDHI_QUERY` blob,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  `UUID` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `UUID` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_POLICY_GLOBAL`
--

LOCK TABLES `AM_POLICY_GLOBAL` WRITE;
/*!40000 ALTER TABLE `AM_POLICY_GLOBAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_POLICY_GLOBAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_POLICY_HARD_THROTTLING`
--

DROP TABLE IF EXISTS `AM_POLICY_HARD_THROTTLING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_POLICY_HARD_THROTTLING` (
  `POLICY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(512) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `QUOTA_TYPE` varchar(25) NOT NULL,
  `QUOTA` int(11) NOT NULL,
  `QUOTA_UNIT` varchar(10) DEFAULT NULL,
  `UNIT_TIME` int(11) NOT NULL,
  `TIME_UNIT` varchar(25) NOT NULL,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `POLICY_HARD_NAME_TENANT` (`NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_POLICY_HARD_THROTTLING`
--

LOCK TABLES `AM_POLICY_HARD_THROTTLING` WRITE;
/*!40000 ALTER TABLE `AM_POLICY_HARD_THROTTLING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_POLICY_HARD_THROTTLING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_POLICY_SUBSCRIPTION`
--

DROP TABLE IF EXISTS `AM_POLICY_SUBSCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_POLICY_SUBSCRIPTION` (
  `POLICY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(512) NOT NULL,
  `DISPLAY_NAME` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `QUOTA_TYPE` varchar(25) NOT NULL,
  `QUOTA` int(11) NOT NULL,
  `QUOTA_UNIT` varchar(10) DEFAULT NULL,
  `UNIT_TIME` int(11) NOT NULL,
  `TIME_UNIT` varchar(25) NOT NULL,
  `RATE_LIMIT_COUNT` int(11) DEFAULT NULL,
  `RATE_LIMIT_TIME_UNIT` varchar(25) DEFAULT NULL,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  `CUSTOM_ATTRIBUTES` blob,
  `STOP_ON_QUOTA_REACH` tinyint(1) NOT NULL DEFAULT '0',
  `BILLING_PLAN` varchar(20) NOT NULL,
  `UUID` varchar(256) DEFAULT NULL,
  `MONETIZATION_PLAN` varchar(25) DEFAULT NULL,
  `FIXED_RATE` varchar(15) DEFAULT NULL,
  `BILLING_CYCLE` varchar(15) DEFAULT NULL,
  `PRICE_PER_REQUEST` varchar(15) DEFAULT NULL,
  `CURRENCY` varchar(15) DEFAULT NULL,
  `MAX_COMPLEXITY` int(11) NOT NULL DEFAULT '0',
  `MAX_DEPTH` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `AM_POLICY_SUBSCRIPTION_NAME_TENANT` (`NAME`,`TENANT_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `IDX_APS_QT` (`QUOTA_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_POLICY_SUBSCRIPTION`
--

LOCK TABLES `AM_POLICY_SUBSCRIPTION` WRITE;
/*!40000 ALTER TABLE `AM_POLICY_SUBSCRIPTION` DISABLE KEYS */;
INSERT INTO `AM_POLICY_SUBSCRIPTION` VALUES (1,'Gold','Gold',-1234,'Allows 5000 requests per minute','requestCount',5000,NULL,1,'min',0,NULL,1,NULL,1,'FREE','e8bf9e91-2198-4f72-89fe-a58246e8ac8b',NULL,NULL,NULL,NULL,NULL,0,0),(2,'Silver','Silver',-1234,'Allows 2000 requests per minute','requestCount',2000,NULL,1,'min',0,NULL,1,NULL,1,'FREE','b5606068-6334-4b40-9d8d-04976caffc23',NULL,NULL,NULL,NULL,NULL,0,0),(3,'Bronze','Bronze',-1234,'Allows 1000 requests per minute','requestCount',1000,NULL,1,'min',0,NULL,1,NULL,1,'FREE','0b46c8a5-bd13-492e-ac5f-01ed8591454c',NULL,NULL,NULL,NULL,NULL,0,0),(4,'Unauthenticated','Unauthenticated',-1234,'Allows 500 request(s) per minute','requestCount',500,NULL,1,'min',0,NULL,1,NULL,1,'FREE','97e3c3eb-e0a2-40f6-8e08-e762217e77e6',NULL,NULL,NULL,NULL,NULL,0,0),(5,'Unlimited','Unlimited',-1234,'Allows unlimited requests','requestCount',2147483647,NULL,1,'min',0,NULL,1,NULL,1,'FREE','ffebb1c8-2692-42ef-bb53-0567962d6431',NULL,NULL,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `AM_POLICY_SUBSCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_QUERY_PARAMETER_CONDITION`
--

DROP TABLE IF EXISTS `AM_QUERY_PARAMETER_CONDITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_QUERY_PARAMETER_CONDITION` (
  `QUERY_PARAMETER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONDITION_GROUP_ID` int(11) NOT NULL,
  `PARAMETER_NAME` varchar(255) DEFAULT NULL,
  `PARAMETER_VALUE` varchar(255) DEFAULT NULL,
  `IS_PARAM_MAPPING` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`QUERY_PARAMETER_ID`),
  KEY `CONDITION_GROUP_ID` (`CONDITION_GROUP_ID`),
  CONSTRAINT `AM_QUERY_PARAMETER_CONDITION_ibfk_1` FOREIGN KEY (`CONDITION_GROUP_ID`) REFERENCES `AM_CONDITION_GROUP` (`CONDITION_GROUP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_QUERY_PARAMETER_CONDITION`
--

LOCK TABLES `AM_QUERY_PARAMETER_CONDITION` WRITE;
/*!40000 ALTER TABLE `AM_QUERY_PARAMETER_CONDITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_QUERY_PARAMETER_CONDITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_REVOKED_JWT`
--

DROP TABLE IF EXISTS `AM_REVOKED_JWT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_REVOKED_JWT` (
  `UUID` varchar(255) NOT NULL,
  `SIGNATURE` varchar(2048) NOT NULL,
  `EXPIRY_TIMESTAMP` bigint(20) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  `TOKEN_TYPE` varchar(15) DEFAULT 'DEFAULT',
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_REVOKED_JWT`
--

LOCK TABLES `AM_REVOKED_JWT` WRITE;
/*!40000 ALTER TABLE `AM_REVOKED_JWT` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_REVOKED_JWT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SCOPE`
--

DROP TABLE IF EXISTS `AM_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_SCOPE` (
  `SCOPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DISPLAY_NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1',
  `SCOPE_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SCOPE`
--

LOCK TABLES `AM_SCOPE` WRITE;
/*!40000 ALTER TABLE `AM_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SCOPE_BINDING`
--

DROP TABLE IF EXISTS `AM_SCOPE_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_SCOPE_BINDING` (
  `SCOPE_ID` int(11) NOT NULL,
  `SCOPE_BINDING` varchar(255) NOT NULL,
  `BINDING_TYPE` varchar(255) NOT NULL,
  KEY `SCOPE_ID` (`SCOPE_ID`),
  CONSTRAINT `AM_SCOPE_BINDING_ibfk_1` FOREIGN KEY (`SCOPE_ID`) REFERENCES `AM_SCOPE` (`SCOPE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SCOPE_BINDING`
--

LOCK TABLES `AM_SCOPE_BINDING` WRITE;
/*!40000 ALTER TABLE `AM_SCOPE_BINDING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_SCOPE_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SECURITY_AUDIT_UUID_MAPPING`
--

DROP TABLE IF EXISTS `AM_SECURITY_AUDIT_UUID_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_SECURITY_AUDIT_UUID_MAPPING` (
  `API_ID` int(11) NOT NULL,
  `AUDIT_UUID` varchar(255) NOT NULL,
  PRIMARY KEY (`API_ID`),
  CONSTRAINT `AM_SECURITY_AUDIT_UUID_MAPPING_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SECURITY_AUDIT_UUID_MAPPING`
--

LOCK TABLES `AM_SECURITY_AUDIT_UUID_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_SECURITY_AUDIT_UUID_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_SECURITY_AUDIT_UUID_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SHARED_SCOPE`
--

DROP TABLE IF EXISTS `AM_SHARED_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_SHARED_SCOPE` (
  `NAME` varchar(255) NOT NULL,
  `UUID` varchar(256) NOT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SHARED_SCOPE`
--

LOCK TABLES `AM_SHARED_SCOPE` WRITE;
/*!40000 ALTER TABLE `AM_SHARED_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_SHARED_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SUBSCRIBER`
--

DROP TABLE IF EXISTS `AM_SUBSCRIBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_SUBSCRIBER` (
  `SUBSCRIBER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `EMAIL_ADDRESS` varchar(256) DEFAULT NULL,
  `DATE_SUBSCRIBED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(100) DEFAULT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(100) DEFAULT NULL,
  `UPDATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SUBSCRIBER_ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SUBSCRIBER`
--

LOCK TABLES `AM_SUBSCRIBER` WRITE;
/*!40000 ALTER TABLE `AM_SUBSCRIBER` DISABLE KEYS */;
INSERT INTO `AM_SUBSCRIBER` VALUES (1,'apisubscriber_1_1_1',-1234,'','2021-07-20 04:23:23','apisubscriber_1_1_1','2021-07-20 04:23:23',NULL,'2021-07-20 04:23:23'),(2,'apisubscriber_1_1_2',-1234,'','2021-07-20 04:23:30','apisubscriber_1_1_2','2021-07-20 04:23:30',NULL,'2021-07-20 04:23:30'),(3,'apisubscriber_1_1_3',-1234,'','2021-07-20 04:23:33','apisubscriber_1_1_3','2021-07-20 04:23:33',NULL,'2021-07-20 04:23:33'),(4,'apisubscriber_1_1_4',-1234,'','2021-07-20 04:23:36','apisubscriber_1_1_4','2021-07-20 04:23:36',NULL,'2021-07-20 04:23:36'),(5,'apisubscriber_1_1_5',-1234,'','2021-07-20 04:23:39','apisubscriber_1_1_5','2021-07-20 04:23:39',NULL,'2021-07-20 04:23:39'),(6,'apisubscriber_1_2_6',-1234,'','2021-07-20 04:23:45','apisubscriber_1_2_6','2021-07-20 04:23:45',NULL,'2021-07-20 04:23:45'),(7,'apisubscriber_1_2_7',-1234,'','2021-07-20 04:23:48','apisubscriber_1_2_7','2021-07-20 04:23:48',NULL,'2021-07-20 04:23:48'),(8,'apisubscriber_1_2_8',-1234,'','2021-07-20 04:23:51','apisubscriber_1_2_8','2021-07-20 04:23:51',NULL,'2021-07-20 04:23:51'),(9,'apisubscriber_1_2_9',-1234,'','2021-07-20 04:23:53','apisubscriber_1_2_9','2021-07-20 04:23:53',NULL,'2021-07-20 04:23:53'),(10,'apisubscriber_1_2_10',-1234,'','2021-07-20 04:23:56','apisubscriber_1_2_10','2021-07-20 04:23:56',NULL,'2021-07-20 04:23:56'),(11,'apisubscriber_1_3_11',-1234,'','2021-07-20 04:24:01','apisubscriber_1_3_11','2021-07-20 04:24:01',NULL,'2021-07-20 04:24:01'),(12,'apisubscriber_1_3_12',-1234,'','2021-07-20 04:24:04','apisubscriber_1_3_12','2021-07-20 04:24:04',NULL,'2021-07-20 04:24:04'),(13,'apisubscriber_1_3_13',-1234,'','2021-07-20 04:24:07','apisubscriber_1_3_13','2021-07-20 04:24:07',NULL,'2021-07-20 04:24:07'),(14,'apisubscriber_1_3_14',-1234,'','2021-07-20 04:24:10','apisubscriber_1_3_14','2021-07-20 04:24:10',NULL,'2021-07-20 04:24:10');
/*!40000 ALTER TABLE `AM_SUBSCRIBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SUBSCRIPTION`
--

DROP TABLE IF EXISTS `AM_SUBSCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_SUBSCRIPTION` (
  `SUBSCRIPTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIER_ID` varchar(50) DEFAULT NULL,
  `TIER_ID_PENDING` varchar(50) DEFAULT NULL,
  `API_ID` int(11) DEFAULT NULL,
  `LAST_ACCESSED` timestamp NULL DEFAULT NULL,
  `APPLICATION_ID` int(11) DEFAULT NULL,
  `SUB_STATUS` varchar(50) DEFAULT NULL,
  `SUBS_CREATE_STATE` varchar(50) DEFAULT 'SUBSCRIBE',
  `CREATED_BY` varchar(100) DEFAULT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(100) DEFAULT NULL,
  `UPDATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UUID` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`SUBSCRIPTION_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `IDX_SUB_APP_ID` (`APPLICATION_ID`,`SUBSCRIPTION_ID`),
  KEY `IDX_AS_AITIAI` (`API_ID`,`TIER_ID`,`APPLICATION_ID`),
  CONSTRAINT `AM_SUBSCRIPTION_ibfk_1` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `AM_APPLICATION` (`APPLICATION_ID`) ON UPDATE CASCADE,
  CONSTRAINT `AM_SUBSCRIPTION_ibfk_2` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SUBSCRIPTION`
--

LOCK TABLES `AM_SUBSCRIPTION` WRITE;
/*!40000 ALTER TABLE `AM_SUBSCRIPTION` DISABLE KEYS */;
INSERT INTO `AM_SUBSCRIPTION` VALUES (1,'Unlimited','Unlimited',1,NULL,2,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_1_1','2021-07-20 04:23:24',NULL,'2021-07-20 04:23:24','a07dccbf-26e5-47c5-b083-10aefe4da061'),(2,'Unlimited','Unlimited',1,NULL,4,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_1_2','2021-07-20 04:23:31',NULL,'2021-07-20 04:23:31','76efb1ba-d823-4475-83e2-58bfab6a8de9'),(3,'Unlimited','Unlimited',1,NULL,6,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_1_3','2021-07-20 04:23:34',NULL,'2021-07-20 04:23:34','2d06e985-fda4-4213-815f-fa5910586f92'),(4,'Unlimited','Unlimited',1,NULL,8,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_1_4','2021-07-20 04:23:36',NULL,'2021-07-20 04:23:36','abdc903a-7f63-4226-8c92-125218c8df14'),(5,'Unlimited','Unlimited',1,NULL,10,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_1_5','2021-07-20 04:23:39',NULL,'2021-07-20 04:23:39','56bff0dc-b98b-4884-9a7c-746b4c65f87c'),(6,'Unlimited','Unlimited',2,NULL,12,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_2_6','2021-07-20 04:23:45',NULL,'2021-07-20 04:23:45','fb155704-9f96-47c3-ab3a-31e2f21e2301'),(7,'Unlimited','Unlimited',2,NULL,14,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_2_7','2021-07-20 04:23:48',NULL,'2021-07-20 04:23:48','c451b1b8-bcfc-4ff2-a647-4a91f214351b'),(8,'Unlimited','Unlimited',2,NULL,16,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_2_8','2021-07-20 04:23:51',NULL,'2021-07-20 04:23:51','455231bf-eafe-4a37-b59e-c692be26bb0b'),(9,'Unlimited','Unlimited',2,NULL,18,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_2_9','2021-07-20 04:23:54',NULL,'2021-07-20 04:23:54','523c5f71-34dd-4328-af3e-50a64485d228'),(10,'Unlimited','Unlimited',2,NULL,20,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_2_10','2021-07-20 04:23:56',NULL,'2021-07-20 04:23:56','e9a5dc8e-dac5-47eb-b675-7e60b25b4d84'),(11,'Unlimited','Unlimited',3,NULL,22,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_3_11','2021-07-20 04:24:01',NULL,'2021-07-20 04:24:01','cecc3240-d46f-4c0d-9dd2-828f0a6f208c'),(12,'Unlimited','Unlimited',3,NULL,24,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_3_12','2021-07-20 04:24:04',NULL,'2021-07-20 04:24:04','0ac25837-4f0f-4d8e-92b7-f2c4eceaf1db'),(13,'Unlimited','Unlimited',3,NULL,26,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_3_13','2021-07-20 04:24:08',NULL,'2021-07-20 04:24:08','5665770d-e4a3-427f-80af-eb83a95d5c12'),(14,'Unlimited','Unlimited',3,NULL,28,'UNBLOCKED','SUBSCRIBE','apisubscriber_1_3_14','2021-07-20 04:24:10',NULL,'2021-07-20 04:24:10','25848f1a-6490-4556-bb20-252b955c6958');
/*!40000 ALTER TABLE `AM_SUBSCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SUBSCRIPTION_KEY_MAPPING`
--

DROP TABLE IF EXISTS `AM_SUBSCRIPTION_KEY_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_SUBSCRIPTION_KEY_MAPPING` (
  `SUBSCRIPTION_ID` int(11) NOT NULL,
  `ACCESS_TOKEN` varchar(512) NOT NULL,
  `KEY_TYPE` varchar(512) NOT NULL,
  PRIMARY KEY (`SUBSCRIPTION_ID`,`ACCESS_TOKEN`),
  CONSTRAINT `AM_SUBSCRIPTION_KEY_MAPPING_ibfk_1` FOREIGN KEY (`SUBSCRIPTION_ID`) REFERENCES `AM_SUBSCRIPTION` (`SUBSCRIPTION_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SUBSCRIPTION_KEY_MAPPING`
--

LOCK TABLES `AM_SUBSCRIPTION_KEY_MAPPING` WRITE;
/*!40000 ALTER TABLE `AM_SUBSCRIPTION_KEY_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_SUBSCRIPTION_KEY_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_SYSTEM_APPS`
--

DROP TABLE IF EXISTS `AM_SYSTEM_APPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_SYSTEM_APPS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `CONSUMER_KEY` varchar(512) NOT NULL,
  `CONSUMER_SECRET` varchar(512) NOT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TENANT_DOMAIN` varchar(255) DEFAULT 'carbon.super',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CONSUMER_KEY` (`CONSUMER_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_SYSTEM_APPS`
--

LOCK TABLES `AM_SYSTEM_APPS` WRITE;
/*!40000 ALTER TABLE `AM_SYSTEM_APPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_SYSTEM_APPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_TENANT_THEMES`
--

DROP TABLE IF EXISTS `AM_TENANT_THEMES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_TENANT_THEMES` (
  `TENANT_ID` int(11) NOT NULL,
  `THEME` mediumblob NOT NULL,
  PRIMARY KEY (`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_TENANT_THEMES`
--

LOCK TABLES `AM_TENANT_THEMES` WRITE;
/*!40000 ALTER TABLE `AM_TENANT_THEMES` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_TENANT_THEMES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_THROTTLE_TIER_PERMISSIONS`
--

DROP TABLE IF EXISTS `AM_THROTTLE_TIER_PERMISSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_THROTTLE_TIER_PERMISSIONS` (
  `THROTTLE_TIER_PERMISSIONS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIER` varchar(50) DEFAULT NULL,
  `PERMISSIONS_TYPE` varchar(50) DEFAULT NULL,
  `ROLES` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`THROTTLE_TIER_PERMISSIONS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_THROTTLE_TIER_PERMISSIONS`
--

LOCK TABLES `AM_THROTTLE_TIER_PERMISSIONS` WRITE;
/*!40000 ALTER TABLE `AM_THROTTLE_TIER_PERMISSIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_THROTTLE_TIER_PERMISSIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_TIER_PERMISSIONS`
--

DROP TABLE IF EXISTS `AM_TIER_PERMISSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_TIER_PERMISSIONS` (
  `TIER_PERMISSIONS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIER` varchar(50) NOT NULL,
  `PERMISSIONS_TYPE` varchar(50) NOT NULL,
  `ROLES` varchar(512) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`TIER_PERMISSIONS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_TIER_PERMISSIONS`
--

LOCK TABLES `AM_TIER_PERMISSIONS` WRITE;
/*!40000 ALTER TABLE `AM_TIER_PERMISSIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_TIER_PERMISSIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_USAGE_UPLOADED_FILES`
--

DROP TABLE IF EXISTS `AM_USAGE_UPLOADED_FILES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_USAGE_UPLOADED_FILES` (
  `TENANT_DOMAIN` varchar(255) NOT NULL,
  `FILE_NAME` varchar(255) NOT NULL,
  `FILE_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FILE_PROCESSED` tinyint(1) DEFAULT '0',
  `FILE_CONTENT` mediumblob,
  PRIMARY KEY (`TENANT_DOMAIN`,`FILE_NAME`,`FILE_TIMESTAMP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_USAGE_UPLOADED_FILES`
--

LOCK TABLES `AM_USAGE_UPLOADED_FILES` WRITE;
/*!40000 ALTER TABLE `AM_USAGE_UPLOADED_FILES` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_USAGE_UPLOADED_FILES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_USER`
--

DROP TABLE IF EXISTS `AM_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_USER` (
  `USER_ID` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_USER`
--

LOCK TABLES `AM_USER` WRITE;
/*!40000 ALTER TABLE `AM_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AM_WORKFLOWS`
--

DROP TABLE IF EXISTS `AM_WORKFLOWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_WORKFLOWS` (
  `WF_ID` int(11) NOT NULL AUTO_INCREMENT,
  `WF_REFERENCE` varchar(255) NOT NULL,
  `WF_TYPE` varchar(255) NOT NULL,
  `WF_STATUS` varchar(255) NOT NULL,
  `WF_CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `WF_UPDATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `WF_STATUS_DESC` varchar(1000) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `TENANT_DOMAIN` varchar(255) DEFAULT NULL,
  `WF_EXTERNAL_REFERENCE` varchar(255) NOT NULL,
  `WF_METADATA` blob,
  `WF_PROPERTIES` blob,
  PRIMARY KEY (`WF_ID`),
  UNIQUE KEY `WF_EXTERNAL_REFERENCE` (`WF_EXTERNAL_REFERENCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AM_WORKFLOWS`
--

LOCK TABLES `AM_WORKFLOWS` WRITE;
/*!40000 ALTER TABLE `AM_WORKFLOWS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AM_WORKFLOWS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_CONSENT_RECEIPT_PROPERTY`
--

DROP TABLE IF EXISTS `CM_CONSENT_RECEIPT_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CM_CONSENT_RECEIPT_PROPERTY` (
  `CONSENT_RECEIPT_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(1023) NOT NULL,
  UNIQUE KEY `CONSENT_RECEIPT_ID` (`CONSENT_RECEIPT_ID`,`NAME`),
  CONSTRAINT `CM_CONSENT_RECEIPT_PRT_fk0` FOREIGN KEY (`CONSENT_RECEIPT_ID`) REFERENCES `CM_RECEIPT` (`CONSENT_RECEIPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_CONSENT_RECEIPT_PROPERTY`
--

LOCK TABLES `CM_CONSENT_RECEIPT_PROPERTY` WRITE;
/*!40000 ALTER TABLE `CM_CONSENT_RECEIPT_PROPERTY` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_CONSENT_RECEIPT_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_PII_CATEGORY`
--

DROP TABLE IF EXISTS `CM_PII_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CM_PII_CATEGORY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(1023) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `IS_SENSITIVE` int(11) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1234',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_PII_CATEGORY`
--

LOCK TABLES `CM_PII_CATEGORY` WRITE;
/*!40000 ALTER TABLE `CM_PII_CATEGORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_PII_CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_PURPOSE`
--

DROP TABLE IF EXISTS `CM_PURPOSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CM_PURPOSE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(1023) DEFAULT NULL,
  `PURPOSE_GROUP` varchar(255) NOT NULL,
  `GROUP_TYPE` varchar(255) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1234',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`,`TENANT_ID`,`PURPOSE_GROUP`,`GROUP_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_PURPOSE`
--

LOCK TABLES `CM_PURPOSE` WRITE;
/*!40000 ALTER TABLE `CM_PURPOSE` DISABLE KEYS */;
INSERT INTO `CM_PURPOSE` VALUES (1,'DEFAULT','For core functionalities of the product','DEFAULT','SP',-1234);
/*!40000 ALTER TABLE `CM_PURPOSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_PURPOSE_CATEGORY`
--

DROP TABLE IF EXISTS `CM_PURPOSE_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CM_PURPOSE_CATEGORY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(1023) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1234',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`,`TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_PURPOSE_CATEGORY`
--

LOCK TABLES `CM_PURPOSE_CATEGORY` WRITE;
/*!40000 ALTER TABLE `CM_PURPOSE_CATEGORY` DISABLE KEYS */;
INSERT INTO `CM_PURPOSE_CATEGORY` VALUES (1,'DEFAULT','For core functionalities of the product',-1234);
/*!40000 ALTER TABLE `CM_PURPOSE_CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_PURPOSE_PII_CAT_ASSOC`
--

DROP TABLE IF EXISTS `CM_PURPOSE_PII_CAT_ASSOC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CM_PURPOSE_PII_CAT_ASSOC` (
  `PURPOSE_ID` int(11) NOT NULL,
  `CM_PII_CATEGORY_ID` int(11) NOT NULL,
  `IS_MANDATORY` int(11) NOT NULL,
  UNIQUE KEY `PURPOSE_ID` (`PURPOSE_ID`,`CM_PII_CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_PURPOSE_PII_CAT_ASSOC`
--

LOCK TABLES `CM_PURPOSE_PII_CAT_ASSOC` WRITE;
/*!40000 ALTER TABLE `CM_PURPOSE_PII_CAT_ASSOC` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_PURPOSE_PII_CAT_ASSOC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_RECEIPT`
--

DROP TABLE IF EXISTS `CM_RECEIPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CM_RECEIPT` (
  `CONSENT_RECEIPT_ID` varchar(255) NOT NULL,
  `VERSION` varchar(255) NOT NULL,
  `JURISDICTION` varchar(255) NOT NULL,
  `CONSENT_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `COLLECTION_METHOD` varchar(255) NOT NULL,
  `LANGUAGE` varchar(255) NOT NULL,
  `PII_PRINCIPAL_ID` varchar(255) NOT NULL,
  `PRINCIPAL_TENANT_ID` int(11) DEFAULT '-1234',
  `POLICY_URL` varchar(255) NOT NULL,
  `STATE` varchar(255) NOT NULL,
  `PII_CONTROLLER` varchar(2048) NOT NULL,
  PRIMARY KEY (`CONSENT_RECEIPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_RECEIPT`
--

LOCK TABLES `CM_RECEIPT` WRITE;
/*!40000 ALTER TABLE `CM_RECEIPT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_RECEIPT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_RECEIPT_SP_ASSOC`
--

DROP TABLE IF EXISTS `CM_RECEIPT_SP_ASSOC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CM_RECEIPT_SP_ASSOC` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONSENT_RECEIPT_ID` varchar(255) NOT NULL,
  `SP_NAME` varchar(255) NOT NULL,
  `SP_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `SP_DESCRIPTION` varchar(255) DEFAULT NULL,
  `SP_TENANT_ID` int(11) DEFAULT '-1234',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CONSENT_RECEIPT_ID` (`CONSENT_RECEIPT_ID`,`SP_NAME`,`SP_TENANT_ID`),
  CONSTRAINT `CM_RECEIPT_SP_ASSOC_fk0` FOREIGN KEY (`CONSENT_RECEIPT_ID`) REFERENCES `CM_RECEIPT` (`CONSENT_RECEIPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_RECEIPT_SP_ASSOC`
--

LOCK TABLES `CM_RECEIPT_SP_ASSOC` WRITE;
/*!40000 ALTER TABLE `CM_RECEIPT_SP_ASSOC` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_RECEIPT_SP_ASSOC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_SP_PURPOSE_ASSOC`
--

DROP TABLE IF EXISTS `CM_SP_PURPOSE_ASSOC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CM_SP_PURPOSE_ASSOC` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RECEIPT_SP_ASSOC` int(11) NOT NULL,
  `PURPOSE_ID` int(11) NOT NULL,
  `CONSENT_TYPE` varchar(255) NOT NULL,
  `IS_PRIMARY_PURPOSE` int(11) NOT NULL,
  `TERMINATION` varchar(255) NOT NULL,
  `THIRD_PARTY_DISCLOSURE` int(11) NOT NULL,
  `THIRD_PARTY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RECEIPT_SP_ASSOC` (`RECEIPT_SP_ASSOC`,`PURPOSE_ID`),
  KEY `CM_SP_PURPOSE_ASSOC_fk1` (`PURPOSE_ID`),
  CONSTRAINT `CM_SP_PURPOSE_ASSOC_fk0` FOREIGN KEY (`RECEIPT_SP_ASSOC`) REFERENCES `CM_RECEIPT_SP_ASSOC` (`ID`),
  CONSTRAINT `CM_SP_PURPOSE_ASSOC_fk1` FOREIGN KEY (`PURPOSE_ID`) REFERENCES `CM_PURPOSE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_SP_PURPOSE_ASSOC`
--

LOCK TABLES `CM_SP_PURPOSE_ASSOC` WRITE;
/*!40000 ALTER TABLE `CM_SP_PURPOSE_ASSOC` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_SP_PURPOSE_ASSOC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_SP_PURPOSE_PII_CAT_ASSOC`
--

DROP TABLE IF EXISTS `CM_SP_PURPOSE_PII_CAT_ASSOC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CM_SP_PURPOSE_PII_CAT_ASSOC` (
  `SP_PURPOSE_ASSOC_ID` int(11) NOT NULL,
  `PII_CATEGORY_ID` int(11) NOT NULL,
  `VALIDITY` varchar(1023) DEFAULT NULL,
  UNIQUE KEY `SP_PURPOSE_ASSOC_ID` (`SP_PURPOSE_ASSOC_ID`,`PII_CATEGORY_ID`),
  KEY `CM_SP_P_PII_CAT_ASSOC_fk1` (`PII_CATEGORY_ID`),
  CONSTRAINT `CM_SP_P_PII_CAT_ASSOC_fk0` FOREIGN KEY (`SP_PURPOSE_ASSOC_ID`) REFERENCES `CM_SP_PURPOSE_ASSOC` (`ID`),
  CONSTRAINT `CM_SP_P_PII_CAT_ASSOC_fk1` FOREIGN KEY (`PII_CATEGORY_ID`) REFERENCES `CM_PII_CATEGORY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_SP_PURPOSE_PII_CAT_ASSOC`
--

LOCK TABLES `CM_SP_PURPOSE_PII_CAT_ASSOC` WRITE;
/*!40000 ALTER TABLE `CM_SP_PURPOSE_PII_CAT_ASSOC` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_SP_PURPOSE_PII_CAT_ASSOC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CM_SP_PURPOSE_PURPOSE_CAT_ASSC`
--

DROP TABLE IF EXISTS `CM_SP_PURPOSE_PURPOSE_CAT_ASSC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CM_SP_PURPOSE_PURPOSE_CAT_ASSC` (
  `SP_PURPOSE_ASSOC_ID` int(11) NOT NULL,
  `PURPOSE_CATEGORY_ID` int(11) NOT NULL,
  UNIQUE KEY `SP_PURPOSE_ASSOC_ID` (`SP_PURPOSE_ASSOC_ID`,`PURPOSE_CATEGORY_ID`),
  KEY `CM_SP_P_P_CAT_ASSOC_fk1` (`PURPOSE_CATEGORY_ID`),
  CONSTRAINT `CM_SP_P_P_CAT_ASSOC_fk0` FOREIGN KEY (`SP_PURPOSE_ASSOC_ID`) REFERENCES `CM_SP_PURPOSE_ASSOC` (`ID`),
  CONSTRAINT `CM_SP_P_P_CAT_ASSOC_fk1` FOREIGN KEY (`PURPOSE_CATEGORY_ID`) REFERENCES `CM_PURPOSE_CATEGORY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CM_SP_PURPOSE_PURPOSE_CAT_ASSC`
--

LOCK TABLES `CM_SP_PURPOSE_PURPOSE_CAT_ASSC` WRITE;
/*!40000 ALTER TABLE `CM_SP_PURPOSE_PURPOSE_CAT_ASSC` DISABLE KEYS */;
/*!40000 ALTER TABLE `CM_SP_PURPOSE_PURPOSE_CAT_ASSC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIDO2_DEVICE_STORE`
--

DROP TABLE IF EXISTS `FIDO2_DEVICE_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FIDO2_DEVICE_STORE` (
  `TENANT_ID` int(11) DEFAULT NULL,
  `DOMAIN_NAME` varchar(255) NOT NULL,
  `USER_NAME` varchar(45) NOT NULL,
  `TIME_REGISTERED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_HANDLE` varchar(64) NOT NULL,
  `CREDENTIAL_ID` varchar(200) NOT NULL,
  `PUBLIC_KEY_COSE` varchar(1024) NOT NULL,
  `SIGNATURE_COUNT` bigint(20) DEFAULT NULL,
  `USER_IDENTITY` varchar(512) NOT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `IS_USERNAMELESS_SUPPORTED` char(1) DEFAULT '0',
  PRIMARY KEY (`CREDENTIAL_ID`,`USER_HANDLE`),
  KEY `IDX_FIDO2_STR` (`USER_NAME`,`TENANT_ID`,`DOMAIN_NAME`,`CREDENTIAL_ID`,`USER_HANDLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIDO2_DEVICE_STORE`
--

LOCK TABLES `FIDO2_DEVICE_STORE` WRITE;
/*!40000 ALTER TABLE `FIDO2_DEVICE_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FIDO2_DEVICE_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIDO_DEVICE_STORE`
--

DROP TABLE IF EXISTS `FIDO_DEVICE_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FIDO_DEVICE_STORE` (
  `TENANT_ID` int(11) NOT NULL,
  `DOMAIN_NAME` varchar(255) NOT NULL,
  `USER_NAME` varchar(45) NOT NULL,
  `TIME_REGISTERED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `KEY_HANDLE` varchar(200) NOT NULL,
  `DEVICE_DATA` varchar(2048) NOT NULL,
  PRIMARY KEY (`TENANT_ID`,`DOMAIN_NAME`,`USER_NAME`,`KEY_HANDLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIDO_DEVICE_STORE`
--

LOCK TABLES `FIDO_DEVICE_STORE` WRITE;
/*!40000 ALTER TABLE `FIDO_DEVICE_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FIDO_DEVICE_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_ASSOCIATED_ID`
--

DROP TABLE IF EXISTS `IDN_ASSOCIATED_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_ASSOCIATED_ID` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_USER_ID` varchar(255) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1234',
  `IDP_ID` int(11) NOT NULL,
  `DOMAIN_NAME` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `ASSOCIATION_ID` char(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_USER_ID` (`IDP_USER_ID`,`TENANT_ID`,`IDP_ID`),
  KEY `IDP_ID` (`IDP_ID`),
  KEY `IDX_AI_DN_UN_AI` (`DOMAIN_NAME`,`USER_NAME`,`ASSOCIATION_ID`),
  CONSTRAINT `IDN_ASSOCIATED_ID_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_ASSOCIATED_ID`
--

LOCK TABLES `IDN_ASSOCIATED_ID` WRITE;
/*!40000 ALTER TABLE `IDN_ASSOCIATED_ID` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_ASSOCIATED_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_SESSION_APP_INFO`
--

DROP TABLE IF EXISTS `IDN_AUTH_SESSION_APP_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_AUTH_SESSION_APP_INFO` (
  `SESSION_ID` varchar(100) NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `INBOUND_AUTH_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`SESSION_ID`,`SUBJECT`,`APP_ID`,`INBOUND_AUTH_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_SESSION_APP_INFO`
--

LOCK TABLES `IDN_AUTH_SESSION_APP_INFO` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_SESSION_APP_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_AUTH_SESSION_APP_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_SESSION_META_DATA`
--

DROP TABLE IF EXISTS `IDN_AUTH_SESSION_META_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_AUTH_SESSION_META_DATA` (
  `SESSION_ID` varchar(100) NOT NULL,
  `PROPERTY_TYPE` varchar(100) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`SESSION_ID`,`PROPERTY_TYPE`,`VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_SESSION_META_DATA`
--

LOCK TABLES `IDN_AUTH_SESSION_META_DATA` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_SESSION_META_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_AUTH_SESSION_META_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_SESSION_STORE`
--

DROP TABLE IF EXISTS `IDN_AUTH_SESSION_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_AUTH_SESSION_STORE` (
  `SESSION_ID` varchar(100) NOT NULL,
  `SESSION_TYPE` varchar(100) NOT NULL,
  `OPERATION` varchar(10) NOT NULL,
  `SESSION_OBJECT` blob,
  `TIME_CREATED` bigint(20) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  `EXPIRY_TIME` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`,`SESSION_TYPE`,`TIME_CREATED`,`OPERATION`),
  KEY `IDX_IDN_AUTH_SESSION_TIME` (`TIME_CREATED`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_SESSION_STORE`
--

LOCK TABLES `IDN_AUTH_SESSION_STORE` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_SESSION_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_AUTH_SESSION_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_TEMP_SESSION_STORE`
--

DROP TABLE IF EXISTS `IDN_AUTH_TEMP_SESSION_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_AUTH_TEMP_SESSION_STORE` (
  `SESSION_ID` varchar(100) NOT NULL,
  `SESSION_TYPE` varchar(100) NOT NULL,
  `OPERATION` varchar(10) NOT NULL,
  `SESSION_OBJECT` blob,
  `TIME_CREATED` bigint(20) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  `EXPIRY_TIME` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`,`SESSION_TYPE`,`TIME_CREATED`,`OPERATION`),
  KEY `IDX_IDN_AUTH_TMP_SESSION_TIME` (`TIME_CREATED`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_TEMP_SESSION_STORE`
--

LOCK TABLES `IDN_AUTH_TEMP_SESSION_STORE` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_TEMP_SESSION_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_AUTH_TEMP_SESSION_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_USER`
--

DROP TABLE IF EXISTS `IDN_AUTH_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_AUTH_USER` (
  `USER_ID` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DOMAIN_NAME` varchar(255) NOT NULL,
  `IDP_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USER_STORE_CONSTRAINT` (`USER_NAME`,`TENANT_ID`,`DOMAIN_NAME`,`IDP_ID`),
  KEY `IDX_AUTH_USER_UN_TID_DN` (`USER_NAME`,`TENANT_ID`,`DOMAIN_NAME`),
  KEY `IDX_AUTH_USER_DN_TOD` (`DOMAIN_NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_USER`
--

LOCK TABLES `IDN_AUTH_USER` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_AUTH_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_USER_SESSION_MAPPING`
--

DROP TABLE IF EXISTS `IDN_AUTH_USER_SESSION_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_AUTH_USER_SESSION_MAPPING` (
  `USER_ID` varchar(255) NOT NULL,
  `SESSION_ID` varchar(255) NOT NULL,
  UNIQUE KEY `USER_SESSION_STORE_CONSTRAINT` (`USER_ID`,`SESSION_ID`),
  KEY `IDX_USER_ID` (`USER_ID`),
  KEY `IDX_SESSION_ID` (`SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_USER_SESSION_MAPPING`
--

LOCK TABLES `IDN_AUTH_USER_SESSION_MAPPING` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_USER_SESSION_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_AUTH_USER_SESSION_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_AUTH_WAIT_STATUS`
--

DROP TABLE IF EXISTS `IDN_AUTH_WAIT_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_AUTH_WAIT_STATUS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `LONG_WAIT_KEY` varchar(255) NOT NULL,
  `WAIT_STATUS` char(1) NOT NULL DEFAULT '1',
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EXPIRE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDN_AUTH_WAIT_STATUS_KEY` (`LONG_WAIT_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_AUTH_WAIT_STATUS`
--

LOCK TABLES `IDN_AUTH_WAIT_STATUS` WRITE;
/*!40000 ALTER TABLE `IDN_AUTH_WAIT_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_AUTH_WAIT_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_BASE_TABLE`
--

DROP TABLE IF EXISTS `IDN_BASE_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_BASE_TABLE` (
  `PRODUCT_NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_BASE_TABLE`
--

LOCK TABLES `IDN_BASE_TABLE` WRITE;
/*!40000 ALTER TABLE `IDN_BASE_TABLE` DISABLE KEYS */;
INSERT INTO `IDN_BASE_TABLE` VALUES ('WSO2 Identity Server');
/*!40000 ALTER TABLE `IDN_BASE_TABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CERTIFICATE`
--

DROP TABLE IF EXISTS `IDN_CERTIFICATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_CERTIFICATE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `CERTIFICATE_IN_PEM` blob,
  `TENANT_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CERTIFICATE_UNIQUE_KEY` (`NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CERTIFICATE`
--

LOCK TABLES `IDN_CERTIFICATE` WRITE;
/*!40000 ALTER TABLE `IDN_CERTIFICATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_CERTIFICATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CLAIM`
--

DROP TABLE IF EXISTS `IDN_CLAIM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_CLAIM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DIALECT_ID` int(11) NOT NULL,
  `CLAIM_URI` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CLAIM_URI_CONSTRAINT` (`DIALECT_ID`,`CLAIM_URI`,`TENANT_ID`),
  CONSTRAINT `IDN_CLAIM_ibfk_1` FOREIGN KEY (`DIALECT_ID`) REFERENCES `IDN_CLAIM_DIALECT` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CLAIM`
--

LOCK TABLES `IDN_CLAIM` WRITE;
/*!40000 ALTER TABLE `IDN_CLAIM` DISABLE KEYS */;
INSERT INTO `IDN_CLAIM` VALUES (78,1,'http://wso2.org/claims/active',-1234),(12,1,'http://wso2.org/claims/addresses',-1234),(43,1,'http://wso2.org/claims/addresses.formatted',-1234),(37,1,'http://wso2.org/claims/addresses.locality',-1234),(47,1,'http://wso2.org/claims/challengeQuestion1',-1234),(53,1,'http://wso2.org/claims/challengeQuestion2',-1234),(25,1,'http://wso2.org/claims/challengeQuestionUris',-1234),(23,1,'http://wso2.org/claims/costCenter',-1234),(3,1,'http://wso2.org/claims/country',-1234),(87,1,'http://wso2.org/claims/created',-1234),(29,1,'http://wso2.org/claims/department',-1234),(4,1,'http://wso2.org/claims/displayName',-1234),(72,1,'http://wso2.org/claims/dob',-1234),(33,1,'http://wso2.org/claims/emailaddress',-1234),(75,1,'http://wso2.org/claims/emails.home',-1234),(28,1,'http://wso2.org/claims/emails.other',-1234),(35,1,'http://wso2.org/claims/emails.work',-1234),(68,1,'http://wso2.org/claims/entitlements',-1234),(62,1,'http://wso2.org/claims/extendedDisplayName',-1234),(18,1,'http://wso2.org/claims/extendedExternalId',-1234),(86,1,'http://wso2.org/claims/extendedRef',-1234),(46,1,'http://wso2.org/claims/externalid',-1234),(50,1,'http://wso2.org/claims/formattedName',-1234),(9,1,'http://wso2.org/claims/fullname',-1234),(88,1,'http://wso2.org/claims/gender',-1234),(61,1,'http://wso2.org/claims/givenname',-1234),(65,1,'http://wso2.org/claims/groups',-1234),(64,1,'http://wso2.org/claims/gtalk',-1234),(10,1,'http://wso2.org/claims/honorificPrefix',-1234),(40,1,'http://wso2.org/claims/honorificSuffix',-1234),(60,1,'http://wso2.org/claims/identity/accountDisabled',-1234),(27,1,'http://wso2.org/claims/identity/accountLocked',-1234),(90,1,'http://wso2.org/claims/identity/accountState',-1234),(84,1,'http://wso2.org/claims/identity/adminForcedPasswordReset',-1234),(52,1,'http://wso2.org/claims/identity/askPassword',-1234),(59,1,'http://wso2.org/claims/identity/emailaddress.pendingValue',-1234),(26,1,'http://wso2.org/claims/identity/emailotp_disabled',-1234),(80,1,'http://wso2.org/claims/identity/emailVerified',-1234),(63,1,'http://wso2.org/claims/identity/failedLoginAttempts',-1234),(70,1,'http://wso2.org/claims/identity/failedLoginAttemptsBeforeSuccess',-1234),(5,1,'http://wso2.org/claims/identity/failedLoginLockoutCount',-1234),(55,1,'http://wso2.org/claims/identity/failedPasswordRecoveryAttempts',-1234),(21,1,'http://wso2.org/claims/identity/lastLoginTime',-1234),(15,1,'http://wso2.org/claims/identity/lastLogonTime',-1234),(69,1,'http://wso2.org/claims/identity/lastPasswordUpdateTime',-1234),(8,1,'http://wso2.org/claims/identity/lockedReason',-1234),(41,1,'http://wso2.org/claims/identity/phoneVerified',-1234),(22,1,'http://wso2.org/claims/identity/preferredChannel',-1234),(44,1,'http://wso2.org/claims/identity/secretkey',-1234),(51,1,'http://wso2.org/claims/identity/smsotp_disabled',-1234),(38,1,'http://wso2.org/claims/identity/unlockTime',-1234),(45,1,'http://wso2.org/claims/identity/verifyEmail',-1234),(31,1,'http://wso2.org/claims/im',-1234),(20,1,'http://wso2.org/claims/lastname',-1234),(1,1,'http://wso2.org/claims/local',-1234),(2,1,'http://wso2.org/claims/locality',-1234),(24,1,'http://wso2.org/claims/location',-1234),(14,1,'http://wso2.org/claims/middleName',-1234),(6,1,'http://wso2.org/claims/mobile',-1234),(49,1,'http://wso2.org/claims/modified',-1234),(7,1,'http://wso2.org/claims/nickname',-1234),(77,1,'http://wso2.org/claims/oneTimePassword',-1234),(34,1,'http://wso2.org/claims/organization',-1234),(82,1,'http://wso2.org/claims/otherphone',-1234),(71,1,'http://wso2.org/claims/phoneNumbers',-1234),(48,1,'http://wso2.org/claims/phoneNumbers.fax',-1234),(54,1,'http://wso2.org/claims/phoneNumbers.home',-1234),(73,1,'http://wso2.org/claims/phoneNumbers.other',-1234),(91,1,'http://wso2.org/claims/phoneNumbers.pager',-1234),(39,1,'http://wso2.org/claims/phoneNumbers.work',-1234),(67,1,'http://wso2.org/claims/photos',-1234),(30,1,'http://wso2.org/claims/photourl',-1234),(32,1,'http://wso2.org/claims/postalcode',-1234),(17,1,'http://wso2.org/claims/preferredLanguage',-1234),(42,1,'http://wso2.org/claims/primaryChallengeQuestion',-1234),(13,1,'http://wso2.org/claims/region',-1234),(79,1,'http://wso2.org/claims/resourceType',-1234),(89,1,'http://wso2.org/claims/role',-1234),(11,1,'http://wso2.org/claims/skype',-1234),(76,1,'http://wso2.org/claims/stateorprovince',-1234),(57,1,'http://wso2.org/claims/streetaddress',-1234),(58,1,'http://wso2.org/claims/telephone',-1234),(83,1,'http://wso2.org/claims/thumbnail',-1234),(19,1,'http://wso2.org/claims/timeZone',-1234),(85,1,'http://wso2.org/claims/title',-1234),(36,1,'http://wso2.org/claims/url',-1234),(56,1,'http://wso2.org/claims/userid',-1234),(16,1,'http://wso2.org/claims/username',-1234),(74,1,'http://wso2.org/claims/userprincipal',-1234),(81,1,'http://wso2.org/claims/userType',-1234),(66,1,'http://wso2.org/claims/x509Certificates',-1234),(269,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/country',-1234),(172,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/dateofbirth',-1234),(267,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress',-1234),(166,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/gender',-1234),(164,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname',-1234),(224,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/homephone',-1234),(131,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/locality',-1234),(161,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/mobile',-1234),(150,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nickname',-1234),(246,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/otherphone',-1234),(207,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/postalcode',-1234),(194,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/privatepersonalidentifier',-1234),(144,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/stateorprovince',-1234),(93,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/streetaddress',-1234),(193,2,'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname',-1234),(116,3,'urn:scim:schemas:core:1.0:active',-1234),(202,3,'urn:scim:schemas:core:1.0:addresses',-1234),(188,3,'urn:scim:schemas:core:1.0:addresses.country',-1234),(140,3,'urn:scim:schemas:core:1.0:addresses.formatted',-1234),(236,3,'urn:scim:schemas:core:1.0:addresses.locality',-1234),(215,3,'urn:scim:schemas:core:1.0:addresses.postalCode',-1234),(167,3,'urn:scim:schemas:core:1.0:addresses.region',-1234),(230,3,'urn:scim:schemas:core:1.0:addresses.streetAddress',-1234),(239,3,'urn:scim:schemas:core:1.0:displayName',-1234),(254,3,'urn:scim:schemas:core:1.0:emails',-1234),(169,3,'urn:scim:schemas:core:1.0:emails.home',-1234),(190,3,'urn:scim:schemas:core:1.0:emails.other',-1234),(255,3,'urn:scim:schemas:core:1.0:emails.work',-1234),(238,3,'urn:scim:schemas:core:1.0:entitlements',-1234),(128,3,'urn:scim:schemas:core:1.0:externalId',-1234),(126,3,'urn:scim:schemas:core:1.0:groups',-1234),(231,3,'urn:scim:schemas:core:1.0:id',-1234),(176,3,'urn:scim:schemas:core:1.0:ims',-1234),(214,3,'urn:scim:schemas:core:1.0:ims.gtalk',-1234),(155,3,'urn:scim:schemas:core:1.0:ims.skype',-1234),(98,3,'urn:scim:schemas:core:1.0:locale',-1234),(178,3,'urn:scim:schemas:core:1.0:meta.created',-1234),(123,3,'urn:scim:schemas:core:1.0:meta.lastModified',-1234),(199,3,'urn:scim:schemas:core:1.0:meta.location',-1234),(173,3,'urn:scim:schemas:core:1.0:name.familyName',-1234),(273,3,'urn:scim:schemas:core:1.0:name.formatted',-1234),(100,3,'urn:scim:schemas:core:1.0:name.givenName',-1234),(235,3,'urn:scim:schemas:core:1.0:name.honorificPrefix',-1234),(119,3,'urn:scim:schemas:core:1.0:name.honorificSuffix',-1234),(237,3,'urn:scim:schemas:core:1.0:name.middleName',-1234),(260,3,'urn:scim:schemas:core:1.0:nickName',-1234),(102,3,'urn:scim:schemas:core:1.0:phoneNumbers',-1234),(274,3,'urn:scim:schemas:core:1.0:phoneNumbers.fax',-1234),(127,3,'urn:scim:schemas:core:1.0:phoneNumbers.home',-1234),(195,3,'urn:scim:schemas:core:1.0:phoneNumbers.mobile',-1234),(157,3,'urn:scim:schemas:core:1.0:phoneNumbers.other',-1234),(117,3,'urn:scim:schemas:core:1.0:phoneNumbers.pager',-1234),(192,3,'urn:scim:schemas:core:1.0:phoneNumbers.work',-1234),(120,3,'urn:scim:schemas:core:1.0:photos',-1234),(96,3,'urn:scim:schemas:core:1.0:photos.photo',-1234),(110,3,'urn:scim:schemas:core:1.0:photos.thumbnail',-1234),(156,3,'urn:scim:schemas:core:1.0:preferredLanguage',-1234),(171,3,'urn:scim:schemas:core:1.0:profileUrl',-1234),(129,3,'urn:scim:schemas:core:1.0:roles',-1234),(94,3,'urn:scim:schemas:core:1.0:timeZone',-1234),(223,3,'urn:scim:schemas:core:1.0:title',-1234),(149,3,'urn:scim:schemas:core:1.0:userName',-1234),(114,3,'urn:scim:schemas:core:1.0:userType',-1234),(175,3,'urn:scim:schemas:core:1.0:x509Certificates',-1234),(197,4,'urn:ietf:params:scim:schemas:core:2.0:User:active',-1234),(133,4,'urn:ietf:params:scim:schemas:core:2.0:User:addresses',-1234),(234,4,'urn:ietf:params:scim:schemas:core:2.0:User:addresses.home',-1234),(160,4,'urn:ietf:params:scim:schemas:core:2.0:User:addresses.work',-1234),(121,4,'urn:ietf:params:scim:schemas:core:2.0:User:displayName',-1234),(106,4,'urn:ietf:params:scim:schemas:core:2.0:User:emails',-1234),(115,4,'urn:ietf:params:scim:schemas:core:2.0:User:emails.home',-1234),(227,4,'urn:ietf:params:scim:schemas:core:2.0:User:emails.other',-1234),(187,4,'urn:ietf:params:scim:schemas:core:2.0:User:emails.work',-1234),(130,4,'urn:ietf:params:scim:schemas:core:2.0:User:entitlements.default',-1234),(233,4,'urn:ietf:params:scim:schemas:core:2.0:User:groups',-1234),(244,4,'urn:ietf:params:scim:schemas:core:2.0:User:ims.gtalk',-1234),(181,4,'urn:ietf:params:scim:schemas:core:2.0:User:ims.skype',-1234),(213,4,'urn:ietf:params:scim:schemas:core:2.0:User:locale',-1234),(108,4,'urn:ietf:params:scim:schemas:core:2.0:User:name.familyName',-1234),(125,4,'urn:ietf:params:scim:schemas:core:2.0:User:name.formatted',-1234),(266,4,'urn:ietf:params:scim:schemas:core:2.0:User:name.givenName',-1234),(212,4,'urn:ietf:params:scim:schemas:core:2.0:User:name.honorificPrefix',-1234),(143,4,'urn:ietf:params:scim:schemas:core:2.0:User:name.honorificSuffix',-1234),(159,4,'urn:ietf:params:scim:schemas:core:2.0:User:name.middleName',-1234),(251,4,'urn:ietf:params:scim:schemas:core:2.0:User:nickName',-1234),(107,4,'urn:ietf:params:scim:schemas:core:2.0:User:phoneNumbers',-1234),(262,4,'urn:ietf:params:scim:schemas:core:2.0:User:phoneNumbers.home',-1234),(268,4,'urn:ietf:params:scim:schemas:core:2.0:User:phoneNumbers.mobile',-1234),(229,4,'urn:ietf:params:scim:schemas:core:2.0:User:phoneNumbers.other',-1234),(185,4,'urn:ietf:params:scim:schemas:core:2.0:User:phoneNumbers.work',-1234),(232,4,'urn:ietf:params:scim:schemas:core:2.0:User:photos',-1234),(109,4,'urn:ietf:params:scim:schemas:core:2.0:User:photos.photo',-1234),(209,4,'urn:ietf:params:scim:schemas:core:2.0:User:photos.thumbnail',-1234),(220,4,'urn:ietf:params:scim:schemas:core:2.0:User:preferredLanguage',-1234),(272,4,'urn:ietf:params:scim:schemas:core:2.0:User:profileUrl',-1234),(253,4,'urn:ietf:params:scim:schemas:core:2.0:User:roles.default',-1234),(142,4,'urn:ietf:params:scim:schemas:core:2.0:User:timezone',-1234),(113,4,'urn:ietf:params:scim:schemas:core:2.0:User:title',-1234),(141,4,'urn:ietf:params:scim:schemas:core:2.0:User:userName',-1234),(248,4,'urn:ietf:params:scim:schemas:core:2.0:User:userType',-1234),(124,4,'urn:ietf:params:scim:schemas:core:2.0:User:x509Certificates.default',-1234),(191,5,'address',-1234),(263,5,'birthdate',-1234),(198,5,'country',-1234),(208,5,'email',-1234),(112,5,'email_verified',-1234),(226,5,'family_name',-1234),(204,5,'formatted',-1234),(92,5,'gender',-1234),(217,5,'given_name',-1234),(189,5,'groups',-1234),(242,5,'locale',-1234),(219,5,'locality',-1234),(136,5,'middle_name',-1234),(241,5,'name',-1234),(151,5,'nickname',-1234),(256,5,'phone_number',-1234),(179,5,'phone_number_verified',-1234),(122,5,'picture',-1234),(186,5,'postal_code',-1234),(135,5,'preferred_username',-1234),(177,5,'profile',-1234),(225,5,'region',-1234),(250,5,'street_address',-1234),(148,5,'sub',-1234),(271,5,'updated_at',-1234),(211,5,'upn',-1234),(252,5,'website',-1234),(118,5,'zoneinfo',-1234),(196,6,'http://eidas.europa.eu/attributes/legalperson/D-2012-17-EUIdentifier',-1234),(105,6,'http://eidas.europa.eu/attributes/legalperson/EORI',-1234),(99,6,'http://eidas.europa.eu/attributes/legalperson/LegalName',-1234),(180,6,'http://eidas.europa.eu/attributes/legalperson/LegalPersonAddress',-1234),(145,6,'http://eidas.europa.eu/attributes/legalperson/LegalPersonIdentifier',-1234),(184,6,'http://eidas.europa.eu/attributes/legalperson/LEI',-1234),(206,6,'http://eidas.europa.eu/attributes/legalperson/SEED',-1234),(265,6,'http://eidas.europa.eu/attributes/legalperson/SIC',-1234),(152,6,'http://eidas.europa.eu/attributes/legalperson/TaxReference',-1234),(243,6,'http://eidas.europa.eu/attributes/legalperson/VATRegistrationNumber',-1234),(111,7,'country',-1234),(97,7,'dob',-1234),(165,7,'email',-1234),(162,7,'fullname',-1234),(146,7,'gender',-1234),(147,7,'language',-1234),(210,7,'nickname',-1234),(104,7,'postcode',-1234),(132,7,'timezone',-1234),(182,8,'http://eidas.europa.eu/attributes/naturalperson/BirthName',-1234),(264,8,'http://eidas.europa.eu/attributes/naturalperson/CurrentAddress',-1234),(134,8,'http://eidas.europa.eu/attributes/naturalperson/CurrentFamilyName',-1234),(158,8,'http://eidas.europa.eu/attributes/naturalperson/CurrentGivenName',-1234),(247,8,'http://eidas.europa.eu/attributes/naturalperson/DateOfBirth',-1234),(257,8,'http://eidas.europa.eu/attributes/naturalperson/Gender',-1234),(216,8,'http://eidas.europa.eu/attributes/naturalperson/PersonIdentifier',-1234),(101,8,'http://eidas.europa.eu/attributes/naturalperson/PlaceOfBirth',-1234),(138,9,'urn:ietf:params:scim:schemas:core:2.0:externalId',-1234),(259,9,'urn:ietf:params:scim:schemas:core:2.0:id',-1234),(240,9,'urn:ietf:params:scim:schemas:core:2.0:meta.created',-1234),(170,9,'urn:ietf:params:scim:schemas:core:2.0:meta.lastModified',-1234),(168,9,'urn:ietf:params:scim:schemas:core:2.0:meta.location',-1234),(154,9,'urn:ietf:params:scim:schemas:core:2.0:meta.resourceType',-1234),(174,9,'urn:ietf:params:scim:schemas:core:2.0:meta.version',-1234),(270,10,'http://axschema.org/birthDate',-1234),(183,10,'http://axschema.org/contact/country/home',-1234),(245,10,'http://axschema.org/contact/email',-1234),(153,10,'http://axschema.org/contact/postalCode/home',-1234),(218,10,'http://axschema.org/namePerson/first',-1234),(163,10,'http://axschema.org/namePerson/last',-1234),(221,10,'http://axschema.org/person/gender',-1234),(139,10,'http://axschema.org/pref/language',-1234),(222,10,'http://axschema.org/pref/timezone',-1234),(203,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:askPassword',-1234),(228,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:costCenter',-1234),(261,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:department',-1234),(205,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:division',-1234),(137,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:employeeNumber',-1234),(200,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:manager.$ref',-1234),(249,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:manager.displayName',-1234),(95,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:manager.value',-1234),(103,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:organization',-1234),(258,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:pendingEmails.value',-1234),(201,11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User:verifyEmail',-1234);
/*!40000 ALTER TABLE `IDN_CLAIM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CLAIM_DIALECT`
--

DROP TABLE IF EXISTS `IDN_CLAIM_DIALECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_CLAIM_DIALECT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DIALECT_URI` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `DIALECT_URI_CONSTRAINT` (`DIALECT_URI`,`TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CLAIM_DIALECT`
--

LOCK TABLES `IDN_CLAIM_DIALECT` WRITE;
/*!40000 ALTER TABLE `IDN_CLAIM_DIALECT` DISABLE KEYS */;
INSERT INTO `IDN_CLAIM_DIALECT` VALUES (10,'http://axschema.org',-1234),(6,'http://eidas.europa.eu/attributes/legalperson',-1234),(8,'http://eidas.europa.eu/attributes/naturalperson',-1234),(7,'http://schema.openid.net/2007/05/claims',-1234),(2,'http://schemas.xmlsoap.org/ws/2005/05/identity',-1234),(1,'http://wso2.org/claims',-1234),(5,'http://wso2.org/oidc/claim',-1234),(9,'urn:ietf:params:scim:schemas:core:2.0',-1234),(4,'urn:ietf:params:scim:schemas:core:2.0:User',-1234),(11,'urn:ietf:params:scim:schemas:extension:enterprise:2.0:User',-1234),(3,'urn:scim:schemas:core:1.0',-1234);
/*!40000 ALTER TABLE `IDN_CLAIM_DIALECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CLAIM_MAPPED_ATTRIBUTE`
--

DROP TABLE IF EXISTS `IDN_CLAIM_MAPPED_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_CLAIM_MAPPED_ATTRIBUTE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOCAL_CLAIM_ID` int(11) DEFAULT NULL,
  `USER_STORE_DOMAIN_NAME` varchar(255) NOT NULL,
  `ATTRIBUTE_NAME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_STORE_DOMAIN_CONSTRAINT` (`LOCAL_CLAIM_ID`,`USER_STORE_DOMAIN_NAME`,`TENANT_ID`),
  CONSTRAINT `IDN_CLAIM_MAPPED_ATTRIBUTE_ibfk_1` FOREIGN KEY (`LOCAL_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CLAIM_MAPPED_ATTRIBUTE`
--

LOCK TABLES `IDN_CLAIM_MAPPED_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `IDN_CLAIM_MAPPED_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `IDN_CLAIM_MAPPED_ATTRIBUTE` VALUES (1,1,'PRIMARY','local',-1234),(2,2,'PRIMARY','local',-1234),(3,3,'PRIMARY','country',-1234),(4,4,'PRIMARY','displayName',-1234),(5,5,'PRIMARY','failedLockoutCount',-1234),(6,6,'PRIMARY','mobile',-1234),(7,7,'PRIMARY','nickName',-1234),(8,8,'PRIMARY','lockedReason',-1234),(9,9,'PRIMARY','cn',-1234),(10,10,'PRIMARY','honoricPrefix',-1234),(11,11,'PRIMARY','imSkype',-1234),(12,12,'PRIMARY','addresses',-1234),(13,13,'PRIMARY','region',-1234),(14,14,'PRIMARY','middleName',-1234),(15,15,'PRIMARY','lastLogonTime',-1234),(16,16,'PRIMARY','uid',-1234),(17,17,'PRIMARY','preferredLanguage',-1234),(18,18,'PRIMARY','extendedExternalId',-1234),(19,19,'PRIMARY','timeZone',-1234),(20,20,'PRIMARY','sn',-1234),(21,21,'PRIMARY','lastLoginTime',-1234),(22,22,'PRIMARY','preferredChannel',-1234),(23,23,'PRIMARY','costCenter',-1234),(24,24,'PRIMARY','location',-1234),(25,25,'PRIMARY','challengeQuestionUris',-1234),(26,26,'PRIMARY','emailOTPDisabled',-1234),(27,27,'PRIMARY','accountLock',-1234),(28,28,'PRIMARY','otherEmail',-1234),(29,29,'PRIMARY','departmentNumber',-1234),(30,30,'PRIMARY','photoUrl',-1234),(31,31,'PRIMARY','im',-1234),(32,32,'PRIMARY','postalcode',-1234),(33,33,'PRIMARY','mail',-1234),(34,34,'PRIMARY','organizationName',-1234),(35,35,'PRIMARY','workEmail',-1234),(36,36,'PRIMARY','url',-1234),(37,37,'PRIMARY','localityAddress',-1234),(38,38,'PRIMARY','unlockTime',-1234),(39,39,'PRIMARY','workPhone',-1234),(40,40,'PRIMARY','honoricSuffix',-1234),(41,41,'PRIMARY','phoneVerified',-1234),(42,42,'PRIMARY','primaryChallengeQuestion',-1234),(43,43,'PRIMARY','formattedAddress',-1234),(44,44,'PRIMARY','totpSecretkey',-1234),(45,45,'PRIMARY','verifyEmail',-1234),(46,46,'PRIMARY','externalId',-1234),(47,47,'PRIMARY','firstChallenge',-1234),(48,48,'PRIMARY','fax',-1234),(49,49,'PRIMARY','lastModifiedDate',-1234),(50,50,'PRIMARY','formattedName',-1234),(51,51,'PRIMARY','smsOTPDisabled',-1234),(52,52,'PRIMARY','askPassword',-1234),(53,53,'PRIMARY','secondChallenge',-1234),(54,54,'PRIMARY','homePhone',-1234),(55,55,'PRIMARY','failedRecoveryAttempts',-1234),(56,56,'PRIMARY','scimId',-1234),(57,57,'PRIMARY','streetAddress',-1234),(58,58,'PRIMARY','telephoneNumber',-1234),(59,59,'PRIMARY','pendingEmailAddress',-1234),(60,60,'PRIMARY','accountDisabled',-1234),(61,61,'PRIMARY','givenName',-1234),(62,62,'PRIMARY','extendedDisplayName',-1234),(63,63,'PRIMARY','failedLoginAttempts',-1234),(64,64,'PRIMARY','imGtalk',-1234),(65,65,'PRIMARY','groups',-1234),(66,66,'PRIMARY','x509Certificates',-1234),(67,67,'PRIMARY','photos',-1234),(68,68,'PRIMARY','entitlements',-1234),(69,69,'PRIMARY','lastPasswordUpdate',-1234),(70,70,'PRIMARY','failedLoginAttemptsBeforeSuccess',-1234),(71,71,'PRIMARY','phoneNumbers',-1234),(72,72,'PRIMARY','dateOfBirth',-1234),(73,73,'PRIMARY','otherPhoneNumber',-1234),(74,74,'PRIMARY','uid',-1234),(75,75,'PRIMARY','homeEmail',-1234),(76,76,'PRIMARY','stateOrProvinceName',-1234),(77,77,'PRIMARY','oneTimePassword',-1234),(78,78,'PRIMARY','active',-1234),(79,79,'PRIMARY','resourceType',-1234),(80,80,'PRIMARY','emailVerified',-1234),(81,81,'PRIMARY','userType',-1234),(82,82,'PRIMARY','otherPhone',-1234),(83,83,'PRIMARY','thumbnail',-1234),(84,84,'PRIMARY','forcePasswordReset',-1234),(85,85,'PRIMARY','title',-1234),(86,86,'PRIMARY','extendedRef',-1234),(87,87,'PRIMARY','createdDate',-1234),(88,88,'PRIMARY','gender',-1234),(89,89,'PRIMARY','role',-1234),(90,90,'PRIMARY','accountState',-1234),(91,91,'PRIMARY','pager',-1234);
/*!40000 ALTER TABLE `IDN_CLAIM_MAPPED_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CLAIM_MAPPING`
--

DROP TABLE IF EXISTS `IDN_CLAIM_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_CLAIM_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXT_CLAIM_ID` int(11) NOT NULL,
  `MAPPED_LOCAL_CLAIM_ID` int(11) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EXT_TO_LOC_MAPPING_CONSTRN` (`EXT_CLAIM_ID`,`TENANT_ID`),
  KEY `MAPPED_LOCAL_CLAIM_ID` (`MAPPED_LOCAL_CLAIM_ID`),
  CONSTRAINT `IDN_CLAIM_MAPPING_ibfk_1` FOREIGN KEY (`EXT_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `IDN_CLAIM_MAPPING_ibfk_2` FOREIGN KEY (`MAPPED_LOCAL_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CLAIM_MAPPING`
--

LOCK TABLES `IDN_CLAIM_MAPPING` WRITE;
/*!40000 ALTER TABLE `IDN_CLAIM_MAPPING` DISABLE KEYS */;
INSERT INTO `IDN_CLAIM_MAPPING` VALUES (1,92,88,-1234),(2,93,57,-1234),(3,94,19,-1234),(4,95,88,-1234),(5,96,30,-1234),(6,97,72,-1234),(7,98,1,-1234),(8,99,62,-1234),(9,100,61,-1234),(10,101,3,-1234),(11,102,71,-1234),(12,103,34,-1234),(13,104,32,-1234),(14,105,29,-1234),(15,106,33,-1234),(16,107,71,-1234),(17,108,20,-1234),(18,109,30,-1234),(19,110,83,-1234),(20,111,3,-1234),(21,112,80,-1234),(22,113,85,-1234),(23,114,81,-1234),(24,115,75,-1234),(25,116,78,-1234),(26,117,91,-1234),(27,118,19,-1234),(28,119,40,-1234),(29,120,67,-1234),(30,121,4,-1234),(31,122,30,-1234),(32,123,49,-1234),(33,124,66,-1234),(34,125,50,-1234),(35,126,65,-1234),(36,127,54,-1234),(37,128,46,-1234),(38,129,89,-1234),(39,130,68,-1234),(40,131,2,-1234),(41,132,19,-1234),(42,133,12,-1234),(43,134,20,-1234),(44,135,4,-1234),(45,136,14,-1234),(46,137,18,-1234),(47,138,46,-1234),(48,139,17,-1234),(49,140,43,-1234),(50,141,16,-1234),(51,142,19,-1234),(52,143,40,-1234),(53,144,76,-1234),(54,145,18,-1234),(55,146,88,-1234),(56,147,17,-1234),(57,148,16,-1234),(58,149,16,-1234),(59,150,7,-1234),(60,151,7,-1234),(61,152,32,-1234),(62,153,32,-1234),(63,154,79,-1234),(64,155,11,-1234),(65,156,17,-1234),(66,157,73,-1234),(67,158,61,-1234),(68,159,14,-1234),(69,160,13,-1234),(70,161,6,-1234),(71,162,9,-1234),(72,163,20,-1234),(73,164,61,-1234),(74,165,33,-1234),(75,166,88,-1234),(76,167,13,-1234),(77,168,24,-1234),(78,169,75,-1234),(79,170,49,-1234),(80,171,36,-1234),(81,172,72,-1234),(82,173,20,-1234),(83,174,31,-1234),(84,175,66,-1234),(85,176,31,-1234),(86,177,36,-1234),(87,178,87,-1234),(88,179,41,-1234),(89,180,12,-1234),(90,181,11,-1234),(91,182,16,-1234),(92,183,3,-1234),(93,184,86,-1234),(94,185,39,-1234),(95,186,32,-1234),(96,187,35,-1234),(97,188,3,-1234),(98,189,89,-1234),(99,190,28,-1234),(100,191,12,-1234),(101,192,39,-1234),(102,193,20,-1234),(103,194,31,-1234),(104,195,6,-1234),(105,196,46,-1234),(106,197,78,-1234),(107,198,3,-1234),(108,199,24,-1234),(109,200,86,-1234),(110,201,45,-1234),(111,202,12,-1234),(112,203,52,-1234),(113,204,43,-1234),(114,205,76,-1234),(115,206,7,-1234),(116,207,32,-1234),(117,208,33,-1234),(118,209,83,-1234),(119,210,7,-1234),(120,211,74,-1234),(121,212,10,-1234),(122,213,1,-1234),(123,214,64,-1234),(124,215,32,-1234),(125,216,56,-1234),(126,217,61,-1234),(127,218,61,-1234),(128,219,2,-1234),(129,220,17,-1234),(130,221,88,-1234),(131,222,19,-1234),(132,223,85,-1234),(133,224,54,-1234),(134,225,13,-1234),(135,226,20,-1234),(136,227,28,-1234),(137,228,23,-1234),(138,229,73,-1234),(139,230,57,-1234),(140,231,56,-1234),(141,232,67,-1234),(142,233,65,-1234),(143,234,37,-1234),(144,235,10,-1234),(145,236,37,-1234),(146,237,14,-1234),(147,238,68,-1234),(148,239,4,-1234),(149,240,87,-1234),(150,241,9,-1234),(151,242,1,-1234),(152,243,31,-1234),(153,244,64,-1234),(154,245,33,-1234),(155,246,82,-1234),(156,247,72,-1234),(157,248,81,-1234),(158,249,62,-1234),(159,250,57,-1234),(160,251,7,-1234),(161,252,36,-1234),(162,253,89,-1234),(163,254,33,-1234),(164,255,35,-1234),(165,256,58,-1234),(166,257,88,-1234),(167,258,59,-1234),(168,259,56,-1234),(169,260,7,-1234),(170,261,29,-1234),(171,262,54,-1234),(172,263,72,-1234),(173,264,12,-1234),(174,265,7,-1234),(175,266,61,-1234),(176,267,33,-1234),(177,268,6,-1234),(178,269,3,-1234),(179,270,72,-1234),(180,271,49,-1234),(181,272,36,-1234),(182,273,50,-1234),(183,274,48,-1234);
/*!40000 ALTER TABLE `IDN_CLAIM_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_CLAIM_PROPERTY`
--

DROP TABLE IF EXISTS `IDN_CLAIM_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_CLAIM_PROPERTY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOCAL_CLAIM_ID` int(11) DEFAULT NULL,
  `PROPERTY_NAME` varchar(255) NOT NULL,
  `PROPERTY_VALUE` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PROPERTY_NAME_CONSTRAINT` (`LOCAL_CLAIM_ID`,`PROPERTY_NAME`,`TENANT_ID`),
  CONSTRAINT `IDN_CLAIM_PROPERTY_ibfk_1` FOREIGN KEY (`LOCAL_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1171 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_CLAIM_PROPERTY`
--

LOCK TABLES `IDN_CLAIM_PROPERTY` WRITE;
/*!40000 ALTER TABLE `IDN_CLAIM_PROPERTY` DISABLE KEYS */;
INSERT INTO `IDN_CLAIM_PROPERTY` VALUES (1,1,'Description','Local',-1234),(2,1,'DisplayName','Local',-1234),(3,2,'Description','Locality',-1234),(4,2,'DisplayName','Locality',-1234),(5,3,'Description','Country',-1234),(6,3,'DisplayOrder','5',-1234),(7,3,'SupportedByDefault','true',-1234),(8,3,'DisplayName','Country',-1234),(9,4,'Description','Display Name',-1234),(10,4,'DisplayName','Display Name',-1234),(11,5,'Description','Failed Lockout Count',-1234),(12,5,'DisplayName','Failed Lockout Count',-1234),(13,6,'Description','Mobile',-1234),(14,6,'DisplayOrder','8',-1234),(15,6,'SupportedByDefault','true',-1234),(16,6,'DisplayName','Mobile',-1234),(17,7,'Description','Nick Name',-1234),(18,7,'DisplayName','Nick Name',-1234),(19,8,'Description','Locked Reason',-1234),(20,8,'DisplayName','Locked Reason',-1234),(21,9,'Description','Full Name',-1234),(22,9,'DisplayName','Full Name',-1234),(23,10,'Description','Honoric Prefix',-1234),(24,10,'DisplayName','Name - Honoric Prefix',-1234),(25,11,'Description','IM - Skype',-1234),(26,11,'DisplayName','IM - Skype',-1234),(27,12,'Description','Address',-1234),(28,12,'DisplayName','Address',-1234),(29,13,'Description','Region',-1234),(30,13,'DisplayName','Region',-1234),(31,14,'Description','Middle Name',-1234),(32,14,'DisplayName','Middle Name',-1234),(33,15,'Description','Last Logon Time',-1234),(34,15,'DisplayName','Last Logon',-1234),(35,16,'Description','Username',-1234),(36,16,'DisplayName','Username',-1234),(37,17,'Description','Preferred Language',-1234),(38,17,'DisplayName','Preferred Language',-1234),(39,18,'Description','Extended External ID',-1234),(40,18,'DisplayName','Extended External ID',-1234),(41,19,'Description','Time Zone',-1234),(42,19,'DisplayName','Time Zone',-1234),(43,20,'Description','Last Name',-1234),(44,20,'DisplayOrder','2',-1234),(45,20,'Required','true',-1234),(46,20,'SupportedByDefault','true',-1234),(47,20,'DisplayName','Last Name',-1234),(48,21,'Description','Last Login Time',-1234),(49,21,'DisplayName','Last Login',-1234),(50,22,'Description','Preferred Notification Channel',-1234),(51,22,'DisplayName','Preferred Channel',-1234),(52,23,'Description','Cost Center',-1234),(53,23,'DisplayName','Cost Center',-1234),(54,24,'Description','Location',-1234),(55,24,'DisplayName','Location',-1234),(56,25,'Description','Challenge Question',-1234),(57,25,'DisplayName','Challenge Question',-1234),(58,26,'Description','Claim to disable EmailOTP',-1234),(59,26,'DisplayName','Disable EmailOTP',-1234),(60,27,'Description','Account Locked',-1234),(61,27,'DisplayName','Account Locked',-1234),(62,28,'Description','Other Email',-1234),(63,28,'DisplayName','Emails - Other Email',-1234),(64,29,'ReadOnly','true',-1234),(65,29,'Description','Department',-1234),(66,29,'SupportedByDefault','true',-1234),(67,29,'DisplayName','Department',-1234),(68,30,'Description','Photo URL',-1234),(69,30,'DisplayName','Photo URIL',-1234),(70,31,'Description','IM',-1234),(71,31,'DisplayOrder','9',-1234),(72,31,'SupportedByDefault','true',-1234),(73,31,'DisplayName','IM',-1234),(74,32,'Description','Postal Code',-1234),(75,32,'DisplayName','Postal Code',-1234),(76,33,'Description','Email Address',-1234),(77,33,'DisplayOrder','6',-1234),(78,33,'Required','true',-1234),(79,33,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(80,33,'SupportedByDefault','true',-1234),(81,33,'DisplayName','Email',-1234),(82,34,'Description','Organization',-1234),(83,34,'DisplayOrder','3',-1234),(84,34,'SupportedByDefault','true',-1234),(85,34,'DisplayName','Organization',-1234),(86,35,'Description','Work Email',-1234),(87,35,'DisplayName','Emails - Work Email',-1234),(88,36,'Description','URL',-1234),(89,36,'DisplayOrder','10',-1234),(90,36,'SupportedByDefault','true',-1234),(91,36,'DisplayName','URL',-1234),(92,37,'Description','Address - Locality',-1234),(93,37,'DisplayName','Address - Locality',-1234),(94,38,'Description','Unlock Time',-1234),(95,38,'DisplayName','Unlock Time',-1234),(96,39,'Description','Work Phone',-1234),(97,39,'DisplayName','Phone Numbers - Work Phone Number',-1234),(98,40,'Description','Honoric Suffix',-1234),(99,40,'DisplayName','Name - Honoric Suffix',-1234),(100,41,'Description','Phone Verified',-1234),(101,41,'DisplayName','Phone Verified',-1234),(102,42,'Description','Primary Challenge Question',-1234),(103,42,'DisplayName','Primary Challenge Question',-1234),(104,43,'Description','Address - Formatted',-1234),(105,43,'DisplayName','Address - Formatted',-1234),(106,44,'Description','Claim to store the secret key',-1234),(107,44,'DisplayName','Secret Key',-1234),(108,45,'Description','Temporary claim to invoke email verified feature',-1234),(109,45,'DisplayName','Verify Email',-1234),(110,46,'ReadOnly','true',-1234),(111,46,'Description','Unique ID of the user used in external systems',-1234),(112,46,'DisplayName','External User ID',-1234),(113,47,'Description','Challenge Question1',-1234),(114,47,'DisplayName','Challenge Question1',-1234),(115,48,'Description','Fax Number',-1234),(116,48,'DisplayName','Phone Numbers - Fax Number',-1234),(117,49,'ReadOnly','true',-1234),(118,49,'Description','Last Modified timestamp of the user',-1234),(119,49,'DisplayName','Last Modified Time',-1234),(120,50,'Description','Formatted Name',-1234),(121,50,'DisplayName','Name - Formatted Name',-1234),(122,51,'Description','Claim to disable SMSOTP',-1234),(123,51,'DisplayName','Disable SMSOTP',-1234),(124,52,'Description','Temporary claim to invoke email ask Password feature',-1234),(125,52,'DisplayName','Ask Password',-1234),(126,53,'Description','Challenge Question2',-1234),(127,53,'DisplayName','Challenge Question2',-1234),(128,54,'Description','Home Phone',-1234),(129,54,'DisplayName','Phone Numbers - Home Phone Number',-1234),(130,55,'Description','Number of consecutive failed attempts done for password recovery',-1234),(131,55,'DisplayName','Failed Password Recovery Attempts',-1234),(132,56,'ReadOnly','true',-1234),(133,56,'Description','Unique ID of the user',-1234),(134,56,'DisplayName','User ID',-1234),(135,57,'Description','Address - Street',-1234),(136,57,'DisplayOrder','5',-1234),(137,57,'DisplayName','Address - Street',-1234),(138,58,'Description','Telephone',-1234),(139,58,'DisplayOrder','7',-1234),(140,58,'SupportedByDefault','true',-1234),(141,58,'DisplayName','Telephone',-1234),(142,59,'ReadOnly','true',-1234),(143,59,'Description','Claim to store newly updated email address until the new email address is verified.',-1234),(144,59,'DisplayName','Verification Pending Email',-1234),(145,60,'Description','Account Disabled',-1234),(146,60,'DisplayName','Account Disabled',-1234),(147,61,'Description','First Name',-1234),(148,61,'DisplayOrder','1',-1234),(149,61,'Required','true',-1234),(150,61,'SupportedByDefault','true',-1234),(151,61,'DisplayName','First Name',-1234),(152,62,'Description','Extended Display Name',-1234),(153,62,'DisplayName','Extended Display Name',-1234),(154,63,'Description','Failed Login Attempts',-1234),(155,63,'DisplayName','Failed Login Attempts',-1234),(156,64,'Description','IM - Gtalk',-1234),(157,64,'DisplayName','IM - Gtalk',-1234),(158,65,'Description','Groups',-1234),(159,65,'DisplayName','Groups',-1234),(160,66,'Description','X509Certificates',-1234),(161,66,'DisplayName','X509Certificates',-1234),(162,67,'Description','Photo',-1234),(163,67,'DisplayName','Photo',-1234),(164,68,'Description','Entitlements',-1234),(165,68,'DisplayName','Entitlements',-1234),(166,69,'Description','Last Password Update Time',-1234),(167,69,'DisplayName','Last Password Update',-1234),(168,70,'Description','Failed Attempts Before Success',-1234),(169,70,'DisplayName','Failed Attempts Before Success',-1234),(170,71,'Description','Phone Numbers',-1234),(171,71,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$',-1234),(172,71,'DisplayName','Phone Numbers',-1234),(173,72,'Description','Birth Date',-1234),(174,72,'DisplayName','Birth Date',-1234),(175,73,'Description','Other Phone Number',-1234),(176,73,'DisplayName','Phone Numbers - Other',-1234),(177,74,'Description','User Principal',-1234),(178,74,'DisplayName','User Principal',-1234),(179,75,'Description','Home Email',-1234),(180,75,'DisplayName','Emails - Home Email',-1234),(181,76,'Description','State',-1234),(182,76,'DisplayName','State',-1234),(183,77,'Description','One Time Password',-1234),(184,77,'DisplayName','One Time Password',-1234),(185,78,'Description','Status of the account',-1234),(186,78,'DisplayName','Active',-1234),(187,79,'Description','Resource Type',-1234),(188,79,'DisplayName','Resource Type',-1234),(189,80,'Description','Email Verified',-1234),(190,80,'DisplayName','Email Verified',-1234),(191,81,'Description','User Type',-1234),(192,81,'DisplayName','User Type',-1234),(193,82,'Description','Other Phone',-1234),(194,82,'DisplayName','Other Phone',-1234),(195,83,'Description','Photo - Thumbnail',-1234),(196,83,'DisplayName','Photo - Thumbnail',-1234),(197,84,'Description','Temporary claim to invoke email force password feature',-1234),(198,84,'DisplayName','Force Password Reset',-1234),(199,85,'Description','Title',-1234),(200,85,'DisplayName','Title',-1234),(201,86,'Description','Extended Ref',-1234),(202,86,'DisplayName','Extended Ref',-1234),(203,87,'ReadOnly','true',-1234),(204,87,'Description','Created timestamp of the user',-1234),(205,87,'DisplayName','Created Time',-1234),(206,88,'Description','Gender',-1234),(207,88,'DisplayName','Gender',-1234),(208,89,'ReadOnly','true',-1234),(209,89,'Description','Role',-1234),(210,89,'SupportedByDefault','true',-1234),(211,89,'DisplayName','Role',-1234),(212,90,'ReadOnly','true',-1234),(213,90,'Description','Account State',-1234),(214,90,'DisplayName','Account State',-1234),(215,91,'Description','Pager Number',-1234),(216,91,'DisplayName','Phone Numbers - Pager Number',-1234),(217,92,'ReadOnly','true',-1234),(218,92,'Description','End-User\'s gender. Values defined by this specification are female and male. Other values MAY be used when neither of the defined values are applicable.',-1234),(219,92,'SupportedByDefault','true',-1234),(220,92,'MappedLocalClaim','http://wso2.org/claims/gender',-1234),(221,92,'DisplayName','Gender',-1234),(222,93,'Description','Street Address',-1234),(223,93,'MappedLocalClaim','http://wso2.org/claims/streetaddress',-1234),(224,93,'DisplayName','Street Address',-1234),(225,94,'Description','Time Zone',-1234),(226,94,'DisplayOrder','2',-1234),(227,94,'Required','true',-1234),(228,94,'SupportedByDefault','true',-1234),(229,94,'MappedLocalClaim','http://wso2.org/claims/timeZone',-1234),(230,94,'DisplayName','Time Zone',-1234),(231,95,'Description','Manager - home',-1234),(232,95,'DisplayOrder','1',-1234),(233,95,'Required','true',-1234),(234,95,'SupportedByDefault','true',-1234),(235,95,'MappedLocalClaim','http://wso2.org/claims/gender',-1234),(236,95,'DisplayName','Manager - home',-1234),(237,96,'Description','Photo',-1234),(238,96,'DisplayOrder','5',-1234),(239,96,'SupportedByDefault','true',-1234),(240,96,'MappedLocalClaim','http://wso2.org/claims/photourl',-1234),(241,96,'DisplayName','Photo',-1234),(242,97,'Description','Date of Birth',-1234),(243,97,'DisplayOrder','6',-1234),(244,97,'SupportedByDefault','true',-1234),(245,97,'MappedLocalClaim','http://wso2.org/claims/dob',-1234),(246,97,'DisplayName','DOB',-1234),(247,98,'Description','Locality',-1234),(248,98,'DisplayOrder','2',-1234),(249,98,'Required','true',-1234),(250,98,'SupportedByDefault','true',-1234),(251,98,'MappedLocalClaim','http://wso2.org/claims/local',-1234),(252,98,'DisplayName','Locality',-1234),(253,99,'Description','Legal Person Name',-1234),(254,99,'DisplayOrder','1',-1234),(255,99,'Required','true',-1234),(256,99,'SupportedByDefault','true',-1234),(257,99,'MappedLocalClaim','http://wso2.org/claims/extendedDisplayName',-1234),(258,99,'DisplayName','Legal Person Name',-1234),(259,100,'Description','Given Name',-1234),(260,100,'DisplayOrder','1',-1234),(261,100,'Required','true',-1234),(262,100,'SupportedByDefault','true',-1234),(263,100,'MappedLocalClaim','http://wso2.org/claims/givenname',-1234),(264,100,'DisplayName','Name - Given Name',-1234),(265,101,'Description','Place of Birth',-1234),(266,101,'DisplayOrder','1',-1234),(267,101,'Required','true',-1234),(268,101,'SupportedByDefault','true',-1234),(269,101,'MappedLocalClaim','http://wso2.org/claims/country',-1234),(270,101,'DisplayName','Place of Birth',-1234),(271,102,'Description','Phone Numbers',-1234),(272,102,'DisplayOrder','3',-1234),(273,102,'Required','true',-1234),(274,102,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$',-1234),(275,102,'SupportedByDefault','true',-1234),(276,102,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers',-1234),(277,102,'DisplayName','Phone Numbers',-1234),(278,103,'Description','Organization -division',-1234),(279,103,'DisplayOrder','1',-1234),(280,103,'Required','true',-1234),(281,103,'SupportedByDefault','true',-1234),(282,103,'MappedLocalClaim','http://wso2.org/claims/organization',-1234),(283,103,'DisplayName','Organization -division',-1234),(284,104,'Description','Postalcode',-1234),(285,104,'DisplayOrder','4',-1234),(286,104,'SupportedByDefault','true',-1234),(287,104,'MappedLocalClaim','http://wso2.org/claims/postalcode',-1234),(288,104,'DisplayName','Postalcode',-1234),(289,105,'Description','Economic Operator Registration and Identification',-1234),(290,105,'DisplayOrder','1',-1234),(291,105,'Required','true',-1234),(292,105,'SupportedByDefault','true',-1234),(293,105,'MappedLocalClaim','http://wso2.org/claims/department',-1234),(294,105,'DisplayName','Economic Operator Registration and Identification',-1234),(295,106,'Description','Email Addresses',-1234),(296,106,'DisplayOrder','5',-1234),(297,106,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(298,106,'SupportedByDefault','true',-1234),(299,106,'MappedLocalClaim','http://wso2.org/claims/emailaddress',-1234),(300,106,'DisplayName','Emails',-1234),(301,107,'Description','Phone Numbers',-1234),(302,107,'DisplayOrder','5',-1234),(303,107,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$',-1234),(304,107,'SupportedByDefault','true',-1234),(305,107,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers',-1234),(306,107,'DisplayName','Phone Numbers',-1234),(307,108,'Description','Family Name',-1234),(308,108,'DisplayOrder','2',-1234),(309,108,'Required','true',-1234),(310,108,'SupportedByDefault','true',-1234),(311,108,'MappedLocalClaim','http://wso2.org/claims/lastname',-1234),(312,108,'DisplayName','Name - Family Name',-1234),(313,109,'Description','Photo',-1234),(314,109,'DisplayOrder','5',-1234),(315,109,'SupportedByDefault','true',-1234),(316,109,'MappedLocalClaim','http://wso2.org/claims/photourl',-1234),(317,109,'DisplayName','Photo',-1234),(318,110,'Description','Photo - Thumbnail',-1234),(319,110,'DisplayOrder','5',-1234),(320,110,'SupportedByDefault','true',-1234),(321,110,'MappedLocalClaim','http://wso2.org/claims/thumbnail',-1234),(322,110,'DisplayName','Photo - Thumbnail',-1234),(323,111,'Description','Country',-1234),(324,111,'DisplayOrder','5',-1234),(325,111,'SupportedByDefault','true',-1234),(326,111,'MappedLocalClaim','http://wso2.org/claims/country',-1234),(327,111,'DisplayName','Country',-1234),(328,112,'Description','True if the End-User\'s e-mail address has been verified; otherwise false. ',-1234),(329,112,'MappedLocalClaim','http://wso2.org/claims/identity/emailVerified',-1234),(330,112,'DisplayName','Email Verified',-1234),(331,113,'Description','Title',-1234),(332,113,'DisplayOrder','2',-1234),(333,113,'Required','true',-1234),(334,113,'SupportedByDefault','true',-1234),(335,113,'MappedLocalClaim','http://wso2.org/claims/title',-1234),(336,113,'DisplayName','Title',-1234),(337,114,'Description','User Type',-1234),(338,114,'DisplayOrder','2',-1234),(339,114,'Required','true',-1234),(340,114,'SupportedByDefault','true',-1234),(341,114,'MappedLocalClaim','http://wso2.org/claims/userType',-1234),(342,114,'DisplayName','User Type',-1234),(343,115,'Description','Home Email',-1234),(344,115,'DisplayOrder','5',-1234),(345,115,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(346,115,'SupportedByDefault','true',-1234),(347,115,'MappedLocalClaim','http://wso2.org/claims/emails.home',-1234),(348,115,'DisplayName','Emails - Home Email',-1234),(349,116,'Description','Active',-1234),(350,116,'DisplayOrder','2',-1234),(351,116,'Required','true',-1234),(352,116,'SupportedByDefault','true',-1234),(353,116,'MappedLocalClaim','http://wso2.org/claims/active',-1234),(354,116,'DisplayName','Active',-1234),(355,117,'Description','Pager Number',-1234),(356,117,'DisplayOrder','5',-1234),(357,117,'SupportedByDefault','true',-1234),(358,117,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.pager',-1234),(359,117,'DisplayName','Phone Numbers - Pager Number',-1234),(360,118,'Description','String from zoneinfo time zone database representing the End-User\'s time zone. For example, Europe/Paris or America/Los_Angeles.',-1234),(361,118,'MappedLocalClaim','http://wso2.org/claims/timeZone',-1234),(362,118,'DisplayName','Zone Info',-1234),(363,119,'Description','Honoric Suffix',-1234),(364,119,'DisplayOrder','2',-1234),(365,119,'Required','true',-1234),(366,119,'SupportedByDefault','true',-1234),(367,119,'MappedLocalClaim','http://wso2.org/claims/honorificSuffix',-1234),(368,119,'DisplayName','Name - Honoric Suffix',-1234),(369,120,'Description','Photo',-1234),(370,120,'DisplayOrder','5',-1234),(371,120,'SupportedByDefault','true',-1234),(372,120,'MappedLocalClaim','http://wso2.org/claims/photos',-1234),(373,120,'DisplayName','Photo',-1234),(374,121,'Description','Display Name',-1234),(375,121,'DisplayOrder','2',-1234),(376,121,'Required','true',-1234),(377,121,'SupportedByDefault','true',-1234),(378,121,'MappedLocalClaim','http://wso2.org/claims/displayName',-1234),(379,121,'DisplayName','Display Name',-1234),(380,122,'Description','URL of the End-User\'s profile picture. This URL MUST refer to an image file (for example, a PNG, JPEG, or GIF image file)',-1234),(381,122,'DisplayOrder','9',-1234),(382,122,'SupportedByDefault','true',-1234),(383,122,'MappedLocalClaim','http://wso2.org/claims/photourl',-1234),(384,122,'DisplayName','Picture',-1234),(385,123,'Description','Meta - Last Modified',-1234),(386,123,'DisplayOrder','1',-1234),(387,123,'Required','true',-1234),(388,123,'SupportedByDefault','true',-1234),(389,123,'MappedLocalClaim','http://wso2.org/claims/modified',-1234),(390,123,'DisplayName','Meta - Last Modified',-1234),(391,124,'Description','X509Certificates',-1234),(392,124,'DisplayOrder','5',-1234),(393,124,'SupportedByDefault','true',-1234),(394,124,'MappedLocalClaim','http://wso2.org/claims/x509Certificates',-1234),(395,124,'DisplayName','X509Certificates',-1234),(396,125,'Description','Formatted Name',-1234),(397,125,'DisplayOrder','2',-1234),(398,125,'Required','true',-1234),(399,125,'SupportedByDefault','true',-1234),(400,125,'MappedLocalClaim','http://wso2.org/claims/formattedName',-1234),(401,125,'DisplayName','Name - Formatted Name',-1234),(402,126,'Description','Groups',-1234),(403,126,'DisplayOrder','5',-1234),(404,126,'SupportedByDefault','true',-1234),(405,126,'MappedLocalClaim','http://wso2.org/claims/groups',-1234),(406,126,'DisplayName','Groups',-1234),(407,127,'Description','Home Phone',-1234),(408,127,'DisplayOrder','5',-1234),(409,127,'SupportedByDefault','true',-1234),(410,127,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.home',-1234),(411,127,'DisplayName','Phone Numbers - Home Phone Number',-1234),(412,128,'Description','External Id',-1234),(413,128,'DisplayOrder','1',-1234),(414,128,'Required','true',-1234),(415,128,'SupportedByDefault','true',-1234),(416,128,'MappedLocalClaim','http://wso2.org/claims/externalid',-1234),(417,128,'DisplayName','External Id',-1234),(418,129,'Description','Roles',-1234),(419,129,'DisplayOrder','5',-1234),(420,129,'SupportedByDefault','true',-1234),(421,129,'MappedLocalClaim','http://wso2.org/claims/role',-1234),(422,129,'DisplayName','Roles',-1234),(423,130,'Description','Entitlements',-1234),(424,130,'DisplayOrder','5',-1234),(425,130,'SupportedByDefault','true',-1234),(426,130,'MappedLocalClaim','http://wso2.org/claims/entitlements',-1234),(427,130,'DisplayName','Entitlements',-1234),(428,131,'Description','Locality',-1234),(429,131,'MappedLocalClaim','http://wso2.org/claims/locality',-1234),(430,131,'DisplayName','Locality',-1234),(431,132,'Description','Time Zone',-1234),(432,132,'DisplayOrder','9',-1234),(433,132,'SupportedByDefault','true',-1234),(434,132,'MappedLocalClaim','http://wso2.org/claims/timeZone',-1234),(435,132,'DisplayName','Time Zone',-1234),(436,133,'Description','Address',-1234),(437,133,'DisplayOrder','5',-1234),(438,133,'SupportedByDefault','true',-1234),(439,133,'MappedLocalClaim','http://wso2.org/claims/addresses',-1234),(440,133,'DisplayName','Address',-1234),(441,134,'Description','Current Family Name',-1234),(442,134,'DisplayOrder','1',-1234),(443,134,'Required','true',-1234),(444,134,'SupportedByDefault','true',-1234),(445,134,'MappedLocalClaim','http://wso2.org/claims/lastname',-1234),(446,134,'DisplayName','Current Family Name',-1234),(447,135,'Description','Shorthand name by which the End-User wishes to be referred to at the RP, such as janedoe or j.doe.',-1234),(448,135,'DisplayOrder','7',-1234),(449,135,'SupportedByDefault','true',-1234),(450,135,'MappedLocalClaim','http://wso2.org/claims/displayName',-1234),(451,135,'DisplayName','Preferred Username',-1234),(452,136,'Description','Middle name(s) of the End-User. Note that in some cultures, people can have multiple middle names; all can be present, with the names being separated by space characters. Also note that in some cultures, middle names are not used.',-1234),(453,136,'DisplayOrder','5',-1234),(454,136,'SupportedByDefault','true',-1234),(455,136,'MappedLocalClaim','http://wso2.org/claims/middleName',-1234),(456,136,'DisplayName','Middle Name',-1234),(457,137,'Description','Employee Number',-1234),(458,137,'DisplayOrder','1',-1234),(459,137,'Required','true',-1234),(460,137,'SupportedByDefault','true',-1234),(461,137,'MappedLocalClaim','http://wso2.org/claims/extendedExternalId',-1234),(462,137,'DisplayName','Employee Number',-1234),(463,138,'Description','External Id',-1234),(464,138,'DisplayOrder','1',-1234),(465,138,'Required','true',-1234),(466,138,'SupportedByDefault','true',-1234),(467,138,'MappedLocalClaim','http://wso2.org/claims/externalid',-1234),(468,138,'DisplayName','External Id',-1234),(469,139,'Description','Language',-1234),(470,139,'SupportedByDefault','true',-1234),(471,139,'MappedLocalClaim','http://wso2.org/claims/preferredLanguage',-1234),(472,139,'DisplayName','Language',-1234),(473,140,'Description','Address - Formatted',-1234),(474,140,'DisplayOrder','5',-1234),(475,140,'SupportedByDefault','true',-1234),(476,140,'MappedLocalClaim','http://wso2.org/claims/addresses.formatted',-1234),(477,140,'DisplayName','Address - Formatted',-1234),(478,141,'Description','User Name',-1234),(479,141,'DisplayOrder','2',-1234),(480,141,'Required','true',-1234),(481,141,'SupportedByDefault','true',-1234),(482,141,'MappedLocalClaim','http://wso2.org/claims/username',-1234),(483,141,'DisplayName','User Name',-1234),(484,142,'Description','Time Zone',-1234),(485,142,'DisplayOrder','2',-1234),(486,142,'Required','true',-1234),(487,142,'SupportedByDefault','true',-1234),(488,142,'MappedLocalClaim','http://wso2.org/claims/timeZone',-1234),(489,142,'DisplayName','Time Zone',-1234),(490,143,'Description','Honoric Suffix',-1234),(491,143,'DisplayOrder','2',-1234),(492,143,'Required','true',-1234),(493,143,'SupportedByDefault','true',-1234),(494,143,'MappedLocalClaim','http://wso2.org/claims/honorificSuffix',-1234),(495,143,'DisplayName','Name - Honoric Suffix',-1234),(496,144,'Description','State',-1234),(497,144,'MappedLocalClaim','http://wso2.org/claims/stateorprovince',-1234),(498,144,'DisplayName','State',-1234),(499,145,'Description','Legal Person Identifier',-1234),(500,145,'DisplayOrder','1',-1234),(501,145,'Required','true',-1234),(502,145,'SupportedByDefault','true',-1234),(503,145,'MappedLocalClaim','http://wso2.org/claims/extendedExternalId',-1234),(504,145,'DisplayName','Legal Person Identifier',-1234),(505,146,'Description','Gender',-1234),(506,146,'DisplayOrder','8',-1234),(507,146,'SupportedByDefault','true',-1234),(508,146,'MappedLocalClaim','http://wso2.org/claims/gender',-1234),(509,146,'DisplayName','Gender',-1234),(510,147,'Description','Language',-1234),(511,147,'DisplayOrder','7',-1234),(512,147,'SupportedByDefault','true',-1234),(513,147,'MappedLocalClaim','http://wso2.org/claims/preferredLanguage',-1234),(514,147,'DisplayName','Language',-1234),(515,148,'Description','Identifier for the End-User at the Issuer',-1234),(516,148,'DisplayOrder','1',-1234),(517,148,'Required','true',-1234),(518,148,'SupportedByDefault','true',-1234),(519,148,'MappedLocalClaim','http://wso2.org/claims/username',-1234),(520,148,'DisplayName','Subject',-1234),(521,149,'Description','User Name',-1234),(522,149,'DisplayOrder','2',-1234),(523,149,'Required','true',-1234),(524,149,'SupportedByDefault','true',-1234),(525,149,'MappedLocalClaim','http://wso2.org/claims/username',-1234),(526,149,'DisplayName','User Name',-1234),(527,150,'Description','Nick Name',-1234),(528,150,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(529,150,'DisplayName','Nick Name',-1234),(530,151,'Description','Casual name of the End-User that may or may not be the same as the given_name. For instance, a nickname value of Mike might be returned alongside a given_name value of Michael.',-1234),(531,151,'DisplayOrder','6',-1234),(532,151,'Required','true',-1234),(533,151,'SupportedByDefault','true',-1234),(534,151,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(535,151,'DisplayName','Nickname',-1234),(536,152,'Description','Tax Reference',-1234),(537,152,'DisplayOrder','1',-1234),(538,152,'Required','true',-1234),(539,152,'SupportedByDefault','true',-1234),(540,152,'MappedLocalClaim','http://wso2.org/claims/postalcode',-1234),(541,152,'DisplayName','Tax Reference',-1234),(542,153,'Description','Postalcode',-1234),(543,153,'SupportedByDefault','true',-1234),(544,153,'MappedLocalClaim','http://wso2.org/claims/postalcode',-1234),(545,153,'DisplayName','Postalcode',-1234),(546,154,'Description','Meta - Location',-1234),(547,154,'DisplayOrder','1',-1234),(548,154,'Required','true',-1234),(549,154,'SupportedByDefault','true',-1234),(550,154,'MappedLocalClaim','http://wso2.org/claims/resourceType',-1234),(551,154,'DisplayName','Meta - Location',-1234),(552,155,'Description','IM - Skype',-1234),(553,155,'DisplayOrder','5',-1234),(554,155,'SupportedByDefault','true',-1234),(555,155,'MappedLocalClaim','http://wso2.org/claims/skype',-1234),(556,155,'DisplayName','IM - Skype',-1234),(557,156,'Description','Preferred Language',-1234),(558,156,'DisplayOrder','2',-1234),(559,156,'Required','true',-1234),(560,156,'SupportedByDefault','true',-1234),(561,156,'MappedLocalClaim','http://wso2.org/claims/preferredLanguage',-1234),(562,156,'DisplayName','Preferred Language',-1234),(563,157,'Description','Other Phone Number',-1234),(564,157,'DisplayOrder','5',-1234),(565,157,'SupportedByDefault','true',-1234),(566,157,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.other',-1234),(567,157,'DisplayName','Phone Numbers - Other',-1234),(568,158,'Description','Current Given Name',-1234),(569,158,'DisplayOrder','1',-1234),(570,158,'Required','true',-1234),(571,158,'SupportedByDefault','true',-1234),(572,158,'MappedLocalClaim','http://wso2.org/claims/givenname',-1234),(573,158,'DisplayName','Current Given Name',-1234),(574,159,'Description','Middle Name',-1234),(575,159,'DisplayOrder','2',-1234),(576,159,'Required','true',-1234),(577,159,'SupportedByDefault','true',-1234),(578,159,'MappedLocalClaim','http://wso2.org/claims/middleName',-1234),(579,159,'DisplayName','Name - Middle Name',-1234),(580,160,'Description','Address - Work',-1234),(581,160,'DisplayOrder','5',-1234),(582,160,'SupportedByDefault','true',-1234),(583,160,'MappedLocalClaim','http://wso2.org/claims/region',-1234),(584,160,'DisplayName','Address - Work',-1234),(585,161,'Description','Mobile',-1234),(586,161,'MappedLocalClaim','http://wso2.org/claims/mobile',-1234),(587,161,'DisplayName','Mobile',-1234),(588,162,'Description','Full Name',-1234),(589,162,'DisplayOrder','2',-1234),(590,162,'Required','true',-1234),(591,162,'SupportedByDefault','true',-1234),(592,162,'MappedLocalClaim','http://wso2.org/claims/fullname',-1234),(593,162,'DisplayName','Full Name',-1234),(594,163,'Description','Last Name',-1234),(595,163,'Required','true',-1234),(596,163,'SupportedByDefault','true',-1234),(597,163,'MappedLocalClaim','http://wso2.org/claims/lastname',-1234),(598,163,'DisplayName','Last Name',-1234),(599,164,'Description','First Name',-1234),(600,164,'Required','true',-1234),(601,164,'SupportedByDefault','true',-1234),(602,164,'MappedLocalClaim','http://wso2.org/claims/givenname',-1234),(603,164,'DisplayName','First Name',-1234),(604,165,'Description','Email Address',-1234),(605,165,'DisplayOrder','3',-1234),(606,165,'Required','true',-1234),(607,165,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(608,165,'SupportedByDefault','true',-1234),(609,165,'MappedLocalClaim','http://wso2.org/claims/emailaddress',-1234),(610,165,'DisplayName','Email',-1234),(611,166,'Description','Gender',-1234),(612,166,'MappedLocalClaim','http://wso2.org/claims/gender',-1234),(613,166,'DisplayName','Gender',-1234),(614,167,'Description','Address - Region',-1234),(615,167,'DisplayOrder','5',-1234),(616,167,'SupportedByDefault','true',-1234),(617,167,'MappedLocalClaim','http://wso2.org/claims/region',-1234),(618,167,'DisplayName','Address - Region',-1234),(619,168,'Description','Meta - Location',-1234),(620,168,'DisplayOrder','1',-1234),(621,168,'Required','true',-1234),(622,168,'SupportedByDefault','true',-1234),(623,168,'MappedLocalClaim','http://wso2.org/claims/location',-1234),(624,168,'DisplayName','Meta - Location',-1234),(625,169,'Description','Home Email',-1234),(626,169,'DisplayOrder','5',-1234),(627,169,'SupportedByDefault','true',-1234),(628,169,'MappedLocalClaim','http://wso2.org/claims/emails.home',-1234),(629,169,'DisplayName','Emails - Home Email',-1234),(630,170,'Description','Meta - Last Modified',-1234),(631,170,'DisplayOrder','1',-1234),(632,170,'Required','true',-1234),(633,170,'SupportedByDefault','true',-1234),(634,170,'MappedLocalClaim','http://wso2.org/claims/modified',-1234),(635,170,'DisplayName','Meta - Last Modified',-1234),(636,171,'Description','Profile URL',-1234),(637,171,'DisplayOrder','2',-1234),(638,171,'Required','true',-1234),(639,171,'SupportedByDefault','true',-1234),(640,171,'MappedLocalClaim','http://wso2.org/claims/url',-1234),(641,171,'DisplayName','Profile URL',-1234),(642,172,'Description','Date of Birth',-1234),(643,172,'MappedLocalClaim','http://wso2.org/claims/dob',-1234),(644,172,'DisplayName','DOB',-1234),(645,173,'Description','Family Name',-1234),(646,173,'DisplayOrder','2',-1234),(647,173,'Required','true',-1234),(648,173,'SupportedByDefault','true',-1234),(649,173,'MappedLocalClaim','http://wso2.org/claims/lastname',-1234),(650,173,'DisplayName','Name - Family Name',-1234),(651,174,'Description','Meta - Version',-1234),(652,174,'DisplayOrder','1',-1234),(653,174,'Required','true',-1234),(654,174,'SupportedByDefault','true',-1234),(655,174,'MappedLocalClaim','http://wso2.org/claims/im',-1234),(656,174,'DisplayName','Meta - Version',-1234),(657,175,'Description','X509Certificates',-1234),(658,175,'DisplayOrder','5',-1234),(659,175,'SupportedByDefault','true',-1234),(660,175,'MappedLocalClaim','http://wso2.org/claims/x509Certificates',-1234),(661,175,'DisplayName','X509Certificates',-1234),(662,176,'Description','IM',-1234),(663,176,'DisplayOrder','5',-1234),(664,176,'SupportedByDefault','true',-1234),(665,176,'MappedLocalClaim','http://wso2.org/claims/im',-1234),(666,176,'DisplayName','IMS',-1234),(667,177,'Description','URL of the End-User\'s profile page. The contents of this Web page SHOULD be about the End-User.',-1234),(668,177,'DisplayOrder','8',-1234),(669,177,'SupportedByDefault','true',-1234),(670,177,'MappedLocalClaim','http://wso2.org/claims/url',-1234),(671,177,'DisplayName','Profile',-1234),(672,178,'Description','Meta - Created',-1234),(673,178,'DisplayOrder','1',-1234),(674,178,'Required','true',-1234),(675,178,'SupportedByDefault','true',-1234),(676,178,'MappedLocalClaim','http://wso2.org/claims/created',-1234),(677,178,'DisplayName','Meta - Created',-1234),(678,179,'Description','True if the End-User\'s phone number has been verified; otherwise false.',-1234),(679,179,'MappedLocalClaim','http://wso2.org/claims/identity/phoneVerified',-1234),(680,179,'DisplayName','Phone Number Verified',-1234),(681,180,'Description','Legal Person Address',-1234),(682,180,'DisplayOrder','1',-1234),(683,180,'Required','true',-1234),(684,180,'SupportedByDefault','true',-1234),(685,180,'MappedLocalClaim','http://wso2.org/claims/addresses',-1234),(686,180,'DisplayName','Legal Person Address',-1234),(687,181,'Description','IM - Skype',-1234),(688,181,'DisplayOrder','5',-1234),(689,181,'SupportedByDefault','true',-1234),(690,181,'MappedLocalClaim','http://wso2.org/claims/skype',-1234),(691,181,'DisplayName','IM - Skype',-1234),(692,182,'Description','Birth Name',-1234),(693,182,'DisplayOrder','1',-1234),(694,182,'Required','true',-1234),(695,182,'SupportedByDefault','true',-1234),(696,182,'MappedLocalClaim','http://wso2.org/claims/username',-1234),(697,182,'DisplayName','Birth Name',-1234),(698,183,'Description','Country',-1234),(699,183,'SupportedByDefault','true',-1234),(700,183,'MappedLocalClaim','http://wso2.org/claims/country',-1234),(701,183,'DisplayName','Country',-1234),(702,184,'Description','LEI',-1234),(703,184,'DisplayOrder','1',-1234),(704,184,'Required','true',-1234),(705,184,'SupportedByDefault','true',-1234),(706,184,'MappedLocalClaim','http://wso2.org/claims/extendedRef',-1234),(707,184,'DisplayName','LEI',-1234),(708,185,'Description','Work Phone',-1234),(709,185,'DisplayOrder','5',-1234),(710,185,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$',-1234),(711,185,'SupportedByDefault','true',-1234),(712,185,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.work',-1234),(713,185,'DisplayName','Phone Numbers - Work Phone Number',-1234),(714,186,'Description','Zip code or postal code component.',-1234),(715,186,'MappedLocalClaim','http://wso2.org/claims/postalcode',-1234),(716,186,'DisplayName','Postal Code',-1234),(717,187,'Description','Work Email',-1234),(718,187,'DisplayOrder','5',-1234),(719,187,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(720,187,'SupportedByDefault','true',-1234),(721,187,'MappedLocalClaim','http://wso2.org/claims/emails.work',-1234),(722,187,'DisplayName','Emails - Work Email',-1234),(723,188,'Description','Address - Country',-1234),(724,188,'DisplayOrder','5',-1234),(725,188,'SupportedByDefault','true',-1234),(726,188,'MappedLocalClaim','http://wso2.org/claims/country',-1234),(727,188,'DisplayName','Address - Country',-1234),(728,189,'Description','List of group names that have been assigned to the principal. This typically will require a mapping at the application container level to application deployment roles.',-1234),(729,189,'DisplayOrder','12',-1234),(730,189,'SupportedByDefault','true',-1234),(731,189,'MappedLocalClaim','http://wso2.org/claims/role',-1234),(732,189,'DisplayName','User Groups',-1234),(733,190,'Description','Other Email',-1234),(734,190,'DisplayOrder','5',-1234),(735,190,'SupportedByDefault','true',-1234),(736,190,'MappedLocalClaim','http://wso2.org/claims/emails.other',-1234),(737,190,'DisplayName','Emails - Other Email',-1234),(738,191,'Description','True if the End-User\'s phone number has been verified; otherwise false. ',-1234),(739,191,'MappedLocalClaim','http://wso2.org/claims/addresses',-1234),(740,191,'DisplayName','Address',-1234),(741,192,'Description','Work Phone',-1234),(742,192,'DisplayOrder','5',-1234),(743,192,'SupportedByDefault','true',-1234),(744,192,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.work',-1234),(745,192,'DisplayName','Phone Numbers - Work Phone Number',-1234),(746,193,'Description','Last Name',-1234),(747,193,'Required','true',-1234),(748,193,'SupportedByDefault','true',-1234),(749,193,'MappedLocalClaim','http://wso2.org/claims/lastname',-1234),(750,193,'DisplayName','Last Name',-1234),(751,194,'Description','PPID',-1234),(752,194,'Required','true',-1234),(753,194,'SupportedByDefault','true',-1234),(754,194,'MappedLocalClaim','http://wso2.org/claims/im',-1234),(755,194,'DisplayName','0',-1234),(756,195,'Description','Mobile Number',-1234),(757,195,'DisplayOrder','5',-1234),(758,195,'SupportedByDefault','true',-1234),(759,195,'MappedLocalClaim','http://wso2.org/claims/mobile',-1234),(760,195,'DisplayName','Phone Numbers - Mobile Number',-1234),(761,196,'Description','EU Identifier',-1234),(762,196,'DisplayOrder','1',-1234),(763,196,'Required','true',-1234),(764,196,'SupportedByDefault','true',-1234),(765,196,'MappedLocalClaim','http://wso2.org/claims/externalid',-1234),(766,196,'DisplayName','EU Identifier',-1234),(767,197,'Description','Active',-1234),(768,197,'DisplayOrder','2',-1234),(769,197,'Required','true',-1234),(770,197,'SupportedByDefault','true',-1234),(771,197,'MappedLocalClaim','http://wso2.org/claims/active',-1234),(772,197,'DisplayName','Active',-1234),(773,198,'Description','Country name component',-1234),(774,198,'MappedLocalClaim','http://wso2.org/claims/country',-1234),(775,198,'DisplayName','Country',-1234),(776,199,'Description','Meta - Location',-1234),(777,199,'DisplayOrder','1',-1234),(778,199,'Required','true',-1234),(779,199,'SupportedByDefault','true',-1234),(780,199,'MappedLocalClaim','http://wso2.org/claims/location',-1234),(781,199,'DisplayName','Meta - Location',-1234),(782,200,'Description','Manager - home',-1234),(783,200,'DisplayOrder','1',-1234),(784,200,'Required','true',-1234),(785,200,'SupportedByDefault','true',-1234),(786,200,'MappedLocalClaim','http://wso2.org/claims/extendedRef',-1234),(787,200,'DisplayName','Manager - home',-1234),(788,201,'Description','Temporary claim to invoke email verified feature',-1234),(789,201,'DisplayOrder','1',-1234),(790,201,'Required','true',-1234),(791,201,'SupportedByDefault','true',-1234),(792,201,'MappedLocalClaim','http://wso2.org/claims/identity/verifyEmail',-1234),(793,201,'DisplayName','Verify Email',-1234),(794,202,'Description','Address',-1234),(795,202,'DisplayOrder','5',-1234),(796,202,'SupportedByDefault','true',-1234),(797,202,'MappedLocalClaim','http://wso2.org/claims/addresses',-1234),(798,202,'DisplayName','Address',-1234),(799,203,'Description','Temporary claim to invoke email ask Password feature',-1234),(800,203,'DisplayOrder','1',-1234),(801,203,'Required','true',-1234),(802,203,'SupportedByDefault','true',-1234),(803,203,'MappedLocalClaim','http://wso2.org/claims/identity/askPassword',-1234),(804,203,'DisplayName','Ask Password',-1234),(805,204,'Description','Full mailing address, formatted for display or use on a mailing label. This field MAY contain multiple lines, separated by newlines.',-1234),(806,204,'MappedLocalClaim','http://wso2.org/claims/addresses.formatted',-1234),(807,204,'DisplayName','Address Formatted',-1234),(808,205,'Description','Manager - home',-1234),(809,205,'DisplayOrder','1',-1234),(810,205,'Required','true',-1234),(811,205,'SupportedByDefault','true',-1234),(812,205,'MappedLocalClaim','http://wso2.org/claims/stateorprovince',-1234),(813,205,'DisplayName','Manager - home',-1234),(814,206,'Description','System for Exchange of Excise Data Identifier',-1234),(815,206,'DisplayOrder','1',-1234),(816,206,'Required','true',-1234),(817,206,'SupportedByDefault','true',-1234),(818,206,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(819,206,'DisplayName','System for Exchange of Excise Data Identifier',-1234),(820,207,'Description','Postalcode',-1234),(821,207,'SupportedByDefault','true',-1234),(822,207,'MappedLocalClaim','http://wso2.org/claims/postalcode',-1234),(823,207,'DisplayName','Postalcode',-1234),(824,208,'Description','End-User\'s preferred e-mail address.',-1234),(825,208,'MappedLocalClaim','http://wso2.org/claims/emailaddress',-1234),(826,208,'DisplayName','Email',-1234),(827,209,'Description','Photo - Thumbnail',-1234),(828,209,'DisplayOrder','5',-1234),(829,209,'SupportedByDefault','true',-1234),(830,209,'MappedLocalClaim','http://wso2.org/claims/thumbnail',-1234),(831,209,'DisplayName','Photo - Thumbnail',-1234),(832,210,'Description','Nick Name',-1234),(833,210,'DisplayOrder','1',-1234),(834,210,'Required','true',-1234),(835,210,'SupportedByDefault','true',-1234),(836,210,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(837,210,'DisplayName','Nick Name',-1234),(838,211,'Description','The user principal name',-1234),(839,211,'DisplayOrder','11',-1234),(840,211,'SupportedByDefault','true',-1234),(841,211,'MappedLocalClaim','http://wso2.org/claims/userprincipal',-1234),(842,211,'DisplayName','User Principal',-1234),(843,212,'Description','Honoric Prefix',-1234),(844,212,'DisplayOrder','2',-1234),(845,212,'Required','true',-1234),(846,212,'SupportedByDefault','true',-1234),(847,212,'MappedLocalClaim','http://wso2.org/claims/honorificPrefix',-1234),(848,212,'DisplayName','Name - Honoric Prefix',-1234),(849,213,'Description','Locality',-1234),(850,213,'DisplayOrder','2',-1234),(851,213,'Required','true',-1234),(852,213,'SupportedByDefault','true',-1234),(853,213,'MappedLocalClaim','http://wso2.org/claims/local',-1234),(854,213,'DisplayName','Locality',-1234),(855,214,'Description','IM - Gtalk',-1234),(856,214,'DisplayOrder','5',-1234),(857,214,'SupportedByDefault','true',-1234),(858,214,'MappedLocalClaim','http://wso2.org/claims/gtalk',-1234),(859,214,'DisplayName','IM - Gtalk',-1234),(860,215,'Description','Address - Postal Code',-1234),(861,215,'DisplayOrder','5',-1234),(862,215,'SupportedByDefault','true',-1234),(863,215,'MappedLocalClaim','http://wso2.org/claims/postalcode',-1234),(864,215,'DisplayName','Address - Postal Code',-1234),(865,216,'Description','Person Identifier',-1234),(866,216,'DisplayOrder','1',-1234),(867,216,'Required','true',-1234),(868,216,'SupportedByDefault','true',-1234),(869,216,'MappedLocalClaim','http://wso2.org/claims/userid',-1234),(870,216,'DisplayName','Person Identifier',-1234),(871,217,'Description','Given name(s) or first name(s) of the End-User. Note that in some cultures, people can have multiple given names; all can be present, with the names being separated by space characters.',-1234),(872,217,'DisplayOrder','3',-1234),(873,217,'SupportedByDefault','true',-1234),(874,217,'MappedLocalClaim','http://wso2.org/claims/givenname',-1234),(875,217,'DisplayName','Given Name',-1234),(876,218,'Description','First Name',-1234),(877,218,'Required','true',-1234),(878,218,'SupportedByDefault','true',-1234),(879,218,'MappedLocalClaim','http://wso2.org/claims/givenname',-1234),(880,218,'DisplayName','First Name',-1234),(881,219,'Description','City or locality component.',-1234),(882,219,'MappedLocalClaim','http://wso2.org/claims/locality',-1234),(883,219,'DisplayName','Locality',-1234),(884,220,'Description','Preferred Language',-1234),(885,220,'DisplayOrder','2',-1234),(886,220,'Required','true',-1234),(887,220,'SupportedByDefault','true',-1234),(888,220,'MappedLocalClaim','http://wso2.org/claims/preferredLanguage',-1234),(889,220,'DisplayName','Preferred Language',-1234),(890,221,'Description','Gender',-1234),(891,221,'SupportedByDefault','true',-1234),(892,221,'MappedLocalClaim','http://wso2.org/claims/gender',-1234),(893,221,'DisplayName','Gender',-1234),(894,222,'Description','Time Zone',-1234),(895,222,'MappedLocalClaim','http://wso2.org/claims/timeZone',-1234),(896,222,'DisplayName','Time Zone',-1234),(897,223,'Description','Title',-1234),(898,223,'DisplayOrder','2',-1234),(899,223,'Required','true',-1234),(900,223,'SupportedByDefault','true',-1234),(901,223,'MappedLocalClaim','http://wso2.org/claims/title',-1234),(902,223,'DisplayName','Title',-1234),(903,224,'Description','Home Phone',-1234),(904,224,'SupportedByDefault','true',-1234),(905,224,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.home',-1234),(906,224,'DisplayName','Home Phone',-1234),(907,225,'Description','State, province, prefecture, or region component.',-1234),(908,225,'MappedLocalClaim','http://wso2.org/claims/region',-1234),(909,225,'DisplayName','One Time Password',-1234),(910,226,'Description','Surname(s) or last name(s) of the End-User. Note that in some cultures, people can have multiple family names or no family name; all can be present, with the names being separated by space characters.',-1234),(911,226,'DisplayOrder','4',-1234),(912,226,'SupportedByDefault','true',-1234),(913,226,'MappedLocalClaim','http://wso2.org/claims/lastname',-1234),(914,226,'DisplayName','Surname',-1234),(915,227,'Description','Other Email',-1234),(916,227,'DisplayOrder','5',-1234),(917,227,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(918,227,'SupportedByDefault','true',-1234),(919,227,'MappedLocalClaim','http://wso2.org/claims/emails.other',-1234),(920,227,'DisplayName','Emails - Other Email',-1234),(921,228,'Description','Cost Center',-1234),(922,228,'DisplayOrder','1',-1234),(923,228,'Required','true',-1234),(924,228,'SupportedByDefault','true',-1234),(925,228,'MappedLocalClaim','http://wso2.org/claims/costCenter',-1234),(926,228,'DisplayName','Cost Center',-1234),(927,229,'Description','Other Phone Number',-1234),(928,229,'DisplayOrder','5',-1234),(929,229,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$',-1234),(930,229,'SupportedByDefault','true',-1234),(931,229,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.other',-1234),(932,229,'DisplayName','Phone Numbers - Other',-1234),(933,230,'Description','Address - Street',-1234),(934,230,'DisplayOrder','5',-1234),(935,230,'SupportedByDefault','true',-1234),(936,230,'MappedLocalClaim','http://wso2.org/claims/streetaddress',-1234),(937,230,'DisplayName','Address - Street',-1234),(938,231,'Description','Id',-1234),(939,231,'DisplayOrder','1',-1234),(940,231,'Required','true',-1234),(941,231,'SupportedByDefault','true',-1234),(942,231,'MappedLocalClaim','http://wso2.org/claims/userid',-1234),(943,231,'DisplayName','Id',-1234),(944,232,'Description','Photo',-1234),(945,232,'DisplayOrder','5',-1234),(946,232,'SupportedByDefault','true',-1234),(947,232,'MappedLocalClaim','http://wso2.org/claims/photos',-1234),(948,232,'DisplayName','Photo',-1234),(949,233,'Description','Groups',-1234),(950,233,'DisplayOrder','5',-1234),(951,233,'SupportedByDefault','true',-1234),(952,233,'MappedLocalClaim','http://wso2.org/claims/groups',-1234),(953,233,'DisplayName','Groups',-1234),(954,234,'Description','Address - Home',-1234),(955,234,'DisplayOrder','5',-1234),(956,234,'SupportedByDefault','true',-1234),(957,234,'MappedLocalClaim','http://wso2.org/claims/addresses.locality',-1234),(958,234,'DisplayName','Address - Home',-1234),(959,235,'Description','Honoric Prefix',-1234),(960,235,'DisplayOrder','2',-1234),(961,235,'Required','true',-1234),(962,235,'SupportedByDefault','true',-1234),(963,235,'MappedLocalClaim','http://wso2.org/claims/honorificPrefix',-1234),(964,235,'DisplayName','Name - Honoric Prefix',-1234),(965,236,'Description','Address - Locality',-1234),(966,236,'DisplayOrder','5',-1234),(967,236,'SupportedByDefault','true',-1234),(968,236,'MappedLocalClaim','http://wso2.org/claims/addresses.locality',-1234),(969,236,'DisplayName','Address - Locality',-1234),(970,237,'Description','Middle Name',-1234),(971,237,'DisplayOrder','2',-1234),(972,237,'Required','true',-1234),(973,237,'SupportedByDefault','true',-1234),(974,237,'MappedLocalClaim','http://wso2.org/claims/middleName',-1234),(975,237,'DisplayName','Name - Middle Name',-1234),(976,238,'Description','Entitlements',-1234),(977,238,'DisplayOrder','5',-1234),(978,238,'SupportedByDefault','true',-1234),(979,238,'MappedLocalClaim','http://wso2.org/claims/entitlements',-1234),(980,238,'DisplayName','Entitlements',-1234),(981,239,'Description','Display Name',-1234),(982,239,'DisplayOrder','2',-1234),(983,239,'Required','true',-1234),(984,239,'SupportedByDefault','true',-1234),(985,239,'MappedLocalClaim','http://wso2.org/claims/displayName',-1234),(986,239,'DisplayName','Display Name',-1234),(987,240,'Description','Meta - Created',-1234),(988,240,'DisplayOrder','1',-1234),(989,240,'Required','true',-1234),(990,240,'SupportedByDefault','true',-1234),(991,240,'MappedLocalClaim','http://wso2.org/claims/created',-1234),(992,240,'DisplayName','Meta - Created',-1234),(993,241,'Description','End-User\'s full name in displayable form including all name parts, possibly including titles and suffixes, ordered according to the End-User\'s locale and preferences',-1234),(994,241,'DisplayOrder','2',-1234),(995,241,'Required','true',-1234),(996,241,'SupportedByDefault','true',-1234),(997,241,'MappedLocalClaim','http://wso2.org/claims/fullname',-1234),(998,241,'DisplayName','Full Name',-1234),(999,242,'Description','End-User\'s locale, For example, en-US or fr-CA, en_US',-1234),(1000,242,'MappedLocalClaim','http://wso2.org/claims/local',-1234),(1001,242,'DisplayName','Locale',-1234),(1002,243,'Description','VAT Registration Number',-1234),(1003,243,'DisplayOrder','1',-1234),(1004,243,'Required','true',-1234),(1005,243,'SupportedByDefault','true',-1234),(1006,243,'MappedLocalClaim','http://wso2.org/claims/im',-1234),(1007,243,'DisplayName','VAT Registration Number',-1234),(1008,244,'Description','IM - Gtalk',-1234),(1009,244,'DisplayOrder','5',-1234),(1010,244,'SupportedByDefault','true',-1234),(1011,244,'MappedLocalClaim','http://wso2.org/claims/gtalk',-1234),(1012,244,'DisplayName','IM - Gtalk',-1234),(1013,245,'Description','Email Address',-1234),(1014,245,'Required','true',-1234),(1015,245,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(1016,245,'SupportedByDefault','true',-1234),(1017,245,'MappedLocalClaim','http://wso2.org/claims/emailaddress',-1234),(1018,245,'DisplayName','Email',-1234),(1019,246,'Description','Other Phone',-1234),(1020,246,'MappedLocalClaim','http://wso2.org/claims/otherphone',-1234),(1021,246,'DisplayName','Other Phone',-1234),(1022,247,'Description','Date of birth',-1234),(1023,247,'DisplayOrder','1',-1234),(1024,247,'Required','true',-1234),(1025,247,'SupportedByDefault','true',-1234),(1026,247,'MappedLocalClaim','http://wso2.org/claims/dob',-1234),(1027,247,'DisplayName','Date of birth',-1234),(1028,248,'Description','User Type',-1234),(1029,248,'DisplayOrder','2',-1234),(1030,248,'Required','true',-1234),(1031,248,'SupportedByDefault','true',-1234),(1032,248,'MappedLocalClaim','http://wso2.org/claims/userType',-1234),(1033,248,'DisplayName','User Type',-1234),(1034,249,'Description','Manager - Display Name',-1234),(1035,249,'DisplayOrder','1',-1234),(1036,249,'Required','true',-1234),(1037,249,'SupportedByDefault','true',-1234),(1038,249,'MappedLocalClaim','http://wso2.org/claims/extendedDisplayName',-1234),(1039,249,'DisplayName','Manager - Display Name',-1234),(1040,250,'Description','Full street address component, which MAY include house number, street name, Post Office Box, and multi-line extended street address information.',-1234),(1041,250,'MappedLocalClaim','http://wso2.org/claims/streetaddress',-1234),(1042,250,'DisplayName','Street Address',-1234),(1043,251,'Description','Nick Name',-1234),(1044,251,'DisplayOrder','2',-1234),(1045,251,'Required','true',-1234),(1046,251,'SupportedByDefault','true',-1234),(1047,251,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(1048,251,'DisplayName','Nick Name',-1234),(1049,252,'Description','URL of the End-User\'s Web page or blog. This Web page SHOULD contain information published by the End-User or an organization that the End-User is affiliated with.',-1234),(1050,252,'DisplayOrder','10',-1234),(1051,252,'SupportedByDefault','true',-1234),(1052,252,'MappedLocalClaim','http://wso2.org/claims/url',-1234),(1053,252,'DisplayName','URL',-1234),(1054,253,'Description','Roles',-1234),(1055,253,'DisplayOrder','5',-1234),(1056,253,'SupportedByDefault','true',-1234),(1057,253,'MappedLocalClaim','http://wso2.org/claims/role',-1234),(1058,253,'DisplayName','Roles',-1234),(1059,254,'Description','Email Addresses',-1234),(1060,254,'DisplayOrder','3',-1234),(1061,254,'Required','true',-1234),(1062,254,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(1063,254,'SupportedByDefault','true',-1234),(1064,254,'MappedLocalClaim','http://wso2.org/claims/emailaddress',-1234),(1065,254,'DisplayName','Emails',-1234),(1066,255,'Description','Work Email',-1234),(1067,255,'DisplayOrder','5',-1234),(1068,255,'SupportedByDefault','true',-1234),(1069,255,'MappedLocalClaim','http://wso2.org/claims/emails.work',-1234),(1070,255,'DisplayName','Emails - Work Email',-1234),(1071,256,'Description','End-User\'s preferred telephone number. For example, +1 (425) 555-1212 or +56 (2) 687 2400., +1 (604) 555-1234;ext=5678.',-1234),(1072,256,'MappedLocalClaim','http://wso2.org/claims/telephone',-1234),(1073,256,'DisplayName','Phone Number',-1234),(1074,257,'Description','Gender',-1234),(1075,257,'DisplayOrder','1',-1234),(1076,257,'Required','true',-1234),(1077,257,'SupportedByDefault','true',-1234),(1078,257,'MappedLocalClaim','http://wso2.org/claims/gender',-1234),(1079,257,'DisplayName','Gender',-1234),(1080,258,'Description','Claim to store newly updated email address until the new email address is verified',-1234),(1081,258,'DisplayOrder','1',-1234),(1082,258,'Required','true',-1234),(1083,258,'SupportedByDefault','true',-1234),(1084,258,'MappedLocalClaim','http://wso2.org/claims/identity/emailaddress.pendingValue',-1234),(1085,258,'DisplayName','Verification Pending Email',-1234),(1086,259,'Description','Id',-1234),(1087,259,'DisplayOrder','1',-1234),(1088,259,'Required','true',-1234),(1089,259,'SupportedByDefault','true',-1234),(1090,259,'MappedLocalClaim','http://wso2.org/claims/userid',-1234),(1091,259,'DisplayName','Id',-1234),(1092,260,'Description','Nick Name',-1234),(1093,260,'DisplayOrder','2',-1234),(1094,260,'Required','true',-1234),(1095,260,'SupportedByDefault','true',-1234),(1096,260,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(1097,260,'DisplayName','Nick Name',-1234),(1098,261,'Description','Organization -department',-1234),(1099,261,'DisplayOrder','1',-1234),(1100,261,'Required','true',-1234),(1101,261,'SupportedByDefault','true',-1234),(1102,261,'MappedLocalClaim','http://wso2.org/claims/department',-1234),(1103,261,'DisplayName','Organization -department',-1234),(1104,262,'Description','Home Phone',-1234),(1105,262,'DisplayOrder','5',-1234),(1106,262,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$',-1234),(1107,262,'SupportedByDefault','true',-1234),(1108,262,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.home',-1234),(1109,262,'DisplayName','Phone Numbers - Home Phone Number',-1234),(1110,263,'Description','End-User\'s birthday, represented as an ISO 8601:2004 [ISO8601-2004] YYYY-MM-DD format. The year MAY be 0000, indicating that it is omitted. To represent only the year, YYYY format is allowed.',-1234),(1111,263,'MappedLocalClaim','http://wso2.org/claims/dob',-1234),(1112,263,'DisplayName','Birth Date',-1234),(1113,264,'Description','Current Address',-1234),(1114,264,'DisplayOrder','1',-1234),(1115,264,'Required','true',-1234),(1116,264,'SupportedByDefault','true',-1234),(1117,264,'MappedLocalClaim','http://wso2.org/claims/addresses',-1234),(1118,264,'DisplayName','Current Address',-1234),(1119,265,'Description','Standard Industrial Classification',-1234),(1120,265,'DisplayOrder','1',-1234),(1121,265,'Required','true',-1234),(1122,265,'SupportedByDefault','true',-1234),(1123,265,'MappedLocalClaim','http://wso2.org/claims/nickname',-1234),(1124,265,'DisplayName','Standard Industrial Classification',-1234),(1125,266,'Description','Given Name',-1234),(1126,266,'DisplayOrder','1',-1234),(1127,266,'Required','true',-1234),(1128,266,'SupportedByDefault','true',-1234),(1129,266,'MappedLocalClaim','http://wso2.org/claims/givenname',-1234),(1130,266,'DisplayName','Name - Given Name',-1234),(1131,267,'Description','Email Address',-1234),(1132,267,'Required','true',-1234),(1133,267,'RegEx','^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$',-1234),(1134,267,'SupportedByDefault','true',-1234),(1135,267,'MappedLocalClaim','http://wso2.org/claims/emailaddress',-1234),(1136,267,'DisplayName','Email',-1234),(1137,268,'Description','Mobile Number',-1234),(1138,268,'DisplayOrder','5',-1234),(1139,268,'RegEx','^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$',-1234),(1140,268,'SupportedByDefault','true',-1234),(1141,268,'MappedLocalClaim','http://wso2.org/claims/mobile',-1234),(1142,268,'DisplayName','Phone Numbers - Mobile Number',-1234),(1143,269,'Description','Country',-1234),(1144,269,'SupportedByDefault','true',-1234),(1145,269,'MappedLocalClaim','http://wso2.org/claims/country',-1234),(1146,269,'DisplayName','Country',-1234),(1147,270,'Description','Date of Birth',-1234),(1148,270,'SupportedByDefault','true',-1234),(1149,270,'MappedLocalClaim','http://wso2.org/claims/dob',-1234),(1150,270,'DisplayName','DOB',-1234),(1151,271,'Description','Time the End-User\'s information was last updated. Its value is a JSON number representing the number of seconds from 1970-01-01T0:0:0Z as measured in UTC until the date/time.',-1234),(1152,271,'MappedLocalClaim','http://wso2.org/claims/modified',-1234),(1153,271,'DisplayName','Updated At',-1234),(1154,272,'Description','Profile URL',-1234),(1155,272,'DisplayOrder','2',-1234),(1156,272,'Required','true',-1234),(1157,272,'SupportedByDefault','true',-1234),(1158,272,'MappedLocalClaim','http://wso2.org/claims/url',-1234),(1159,272,'DisplayName','Profile URL',-1234),(1160,273,'Description','Formatted Name',-1234),(1161,273,'DisplayOrder','2',-1234),(1162,273,'Required','true',-1234),(1163,273,'SupportedByDefault','true',-1234),(1164,273,'MappedLocalClaim','http://wso2.org/claims/formattedName',-1234),(1165,273,'DisplayName','Name - Formatted Name',-1234),(1166,274,'Description','Fax Number',-1234),(1167,274,'DisplayOrder','5',-1234),(1168,274,'SupportedByDefault','true',-1234),(1169,274,'MappedLocalClaim','http://wso2.org/claims/phoneNumbers.fax',-1234),(1170,274,'DisplayName','Phone Numbers - Fax Number',-1234);
/*!40000 ALTER TABLE `IDN_CLAIM_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_FED_AUTH_SESSION_MAPPING`
--

DROP TABLE IF EXISTS `IDN_FED_AUTH_SESSION_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_FED_AUTH_SESSION_MAPPING` (
  `IDP_SESSION_ID` varchar(255) NOT NULL,
  `SESSION_ID` varchar(255) NOT NULL,
  `IDP_NAME` varchar(255) NOT NULL,
  `AUTHENTICATOR_ID` varchar(255) DEFAULT NULL,
  `PROTOCOL_TYPE` varchar(255) DEFAULT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDP_SESSION_ID`),
  KEY `IDX_FEDERATED_AUTH_SESSION_ID` (`SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_FED_AUTH_SESSION_MAPPING`
--

LOCK TABLES `IDN_FED_AUTH_SESSION_MAPPING` WRITE;
/*!40000 ALTER TABLE `IDN_FED_AUTH_SESSION_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_FED_AUTH_SESSION_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_FUNCTION_LIBRARY`
--

DROP TABLE IF EXISTS `IDN_FUNCTION_LIBRARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_FUNCTION_LIBRARY` (
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(1023) DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DATA` blob NOT NULL,
  PRIMARY KEY (`TENANT_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_FUNCTION_LIBRARY`
--

LOCK TABLES `IDN_FUNCTION_LIBRARY` WRITE;
/*!40000 ALTER TABLE `IDN_FUNCTION_LIBRARY` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_FUNCTION_LIBRARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_IDENTITY_META_DATA`
--

DROP TABLE IF EXISTS `IDN_IDENTITY_META_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_IDENTITY_META_DATA` (
  `USER_NAME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1234',
  `METADATA_TYPE` varchar(255) NOT NULL,
  `METADATA` varchar(255) NOT NULL,
  `VALID` varchar(255) NOT NULL,
  PRIMARY KEY (`TENANT_ID`,`USER_NAME`,`METADATA_TYPE`,`METADATA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_IDENTITY_META_DATA`
--

LOCK TABLES `IDN_IDENTITY_META_DATA` WRITE;
/*!40000 ALTER TABLE `IDN_IDENTITY_META_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_IDENTITY_META_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_IDENTITY_USER_DATA`
--

DROP TABLE IF EXISTS `IDN_IDENTITY_USER_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_IDENTITY_USER_DATA` (
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1234',
  `USER_NAME` varchar(255) NOT NULL,
  `DATA_KEY` varchar(255) NOT NULL,
  `DATA_VALUE` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`TENANT_ID`,`USER_NAME`,`DATA_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_IDENTITY_USER_DATA`
--

LOCK TABLES `IDN_IDENTITY_USER_DATA` WRITE;
/*!40000 ALTER TABLE `IDN_IDENTITY_USER_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_IDENTITY_USER_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH1A_ACCESS_TOKEN`
--

DROP TABLE IF EXISTS `IDN_OAUTH1A_ACCESS_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH1A_ACCESS_TOKEN` (
  `ACCESS_TOKEN` varchar(255) NOT NULL,
  `ACCESS_TOKEN_SECRET` varchar(512) DEFAULT NULL,
  `CONSUMER_KEY_ID` int(11) DEFAULT NULL,
  `SCOPE` varchar(2048) DEFAULT NULL,
  `AUTHZ_USER` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`ACCESS_TOKEN`),
  KEY `CONSUMER_KEY_ID` (`CONSUMER_KEY_ID`),
  CONSTRAINT `IDN_OAUTH1A_ACCESS_TOKEN_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH1A_ACCESS_TOKEN`
--

LOCK TABLES `IDN_OAUTH1A_ACCESS_TOKEN` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH1A_ACCESS_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH1A_ACCESS_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH1A_REQUEST_TOKEN`
--

DROP TABLE IF EXISTS `IDN_OAUTH1A_REQUEST_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH1A_REQUEST_TOKEN` (
  `REQUEST_TOKEN` varchar(255) NOT NULL,
  `REQUEST_TOKEN_SECRET` varchar(512) DEFAULT NULL,
  `CONSUMER_KEY_ID` int(11) DEFAULT NULL,
  `CALLBACK_URL` varchar(2048) DEFAULT NULL,
  `SCOPE` varchar(2048) DEFAULT NULL,
  `AUTHORIZED` varchar(128) DEFAULT NULL,
  `OAUTH_VERIFIER` varchar(512) DEFAULT NULL,
  `AUTHZ_USER` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`REQUEST_TOKEN`),
  KEY `CONSUMER_KEY_ID` (`CONSUMER_KEY_ID`),
  CONSTRAINT `IDN_OAUTH1A_REQUEST_TOKEN_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH1A_REQUEST_TOKEN`
--

LOCK TABLES `IDN_OAUTH1A_REQUEST_TOKEN` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH1A_REQUEST_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH1A_REQUEST_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_ACCESS_TOKEN`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_ACCESS_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_ACCESS_TOKEN` (
  `TOKEN_ID` varchar(255) NOT NULL,
  `ACCESS_TOKEN` varchar(2048) DEFAULT NULL,
  `REFRESH_TOKEN` varchar(2048) DEFAULT NULL,
  `CONSUMER_KEY_ID` int(11) DEFAULT NULL,
  `AUTHZ_USER` varchar(100) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `USER_DOMAIN` varchar(50) DEFAULT NULL,
  `USER_TYPE` varchar(25) DEFAULT NULL,
  `GRANT_TYPE` varchar(50) DEFAULT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `REFRESH_TOKEN_TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `VALIDITY_PERIOD` bigint(20) DEFAULT NULL,
  `REFRESH_TOKEN_VALIDITY_PERIOD` bigint(20) DEFAULT NULL,
  `TOKEN_SCOPE_HASH` varchar(32) DEFAULT NULL,
  `TOKEN_STATE` varchar(25) DEFAULT 'ACTIVE',
  `TOKEN_STATE_ID` varchar(128) DEFAULT 'NONE',
  `SUBJECT_IDENTIFIER` varchar(255) DEFAULT NULL,
  `ACCESS_TOKEN_HASH` varchar(512) DEFAULT NULL,
  `REFRESH_TOKEN_HASH` varchar(512) DEFAULT NULL,
  `IDP_ID` int(11) NOT NULL DEFAULT '-1',
  `TOKEN_BINDING_REF` varchar(32) DEFAULT 'NONE',
  PRIMARY KEY (`TOKEN_ID`),
  UNIQUE KEY `CON_APP_KEY` (`CONSUMER_KEY_ID`,`AUTHZ_USER`,`TENANT_ID`,`USER_DOMAIN`,`USER_TYPE`,`TOKEN_SCOPE_HASH`,`TOKEN_STATE`,`TOKEN_STATE_ID`,`IDP_ID`,`TOKEN_BINDING_REF`),
  KEY `IDX_TC` (`TIME_CREATED`),
  KEY `IDX_ATH` (`ACCESS_TOKEN_HASH`),
  KEY `IDX_AT_CK_AU` (`CONSUMER_KEY_ID`,`AUTHZ_USER`,`TOKEN_STATE`,`USER_TYPE`),
  KEY `IDX_AT_TI_UD` (`AUTHZ_USER`,`TENANT_ID`,`TOKEN_STATE`,`USER_DOMAIN`),
  KEY `IDX_AT_AU_TID_UD_TS_CKID` (`AUTHZ_USER`,`TENANT_ID`,`USER_DOMAIN`,`TOKEN_STATE`,`CONSUMER_KEY_ID`),
  KEY `IDX_AT_AU_CKID_TS_UT` (`AUTHZ_USER`,`CONSUMER_KEY_ID`,`TOKEN_STATE`,`USER_TYPE`),
  KEY `IDX_AT_RTH` (`REFRESH_TOKEN_HASH`),
  KEY `IDX_AT_CKID_AU_TID_UD_TSH_TS` (`CONSUMER_KEY_ID`,`AUTHZ_USER`,`TENANT_ID`,`USER_DOMAIN`,`TOKEN_SCOPE_HASH`,`TOKEN_STATE`),
  KEY `IDX_IOAT_UT` (`USER_TYPE`),
  CONSTRAINT `IDN_OAUTH2_ACCESS_TOKEN_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_ACCESS_TOKEN`
--

LOCK TABLES `IDN_OAUTH2_ACCESS_TOKEN` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_ACCESS_TOKEN` DISABLE KEYS */;
INSERT INTO `IDN_OAUTH2_ACCESS_TOKEN` VALUES ('06de330f-ed22-4e3a-abed-97640953f7cd','5412d36b-2a3f-42cc-9cb4-d665bbbbe534','ca99611c-b695-3250-a95e-43dd78a7e8ff',16,'apisubscriber_1_2_7',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:23:49','2021-07-20 04:23:49',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"08072496bb7deaa0020ce6ad89b97bd9d7d3714dccb4c727567d1446f2633c29\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"0d809adbe8106b101f99dc2d0c366f03a559c1fa8098ed61d032630f953d0873\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('0a2dee29-3beb-4406-8c0a-cd1d4ac3e997','97a29bc4-81af-333c-bb43-04eab324adfc','a2d2362f-5606-3ff0-adde-9543ce584f9d',21,'apisubscriber_1_2_10',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:23:56','2021-07-20 04:23:56',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_2_10','{\"hash\":\"567e8d4f29081fe6255907a0b557eae8e343ffda48efab5924fab10ff15bf498\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"1632a455468922fe7efc13ef089f416c951aadcc1f1378e7930e61b6ececed8e\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('214c9220-9e9b-4476-af30-73ba9ebe6c9b','00261da7-5ac4-3eae-9d42-7656780fbab9','c5a3e754-b611-340b-b5d1-a9255528e627',23,'apisubscriber_1_3_11',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:24:01','2021-07-20 04:24:01',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_3_11','{\"hash\":\"1242fb45c9ee06bdf3a8a0b52fd3797cc4ac268f6a9416dff9526885e83f4106\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"c1169ecdf79604c05969899b591d5eacdb997021cd3e57f72036934daeb92f57\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('2709a348-d710-4cb4-9163-88321a635468','f20dd69e-e241-47ae-bac9-9e615d8f8dae','45de1ecd-1ce0-3aa4-8298-830294c44028',10,'apisubscriber_1_1_4',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:23:37','2021-07-20 04:23:37',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"4ecc19ae2822d25c49cd9c593d63730208051f7de578f4907cecc0502a9d9a31\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"0ab4dfa7aa48642cd4c2beffbce2b5bbf9f4bdaa7446d5a40b4e1964e09d32e5\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('27109c16-a7af-467b-bcf5-5991c810273c','550fddfb-b485-4022-9850-392a74dd7eee','a5e36bdf-be0f-35a1-87d8-16a9d018062f',26,'apisubscriber_1_3_12',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:24:05','2021-07-20 04:24:05',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"180ae53bc66dfe3102560a7b0ced881e1b0c9374009279b3d4f876724b1359eb\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"6b1a5bcebd8734d7da2a3943b4df19f904f9ea0c2c2d83d1284ba9aea4b38839\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('31b1997c-8071-4c88-b3cf-66b3fa160995','8fad7cd7-4176-4574-812a-08032775d8f9','91748859-1e43-3220-b8f6-d25d8bd69119',6,'apisubscriber_1_1_2',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:23:32','2021-07-20 04:23:32',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"f20a81c5d2d50927e0a407fee76f5a283c81c0db2f1799329c26bb02e4ccf15d\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"c2029a1fc04b7545c80cbfa979a611fc1c179a33b746d2405528c60d932ac483\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('38fac5fd-3e19-4519-8ee0-7909b5706c8b','cf29387a-ac60-41e3-a254-d22489616f4b','5bfa6759-ff8e-3f22-93f5-bb5fd5dd98da',12,'apisubscriber_1_1_5',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:23:40','2021-07-20 04:23:40',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"fb7f92bb8b73b157407c3e329c95adbf2953db6013e261c56593f73b0a390149\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"4114a58f23d329d691ce557f644adef469ce8e3e3f505c354960d3a731f6800f\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('50af5d33-42c2-4735-9a79-6698d98a2de5','2044fc59-d570-3c5d-9da5-40bef96d6e57','dd8b4e4f-1913-3a32-953f-5c9bbedb4c85',9,'apisubscriber_1_1_4',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:23:36','2021-07-20 04:23:36',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_1_4','{\"hash\":\"42b756c7a9abce09b0618ecaded686a1f92d4404b0f887dce24b20b9fc41f5c5\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"bd6cb84d1b59e4d29abb349192e967e5892cad8c1b290846aa935ac2f5c74c69\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('53e7a2b7-a3f8-4b7d-a371-4e98181fb915','edaac8a5-c6c8-3fc0-b5f5-820e47712bd3','11d12977-36a5-3fb6-82ca-0ccff221a9b0',19,'apisubscriber_1_2_9',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:23:53','2021-07-20 04:23:53',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_2_9','{\"hash\":\"26ee3607a08bf122fc66c7697ecca27f12b7a7ebd2c07020f5d21ac5732f25be\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"f62107a3bb4c06aa4d821a2d5afb67fd3f3907c749600ec2f58ddd876a828cc6\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('66110780-d4ed-45b4-a516-344395a0e65f','d7e671d3-542c-4153-bbcc-ccb81bcf7659','ea24c484-afe8-300c-92d9-16449b6fad7a',24,'apisubscriber_1_3_11',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:24:02','2021-07-20 04:24:02',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"2867791d9ebec10fffd184625b2e9866eabea8668bc1a490fcc532f3b82064d4\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"eb99ed67625b8f73ffbf5d30fbf9cc41af277da1fd436e4771cfccb68353aed7\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('6949ec22-54b8-4a0a-9a87-06d5b28b1e14','a780dc92-e16e-3083-9535-01020f97770c','cf02a39c-de6d-3e22-9795-c0c180c417f6',3,'apisubscriber_1_1_1',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:23:22','2021-07-20 04:23:22',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_1_1','{\"hash\":\"9f97a9bef78b3f743c569f8ae40da391238f8b840008addc785d47260b00afff\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"2b322e402b86cf82fc9a98f2a9f236e158f6ae311222a581ba46b45f5cc99118\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('72eaacd8-b113-49f5-a650-67d50c284612','1587b5c5-4e51-31b7-a766-db0a8d697c0a','d84d1014-d4a5-3e88-a498-815c774fe490',17,'apisubscriber_1_2_8',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:23:50','2021-07-20 04:23:50',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_2_8','{\"hash\":\"772f424be0c7918d271772dbe123f988dbcd9704894d06667ad7c7420c0944f4\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"9b251eafeacda9bea30887500cc710d9cc08cc576c0521bcd5e03fc965a068e7\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('898e1fdb-3e72-4492-b0e1-cf97658557e7','e3ac258a-b61d-381b-9465-d9c0e7376878','7f4415b0-52f3-3acb-8b17-2bb2805f9858',13,'apisubscriber_1_2_6',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:23:44','2021-07-20 04:23:44',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_2_6','{\"hash\":\"a048a82796a48aea07044631048cae2481429d622ead76a41c34a352d850de68\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"a071a78f784b8ab41b36bf2584a34f32fff30fc2fdc705f661a263aeb51aefe5\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('89acaeae-4ead-4a3c-b669-43386cb8272f','b541a857-ef9a-4586-a713-951afaf37047','db043cc7-4eb3-3b82-b701-4ba435d23798',4,'apisubscriber_1_1_1',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:23:26','2021-07-20 04:23:26',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"b9dce09852040eab1ce015f3a2737f64e77ca8d64bc140e0c65505e6ed9c3931\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"a614fcb0988531170da17b48fc629d7617ed95edb2fddae29d3dbb836476fa8f\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('94d68846-7072-4620-a46f-49eac9779960','528fa6ea-2827-3389-97a0-293f11b42f85','1b45a1f9-dc38-3186-a377-959be1465415',25,'apisubscriber_1_3_12',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:24:04','2021-07-20 04:24:04',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_3_12','{\"hash\":\"87f0bb500d55d35df72a9a1d6f93e3237f0b6f525821b5d475d7668a446c79db\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"05d18447e44b93719ff4312420fa5981af8ec980d647b1acf90d335e61a88fda\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('9a62f3d9-b28e-4416-a02d-4a59bb6f0fb8','87df84e2-c4fd-3794-9437-d9629f4c50c4','e49691eb-aa23-34b5-8702-410e1afc19fb',5,'apisubscriber_1_1_2',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:23:30','2021-07-20 04:23:30',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_1_2','{\"hash\":\"68eb2b1f749f84cfa18b3b1dedc9eb555a0d55418fcbaed30037a738028e68b8\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"f4e67634acdbbdc7a05b76eebe8b66dd2eb006cb1e848829b13f8beadfe8fad5\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('9e9f8c23-2bdb-459a-92d1-9ceb3b95dbfb','d467f683-f1de-475e-875a-e30aae13cfdf','125cde60-f98f-3eed-b4a9-a5a63833ca85',28,'apisubscriber_1_3_13',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:24:09','2021-07-20 04:24:09',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"ad01f8e01466d39efb48dd285aabec3439c08a546600b790147f19b502fb184d\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"d62d882f024aad63f8d8804973275c15e70484ea029f0bbbd8462145885742f9\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('9f39afe0-c428-4d9d-86e7-37b14645e48d','9660820b-01e4-3196-8094-b1a9be3387d7','753195c0-2efc-3d07-9791-4f2847d1be61',7,'apisubscriber_1_1_3',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:23:33','2021-07-20 04:23:33',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_1_3','{\"hash\":\"15dadae93e07e2acf2b2310b0f15c24fcab4b8274cb9fc1a67501053c87c08c3\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"70591a9538f02eb29aca5c37950a82fadaab28b85e9fe896f6a002ebb7183171\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('a55a5593-4f62-465b-acbd-bf293bc7fc1c','6cbc3ef3-c753-472a-aae8-b7f89060d0ad','78a2547d-64d5-3497-a017-c24377324805',14,'apisubscriber_1_2_6',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:23:46','2021-07-20 04:23:46',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"1cbd65db5edf4669bf57c44fa734de1397ba5ad6463a224b47f85a2f9c54480d\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"d679a4a00d4e270df69ff5c6428364e14fcff7cc9f5f89b4a571952a0b4cf37a\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('b6ae3ea9-66bf-4457-b8ef-1faa1eb2d4b7','990152fb-4d8a-3c6c-9da6-1c95058e1bf8','5132d836-d535-3467-b66c-1729fc6c0f7c',27,'apisubscriber_1_3_13',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:24:07','2021-07-20 04:24:07',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_3_13','{\"hash\":\"34134b2b5f16f2ea0e64c49936cd9fba551a044ea1e648acbad998406f5da9fc\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"f60f0c31033a508af573f9101ffd5327233d09a03e2f496345f0aa34f47b3b10\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('c124050f-8c84-4c19-a794-56fbbc37c3d3','3d1a6270-41ec-33bd-bff2-dbeb966ebbbb','f7e86220-faee-3e6f-93b2-9d35aa7311a2',29,'apisubscriber_1_3_14',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:24:10','2021-07-20 04:24:10',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_3_14','{\"hash\":\"73227e93cf5e098534e9a474f84ab9dcbb74da0ad09db0d56399cb239db019ef\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"d7ec8c24b2893a08e13be44855247fdb6e411df745433510a9a095271447de9f\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('cb6645eb-7e92-4b98-9fd6-b073de350446','0c57a2b8-95ce-357c-88cb-4fb58ffac996','4b0cecda-bd1f-3f62-bb0b-914ddca855f5',11,'apisubscriber_1_1_5',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:23:39','2021-07-20 04:23:39',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_1_5','{\"hash\":\"9fef32b54468f8528854293ac4a51ce45deac2dec1a431a6e20abe61fe1493ef\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"32f8e17a94f942d9e712ba688a09c41a5861e1feffe80b4acc5188cc6e5933b7\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('d00852b5-e0a1-4ae6-a25a-c1030a207030','c5208f39-3fc4-3264-9d2b-31f3149c7268','5b4404e6-69ad-39f1-ac30-7d05d53a4af4',15,'apisubscriber_1_2_7',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:23:48','2021-07-20 04:23:48',86400000,86400000,'520c5f8d302f43f206755b7004eb121e','ACTIVE','NONE','apisubscriber_1_2_7','{\"hash\":\"7df47ee6e4450505c767561bf7f47cd6ea8d22f794995d3991524fc5226734b6\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"7147f89dde94987c4db01cc9da354fa328b191cced91f4a14afa80b955844447\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('e4257f70-fd1c-4a9d-9e0c-d8e8b2484f7a','2095b9c5-430f-4fcc-8cfc-676b9284446e','e116f1e7-44e9-3a89-a59d-6c875cf7d3ed',30,'apisubscriber_1_3_14',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:24:11','2021-07-20 04:24:11',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"a4a3558eeced8789a2a8890301327faa6f5aef0c804ad2596fad6aaac1e2b8f7\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"3315a796e75ca275d1c7edd46c13a3863ee6033b2a440cb5cf95fe5be2cd7dca\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('e6167a1e-87ef-4326-bf93-d36667b3a565','f10005fe-e663-44e8-a513-498466d57cb2','1eea022f-eb5e-3b3d-90e9-15e074be03ca',20,'apisubscriber_1_2_9',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:23:55','2021-07-20 04:23:55',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"c1c1bf3f426c9d2f56da423d1c105181e4ef483e6c5fa97b97a6bb656fdd72bc\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"a916a5ca78c9f25f5113fad43e103d468619a596c2c2f885d101e59f26ac9e2a\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('f2f7284d-8285-41ed-b18b-b59dc1b7614b','6277a776-110a-403a-b079-a929ae2b9112','61ea0742-dab5-3e25-9d1b-33f626f12afb',22,'apisubscriber_1_2_10',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:23:57','2021-07-20 04:23:57',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"ef25face43a36a288627b3a2b370f7eaa8463d091e774da1bee050f440a89f7b\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"87464679b6b2d742012075106f151a891f0b1bd5768d4645ff877e7f6a85b1b3\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('f4dca510-df0f-41a4-8df7-42983562b717','5f096544-6f12-31ee-be3d-dfc471b29add','8038ec47-aed2-3ae9-8d58-d933a9ab8125',1,'apicreator1',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:23:06','2021-07-20 04:23:06',86400000,86400000,'657c73477cbffc2988d39c8591ed9a76','ACTIVE','NONE','apicreator1','{\"hash\":\"8a419be50642b95270dbb37b159a82eba5d90f9dd0a29c94f1904a9877e32ac0\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"a2ef45d5f88cf9fe0d61ee06b572f5f10d9ee290c2274ebff12c6dfcf6a33b5b\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('f7860987-7667-4089-9fb8-2ce48237b58a','a00b99a9-b9fd-42e9-99ed-d5ca5eef5fd1','a0699b44-0fe6-3f06-866b-05c00e8dbe12',8,'apisubscriber_1_1_3',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:23:34','2021-07-20 04:23:34',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"545525a9de7618a7872d4b984a457ce80690332122622dfc50a2b51f48630ef8\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"d028a88801ea441b634ce34a7e720c7c7bfe65348e978ec5f28e45cfa919492b\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('fd7a3b91-facf-4e74-ad20-25ba93c6265f','9e8609db-0548-4453-95e6-f7273bf982e4','79eea1b6-bfad-39ee-ac29-44514033a977',18,'apisubscriber_1_2_8',-1234,'PRIMARY','APPLICATION','client_credentials','2021-07-20 04:23:52','2021-07-20 04:23:52',3600000,86400000,'15703966c63ae7da301cd656ef647fa6','ACTIVE','NONE',NULL,'{\"hash\":\"d099ca974120ce8498f46de3d5ad8e5a0f583b7280a169f13166dd397e213883\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"40489cc76bb91e61d6406fd41fa594225e3c915220dd395b44e52fffcb4eec2e\",\"algorithm\":\"SHA-256\"}',1,'NONE'),('fefcedb3-b847-4fb2-9009-7cd5f3510c93','cd094aed-186b-3b8e-b1ea-e59e50264e74','9d50ea6f-57ad-3b2d-8e4c-42c50ba03010',2,'apipublisher1',-1234,'PRIMARY','APPLICATION_USER','password','2021-07-20 04:23:07','2021-07-20 04:23:07',86400000,86400000,'b41aec1f2fcc88dd46389e0edc42e610','ACTIVE','NONE','apipublisher1','{\"hash\":\"31877c0459044dc09d653005a1cc81ce98e63b21f26de19f3085ab8ab016be66\",\"algorithm\":\"SHA-256\"}','{\"hash\":\"ccb692913984a6f30c0d4f63ac91b7cce97dcc04a95272be6ab47ad4eb4a4f7e\",\"algorithm\":\"SHA-256\"}',1,'NONE');
/*!40000 ALTER TABLE `IDN_OAUTH2_ACCESS_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_ACCESS_TOKEN_AUDIT`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_ACCESS_TOKEN_AUDIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_ACCESS_TOKEN_AUDIT` (
  `TOKEN_ID` varchar(255) DEFAULT NULL,
  `ACCESS_TOKEN` varchar(2048) DEFAULT NULL,
  `REFRESH_TOKEN` varchar(2048) DEFAULT NULL,
  `CONSUMER_KEY_ID` int(11) DEFAULT NULL,
  `AUTHZ_USER` varchar(100) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `USER_DOMAIN` varchar(50) DEFAULT NULL,
  `USER_TYPE` varchar(25) DEFAULT NULL,
  `GRANT_TYPE` varchar(50) DEFAULT NULL,
  `TIME_CREATED` timestamp NULL DEFAULT NULL,
  `REFRESH_TOKEN_TIME_CREATED` timestamp NULL DEFAULT NULL,
  `VALIDITY_PERIOD` bigint(20) DEFAULT NULL,
  `REFRESH_TOKEN_VALIDITY_PERIOD` bigint(20) DEFAULT NULL,
  `TOKEN_SCOPE_HASH` varchar(32) DEFAULT NULL,
  `TOKEN_STATE` varchar(25) DEFAULT NULL,
  `TOKEN_STATE_ID` varchar(128) DEFAULT NULL,
  `SUBJECT_IDENTIFIER` varchar(255) DEFAULT NULL,
  `ACCESS_TOKEN_HASH` varchar(512) DEFAULT NULL,
  `REFRESH_TOKEN_HASH` varchar(512) DEFAULT NULL,
  `INVALIDATED_TIME` timestamp NULL DEFAULT NULL,
  `IDP_ID` int(11) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_ACCESS_TOKEN_AUDIT`
--

LOCK TABLES `IDN_OAUTH2_ACCESS_TOKEN_AUDIT` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_ACCESS_TOKEN_AUDIT` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_ACCESS_TOKEN_AUDIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_ACCESS_TOKEN_SCOPE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_ACCESS_TOKEN_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_ACCESS_TOKEN_SCOPE` (
  `TOKEN_ID` varchar(255) NOT NULL,
  `TOKEN_SCOPE` varchar(60) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`TOKEN_ID`,`TOKEN_SCOPE`),
  KEY `IDX_ATS_TID` (`TOKEN_ID`),
  CONSTRAINT `IDN_OAUTH2_ACCESS_TOKEN_SCOPE_ibfk_1` FOREIGN KEY (`TOKEN_ID`) REFERENCES `IDN_OAUTH2_ACCESS_TOKEN` (`TOKEN_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_ACCESS_TOKEN_SCOPE`
--

LOCK TABLES `IDN_OAUTH2_ACCESS_TOKEN_SCOPE` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_ACCESS_TOKEN_SCOPE` DISABLE KEYS */;
INSERT INTO `IDN_OAUTH2_ACCESS_TOKEN_SCOPE` VALUES ('06de330f-ed22-4e3a-abed-97640953f7cd','am_application_scope',-1234),('06de330f-ed22-4e3a-abed-97640953f7cd','default',-1234),('0a2dee29-3beb-4406-8c0a-cd1d4ac3e997','apim:subscribe',-1234),('214c9220-9e9b-4476-af30-73ba9ebe6c9b','apim:subscribe',-1234),('2709a348-d710-4cb4-9163-88321a635468','am_application_scope',-1234),('2709a348-d710-4cb4-9163-88321a635468','default',-1234),('27109c16-a7af-467b-bcf5-5991c810273c','am_application_scope',-1234),('27109c16-a7af-467b-bcf5-5991c810273c','default',-1234),('31b1997c-8071-4c88-b3cf-66b3fa160995','am_application_scope',-1234),('31b1997c-8071-4c88-b3cf-66b3fa160995','default',-1234),('38fac5fd-3e19-4519-8ee0-7909b5706c8b','am_application_scope',-1234),('38fac5fd-3e19-4519-8ee0-7909b5706c8b','default',-1234),('50af5d33-42c2-4735-9a79-6698d98a2de5','apim:subscribe',-1234),('53e7a2b7-a3f8-4b7d-a371-4e98181fb915','apim:subscribe',-1234),('66110780-d4ed-45b4-a516-344395a0e65f','am_application_scope',-1234),('66110780-d4ed-45b4-a516-344395a0e65f','default',-1234),('6949ec22-54b8-4a0a-9a87-06d5b28b1e14','apim:subscribe',-1234),('72eaacd8-b113-49f5-a650-67d50c284612','apim:subscribe',-1234),('898e1fdb-3e72-4492-b0e1-cf97658557e7','apim:subscribe',-1234),('89acaeae-4ead-4a3c-b669-43386cb8272f','am_application_scope',-1234),('89acaeae-4ead-4a3c-b669-43386cb8272f','default',-1234),('94d68846-7072-4620-a46f-49eac9779960','apim:subscribe',-1234),('9a62f3d9-b28e-4416-a02d-4a59bb6f0fb8','apim:subscribe',-1234),('9e9f8c23-2bdb-459a-92d1-9ceb3b95dbfb','am_application_scope',-1234),('9e9f8c23-2bdb-459a-92d1-9ceb3b95dbfb','default',-1234),('9f39afe0-c428-4d9d-86e7-37b14645e48d','apim:subscribe',-1234),('a55a5593-4f62-465b-acbd-bf293bc7fc1c','am_application_scope',-1234),('a55a5593-4f62-465b-acbd-bf293bc7fc1c','default',-1234),('b6ae3ea9-66bf-4457-b8ef-1faa1eb2d4b7','apim:subscribe',-1234),('c124050f-8c84-4c19-a794-56fbbc37c3d3','apim:subscribe',-1234),('cb6645eb-7e92-4b98-9fd6-b073de350446','apim:subscribe',-1234),('d00852b5-e0a1-4ae6-a25a-c1030a207030','apim:subscribe',-1234),('e4257f70-fd1c-4a9d-9e0c-d8e8b2484f7a','am_application_scope',-1234),('e4257f70-fd1c-4a9d-9e0c-d8e8b2484f7a','default',-1234),('e6167a1e-87ef-4326-bf93-d36667b3a565','am_application_scope',-1234),('e6167a1e-87ef-4326-bf93-d36667b3a565','default',-1234),('f2f7284d-8285-41ed-b18b-b59dc1b7614b','am_application_scope',-1234),('f2f7284d-8285-41ed-b18b-b59dc1b7614b','default',-1234),('f4dca510-df0f-41a4-8df7-42983562b717','apim:api_create',-1234),('f4dca510-df0f-41a4-8df7-42983562b717','apim:api_view',-1234),('f4dca510-df0f-41a4-8df7-42983562b717','apim:subscription_view',-1234),('f4dca510-df0f-41a4-8df7-42983562b717','apim:tier_view',-1234),('f7860987-7667-4089-9fb8-2ce48237b58a','am_application_scope',-1234),('f7860987-7667-4089-9fb8-2ce48237b58a','default',-1234),('fd7a3b91-facf-4e74-ad20-25ba93c6265f','am_application_scope',-1234),('fd7a3b91-facf-4e74-ad20-25ba93c6265f','default',-1234),('fefcedb3-b847-4fb2-9009-7cd5f3510c93','apim:api_publish',-1234),('fefcedb3-b847-4fb2-9009-7cd5f3510c93','apim:api_view',-1234),('fefcedb3-b847-4fb2-9009-7cd5f3510c93','apim:tier_view',-1234);
/*!40000 ALTER TABLE `IDN_OAUTH2_ACCESS_TOKEN_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_AUTHORIZATION_CODE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_AUTHORIZATION_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_AUTHORIZATION_CODE` (
  `CODE_ID` varchar(255) NOT NULL,
  `AUTHORIZATION_CODE` varchar(2048) DEFAULT NULL,
  `CONSUMER_KEY_ID` int(11) DEFAULT NULL,
  `CALLBACK_URL` varchar(2048) DEFAULT NULL,
  `SCOPE` varchar(2048) DEFAULT NULL,
  `AUTHZ_USER` varchar(100) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `USER_DOMAIN` varchar(50) DEFAULT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `VALIDITY_PERIOD` bigint(20) DEFAULT NULL,
  `STATE` varchar(25) DEFAULT 'ACTIVE',
  `TOKEN_ID` varchar(255) DEFAULT NULL,
  `SUBJECT_IDENTIFIER` varchar(255) DEFAULT NULL,
  `PKCE_CODE_CHALLENGE` varchar(255) DEFAULT NULL,
  `PKCE_CODE_CHALLENGE_METHOD` varchar(128) DEFAULT NULL,
  `AUTHORIZATION_CODE_HASH` varchar(512) DEFAULT NULL,
  `IDP_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`CODE_ID`),
  KEY `IDX_AUTHORIZATION_CODE_HASH` (`AUTHORIZATION_CODE_HASH`,`CONSUMER_KEY_ID`),
  KEY `IDX_AUTHORIZATION_CODE_AU_TI` (`AUTHZ_USER`,`TENANT_ID`,`USER_DOMAIN`,`STATE`),
  KEY `IDX_AC_CKID` (`CONSUMER_KEY_ID`),
  KEY `IDX_AC_TID` (`TOKEN_ID`),
  CONSTRAINT `IDN_OAUTH2_AUTHORIZATION_CODE_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_AUTHORIZATION_CODE`
--

LOCK TABLES `IDN_OAUTH2_AUTHORIZATION_CODE` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_AUTHORIZATION_CODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_AUTHORIZATION_CODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_AUTHZ_CODE_SCOPE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_AUTHZ_CODE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_AUTHZ_CODE_SCOPE` (
  `CODE_ID` varchar(255) NOT NULL,
  `SCOPE` varchar(60) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`CODE_ID`,`SCOPE`),
  CONSTRAINT `IDN_OAUTH2_AUTHZ_CODE_SCOPE_ibfk_1` FOREIGN KEY (`CODE_ID`) REFERENCES `IDN_OAUTH2_AUTHORIZATION_CODE` (`CODE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_AUTHZ_CODE_SCOPE`
--

LOCK TABLES `IDN_OAUTH2_AUTHZ_CODE_SCOPE` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_AUTHZ_CODE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_AUTHZ_CODE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_CIBA_AUTH_CODE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_CIBA_AUTH_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_CIBA_AUTH_CODE` (
  `AUTH_CODE_KEY` char(36) NOT NULL,
  `AUTH_REQ_ID` char(36) DEFAULT NULL,
  `ISSUED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CONSUMER_KEY` varchar(255) DEFAULT NULL,
  `LAST_POLLED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `POLLING_INTERVAL` int(11) DEFAULT NULL,
  `EXPIRES_IN` int(11) DEFAULT NULL,
  `AUTHENTICATED_USER_NAME` varchar(255) DEFAULT NULL,
  `USER_STORE_DOMAIN` varchar(100) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `AUTH_REQ_STATUS` varchar(100) DEFAULT 'REQUESTED',
  `IDP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AUTH_CODE_KEY`),
  UNIQUE KEY `AUTH_REQ_ID` (`AUTH_REQ_ID`),
  KEY `CONSUMER_KEY` (`CONSUMER_KEY`),
  CONSTRAINT `IDN_OAUTH2_CIBA_AUTH_CODE_ibfk_1` FOREIGN KEY (`CONSUMER_KEY`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`CONSUMER_KEY`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_CIBA_AUTH_CODE`
--

LOCK TABLES `IDN_OAUTH2_CIBA_AUTH_CODE` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_CIBA_AUTH_CODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_CIBA_AUTH_CODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_CIBA_REQUEST_SCOPES`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_CIBA_REQUEST_SCOPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_CIBA_REQUEST_SCOPES` (
  `AUTH_CODE_KEY` char(36) DEFAULT NULL,
  `SCOPE` varchar(255) DEFAULT NULL,
  KEY `AUTH_CODE_KEY` (`AUTH_CODE_KEY`),
  CONSTRAINT `IDN_OAUTH2_CIBA_REQUEST_SCOPES_ibfk_1` FOREIGN KEY (`AUTH_CODE_KEY`) REFERENCES `IDN_OAUTH2_CIBA_AUTH_CODE` (`AUTH_CODE_KEY`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_CIBA_REQUEST_SCOPES`
--

LOCK TABLES `IDN_OAUTH2_CIBA_REQUEST_SCOPES` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_CIBA_REQUEST_SCOPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_CIBA_REQUEST_SCOPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_DEVICE_FLOW`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_DEVICE_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_DEVICE_FLOW` (
  `CODE_ID` varchar(255) DEFAULT NULL,
  `DEVICE_CODE` varchar(255) NOT NULL,
  `USER_CODE` varchar(25) DEFAULT NULL,
  `CONSUMER_KEY_ID` int(11) DEFAULT NULL,
  `LAST_POLL_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EXPIRY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `POLL_TIME` bigint(20) DEFAULT NULL,
  `STATUS` varchar(25) DEFAULT 'PENDING',
  `AUTHZ_USER` varchar(100) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `USER_DOMAIN` varchar(50) DEFAULT NULL,
  `IDP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DEVICE_CODE`),
  UNIQUE KEY `CODE_ID` (`CODE_ID`),
  UNIQUE KEY `USER_CODE` (`USER_CODE`),
  KEY `CONSUMER_KEY_ID` (`CONSUMER_KEY_ID`),
  CONSTRAINT `IDN_OAUTH2_DEVICE_FLOW_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_DEVICE_FLOW`
--

LOCK TABLES `IDN_OAUTH2_DEVICE_FLOW` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_DEVICE_FLOW` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_DEVICE_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_DEVICE_FLOW_SCOPES`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_DEVICE_FLOW_SCOPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_DEVICE_FLOW_SCOPES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SCOPE_ID` varchar(255) DEFAULT NULL,
  `SCOPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SCOPE_ID` (`SCOPE_ID`),
  CONSTRAINT `IDN_OAUTH2_DEVICE_FLOW_SCOPES_ibfk_1` FOREIGN KEY (`SCOPE_ID`) REFERENCES `IDN_OAUTH2_DEVICE_FLOW` (`CODE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_DEVICE_FLOW_SCOPES`
--

LOCK TABLES `IDN_OAUTH2_DEVICE_FLOW_SCOPES` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_DEVICE_FLOW_SCOPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_DEVICE_FLOW_SCOPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_RESOURCE_SCOPE` (
  `RESOURCE_PATH` varchar(255) NOT NULL,
  `SCOPE_ID` int(11) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  KEY `SCOPE_ID` (`SCOPE_ID`),
  CONSTRAINT `IDN_OAUTH2_RESOURCE_SCOPE_ibfk_1` FOREIGN KEY (`SCOPE_ID`) REFERENCES `IDN_OAUTH2_SCOPE` (`SCOPE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_RESOURCE_SCOPE`
--

LOCK TABLES `IDN_OAUTH2_RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_SCOPE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_SCOPE` (
  `SCOPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DISPLAY_NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1',
  `SCOPE_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`),
  KEY `IDX_SC_TID` (`TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_SCOPE`
--

LOCK TABLES `IDN_OAUTH2_SCOPE` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_SCOPE` DISABLE KEYS */;
INSERT INTO `IDN_OAUTH2_SCOPE` VALUES (1,'openid','openid',NULL,-1234,'OIDC'),(2,'email','email',NULL,-1234,'OIDC'),(3,'profile','profile',NULL,-1234,'OIDC'),(4,'phone','phone',NULL,-1234,'OIDC'),(5,'address','address',NULL,-1234,'OIDC'),(6,'internal_feature_management','Feature Management',NULL,-1234,'OAUTH2'),(7,'internal_modify_tenants','Modify Tenant',NULL,-1234,'OAUTH2'),(8,'internal_list_tenants','List Tenant',NULL,-1234,'OAUTH2'),(9,'internal_server_admin','Server Admin',NULL,-1234,'OAUTH2'),(10,'internal_monitor_metrics','Monitor internal_monitor_metrics',NULL,-1234,'OAUTH2'),(11,'internal_monitor_bpel','Monitor BPEL',NULL,-1234,'OAUTH2'),(12,'internal_monitor_attachment','Monitor Attachments',NULL,-1234,'OAUTH2'),(13,'internal_manage_passwords','Manage Passwords',NULL,-1234,'OAUTH2'),(14,'internal_manage_profiles','Manage Profiles',NULL,-1234,'OAUTH2'),(15,'internal_manage_users','Manage Users',NULL,-1234,'OAUTH2'),(16,'internal_manage_provisining','Manager Provisioning',NULL,-1234,'OAUTH2'),(17,'internal_configure_datasources','Configure datasources',NULL,-1234,'OAUTH2'),(18,'internal_configure_themes','Configure Themes',NULL,-1234,'OAUTH2'),(19,'internal_login','Login',NULL,-1234,'OAUTH2'),(20,'internal_manage_event_streams','Event streams',NULL,-1234,'OAUTH2'),(21,'internal_search_advanced','Advanced Search',NULL,-1234,'OAUTH2'),(22,'internal_search_resouces','Basic Search',NULL,-1234,'OAUTH2'),(23,'internal_bpel_instances','Manage BPEL Process Instances',NULL,-1234,'OAUTH2'),(24,'internal_bpel_proceses','Manage BPEL Processes',NULL,-1234,'OAUTH2'),(25,'internal_bpel_packages','Manage BPEL Packages',NULL,-1234,'OAUTH2'),(26,'internal_add_bpel','Add BPEL',NULL,-1234,'OAUTH2'),(27,'internal_resouces_browse','Browse Resouces',NULL,-1234,'OAUTH2'),(28,'internal_resouces_notifications','Manage Resouces Notifications',NULL,-1234,'OAUTH2'),(29,'internal_add_module','Add Modules',NULL,-1234,'OAUTH2'),(30,'internal_add_services','Add Services',NULL,-1234,'OAUTH2'),(31,'internal_add_webapp','Add WebApps',NULL,-1234,'OAUTH2'),(32,'internal_add_attachements','Add Attachements',NULL,-1234,'OAUTH2'),(33,'internal_add_extensions','Add Extensions',NULL,-1234,'OAUTH2'),(34,'internal_list_extensions','List Extensions',NULL,-1234,'OAUTH2'),(35,'internal_manage_pep','Manage PEP',NULL,-1234,'OAUTH2'),(36,'internal_security_manage_update','Security Manage Update',NULL,-1234,'OAUTH2'),(37,'internal_security_manage_view','Security Manage View',NULL,-1234,'OAUTH2'),(38,'internal_security_manage_create','Security Manage Create',NULL,-1234,'OAUTH2'),(39,'internal_security_manage_delete','Security Manage Delete',NULL,-1234,'OAUTH2'),(40,'internal_session_view','View Sessions',NULL,-1234,'OAUTH2'),(41,'internal_session_delete','Delete Sessions',NULL,-1234,'OAUTH2'),(42,'internal_claim_meta_create','Create Claims Metadata',NULL,-1234,'OAUTH2'),(43,'internal_claim_meta_delete','Delete Claims Metadata',NULL,-1234,'OAUTH2'),(44,'internal_claim_meta_update','Update Cliams Metadata',NULL,-1234,'OAUTH2'),(45,'internal_claim_meta_view','View Claims Metadata',NULL,-1234,'OAUTH2'),(46,'internal_claim_manage_view','View Claims',NULL,-1234,'OAUTH2'),(47,'internal_claim_manage_update','Update Claims',NULL,-1234,'OAUTH2'),(48,'internal_claim_manage_create','Create Claims',NULL,-1234,'OAUTH2'),(49,'internal_claim_manage_delete','Delete Claims',NULL,-1234,'OAUTH2'),(50,'internal_userrole_ui_create','Show User Role Manage UI',NULL,-1234,'OAUTH2'),(51,'internal_auth_seq_view','View Authentication Sequence',NULL,-1234,'OAUTH2'),(52,'internal_auth_seq_update','Update Authentication Sequence',NULL,-1234,'OAUTH2'),(53,'internal_auth_seq_create','Create Authentication Sequence',NULL,-1234,'OAUTH2'),(54,'internal_auth_seq_delete','Delete Authentication Sequence',NULL,-1234,'OAUTH2'),(55,'internal_pap_delete','Delete PAP',NULL,-1234,'OAUTH2'),(56,'internal_pap_publish','Publish PAP',NULL,-1234,'OAUTH2'),(57,'internal_pap_create','Create PAP',NULL,-1234,'OAUTH2'),(58,'internal_pap_view','View PAP',NULL,-1234,'OAUTH2'),(59,'internal_pap_rollback','Rolback PAP',NULL,-1234,'OAUTH2'),(60,'internal_pap_order','Order PAP',NULL,-1234,'OAUTH2'),(61,'internal_pap_demote','Demote PAP',NULL,-1234,'OAUTH2'),(62,'internal_pap_update','Update PAP',NULL,-1234,'OAUTH2'),(63,'internal_pap_enable','Enable PAP',NULL,-1234,'OAUTH2'),(64,'internal_pap_list','List PAP',NULL,-1234,'OAUTH2'),(65,'internal_pap_subscriber_update','Update PAP Subscriber',NULL,-1234,'OAUTH2'),(66,'internal_pap_subscriber_view','View PAP Subscriber',NULL,-1234,'OAUTH2'),(67,'internal_pap_subscriber_list','List PAP Subscriber',NULL,-1234,'OAUTH2'),(68,'internal_pap_subscriber_create','Create PAP Subscriber',NULL,-1234,'OAUTH2'),(69,'internal_pap_subscriber_delete','Delete PAP Subscriber',NULL,-1234,'OAUTH2'),(70,'internal_pdp_view','View PDP',NULL,-1234,'OAUTH2'),(71,'internal_pdp_manage','Manage PDP',NULL,-1234,'OAUTH2'),(72,'internal_pdp_test','Test PDP',NULL,-1234,'OAUTH2'),(73,'internal_pep_manage','Manage PEP',NULL,-1234,'OAUTH2'),(74,'internal_idp_delete','Delete IDP',NULL,-1234,'OAUTH2'),(75,'internal_idp_create','Create IDP',NULL,-1234,'OAUTH2'),(76,'internal_idp_view','View IDP',NULL,-1234,'OAUTH2'),(77,'internal_idp_update','Update IDP',NULL,-1234,'OAUTH2'),(78,'internal_config_mgt_view','View Configs',NULL,-1234,'OAUTH2'),(79,'internal_config_mgt_update','Update Configs',NULL,-1234,'OAUTH2'),(80,'internal_config_mgt_delete','Delete Configs',NULL,-1234,'OAUTH2'),(81,'internal_config_mgt_list','List Configs',NULL,-1234,'OAUTH2'),(82,'internal_config_mgt_add','Add Configs',NULL,-1234,'OAUTH2'),(83,'internal_keystore_view','View Keystore',NULL,-1234,'OAUTH2'),(84,'internal_keystore_update','Update Keystore',NULL,-1234,'OAUTH2'),(85,'internal_keystore_delete','Delete Keystore',NULL,-1234,'OAUTH2'),(86,'internal_keystore_create','Create Keystore',NULL,-1234,'OAUTH2'),(87,'internal_consent_mgt_list','List Consents',NULL,-1234,'OAUTH2'),(88,'internal_consent_mgt_view','View Consents',NULL,-1234,'OAUTH2'),(89,'internal_consent_mgt_add','Add Consents',NULL,-1234,'OAUTH2'),(90,'internal_consent_mgt_delete','Delete Consents',NULL,-1234,'OAUTH2'),(91,'internal_app_template_view','View Application Templates',NULL,-1234,'OAUTH2'),(92,'internal_app_template_update','Update Application Templates',NULL,-1234,'OAUTH2'),(93,'internal_app_template_delete','Delete Application Templates',NULL,-1234,'OAUTH2'),(94,'internal_app_template_create','Create Application Templates',NULL,-1234,'OAUTH2'),(95,'internal_identity_mgt_view','View IdentityMgt',NULL,-1234,'OAUTH2'),(96,'internal_identity_mgt_update','Update IdentityMgt',NULL,-1234,'OAUTH2'),(97,'internal_identity_mgt_create','Ceate IdentityMgt',NULL,-1234,'OAUTH2'),(98,'internal_identity_mgt_delete','Delete IdentityMgt',NULL,-1234,'OAUTH2'),(99,'internal_workflow_association_view','View Workflow Associations',NULL,-1234,'OAUTH2'),(100,'internal_workflow_association_delete','Delete Workflow Associations',NULL,-1234,'OAUTH2'),(101,'internal_workflow_association_create','Create Workflow Associations',NULL,-1234,'OAUTH2'),(102,'internal_workflow_association_update','Update Workflow Associations',NULL,-1234,'OAUTH2'),(103,'internal_workflow_def_create','Create Workflow Definition',NULL,-1234,'OAUTH2'),(104,'internal_workflow_def_delete','Delete Workflow Definition',NULL,-1234,'OAUTH2'),(105,'internal_workflow_def_view','View Workflow Definition',NULL,-1234,'OAUTH2'),(106,'internal_workflow_def_update','Update Workflow Definition',NULL,-1234,'OAUTH2'),(107,'internal_workflow_profile_view','View Workflow Profile',NULL,-1234,'OAUTH2'),(108,'internal_workflow_profile_create','Create Workflow Profile',NULL,-1234,'OAUTH2'),(109,'internal_workflow_profile_delete','Delete Workflow Profile',NULL,-1234,'OAUTH2'),(110,'internal_workflow_profile_update','Update Workflow Profile',NULL,-1234,'OAUTH2'),(111,'internal_workflow_monitor_view','View Workflow',NULL,-1234,'OAUTH2'),(112,'internal_workflow_monitor_delete','Delete Workflow',NULL,-1234,'OAUTH2'),(113,'internal_email_mgt_update','Update Email Configs',NULL,-1234,'OAUTH2'),(114,'internal_email_mgt_create','Create Email Configs',NULL,-1234,'OAUTH2'),(115,'internal_email_mgt_delete','Delete Email Configs',NULL,-1234,'OAUTH2'),(116,'internal_email_mgt_view','View Email Configs',NULL,-1234,'OAUTH2'),(117,'internal_manage_provisioning','Manage User Provisioning',NULL,-1234,'OAUTH2'),(118,'internal_user_mgt_update','Update Users',NULL,-1234,'OAUTH2'),(119,'internal_user_mgt_delete','Deleate Users',NULL,-1234,'OAUTH2'),(120,'internal_user_mgt_list','List Users',NULL,-1234,'OAUTH2'),(121,'internal_user_mgt_view','View Users',NULL,-1234,'OAUTH2'),(122,'internal_user_mgt_create','Create Users',NULL,-1234,'OAUTH2'),(123,'internal_user_association_view','View User Associations',NULL,-1234,'OAUTH2'),(124,'internal_user_association_update','Update User Associations',NULL,-1234,'OAUTH2'),(125,'internal_user_association_delete','Delete User Associations',NULL,-1234,'OAUTH2'),(126,'internal_user_association_create','Create User Associations',NULL,-1234,'OAUTH2'),(127,'internal_user_count_delete','Delete User Count',NULL,-1234,'OAUTH2'),(128,'internal_user_count_view','View User Count',NULL,-1234,'OAUTH2'),(129,'internal_user_count_create','Create User Count',NULL,-1234,'OAUTH2'),(130,'internal_user_count_update','Update User Count',NULL,-1234,'OAUTH2'),(131,'internal_userstore_delete','Delete User Stores',NULL,-1234,'OAUTH2'),(132,'internal_userstore_create','Create User Stores',NULL,-1234,'OAUTH2'),(133,'internal_userstore_update','Update User Stores',NULL,-1234,'OAUTH2'),(134,'internal_userstore_view','View User Stores',NULL,-1234,'OAUTH2'),(135,'internal_functional_lib_update','Update Functional Library',NULL,-1234,'OAUTH2'),(136,'internal_functional_lib_create','Create Functional Library',NULL,-1234,'OAUTH2'),(137,'internal_functional_lib_delete','Delete Functional Library',NULL,-1234,'OAUTH2'),(138,'internal_functional_lib_view','View Functional Library',NULL,-1234,'OAUTH2'),(139,'internal_application_mgt_delete','Delete Applications',NULL,-1234,'OAUTH2'),(140,'internal_application_mgt_create','Create Applications',NULL,-1234,'OAUTH2'),(141,'internal_application_mgt_update','Update Applications',NULL,-1234,'OAUTH2'),(142,'internal_application_mgt_view','View Applications',NULL,-1234,'OAUTH2'),(143,'internal_role_mgt_create','Create Roles',NULL,-1234,'OAUTH2'),(144,'internal_role_mgt_delete','Delete Roles',NULL,-1234,'OAUTH2'),(145,'internal_role_mgt_view','View Roles',NULL,-1234,'OAUTH2'),(146,'internal_role_mgt_update','Update Roles',NULL,-1234,'OAUTH2'),(147,'internal_challenge_questions_delete','Delete Challenge Questions',NULL,-1234,'OAUTH2'),(148,'internal_challenge_questions_create','Create Challenge Questions',NULL,-1234,'OAUTH2'),(149,'internal_challenge_questions_update','Update Challenge Questions',NULL,-1234,'OAUTH2'),(150,'internal_challenge_questions_view','View Challenge Questions',NULL,-1234,'OAUTH2'),(151,'internal_sts_mgt_create','Create STS Configs',NULL,-1234,'OAUTH2'),(152,'internal_sts_mgt_delete','Delete STS Configs',NULL,-1234,'OAUTH2'),(153,'internal_sts_mgt_view','View STS Configs',NULL,-1234,'OAUTH2'),(154,'internal_sts_mgt_update','Update STS Configs',NULL,-1234,'OAUTH2'),(155,'internal_template_mgt_view','View Template Management',NULL,-1234,'OAUTH2'),(156,'internal_template_mgt_add','Add Template Management',NULL,-1234,'OAUTH2'),(157,'internal_template_mgt_delete','Delete Template Management',NULL,-1234,'OAUTH2'),(158,'internal_template_mgt_list','List Template Management',NULL,-1234,'OAUTH2'),(159,'internal_user_profile_view','View User Profile',NULL,-1234,'OAUTH2'),(160,'internal_user_profile_create','Create User Profile',NULL,-1234,'OAUTH2'),(161,'internal_user_profile_delete','Delete User Profile',NULL,-1234,'OAUTH2'),(162,'internal_user_profile_update','Update User Profile',NULL,-1234,'OAUTH2'),(163,'internal_event_publish','Publish Events',NULL,-1234,'OAUTH2'),(164,'internal_modify_module','Modify Modules',NULL,-1234,'OAUTH2'),(165,'internal_modify_webapp','Modify WebApps',NULL,-1234,'OAUTH2'),(166,'internal_modify_user_profile','Modify User Profile',NULL,-1234,'OAUTH2'),(167,'internal_modify_service','Modify Services',NULL,-1234,'OAUTH2'),(168,'internal_topic_delete','Delete Topic',NULL,-1234,'OAUTH2'),(169,'internal_topic_browse','Browse Topic',NULL,-1234,'OAUTH2'),(170,'internal_topic_purge','Purge Topic',NULL,-1234,'OAUTH2'),(171,'internal_topic_add','Add Topic',NULL,-1234,'OAUTH2'),(172,'internal_humantask_packages','Package Human Tasks',NULL,-1234,'OAUTH2'),(173,'internal_humantask_view','View Human Tasks',NULL,-1234,'OAUTH2'),(174,'internal_humantask_add','Add Human Tasks',NULL,-1234,'OAUTH2'),(175,'internal_humantask_task','Manage Human Tasks',NULL,-1234,'OAUTH2');
/*!40000 ALTER TABLE `IDN_OAUTH2_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_SCOPE_BINDING`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_SCOPE_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_SCOPE_BINDING` (
  `SCOPE_ID` int(11) NOT NULL,
  `SCOPE_BINDING` varchar(255) NOT NULL,
  `BINDING_TYPE` varchar(255) NOT NULL,
  KEY `IDX_SB_SCPID` (`SCOPE_ID`),
  CONSTRAINT `IDN_OAUTH2_SCOPE_BINDING_ibfk_1` FOREIGN KEY (`SCOPE_ID`) REFERENCES `IDN_OAUTH2_SCOPE` (`SCOPE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_SCOPE_BINDING`
--

LOCK TABLES `IDN_OAUTH2_SCOPE_BINDING` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_SCOPE_BINDING` DISABLE KEYS */;
INSERT INTO `IDN_OAUTH2_SCOPE_BINDING` VALUES (6,'/permission/protected/configure/components','PERMISSION'),(7,'/permission/protected/manage/modify/tenants','PERMISSION'),(8,'/permission/protected/manage/monitor/tenants/list','PERMISSION'),(9,'/permission/protected/server-admin/homepage','PERMISSION'),(10,'/permission/admin/monitor/metrics','PERMISSION'),(11,'/permission/admin/monitor/bpel','PERMISSION'),(12,'/permission/admin/monitor/attachment','PERMISSION'),(13,'/permission/admin/configure/security/usermgt/passwords','PERMISSION'),(14,'/permission/admin/configure/security/usermgt/profiles','PERMISSION'),(15,'/permission/admin/configure/security/usermgt/users','PERMISSION'),(16,'/permission/admin/configure/security/usermgt/provisioning','PERMISSION'),(17,'/permission/admin/configure/datasources','PERMISSION'),(18,'/permission/admin/configure/theme','PERMISSION'),(19,'everyone_permission','PERMISSION'),(20,'/permission/admin/manage/event-streams','PERMISSION'),(21,'/permission/admin/manage/search/advanced-search','PERMISSION'),(22,'/permission/admin/manage/search/resources','PERMISSION'),(23,'/permission/admin/manage/bpel/instance','PERMISSION'),(24,'/permission/admin/manage/bpel/processes','PERMISSION'),(25,'/permission/admin/manage/bpel/packages','PERMISSION'),(26,'/permission/admin/manage/bpel/add','PERMISSION'),(27,'/permission/admin/manage/resources/browse','PERMISSION'),(28,'/permission/admin/manage/resources/notifications','PERMISSION'),(29,'/permission/admin/manage/add/module','PERMISSION'),(30,'/permission/admin/manage/add/service','PERMISSION'),(31,'/permission/admin/manage/add/webapp','PERMISSION'),(32,'/permission/admin/manage/attachment','PERMISSION'),(33,'/permission/admin/manage/extensions/add','PERMISSION'),(34,'/permission/admin/manage/extensions/list','PERMISSION'),(35,'/permission/admin/manage/identity/pep','PERMISSION'),(36,'/permission/admin/manage/identity/securitymgt/update','PERMISSION'),(37,'/permission/admin/manage/identity/securitymgt/view','PERMISSION'),(38,'/permission/admin/manage/identity/securitymgt/create','PERMISSION'),(39,'/permission/admin/manage/identity/securitymgt/delete','PERMISSION'),(40,'/permission/admin/manage/identity/authentication/session/view','PERMISSION'),(41,'/permission/admin/manage/identity/authentication/session/delete','PERMISSION'),(42,'/permission/admin/manage/identity/claimmgt/metadata/create','PERMISSION'),(43,'/permission/admin/manage/identity/claimmgt/metadata/delete','PERMISSION'),(44,'/permission/admin/manage/identity/claimmgt/metadata/update','PERMISSION'),(45,'/permission/admin/manage/identity/claimmgt/metadata/view','PERMISSION'),(46,'/permission/admin/manage/identity/claimmgt/claim/view','PERMISSION'),(47,'/permission/admin/manage/identity/claimmgt/claim/update','PERMISSION'),(48,'/permission/admin/manage/identity/claimmgt/claim/create','PERMISSION'),(49,'/permission/admin/manage/identity/claimmgt/claim/delete','PERMISSION'),(50,'/permission/admin/manage/identity/userroleuimgt/create','PERMISSION'),(51,'/permission/admin/manage/identity/defaultauthSeq/view','PERMISSION'),(52,'/permission/admin/manage/identity/defaultauthSeq/update','PERMISSION'),(53,'/permission/admin/manage/identity/defaultauthSeq/create','PERMISSION'),(54,'/permission/admin/manage/identity/defaultauthSeq/delete','PERMISSION'),(55,'/permission/admin/manage/identity/entitlement/pap/policy/delete','PERMISSION'),(56,'/permission/admin/manage/identity/entitlement/pap/policy/publish','PERMISSION'),(57,'/permission/admin/manage/identity/entitlement/pap/policy/create','PERMISSION'),(58,'/permission/admin/manage/identity/entitlement/pap/policy/view','PERMISSION'),(59,'/permission/admin/manage/identity/entitlement/pap/policy/rollback','PERMISSION'),(60,'/permission/admin/manage/identity/entitlement/pap/policy/order','PERMISSION'),(61,'/permission/admin/manage/identity/entitlement/pap/policy/demote','PERMISSION'),(62,'/permission/admin/manage/identity/entitlement/pap/policy/update','PERMISSION'),(63,'/permission/admin/manage/identity/entitlement/pap/policy/enable','PERMISSION'),(64,'/permission/admin/manage/identity/entitlement/pap/policy/list','PERMISSION'),(65,'/permission/admin/manage/identity/entitlement/pap/subscriber/update','PERMISSION'),(66,'/permission/admin/manage/identity/entitlement/pap/subscriber/view','PERMISSION'),(67,'/permission/admin/manage/identity/entitlement/pap/subscriber/list','PERMISSION'),(68,'/permission/admin/manage/identity/entitlement/pap/subscriber/create','PERMISSION'),(69,'/permission/admin/manage/identity/entitlement/pap/subscriber/delete','PERMISSION'),(70,'/permission/admin/manage/identity/entitlement/pdp/view','PERMISSION'),(71,'/permission/admin/manage/identity/entitlement/pdp/manage','PERMISSION'),(72,'/permission/admin/manage/identity/entitlement/pdp/test','PERMISSION'),(73,'/permission/admin/manage/identity/entitlement/pep','PERMISSION'),(74,'/permission/admin/manage/identity/idpmgt/delete','PERMISSION'),(75,'/permission/admin/manage/identity/idpmgt/create','PERMISSION'),(76,'/permission/admin/manage/identity/idpmgt/view','PERMISSION'),(77,'/permission/admin/manage/identity/idpmgt/update','PERMISSION'),(78,'/permission/admin/manage/identity/configmgt/view','PERMISSION'),(79,'/permission/admin/manage/identity/configmgt/update','PERMISSION'),(80,'/permission/admin/manage/identity/configmgt/delete','PERMISSION'),(81,'/permission/admin/manage/identity/configmgt/list','PERMISSION'),(82,'/permission/admin/manage/identity/configmgt/add','PERMISSION'),(83,'/permission/admin/manage/identity/keystoremgt/view','PERMISSION'),(84,'/permission/admin/manage/identity/keystoremgt/update','PERMISSION'),(85,'/permission/admin/manage/identity/keystoremgt/delete','PERMISSION'),(86,'/permission/admin/manage/identity/keystoremgt/create','PERMISSION'),(87,'/permission/admin/manage/identity/consentmgt/list','PERMISSION'),(88,'/permission/admin/manage/identity/consentmgt/view','PERMISSION'),(89,'/permission/admin/manage/identity/consentmgt/add','PERMISSION'),(90,'/permission/admin/manage/identity/consentmgt/delete','PERMISSION'),(91,'/permission/admin/manage/identity/apptemplatemgt/view','PERMISSION'),(92,'/permission/admin/manage/identity/apptemplatemgt/update','PERMISSION'),(93,'/permission/admin/manage/identity/apptemplatemgt/delete','PERMISSION'),(94,'/permission/admin/manage/identity/apptemplatemgt/create','PERMISSION'),(95,'/permission/admin/manage/identity/identitymgt/view','PERMISSION'),(96,'/permission/admin/manage/identity/identitymgt/update','PERMISSION'),(97,'/permission/admin/manage/identity/identitymgt/create','PERMISSION'),(98,'/permission/admin/manage/identity/identitymgt/delete','PERMISSION'),(99,'/permission/admin/manage/identity/workflow/association/view','PERMISSION'),(100,'/permission/admin/manage/identity/workflow/association/delete','PERMISSION'),(101,'/permission/admin/manage/identity/workflow/association/create','PERMISSION'),(102,'/permission/admin/manage/identity/workflow/association/update','PERMISSION'),(103,'/permission/admin/manage/identity/workflow/definition/create','PERMISSION'),(104,'/permission/admin/manage/identity/workflow/definition/delete','PERMISSION'),(105,'/permission/admin/manage/identity/workflow/definition/view','PERMISSION'),(106,'/permission/admin/manage/identity/workflow/definition/update','PERMISSION'),(107,'/permission/admin/manage/identity/workflow/profile/view','PERMISSION'),(108,'/permission/admin/manage/identity/workflow/profile/create','PERMISSION'),(109,'/permission/admin/manage/identity/workflow/profile/delete','PERMISSION'),(110,'/permission/admin/manage/identity/workflow/profile/update','PERMISSION'),(111,'/permission/admin/manage/identity/workflow/monitor/view','PERMISSION'),(112,'/permission/admin/manage/identity/workflow/monitor/delete','PERMISSION'),(113,'/permission/admin/manage/identity/emailmgt/update','PERMISSION'),(114,'/permission/admin/manage/identity/emailmgt/create','PERMISSION'),(115,'/permission/admin/manage/identity/emailmgt/delete','PERMISSION'),(116,'/permission/admin/manage/identity/emailmgt/view','PERMISSION'),(117,'/permission/admin/manage/identity/provisioning','PERMISSION'),(118,'/permission/admin/manage/identity/usermgt/update','PERMISSION'),(119,'/permission/admin/manage/identity/usermgt/delete','PERMISSION'),(120,'/permission/admin/manage/identity/usermgt/list','PERMISSION'),(121,'/permission/admin/manage/identity/usermgt/view','PERMISSION'),(122,'/permission/admin/manage/identity/usermgt/create','PERMISSION'),(123,'/permission/admin/manage/identity/user/association/view','PERMISSION'),(124,'/permission/admin/manage/identity/user/association/update','PERMISSION'),(125,'/permission/admin/manage/identity/user/association/delete','PERMISSION'),(126,'/permission/admin/manage/identity/user/association/create','PERMISSION'),(127,'/permission/admin/manage/identity/userstore/count/delete','PERMISSION'),(128,'/permission/admin/manage/identity/userstore/count/view','PERMISSION'),(129,'/permission/admin/manage/identity/userstore/count/create','PERMISSION'),(130,'/permission/admin/manage/identity/userstore/count/update','PERMISSION'),(131,'/permission/admin/manage/identity/userstore/config/delete','PERMISSION'),(132,'/permission/admin/manage/identity/userstore/config/create','PERMISSION'),(133,'/permission/admin/manage/identity/userstore/config/update','PERMISSION'),(134,'/permission/admin/manage/identity/userstore/config/view','PERMISSION'),(135,'/permission/admin/manage/identity/functionsLibrarymgt/update','PERMISSION'),(136,'/permission/admin/manage/identity/functionsLibrarymgt/create','PERMISSION'),(137,'/permission/admin/manage/identity/functionsLibrarymgt/delete','PERMISSION'),(138,'/permission/admin/manage/identity/functionsLibrarymgt/view','PERMISSION'),(139,'/permission/admin/manage/identity/applicationmgt/delete','PERMISSION'),(140,'/permission/admin/manage/identity/applicationmgt/create','PERMISSION'),(141,'/permission/admin/manage/identity/applicationmgt/update','PERMISSION'),(142,'/permission/admin/manage/identity/applicationmgt/view','PERMISSION'),(143,'/permission/admin/manage/identity/rolemgt/create','PERMISSION'),(144,'/permission/admin/manage/identity/rolemgt/delete','PERMISSION'),(145,'/permission/admin/manage/identity/rolemgt/view','PERMISSION'),(146,'/permission/admin/manage/identity/rolemgt/update','PERMISSION'),(147,'/permission/admin/manage/identity/challenge/delete','PERMISSION'),(148,'/permission/admin/manage/identity/challenge/create','PERMISSION'),(149,'/permission/admin/manage/identity/challenge/update','PERMISSION'),(150,'/permission/admin/manage/identity/challenge/view','PERMISSION'),(151,'/permission/admin/manage/identity/stsmgt/create','PERMISSION'),(152,'/permission/admin/manage/identity/stsmgt/delete','PERMISSION'),(153,'/permission/admin/manage/identity/stsmgt/view','PERMISSION'),(154,'/permission/admin/manage/identity/stsmgt/update','PERMISSION'),(155,'/permission/admin/manage/identity/template/mgt/view','PERMISSION'),(156,'/permission/admin/manage/identity/template/mgt/add','PERMISSION'),(157,'/permission/admin/manage/identity/template/mgt/delete','PERMISSION'),(158,'/permission/admin/manage/identity/template/mgt/list','PERMISSION'),(159,'/permission/admin/manage/identity/userprofile/view','PERMISSION'),(160,'/permission/admin/manage/identity/userprofile/create','PERMISSION'),(161,'/permission/admin/manage/identity/userprofile/delete','PERMISSION'),(162,'/permission/admin/manage/identity/userprofile/update','PERMISSION'),(163,'/permission/admin/manage/event-publish','PERMISSION'),(164,'/permission/admin/manage/modify/module','PERMISSION'),(165,'/permission/admin/manage/modify/webapp','PERMISSION'),(166,'/permission/admin/manage/modify/user-profile','PERMISSION'),(167,'/permission/admin/manage/modify/service','PERMISSION'),(168,'/permission/admin/manage/topic/deleteTopic','PERMISSION'),(169,'/permission/admin/manage/topic/browseTopic','PERMISSION'),(170,'/permission/admin/manage/topic/purgeTopic','PERMISSION'),(171,'/permission/admin/manage/topic/addTopic','PERMISSION'),(172,'/permission/admin/manage/humantask/packages','PERMISSION'),(173,'/permission/admin/manage/humantask/viewtasks','PERMISSION'),(174,'/permission/admin/manage/humantask/add','PERMISSION'),(175,'/permission/admin/manage/humantask/task','PERMISSION');
/*!40000 ALTER TABLE `IDN_OAUTH2_SCOPE_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_SCOPE_VALIDATORS`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_SCOPE_VALIDATORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_SCOPE_VALIDATORS` (
  `APP_ID` int(11) NOT NULL,
  `SCOPE_VALIDATOR` varchar(128) NOT NULL,
  PRIMARY KEY (`APP_ID`,`SCOPE_VALIDATOR`),
  CONSTRAINT `IDN_OAUTH2_SCOPE_VALIDATORS_ibfk_1` FOREIGN KEY (`APP_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_SCOPE_VALIDATORS`
--

LOCK TABLES `IDN_OAUTH2_SCOPE_VALIDATORS` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_SCOPE_VALIDATORS` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_SCOPE_VALIDATORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH2_TOKEN_BINDING`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_TOKEN_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_TOKEN_BINDING` (
  `TOKEN_ID` varchar(255) NOT NULL,
  `TOKEN_BINDING_TYPE` varchar(32) DEFAULT NULL,
  `TOKEN_BINDING_REF` varchar(32) DEFAULT NULL,
  `TOKEN_BINDING_VALUE` varchar(1024) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`TOKEN_ID`),
  KEY `IDX_IDN_AUTH_BIND` (`TOKEN_BINDING_REF`),
  CONSTRAINT `IDN_OAUTH2_TOKEN_BINDING_ibfk_1` FOREIGN KEY (`TOKEN_ID`) REFERENCES `IDN_OAUTH2_ACCESS_TOKEN` (`TOKEN_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH2_TOKEN_BINDING`
--

LOCK TABLES `IDN_OAUTH2_TOKEN_BINDING` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH2_TOKEN_BINDING` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OAUTH2_TOKEN_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OAUTH_CONSUMER_APPS`
--

DROP TABLE IF EXISTS `IDN_OAUTH_CONSUMER_APPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH_CONSUMER_APPS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONSUMER_KEY` varchar(255) DEFAULT NULL,
  `CONSUMER_SECRET` varchar(2048) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '0',
  `USER_DOMAIN` varchar(50) DEFAULT NULL,
  `APP_NAME` varchar(255) DEFAULT NULL,
  `OAUTH_VERSION` varchar(128) DEFAULT NULL,
  `CALLBACK_URL` varchar(2048) DEFAULT NULL,
  `GRANT_TYPES` varchar(1024) DEFAULT NULL,
  `PKCE_MANDATORY` char(1) DEFAULT '0',
  `PKCE_SUPPORT_PLAIN` char(1) DEFAULT '0',
  `APP_STATE` varchar(25) DEFAULT 'ACTIVE',
  `USER_ACCESS_TOKEN_EXPIRE_TIME` bigint(20) DEFAULT '3600',
  `APP_ACCESS_TOKEN_EXPIRE_TIME` bigint(20) DEFAULT '3600',
  `REFRESH_TOKEN_EXPIRE_TIME` bigint(20) DEFAULT '84600',
  `ID_TOKEN_EXPIRE_TIME` bigint(20) DEFAULT '3600',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CONSUMER_KEY_CONSTRAINT` (`CONSUMER_KEY`),
  KEY `IDX_OCA_UM_TID_UD_APN` (`USERNAME`,`TENANT_ID`,`USER_DOMAIN`,`APP_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OAUTH_CONSUMER_APPS`
--

LOCK TABLES `IDN_OAUTH_CONSUMER_APPS` WRITE;
/*!40000 ALTER TABLE `IDN_OAUTH_CONSUMER_APPS` DISABLE KEYS */;
INSERT INTO `IDN_OAUTH_CONSUMER_APPS` VALUES (1,'tb2koOlUDFa84xnC3rLR1Ph3AqIa','9bDVP8yeZq7jZhBoVKSnc26VzcMa','apicreator1',-1234,'PRIMARY','rest_api_creator','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(2,'mnGU8mWmff6Us5fhBfYzUWUOhI0a','XxD1KchBeysAvoM48Tlm5blRLTka','apipublisher1',-1234,'PRIMARY','rest_api_publisher1','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(3,'7Aq9tbsdtS_tOlWQbTf5QiftJNsa','lNUfDXScN8uCT02HgLw856ZUkn0a','apisubscriber_1_1_1',-1234,'PRIMARY','rest_api_subscriber1_1_1','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(4,'kEX5j09zvfoQRAOHrcX3KUeC8uQa','A8iIiGsIqVhgYHSiqFCDOBLMdqQa','apisubscriber_1_1_1',-1234,'PRIMARY','apisubscriber_1_1_1_application_1_1_1_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(5,'TEb7jgiHESZYsYS4Rech8P1kbcga','hzJiOlqBtomfd9Y7O0D1zG2XwYwa','apisubscriber_1_1_2',-1234,'PRIMARY','rest_api_subscriber1_1_2','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(6,'5YPYkwfJpx7ftCTygag2BhHYk94a','U8r3IUa17DPsQM93J2UNXzjnBjAa','apisubscriber_1_1_2',-1234,'PRIMARY','apisubscriber_1_1_2_application_1_1_2_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(7,'EB64d3_uguTADQyZSJHmqvJS4iwa','jZ3aujGrqC9FCojoiUK3PidVRhYa','apisubscriber_1_1_3',-1234,'PRIMARY','rest_api_subscriber1_1_3','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(8,'aJIdU5WyC6dV_lhJ9yhGBfblzHga','yYOwFvOhLwsr2bMyJgaotF20EFwa','apisubscriber_1_1_3',-1234,'PRIMARY','apisubscriber_1_1_3_application_1_1_3_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(9,'alIcTNKzVGX9H_fk1JIwUYxjRgQa','3fBkwXfxi4gG8y2_wDDItxTofBIa','apisubscriber_1_1_4',-1234,'PRIMARY','rest_api_subscriber1_1_4','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(10,'HYtVwP6AZoQYLwDfrV81oXNlVWca','cfhLVaMo8dBPfVuX76CkqeF8QPsa','apisubscriber_1_1_4',-1234,'PRIMARY','apisubscriber_1_1_4_application_1_1_4_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(11,'RTZcoSpNGBELjwHTBFfvN90hZFka','XMNNPbQjCykh2fg8ShsrhoueR3Ea','apisubscriber_1_1_5',-1234,'PRIMARY','rest_api_subscriber1_1_5','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(12,'n9LyW8Lpa5PDLbj2eKxcFytphnEa','Me7kEUf3R5zmUo71JqmjJsGmYQ4a','apisubscriber_1_1_5',-1234,'PRIMARY','apisubscriber_1_1_5_application_1_1_5_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(13,'rZmXlVAYBKbrkDhVlaj2_rMz2RUa','55TVroDf0wjWbZ6qkMid_bh3wZUa','apisubscriber_1_2_6',-1234,'PRIMARY','rest_api_subscriber1_2_6','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(14,'5GdPz2NhybYtDGMblHCUf8xnC7Ia','_BH6h96Ssivqx7E7GJW8vQf27YMa','apisubscriber_1_2_6',-1234,'PRIMARY','apisubscriber_1_2_6_application_1_2_6_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(15,'voQKMdJOliwQmpKL0hooWNuROfAa','onEo5K9YYSOd5BLtdAiMo9sst0ga','apisubscriber_1_2_7',-1234,'PRIMARY','rest_api_subscriber1_2_7','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(16,'INu83DbS53iB2akgePCVxEvf9mIa','iEj62DYzhkfWos70UxSTfVoVY7ga','apisubscriber_1_2_7',-1234,'PRIMARY','apisubscriber_1_2_7_application_1_2_7_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(17,'51YjEFyDKfgsjjX23mX7CTipACEa','SvJjFUGlpAFDTcOJahNmN7Kz5Jka','apisubscriber_1_2_8',-1234,'PRIMARY','rest_api_subscriber1_2_8','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(18,'quZU7LfVSkYQwljVf1WLf1shBD0a','OcR0VRD7hZHHGK_XUvkfdTlW1rEa','apisubscriber_1_2_8',-1234,'PRIMARY','apisubscriber_1_2_8_application_1_2_8_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(19,'4rWKhvPw3rvfm87_aKlD3isS02ca','hdIEZLUCIfUtwAIPFO_UihzkuUQa','apisubscriber_1_2_9',-1234,'PRIMARY','rest_api_subscriber1_2_9','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(20,'SZjfZLAzmi0Wxirz8BRufXJ26VYa','jKGRjfEEdpORa1IhTRNhsFqTHFoa','apisubscriber_1_2_9',-1234,'PRIMARY','apisubscriber_1_2_9_application_1_2_9_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(21,'4jbO4vN_gfS8XhTlKOPW4dxv1C0a','veYnOXhqIcbo0EVZkpVOCqzz6YUa','apisubscriber_1_2_10',-1234,'PRIMARY','rest_api_subscriber1_2_10','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(22,'3W08GGqywwhEoyMGiusVkTDBx30a','O_ecwNgIx5i2ivrdN_m29dsf3T4a','apisubscriber_1_2_10',-1234,'PRIMARY','apisubscriber_1_2_10_application_1_2_10_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(23,'OWPnJ3TgXImSM2ZvbbgwRma8vxAa','dJBDk3Yh8dZvHX0_pfsp0HUHvrAa','apisubscriber_1_3_11',-1234,'PRIMARY','rest_api_subscriber1_3_11','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(24,'Qe6CfCgwP7werISqgkBaw3SGQbYa','h7rOGGKyEUlNKYGNTaIvYsO2bcAa','apisubscriber_1_3_11',-1234,'PRIMARY','apisubscriber_1_3_11_application_1_3_11_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(25,'hS20TB9fLb7sAeWCZuzLI0B75hIa','6xPfrIvW9YaI83ZS_Nn9fGh1bWYa','apisubscriber_1_3_12',-1234,'PRIMARY','rest_api_subscriber1_3_12','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(26,'U_2ME1uQEY__WgM5aovbcXyAJE4a','GaMILzvzXJVzcYAcSerSkZhYdV0a','apisubscriber_1_3_12',-1234,'PRIMARY','apisubscriber_1_3_12_application_1_3_12_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(27,'Zzbr7MqsFCTC65WPT1V1iKYUGEca','_W4z4pjWZmOB63y4a8JvIoFc4f4a','apisubscriber_1_3_13',-1234,'PRIMARY','rest_api_subscriber1_3_13','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(28,'LNx2QzZf9kwuuMKR5aBL5_egUUAa','ILftR4YTBWnJyRdoCkZLx5_NgSsa','apisubscriber_1_3_13',-1234,'PRIMARY','apisubscriber_1_3_13_application_1_3_13_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(29,'u3_AQtCy7VWkF2OnxeuiQfkY33Ya','zdL6EgmqHm1eIzbiNjSPNGHTXxIa','apisubscriber_1_3_14',-1234,'PRIMARY','rest_api_subscriber1_3_14','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600),(30,'HRQgUrNng7tLGcxG1hlp158gWHUa','53kkIbMk_KJaYcRfvnAfXJzvYGYa','apisubscriber_1_3_14',-1234,'PRIMARY','apisubscriber_1_3_14_application_1_3_14_PRODUCTION','OAuth-2.0','http://sample.com/callback/url','password client_credentials','0','0','ACTIVE',86400,86400,86400,3600),(31,'0LdviO09xTGEKGrMxQbUcRVWec4a','O5rahSADn7Npd0_R5il9ya98yiQa','apisubscriber_1_3_15',-1234,'PRIMARY','rest_api_subscriber1_3_15','OAuth-2.0','www.google.lk','password refresh_token','0','0','ACTIVE',86400,86400,86400,3600);
/*!40000 ALTER TABLE `IDN_OAUTH_CONSUMER_APPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OIDC_JTI`
--

DROP TABLE IF EXISTS `IDN_OIDC_JTI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OIDC_JTI` (
  `JWT_ID` varchar(255) NOT NULL,
  `EXP_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`JWT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OIDC_JTI`
--

LOCK TABLES `IDN_OIDC_JTI` WRITE;
/*!40000 ALTER TABLE `IDN_OIDC_JTI` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OIDC_JTI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OIDC_PROPERTY`
--

DROP TABLE IF EXISTS `IDN_OIDC_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OIDC_PROPERTY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `CONSUMER_KEY` varchar(255) DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) NOT NULL,
  `PROPERTY_VALUE` varchar(2047) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CONSUMER_KEY` (`CONSUMER_KEY`),
  KEY `IDX_IOP_TID_CK` (`TENANT_ID`,`CONSUMER_KEY`),
  CONSTRAINT `IDN_OIDC_PROPERTY_ibfk_1` FOREIGN KEY (`CONSUMER_KEY`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`CONSUMER_KEY`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OIDC_PROPERTY`
--

LOCK TABLES `IDN_OIDC_PROPERTY` WRITE;
/*!40000 ALTER TABLE `IDN_OIDC_PROPERTY` DISABLE KEYS */;
INSERT INTO `IDN_OIDC_PROPERTY` VALUES (1,-1234,'tb2koOlUDFa84xnC3rLR1Ph3AqIa','requestObjectSigned','false'),(2,-1234,'tb2koOlUDFa84xnC3rLR1Ph3AqIa','idTokenEncrypted','false'),(3,-1234,'tb2koOlUDFa84xnC3rLR1Ph3AqIa','idTokenEncryptionAlgorithm','null'),(4,-1234,'tb2koOlUDFa84xnC3rLR1Ph3AqIa','idTokenEncryptionMethod','null'),(5,-1234,'tb2koOlUDFa84xnC3rLR1Ph3AqIa','backChannelLogoutURL',NULL),(6,-1234,'tb2koOlUDFa84xnC3rLR1Ph3AqIa','frontchannelLogoutURL',NULL),(7,-1234,'tb2koOlUDFa84xnC3rLR1Ph3AqIa','tokenType','Default'),(8,-1234,'tb2koOlUDFa84xnC3rLR1Ph3AqIa','bypassClientCredentials','false'),(9,-1234,'tb2koOlUDFa84xnC3rLR1Ph3AqIa','renewRefreshToken',NULL),(10,-1234,'tb2koOlUDFa84xnC3rLR1Ph3AqIa','tokenBindingType',NULL),(11,-1234,'mnGU8mWmff6Us5fhBfYzUWUOhI0a','requestObjectSigned','false'),(12,-1234,'mnGU8mWmff6Us5fhBfYzUWUOhI0a','idTokenEncrypted','false'),(13,-1234,'mnGU8mWmff6Us5fhBfYzUWUOhI0a','idTokenEncryptionAlgorithm','null'),(14,-1234,'mnGU8mWmff6Us5fhBfYzUWUOhI0a','idTokenEncryptionMethod','null'),(15,-1234,'mnGU8mWmff6Us5fhBfYzUWUOhI0a','backChannelLogoutURL',NULL),(16,-1234,'mnGU8mWmff6Us5fhBfYzUWUOhI0a','frontchannelLogoutURL',NULL),(17,-1234,'mnGU8mWmff6Us5fhBfYzUWUOhI0a','tokenType','Default'),(18,-1234,'mnGU8mWmff6Us5fhBfYzUWUOhI0a','bypassClientCredentials','false'),(19,-1234,'mnGU8mWmff6Us5fhBfYzUWUOhI0a','renewRefreshToken',NULL),(20,-1234,'mnGU8mWmff6Us5fhBfYzUWUOhI0a','tokenBindingType',NULL),(21,-1234,'7Aq9tbsdtS_tOlWQbTf5QiftJNsa','requestObjectSigned','false'),(22,-1234,'7Aq9tbsdtS_tOlWQbTf5QiftJNsa','idTokenEncrypted','false'),(23,-1234,'7Aq9tbsdtS_tOlWQbTf5QiftJNsa','idTokenEncryptionAlgorithm','null'),(24,-1234,'7Aq9tbsdtS_tOlWQbTf5QiftJNsa','idTokenEncryptionMethod','null'),(25,-1234,'7Aq9tbsdtS_tOlWQbTf5QiftJNsa','backChannelLogoutURL',NULL),(26,-1234,'7Aq9tbsdtS_tOlWQbTf5QiftJNsa','frontchannelLogoutURL',NULL),(27,-1234,'7Aq9tbsdtS_tOlWQbTf5QiftJNsa','tokenType','Default'),(28,-1234,'7Aq9tbsdtS_tOlWQbTf5QiftJNsa','bypassClientCredentials','false'),(29,-1234,'7Aq9tbsdtS_tOlWQbTf5QiftJNsa','renewRefreshToken',NULL),(30,-1234,'7Aq9tbsdtS_tOlWQbTf5QiftJNsa','tokenBindingType',NULL),(31,-1234,'kEX5j09zvfoQRAOHrcX3KUeC8uQa','requestObjectSigned','false'),(32,-1234,'kEX5j09zvfoQRAOHrcX3KUeC8uQa','idTokenEncrypted','false'),(33,-1234,'kEX5j09zvfoQRAOHrcX3KUeC8uQa','idTokenEncryptionAlgorithm','null'),(34,-1234,'kEX5j09zvfoQRAOHrcX3KUeC8uQa','idTokenEncryptionMethod','null'),(35,-1234,'kEX5j09zvfoQRAOHrcX3KUeC8uQa','backChannelLogoutURL',NULL),(36,-1234,'kEX5j09zvfoQRAOHrcX3KUeC8uQa','frontchannelLogoutURL',NULL),(37,-1234,'kEX5j09zvfoQRAOHrcX3KUeC8uQa','tokenType','JWT'),(38,-1234,'kEX5j09zvfoQRAOHrcX3KUeC8uQa','bypassClientCredentials','false'),(39,-1234,'kEX5j09zvfoQRAOHrcX3KUeC8uQa','renewRefreshToken',NULL),(40,-1234,'kEX5j09zvfoQRAOHrcX3KUeC8uQa','tokenBindingType',NULL),(41,-1234,'TEb7jgiHESZYsYS4Rech8P1kbcga','requestObjectSigned','false'),(42,-1234,'TEb7jgiHESZYsYS4Rech8P1kbcga','idTokenEncrypted','false'),(43,-1234,'TEb7jgiHESZYsYS4Rech8P1kbcga','idTokenEncryptionAlgorithm','null'),(44,-1234,'TEb7jgiHESZYsYS4Rech8P1kbcga','idTokenEncryptionMethod','null'),(45,-1234,'TEb7jgiHESZYsYS4Rech8P1kbcga','backChannelLogoutURL',NULL),(46,-1234,'TEb7jgiHESZYsYS4Rech8P1kbcga','frontchannelLogoutURL',NULL),(47,-1234,'TEb7jgiHESZYsYS4Rech8P1kbcga','tokenType','Default'),(48,-1234,'TEb7jgiHESZYsYS4Rech8P1kbcga','bypassClientCredentials','false'),(49,-1234,'TEb7jgiHESZYsYS4Rech8P1kbcga','renewRefreshToken',NULL),(50,-1234,'TEb7jgiHESZYsYS4Rech8P1kbcga','tokenBindingType',NULL),(51,-1234,'5YPYkwfJpx7ftCTygag2BhHYk94a','requestObjectSigned','false'),(52,-1234,'5YPYkwfJpx7ftCTygag2BhHYk94a','idTokenEncrypted','false'),(53,-1234,'5YPYkwfJpx7ftCTygag2BhHYk94a','idTokenEncryptionAlgorithm','null'),(54,-1234,'5YPYkwfJpx7ftCTygag2BhHYk94a','idTokenEncryptionMethod','null'),(55,-1234,'5YPYkwfJpx7ftCTygag2BhHYk94a','backChannelLogoutURL',NULL),(56,-1234,'5YPYkwfJpx7ftCTygag2BhHYk94a','frontchannelLogoutURL',NULL),(57,-1234,'5YPYkwfJpx7ftCTygag2BhHYk94a','tokenType','JWT'),(58,-1234,'5YPYkwfJpx7ftCTygag2BhHYk94a','bypassClientCredentials','false'),(59,-1234,'5YPYkwfJpx7ftCTygag2BhHYk94a','renewRefreshToken',NULL),(60,-1234,'5YPYkwfJpx7ftCTygag2BhHYk94a','tokenBindingType',NULL),(61,-1234,'EB64d3_uguTADQyZSJHmqvJS4iwa','requestObjectSigned','false'),(62,-1234,'EB64d3_uguTADQyZSJHmqvJS4iwa','idTokenEncrypted','false'),(63,-1234,'EB64d3_uguTADQyZSJHmqvJS4iwa','idTokenEncryptionAlgorithm','null'),(64,-1234,'EB64d3_uguTADQyZSJHmqvJS4iwa','idTokenEncryptionMethod','null'),(65,-1234,'EB64d3_uguTADQyZSJHmqvJS4iwa','backChannelLogoutURL',NULL),(66,-1234,'EB64d3_uguTADQyZSJHmqvJS4iwa','frontchannelLogoutURL',NULL),(67,-1234,'EB64d3_uguTADQyZSJHmqvJS4iwa','tokenType','Default'),(68,-1234,'EB64d3_uguTADQyZSJHmqvJS4iwa','bypassClientCredentials','false'),(69,-1234,'EB64d3_uguTADQyZSJHmqvJS4iwa','renewRefreshToken',NULL),(70,-1234,'EB64d3_uguTADQyZSJHmqvJS4iwa','tokenBindingType',NULL),(71,-1234,'aJIdU5WyC6dV_lhJ9yhGBfblzHga','requestObjectSigned','false'),(72,-1234,'aJIdU5WyC6dV_lhJ9yhGBfblzHga','idTokenEncrypted','false'),(73,-1234,'aJIdU5WyC6dV_lhJ9yhGBfblzHga','idTokenEncryptionAlgorithm','null'),(74,-1234,'aJIdU5WyC6dV_lhJ9yhGBfblzHga','idTokenEncryptionMethod','null'),(75,-1234,'aJIdU5WyC6dV_lhJ9yhGBfblzHga','backChannelLogoutURL',NULL),(76,-1234,'aJIdU5WyC6dV_lhJ9yhGBfblzHga','frontchannelLogoutURL',NULL),(77,-1234,'aJIdU5WyC6dV_lhJ9yhGBfblzHga','tokenType','JWT'),(78,-1234,'aJIdU5WyC6dV_lhJ9yhGBfblzHga','bypassClientCredentials','false'),(79,-1234,'aJIdU5WyC6dV_lhJ9yhGBfblzHga','renewRefreshToken',NULL),(80,-1234,'aJIdU5WyC6dV_lhJ9yhGBfblzHga','tokenBindingType',NULL),(81,-1234,'alIcTNKzVGX9H_fk1JIwUYxjRgQa','requestObjectSigned','false'),(82,-1234,'alIcTNKzVGX9H_fk1JIwUYxjRgQa','idTokenEncrypted','false'),(83,-1234,'alIcTNKzVGX9H_fk1JIwUYxjRgQa','idTokenEncryptionAlgorithm','null'),(84,-1234,'alIcTNKzVGX9H_fk1JIwUYxjRgQa','idTokenEncryptionMethod','null'),(85,-1234,'alIcTNKzVGX9H_fk1JIwUYxjRgQa','backChannelLogoutURL',NULL),(86,-1234,'alIcTNKzVGX9H_fk1JIwUYxjRgQa','frontchannelLogoutURL',NULL),(87,-1234,'alIcTNKzVGX9H_fk1JIwUYxjRgQa','tokenType','Default'),(88,-1234,'alIcTNKzVGX9H_fk1JIwUYxjRgQa','bypassClientCredentials','false'),(89,-1234,'alIcTNKzVGX9H_fk1JIwUYxjRgQa','renewRefreshToken',NULL),(90,-1234,'alIcTNKzVGX9H_fk1JIwUYxjRgQa','tokenBindingType',NULL),(91,-1234,'HYtVwP6AZoQYLwDfrV81oXNlVWca','requestObjectSigned','false'),(92,-1234,'HYtVwP6AZoQYLwDfrV81oXNlVWca','idTokenEncrypted','false'),(93,-1234,'HYtVwP6AZoQYLwDfrV81oXNlVWca','idTokenEncryptionAlgorithm','null'),(94,-1234,'HYtVwP6AZoQYLwDfrV81oXNlVWca','idTokenEncryptionMethod','null'),(95,-1234,'HYtVwP6AZoQYLwDfrV81oXNlVWca','backChannelLogoutURL',NULL),(96,-1234,'HYtVwP6AZoQYLwDfrV81oXNlVWca','frontchannelLogoutURL',NULL),(97,-1234,'HYtVwP6AZoQYLwDfrV81oXNlVWca','tokenType','JWT'),(98,-1234,'HYtVwP6AZoQYLwDfrV81oXNlVWca','bypassClientCredentials','false'),(99,-1234,'HYtVwP6AZoQYLwDfrV81oXNlVWca','renewRefreshToken',NULL),(100,-1234,'HYtVwP6AZoQYLwDfrV81oXNlVWca','tokenBindingType',NULL),(101,-1234,'RTZcoSpNGBELjwHTBFfvN90hZFka','requestObjectSigned','false'),(102,-1234,'RTZcoSpNGBELjwHTBFfvN90hZFka','idTokenEncrypted','false'),(103,-1234,'RTZcoSpNGBELjwHTBFfvN90hZFka','idTokenEncryptionAlgorithm','null'),(104,-1234,'RTZcoSpNGBELjwHTBFfvN90hZFka','idTokenEncryptionMethod','null'),(105,-1234,'RTZcoSpNGBELjwHTBFfvN90hZFka','backChannelLogoutURL',NULL),(106,-1234,'RTZcoSpNGBELjwHTBFfvN90hZFka','frontchannelLogoutURL',NULL),(107,-1234,'RTZcoSpNGBELjwHTBFfvN90hZFka','tokenType','Default'),(108,-1234,'RTZcoSpNGBELjwHTBFfvN90hZFka','bypassClientCredentials','false'),(109,-1234,'RTZcoSpNGBELjwHTBFfvN90hZFka','renewRefreshToken',NULL),(110,-1234,'RTZcoSpNGBELjwHTBFfvN90hZFka','tokenBindingType',NULL),(111,-1234,'n9LyW8Lpa5PDLbj2eKxcFytphnEa','requestObjectSigned','false'),(112,-1234,'n9LyW8Lpa5PDLbj2eKxcFytphnEa','idTokenEncrypted','false'),(113,-1234,'n9LyW8Lpa5PDLbj2eKxcFytphnEa','idTokenEncryptionAlgorithm','null'),(114,-1234,'n9LyW8Lpa5PDLbj2eKxcFytphnEa','idTokenEncryptionMethod','null'),(115,-1234,'n9LyW8Lpa5PDLbj2eKxcFytphnEa','backChannelLogoutURL',NULL),(116,-1234,'n9LyW8Lpa5PDLbj2eKxcFytphnEa','frontchannelLogoutURL',NULL),(117,-1234,'n9LyW8Lpa5PDLbj2eKxcFytphnEa','tokenType','JWT'),(118,-1234,'n9LyW8Lpa5PDLbj2eKxcFytphnEa','bypassClientCredentials','false'),(119,-1234,'n9LyW8Lpa5PDLbj2eKxcFytphnEa','renewRefreshToken',NULL),(120,-1234,'n9LyW8Lpa5PDLbj2eKxcFytphnEa','tokenBindingType',NULL),(121,-1234,'rZmXlVAYBKbrkDhVlaj2_rMz2RUa','requestObjectSigned','false'),(122,-1234,'rZmXlVAYBKbrkDhVlaj2_rMz2RUa','idTokenEncrypted','false'),(123,-1234,'rZmXlVAYBKbrkDhVlaj2_rMz2RUa','idTokenEncryptionAlgorithm','null'),(124,-1234,'rZmXlVAYBKbrkDhVlaj2_rMz2RUa','idTokenEncryptionMethod','null'),(125,-1234,'rZmXlVAYBKbrkDhVlaj2_rMz2RUa','backChannelLogoutURL',NULL),(126,-1234,'rZmXlVAYBKbrkDhVlaj2_rMz2RUa','frontchannelLogoutURL',NULL),(127,-1234,'rZmXlVAYBKbrkDhVlaj2_rMz2RUa','tokenType','Default'),(128,-1234,'rZmXlVAYBKbrkDhVlaj2_rMz2RUa','bypassClientCredentials','false'),(129,-1234,'rZmXlVAYBKbrkDhVlaj2_rMz2RUa','renewRefreshToken',NULL),(130,-1234,'rZmXlVAYBKbrkDhVlaj2_rMz2RUa','tokenBindingType',NULL),(131,-1234,'5GdPz2NhybYtDGMblHCUf8xnC7Ia','requestObjectSigned','false'),(132,-1234,'5GdPz2NhybYtDGMblHCUf8xnC7Ia','idTokenEncrypted','false'),(133,-1234,'5GdPz2NhybYtDGMblHCUf8xnC7Ia','idTokenEncryptionAlgorithm','null'),(134,-1234,'5GdPz2NhybYtDGMblHCUf8xnC7Ia','idTokenEncryptionMethod','null'),(135,-1234,'5GdPz2NhybYtDGMblHCUf8xnC7Ia','backChannelLogoutURL',NULL),(136,-1234,'5GdPz2NhybYtDGMblHCUf8xnC7Ia','frontchannelLogoutURL',NULL),(137,-1234,'5GdPz2NhybYtDGMblHCUf8xnC7Ia','tokenType','JWT'),(138,-1234,'5GdPz2NhybYtDGMblHCUf8xnC7Ia','bypassClientCredentials','false'),(139,-1234,'5GdPz2NhybYtDGMblHCUf8xnC7Ia','renewRefreshToken',NULL),(140,-1234,'5GdPz2NhybYtDGMblHCUf8xnC7Ia','tokenBindingType',NULL),(141,-1234,'voQKMdJOliwQmpKL0hooWNuROfAa','requestObjectSigned','false'),(142,-1234,'voQKMdJOliwQmpKL0hooWNuROfAa','idTokenEncrypted','false'),(143,-1234,'voQKMdJOliwQmpKL0hooWNuROfAa','idTokenEncryptionAlgorithm','null'),(144,-1234,'voQKMdJOliwQmpKL0hooWNuROfAa','idTokenEncryptionMethod','null'),(145,-1234,'voQKMdJOliwQmpKL0hooWNuROfAa','backChannelLogoutURL',NULL),(146,-1234,'voQKMdJOliwQmpKL0hooWNuROfAa','frontchannelLogoutURL',NULL),(147,-1234,'voQKMdJOliwQmpKL0hooWNuROfAa','tokenType','Default'),(148,-1234,'voQKMdJOliwQmpKL0hooWNuROfAa','bypassClientCredentials','false'),(149,-1234,'voQKMdJOliwQmpKL0hooWNuROfAa','renewRefreshToken',NULL),(150,-1234,'voQKMdJOliwQmpKL0hooWNuROfAa','tokenBindingType',NULL),(151,-1234,'INu83DbS53iB2akgePCVxEvf9mIa','requestObjectSigned','false'),(152,-1234,'INu83DbS53iB2akgePCVxEvf9mIa','idTokenEncrypted','false'),(153,-1234,'INu83DbS53iB2akgePCVxEvf9mIa','idTokenEncryptionAlgorithm','null'),(154,-1234,'INu83DbS53iB2akgePCVxEvf9mIa','idTokenEncryptionMethod','null'),(155,-1234,'INu83DbS53iB2akgePCVxEvf9mIa','backChannelLogoutURL',NULL),(156,-1234,'INu83DbS53iB2akgePCVxEvf9mIa','frontchannelLogoutURL',NULL),(157,-1234,'INu83DbS53iB2akgePCVxEvf9mIa','tokenType','JWT'),(158,-1234,'INu83DbS53iB2akgePCVxEvf9mIa','bypassClientCredentials','false'),(159,-1234,'INu83DbS53iB2akgePCVxEvf9mIa','renewRefreshToken',NULL),(160,-1234,'INu83DbS53iB2akgePCVxEvf9mIa','tokenBindingType',NULL),(161,-1234,'51YjEFyDKfgsjjX23mX7CTipACEa','requestObjectSigned','false'),(162,-1234,'51YjEFyDKfgsjjX23mX7CTipACEa','idTokenEncrypted','false'),(163,-1234,'51YjEFyDKfgsjjX23mX7CTipACEa','idTokenEncryptionAlgorithm','null'),(164,-1234,'51YjEFyDKfgsjjX23mX7CTipACEa','idTokenEncryptionMethod','null'),(165,-1234,'51YjEFyDKfgsjjX23mX7CTipACEa','backChannelLogoutURL',NULL),(166,-1234,'51YjEFyDKfgsjjX23mX7CTipACEa','frontchannelLogoutURL',NULL),(167,-1234,'51YjEFyDKfgsjjX23mX7CTipACEa','tokenType','Default'),(168,-1234,'51YjEFyDKfgsjjX23mX7CTipACEa','bypassClientCredentials','false'),(169,-1234,'51YjEFyDKfgsjjX23mX7CTipACEa','renewRefreshToken',NULL),(170,-1234,'51YjEFyDKfgsjjX23mX7CTipACEa','tokenBindingType',NULL),(171,-1234,'quZU7LfVSkYQwljVf1WLf1shBD0a','requestObjectSigned','false'),(172,-1234,'quZU7LfVSkYQwljVf1WLf1shBD0a','idTokenEncrypted','false'),(173,-1234,'quZU7LfVSkYQwljVf1WLf1shBD0a','idTokenEncryptionAlgorithm','null'),(174,-1234,'quZU7LfVSkYQwljVf1WLf1shBD0a','idTokenEncryptionMethod','null'),(175,-1234,'quZU7LfVSkYQwljVf1WLf1shBD0a','backChannelLogoutURL',NULL),(176,-1234,'quZU7LfVSkYQwljVf1WLf1shBD0a','frontchannelLogoutURL',NULL),(177,-1234,'quZU7LfVSkYQwljVf1WLf1shBD0a','tokenType','JWT'),(178,-1234,'quZU7LfVSkYQwljVf1WLf1shBD0a','bypassClientCredentials','false'),(179,-1234,'quZU7LfVSkYQwljVf1WLf1shBD0a','renewRefreshToken',NULL),(180,-1234,'quZU7LfVSkYQwljVf1WLf1shBD0a','tokenBindingType',NULL),(181,-1234,'4rWKhvPw3rvfm87_aKlD3isS02ca','requestObjectSigned','false'),(182,-1234,'4rWKhvPw3rvfm87_aKlD3isS02ca','idTokenEncrypted','false'),(183,-1234,'4rWKhvPw3rvfm87_aKlD3isS02ca','idTokenEncryptionAlgorithm','null'),(184,-1234,'4rWKhvPw3rvfm87_aKlD3isS02ca','idTokenEncryptionMethod','null'),(185,-1234,'4rWKhvPw3rvfm87_aKlD3isS02ca','backChannelLogoutURL',NULL),(186,-1234,'4rWKhvPw3rvfm87_aKlD3isS02ca','frontchannelLogoutURL',NULL),(187,-1234,'4rWKhvPw3rvfm87_aKlD3isS02ca','tokenType','Default'),(188,-1234,'4rWKhvPw3rvfm87_aKlD3isS02ca','bypassClientCredentials','false'),(189,-1234,'4rWKhvPw3rvfm87_aKlD3isS02ca','renewRefreshToken',NULL),(190,-1234,'4rWKhvPw3rvfm87_aKlD3isS02ca','tokenBindingType',NULL),(191,-1234,'SZjfZLAzmi0Wxirz8BRufXJ26VYa','requestObjectSigned','false'),(192,-1234,'SZjfZLAzmi0Wxirz8BRufXJ26VYa','idTokenEncrypted','false'),(193,-1234,'SZjfZLAzmi0Wxirz8BRufXJ26VYa','idTokenEncryptionAlgorithm','null'),(194,-1234,'SZjfZLAzmi0Wxirz8BRufXJ26VYa','idTokenEncryptionMethod','null'),(195,-1234,'SZjfZLAzmi0Wxirz8BRufXJ26VYa','backChannelLogoutURL',NULL),(196,-1234,'SZjfZLAzmi0Wxirz8BRufXJ26VYa','frontchannelLogoutURL',NULL),(197,-1234,'SZjfZLAzmi0Wxirz8BRufXJ26VYa','tokenType','JWT'),(198,-1234,'SZjfZLAzmi0Wxirz8BRufXJ26VYa','bypassClientCredentials','false'),(199,-1234,'SZjfZLAzmi0Wxirz8BRufXJ26VYa','renewRefreshToken',NULL),(200,-1234,'SZjfZLAzmi0Wxirz8BRufXJ26VYa','tokenBindingType',NULL),(201,-1234,'4jbO4vN_gfS8XhTlKOPW4dxv1C0a','requestObjectSigned','false'),(202,-1234,'4jbO4vN_gfS8XhTlKOPW4dxv1C0a','idTokenEncrypted','false'),(203,-1234,'4jbO4vN_gfS8XhTlKOPW4dxv1C0a','idTokenEncryptionAlgorithm','null'),(204,-1234,'4jbO4vN_gfS8XhTlKOPW4dxv1C0a','idTokenEncryptionMethod','null'),(205,-1234,'4jbO4vN_gfS8XhTlKOPW4dxv1C0a','backChannelLogoutURL',NULL),(206,-1234,'4jbO4vN_gfS8XhTlKOPW4dxv1C0a','frontchannelLogoutURL',NULL),(207,-1234,'4jbO4vN_gfS8XhTlKOPW4dxv1C0a','tokenType','Default'),(208,-1234,'4jbO4vN_gfS8XhTlKOPW4dxv1C0a','bypassClientCredentials','false'),(209,-1234,'4jbO4vN_gfS8XhTlKOPW4dxv1C0a','renewRefreshToken',NULL),(210,-1234,'4jbO4vN_gfS8XhTlKOPW4dxv1C0a','tokenBindingType',NULL),(211,-1234,'3W08GGqywwhEoyMGiusVkTDBx30a','requestObjectSigned','false'),(212,-1234,'3W08GGqywwhEoyMGiusVkTDBx30a','idTokenEncrypted','false'),(213,-1234,'3W08GGqywwhEoyMGiusVkTDBx30a','idTokenEncryptionAlgorithm','null'),(214,-1234,'3W08GGqywwhEoyMGiusVkTDBx30a','idTokenEncryptionMethod','null'),(215,-1234,'3W08GGqywwhEoyMGiusVkTDBx30a','backChannelLogoutURL',NULL),(216,-1234,'3W08GGqywwhEoyMGiusVkTDBx30a','frontchannelLogoutURL',NULL),(217,-1234,'3W08GGqywwhEoyMGiusVkTDBx30a','tokenType','JWT'),(218,-1234,'3W08GGqywwhEoyMGiusVkTDBx30a','bypassClientCredentials','false'),(219,-1234,'3W08GGqywwhEoyMGiusVkTDBx30a','renewRefreshToken',NULL),(220,-1234,'3W08GGqywwhEoyMGiusVkTDBx30a','tokenBindingType',NULL),(221,-1234,'OWPnJ3TgXImSM2ZvbbgwRma8vxAa','requestObjectSigned','false'),(222,-1234,'OWPnJ3TgXImSM2ZvbbgwRma8vxAa','idTokenEncrypted','false'),(223,-1234,'OWPnJ3TgXImSM2ZvbbgwRma8vxAa','idTokenEncryptionAlgorithm','null'),(224,-1234,'OWPnJ3TgXImSM2ZvbbgwRma8vxAa','idTokenEncryptionMethod','null'),(225,-1234,'OWPnJ3TgXImSM2ZvbbgwRma8vxAa','backChannelLogoutURL',NULL),(226,-1234,'OWPnJ3TgXImSM2ZvbbgwRma8vxAa','frontchannelLogoutURL',NULL),(227,-1234,'OWPnJ3TgXImSM2ZvbbgwRma8vxAa','tokenType','Default'),(228,-1234,'OWPnJ3TgXImSM2ZvbbgwRma8vxAa','bypassClientCredentials','false'),(229,-1234,'OWPnJ3TgXImSM2ZvbbgwRma8vxAa','renewRefreshToken',NULL),(230,-1234,'OWPnJ3TgXImSM2ZvbbgwRma8vxAa','tokenBindingType',NULL),(231,-1234,'Qe6CfCgwP7werISqgkBaw3SGQbYa','requestObjectSigned','false'),(232,-1234,'Qe6CfCgwP7werISqgkBaw3SGQbYa','idTokenEncrypted','false'),(233,-1234,'Qe6CfCgwP7werISqgkBaw3SGQbYa','idTokenEncryptionAlgorithm','null'),(234,-1234,'Qe6CfCgwP7werISqgkBaw3SGQbYa','idTokenEncryptionMethod','null'),(235,-1234,'Qe6CfCgwP7werISqgkBaw3SGQbYa','backChannelLogoutURL',NULL),(236,-1234,'Qe6CfCgwP7werISqgkBaw3SGQbYa','frontchannelLogoutURL',NULL),(237,-1234,'Qe6CfCgwP7werISqgkBaw3SGQbYa','tokenType','JWT'),(238,-1234,'Qe6CfCgwP7werISqgkBaw3SGQbYa','bypassClientCredentials','false'),(239,-1234,'Qe6CfCgwP7werISqgkBaw3SGQbYa','renewRefreshToken',NULL),(240,-1234,'Qe6CfCgwP7werISqgkBaw3SGQbYa','tokenBindingType',NULL),(241,-1234,'hS20TB9fLb7sAeWCZuzLI0B75hIa','requestObjectSigned','false'),(242,-1234,'hS20TB9fLb7sAeWCZuzLI0B75hIa','idTokenEncrypted','false'),(243,-1234,'hS20TB9fLb7sAeWCZuzLI0B75hIa','idTokenEncryptionAlgorithm','null'),(244,-1234,'hS20TB9fLb7sAeWCZuzLI0B75hIa','idTokenEncryptionMethod','null'),(245,-1234,'hS20TB9fLb7sAeWCZuzLI0B75hIa','backChannelLogoutURL',NULL),(246,-1234,'hS20TB9fLb7sAeWCZuzLI0B75hIa','frontchannelLogoutURL',NULL),(247,-1234,'hS20TB9fLb7sAeWCZuzLI0B75hIa','tokenType','Default'),(248,-1234,'hS20TB9fLb7sAeWCZuzLI0B75hIa','bypassClientCredentials','false'),(249,-1234,'hS20TB9fLb7sAeWCZuzLI0B75hIa','renewRefreshToken',NULL),(250,-1234,'hS20TB9fLb7sAeWCZuzLI0B75hIa','tokenBindingType',NULL),(251,-1234,'U_2ME1uQEY__WgM5aovbcXyAJE4a','requestObjectSigned','false'),(252,-1234,'U_2ME1uQEY__WgM5aovbcXyAJE4a','idTokenEncrypted','false'),(253,-1234,'U_2ME1uQEY__WgM5aovbcXyAJE4a','idTokenEncryptionAlgorithm','null'),(254,-1234,'U_2ME1uQEY__WgM5aovbcXyAJE4a','idTokenEncryptionMethod','null'),(255,-1234,'U_2ME1uQEY__WgM5aovbcXyAJE4a','backChannelLogoutURL',NULL),(256,-1234,'U_2ME1uQEY__WgM5aovbcXyAJE4a','frontchannelLogoutURL',NULL),(257,-1234,'U_2ME1uQEY__WgM5aovbcXyAJE4a','tokenType','JWT'),(258,-1234,'U_2ME1uQEY__WgM5aovbcXyAJE4a','bypassClientCredentials','false'),(259,-1234,'U_2ME1uQEY__WgM5aovbcXyAJE4a','renewRefreshToken',NULL),(260,-1234,'U_2ME1uQEY__WgM5aovbcXyAJE4a','tokenBindingType',NULL),(261,-1234,'Zzbr7MqsFCTC65WPT1V1iKYUGEca','requestObjectSigned','false'),(262,-1234,'Zzbr7MqsFCTC65WPT1V1iKYUGEca','idTokenEncrypted','false'),(263,-1234,'Zzbr7MqsFCTC65WPT1V1iKYUGEca','idTokenEncryptionAlgorithm','null'),(264,-1234,'Zzbr7MqsFCTC65WPT1V1iKYUGEca','idTokenEncryptionMethod','null'),(265,-1234,'Zzbr7MqsFCTC65WPT1V1iKYUGEca','backChannelLogoutURL',NULL),(266,-1234,'Zzbr7MqsFCTC65WPT1V1iKYUGEca','frontchannelLogoutURL',NULL),(267,-1234,'Zzbr7MqsFCTC65WPT1V1iKYUGEca','tokenType','Default'),(268,-1234,'Zzbr7MqsFCTC65WPT1V1iKYUGEca','bypassClientCredentials','false'),(269,-1234,'Zzbr7MqsFCTC65WPT1V1iKYUGEca','renewRefreshToken',NULL),(270,-1234,'Zzbr7MqsFCTC65WPT1V1iKYUGEca','tokenBindingType',NULL),(271,-1234,'LNx2QzZf9kwuuMKR5aBL5_egUUAa','requestObjectSigned','false'),(272,-1234,'LNx2QzZf9kwuuMKR5aBL5_egUUAa','idTokenEncrypted','false'),(273,-1234,'LNx2QzZf9kwuuMKR5aBL5_egUUAa','idTokenEncryptionAlgorithm','null'),(274,-1234,'LNx2QzZf9kwuuMKR5aBL5_egUUAa','idTokenEncryptionMethod','null'),(275,-1234,'LNx2QzZf9kwuuMKR5aBL5_egUUAa','backChannelLogoutURL',NULL),(276,-1234,'LNx2QzZf9kwuuMKR5aBL5_egUUAa','frontchannelLogoutURL',NULL),(277,-1234,'LNx2QzZf9kwuuMKR5aBL5_egUUAa','tokenType','JWT'),(278,-1234,'LNx2QzZf9kwuuMKR5aBL5_egUUAa','bypassClientCredentials','false'),(279,-1234,'LNx2QzZf9kwuuMKR5aBL5_egUUAa','renewRefreshToken',NULL),(280,-1234,'LNx2QzZf9kwuuMKR5aBL5_egUUAa','tokenBindingType',NULL),(281,-1234,'u3_AQtCy7VWkF2OnxeuiQfkY33Ya','requestObjectSigned','false'),(282,-1234,'u3_AQtCy7VWkF2OnxeuiQfkY33Ya','idTokenEncrypted','false'),(283,-1234,'u3_AQtCy7VWkF2OnxeuiQfkY33Ya','idTokenEncryptionAlgorithm','null'),(284,-1234,'u3_AQtCy7VWkF2OnxeuiQfkY33Ya','idTokenEncryptionMethod','null'),(285,-1234,'u3_AQtCy7VWkF2OnxeuiQfkY33Ya','backChannelLogoutURL',NULL),(286,-1234,'u3_AQtCy7VWkF2OnxeuiQfkY33Ya','frontchannelLogoutURL',NULL),(287,-1234,'u3_AQtCy7VWkF2OnxeuiQfkY33Ya','tokenType','Default'),(288,-1234,'u3_AQtCy7VWkF2OnxeuiQfkY33Ya','bypassClientCredentials','false'),(289,-1234,'u3_AQtCy7VWkF2OnxeuiQfkY33Ya','renewRefreshToken',NULL),(290,-1234,'u3_AQtCy7VWkF2OnxeuiQfkY33Ya','tokenBindingType',NULL),(291,-1234,'HRQgUrNng7tLGcxG1hlp158gWHUa','requestObjectSigned','false'),(292,-1234,'HRQgUrNng7tLGcxG1hlp158gWHUa','idTokenEncrypted','false'),(293,-1234,'HRQgUrNng7tLGcxG1hlp158gWHUa','idTokenEncryptionAlgorithm','null'),(294,-1234,'HRQgUrNng7tLGcxG1hlp158gWHUa','idTokenEncryptionMethod','null'),(295,-1234,'HRQgUrNng7tLGcxG1hlp158gWHUa','backChannelLogoutURL',NULL),(296,-1234,'HRQgUrNng7tLGcxG1hlp158gWHUa','frontchannelLogoutURL',NULL),(297,-1234,'HRQgUrNng7tLGcxG1hlp158gWHUa','tokenType','JWT'),(298,-1234,'HRQgUrNng7tLGcxG1hlp158gWHUa','bypassClientCredentials','false'),(299,-1234,'HRQgUrNng7tLGcxG1hlp158gWHUa','renewRefreshToken',NULL),(300,-1234,'HRQgUrNng7tLGcxG1hlp158gWHUa','tokenBindingType',NULL),(301,-1234,'0LdviO09xTGEKGrMxQbUcRVWec4a','requestObjectSigned','false'),(302,-1234,'0LdviO09xTGEKGrMxQbUcRVWec4a','idTokenEncrypted','false'),(303,-1234,'0LdviO09xTGEKGrMxQbUcRVWec4a','idTokenEncryptionAlgorithm','null'),(304,-1234,'0LdviO09xTGEKGrMxQbUcRVWec4a','idTokenEncryptionMethod','null'),(305,-1234,'0LdviO09xTGEKGrMxQbUcRVWec4a','backChannelLogoutURL',NULL),(306,-1234,'0LdviO09xTGEKGrMxQbUcRVWec4a','frontchannelLogoutURL',NULL),(307,-1234,'0LdviO09xTGEKGrMxQbUcRVWec4a','tokenType','Default'),(308,-1234,'0LdviO09xTGEKGrMxQbUcRVWec4a','bypassClientCredentials','false'),(309,-1234,'0LdviO09xTGEKGrMxQbUcRVWec4a','renewRefreshToken',NULL),(310,-1234,'0LdviO09xTGEKGrMxQbUcRVWec4a','tokenBindingType',NULL);
/*!40000 ALTER TABLE `IDN_OIDC_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OIDC_REQ_OBJECT_CLAIMS`
--

DROP TABLE IF EXISTS `IDN_OIDC_REQ_OBJECT_CLAIMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OIDC_REQ_OBJECT_CLAIMS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REQ_OBJECT_ID` int(11) DEFAULT NULL,
  `CLAIM_ATTRIBUTE` varchar(255) DEFAULT NULL,
  `ESSENTIAL` char(1) NOT NULL DEFAULT '0',
  `VALUE` varchar(255) DEFAULT NULL,
  `IS_USERINFO` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `REQ_OBJECT_ID` (`REQ_OBJECT_ID`),
  CONSTRAINT `IDN_OIDC_REQ_OBJECT_CLAIMS_ibfk_1` FOREIGN KEY (`REQ_OBJECT_ID`) REFERENCES `IDN_OIDC_REQ_OBJECT_REFERENCE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OIDC_REQ_OBJECT_CLAIMS`
--

LOCK TABLES `IDN_OIDC_REQ_OBJECT_CLAIMS` WRITE;
/*!40000 ALTER TABLE `IDN_OIDC_REQ_OBJECT_CLAIMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OIDC_REQ_OBJECT_CLAIMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OIDC_REQ_OBJECT_REFERENCE`
--

DROP TABLE IF EXISTS `IDN_OIDC_REQ_OBJECT_REFERENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OIDC_REQ_OBJECT_REFERENCE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONSUMER_KEY_ID` int(11) DEFAULT NULL,
  `CODE_ID` varchar(255) DEFAULT NULL,
  `TOKEN_ID` varchar(255) DEFAULT NULL,
  `SESSION_DATA_KEY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CONSUMER_KEY_ID` (`CONSUMER_KEY_ID`),
  KEY `CODE_ID` (`CODE_ID`),
  KEY `IDX_OROR_TID` (`TOKEN_ID`),
  CONSTRAINT `IDN_OIDC_REQ_OBJECT_REFERENCE_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `IDN_OIDC_REQ_OBJECT_REFERENCE_ibfk_2` FOREIGN KEY (`TOKEN_ID`) REFERENCES `IDN_OAUTH2_ACCESS_TOKEN` (`TOKEN_ID`) ON DELETE CASCADE,
  CONSTRAINT `IDN_OIDC_REQ_OBJECT_REFERENCE_ibfk_3` FOREIGN KEY (`CODE_ID`) REFERENCES `IDN_OAUTH2_AUTHORIZATION_CODE` (`CODE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OIDC_REQ_OBJECT_REFERENCE`
--

LOCK TABLES `IDN_OIDC_REQ_OBJECT_REFERENCE` WRITE;
/*!40000 ALTER TABLE `IDN_OIDC_REQ_OBJECT_REFERENCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OIDC_REQ_OBJECT_REFERENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OIDC_REQ_OBJ_CLAIM_VALUES`
--

DROP TABLE IF EXISTS `IDN_OIDC_REQ_OBJ_CLAIM_VALUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OIDC_REQ_OBJ_CLAIM_VALUES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REQ_OBJECT_CLAIMS_ID` int(11) DEFAULT NULL,
  `CLAIM_VALUES` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `REQ_OBJECT_CLAIMS_ID` (`REQ_OBJECT_CLAIMS_ID`),
  CONSTRAINT `IDN_OIDC_REQ_OBJ_CLAIM_VALUES_ibfk_1` FOREIGN KEY (`REQ_OBJECT_CLAIMS_ID`) REFERENCES `IDN_OIDC_REQ_OBJECT_CLAIMS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OIDC_REQ_OBJ_CLAIM_VALUES`
--

LOCK TABLES `IDN_OIDC_REQ_OBJ_CLAIM_VALUES` WRITE;
/*!40000 ALTER TABLE `IDN_OIDC_REQ_OBJ_CLAIM_VALUES` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OIDC_REQ_OBJ_CLAIM_VALUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OIDC_SCOPE_CLAIM_MAPPING`
--

DROP TABLE IF EXISTS `IDN_OIDC_SCOPE_CLAIM_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OIDC_SCOPE_CLAIM_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SCOPE_ID` int(11) NOT NULL,
  `EXTERNAL_CLAIM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SCOPE_ID` (`SCOPE_ID`,`EXTERNAL_CLAIM_ID`),
  KEY `EXTERNAL_CLAIM_ID` (`EXTERNAL_CLAIM_ID`),
  KEY `IDX_AT_SI_ECI` (`SCOPE_ID`,`EXTERNAL_CLAIM_ID`),
  CONSTRAINT `IDN_OIDC_SCOPE_CLAIM_MAPPING_ibfk_1` FOREIGN KEY (`SCOPE_ID`) REFERENCES `IDN_OAUTH2_SCOPE` (`SCOPE_ID`) ON DELETE CASCADE,
  CONSTRAINT `IDN_OIDC_SCOPE_CLAIM_MAPPING_ibfk_2` FOREIGN KEY (`EXTERNAL_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OIDC_SCOPE_CLAIM_MAPPING`
--

LOCK TABLES `IDN_OIDC_SCOPE_CLAIM_MAPPING` WRITE;
/*!40000 ALTER TABLE `IDN_OIDC_SCOPE_CLAIM_MAPPING` DISABLE KEYS */;
INSERT INTO `IDN_OIDC_SCOPE_CLAIM_MAPPING` VALUES (6,1,92),(14,1,112),(4,1,118),(22,1,122),(8,1,135),(21,1,136),(1,1,148),(11,1,151),(16,1,177),(19,1,179),(26,1,186),(18,1,189),(15,1,191),(3,1,198),(7,1,204),(12,1,208),(23,1,211),(20,1,217),(17,1,219),(27,1,225),(28,1,226),(24,1,241),(9,1,242),(2,1,250),(13,1,252),(25,1,256),(5,1,263),(10,1,271),(29,2,112),(30,2,208),(34,3,92),(32,3,118),(40,3,122),(36,3,135),(38,3,136),(43,3,151),(35,3,177),(37,3,217),(44,3,226),(42,3,241),(39,3,242),(31,3,252),(33,3,263),(41,3,271),(45,4,179),(46,4,256),(48,5,191),(47,5,250);
/*!40000 ALTER TABLE `IDN_OIDC_SCOPE_CLAIM_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OPENID_ASSOCIATIONS`
--

DROP TABLE IF EXISTS `IDN_OPENID_ASSOCIATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OPENID_ASSOCIATIONS` (
  `HANDLE` varchar(255) NOT NULL,
  `ASSOC_TYPE` varchar(255) NOT NULL,
  `EXPIRE_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MAC_KEY` varchar(255) NOT NULL,
  `ASSOC_STORE` varchar(128) DEFAULT 'SHARED',
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`HANDLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OPENID_ASSOCIATIONS`
--

LOCK TABLES `IDN_OPENID_ASSOCIATIONS` WRITE;
/*!40000 ALTER TABLE `IDN_OPENID_ASSOCIATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OPENID_ASSOCIATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OPENID_REMEMBER_ME`
--

DROP TABLE IF EXISTS `IDN_OPENID_REMEMBER_ME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OPENID_REMEMBER_ME` (
  `USER_NAME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `COOKIE_VALUE` varchar(1024) DEFAULT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`USER_NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OPENID_REMEMBER_ME`
--

LOCK TABLES `IDN_OPENID_REMEMBER_ME` WRITE;
/*!40000 ALTER TABLE `IDN_OPENID_REMEMBER_ME` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OPENID_REMEMBER_ME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_OPENID_USER_RPS`
--

DROP TABLE IF EXISTS `IDN_OPENID_USER_RPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OPENID_USER_RPS` (
  `USER_NAME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `RP_URL` varchar(255) NOT NULL,
  `TRUSTED_ALWAYS` varchar(128) DEFAULT 'FALSE',
  `LAST_VISIT` date NOT NULL,
  `VISIT_COUNT` int(11) DEFAULT '0',
  `DEFAULT_PROFILE_NAME` varchar(255) DEFAULT 'DEFAULT',
  PRIMARY KEY (`USER_NAME`,`TENANT_ID`,`RP_URL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_OPENID_USER_RPS`
--

LOCK TABLES `IDN_OPENID_USER_RPS` WRITE;
/*!40000 ALTER TABLE `IDN_OPENID_USER_RPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_OPENID_USER_RPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_PASSWORD_HISTORY_DATA`
--

DROP TABLE IF EXISTS `IDN_PASSWORD_HISTORY_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_PASSWORD_HISTORY_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(127) NOT NULL,
  `USER_DOMAIN` varchar(50) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  `SALT_VALUE` varchar(255) DEFAULT NULL,
  `HASH` varchar(255) NOT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_NAME` (`USER_NAME`,`USER_DOMAIN`,`TENANT_ID`,`SALT_VALUE`,`HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_PASSWORD_HISTORY_DATA`
--

LOCK TABLES `IDN_PASSWORD_HISTORY_DATA` WRITE;
/*!40000 ALTER TABLE `IDN_PASSWORD_HISTORY_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_PASSWORD_HISTORY_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_RECOVERY_DATA`
--

DROP TABLE IF EXISTS `IDN_RECOVERY_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_RECOVERY_DATA` (
  `USER_NAME` varchar(255) NOT NULL,
  `USER_DOMAIN` varchar(127) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1',
  `CODE` varchar(255) NOT NULL,
  `SCENARIO` varchar(255) NOT NULL,
  `STEP` varchar(127) NOT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `REMAINING_SETS` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`USER_NAME`,`USER_DOMAIN`,`TENANT_ID`,`SCENARIO`,`STEP`),
  UNIQUE KEY `CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_RECOVERY_DATA`
--

LOCK TABLES `IDN_RECOVERY_DATA` WRITE;
/*!40000 ALTER TABLE `IDN_RECOVERY_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_RECOVERY_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_SAML2_ARTIFACT_STORE`
--

DROP TABLE IF EXISTS `IDN_SAML2_ARTIFACT_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_SAML2_ARTIFACT_STORE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SOURCE_ID` varchar(255) NOT NULL,
  `MESSAGE_HANDLER` varchar(255) NOT NULL,
  `AUTHN_REQ_DTO` blob NOT NULL,
  `SESSION_ID` varchar(255) NOT NULL,
  `EXP_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `INIT_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ASSERTION_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_SAML2_ARTIFACT_STORE`
--

LOCK TABLES `IDN_SAML2_ARTIFACT_STORE` WRITE;
/*!40000 ALTER TABLE `IDN_SAML2_ARTIFACT_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_SAML2_ARTIFACT_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_SAML2_ASSERTION_STORE`
--

DROP TABLE IF EXISTS `IDN_SAML2_ASSERTION_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_SAML2_ASSERTION_STORE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SAML2_ID` varchar(255) DEFAULT NULL,
  `SAML2_ISSUER` varchar(255) DEFAULT NULL,
  `SAML2_SUBJECT` varchar(255) DEFAULT NULL,
  `SAML2_SESSION_INDEX` varchar(255) DEFAULT NULL,
  `SAML2_AUTHN_CONTEXT_CLASS_REF` varchar(255) DEFAULT NULL,
  `SAML2_ASSERTION` varchar(4096) DEFAULT NULL,
  `ASSERTION` blob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_SAML2_ASSERTION_STORE`
--

LOCK TABLES `IDN_SAML2_ASSERTION_STORE` WRITE;
/*!40000 ALTER TABLE `IDN_SAML2_ASSERTION_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_SAML2_ASSERTION_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_SCIM_GROUP`
--

DROP TABLE IF EXISTS `IDN_SCIM_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_SCIM_GROUP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(255) NOT NULL,
  `ATTR_NAME` varchar(1024) NOT NULL,
  `ATTR_VALUE` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_IDN_SCIM_GROUP_TI_RN` (`TENANT_ID`,`ROLE_NAME`),
  KEY `IDX_IDN_SCIM_GROUP_TI_RN_AN` (`TENANT_ID`,`ROLE_NAME`,`ATTR_NAME`(500))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_SCIM_GROUP`
--

LOCK TABLES `IDN_SCIM_GROUP` WRITE;
/*!40000 ALTER TABLE `IDN_SCIM_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_SCIM_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_STS_STORE`
--

DROP TABLE IF EXISTS `IDN_STS_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_STS_STORE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TOKEN_ID` varchar(255) NOT NULL,
  `TOKEN_CONTENT` blob NOT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EXPIRE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATE` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_STS_STORE`
--

LOCK TABLES `IDN_STS_STORE` WRITE;
/*!40000 ALTER TABLE `IDN_STS_STORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_STS_STORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_THRIFT_SESSION`
--

DROP TABLE IF EXISTS `IDN_THRIFT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_THRIFT_SESSION` (
  `SESSION_ID` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `CREATED_TIME` varchar(255) NOT NULL,
  `LAST_MODIFIED_TIME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`SESSION_ID`),
  KEY `IDX_ITS_LMT` (`LAST_MODIFIED_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_THRIFT_SESSION`
--

LOCK TABLES `IDN_THRIFT_SESSION` WRITE;
/*!40000 ALTER TABLE `IDN_THRIFT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_THRIFT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_UMA_PERMISSION_TICKET`
--

DROP TABLE IF EXISTS `IDN_UMA_PERMISSION_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_UMA_PERMISSION_TICKET` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PT` varchar(255) NOT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EXPIRY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TICKET_STATE` varchar(25) DEFAULT 'ACTIVE',
  `TENANT_ID` int(11) DEFAULT '-1234',
  PRIMARY KEY (`ID`),
  KEY `IDX_PT` (`PT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_UMA_PERMISSION_TICKET`
--

LOCK TABLES `IDN_UMA_PERMISSION_TICKET` WRITE;
/*!40000 ALTER TABLE `IDN_UMA_PERMISSION_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_UMA_PERMISSION_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_UMA_PT_RESOURCE`
--

DROP TABLE IF EXISTS `IDN_UMA_PT_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_UMA_PT_RESOURCE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PT_RESOURCE_ID` int(11) NOT NULL,
  `PT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PT_ID` (`PT_ID`),
  KEY `PT_RESOURCE_ID` (`PT_RESOURCE_ID`),
  CONSTRAINT `IDN_UMA_PT_RESOURCE_ibfk_1` FOREIGN KEY (`PT_ID`) REFERENCES `IDN_UMA_PERMISSION_TICKET` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `IDN_UMA_PT_RESOURCE_ibfk_2` FOREIGN KEY (`PT_RESOURCE_ID`) REFERENCES `IDN_UMA_RESOURCE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_UMA_PT_RESOURCE`
--

LOCK TABLES `IDN_UMA_PT_RESOURCE` WRITE;
/*!40000 ALTER TABLE `IDN_UMA_PT_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_UMA_PT_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_UMA_PT_RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `IDN_UMA_PT_RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_UMA_PT_RESOURCE_SCOPE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PT_RESOURCE_ID` int(11) NOT NULL,
  `PT_SCOPE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PT_RESOURCE_ID` (`PT_RESOURCE_ID`),
  KEY `PT_SCOPE_ID` (`PT_SCOPE_ID`),
  CONSTRAINT `IDN_UMA_PT_RESOURCE_SCOPE_ibfk_1` FOREIGN KEY (`PT_RESOURCE_ID`) REFERENCES `IDN_UMA_PT_RESOURCE` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `IDN_UMA_PT_RESOURCE_SCOPE_ibfk_2` FOREIGN KEY (`PT_SCOPE_ID`) REFERENCES `IDN_UMA_RESOURCE_SCOPE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_UMA_PT_RESOURCE_SCOPE`
--

LOCK TABLES `IDN_UMA_PT_RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `IDN_UMA_PT_RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_UMA_PT_RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_UMA_RESOURCE`
--

DROP TABLE IF EXISTS `IDN_UMA_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_UMA_RESOURCE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RESOURCE_ID` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME` varchar(255) DEFAULT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `RESOURCE_OWNER_NAME` varchar(255) DEFAULT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1234',
  `USER_DOMAIN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_RID` (`RESOURCE_ID`),
  KEY `IDX_USER` (`RESOURCE_OWNER_NAME`,`USER_DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_UMA_RESOURCE`
--

LOCK TABLES `IDN_UMA_RESOURCE` WRITE;
/*!40000 ALTER TABLE `IDN_UMA_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_UMA_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_UMA_RESOURCE_META_DATA`
--

DROP TABLE IF EXISTS `IDN_UMA_RESOURCE_META_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_UMA_RESOURCE_META_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RESOURCE_IDENTITY` int(11) NOT NULL,
  `PROPERTY_KEY` varchar(40) DEFAULT NULL,
  `PROPERTY_VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `RESOURCE_IDENTITY` (`RESOURCE_IDENTITY`),
  CONSTRAINT `IDN_UMA_RESOURCE_META_DATA_ibfk_1` FOREIGN KEY (`RESOURCE_IDENTITY`) REFERENCES `IDN_UMA_RESOURCE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_UMA_RESOURCE_META_DATA`
--

LOCK TABLES `IDN_UMA_RESOURCE_META_DATA` WRITE;
/*!40000 ALTER TABLE `IDN_UMA_RESOURCE_META_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_UMA_RESOURCE_META_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_UMA_RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `IDN_UMA_RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_UMA_RESOURCE_SCOPE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RESOURCE_IDENTITY` int(11) NOT NULL,
  `SCOPE_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `RESOURCE_IDENTITY` (`RESOURCE_IDENTITY`),
  KEY `IDX_RS` (`SCOPE_NAME`),
  CONSTRAINT `IDN_UMA_RESOURCE_SCOPE_ibfk_1` FOREIGN KEY (`RESOURCE_IDENTITY`) REFERENCES `IDN_UMA_RESOURCE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_UMA_RESOURCE_SCOPE`
--

LOCK TABLES `IDN_UMA_RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `IDN_UMA_RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_UMA_RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDN_USER_ACCOUNT_ASSOCIATION`
--

DROP TABLE IF EXISTS `IDN_USER_ACCOUNT_ASSOCIATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_USER_ACCOUNT_ASSOCIATION` (
  `ASSOCIATION_KEY` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DOMAIN_NAME` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`TENANT_ID`,`DOMAIN_NAME`,`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDN_USER_ACCOUNT_ASSOCIATION`
--

LOCK TABLES `IDN_USER_ACCOUNT_ASSOCIATION` WRITE;
/*!40000 ALTER TABLE `IDN_USER_ACCOUNT_ASSOCIATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDN_USER_ACCOUNT_ASSOCIATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP`
--

DROP TABLE IF EXISTS `IDP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `NAME` varchar(254) NOT NULL,
  `IS_ENABLED` char(1) NOT NULL DEFAULT '1',
  `IS_PRIMARY` char(1) NOT NULL DEFAULT '0',
  `HOME_REALM_ID` varchar(254) DEFAULT NULL,
  `IMAGE` mediumblob,
  `CERTIFICATE` blob,
  `ALIAS` varchar(254) DEFAULT NULL,
  `INBOUND_PROV_ENABLED` char(1) NOT NULL DEFAULT '0',
  `INBOUND_PROV_USER_STORE_ID` varchar(254) DEFAULT NULL,
  `USER_CLAIM_URI` varchar(254) DEFAULT NULL,
  `ROLE_CLAIM_URI` varchar(254) DEFAULT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `DEFAULT_AUTHENTICATOR_NAME` varchar(254) DEFAULT NULL,
  `DEFAULT_PRO_CONNECTOR_NAME` varchar(254) DEFAULT NULL,
  `PROVISIONING_ROLE` varchar(128) DEFAULT NULL,
  `IS_FEDERATION_HUB` char(1) NOT NULL DEFAULT '0',
  `IS_LOCAL_CLAIM_DIALECT` char(1) NOT NULL DEFAULT '0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `IMAGE_URL` varchar(1024) DEFAULT NULL,
  `UUID` char(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UUID` (`UUID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP`
--

LOCK TABLES `IDP` WRITE;
/*!40000 ALTER TABLE `IDP` DISABLE KEYS */;
INSERT INTO `IDP` VALUES (1,-1234,'LOCAL','1','1','localhost',NULL,_binary '[]',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,'d323d14e-d3ce-4bfa-92cf-e626189b2199');
/*!40000 ALTER TABLE `IDP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_AUTHENTICATOR`
--

DROP TABLE IF EXISTS `IDP_AUTHENTICATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_AUTHENTICATOR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `IDP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `IS_ENABLED` char(1) DEFAULT '1',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`IDP_ID`,`NAME`),
  KEY `IDP_ID` (`IDP_ID`),
  CONSTRAINT `IDP_AUTHENTICATOR_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_AUTHENTICATOR`
--

LOCK TABLES `IDP_AUTHENTICATOR` WRITE;
/*!40000 ALTER TABLE `IDP_AUTHENTICATOR` DISABLE KEYS */;
INSERT INTO `IDP_AUTHENTICATOR` VALUES (1,-1234,1,'passivests','0',NULL),(2,-1234,1,'samlsso','0',NULL),(3,-1234,1,'openidconnect','0',NULL);
/*!40000 ALTER TABLE `IDP_AUTHENTICATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_AUTHENTICATOR_PROPERTY`
--

DROP TABLE IF EXISTS `IDP_AUTHENTICATOR_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_AUTHENTICATOR_PROPERTY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `AUTHENTICATOR_ID` int(11) DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) NOT NULL,
  `PROPERTY_VALUE` varchar(2047) DEFAULT NULL,
  `IS_SECRET` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`AUTHENTICATOR_ID`,`PROPERTY_KEY`),
  KEY `AUTHENTICATOR_ID` (`AUTHENTICATOR_ID`),
  CONSTRAINT `IDP_AUTHENTICATOR_PROPERTY_ibfk_1` FOREIGN KEY (`AUTHENTICATOR_ID`) REFERENCES `IDP_AUTHENTICATOR` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_AUTHENTICATOR_PROPERTY`
--

LOCK TABLES `IDP_AUTHENTICATOR_PROPERTY` WRITE;
/*!40000 ALTER TABLE `IDP_AUTHENTICATOR_PROPERTY` DISABLE KEYS */;
INSERT INTO `IDP_AUTHENTICATOR_PROPERTY` VALUES (1,-1234,1,'IdPEntityId','localhost','0'),(2,-1234,2,'IdPEntityId','localhost','0'),(3,-1234,2,'SAMLMetadataSigningEnabled','false','0'),(4,-1234,2,'SAMLMetadataValidityPeriod','60','0'),(5,-1234,2,'samlAuthnRequestsSigningEnabled','false','0'),(6,-1234,3,'IdPEntityId','https://localhost:9443/oauth2/token','0');
/*!40000 ALTER TABLE `IDP_AUTHENTICATOR_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_CLAIM`
--

DROP TABLE IF EXISTS `IDP_CLAIM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_CLAIM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_ID` int(11) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `CLAIM` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_ID` (`IDP_ID`,`CLAIM`),
  CONSTRAINT `IDP_CLAIM_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_CLAIM`
--

LOCK TABLES `IDP_CLAIM` WRITE;
/*!40000 ALTER TABLE `IDP_CLAIM` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_CLAIM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_CLAIM_MAPPING`
--

DROP TABLE IF EXISTS `IDP_CLAIM_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_CLAIM_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_CLAIM_ID` int(11) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `LOCAL_CLAIM` varchar(253) DEFAULT NULL,
  `DEFAULT_VALUE` varchar(255) DEFAULT NULL,
  `IS_REQUESTED` varchar(128) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_CLAIM_ID` (`IDP_CLAIM_ID`,`TENANT_ID`,`LOCAL_CLAIM`),
  CONSTRAINT `IDP_CLAIM_MAPPING_ibfk_1` FOREIGN KEY (`IDP_CLAIM_ID`) REFERENCES `IDP_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_CLAIM_MAPPING`
--

LOCK TABLES `IDP_CLAIM_MAPPING` WRITE;
/*!40000 ALTER TABLE `IDP_CLAIM_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_CLAIM_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_LOCAL_CLAIM`
--

DROP TABLE IF EXISTS `IDP_LOCAL_CLAIM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_LOCAL_CLAIM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `IDP_ID` int(11) DEFAULT NULL,
  `CLAIM_URI` varchar(255) NOT NULL,
  `DEFAULT_VALUE` varchar(255) DEFAULT NULL,
  `IS_REQUESTED` varchar(128) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`IDP_ID`,`CLAIM_URI`),
  KEY `IDP_ID` (`IDP_ID`),
  CONSTRAINT `IDP_LOCAL_CLAIM_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_LOCAL_CLAIM`
--

LOCK TABLES `IDP_LOCAL_CLAIM` WRITE;
/*!40000 ALTER TABLE `IDP_LOCAL_CLAIM` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_LOCAL_CLAIM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_METADATA`
--

DROP TABLE IF EXISTS `IDP_METADATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_METADATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_METADATA_CONSTRAINT` (`IDP_ID`,`NAME`),
  CONSTRAINT `IDP_METADATA_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_METADATA`
--

LOCK TABLES `IDP_METADATA` WRITE;
/*!40000 ALTER TABLE `IDP_METADATA` DISABLE KEYS */;
INSERT INTO `IDP_METADATA` VALUES (1,1,'RememberMeTimeout','20160',NULL,-1234),(2,1,'SessionIdleTimeout','15',NULL,-1234),(3,1,'PASSWORD_PROVISIONING_ENABLED','false',NULL,-1234),(4,1,'MODIFY_USERNAME_ENABLED','false',NULL,-1234),(5,1,'PROMPT_CONSENT_ENABLED','false',NULL,-1234);
/*!40000 ALTER TABLE `IDP_METADATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_PROVISIONING_CONFIG`
--

DROP TABLE IF EXISTS `IDP_PROVISIONING_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_PROVISIONING_CONFIG` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `IDP_ID` int(11) DEFAULT NULL,
  `PROVISIONING_CONNECTOR_TYPE` varchar(255) NOT NULL,
  `IS_ENABLED` char(1) DEFAULT '0',
  `IS_BLOCKING` char(1) DEFAULT '0',
  `IS_RULES_ENABLED` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`IDP_ID`,`PROVISIONING_CONNECTOR_TYPE`),
  KEY `IDP_ID` (`IDP_ID`),
  CONSTRAINT `IDP_PROVISIONING_CONFIG_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_PROVISIONING_CONFIG`
--

LOCK TABLES `IDP_PROVISIONING_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_PROVISIONING_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_PROVISIONING_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_PROVISIONING_ENTITY`
--

DROP TABLE IF EXISTS `IDP_PROVISIONING_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_PROVISIONING_ENTITY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROVISIONING_CONFIG_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `ENTITY_LOCAL_USERSTORE` varchar(255) NOT NULL,
  `ENTITY_NAME` varchar(255) NOT NULL,
  `ENTITY_VALUE` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `ENTITY_LOCAL_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ENTITY_TYPE` (`ENTITY_TYPE`,`TENANT_ID`,`ENTITY_LOCAL_USERSTORE`,`ENTITY_NAME`,`PROVISIONING_CONFIG_ID`),
  UNIQUE KEY `PROVISIONING_CONFIG_ID` (`PROVISIONING_CONFIG_ID`,`ENTITY_TYPE`,`ENTITY_VALUE`),
  CONSTRAINT `IDP_PROVISIONING_ENTITY_ibfk_1` FOREIGN KEY (`PROVISIONING_CONFIG_ID`) REFERENCES `IDP_PROVISIONING_CONFIG` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_PROVISIONING_ENTITY`
--

LOCK TABLES `IDP_PROVISIONING_ENTITY` WRITE;
/*!40000 ALTER TABLE `IDP_PROVISIONING_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_PROVISIONING_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_PROV_CONFIG_PROPERTY`
--

DROP TABLE IF EXISTS `IDP_PROV_CONFIG_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_PROV_CONFIG_PROPERTY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `PROVISIONING_CONFIG_ID` int(11) DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) NOT NULL,
  `PROPERTY_VALUE` varchar(2048) DEFAULT NULL,
  `PROPERTY_BLOB_VALUE` blob,
  `PROPERTY_TYPE` char(32) NOT NULL,
  `IS_SECRET` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`PROVISIONING_CONFIG_ID`,`PROPERTY_KEY`),
  KEY `PROVISIONING_CONFIG_ID` (`PROVISIONING_CONFIG_ID`),
  CONSTRAINT `IDP_PROV_CONFIG_PROPERTY_ibfk_1` FOREIGN KEY (`PROVISIONING_CONFIG_ID`) REFERENCES `IDP_PROVISIONING_CONFIG` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_PROV_CONFIG_PROPERTY`
--

LOCK TABLES `IDP_PROV_CONFIG_PROPERTY` WRITE;
/*!40000 ALTER TABLE `IDP_PROV_CONFIG_PROPERTY` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_PROV_CONFIG_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_ROLE`
--

DROP TABLE IF EXISTS `IDP_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_ROLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_ID` int(11) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `ROLE` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_ID` (`IDP_ID`,`ROLE`),
  CONSTRAINT `IDP_ROLE_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_ROLE`
--

LOCK TABLES `IDP_ROLE` WRITE;
/*!40000 ALTER TABLE `IDP_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `IDP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_ROLE_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_ROLE_ID` int(11) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `USER_STORE_ID` varchar(253) DEFAULT NULL,
  `LOCAL_ROLE` varchar(253) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_ROLE_ID` (`IDP_ROLE_ID`,`TENANT_ID`,`USER_STORE_ID`,`LOCAL_ROLE`),
  CONSTRAINT `IDP_ROLE_MAPPING_ibfk_1` FOREIGN KEY (`IDP_ROLE_ID`) REFERENCES `IDP_ROLE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_ROLE_MAPPING`
--

LOCK TABLES `IDP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `IDP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_APP`
--

DROP TABLE IF EXISTS `SP_APP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_APP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `APP_NAME` varchar(255) NOT NULL,
  `USER_STORE` varchar(255) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `ROLE_CLAIM` varchar(512) DEFAULT NULL,
  `AUTH_TYPE` varchar(255) NOT NULL,
  `PROVISIONING_USERSTORE_DOMAIN` varchar(512) DEFAULT NULL,
  `IS_LOCAL_CLAIM_DIALECT` char(1) DEFAULT '1',
  `IS_SEND_LOCAL_SUBJECT_ID` char(1) DEFAULT '0',
  `IS_SEND_AUTH_LIST_OF_IDPS` char(1) DEFAULT '0',
  `IS_USE_TENANT_DOMAIN_SUBJECT` char(1) DEFAULT '1',
  `IS_USE_USER_DOMAIN_SUBJECT` char(1) DEFAULT '1',
  `ENABLE_AUTHORIZATION` char(1) DEFAULT '0',
  `SUBJECT_CLAIM_URI` varchar(512) DEFAULT NULL,
  `IS_SAAS_APP` char(1) DEFAULT '0',
  `IS_DUMB_MODE` char(1) DEFAULT '0',
  `UUID` char(36) DEFAULT NULL,
  `IMAGE_URL` varchar(1024) DEFAULT NULL,
  `ACCESS_URL` varchar(1024) DEFAULT NULL,
  `IS_DISCOVERABLE` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `APPLICATION_NAME_CONSTRAINT` (`APP_NAME`,`TENANT_ID`),
  UNIQUE KEY `APPLICATION_UUID_CONSTRAINT` (`UUID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_APP`
--

LOCK TABLES `SP_APP` WRITE;
/*!40000 ALTER TABLE `SP_APP` DISABLE KEYS */;
INSERT INTO `SP_APP` VALUES (1,-1234,'rest_api_creator','PRIMARY','apicreator1','Service Provider for application rest_api_creator',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','1edc5bf8-fc6f-4b57-8f28-8710a4d795a6',NULL,NULL,'0'),(2,-1234,'rest_api_publisher1','PRIMARY','apipublisher1','Service Provider for application rest_api_publisher1',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','cabd98ba-6701-46ae-9503-48796f7264b6',NULL,NULL,'0'),(3,-1234,'rest_api_subscriber1_1_1','PRIMARY','apisubscriber_1_1_1','Service Provider for application rest_api_subscriber1_1_1',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','7cd4d2cc-fde3-4449-b861-5cb2da0bf87b',NULL,NULL,'0'),(4,-1234,'apisubscriber_1_1_1_application_1_1_1_PRODUCTION','PRIMARY','apisubscriber_1_1_1','Service Provider for application apisubscriber_1_1_1_application_1_1_1_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','0c33a1ac-08f5-4b8f-a635-7edacd48d485',NULL,NULL,'0'),(5,-1234,'rest_api_subscriber1_1_2','PRIMARY','apisubscriber_1_1_2','Service Provider for application rest_api_subscriber1_1_2',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','ae1ed0c9-9a2d-421d-9158-65718604d3db',NULL,NULL,'0'),(6,-1234,'apisubscriber_1_1_2_application_1_1_2_PRODUCTION','PRIMARY','apisubscriber_1_1_2','Service Provider for application apisubscriber_1_1_2_application_1_1_2_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','31d9447a-397f-48d9-af13-0c87c08b6fbe',NULL,NULL,'0'),(7,-1234,'rest_api_subscriber1_1_3','PRIMARY','apisubscriber_1_1_3','Service Provider for application rest_api_subscriber1_1_3',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','d41592b8-6e3f-43b8-bdba-4754500477e6',NULL,NULL,'0'),(8,-1234,'apisubscriber_1_1_3_application_1_1_3_PRODUCTION','PRIMARY','apisubscriber_1_1_3','Service Provider for application apisubscriber_1_1_3_application_1_1_3_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','4ccc8604-a433-4283-9583-68ce848c9309',NULL,NULL,'0'),(9,-1234,'rest_api_subscriber1_1_4','PRIMARY','apisubscriber_1_1_4','Service Provider for application rest_api_subscriber1_1_4',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','270b64ef-973a-42aa-88e8-35ee1c6c755d',NULL,NULL,'0'),(10,-1234,'apisubscriber_1_1_4_application_1_1_4_PRODUCTION','PRIMARY','apisubscriber_1_1_4','Service Provider for application apisubscriber_1_1_4_application_1_1_4_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','6bdee32e-e9c8-4c0b-806b-99ea96a0a9c0',NULL,NULL,'0'),(11,-1234,'rest_api_subscriber1_1_5','PRIMARY','apisubscriber_1_1_5','Service Provider for application rest_api_subscriber1_1_5',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','d14658f4-0168-46b6-aad5-7ab60f9cdbbb',NULL,NULL,'0'),(12,-1234,'apisubscriber_1_1_5_application_1_1_5_PRODUCTION','PRIMARY','apisubscriber_1_1_5','Service Provider for application apisubscriber_1_1_5_application_1_1_5_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','9e7fce76-2dcd-4e07-b005-2a5bde79383c',NULL,NULL,'0'),(13,-1234,'rest_api_subscriber1_2_6','PRIMARY','apisubscriber_1_2_6','Service Provider for application rest_api_subscriber1_2_6',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','5e257b0f-9bd1-4d32-9a7f-d2994e8e120b',NULL,NULL,'0'),(14,-1234,'apisubscriber_1_2_6_application_1_2_6_PRODUCTION','PRIMARY','apisubscriber_1_2_6','Service Provider for application apisubscriber_1_2_6_application_1_2_6_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','37c9ba96-d9ad-49d2-878f-e4c523dd657c',NULL,NULL,'0'),(15,-1234,'rest_api_subscriber1_2_7','PRIMARY','apisubscriber_1_2_7','Service Provider for application rest_api_subscriber1_2_7',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','7df786c9-502f-438e-839e-6195cb989850',NULL,NULL,'0'),(16,-1234,'apisubscriber_1_2_7_application_1_2_7_PRODUCTION','PRIMARY','apisubscriber_1_2_7','Service Provider for application apisubscriber_1_2_7_application_1_2_7_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','3949db80-dd30-4597-bc57-ef772a6deffe',NULL,NULL,'0'),(17,-1234,'rest_api_subscriber1_2_8','PRIMARY','apisubscriber_1_2_8','Service Provider for application rest_api_subscriber1_2_8',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','bfc6f470-03de-478f-b5bb-347c24cc03a1',NULL,NULL,'0'),(18,-1234,'apisubscriber_1_2_8_application_1_2_8_PRODUCTION','PRIMARY','apisubscriber_1_2_8','Service Provider for application apisubscriber_1_2_8_application_1_2_8_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','66c47b8a-b54e-464d-9b6c-16b812b8c313',NULL,NULL,'0'),(19,-1234,'rest_api_subscriber1_2_9','PRIMARY','apisubscriber_1_2_9','Service Provider for application rest_api_subscriber1_2_9',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','9203c274-77c9-43a0-8c8d-dd41aa596683',NULL,NULL,'0'),(20,-1234,'apisubscriber_1_2_9_application_1_2_9_PRODUCTION','PRIMARY','apisubscriber_1_2_9','Service Provider for application apisubscriber_1_2_9_application_1_2_9_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','ed365f05-f51b-42c8-9c33-bde0463b7657',NULL,NULL,'0'),(21,-1234,'rest_api_subscriber1_2_10','PRIMARY','apisubscriber_1_2_10','Service Provider for application rest_api_subscriber1_2_10',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','31208aae-54bc-4c99-933d-835d961387b1',NULL,NULL,'0'),(22,-1234,'apisubscriber_1_2_10_application_1_2_10_PRODUCTION','PRIMARY','apisubscriber_1_2_10','Service Provider for application apisubscriber_1_2_10_application_1_2_10_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','9a1342e3-ffdf-4294-bd61-2c0427747fce',NULL,NULL,'0'),(23,-1234,'rest_api_subscriber1_3_11','PRIMARY','apisubscriber_1_3_11','Service Provider for application rest_api_subscriber1_3_11',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','86972497-b9a6-4e31-9480-faf1302f954a',NULL,NULL,'0'),(24,-1234,'apisubscriber_1_3_11_application_1_3_11_PRODUCTION','PRIMARY','apisubscriber_1_3_11','Service Provider for application apisubscriber_1_3_11_application_1_3_11_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','5466f003-c39b-4970-8f8f-0a6d9e87bd6f',NULL,NULL,'0'),(25,-1234,'rest_api_subscriber1_3_12','PRIMARY','apisubscriber_1_3_12','Service Provider for application rest_api_subscriber1_3_12',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','e9cc2373-efac-4021-aa71-4536dc7913fc',NULL,NULL,'0'),(26,-1234,'apisubscriber_1_3_12_application_1_3_12_PRODUCTION','PRIMARY','apisubscriber_1_3_12','Service Provider for application apisubscriber_1_3_12_application_1_3_12_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','3bcf2481-9e9a-4b24-826d-49231f189399',NULL,NULL,'0'),(27,-1234,'rest_api_subscriber1_3_13','PRIMARY','apisubscriber_1_3_13','Service Provider for application rest_api_subscriber1_3_13',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','7cec1e87-65d2-40df-9fa8-159d26b1fe62',NULL,NULL,'0'),(28,-1234,'apisubscriber_1_3_13_application_1_3_13_PRODUCTION','PRIMARY','apisubscriber_1_3_13','Service Provider for application apisubscriber_1_3_13_application_1_3_13_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','c89939fb-c0fc-4fa6-babf-fd58da0555a7',NULL,NULL,'0'),(29,-1234,'rest_api_subscriber1_3_14','PRIMARY','apisubscriber_1_3_14','Service Provider for application rest_api_subscriber1_3_14',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','ac135611-f66f-40d2-bcdc-940c46bcbdfe',NULL,NULL,'0'),(30,-1234,'apisubscriber_1_3_14_application_1_3_14_PRODUCTION','PRIMARY','apisubscriber_1_3_14','Service Provider for application apisubscriber_1_3_14_application_1_3_14_PRODUCTION',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'0','0','0281720c-7df4-4a4f-902a-a51b3f98e940',NULL,NULL,'0'),(31,-1234,'rest_api_subscriber1_3_15','PRIMARY','apisubscriber_1_3_15','Service Provider for application rest_api_subscriber1_3_15',NULL,'default',NULL,'1','0','0','0','0','0',NULL,'1','0','168020f6-9a0c-49b7-9999-2fcc57dbc8f0',NULL,NULL,'0');
/*!40000 ALTER TABLE `SP_APP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_AUTH_SCRIPT`
--

DROP TABLE IF EXISTS `SP_AUTH_SCRIPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_AUTH_SCRIPT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `TYPE` varchar(255) NOT NULL,
  `CONTENT` blob,
  `IS_ENABLED` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_AUTH_SCRIPT`
--

LOCK TABLES `SP_AUTH_SCRIPT` WRITE;
/*!40000 ALTER TABLE `SP_AUTH_SCRIPT` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_AUTH_SCRIPT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_AUTH_STEP`
--

DROP TABLE IF EXISTS `SP_AUTH_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_AUTH_STEP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `STEP_ORDER` int(11) DEFAULT '1',
  `APP_ID` int(11) NOT NULL,
  `IS_SUBJECT_STEP` char(1) DEFAULT '0',
  `IS_ATTRIBUTE_STEP` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `APPLICATION_ID_CONSTRAINT_STEP` (`APP_ID`),
  CONSTRAINT `APPLICATION_ID_CONSTRAINT_STEP` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_AUTH_STEP`
--

LOCK TABLES `SP_AUTH_STEP` WRITE;
/*!40000 ALTER TABLE `SP_AUTH_STEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_AUTH_STEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_CLAIM_DIALECT`
--

DROP TABLE IF EXISTS `SP_CLAIM_DIALECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_CLAIM_DIALECT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `SP_DIALECT` varchar(512) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `DIALECTID_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `DIALECTID_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_CLAIM_DIALECT`
--

LOCK TABLES `SP_CLAIM_DIALECT` WRITE;
/*!40000 ALTER TABLE `SP_CLAIM_DIALECT` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_CLAIM_DIALECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_CLAIM_MAPPING`
--

DROP TABLE IF EXISTS `SP_CLAIM_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_CLAIM_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `IDP_CLAIM` varchar(512) NOT NULL,
  `SP_CLAIM` varchar(512) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `IS_REQUESTED` varchar(128) DEFAULT '0',
  `IS_MANDATORY` varchar(128) DEFAULT '0',
  `DEFAULT_VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CLAIMID_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `CLAIMID_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_CLAIM_MAPPING`
--

LOCK TABLES `SP_CLAIM_MAPPING` WRITE;
/*!40000 ALTER TABLE `SP_CLAIM_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_CLAIM_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_FEDERATED_IDP`
--

DROP TABLE IF EXISTS `SP_FEDERATED_IDP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_FEDERATED_IDP` (
  `ID` int(11) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `AUTHENTICATOR_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`AUTHENTICATOR_ID`),
  CONSTRAINT `STEP_ID_CONSTRAINT` FOREIGN KEY (`ID`) REFERENCES `SP_AUTH_STEP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_FEDERATED_IDP`
--

LOCK TABLES `SP_FEDERATED_IDP` WRITE;
/*!40000 ALTER TABLE `SP_FEDERATED_IDP` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_FEDERATED_IDP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_INBOUND_AUTH`
--

DROP TABLE IF EXISTS `SP_INBOUND_AUTH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_INBOUND_AUTH` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `INBOUND_AUTH_KEY` varchar(255) DEFAULT NULL,
  `INBOUND_AUTH_TYPE` varchar(255) NOT NULL,
  `INBOUND_CONFIG_TYPE` varchar(255) NOT NULL,
  `PROP_NAME` varchar(255) DEFAULT NULL,
  `PROP_VALUE` varchar(1024) DEFAULT NULL,
  `APP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_SPI_APP` (`APP_ID`),
  CONSTRAINT `APPLICATION_ID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_INBOUND_AUTH`
--

LOCK TABLES `SP_INBOUND_AUTH` WRITE;
/*!40000 ALTER TABLE `SP_INBOUND_AUTH` DISABLE KEYS */;
INSERT INTO `SP_INBOUND_AUTH` VALUES (1,-1234,'tb2koOlUDFa84xnC3rLR1Ph3AqIa','oauth2','standardAPP',NULL,NULL,1),(2,-1234,'mnGU8mWmff6Us5fhBfYzUWUOhI0a','oauth2','standardAPP',NULL,NULL,2),(3,-1234,'7Aq9tbsdtS_tOlWQbTf5QiftJNsa','oauth2','standardAPP',NULL,NULL,3),(4,-1234,'kEX5j09zvfoQRAOHrcX3KUeC8uQa','oauth2','standardAPP',NULL,NULL,4),(5,-1234,'TEb7jgiHESZYsYS4Rech8P1kbcga','oauth2','standardAPP',NULL,NULL,5),(6,-1234,'5YPYkwfJpx7ftCTygag2BhHYk94a','oauth2','standardAPP',NULL,NULL,6),(7,-1234,'EB64d3_uguTADQyZSJHmqvJS4iwa','oauth2','standardAPP',NULL,NULL,7),(8,-1234,'aJIdU5WyC6dV_lhJ9yhGBfblzHga','oauth2','standardAPP',NULL,NULL,8),(9,-1234,'alIcTNKzVGX9H_fk1JIwUYxjRgQa','oauth2','standardAPP',NULL,NULL,9),(10,-1234,'HYtVwP6AZoQYLwDfrV81oXNlVWca','oauth2','standardAPP',NULL,NULL,10),(11,-1234,'RTZcoSpNGBELjwHTBFfvN90hZFka','oauth2','standardAPP',NULL,NULL,11),(12,-1234,'n9LyW8Lpa5PDLbj2eKxcFytphnEa','oauth2','standardAPP',NULL,NULL,12),(13,-1234,'rZmXlVAYBKbrkDhVlaj2_rMz2RUa','oauth2','standardAPP',NULL,NULL,13),(14,-1234,'5GdPz2NhybYtDGMblHCUf8xnC7Ia','oauth2','standardAPP',NULL,NULL,14),(15,-1234,'voQKMdJOliwQmpKL0hooWNuROfAa','oauth2','standardAPP',NULL,NULL,15),(16,-1234,'INu83DbS53iB2akgePCVxEvf9mIa','oauth2','standardAPP',NULL,NULL,16),(17,-1234,'51YjEFyDKfgsjjX23mX7CTipACEa','oauth2','standardAPP',NULL,NULL,17),(18,-1234,'quZU7LfVSkYQwljVf1WLf1shBD0a','oauth2','standardAPP',NULL,NULL,18),(19,-1234,'4rWKhvPw3rvfm87_aKlD3isS02ca','oauth2','standardAPP',NULL,NULL,19),(20,-1234,'SZjfZLAzmi0Wxirz8BRufXJ26VYa','oauth2','standardAPP',NULL,NULL,20),(21,-1234,'4jbO4vN_gfS8XhTlKOPW4dxv1C0a','oauth2','standardAPP',NULL,NULL,21),(22,-1234,'3W08GGqywwhEoyMGiusVkTDBx30a','oauth2','standardAPP',NULL,NULL,22),(23,-1234,'OWPnJ3TgXImSM2ZvbbgwRma8vxAa','oauth2','standardAPP',NULL,NULL,23),(24,-1234,'Qe6CfCgwP7werISqgkBaw3SGQbYa','oauth2','standardAPP',NULL,NULL,24),(25,-1234,'hS20TB9fLb7sAeWCZuzLI0B75hIa','oauth2','standardAPP',NULL,NULL,25),(26,-1234,'U_2ME1uQEY__WgM5aovbcXyAJE4a','oauth2','standardAPP',NULL,NULL,26),(27,-1234,'Zzbr7MqsFCTC65WPT1V1iKYUGEca','oauth2','standardAPP',NULL,NULL,27),(28,-1234,'LNx2QzZf9kwuuMKR5aBL5_egUUAa','oauth2','standardAPP',NULL,NULL,28),(29,-1234,'u3_AQtCy7VWkF2OnxeuiQfkY33Ya','oauth2','standardAPP',NULL,NULL,29),(30,-1234,'HRQgUrNng7tLGcxG1hlp158gWHUa','oauth2','standardAPP',NULL,NULL,30),(31,-1234,'0LdviO09xTGEKGrMxQbUcRVWec4a','oauth2','standardAPP',NULL,NULL,31);
/*!40000 ALTER TABLE `SP_INBOUND_AUTH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_METADATA`
--

DROP TABLE IF EXISTS `SP_METADATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_METADATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SP_METADATA_CONSTRAINT` (`SP_ID`,`NAME`),
  CONSTRAINT `SP_METADATA_ibfk_1` FOREIGN KEY (`SP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_METADATA`
--

LOCK TABLES `SP_METADATA` WRITE;
/*!40000 ALTER TABLE `SP_METADATA` DISABLE KEYS */;
INSERT INTO `SP_METADATA` VALUES (9,1,'TokenType','DEFAULT',NULL,-1234),(10,1,'skipLogoutConsent','true','Skip Logout Consent',-1234),(11,1,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(12,1,'DisplayName','rest_api_creator',NULL,-1234),(13,1,'skipConsent','true','Skip Consent',-1234),(22,2,'TokenType','DEFAULT',NULL,-1234),(23,2,'skipLogoutConsent','true','Skip Logout Consent',-1234),(24,2,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(25,2,'DisplayName','rest_api_publisher1',NULL,-1234),(26,2,'skipConsent','true','Skip Consent',-1234),(35,3,'TokenType','DEFAULT',NULL,-1234),(36,3,'skipLogoutConsent','true','Skip Logout Consent',-1234),(37,3,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(38,3,'DisplayName','rest_api_subscriber1_1_1',NULL,-1234),(39,3,'skipConsent','true','Skip Consent',-1234),(40,4,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(41,4,'skipLogoutConsent','false','Skip Logout Consent',-1234),(42,4,'skipConsent','false','Skip Consent',-1234),(51,5,'TokenType','DEFAULT',NULL,-1234),(52,5,'skipLogoutConsent','true','Skip Logout Consent',-1234),(53,5,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(54,5,'DisplayName','rest_api_subscriber1_1_2',NULL,-1234),(55,5,'skipConsent','true','Skip Consent',-1234),(56,6,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(57,6,'skipLogoutConsent','false','Skip Logout Consent',-1234),(58,6,'skipConsent','false','Skip Consent',-1234),(67,7,'TokenType','DEFAULT',NULL,-1234),(68,7,'skipLogoutConsent','true','Skip Logout Consent',-1234),(69,7,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(70,7,'DisplayName','rest_api_subscriber1_1_3',NULL,-1234),(71,7,'skipConsent','true','Skip Consent',-1234),(72,8,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(73,8,'skipLogoutConsent','false','Skip Logout Consent',-1234),(74,8,'skipConsent','false','Skip Consent',-1234),(83,9,'TokenType','DEFAULT',NULL,-1234),(84,9,'skipLogoutConsent','true','Skip Logout Consent',-1234),(85,9,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(86,9,'DisplayName','rest_api_subscriber1_1_4',NULL,-1234),(87,9,'skipConsent','true','Skip Consent',-1234),(88,10,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(89,10,'skipLogoutConsent','false','Skip Logout Consent',-1234),(90,10,'skipConsent','false','Skip Consent',-1234),(99,11,'TokenType','DEFAULT',NULL,-1234),(100,11,'skipLogoutConsent','true','Skip Logout Consent',-1234),(101,11,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(102,11,'DisplayName','rest_api_subscriber1_1_5',NULL,-1234),(103,11,'skipConsent','true','Skip Consent',-1234),(104,12,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(105,12,'skipLogoutConsent','false','Skip Logout Consent',-1234),(106,12,'skipConsent','false','Skip Consent',-1234),(115,13,'TokenType','DEFAULT',NULL,-1234),(116,13,'skipLogoutConsent','true','Skip Logout Consent',-1234),(117,13,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(118,13,'DisplayName','rest_api_subscriber1_2_6',NULL,-1234),(119,13,'skipConsent','true','Skip Consent',-1234),(120,14,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(121,14,'skipLogoutConsent','false','Skip Logout Consent',-1234),(122,14,'skipConsent','false','Skip Consent',-1234),(131,15,'TokenType','DEFAULT',NULL,-1234),(132,15,'skipLogoutConsent','true','Skip Logout Consent',-1234),(133,15,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(134,15,'DisplayName','rest_api_subscriber1_2_7',NULL,-1234),(135,15,'skipConsent','true','Skip Consent',-1234),(136,16,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(137,16,'skipLogoutConsent','false','Skip Logout Consent',-1234),(138,16,'skipConsent','false','Skip Consent',-1234),(147,17,'TokenType','DEFAULT',NULL,-1234),(148,17,'skipLogoutConsent','true','Skip Logout Consent',-1234),(149,17,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(150,17,'DisplayName','rest_api_subscriber1_2_8',NULL,-1234),(151,17,'skipConsent','true','Skip Consent',-1234),(152,18,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(153,18,'skipLogoutConsent','false','Skip Logout Consent',-1234),(154,18,'skipConsent','false','Skip Consent',-1234),(163,19,'TokenType','DEFAULT',NULL,-1234),(164,19,'skipLogoutConsent','true','Skip Logout Consent',-1234),(165,19,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(166,19,'DisplayName','rest_api_subscriber1_2_9',NULL,-1234),(167,19,'skipConsent','true','Skip Consent',-1234),(168,20,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(169,20,'skipLogoutConsent','false','Skip Logout Consent',-1234),(170,20,'skipConsent','false','Skip Consent',-1234),(179,21,'TokenType','DEFAULT',NULL,-1234),(180,21,'skipLogoutConsent','true','Skip Logout Consent',-1234),(181,21,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(182,21,'DisplayName','rest_api_subscriber1_2_10',NULL,-1234),(183,21,'skipConsent','true','Skip Consent',-1234),(184,22,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(185,22,'skipLogoutConsent','false','Skip Logout Consent',-1234),(186,22,'skipConsent','false','Skip Consent',-1234),(195,23,'TokenType','DEFAULT',NULL,-1234),(196,23,'skipLogoutConsent','true','Skip Logout Consent',-1234),(197,23,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(198,23,'DisplayName','rest_api_subscriber1_3_11',NULL,-1234),(199,23,'skipConsent','true','Skip Consent',-1234),(200,24,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(201,24,'skipLogoutConsent','false','Skip Logout Consent',-1234),(202,24,'skipConsent','false','Skip Consent',-1234),(211,25,'TokenType','DEFAULT',NULL,-1234),(212,25,'skipLogoutConsent','true','Skip Logout Consent',-1234),(213,25,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(214,25,'DisplayName','rest_api_subscriber1_3_12',NULL,-1234),(215,25,'skipConsent','true','Skip Consent',-1234),(216,26,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(217,26,'skipLogoutConsent','false','Skip Logout Consent',-1234),(218,26,'skipConsent','false','Skip Consent',-1234),(227,27,'TokenType','DEFAULT',NULL,-1234),(228,27,'skipLogoutConsent','true','Skip Logout Consent',-1234),(229,27,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(230,27,'DisplayName','rest_api_subscriber1_3_13',NULL,-1234),(231,27,'skipConsent','true','Skip Consent',-1234),(232,28,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(233,28,'skipLogoutConsent','false','Skip Logout Consent',-1234),(234,28,'skipConsent','false','Skip Consent',-1234),(243,29,'TokenType','DEFAULT',NULL,-1234),(244,29,'skipLogoutConsent','true','Skip Logout Consent',-1234),(245,29,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(246,29,'DisplayName','rest_api_subscriber1_3_14',NULL,-1234),(247,29,'skipConsent','true','Skip Consent',-1234),(248,30,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(249,30,'skipLogoutConsent','false','Skip Logout Consent',-1234),(250,30,'skipConsent','false','Skip Consent',-1234),(259,31,'TokenType','DEFAULT',NULL,-1234),(260,31,'skipLogoutConsent','true','Skip Logout Consent',-1234),(261,31,'USE_DOMAIN_IN_ROLES','true','DOMAIN_IN_ROLES',-1234),(262,31,'DisplayName','rest_api_subscriber1_3_15',NULL,-1234),(263,31,'skipConsent','true','Skip Consent',-1234);
/*!40000 ALTER TABLE `SP_METADATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_PROVISIONING_CONNECTOR`
--

DROP TABLE IF EXISTS `SP_PROVISIONING_CONNECTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_PROVISIONING_CONNECTOR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `IDP_NAME` varchar(255) NOT NULL,
  `CONNECTOR_NAME` varchar(255) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `IS_JIT_ENABLED` char(1) NOT NULL DEFAULT '0',
  `BLOCKING` char(1) NOT NULL DEFAULT '0',
  `RULE_ENABLED` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PRO_CONNECTOR_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `PRO_CONNECTOR_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_PROVISIONING_CONNECTOR`
--

LOCK TABLES `SP_PROVISIONING_CONNECTOR` WRITE;
/*!40000 ALTER TABLE `SP_PROVISIONING_CONNECTOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_PROVISIONING_CONNECTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_REQ_PATH_AUTHENTICATOR`
--

DROP TABLE IF EXISTS `SP_REQ_PATH_AUTHENTICATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_REQ_PATH_AUTHENTICATOR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `AUTHENTICATOR_NAME` varchar(255) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `REQ_AUTH_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `REQ_AUTH_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_REQ_PATH_AUTHENTICATOR`
--

LOCK TABLES `SP_REQ_PATH_AUTHENTICATOR` WRITE;
/*!40000 ALTER TABLE `SP_REQ_PATH_AUTHENTICATOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_REQ_PATH_AUTHENTICATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `SP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_ROLE_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `IDP_ROLE` varchar(255) NOT NULL,
  `SP_ROLE` varchar(255) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLEID_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `ROLEID_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_ROLE_MAPPING`
--

LOCK TABLES `SP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SP_TEMPLATE`
--

DROP TABLE IF EXISTS `SP_TEMPLATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_TEMPLATE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(1023) DEFAULT NULL,
  `CONTENT` blob,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SP_TEMPLATE_CONSTRAINT` (`TENANT_ID`,`NAME`),
  KEY `IDX_SP_TEMPLATE` (`TENANT_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SP_TEMPLATE`
--

LOCK TABLES `SP_TEMPLATE` WRITE;
/*!40000 ALTER TABLE `SP_TEMPLATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SP_TEMPLATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_BPS_PROFILE`
--

DROP TABLE IF EXISTS `WF_BPS_PROFILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_BPS_PROFILE` (
  `PROFILE_NAME` varchar(45) NOT NULL,
  `HOST_URL_MANAGER` varchar(255) DEFAULT NULL,
  `HOST_URL_WORKER` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(1023) DEFAULT NULL,
  `CALLBACK_HOST` varchar(45) DEFAULT NULL,
  `CALLBACK_USERNAME` varchar(45) DEFAULT NULL,
  `CALLBACK_PASSWORD` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`PROFILE_NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_BPS_PROFILE`
--

LOCK TABLES `WF_BPS_PROFILE` WRITE;
/*!40000 ALTER TABLE `WF_BPS_PROFILE` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_BPS_PROFILE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_REQUEST`
--

DROP TABLE IF EXISTS `WF_REQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_REQUEST` (
  `UUID` varchar(45) NOT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  `OPERATION_TYPE` varchar(50) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUS` varchar(30) DEFAULT NULL,
  `REQUEST` blob,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_REQUEST`
--

LOCK TABLES `WF_REQUEST` WRITE;
/*!40000 ALTER TABLE `WF_REQUEST` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_REQUEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_REQUEST_ENTITY_RELATIONSHIP`
--

DROP TABLE IF EXISTS `WF_REQUEST_ENTITY_RELATIONSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_REQUEST_ENTITY_RELATIONSHIP` (
  `REQUEST_ID` varchar(45) NOT NULL,
  `ENTITY_NAME` varchar(255) NOT NULL,
  `ENTITY_TYPE` varchar(50) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`REQUEST_ID`,`ENTITY_NAME`,`ENTITY_TYPE`,`TENANT_ID`),
  CONSTRAINT `WF_REQUEST_ENTITY_RELATIONSHIP_ibfk_1` FOREIGN KEY (`REQUEST_ID`) REFERENCES `WF_REQUEST` (`UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_REQUEST_ENTITY_RELATIONSHIP`
--

LOCK TABLES `WF_REQUEST_ENTITY_RELATIONSHIP` WRITE;
/*!40000 ALTER TABLE `WF_REQUEST_ENTITY_RELATIONSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_REQUEST_ENTITY_RELATIONSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_WORKFLOW`
--

DROP TABLE IF EXISTS `WF_WORKFLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_WORKFLOW` (
  `ID` varchar(45) NOT NULL,
  `WF_NAME` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TEMPLATE_ID` varchar(45) DEFAULT NULL,
  `IMPL_ID` varchar(45) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_WORKFLOW`
--

LOCK TABLES `WF_WORKFLOW` WRITE;
/*!40000 ALTER TABLE `WF_WORKFLOW` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_WORKFLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_WORKFLOW_ASSOCIATION`
--

DROP TABLE IF EXISTS `WF_WORKFLOW_ASSOCIATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_WORKFLOW_ASSOCIATION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSOC_NAME` varchar(45) DEFAULT NULL,
  `EVENT_ID` varchar(45) DEFAULT NULL,
  `ASSOC_CONDITION` varchar(2000) DEFAULT NULL,
  `WORKFLOW_ID` varchar(45) DEFAULT NULL,
  `IS_ENABLED` char(1) DEFAULT '1',
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`ID`),
  KEY `WORKFLOW_ID` (`WORKFLOW_ID`),
  CONSTRAINT `WF_WORKFLOW_ASSOCIATION_ibfk_1` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `WF_WORKFLOW` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_WORKFLOW_ASSOCIATION`
--

LOCK TABLES `WF_WORKFLOW_ASSOCIATION` WRITE;
/*!40000 ALTER TABLE `WF_WORKFLOW_ASSOCIATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_WORKFLOW_ASSOCIATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_WORKFLOW_CONFIG_PARAM`
--

DROP TABLE IF EXISTS `WF_WORKFLOW_CONFIG_PARAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_WORKFLOW_CONFIG_PARAM` (
  `WORKFLOW_ID` varchar(45) NOT NULL,
  `PARAM_NAME` varchar(45) NOT NULL,
  `PARAM_VALUE` varchar(1000) DEFAULT NULL,
  `PARAM_QNAME` varchar(45) NOT NULL,
  `PARAM_HOLDER` varchar(45) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`WORKFLOW_ID`,`PARAM_NAME`,`PARAM_QNAME`,`PARAM_HOLDER`),
  CONSTRAINT `WF_WORKFLOW_CONFIG_PARAM_ibfk_1` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `WF_WORKFLOW` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_WORKFLOW_CONFIG_PARAM`
--

LOCK TABLES `WF_WORKFLOW_CONFIG_PARAM` WRITE;
/*!40000 ALTER TABLE `WF_WORKFLOW_CONFIG_PARAM` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_WORKFLOW_CONFIG_PARAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WF_WORKFLOW_REQUEST_RELATION`
--

DROP TABLE IF EXISTS `WF_WORKFLOW_REQUEST_RELATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_WORKFLOW_REQUEST_RELATION` (
  `RELATIONSHIP_ID` varchar(45) NOT NULL,
  `WORKFLOW_ID` varchar(45) DEFAULT NULL,
  `REQUEST_ID` varchar(45) DEFAULT NULL,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `STATUS` varchar(30) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`RELATIONSHIP_ID`),
  KEY `WORKFLOW_ID` (`WORKFLOW_ID`),
  KEY `REQUEST_ID` (`REQUEST_ID`),
  CONSTRAINT `WF_WORKFLOW_REQUEST_RELATION_ibfk_1` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `WF_WORKFLOW` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `WF_WORKFLOW_REQUEST_RELATION_ibfk_2` FOREIGN KEY (`REQUEST_ID`) REFERENCES `WF_REQUEST` (`UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WF_WORKFLOW_REQUEST_RELATION`
--

LOCK TABLES `WF_WORKFLOW_REQUEST_RELATION` WRITE;
/*!40000 ALTER TABLE `WF_WORKFLOW_REQUEST_RELATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `WF_WORKFLOW_REQUEST_RELATION` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-20  9:59:24
