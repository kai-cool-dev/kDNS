DROP TABLE IF EXISTS `domains`;
CREATE TABLE domains (
  id                    INT AUTO_INCREMENT,
  name                  VARCHAR(255) NOT NULL,
  master                VARCHAR(128) DEFAULT NULL,
  last_check            INT DEFAULT NULL,
  type                  VARCHAR(6) NOT NULL,
  notified_serial       INT UNSIGNED DEFAULT NULL,
  account               VARCHAR(40) CHARACTER SET 'utf8' DEFAULT NULL,
  PRIMARY KEY (id)
) Engine=InnoDB CHARACTER SET 'latin1';

CREATE UNIQUE INDEX name_index ON domains(name);

DROP TABLE IF EXISTS `records`;
CREATE TABLE records (
  id                    BIGINT AUTO_INCREMENT,
  domain_id             INT DEFAULT NULL,
  name                  VARCHAR(255) DEFAULT NULL,
  type                  VARCHAR(10) DEFAULT NULL,
  content               VARCHAR(64000) DEFAULT NULL,
  ttl                   INT DEFAULT NULL,
  prio                  INT DEFAULT NULL,
  change_date           INT DEFAULT NULL,
  disabled              TINYINT(1) DEFAULT 0,
  ordername             VARCHAR(255) BINARY DEFAULT NULL,
  auth                  TINYINT(1) DEFAULT 1,
  PRIMARY KEY (id)
) Engine=InnoDB CHARACTER SET 'latin1';

CREATE INDEX nametype_index ON records(name,type);
CREATE INDEX domain_id ON records(domain_id);
CREATE INDEX ordername ON records (ordername);

DROP TABLE IF EXISTS `supermasters`;
CREATE TABLE supermasters (
  ip                    VARCHAR(64) NOT NULL,
  nameserver            VARCHAR(255) NOT NULL,
  account               VARCHAR(40) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (ip, nameserver)
) Engine=InnoDB CHARACTER SET 'latin1';


DROP TABLE IF EXISTS `comments`;
CREATE TABLE comments (
  id                    INT AUTO_INCREMENT,
  domain_id             INT NOT NULL,
  name                  VARCHAR(255) NOT NULL,
  type                  VARCHAR(10) NOT NULL,
  modified_at           INT NOT NULL,
  account               VARCHAR(40) CHARACTER SET 'utf8' DEFAULT NULL,
  comment               TEXT CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (id)
) Engine=InnoDB CHARACTER SET 'latin1';

CREATE INDEX comments_name_type_idx ON comments (name, type);
CREATE INDEX comments_order_idx ON comments (domain_id, modified_at);

DROP TABLE IF EXISTS `domainmetadata`;
CREATE TABLE domainmetadata (
  id                    INT AUTO_INCREMENT,
  domain_id             INT NOT NULL,
  kind                  VARCHAR(32),
  content               TEXT,
  PRIMARY KEY (id)
) Engine=InnoDB CHARACTER SET 'latin1';

CREATE INDEX domainmetadata_idx ON domainmetadata (domain_id, kind);

DROP TABLE IF EXISTS `cryptokeys`;
CREATE TABLE cryptokeys (
  id                    INT AUTO_INCREMENT,
  domain_id             INT NOT NULL,
  flags                 INT NOT NULL,
  active                BOOL,
  content               TEXT,
  PRIMARY KEY(id)
) Engine=InnoDB CHARACTER SET 'latin1';

CREATE INDEX domainidindex ON cryptokeys(domain_id);

DROP TABLE IF EXISTS `tsigkeys`;
CREATE TABLE tsigkeys (
  id                    INT AUTO_INCREMENT,
  name                  VARCHAR(255),
  algorithm             VARCHAR(50),
  secret                VARCHAR(255),
  PRIMARY KEY (id)
) Engine=InnoDB CHARACTER SET 'latin1';

CREATE UNIQUE INDEX namealgoindex ON tsigkeys(name, algorithm);

DROP TABLE IF EXISTS `email_confirmations`;
CREATE TABLE IF NOT EXISTS `email_confirmations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `code` char(32) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `modifiedAt` int(10) unsigned DEFAULT NULL,
  `confirmed` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `failed_logins`;

CREATE TABLE IF NOT EXISTS `failed_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned DEFAULT NULL,
  `ipAddress` char(15) NOT NULL,
  `attempted` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `password_changes`;

CREATE TABLE IF NOT EXISTS `password_changes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `ipAddress` char(15) NOT NULL,
  `userAgent` text NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profilesId` int(10) unsigned NOT NULL,
  `resource` varchar(16) NOT NULL,
  `action` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profilesId` (`profilesId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

INSERT INTO `permissions` (`id`, `profilesId`, `resource`, `action`) VALUES
(1, 3, 'users', 'index'),
(2, 3, 'users', 'search'),
(3, 3, 'profiles', 'index'),
(4, 3, 'profiles', 'search'),
(5, 1, 'users', 'index'),
(6, 1, 'users', 'search'),
(7, 1, 'users', 'edit'),
(8, 1, 'users', 'create'),
(9, 1, 'users', 'delete'),
(10, 1, 'users', 'changePassword'),
(11, 1, 'profiles', 'index'),
(12, 1, 'profiles', 'search'),
(13, 1, 'profiles', 'edit'),
(14, 1, 'profiles', 'create'),
(15, 1, 'profiles', 'delete'),
(16, 1, 'permissions', 'index'),
(17, 2, 'users', 'index'),
(18, 2, 'users', 'search'),
(19, 2, 'users', 'edit'),
(20, 2, 'users', 'create'),
(21, 2, 'profiles', 'index'),
(22, 2, 'profiles', 'search');

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

INSERT INTO `profiles` (`id`, `name`, `active`) VALUES
(1, 'Administrators', 'Y'),
(2, 'Users', 'Y'),
(3, 'Read-Only', 'Y');

DROP TABLE IF EXISTS `remember_tokens`;

CREATE TABLE IF NOT EXISTS `remember_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `token` char(32) NOT NULL,
  `userAgent` varchar(120) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `reset_passwords`;

CREATE TABLE IF NOT EXISTS `reset_passwords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `code` varchar(48) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `modifiedAt` int(10) unsigned DEFAULT NULL,
  `reset` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `success_logins`;

