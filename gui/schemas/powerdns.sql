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
  `notified_serial` int(10) unsigned DEFAULT NULL,
  `account` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES (26,'test.pep',NULL,NULL,'NATIVE',NULL,'5',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_confirmations`
--

LOCK TABLES `email_confirmations` WRITE;
/*!40000 ALTER TABLE `email_confirmations` DISABLE KEYS */;
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
  `country` varchar(45) DEFAULT NULL,
  `fqdn` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `fqdn_UNIQUE` (`fqdn`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nameserver`
--

LOCK TABLES `nameserver` WRITE;
/*!40000 ALTER TABLE `nameserver` DISABLE KEYS */;
INSERT INTO `nameserver` VALUES (2,'Nuernberg','DE','ns1.fastnameserver.eu'),(4,'Offenbach','DE','ns2.fastnameserver.eu');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_changes`
--

LOCK TABLES `password_changes` WRITE;
/*!40000 ALTER TABLE `password_changes` DISABLE KEYS */;
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
  `action` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profilesId` (`profilesId`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (24,1,'users','index'),(26,1,'users','search'),(28,1,'users','edit'),(30,1,'users','create'),(32,1,'users','delete'),(34,1,'users','changePassword'),(36,1,'profiles','index'),(38,1,'profiles','search'),(40,1,'profiles','edit'),(42,1,'profiles','create'),(44,1,'profiles','delete'),(46,1,'permissions','index'),(48,1,'dns','index'),(50,1,'dns','search'),(52,1,'dns','create'),(54,1,'dns','edit'),(56,1,'dns','delete'),(58,1,'dns','administrate'),(60,2,'dns','index'),(62,2,'dns','search'),(64,2,'dns','create'),(66,2,'dns','edit'),(68,2,'dns','delete'),(70,3,'dns','index'),(72,3,'dns','search');
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
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`value`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_types`
--

LOCK TABLES `record_types` WRITE;
/*!40000 ALTER TABLE `record_types` DISABLE KEYS */;
INSERT INTO `record_types` VALUES (38,'A',NULL),(40,'AAAA',NULL),(42,'AFSDB',NULL),(44,'ALIAS',NULL),(46,'CAA',NULL),(48,'CERT',NULL),(50,'CDNSKEY',NULL),(52,'CDS',NULL),(54,'CNAME',NULL),(56,'DNSKEY',NULL),(58,'DNAME',NULL),(60,'DS',NULL),(62,'HINFO',NULL),(64,'KEY',NULL),(66,'LOC',NULL),(68,'MX',NULL),(70,'NAPTR',NULL),(72,'NS',NULL),(74,'NSEC',NULL),(76,'NSEC3',NULL),(78,'NSEC3PARAM',NULL),(80,'OPENPGPKEY',NULL),(82,'PTR',NULL),(84,'RP',NULL),(86,'RRSIG',NULL),(88,'SOA',NULL),(90,'SPF',NULL),(92,'SSHFP',NULL),(94,'SRV',NULL),(96,'TKEY',NULL),(98,'TSIG',NULL),(100,'TLSA',NULL),(102,'SMIMEA',NULL),(104,'TXT',NULL),(106,'URI',NULL);
/*!40000 ALTER TABLE `record_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  KEY `ordername` (`ordername`)
) ENGINE=InnoDB AUTO_INCREMENT=1548 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
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
  `userAgent` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `success_logins`
--

LOCK TABLES `success_logins` WRITE;
/*!40000 ALTER TABLE `success_logins` DISABLE KEYS */;
INSERT INTO `success_logins` VALUES (2,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0'),(4,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0'),(6,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0'),(8,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0'),(10,5,'192.168.2.102','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'Kai Pazdzewicz','ich@kai.cool','$2y$08$aDV6RE8zNVZTUForS3owd.8g9.YAEKDiZqcvQGgEai5es3gNKdEVW','N',2,'N','N','Y'),(8,'Administrator','admin@admin.pep','$2y$08$YldwaHowZmhWWUlFWW13Su1eciTPLWcbdPdj5dVRAkTZY6TPfSZhi','N',1,'N','N','Y');
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

-- Dump completed on 2018-08-09 23:23:47