CREATE TABLE IF NOT EXISTS `success_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `ipAddress` char(15) NOT NULL,
  `userAgent` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `users`;

CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (5,'Kai Pazdzewicz','ich@kai.cool','$2y$08$aDV6RE8zNVZTUForS3owd.8g9.YAEKDiZqcvQGgEai5es3gNKdEVW','N',1,'N','N','Y'),(8,'Administrator','admin@admin.pep','$2y$08$YldwaHowZmhWWUlFWW13Su1eciTPLWcbdPdj5dVRAkTZY6TPfSZhi','N',1,'N','N','Y');
UNLOCK TABLES;

CREATE TABLE tlds (id VARCHAR(64) NOT NULL, value VARCHAR(64) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;

INSERT INTO `tlds` (`id`, `value`) VALUES ('aaa', 'aaa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('aarp', 'aarp');
INSERT INTO `tlds` (`id`, `value`) VALUES ('abarth', 'abarth');
INSERT INTO `tlds` (`id`, `value`) VALUES ('abb', 'abb');
INSERT INTO `tlds` (`id`, `value`) VALUES ('abbott', 'abbott');
INSERT INTO `tlds` (`id`, `value`) VALUES ('abbvie', 'abbvie');
INSERT INTO `tlds` (`id`, `value`) VALUES ('abc', 'abc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('able', 'able');
INSERT INTO `tlds` (`id`, `value`) VALUES ('abogado', 'abogado');
INSERT INTO `tlds` (`id`, `value`) VALUES ('abudhabi', 'abudhabi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ac', 'ac');
INSERT INTO `tlds` (`id`, `value`) VALUES ('academy', 'academy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('accenture', 'accenture');
INSERT INTO `tlds` (`id`, `value`) VALUES ('accountant', 'accountant');
INSERT INTO `tlds` (`id`, `value`) VALUES ('accountants', 'accountants');
INSERT INTO `tlds` (`id`, `value`) VALUES ('aco', 'aco');
INSERT INTO `tlds` (`id`, `value`) VALUES ('active', 'active');
INSERT INTO `tlds` (`id`, `value`) VALUES ('actor', 'actor');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ad', 'ad');
INSERT INTO `tlds` (`id`, `value`) VALUES ('adac', 'adac');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ads', 'ads');
INSERT INTO `tlds` (`id`, `value`) VALUES ('adult', 'adult');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ae', 'ae');
INSERT INTO `tlds` (`id`, `value`) VALUES ('aeg', 'aeg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('aero', 'aero');
INSERT INTO `tlds` (`id`, `value`) VALUES ('aetna', 'aetna');
INSERT INTO `tlds` (`id`, `value`) VALUES ('af', 'af');
INSERT INTO `tlds` (`id`, `value`) VALUES ('afamilycompany', 'afamilycompany');
INSERT INTO `tlds` (`id`, `value`) VALUES ('afl', 'afl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('africa', 'africa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ag', 'ag');
INSERT INTO `tlds` (`id`, `value`) VALUES ('agakhan', 'agakhan');
INSERT INTO `tlds` (`id`, `value`) VALUES ('agency', 'agency');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ai', 'ai');
INSERT INTO `tlds` (`id`, `value`) VALUES ('aig', 'aig');
INSERT INTO `tlds` (`id`, `value`) VALUES ('aigo', 'aigo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('airbus', 'airbus');
INSERT INTO `tlds` (`id`, `value`) VALUES ('airforce', 'airforce');
INSERT INTO `tlds` (`id`, `value`) VALUES ('airtel', 'airtel');
INSERT INTO `tlds` (`id`, `value`) VALUES ('akdn', 'akdn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('al', 'al');
INSERT INTO `tlds` (`id`, `value`) VALUES ('alfaromeo', 'alfaromeo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('alibaba', 'alibaba');
INSERT INTO `tlds` (`id`, `value`) VALUES ('alipay', 'alipay');
INSERT INTO `tlds` (`id`, `value`) VALUES ('allfinanz', 'allfinanz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('allstate', 'allstate');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ally', 'ally');
INSERT INTO `tlds` (`id`, `value`) VALUES ('alsace', 'alsace');
INSERT INTO `tlds` (`id`, `value`) VALUES ('alstom', 'alstom');
INSERT INTO `tlds` (`id`, `value`) VALUES ('am', 'am');
INSERT INTO `tlds` (`id`, `value`) VALUES ('americanexpress', 'americanexpress');
INSERT INTO `tlds` (`id`, `value`) VALUES ('americanfamily', 'americanfamily');
INSERT INTO `tlds` (`id`, `value`) VALUES ('amex', 'amex');
INSERT INTO `tlds` (`id`, `value`) VALUES ('amfam', 'amfam');
INSERT INTO `tlds` (`id`, `value`) VALUES ('amica', 'amica');
INSERT INTO `tlds` (`id`, `value`) VALUES ('amsterdam', 'amsterdam');
INSERT INTO `tlds` (`id`, `value`) VALUES ('analytics', 'analytics');
INSERT INTO `tlds` (`id`, `value`) VALUES ('android', 'android');
INSERT INTO `tlds` (`id`, `value`) VALUES ('anquan', 'anquan');
INSERT INTO `tlds` (`id`, `value`) VALUES ('anz', 'anz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ao', 'ao');
INSERT INTO `tlds` (`id`, `value`) VALUES ('aol', 'aol');
INSERT INTO `tlds` (`id`, `value`) VALUES ('apartments', 'apartments');
INSERT INTO `tlds` (`id`, `value`) VALUES ('app', 'app');
INSERT INTO `tlds` (`id`, `value`) VALUES ('apple', 'apple');
INSERT INTO `tlds` (`id`, `value`) VALUES ('aq', 'aq');
INSERT INTO `tlds` (`id`, `value`) VALUES ('aquarelle', 'aquarelle');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ar', 'ar');
INSERT INTO `tlds` (`id`, `value`) VALUES ('arab', 'arab');
INSERT INTO `tlds` (`id`, `value`) VALUES ('aramco', 'aramco');
INSERT INTO `tlds` (`id`, `value`) VALUES ('archi', 'archi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('army', 'army');
INSERT INTO `tlds` (`id`, `value`) VALUES ('arpa', 'arpa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('art', 'art');
INSERT INTO `tlds` (`id`, `value`) VALUES ('arte', 'arte');
INSERT INTO `tlds` (`id`, `value`) VALUES ('as', 'as');
INSERT INTO `tlds` (`id`, `value`) VALUES ('asda', 'asda');
INSERT INTO `tlds` (`id`, `value`) VALUES ('asia', 'asia');
INSERT INTO `tlds` (`id`, `value`) VALUES ('associates', 'associates');
INSERT INTO `tlds` (`id`, `value`) VALUES ('at', 'at');
INSERT INTO `tlds` (`id`, `value`) VALUES ('athleta', 'athleta');
INSERT INTO `tlds` (`id`, `value`) VALUES ('attorney', 'attorney');
INSERT INTO `tlds` (`id`, `value`) VALUES ('au', 'au');
INSERT INTO `tlds` (`id`, `value`) VALUES ('auction', 'auction');
INSERT INTO `tlds` (`id`, `value`) VALUES ('audi', 'audi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('audible', 'audible');
INSERT INTO `tlds` (`id`, `value`) VALUES ('audio', 'audio');
INSERT INTO `tlds` (`id`, `value`) VALUES ('auspost', 'auspost');
INSERT INTO `tlds` (`id`, `value`) VALUES ('author', 'author');
INSERT INTO `tlds` (`id`, `value`) VALUES ('auto', 'auto');
INSERT INTO `tlds` (`id`, `value`) VALUES ('autos', 'autos');
INSERT INTO `tlds` (`id`, `value`) VALUES ('avianca', 'avianca');
INSERT INTO `tlds` (`id`, `value`) VALUES ('aw', 'aw');
INSERT INTO `tlds` (`id`, `value`) VALUES ('aws', 'aws');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ax', 'ax');
INSERT INTO `tlds` (`id`, `value`) VALUES ('axa', 'axa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('az', 'az');
INSERT INTO `tlds` (`id`, `value`) VALUES ('azure', 'azure');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ba', 'ba');
INSERT INTO `tlds` (`id`, `value`) VALUES ('baby', 'baby');
INSERT INTO `tlds` (`id`, `value`) VALUES ('baidu', 'baidu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('banamex', 'banamex');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bananarepublic', 'bananarepublic');
INSERT INTO `tlds` (`id`, `value`) VALUES ('band', 'band');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bank', 'bank');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bar', 'bar');
INSERT INTO `tlds` (`id`, `value`) VALUES ('barcelona', 'barcelona');
INSERT INTO `tlds` (`id`, `value`) VALUES ('barclaycard', 'barclaycard');
INSERT INTO `tlds` (`id`, `value`) VALUES ('barclays', 'barclays');
INSERT INTO `tlds` (`id`, `value`) VALUES ('barefoot', 'barefoot');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bargains', 'bargains');
INSERT INTO `tlds` (`id`, `value`) VALUES ('baseball', 'baseball');
INSERT INTO `tlds` (`id`, `value`) VALUES ('basketball', 'basketball');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bauhaus', 'bauhaus');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bayern', 'bayern');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bb', 'bb');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bbc', 'bbc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bbt', 'bbt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bbva', 'bbva');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bcg', 'bcg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bcn', 'bcn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bd', 'bd');
INSERT INTO `tlds` (`id`, `value`) VALUES ('be', 'be');
INSERT INTO `tlds` (`id`, `value`) VALUES ('beats', 'beats');
INSERT INTO `tlds` (`id`, `value`) VALUES ('beauty', 'beauty');
INSERT INTO `tlds` (`id`, `value`) VALUES ('beer', 'beer');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bentley', 'bentley');
INSERT INTO `tlds` (`id`, `value`) VALUES ('berlin', 'berlin');
INSERT INTO `tlds` (`id`, `value`) VALUES ('best', 'best');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bestbuy', 'bestbuy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bet', 'bet');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bf', 'bf');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bg', 'bg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bh', 'bh');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bharti', 'bharti');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bi', 'bi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bible', 'bible');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bid', 'bid');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bike', 'bike');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bing', 'bing');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bingo', 'bingo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bio', 'bio');
INSERT INTO `tlds` (`id`, `value`) VALUES ('biz', 'biz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bj', 'bj');
INSERT INTO `tlds` (`id`, `value`) VALUES ('black', 'black');
INSERT INTO `tlds` (`id`, `value`) VALUES ('blackfriday', 'blackfriday');
INSERT INTO `tlds` (`id`, `value`) VALUES ('blanco', 'blanco');
INSERT INTO `tlds` (`id`, `value`) VALUES ('blockbuster', 'blockbuster');
INSERT INTO `tlds` (`id`, `value`) VALUES ('blog', 'blog');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bloomberg', 'bloomberg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('blue', 'blue');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bm', 'bm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bms', 'bms');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bmw', 'bmw');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bn', 'bn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bnl', 'bnl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bnpparibas', 'bnpparibas');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bo', 'bo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('boats', 'boats');
INSERT INTO `tlds` (`id`, `value`) VALUES ('boehringer', 'boehringer');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bofa', 'bofa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bom', 'bom');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bond', 'bond');
INSERT INTO `tlds` (`id`, `value`) VALUES ('boo', 'boo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('book', 'book');
INSERT INTO `tlds` (`id`, `value`) VALUES ('booking', 'booking');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bosch', 'bosch');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bostik', 'bostik');
INSERT INTO `tlds` (`id`, `value`) VALUES ('boston', 'boston');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bot', 'bot');
INSERT INTO `tlds` (`id`, `value`) VALUES ('boutique', 'boutique');
INSERT INTO `tlds` (`id`, `value`) VALUES ('box', 'box');
INSERT INTO `tlds` (`id`, `value`) VALUES ('br', 'br');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bradesco', 'bradesco');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bridgestone', 'bridgestone');
INSERT INTO `tlds` (`id`, `value`) VALUES ('broadway', 'broadway');
INSERT INTO `tlds` (`id`, `value`) VALUES ('broker', 'broker');
INSERT INTO `tlds` (`id`, `value`) VALUES ('brother', 'brother');
INSERT INTO `tlds` (`id`, `value`) VALUES ('brussels', 'brussels');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bs', 'bs');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bt', 'bt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('budapest', 'budapest');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bugatti', 'bugatti');
INSERT INTO `tlds` (`id`, `value`) VALUES ('build', 'build');
INSERT INTO `tlds` (`id`, `value`) VALUES ('builders', 'builders');
INSERT INTO `tlds` (`id`, `value`) VALUES ('business', 'business');
INSERT INTO `tlds` (`id`, `value`) VALUES ('buy', 'buy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('buzz', 'buzz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bv', 'bv');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bw', 'bw');
INSERT INTO `tlds` (`id`, `value`) VALUES ('by', 'by');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bz', 'bz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('bzh', 'bzh');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ca', 'ca');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cab', 'cab');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cafe', 'cafe');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cal', 'cal');
INSERT INTO `tlds` (`id`, `value`) VALUES ('call', 'call');
INSERT INTO `tlds` (`id`, `value`) VALUES ('calvinklein', 'calvinklein');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cam', 'cam');
INSERT INTO `tlds` (`id`, `value`) VALUES ('camera', 'camera');
INSERT INTO `tlds` (`id`, `value`) VALUES ('camp', 'camp');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cancerresearch', 'cancerresearch');
INSERT INTO `tlds` (`id`, `value`) VALUES ('canon', 'canon');
INSERT INTO `tlds` (`id`, `value`) VALUES ('capetown', 'capetown');
INSERT INTO `tlds` (`id`, `value`) VALUES ('capital', 'capital');
INSERT INTO `tlds` (`id`, `value`) VALUES ('capitalone', 'capitalone');
INSERT INTO `tlds` (`id`, `value`) VALUES ('car', 'car');
INSERT INTO `tlds` (`id`, `value`) VALUES ('caravan', 'caravan');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cards', 'cards');
INSERT INTO `tlds` (`id`, `value`) VALUES ('care', 'care');
INSERT INTO `tlds` (`id`, `value`) VALUES ('career', 'career');
INSERT INTO `tlds` (`id`, `value`) VALUES ('careers', 'careers');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cars', 'cars');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cartier', 'cartier');
INSERT INTO `tlds` (`id`, `value`) VALUES ('casa', 'casa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('case', 'case');
INSERT INTO `tlds` (`id`, `value`) VALUES ('caseih', 'caseih');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cash', 'cash');
INSERT INTO `tlds` (`id`, `value`) VALUES ('casino', 'casino');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cat', 'cat');
INSERT INTO `tlds` (`id`, `value`) VALUES ('catering', 'catering');
INSERT INTO `tlds` (`id`, `value`) VALUES ('catholic', 'catholic');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cba', 'cba');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cbn', 'cbn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cbre', 'cbre');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cbs', 'cbs');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cc', 'cc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cd', 'cd');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ceb', 'ceb');
INSERT INTO `tlds` (`id`, `value`) VALUES ('center', 'center');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ceo', 'ceo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cern', 'cern');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cf', 'cf');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cfa', 'cfa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cfd', 'cfd');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cg', 'cg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ch', 'ch');
INSERT INTO `tlds` (`id`, `value`) VALUES ('chanel', 'chanel');
INSERT INTO `tlds` (`id`, `value`) VALUES ('channel', 'channel');
INSERT INTO `tlds` (`id`, `value`) VALUES ('chase', 'chase');
INSERT INTO `tlds` (`id`, `value`) VALUES ('chat', 'chat');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cheap', 'cheap');
INSERT INTO `tlds` (`id`, `value`) VALUES ('chintai', 'chintai');
INSERT INTO `tlds` (`id`, `value`) VALUES ('christmas', 'christmas');
INSERT INTO `tlds` (`id`, `value`) VALUES ('chrome', 'chrome');
INSERT INTO `tlds` (`id`, `value`) VALUES ('chrysler', 'chrysler');
INSERT INTO `tlds` (`id`, `value`) VALUES ('church', 'church');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ci', 'ci');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cipriani', 'cipriani');
INSERT INTO `tlds` (`id`, `value`) VALUES ('circle', 'circle');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cisco', 'cisco');
INSERT INTO `tlds` (`id`, `value`) VALUES ('citadel', 'citadel');
INSERT INTO `tlds` (`id`, `value`) VALUES ('citi', 'citi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('citic', 'citic');
INSERT INTO `tlds` (`id`, `value`) VALUES ('city', 'city');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cityeats', 'cityeats');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ck', 'ck');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cl', 'cl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('claims', 'claims');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cleaning', 'cleaning');
INSERT INTO `tlds` (`id`, `value`) VALUES ('click', 'click');
INSERT INTO `tlds` (`id`, `value`) VALUES ('clinic', 'clinic');
INSERT INTO `tlds` (`id`, `value`) VALUES ('clinique', 'clinique');
INSERT INTO `tlds` (`id`, `value`) VALUES ('clothing', 'clothing');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cloud', 'cloud');
INSERT INTO `tlds` (`id`, `value`) VALUES ('club', 'club');
INSERT INTO `tlds` (`id`, `value`) VALUES ('clubmed', 'clubmed');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cm', 'cm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cn', 'cn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('co', 'co');
INSERT INTO `tlds` (`id`, `value`) VALUES ('coach', 'coach');
INSERT INTO `tlds` (`id`, `value`) VALUES ('codes', 'codes');
INSERT INTO `tlds` (`id`, `value`) VALUES ('coffee', 'coffee');
INSERT INTO `tlds` (`id`, `value`) VALUES ('college', 'college');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cologne', 'cologne');
INSERT INTO `tlds` (`id`, `value`) VALUES ('com', 'com');
INSERT INTO `tlds` (`id`, `value`) VALUES ('comcast', 'comcast');
INSERT INTO `tlds` (`id`, `value`) VALUES ('commbank', 'commbank');
INSERT INTO `tlds` (`id`, `value`) VALUES ('community', 'community');
INSERT INTO `tlds` (`id`, `value`) VALUES ('company', 'company');
INSERT INTO `tlds` (`id`, `value`) VALUES ('compare', 'compare');
INSERT INTO `tlds` (`id`, `value`) VALUES ('computer', 'computer');
INSERT INTO `tlds` (`id`, `value`) VALUES ('comsec', 'comsec');
INSERT INTO `tlds` (`id`, `value`) VALUES ('condos', 'condos');
INSERT INTO `tlds` (`id`, `value`) VALUES ('construction', 'construction');
INSERT INTO `tlds` (`id`, `value`) VALUES ('consulting', 'consulting');
INSERT INTO `tlds` (`id`, `value`) VALUES ('contact', 'contact');
INSERT INTO `tlds` (`id`, `value`) VALUES ('contractors', 'contractors');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cooking', 'cooking');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cookingchannel', 'cookingchannel');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cool', 'cool');
INSERT INTO `tlds` (`id`, `value`) VALUES ('coop', 'coop');
INSERT INTO `tlds` (`id`, `value`) VALUES ('corsica', 'corsica');
INSERT INTO `tlds` (`id`, `value`) VALUES ('country', 'country');
INSERT INTO `tlds` (`id`, `value`) VALUES ('coupon', 'coupon');
INSERT INTO `tlds` (`id`, `value`) VALUES ('coupons', 'coupons');
INSERT INTO `tlds` (`id`, `value`) VALUES ('courses', 'courses');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cr', 'cr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('credit', 'credit');
INSERT INTO `tlds` (`id`, `value`) VALUES ('creditcard', 'creditcard');
INSERT INTO `tlds` (`id`, `value`) VALUES ('creditunion', 'creditunion');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cricket', 'cricket');
INSERT INTO `tlds` (`id`, `value`) VALUES ('crown', 'crown');
INSERT INTO `tlds` (`id`, `value`) VALUES ('crs', 'crs');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cruise', 'cruise');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cruises', 'cruises');
INSERT INTO `tlds` (`id`, `value`) VALUES ('csc', 'csc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cu', 'cu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cuisinella', 'cuisinella');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cv', 'cv');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cw', 'cw');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cx', 'cx');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cy', 'cy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cymru', 'cymru');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cyou', 'cyou');
INSERT INTO `tlds` (`id`, `value`) VALUES ('cz', 'cz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dabur', 'dabur');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dad', 'dad');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dance', 'dance');
INSERT INTO `tlds` (`id`, `value`) VALUES ('data', 'data');
INSERT INTO `tlds` (`id`, `value`) VALUES ('date', 'date');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dating', 'dating');
INSERT INTO `tlds` (`id`, `value`) VALUES ('datsun', 'datsun');
INSERT INTO `tlds` (`id`, `value`) VALUES ('day', 'day');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dclk', 'dclk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dds', 'dds');
INSERT INTO `tlds` (`id`, `value`) VALUES ('de', 'de');
INSERT INTO `tlds` (`id`, `value`) VALUES ('deal', 'deal');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dealer', 'dealer');
INSERT INTO `tlds` (`id`, `value`) VALUES ('deals', 'deals');
INSERT INTO `tlds` (`id`, `value`) VALUES ('degree', 'degree');
INSERT INTO `tlds` (`id`, `value`) VALUES ('delivery', 'delivery');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dell', 'dell');
INSERT INTO `tlds` (`id`, `value`) VALUES ('deloitte', 'deloitte');
INSERT INTO `tlds` (`id`, `value`) VALUES ('delta', 'delta');
INSERT INTO `tlds` (`id`, `value`) VALUES ('democrat', 'democrat');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dental', 'dental');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dentist', 'dentist');
INSERT INTO `tlds` (`id`, `value`) VALUES ('desi', 'desi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('design', 'design');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dev', 'dev');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dhl', 'dhl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('diamonds', 'diamonds');
INSERT INTO `tlds` (`id`, `value`) VALUES ('diet', 'diet');
INSERT INTO `tlds` (`id`, `value`) VALUES ('digital', 'digital');
INSERT INTO `tlds` (`id`, `value`) VALUES ('direct', 'direct');
INSERT INTO `tlds` (`id`, `value`) VALUES ('directory', 'directory');
INSERT INTO `tlds` (`id`, `value`) VALUES ('discount', 'discount');
INSERT INTO `tlds` (`id`, `value`) VALUES ('discover', 'discover');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dish', 'dish');
INSERT INTO `tlds` (`id`, `value`) VALUES ('diy', 'diy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dj', 'dj');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dk', 'dk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dm', 'dm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dnp', 'dnp');
INSERT INTO `tlds` (`id`, `value`) VALUES ('do', 'do');
INSERT INTO `tlds` (`id`, `value`) VALUES ('docs', 'docs');
INSERT INTO `tlds` (`id`, `value`) VALUES ('doctor', 'doctor');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dodge', 'dodge');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dog', 'dog');
INSERT INTO `tlds` (`id`, `value`) VALUES ('doha', 'doha');
INSERT INTO `tlds` (`id`, `value`) VALUES ('domains', 'domains');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dot', 'dot');
INSERT INTO `tlds` (`id`, `value`) VALUES ('download', 'download');
INSERT INTO `tlds` (`id`, `value`) VALUES ('drive', 'drive');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dtv', 'dtv');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dubai', 'dubai');
INSERT INTO `tlds` (`id`, `value`) VALUES ('duck', 'duck');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dunlop', 'dunlop');
INSERT INTO `tlds` (`id`, `value`) VALUES ('duns', 'duns');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dupont', 'dupont');
INSERT INTO `tlds` (`id`, `value`) VALUES ('durban', 'durban');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dvag', 'dvag');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dvr', 'dvr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('dz', 'dz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('earth', 'earth');
INSERT INTO `tlds` (`id`, `value`) VALUES ('eat', 'eat');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ec', 'ec');
INSERT INTO `tlds` (`id`, `value`) VALUES ('eco', 'eco');
INSERT INTO `tlds` (`id`, `value`) VALUES ('edeka', 'edeka');
INSERT INTO `tlds` (`id`, `value`) VALUES ('edu', 'edu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('education', 'education');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ee', 'ee');
INSERT INTO `tlds` (`id`, `value`) VALUES ('eg', 'eg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('email', 'email');
INSERT INTO `tlds` (`id`, `value`) VALUES ('emerck', 'emerck');
INSERT INTO `tlds` (`id`, `value`) VALUES ('energy', 'energy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('engineer', 'engineer');
INSERT INTO `tlds` (`id`, `value`) VALUES ('engineering', 'engineering');
INSERT INTO `tlds` (`id`, `value`) VALUES ('enterprises', 'enterprises');
INSERT INTO `tlds` (`id`, `value`) VALUES ('epost', 'epost');
INSERT INTO `tlds` (`id`, `value`) VALUES ('epson', 'epson');
INSERT INTO `tlds` (`id`, `value`) VALUES ('equipment', 'equipment');
INSERT INTO `tlds` (`id`, `value`) VALUES ('er', 'er');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ericsson', 'ericsson');
INSERT INTO `tlds` (`id`, `value`) VALUES ('erni', 'erni');
INSERT INTO `tlds` (`id`, `value`) VALUES ('es', 'es');
INSERT INTO `tlds` (`id`, `value`) VALUES ('esq', 'esq');
INSERT INTO `tlds` (`id`, `value`) VALUES ('estate', 'estate');
INSERT INTO `tlds` (`id`, `value`) VALUES ('esurance', 'esurance');
INSERT INTO `tlds` (`id`, `value`) VALUES ('et', 'et');
INSERT INTO `tlds` (`id`, `value`) VALUES ('etisalat', 'etisalat');
INSERT INTO `tlds` (`id`, `value`) VALUES ('eu', 'eu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('eurovision', 'eurovision');
INSERT INTO `tlds` (`id`, `value`) VALUES ('eus', 'eus');
INSERT INTO `tlds` (`id`, `value`) VALUES ('events', 'events');
INSERT INTO `tlds` (`id`, `value`) VALUES ('everbank', 'everbank');
INSERT INTO `tlds` (`id`, `value`) VALUES ('exchange', 'exchange');
INSERT INTO `tlds` (`id`, `value`) VALUES ('expert', 'expert');
INSERT INTO `tlds` (`id`, `value`) VALUES ('exposed', 'exposed');
INSERT INTO `tlds` (`id`, `value`) VALUES ('express', 'express');
INSERT INTO `tlds` (`id`, `value`) VALUES ('extraspace', 'extraspace');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fage', 'fage');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fail', 'fail');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fairwinds', 'fairwinds');
INSERT INTO `tlds` (`id`, `value`) VALUES ('faith', 'faith');
INSERT INTO `tlds` (`id`, `value`) VALUES ('family', 'family');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fan', 'fan');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fans', 'fans');
INSERT INTO `tlds` (`id`, `value`) VALUES ('farm', 'farm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('farmers', 'farmers');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fashion', 'fashion');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fast', 'fast');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fedex', 'fedex');
INSERT INTO `tlds` (`id`, `value`) VALUES ('feedback', 'feedback');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ferrari', 'ferrari');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ferrero', 'ferrero');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fi', 'fi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fiat', 'fiat');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fidelity', 'fidelity');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fido', 'fido');
INSERT INTO `tlds` (`id`, `value`) VALUES ('film', 'film');
INSERT INTO `tlds` (`id`, `value`) VALUES ('final', 'final');
INSERT INTO `tlds` (`id`, `value`) VALUES ('finance', 'finance');
INSERT INTO `tlds` (`id`, `value`) VALUES ('financial', 'financial');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fire', 'fire');
INSERT INTO `tlds` (`id`, `value`) VALUES ('firestone', 'firestone');
INSERT INTO `tlds` (`id`, `value`) VALUES ('firmdale', 'firmdale');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fish', 'fish');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fishing', 'fishing');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fit', 'fit');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fitness', 'fitness');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fj', 'fj');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fk', 'fk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('flickr', 'flickr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('flights', 'flights');
INSERT INTO `tlds` (`id`, `value`) VALUES ('flir', 'flir');
INSERT INTO `tlds` (`id`, `value`) VALUES ('florist', 'florist');
INSERT INTO `tlds` (`id`, `value`) VALUES ('flowers', 'flowers');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fly', 'fly');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fm', 'fm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fo', 'fo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('foo', 'foo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('food', 'food');
INSERT INTO `tlds` (`id`, `value`) VALUES ('foodnetwork', 'foodnetwork');
INSERT INTO `tlds` (`id`, `value`) VALUES ('football', 'football');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ford', 'ford');
INSERT INTO `tlds` (`id`, `value`) VALUES ('forex', 'forex');
INSERT INTO `tlds` (`id`, `value`) VALUES ('forsale', 'forsale');
INSERT INTO `tlds` (`id`, `value`) VALUES ('forum', 'forum');
INSERT INTO `tlds` (`id`, `value`) VALUES ('foundation', 'foundation');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fox', 'fox');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fr', 'fr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('free', 'free');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fresenius', 'fresenius');
INSERT INTO `tlds` (`id`, `value`) VALUES ('frl', 'frl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('frogans', 'frogans');
INSERT INTO `tlds` (`id`, `value`) VALUES ('frontdoor', 'frontdoor');
INSERT INTO `tlds` (`id`, `value`) VALUES ('frontier', 'frontier');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ftr', 'ftr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fujitsu', 'fujitsu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fujixerox', 'fujixerox');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fun', 'fun');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fund', 'fund');
INSERT INTO `tlds` (`id`, `value`) VALUES ('furniture', 'furniture');
INSERT INTO `tlds` (`id`, `value`) VALUES ('futbol', 'futbol');
INSERT INTO `tlds` (`id`, `value`) VALUES ('fyi', 'fyi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ga', 'ga');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gal', 'gal');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gallery', 'gallery');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gallo', 'gallo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gallup', 'gallup');
INSERT INTO `tlds` (`id`, `value`) VALUES ('game', 'game');
INSERT INTO `tlds` (`id`, `value`) VALUES ('games', 'games');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gap', 'gap');
INSERT INTO `tlds` (`id`, `value`) VALUES ('garden', 'garden');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gb', 'gb');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gbiz', 'gbiz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gd', 'gd');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gdn', 'gdn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ge', 'ge');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gea', 'gea');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gent', 'gent');
INSERT INTO `tlds` (`id`, `value`) VALUES ('genting', 'genting');
INSERT INTO `tlds` (`id`, `value`) VALUES ('george', 'george');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gf', 'gf');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gg', 'gg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ggee', 'ggee');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gh', 'gh');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gi', 'gi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gift', 'gift');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gifts', 'gifts');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gives', 'gives');
INSERT INTO `tlds` (`id`, `value`) VALUES ('giving', 'giving');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gl', 'gl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('glade', 'glade');
INSERT INTO `tlds` (`id`, `value`) VALUES ('glass', 'glass');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gle', 'gle');
INSERT INTO `tlds` (`id`, `value`) VALUES ('global', 'global');
INSERT INTO `tlds` (`id`, `value`) VALUES ('globo', 'globo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gm', 'gm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gmail', 'gmail');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gmbh', 'gmbh');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gmo', 'gmo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gmx', 'gmx');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gn', 'gn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('godaddy', 'godaddy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gold', 'gold');
INSERT INTO `tlds` (`id`, `value`) VALUES ('goldpoint', 'goldpoint');
INSERT INTO `tlds` (`id`, `value`) VALUES ('golf', 'golf');
INSERT INTO `tlds` (`id`, `value`) VALUES ('goo', 'goo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('goodhands', 'goodhands');
INSERT INTO `tlds` (`id`, `value`) VALUES ('goodyear', 'goodyear');
INSERT INTO `tlds` (`id`, `value`) VALUES ('goog', 'goog');
INSERT INTO `tlds` (`id`, `value`) VALUES ('google', 'google');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gop', 'gop');
INSERT INTO `tlds` (`id`, `value`) VALUES ('got', 'got');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gov', 'gov');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gp', 'gp');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gq', 'gq');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gr', 'gr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('grainger', 'grainger');
INSERT INTO `tlds` (`id`, `value`) VALUES ('graphics', 'graphics');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gratis', 'gratis');
INSERT INTO `tlds` (`id`, `value`) VALUES ('green', 'green');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gripe', 'gripe');
INSERT INTO `tlds` (`id`, `value`) VALUES ('grocery', 'grocery');
INSERT INTO `tlds` (`id`, `value`) VALUES ('group', 'group');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gs', 'gs');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gt', 'gt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gu', 'gu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('guardian', 'guardian');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gucci', 'gucci');
INSERT INTO `tlds` (`id`, `value`) VALUES ('guge', 'guge');
INSERT INTO `tlds` (`id`, `value`) VALUES ('guide', 'guide');
INSERT INTO `tlds` (`id`, `value`) VALUES ('guitars', 'guitars');
INSERT INTO `tlds` (`id`, `value`) VALUES ('guru', 'guru');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gw', 'gw');
INSERT INTO `tlds` (`id`, `value`) VALUES ('gy', 'gy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hair', 'hair');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hamburg', 'hamburg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hangout', 'hangout');
INSERT INTO `tlds` (`id`, `value`) VALUES ('haus', 'haus');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hbo', 'hbo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hdfc', 'hdfc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hdfcbank', 'hdfcbank');
INSERT INTO `tlds` (`id`, `value`) VALUES ('health', 'health');
INSERT INTO `tlds` (`id`, `value`) VALUES ('healthcare', 'healthcare');
INSERT INTO `tlds` (`id`, `value`) VALUES ('help', 'help');
INSERT INTO `tlds` (`id`, `value`) VALUES ('helsinki', 'helsinki');
INSERT INTO `tlds` (`id`, `value`) VALUES ('here', 'here');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hermes', 'hermes');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hgtv', 'hgtv');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hiphop', 'hiphop');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hisamitsu', 'hisamitsu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hitachi', 'hitachi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hiv', 'hiv');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hk', 'hk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hkt', 'hkt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hm', 'hm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hn', 'hn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hockey', 'hockey');
INSERT INTO `tlds` (`id`, `value`) VALUES ('holdings', 'holdings');
INSERT INTO `tlds` (`id`, `value`) VALUES ('holiday', 'holiday');
INSERT INTO `tlds` (`id`, `value`) VALUES ('homedepot', 'homedepot');
INSERT INTO `tlds` (`id`, `value`) VALUES ('homegoods', 'homegoods');
INSERT INTO `tlds` (`id`, `value`) VALUES ('homes', 'homes');
INSERT INTO `tlds` (`id`, `value`) VALUES ('homesense', 'homesense');
INSERT INTO `tlds` (`id`, `value`) VALUES ('honda', 'honda');
INSERT INTO `tlds` (`id`, `value`) VALUES ('honeywell', 'honeywell');
INSERT INTO `tlds` (`id`, `value`) VALUES ('horse', 'horse');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hospital', 'hospital');
INSERT INTO `tlds` (`id`, `value`) VALUES ('host', 'host');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hosting', 'hosting');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hot', 'hot');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hoteles', 'hoteles');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hotels', 'hotels');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hotmail', 'hotmail');
INSERT INTO `tlds` (`id`, `value`) VALUES ('house', 'house');
INSERT INTO `tlds` (`id`, `value`) VALUES ('how', 'how');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hr', 'hr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hsbc', 'hsbc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ht', 'ht');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hu', 'hu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hughes', 'hughes');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hyatt', 'hyatt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('hyundai', 'hyundai');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ibm', 'ibm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('icbc', 'icbc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ice', 'ice');
INSERT INTO `tlds` (`id`, `value`) VALUES ('icu', 'icu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('id', 'id');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ie', 'ie');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ieee', 'ieee');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ifm', 'ifm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ikano', 'ikano');
INSERT INTO `tlds` (`id`, `value`) VALUES ('il', 'il');
INSERT INTO `tlds` (`id`, `value`) VALUES ('im', 'im');
INSERT INTO `tlds` (`id`, `value`) VALUES ('imamat', 'imamat');
INSERT INTO `tlds` (`id`, `value`) VALUES ('imdb', 'imdb');
INSERT INTO `tlds` (`id`, `value`) VALUES ('immo', 'immo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('immobilien', 'immobilien');
INSERT INTO `tlds` (`id`, `value`) VALUES ('in', 'in');
INSERT INTO `tlds` (`id`, `value`) VALUES ('industries', 'industries');
INSERT INTO `tlds` (`id`, `value`) VALUES ('infiniti', 'infiniti');
INSERT INTO `tlds` (`id`, `value`) VALUES ('info', 'info');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ing', 'ing');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ink', 'ink');
INSERT INTO `tlds` (`id`, `value`) VALUES ('institute', 'institute');
INSERT INTO `tlds` (`id`, `value`) VALUES ('insurance', 'insurance');
INSERT INTO `tlds` (`id`, `value`) VALUES ('insure', 'insure');
INSERT INTO `tlds` (`id`, `value`) VALUES ('int', 'int');
INSERT INTO `tlds` (`id`, `value`) VALUES ('intel', 'intel');
INSERT INTO `tlds` (`id`, `value`) VALUES ('international', 'international');
INSERT INTO `tlds` (`id`, `value`) VALUES ('intuit', 'intuit');
INSERT INTO `tlds` (`id`, `value`) VALUES ('investments', 'investments');
INSERT INTO `tlds` (`id`, `value`) VALUES ('io', 'io');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ipiranga', 'ipiranga');
INSERT INTO `tlds` (`id`, `value`) VALUES ('iq', 'iq');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ir', 'ir');
INSERT INTO `tlds` (`id`, `value`) VALUES ('irish', 'irish');
INSERT INTO `tlds` (`id`, `value`) VALUES ('is', 'is');
INSERT INTO `tlds` (`id`, `value`) VALUES ('iselect', 'iselect');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ismaili', 'ismaili');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ist', 'ist');
INSERT INTO `tlds` (`id`, `value`) VALUES ('istanbul', 'istanbul');
INSERT INTO `tlds` (`id`, `value`) VALUES ('it', 'it');
INSERT INTO `tlds` (`id`, `value`) VALUES ('itau', 'itau');
INSERT INTO `tlds` (`id`, `value`) VALUES ('itv', 'itv');
INSERT INTO `tlds` (`id`, `value`) VALUES ('iveco', 'iveco');
INSERT INTO `tlds` (`id`, `value`) VALUES ('iwc', 'iwc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jaguar', 'jaguar');
INSERT INTO `tlds` (`id`, `value`) VALUES ('java', 'java');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jcb', 'jcb');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jcp', 'jcp');
INSERT INTO `tlds` (`id`, `value`) VALUES ('je', 'je');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jeep', 'jeep');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jetzt', 'jetzt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jewelry', 'jewelry');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jio', 'jio');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jlc', 'jlc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jll', 'jll');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jm', 'jm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jmp', 'jmp');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jnj', 'jnj');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jo', 'jo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jobs', 'jobs');
INSERT INTO `tlds` (`id`, `value`) VALUES ('joburg', 'joburg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jot', 'jot');
INSERT INTO `tlds` (`id`, `value`) VALUES ('joy', 'joy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jp', 'jp');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jpmorgan', 'jpmorgan');
INSERT INTO `tlds` (`id`, `value`) VALUES ('jprs', 'jprs');
INSERT INTO `tlds` (`id`, `value`) VALUES ('juegos', 'juegos');
INSERT INTO `tlds` (`id`, `value`) VALUES ('juniper', 'juniper');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kaufen', 'kaufen');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kddi', 'kddi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ke', 'ke');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kerryhotels', 'kerryhotels');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kerrylogistics', 'kerrylogistics');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kerryproperties', 'kerryproperties');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kfh', 'kfh');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kg', 'kg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kh', 'kh');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ki', 'ki');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kia', 'kia');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kim', 'kim');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kinder', 'kinder');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kindle', 'kindle');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kitchen', 'kitchen');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kiwi', 'kiwi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('km', 'km');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kn', 'kn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('koeln', 'koeln');
INSERT INTO `tlds` (`id`, `value`) VALUES ('komatsu', 'komatsu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kosher', 'kosher');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kp', 'kp');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kpmg', 'kpmg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kpn', 'kpn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kr', 'kr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('krd', 'krd');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kred', 'kred');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kuokgroup', 'kuokgroup');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kw', 'kw');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ky', 'ky');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kyoto', 'kyoto');
INSERT INTO `tlds` (`id`, `value`) VALUES ('kz', 'kz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('la', 'la');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lacaixa', 'lacaixa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ladbrokes', 'ladbrokes');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lamborghini', 'lamborghini');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lamer', 'lamer');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lancaster', 'lancaster');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lancia', 'lancia');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lancome', 'lancome');
INSERT INTO `tlds` (`id`, `value`) VALUES ('land', 'land');
INSERT INTO `tlds` (`id`, `value`) VALUES ('landrover', 'landrover');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lanxess', 'lanxess');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lasalle', 'lasalle');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lat', 'lat');
INSERT INTO `tlds` (`id`, `value`) VALUES ('latino', 'latino');
INSERT INTO `tlds` (`id`, `value`) VALUES ('latrobe', 'latrobe');
INSERT INTO `tlds` (`id`, `value`) VALUES ('law', 'law');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lawyer', 'lawyer');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lb', 'lb');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lc', 'lc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lds', 'lds');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lease', 'lease');
INSERT INTO `tlds` (`id`, `value`) VALUES ('leclerc', 'leclerc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lefrak', 'lefrak');
INSERT INTO `tlds` (`id`, `value`) VALUES ('legal', 'legal');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lego', 'lego');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lexus', 'lexus');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lgbt', 'lgbt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('li', 'li');
INSERT INTO `tlds` (`id`, `value`) VALUES ('liaison', 'liaison');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lidl', 'lidl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('life', 'life');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lifeinsurance', 'lifeinsurance');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lifestyle', 'lifestyle');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lighting', 'lighting');
INSERT INTO `tlds` (`id`, `value`) VALUES ('like', 'like');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lilly', 'lilly');
INSERT INTO `tlds` (`id`, `value`) VALUES ('limited', 'limited');
INSERT INTO `tlds` (`id`, `value`) VALUES ('limo', 'limo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lincoln', 'lincoln');
INSERT INTO `tlds` (`id`, `value`) VALUES ('linde', 'linde');
INSERT INTO `tlds` (`id`, `value`) VALUES ('link', 'link');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lipsy', 'lipsy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('live', 'live');
INSERT INTO `tlds` (`id`, `value`) VALUES ('living', 'living');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lixil', 'lixil');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lk', 'lk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('llc', 'llc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('loan', 'loan');
INSERT INTO `tlds` (`id`, `value`) VALUES ('loans', 'loans');
INSERT INTO `tlds` (`id`, `value`) VALUES ('locker', 'locker');
INSERT INTO `tlds` (`id`, `value`) VALUES ('locus', 'locus');
INSERT INTO `tlds` (`id`, `value`) VALUES ('loft', 'loft');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lol', 'lol');
INSERT INTO `tlds` (`id`, `value`) VALUES ('london', 'london');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lotte', 'lotte');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lotto', 'lotto');
INSERT INTO `tlds` (`id`, `value`) VALUES ('love', 'love');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lpl', 'lpl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lplfinancial', 'lplfinancial');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lr', 'lr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ls', 'ls');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lt', 'lt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ltd', 'ltd');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ltda', 'ltda');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lu', 'lu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lundbeck', 'lundbeck');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lupin', 'lupin');
INSERT INTO `tlds` (`id`, `value`) VALUES ('luxe', 'luxe');
INSERT INTO `tlds` (`id`, `value`) VALUES ('luxury', 'luxury');
INSERT INTO `tlds` (`id`, `value`) VALUES ('lv', 'lv');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ly', 'ly');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ma', 'ma');
INSERT INTO `tlds` (`id`, `value`) VALUES ('macys', 'macys');
INSERT INTO `tlds` (`id`, `value`) VALUES ('madrid', 'madrid');
INSERT INTO `tlds` (`id`, `value`) VALUES ('maif', 'maif');
INSERT INTO `tlds` (`id`, `value`) VALUES ('maison', 'maison');
INSERT INTO `tlds` (`id`, `value`) VALUES ('makeup', 'makeup');
INSERT INTO `tlds` (`id`, `value`) VALUES ('man', 'man');
INSERT INTO `tlds` (`id`, `value`) VALUES ('management', 'management');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mango', 'mango');
INSERT INTO `tlds` (`id`, `value`) VALUES ('map', 'map');
INSERT INTO `tlds` (`id`, `value`) VALUES ('market', 'market');
INSERT INTO `tlds` (`id`, `value`) VALUES ('marketing', 'marketing');
INSERT INTO `tlds` (`id`, `value`) VALUES ('markets', 'markets');
INSERT INTO `tlds` (`id`, `value`) VALUES ('marriott', 'marriott');
INSERT INTO `tlds` (`id`, `value`) VALUES ('marshalls', 'marshalls');
INSERT INTO `tlds` (`id`, `value`) VALUES ('maserati', 'maserati');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mattel', 'mattel');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mba', 'mba');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mc', 'mc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mckinsey', 'mckinsey');
INSERT INTO `tlds` (`id`, `value`) VALUES ('md', 'md');
INSERT INTO `tlds` (`id`, `value`) VALUES ('me', 'me');
INSERT INTO `tlds` (`id`, `value`) VALUES ('med', 'med');
INSERT INTO `tlds` (`id`, `value`) VALUES ('media', 'media');
INSERT INTO `tlds` (`id`, `value`) VALUES ('meet', 'meet');
INSERT INTO `tlds` (`id`, `value`) VALUES ('melbourne', 'melbourne');
INSERT INTO `tlds` (`id`, `value`) VALUES ('meme', 'meme');
INSERT INTO `tlds` (`id`, `value`) VALUES ('memorial', 'memorial');
INSERT INTO `tlds` (`id`, `value`) VALUES ('men', 'men');
INSERT INTO `tlds` (`id`, `value`) VALUES ('menu', 'menu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('meo', 'meo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('merckmsd', 'merckmsd');
INSERT INTO `tlds` (`id`, `value`) VALUES ('metlife', 'metlife');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mg', 'mg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mh', 'mh');
INSERT INTO `tlds` (`id`, `value`) VALUES ('miami', 'miami');
INSERT INTO `tlds` (`id`, `value`) VALUES ('microsoft', 'microsoft');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mil', 'mil');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mini', 'mini');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mint', 'mint');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mit', 'mit');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mitsubishi', 'mitsubishi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mk', 'mk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ml', 'ml');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mlb', 'mlb');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mls', 'mls');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mm', 'mm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mma', 'mma');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mn', 'mn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mo', 'mo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mobi', 'mobi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mobile', 'mobile');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mobily', 'mobily');
INSERT INTO `tlds` (`id`, `value`) VALUES ('moda', 'moda');
INSERT INTO `tlds` (`id`, `value`) VALUES ('moe', 'moe');
INSERT INTO `tlds` (`id`, `value`) VALUES ('moi', 'moi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mom', 'mom');
INSERT INTO `tlds` (`id`, `value`) VALUES ('monash', 'monash');
INSERT INTO `tlds` (`id`, `value`) VALUES ('money', 'money');
INSERT INTO `tlds` (`id`, `value`) VALUES ('monster', 'monster');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mopar', 'mopar');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mormon', 'mormon');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mortgage', 'mortgage');
INSERT INTO `tlds` (`id`, `value`) VALUES ('moscow', 'moscow');
INSERT INTO `tlds` (`id`, `value`) VALUES ('moto', 'moto');
INSERT INTO `tlds` (`id`, `value`) VALUES ('motorcycles', 'motorcycles');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mov', 'mov');
INSERT INTO `tlds` (`id`, `value`) VALUES ('movie', 'movie');
INSERT INTO `tlds` (`id`, `value`) VALUES ('movistar', 'movistar');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mp', 'mp');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mq', 'mq');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mr', 'mr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ms', 'ms');
INSERT INTO `tlds` (`id`, `value`) VALUES ('msd', 'msd');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mt', 'mt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mtn', 'mtn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mtr', 'mtr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mu', 'mu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('museum', 'museum');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mutual', 'mutual');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mv', 'mv');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mw', 'mw');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mx', 'mx');
INSERT INTO `tlds` (`id`, `value`) VALUES ('my', 'my');
INSERT INTO `tlds` (`id`, `value`) VALUES ('mz', 'mz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('na', 'na');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nab', 'nab');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nadex', 'nadex');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nagoya', 'nagoya');
INSERT INTO `tlds` (`id`, `value`) VALUES ('name', 'name');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nationwide', 'nationwide');
INSERT INTO `tlds` (`id`, `value`) VALUES ('natura', 'natura');
INSERT INTO `tlds` (`id`, `value`) VALUES ('navy', 'navy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nba', 'nba');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nc', 'nc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ne', 'ne');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nec', 'nec');
INSERT INTO `tlds` (`id`, `value`) VALUES ('net', 'net');
INSERT INTO `tlds` (`id`, `value`) VALUES ('netbank', 'netbank');
INSERT INTO `tlds` (`id`, `value`) VALUES ('netflix', 'netflix');
INSERT INTO `tlds` (`id`, `value`) VALUES ('network', 'network');
INSERT INTO `tlds` (`id`, `value`) VALUES ('neustar', 'neustar');
INSERT INTO `tlds` (`id`, `value`) VALUES ('new', 'new');
INSERT INTO `tlds` (`id`, `value`) VALUES ('newholland', 'newholland');
INSERT INTO `tlds` (`id`, `value`) VALUES ('news', 'news');
INSERT INTO `tlds` (`id`, `value`) VALUES ('next', 'next');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nextdirect', 'nextdirect');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nexus', 'nexus');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nf', 'nf');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nfl', 'nfl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ng', 'ng');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ngo', 'ngo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nhk', 'nhk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ni', 'ni');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nico', 'nico');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nike', 'nike');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nikon', 'nikon');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ninja', 'ninja');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nissan', 'nissan');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nissay', 'nissay');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nl', 'nl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('no', 'no');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nokia', 'nokia');
INSERT INTO `tlds` (`id`, `value`) VALUES ('northwesternmutual', 'northwesternmutual');
INSERT INTO `tlds` (`id`, `value`) VALUES ('norton', 'norton');
INSERT INTO `tlds` (`id`, `value`) VALUES ('now', 'now');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nowruz', 'nowruz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nowtv', 'nowtv');
INSERT INTO `tlds` (`id`, `value`) VALUES ('np', 'np');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nr', 'nr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nra', 'nra');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nrw', 'nrw');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ntt', 'ntt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nu', 'nu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nyc', 'nyc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('nz', 'nz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('obi', 'obi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('observer', 'observer');
INSERT INTO `tlds` (`id`, `value`) VALUES ('off', 'off');
INSERT INTO `tlds` (`id`, `value`) VALUES ('office', 'office');
INSERT INTO `tlds` (`id`, `value`) VALUES ('okinawa', 'okinawa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('olayan', 'olayan');
INSERT INTO `tlds` (`id`, `value`) VALUES ('olayangroup', 'olayangroup');
INSERT INTO `tlds` (`id`, `value`) VALUES ('oldnavy', 'oldnavy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ollo', 'ollo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('om', 'om');
INSERT INTO `tlds` (`id`, `value`) VALUES ('omega', 'omega');
INSERT INTO `tlds` (`id`, `value`) VALUES ('one', 'one');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ong', 'ong');
INSERT INTO `tlds` (`id`, `value`) VALUES ('onl', 'onl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('online', 'online');
INSERT INTO `tlds` (`id`, `value`) VALUES ('onyourside', 'onyourside');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ooo', 'ooo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('open', 'open');
INSERT INTO `tlds` (`id`, `value`) VALUES ('oracle', 'oracle');
INSERT INTO `tlds` (`id`, `value`) VALUES ('orange', 'orange');
INSERT INTO `tlds` (`id`, `value`) VALUES ('org', 'org');
INSERT INTO `tlds` (`id`, `value`) VALUES ('organic', 'organic');
INSERT INTO `tlds` (`id`, `value`) VALUES ('origins', 'origins');
INSERT INTO `tlds` (`id`, `value`) VALUES ('osaka', 'osaka');
INSERT INTO `tlds` (`id`, `value`) VALUES ('otsuka', 'otsuka');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ott', 'ott');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ovh', 'ovh');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pa', 'pa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('page', 'page');
INSERT INTO `tlds` (`id`, `value`) VALUES ('panasonic', 'panasonic');
INSERT INTO `tlds` (`id`, `value`) VALUES ('panerai', 'panerai');
INSERT INTO `tlds` (`id`, `value`) VALUES ('paris', 'paris');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pars', 'pars');
INSERT INTO `tlds` (`id`, `value`) VALUES ('partners', 'partners');
INSERT INTO `tlds` (`id`, `value`) VALUES ('parts', 'parts');
INSERT INTO `tlds` (`id`, `value`) VALUES ('party', 'party');
INSERT INTO `tlds` (`id`, `value`) VALUES ('passagens', 'passagens');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pay', 'pay');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pccw', 'pccw');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pe', 'pe');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pet', 'pet');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pf', 'pf');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pfizer', 'pfizer');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pg', 'pg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ph', 'ph');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pharmacy', 'pharmacy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('phd', 'phd');
INSERT INTO `tlds` (`id`, `value`) VALUES ('philips', 'philips');
INSERT INTO `tlds` (`id`, `value`) VALUES ('phone', 'phone');
INSERT INTO `tlds` (`id`, `value`) VALUES ('photo', 'photo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('photography', 'photography');
INSERT INTO `tlds` (`id`, `value`) VALUES ('photos', 'photos');
INSERT INTO `tlds` (`id`, `value`) VALUES ('physio', 'physio');
INSERT INTO `tlds` (`id`, `value`) VALUES ('piaget', 'piaget');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pics', 'pics');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pictet', 'pictet');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pictures', 'pictures');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pid', 'pid');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pin', 'pin');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ping', 'ping');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pink', 'pink');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pioneer', 'pioneer');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pizza', 'pizza');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pk', 'pk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pl', 'pl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('place', 'place');
INSERT INTO `tlds` (`id`, `value`) VALUES ('play', 'play');
INSERT INTO `tlds` (`id`, `value`) VALUES ('playstation', 'playstation');
INSERT INTO `tlds` (`id`, `value`) VALUES ('plumbing', 'plumbing');
INSERT INTO `tlds` (`id`, `value`) VALUES ('plus', 'plus');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pm', 'pm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pn', 'pn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pnc', 'pnc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pohl', 'pohl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('poker', 'poker');
INSERT INTO `tlds` (`id`, `value`) VALUES ('politie', 'politie');
INSERT INTO `tlds` (`id`, `value`) VALUES ('porn', 'porn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('post', 'post');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pr', 'pr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pramerica', 'pramerica');
INSERT INTO `tlds` (`id`, `value`) VALUES ('praxi', 'praxi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('press', 'press');
INSERT INTO `tlds` (`id`, `value`) VALUES ('prime', 'prime');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pro', 'pro');
INSERT INTO `tlds` (`id`, `value`) VALUES ('prod', 'prod');
INSERT INTO `tlds` (`id`, `value`) VALUES ('productions', 'productions');
INSERT INTO `tlds` (`id`, `value`) VALUES ('prof', 'prof');
INSERT INTO `tlds` (`id`, `value`) VALUES ('progressive', 'progressive');
INSERT INTO `tlds` (`id`, `value`) VALUES ('promo', 'promo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('properties', 'properties');
INSERT INTO `tlds` (`id`, `value`) VALUES ('property', 'property');
INSERT INTO `tlds` (`id`, `value`) VALUES ('protection', 'protection');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pru', 'pru');
INSERT INTO `tlds` (`id`, `value`) VALUES ('prudential', 'prudential');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ps', 'ps');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pt', 'pt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pub', 'pub');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pw', 'pw');
INSERT INTO `tlds` (`id`, `value`) VALUES ('pwc', 'pwc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('py', 'py');
INSERT INTO `tlds` (`id`, `value`) VALUES ('qa', 'qa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('qpon', 'qpon');
INSERT INTO `tlds` (`id`, `value`) VALUES ('quebec', 'quebec');
INSERT INTO `tlds` (`id`, `value`) VALUES ('quest', 'quest');
INSERT INTO `tlds` (`id`, `value`) VALUES ('qvc', 'qvc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('racing', 'racing');
INSERT INTO `tlds` (`id`, `value`) VALUES ('radio', 'radio');
INSERT INTO `tlds` (`id`, `value`) VALUES ('raid', 'raid');
INSERT INTO `tlds` (`id`, `value`) VALUES ('re', 're');
INSERT INTO `tlds` (`id`, `value`) VALUES ('read', 'read');
INSERT INTO `tlds` (`id`, `value`) VALUES ('realestate', 'realestate');
INSERT INTO `tlds` (`id`, `value`) VALUES ('realtor', 'realtor');
INSERT INTO `tlds` (`id`, `value`) VALUES ('realty', 'realty');
INSERT INTO `tlds` (`id`, `value`) VALUES ('recipes', 'recipes');
INSERT INTO `tlds` (`id`, `value`) VALUES ('red', 'red');
INSERT INTO `tlds` (`id`, `value`) VALUES ('redstone', 'redstone');
INSERT INTO `tlds` (`id`, `value`) VALUES ('redumbrella', 'redumbrella');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rehab', 'rehab');
INSERT INTO `tlds` (`id`, `value`) VALUES ('reise', 'reise');
INSERT INTO `tlds` (`id`, `value`) VALUES ('reisen', 'reisen');
INSERT INTO `tlds` (`id`, `value`) VALUES ('reit', 'reit');
INSERT INTO `tlds` (`id`, `value`) VALUES ('reliance', 'reliance');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ren', 'ren');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rent', 'rent');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rentals', 'rentals');
INSERT INTO `tlds` (`id`, `value`) VALUES ('repair', 'repair');
INSERT INTO `tlds` (`id`, `value`) VALUES ('report', 'report');
INSERT INTO `tlds` (`id`, `value`) VALUES ('republican', 'republican');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rest', 'rest');
INSERT INTO `tlds` (`id`, `value`) VALUES ('restaurant', 'restaurant');
INSERT INTO `tlds` (`id`, `value`) VALUES ('review', 'review');
INSERT INTO `tlds` (`id`, `value`) VALUES ('reviews', 'reviews');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rexroth', 'rexroth');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rich', 'rich');
INSERT INTO `tlds` (`id`, `value`) VALUES ('richardli', 'richardli');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ricoh', 'ricoh');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rightathome', 'rightathome');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ril', 'ril');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rio', 'rio');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rip', 'rip');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rmit', 'rmit');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ro', 'ro');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rocher', 'rocher');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rocks', 'rocks');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rodeo', 'rodeo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rogers', 'rogers');
INSERT INTO `tlds` (`id`, `value`) VALUES ('room', 'room');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rs', 'rs');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rsvp', 'rsvp');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ru', 'ru');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rugby', 'rugby');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ruhr', 'ruhr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('run', 'run');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rw', 'rw');
INSERT INTO `tlds` (`id`, `value`) VALUES ('rwe', 'rwe');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ryukyu', 'ryukyu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sa', 'sa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('saarland', 'saarland');
INSERT INTO `tlds` (`id`, `value`) VALUES ('safe', 'safe');
INSERT INTO `tlds` (`id`, `value`) VALUES ('safety', 'safety');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sakura', 'sakura');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sale', 'sale');
INSERT INTO `tlds` (`id`, `value`) VALUES ('salon', 'salon');
INSERT INTO `tlds` (`id`, `value`) VALUES ('samsclub', 'samsclub');
INSERT INTO `tlds` (`id`, `value`) VALUES ('samsung', 'samsung');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sandvik', 'sandvik');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sandvikcoromant', 'sandvikcoromant');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sanofi', 'sanofi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sap', 'sap');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sapo', 'sapo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sarl', 'sarl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sas', 'sas');
INSERT INTO `tlds` (`id`, `value`) VALUES ('save', 'save');
INSERT INTO `tlds` (`id`, `value`) VALUES ('saxo', 'saxo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sb', 'sb');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sbi', 'sbi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sbs', 'sbs');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sc', 'sc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sca', 'sca');
INSERT INTO `tlds` (`id`, `value`) VALUES ('scb', 'scb');
INSERT INTO `tlds` (`id`, `value`) VALUES ('schaeffler', 'schaeffler');
INSERT INTO `tlds` (`id`, `value`) VALUES ('schmidt', 'schmidt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('scholarships', 'scholarships');
INSERT INTO `tlds` (`id`, `value`) VALUES ('school', 'school');
INSERT INTO `tlds` (`id`, `value`) VALUES ('schule', 'schule');
INSERT INTO `tlds` (`id`, `value`) VALUES ('schwarz', 'schwarz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('science', 'science');
INSERT INTO `tlds` (`id`, `value`) VALUES ('scjohnson', 'scjohnson');
INSERT INTO `tlds` (`id`, `value`) VALUES ('scor', 'scor');
INSERT INTO `tlds` (`id`, `value`) VALUES ('scot', 'scot');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sd', 'sd');
INSERT INTO `tlds` (`id`, `value`) VALUES ('se', 'se');
INSERT INTO `tlds` (`id`, `value`) VALUES ('search', 'search');
INSERT INTO `tlds` (`id`, `value`) VALUES ('seat', 'seat');
INSERT INTO `tlds` (`id`, `value`) VALUES ('secure', 'secure');
INSERT INTO `tlds` (`id`, `value`) VALUES ('security', 'security');
INSERT INTO `tlds` (`id`, `value`) VALUES ('seek', 'seek');
INSERT INTO `tlds` (`id`, `value`) VALUES ('select', 'select');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sener', 'sener');
INSERT INTO `tlds` (`id`, `value`) VALUES ('services', 'services');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ses', 'ses');
INSERT INTO `tlds` (`id`, `value`) VALUES ('seven', 'seven');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sew', 'sew');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sex', 'sex');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sexy', 'sexy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sfr', 'sfr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sg', 'sg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sh', 'sh');
INSERT INTO `tlds` (`id`, `value`) VALUES ('shangrila', 'shangrila');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sharp', 'sharp');
INSERT INTO `tlds` (`id`, `value`) VALUES ('shaw', 'shaw');
INSERT INTO `tlds` (`id`, `value`) VALUES ('shell', 'shell');
INSERT INTO `tlds` (`id`, `value`) VALUES ('shia', 'shia');
INSERT INTO `tlds` (`id`, `value`) VALUES ('shiksha', 'shiksha');
INSERT INTO `tlds` (`id`, `value`) VALUES ('shoes', 'shoes');
INSERT INTO `tlds` (`id`, `value`) VALUES ('shop', 'shop');
INSERT INTO `tlds` (`id`, `value`) VALUES ('shopping', 'shopping');
INSERT INTO `tlds` (`id`, `value`) VALUES ('shouji', 'shouji');
INSERT INTO `tlds` (`id`, `value`) VALUES ('show', 'show');
INSERT INTO `tlds` (`id`, `value`) VALUES ('showtime', 'showtime');
INSERT INTO `tlds` (`id`, `value`) VALUES ('shriram', 'shriram');
INSERT INTO `tlds` (`id`, `value`) VALUES ('si', 'si');
INSERT INTO `tlds` (`id`, `value`) VALUES ('silk', 'silk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sina', 'sina');
INSERT INTO `tlds` (`id`, `value`) VALUES ('singles', 'singles');
INSERT INTO `tlds` (`id`, `value`) VALUES ('site', 'site');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sj', 'sj');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sk', 'sk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ski', 'ski');
INSERT INTO `tlds` (`id`, `value`) VALUES ('skin', 'skin');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sky', 'sky');
INSERT INTO `tlds` (`id`, `value`) VALUES ('skype', 'skype');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sl', 'sl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sling', 'sling');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sm', 'sm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('smart', 'smart');
INSERT INTO `tlds` (`id`, `value`) VALUES ('smile', 'smile');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sn', 'sn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sncf', 'sncf');
INSERT INTO `tlds` (`id`, `value`) VALUES ('so', 'so');
INSERT INTO `tlds` (`id`, `value`) VALUES ('soccer', 'soccer');
INSERT INTO `tlds` (`id`, `value`) VALUES ('social', 'social');
INSERT INTO `tlds` (`id`, `value`) VALUES ('softbank', 'softbank');
INSERT INTO `tlds` (`id`, `value`) VALUES ('software', 'software');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sohu', 'sohu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('solar', 'solar');
INSERT INTO `tlds` (`id`, `value`) VALUES ('solutions', 'solutions');
INSERT INTO `tlds` (`id`, `value`) VALUES ('song', 'song');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sony', 'sony');
INSERT INTO `tlds` (`id`, `value`) VALUES ('soy', 'soy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('space', 'space');
INSERT INTO `tlds` (`id`, `value`) VALUES ('spiegel', 'spiegel');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sport', 'sport');
INSERT INTO `tlds` (`id`, `value`) VALUES ('spot', 'spot');
INSERT INTO `tlds` (`id`, `value`) VALUES ('spreadbetting', 'spreadbetting');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sr', 'sr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('srl', 'srl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('srt', 'srt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('st', 'st');
INSERT INTO `tlds` (`id`, `value`) VALUES ('stada', 'stada');
INSERT INTO `tlds` (`id`, `value`) VALUES ('staples', 'staples');
INSERT INTO `tlds` (`id`, `value`) VALUES ('star', 'star');
INSERT INTO `tlds` (`id`, `value`) VALUES ('starhub', 'starhub');
INSERT INTO `tlds` (`id`, `value`) VALUES ('statebank', 'statebank');
INSERT INTO `tlds` (`id`, `value`) VALUES ('statefarm', 'statefarm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('statoil', 'statoil');
INSERT INTO `tlds` (`id`, `value`) VALUES ('stc', 'stc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('stcgroup', 'stcgroup');
INSERT INTO `tlds` (`id`, `value`) VALUES ('stockholm', 'stockholm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('storage', 'storage');
INSERT INTO `tlds` (`id`, `value`) VALUES ('store', 'store');
INSERT INTO `tlds` (`id`, `value`) VALUES ('stream', 'stream');
INSERT INTO `tlds` (`id`, `value`) VALUES ('studio', 'studio');
INSERT INTO `tlds` (`id`, `value`) VALUES ('study', 'study');
INSERT INTO `tlds` (`id`, `value`) VALUES ('style', 'style');
INSERT INTO `tlds` (`id`, `value`) VALUES ('su', 'su');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sucks', 'sucks');
INSERT INTO `tlds` (`id`, `value`) VALUES ('supplies', 'supplies');
INSERT INTO `tlds` (`id`, `value`) VALUES ('supply', 'supply');
INSERT INTO `tlds` (`id`, `value`) VALUES ('support', 'support');
INSERT INTO `tlds` (`id`, `value`) VALUES ('surf', 'surf');
INSERT INTO `tlds` (`id`, `value`) VALUES ('surgery', 'surgery');
INSERT INTO `tlds` (`id`, `value`) VALUES ('suzuki', 'suzuki');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sv', 'sv');
INSERT INTO `tlds` (`id`, `value`) VALUES ('swatch', 'swatch');
INSERT INTO `tlds` (`id`, `value`) VALUES ('swiftcover', 'swiftcover');
INSERT INTO `tlds` (`id`, `value`) VALUES ('swiss', 'swiss');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sx', 'sx');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sy', 'sy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sydney', 'sydney');
INSERT INTO `tlds` (`id`, `value`) VALUES ('symantec', 'symantec');
INSERT INTO `tlds` (`id`, `value`) VALUES ('systems', 'systems');
INSERT INTO `tlds` (`id`, `value`) VALUES ('sz', 'sz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tab', 'tab');
INSERT INTO `tlds` (`id`, `value`) VALUES ('taipei', 'taipei');
INSERT INTO `tlds` (`id`, `value`) VALUES ('talk', 'talk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('taobao', 'taobao');
INSERT INTO `tlds` (`id`, `value`) VALUES ('target', 'target');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tatamotors', 'tatamotors');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tatar', 'tatar');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tattoo', 'tattoo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tax', 'tax');
INSERT INTO `tlds` (`id`, `value`) VALUES ('taxi', 'taxi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tc', 'tc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tci', 'tci');
INSERT INTO `tlds` (`id`, `value`) VALUES ('td', 'td');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tdk', 'tdk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('team', 'team');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tech', 'tech');
INSERT INTO `tlds` (`id`, `value`) VALUES ('technology', 'technology');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tel', 'tel');
INSERT INTO `tlds` (`id`, `value`) VALUES ('telecity', 'telecity');
INSERT INTO `tlds` (`id`, `value`) VALUES ('telefonica', 'telefonica');
INSERT INTO `tlds` (`id`, `value`) VALUES ('temasek', 'temasek');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tennis', 'tennis');
INSERT INTO `tlds` (`id`, `value`) VALUES ('teva', 'teva');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tf', 'tf');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tg', 'tg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('th', 'th');
INSERT INTO `tlds` (`id`, `value`) VALUES ('thd', 'thd');
INSERT INTO `tlds` (`id`, `value`) VALUES ('theater', 'theater');
INSERT INTO `tlds` (`id`, `value`) VALUES ('theatre', 'theatre');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tiaa', 'tiaa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tickets', 'tickets');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tienda', 'tienda');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tiffany', 'tiffany');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tips', 'tips');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tires', 'tires');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tirol', 'tirol');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tj', 'tj');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tjmaxx', 'tjmaxx');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tjx', 'tjx');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tk', 'tk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tkmaxx', 'tkmaxx');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tl', 'tl');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tm', 'tm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tmall', 'tmall');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tn', 'tn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('to', 'to');
INSERT INTO `tlds` (`id`, `value`) VALUES ('today', 'today');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tokyo', 'tokyo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tools', 'tools');
INSERT INTO `tlds` (`id`, `value`) VALUES ('top', 'top');
INSERT INTO `tlds` (`id`, `value`) VALUES ('toray', 'toray');
INSERT INTO `tlds` (`id`, `value`) VALUES ('toshiba', 'toshiba');
INSERT INTO `tlds` (`id`, `value`) VALUES ('total', 'total');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tours', 'tours');
INSERT INTO `tlds` (`id`, `value`) VALUES ('town', 'town');
INSERT INTO `tlds` (`id`, `value`) VALUES ('toyota', 'toyota');
INSERT INTO `tlds` (`id`, `value`) VALUES ('toys', 'toys');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tr', 'tr');
INSERT INTO `tlds` (`id`, `value`) VALUES ('trade', 'trade');
INSERT INTO `tlds` (`id`, `value`) VALUES ('trading', 'trading');
INSERT INTO `tlds` (`id`, `value`) VALUES ('training', 'training');
INSERT INTO `tlds` (`id`, `value`) VALUES ('travel', 'travel');
INSERT INTO `tlds` (`id`, `value`) VALUES ('travelchannel', 'travelchannel');
INSERT INTO `tlds` (`id`, `value`) VALUES ('travelers', 'travelers');
INSERT INTO `tlds` (`id`, `value`) VALUES ('travelersinsurance', 'travelersinsurance');
INSERT INTO `tlds` (`id`, `value`) VALUES ('trust', 'trust');
INSERT INTO `tlds` (`id`, `value`) VALUES ('trv', 'trv');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tt', 'tt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tube', 'tube');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tui', 'tui');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tunes', 'tunes');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tushu', 'tushu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tv', 'tv');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tvs', 'tvs');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tw', 'tw');
INSERT INTO `tlds` (`id`, `value`) VALUES ('tz', 'tz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ua', 'ua');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ubank', 'ubank');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ubs', 'ubs');
INSERT INTO `tlds` (`id`, `value`) VALUES ('uconnect', 'uconnect');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ug', 'ug');
INSERT INTO `tlds` (`id`, `value`) VALUES ('uk', 'uk');
INSERT INTO `tlds` (`id`, `value`) VALUES ('unicom', 'unicom');
INSERT INTO `tlds` (`id`, `value`) VALUES ('university', 'university');
INSERT INTO `tlds` (`id`, `value`) VALUES ('uno', 'uno');
INSERT INTO `tlds` (`id`, `value`) VALUES ('uol', 'uol');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ups', 'ups');
INSERT INTO `tlds` (`id`, `value`) VALUES ('us', 'us');
INSERT INTO `tlds` (`id`, `value`) VALUES ('uy', 'uy');
INSERT INTO `tlds` (`id`, `value`) VALUES ('uz', 'uz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('va', 'va');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vacations', 'vacations');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vana', 'vana');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vanguard', 'vanguard');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vc', 'vc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ve', 've');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vegas', 'vegas');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ventures', 'ventures');
INSERT INTO `tlds` (`id`, `value`) VALUES ('verisign', 'verisign');
INSERT INTO `tlds` (`id`, `value`) VALUES ('versicherung', 'versicherung');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vet', 'vet');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vg', 'vg');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vi', 'vi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('viajes', 'viajes');
INSERT INTO `tlds` (`id`, `value`) VALUES ('video', 'video');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vig', 'vig');
INSERT INTO `tlds` (`id`, `value`) VALUES ('viking', 'viking');
INSERT INTO `tlds` (`id`, `value`) VALUES ('villas', 'villas');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vin', 'vin');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vip', 'vip');
INSERT INTO `tlds` (`id`, `value`) VALUES ('virgin', 'virgin');
INSERT INTO `tlds` (`id`, `value`) VALUES ('visa', 'visa');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vision', 'vision');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vista', 'vista');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vistaprint', 'vistaprint');
INSERT INTO `tlds` (`id`, `value`) VALUES ('viva', 'viva');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vivo', 'vivo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vlaanderen', 'vlaanderen');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vn', 'vn');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vodka', 'vodka');
INSERT INTO `tlds` (`id`, `value`) VALUES ('volkswagen', 'volkswagen');
INSERT INTO `tlds` (`id`, `value`) VALUES ('volvo', 'volvo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vote', 'vote');
INSERT INTO `tlds` (`id`, `value`) VALUES ('voting', 'voting');
INSERT INTO `tlds` (`id`, `value`) VALUES ('voto', 'voto');
INSERT INTO `tlds` (`id`, `value`) VALUES ('voyage', 'voyage');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vu', 'vu');
INSERT INTO `tlds` (`id`, `value`) VALUES ('vuelos', 'vuelos');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wales', 'wales');
INSERT INTO `tlds` (`id`, `value`) VALUES ('walmart', 'walmart');
INSERT INTO `tlds` (`id`, `value`) VALUES ('walter', 'walter');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wang', 'wang');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wanggou', 'wanggou');
INSERT INTO `tlds` (`id`, `value`) VALUES ('warman', 'warman');
INSERT INTO `tlds` (`id`, `value`) VALUES ('watch', 'watch');
INSERT INTO `tlds` (`id`, `value`) VALUES ('watches', 'watches');
INSERT INTO `tlds` (`id`, `value`) VALUES ('weather', 'weather');
INSERT INTO `tlds` (`id`, `value`) VALUES ('weatherchannel', 'weatherchannel');
INSERT INTO `tlds` (`id`, `value`) VALUES ('webcam', 'webcam');
INSERT INTO `tlds` (`id`, `value`) VALUES ('weber', 'weber');
INSERT INTO `tlds` (`id`, `value`) VALUES ('website', 'website');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wed', 'wed');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wedding', 'wedding');
INSERT INTO `tlds` (`id`, `value`) VALUES ('weibo', 'weibo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('weir', 'weir');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wf', 'wf');
INSERT INTO `tlds` (`id`, `value`) VALUES ('whoswho', 'whoswho');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wien', 'wien');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wiki', 'wiki');
INSERT INTO `tlds` (`id`, `value`) VALUES ('williamhill', 'williamhill');
INSERT INTO `tlds` (`id`, `value`) VALUES ('win', 'win');
INSERT INTO `tlds` (`id`, `value`) VALUES ('windows', 'windows');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wine', 'wine');
INSERT INTO `tlds` (`id`, `value`) VALUES ('winners', 'winners');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wme', 'wme');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wolterskluwer', 'wolterskluwer');
INSERT INTO `tlds` (`id`, `value`) VALUES ('woodside', 'woodside');
INSERT INTO `tlds` (`id`, `value`) VALUES ('work', 'work');
INSERT INTO `tlds` (`id`, `value`) VALUES ('works', 'works');
INSERT INTO `tlds` (`id`, `value`) VALUES ('world', 'world');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wow', 'wow');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ws', 'ws');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wtc', 'wtc');
INSERT INTO `tlds` (`id`, `value`) VALUES ('wtf', 'wtf');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xbox', 'xbox');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xerox', 'xerox');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xfinity', 'xfinity');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xihuan', 'xihuan');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xin', 'xin');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--11b4c3d', 'कॉम');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--1ck2e1b', 'セール');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--1qqw23a', '佛山');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--2scrj9c', 'ಭಾರತ');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--30rr7y', '慈善');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--3bst00m', '集团');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--3ds443g', '在线');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--3e0b707e', '한국');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--3hcrj9c', 'ଭାରତ');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--3oq18vl8pn36a', '大众汽车');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--3pxu8k', '点看');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--42c2d9a', 'คอม');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--45br5cyl', 'ভাৰত');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--45brj9c', 'ভারত');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--45q11c', '八卦');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--4gbrim', 'موقع');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--54b7fta0cc', 'বাংলা');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--55qw42g', '公益');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--55qx5d', '公司');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--5su34j936bgsg', '香格里拉');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--5tzm5g', '网站');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--6frz82g', '移动');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--6qq986b3xl', '我爱你');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--80adxhks', 'москва');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--80ao21a', 'қаз');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--80aqecdr1a', 'католик');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--80asehdb', 'онлайн');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--80aswg', 'сайт');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--8y0a063a', '联通');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--90a3ac', 'срб');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--90ae', 'бг');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--90ais', 'бел');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--9dbq2a', 'קום');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--9et52u', '时尚');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--9krt00a', '微博');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--b4w605ferd', '淡马锡');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--bck1b9a5dre4c', 'ファッション');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--c1avg', 'орг');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--c2br7g', 'नेट');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--cck2b3b', 'ストア');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--cg4bki', '삼성');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--clchc0ea0b2g2a9gcd', 'சிங்கப்பூர்');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--czr694b', '商标');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--czrs0t', '商店');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--czru2d', '商城');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--d1acj3b', 'дети');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--d1alf', 'мкд');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--e1a4c', 'ею');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--eckvdtc9d', 'ポイント');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--efvy88h', '新闻');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--estv75g', '工行');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--fct429k', '家電');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--fhbei', 'كوم');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--fiq228c5hs', '中文网');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--fiq64b', '中信');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--fiqs8s', '中国');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--fiqz9s', '中國');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--fjq720a', '娱乐');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--flw351e', '谷歌');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--fpcrj9c3d', 'భారత్');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--fzc2c9e2c', 'ලංකා');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--fzys8d69uvgm', '電訊盈科');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--g2xx48c', '购物');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--gckr3f0f', 'クラウド');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--gecrj9c', 'ભારત');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--gk3at1e', '通販');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--h2breg3eve', 'भारतम्');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--h2brj9c', 'भारत');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--h2brj9c8c', 'भारोत');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--hxt814e', '网店');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--i1b6b1a6a2e', 'संगठन');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--imr513n', '餐厅');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--io0a7i', '网络');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--j1aef', 'ком');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--j1amh', 'укр');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--j6w193g', '香港');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--jlq61u9w7b', '诺基亚');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--jvr189m', '食品');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--kcrx77d1x4a', '飞利浦');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--kprw13d', '台湾');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--kpry57d', '台灣');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--kpu716f', '手表');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--kput3i', '手机');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--l1acc', 'мон');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--lgbbat1ad8j', 'الجزائر');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgb9awbf', 'عمان');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgba3a3ejt', 'ارامكو');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgba3a4f16a', 'ایران');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgba7c0bbn0a', 'العليان');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbaakc7dvf', 'اتصالات');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbaam7a8h', 'امارات');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbab2bd', 'بازار');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbai9azgqp6j', 'پاکستان');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbayh7gpa', 'الاردن');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbb9fbpob', 'موبايلي');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbbh1a', 'بارت');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbbh1a71e', 'بھارت');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbc0a9azcg', 'المغرب');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbca7dzdo', 'ابوظبي');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgberp4a5d4ar', 'السعودية');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbgu82a', 'ڀارت');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbi4ecexp', 'كاثوليك');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbpl2fh', 'سودان');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbt3dhd', 'همراه');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbtx2b', 'عراق');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mgbx4cd0ab', 'مليسيا');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mix891f', '澳門');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mk1bu44c', '닷컴');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--mxtq1m', '政府');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--ngbc5azd', 'شبكة');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--ngbe9e0a', 'بيتك');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--ngbrx', 'عرب');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--node', 'გე');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--nqv7f', '机构');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--nqv7fs00ema', '组织机构');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--nyqy26a', '健康');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--o3cw4h', 'ไทย');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--ogbpf8fl', 'سورية');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--otu796d', '招聘');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--p1acf', 'рус');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--p1ai', 'рф');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--pbt977c', '珠宝');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--pgbs0dh', 'تونس');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--pssy2u', '大拿');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--q9jyb4c', 'みんな');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--qcka1pmc', 'グーグル');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--qxam', 'ελ');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--rhqv96g', '世界');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--rovu88b', '書籍');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--rvc1e0am3e', 'ഭാരതം');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--s9brj9c', 'ਭਾਰਤ');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--ses554g', '网址');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--t60b56a', '닷넷');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--tckwe', 'コム');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--tiq49xqyj', '天主教');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--unup4y', '游戏');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--vermgensberater-ctb', 'vermögensberater');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--vermgensberatung-pwb', 'vermögensberatung');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--vhquv', '企业');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--vuq861b', '信息');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--w4r85el8fhu5dnra', '嘉里大酒店');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--w4rs40l', '嘉里');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--wgbh1c', 'مصر');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--wgbl6a', 'قطر');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--xhq521b', '广东');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--xkc2al3hye2a', 'இலங்கை');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--xkc2dl3a5ee0h', 'இந்தியா');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--y9a3aq', 'հայ');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--yfro4i67o', '新加坡');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--ygbi2ammx', 'فلسطين');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xn--zfr164b', '政务');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xperia', 'xperia');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xxx', 'xxx');
INSERT INTO `tlds` (`id`, `value`) VALUES ('xyz', 'xyz');
INSERT INTO `tlds` (`id`, `value`) VALUES ('yachts', 'yachts');
INSERT INTO `tlds` (`id`, `value`) VALUES ('yahoo', 'yahoo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('yamaxun', 'yamaxun');
INSERT INTO `tlds` (`id`, `value`) VALUES ('yandex', 'yandex');
INSERT INTO `tlds` (`id`, `value`) VALUES ('ye', 'ye');
INSERT INTO `tlds` (`id`, `value`) VALUES ('yodobashi', 'yodobashi');
INSERT INTO `tlds` (`id`, `value`) VALUES ('yoga', 'yoga');
INSERT INTO `tlds` (`id`, `value`) VALUES ('yokohama', 'yokohama');
INSERT INTO `tlds` (`id`, `value`) VALUES ('you', 'you');
INSERT INTO `tlds` (`id`, `value`) VALUES ('youtube', 'youtube');
INSERT INTO `tlds` (`id`, `value`) VALUES ('yt', 'yt');
INSERT INTO `tlds` (`id`, `value`) VALUES ('yun', 'yun');
INSERT INTO `tlds` (`id`, `value`) VALUES ('za', 'za');
INSERT INTO `tlds` (`id`, `value`) VALUES ('zappos', 'zappos');
INSERT INTO `tlds` (`id`, `value`) VALUES ('zara', 'zara');
INSERT INTO `tlds` (`id`, `value`) VALUES ('zero', 'zero');
INSERT INTO `tlds` (`id`, `value`) VALUES ('zip', 'zip');
INSERT INTO `tlds` (`id`, `value`) VALUES ('zippo', 'zippo');
INSERT INTO `tlds` (`id`, `value`) VALUES ('zm', 'zm');
INSERT INTO `tlds` (`id`, `value`) VALUES ('zone', 'zone');
INSERT INTO `tlds` (`id`, `value`) VALUES ('zuerich', 'zuerich');
INSERT INTO `tlds` (`id`, `value`) VALUES ('zw', 'zw');
