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

DROP TABLE IF EXISTS `top_domains`;
CREATE TABLE top_domains (id VARCHAR(64) NOT NULL, value VARCHAR(64) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;

INSERT INTO `top_domains` (`id`, `value`) VALUES ('aaa', 'aaa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('aarp', 'aarp');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('abarth', 'abarth');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('abb', 'abb');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('abbott', 'abbott');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('abbvie', 'abbvie');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('abc', 'abc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('able', 'able');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('abogado', 'abogado');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('abudhabi', 'abudhabi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ac', 'ac');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('academy', 'academy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('accenture', 'accenture');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('accountant', 'accountant');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('accountants', 'accountants');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('aco', 'aco');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('active', 'active');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('actor', 'actor');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ad', 'ad');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('adac', 'adac');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ads', 'ads');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('adult', 'adult');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ae', 'ae');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('aeg', 'aeg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('aero', 'aero');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('aetna', 'aetna');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('af', 'af');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('afamilycompany', 'afamilycompany');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('afl', 'afl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('africa', 'africa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ag', 'ag');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('agakhan', 'agakhan');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('agency', 'agency');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ai', 'ai');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('aig', 'aig');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('aigo', 'aigo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('airbus', 'airbus');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('airforce', 'airforce');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('airtel', 'airtel');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('akdn', 'akdn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('al', 'al');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('alfaromeo', 'alfaromeo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('alibaba', 'alibaba');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('alipay', 'alipay');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('allfinanz', 'allfinanz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('allstate', 'allstate');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ally', 'ally');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('alsace', 'alsace');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('alstom', 'alstom');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('am', 'am');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('americanexpress', 'americanexpress');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('americanfamily', 'americanfamily');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('amex', 'amex');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('amfam', 'amfam');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('amica', 'amica');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('amsterdam', 'amsterdam');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('analytics', 'analytics');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('android', 'android');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('anquan', 'anquan');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('anz', 'anz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ao', 'ao');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('aol', 'aol');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('apartments', 'apartments');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('app', 'app');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('apple', 'apple');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('aq', 'aq');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('aquarelle', 'aquarelle');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ar', 'ar');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('arab', 'arab');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('aramco', 'aramco');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('archi', 'archi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('army', 'army');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('arpa', 'arpa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('art', 'art');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('arte', 'arte');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('as', 'as');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('asda', 'asda');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('asia', 'asia');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('associates', 'associates');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('at', 'at');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('athleta', 'athleta');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('attorney', 'attorney');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('au', 'au');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('auction', 'auction');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('audi', 'audi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('audible', 'audible');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('audio', 'audio');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('auspost', 'auspost');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('author', 'author');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('auto', 'auto');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('autos', 'autos');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('avianca', 'avianca');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('aw', 'aw');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('aws', 'aws');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ax', 'ax');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('axa', 'axa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('az', 'az');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('azure', 'azure');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ba', 'ba');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('baby', 'baby');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('baidu', 'baidu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('banamex', 'banamex');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bananarepublic', 'bananarepublic');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('band', 'band');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bank', 'bank');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bar', 'bar');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('barcelona', 'barcelona');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('barclaycard', 'barclaycard');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('barclays', 'barclays');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('barefoot', 'barefoot');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bargains', 'bargains');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('baseball', 'baseball');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('basketball', 'basketball');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bauhaus', 'bauhaus');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bayern', 'bayern');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bb', 'bb');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bbc', 'bbc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bbt', 'bbt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bbva', 'bbva');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bcg', 'bcg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bcn', 'bcn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bd', 'bd');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('be', 'be');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('beats', 'beats');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('beauty', 'beauty');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('beer', 'beer');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bentley', 'bentley');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('berlin', 'berlin');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('best', 'best');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bestbuy', 'bestbuy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bet', 'bet');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bf', 'bf');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bg', 'bg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bh', 'bh');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bharti', 'bharti');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bi', 'bi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bible', 'bible');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bid', 'bid');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bike', 'bike');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bing', 'bing');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bingo', 'bingo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bio', 'bio');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('biz', 'biz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bj', 'bj');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('black', 'black');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('blackfriday', 'blackfriday');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('blanco', 'blanco');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('blockbuster', 'blockbuster');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('blog', 'blog');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bloomberg', 'bloomberg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('blue', 'blue');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bm', 'bm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bms', 'bms');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bmw', 'bmw');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bn', 'bn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bnl', 'bnl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bnpparibas', 'bnpparibas');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bo', 'bo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('boats', 'boats');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('boehringer', 'boehringer');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bofa', 'bofa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bom', 'bom');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bond', 'bond');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('boo', 'boo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('book', 'book');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('booking', 'booking');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bosch', 'bosch');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bostik', 'bostik');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('boston', 'boston');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bot', 'bot');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('boutique', 'boutique');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('box', 'box');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('br', 'br');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bradesco', 'bradesco');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bridgestone', 'bridgestone');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('broadway', 'broadway');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('broker', 'broker');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('brother', 'brother');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('brussels', 'brussels');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bs', 'bs');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bt', 'bt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('budapest', 'budapest');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bugatti', 'bugatti');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('build', 'build');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('builders', 'builders');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('business', 'business');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('buy', 'buy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('buzz', 'buzz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bv', 'bv');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bw', 'bw');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('by', 'by');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bz', 'bz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('bzh', 'bzh');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ca', 'ca');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cab', 'cab');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cafe', 'cafe');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cal', 'cal');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('call', 'call');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('calvinklein', 'calvinklein');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cam', 'cam');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('camera', 'camera');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('camp', 'camp');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cancerresearch', 'cancerresearch');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('canon', 'canon');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('capetown', 'capetown');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('capital', 'capital');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('capitalone', 'capitalone');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('car', 'car');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('caravan', 'caravan');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cards', 'cards');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('care', 'care');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('career', 'career');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('careers', 'careers');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cars', 'cars');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cartier', 'cartier');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('casa', 'casa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('case', 'case');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('caseih', 'caseih');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cash', 'cash');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('casino', 'casino');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cat', 'cat');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('catering', 'catering');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('catholic', 'catholic');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cba', 'cba');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cbn', 'cbn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cbre', 'cbre');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cbs', 'cbs');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cc', 'cc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cd', 'cd');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ceb', 'ceb');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('center', 'center');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ceo', 'ceo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cern', 'cern');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cf', 'cf');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cfa', 'cfa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cfd', 'cfd');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cg', 'cg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ch', 'ch');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('chanel', 'chanel');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('channel', 'channel');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('chase', 'chase');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('chat', 'chat');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cheap', 'cheap');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('chintai', 'chintai');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('christmas', 'christmas');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('chrome', 'chrome');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('chrysler', 'chrysler');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('church', 'church');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ci', 'ci');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cipriani', 'cipriani');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('circle', 'circle');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cisco', 'cisco');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('citadel', 'citadel');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('citi', 'citi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('citic', 'citic');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('city', 'city');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cityeats', 'cityeats');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ck', 'ck');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cl', 'cl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('claims', 'claims');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cleaning', 'cleaning');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('click', 'click');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('clinic', 'clinic');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('clinique', 'clinique');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('clothing', 'clothing');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cloud', 'cloud');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('club', 'club');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('clubmed', 'clubmed');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cm', 'cm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cn', 'cn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('co', 'co');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('coach', 'coach');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('codes', 'codes');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('coffee', 'coffee');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('college', 'college');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cologne', 'cologne');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('com', 'com');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('comcast', 'comcast');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('commbank', 'commbank');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('community', 'community');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('company', 'company');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('compare', 'compare');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('computer', 'computer');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('comsec', 'comsec');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('condos', 'condos');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('construction', 'construction');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('consulting', 'consulting');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('contact', 'contact');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('contractors', 'contractors');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cooking', 'cooking');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cookingchannel', 'cookingchannel');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cool', 'cool');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('coop', 'coop');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('corsica', 'corsica');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('country', 'country');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('coupon', 'coupon');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('coupons', 'coupons');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('courses', 'courses');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cr', 'cr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('credit', 'credit');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('creditcard', 'creditcard');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('creditunion', 'creditunion');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cricket', 'cricket');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('crown', 'crown');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('crs', 'crs');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cruise', 'cruise');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cruises', 'cruises');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('csc', 'csc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cu', 'cu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cuisinella', 'cuisinella');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cv', 'cv');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cw', 'cw');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cx', 'cx');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cy', 'cy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cymru', 'cymru');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cyou', 'cyou');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('cz', 'cz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dabur', 'dabur');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dad', 'dad');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dance', 'dance');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('data', 'data');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('date', 'date');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dating', 'dating');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('datsun', 'datsun');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('day', 'day');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dclk', 'dclk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dds', 'dds');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('de', 'de');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('deal', 'deal');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dealer', 'dealer');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('deals', 'deals');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('degree', 'degree');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('delivery', 'delivery');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dell', 'dell');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('deloitte', 'deloitte');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('delta', 'delta');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('democrat', 'democrat');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dental', 'dental');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dentist', 'dentist');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('desi', 'desi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('design', 'design');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dev', 'dev');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dhl', 'dhl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('diamonds', 'diamonds');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('diet', 'diet');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('digital', 'digital');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('direct', 'direct');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('directory', 'directory');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('discount', 'discount');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('discover', 'discover');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dish', 'dish');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('diy', 'diy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dj', 'dj');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dk', 'dk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dm', 'dm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dnp', 'dnp');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('do', 'do');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('docs', 'docs');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('doctor', 'doctor');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dodge', 'dodge');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dog', 'dog');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('doha', 'doha');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('domains', 'domains');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dot', 'dot');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('download', 'download');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('drive', 'drive');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dtv', 'dtv');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dubai', 'dubai');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('duck', 'duck');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dunlop', 'dunlop');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('duns', 'duns');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dupont', 'dupont');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('durban', 'durban');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dvag', 'dvag');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dvr', 'dvr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('dz', 'dz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('earth', 'earth');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('eat', 'eat');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ec', 'ec');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('eco', 'eco');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('edeka', 'edeka');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('edu', 'edu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('education', 'education');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ee', 'ee');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('eg', 'eg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('email', 'email');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('emerck', 'emerck');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('energy', 'energy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('engineer', 'engineer');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('engineering', 'engineering');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('enterprises', 'enterprises');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('epost', 'epost');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('epson', 'epson');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('equipment', 'equipment');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('er', 'er');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ericsson', 'ericsson');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('erni', 'erni');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('es', 'es');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('esq', 'esq');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('estate', 'estate');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('esurance', 'esurance');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('et', 'et');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('etisalat', 'etisalat');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('eu', 'eu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('eurovision', 'eurovision');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('eus', 'eus');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('events', 'events');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('everbank', 'everbank');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('exchange', 'exchange');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('expert', 'expert');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('exposed', 'exposed');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('express', 'express');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('extraspace', 'extraspace');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fage', 'fage');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fail', 'fail');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fairwinds', 'fairwinds');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('faith', 'faith');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('family', 'family');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fan', 'fan');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fans', 'fans');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('farm', 'farm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('farmers', 'farmers');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fashion', 'fashion');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fast', 'fast');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fedex', 'fedex');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('feedback', 'feedback');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ferrari', 'ferrari');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ferrero', 'ferrero');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fi', 'fi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fiat', 'fiat');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fidelity', 'fidelity');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fido', 'fido');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('film', 'film');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('final', 'final');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('finance', 'finance');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('financial', 'financial');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fire', 'fire');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('firestone', 'firestone');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('firmdale', 'firmdale');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fish', 'fish');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fishing', 'fishing');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fit', 'fit');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fitness', 'fitness');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fj', 'fj');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fk', 'fk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('flickr', 'flickr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('flights', 'flights');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('flir', 'flir');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('florist', 'florist');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('flowers', 'flowers');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fly', 'fly');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fm', 'fm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fo', 'fo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('foo', 'foo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('food', 'food');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('foodnetwork', 'foodnetwork');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('football', 'football');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ford', 'ford');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('forex', 'forex');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('forsale', 'forsale');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('forum', 'forum');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('foundation', 'foundation');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fox', 'fox');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fr', 'fr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('free', 'free');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fresenius', 'fresenius');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('frl', 'frl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('frogans', 'frogans');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('frontdoor', 'frontdoor');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('frontier', 'frontier');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ftr', 'ftr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fujitsu', 'fujitsu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fujixerox', 'fujixerox');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fun', 'fun');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fund', 'fund');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('furniture', 'furniture');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('futbol', 'futbol');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('fyi', 'fyi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ga', 'ga');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gal', 'gal');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gallery', 'gallery');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gallo', 'gallo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gallup', 'gallup');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('game', 'game');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('games', 'games');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gap', 'gap');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('garden', 'garden');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gb', 'gb');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gbiz', 'gbiz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gd', 'gd');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gdn', 'gdn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ge', 'ge');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gea', 'gea');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gent', 'gent');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('genting', 'genting');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('george', 'george');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gf', 'gf');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gg', 'gg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ggee', 'ggee');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gh', 'gh');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gi', 'gi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gift', 'gift');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gifts', 'gifts');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gives', 'gives');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('giving', 'giving');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gl', 'gl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('glade', 'glade');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('glass', 'glass');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gle', 'gle');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('global', 'global');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('globo', 'globo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gm', 'gm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gmail', 'gmail');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gmbh', 'gmbh');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gmo', 'gmo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gmx', 'gmx');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gn', 'gn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('godaddy', 'godaddy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gold', 'gold');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('goldpoint', 'goldpoint');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('golf', 'golf');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('goo', 'goo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('goodhands', 'goodhands');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('goodyear', 'goodyear');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('goog', 'goog');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('google', 'google');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gop', 'gop');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('got', 'got');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gov', 'gov');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gp', 'gp');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gq', 'gq');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gr', 'gr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('grainger', 'grainger');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('graphics', 'graphics');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gratis', 'gratis');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('green', 'green');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gripe', 'gripe');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('grocery', 'grocery');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('group', 'group');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gs', 'gs');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gt', 'gt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gu', 'gu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('guardian', 'guardian');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gucci', 'gucci');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('guge', 'guge');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('guide', 'guide');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('guitars', 'guitars');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('guru', 'guru');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gw', 'gw');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('gy', 'gy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hair', 'hair');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hamburg', 'hamburg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hangout', 'hangout');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('haus', 'haus');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hbo', 'hbo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hdfc', 'hdfc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hdfcbank', 'hdfcbank');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('health', 'health');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('healthcare', 'healthcare');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('help', 'help');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('helsinki', 'helsinki');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('here', 'here');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hermes', 'hermes');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hgtv', 'hgtv');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hiphop', 'hiphop');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hisamitsu', 'hisamitsu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hitachi', 'hitachi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hiv', 'hiv');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hk', 'hk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hkt', 'hkt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hm', 'hm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hn', 'hn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hockey', 'hockey');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('holdings', 'holdings');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('holiday', 'holiday');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('homedepot', 'homedepot');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('homegoods', 'homegoods');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('homes', 'homes');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('homesense', 'homesense');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('honda', 'honda');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('honeywell', 'honeywell');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('horse', 'horse');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hospital', 'hospital');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('host', 'host');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hosting', 'hosting');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hot', 'hot');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hoteles', 'hoteles');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hotels', 'hotels');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hotmail', 'hotmail');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('house', 'house');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('how', 'how');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hr', 'hr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hsbc', 'hsbc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ht', 'ht');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hu', 'hu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hughes', 'hughes');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hyatt', 'hyatt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('hyundai', 'hyundai');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ibm', 'ibm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('icbc', 'icbc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ice', 'ice');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('icu', 'icu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('id', 'id');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ie', 'ie');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ieee', 'ieee');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ifm', 'ifm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ikano', 'ikano');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('il', 'il');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('im', 'im');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('imamat', 'imamat');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('imdb', 'imdb');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('immo', 'immo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('immobilien', 'immobilien');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('in', 'in');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('industries', 'industries');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('infiniti', 'infiniti');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('info', 'info');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ing', 'ing');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ink', 'ink');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('institute', 'institute');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('insurance', 'insurance');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('insure', 'insure');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('int', 'int');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('intel', 'intel');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('international', 'international');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('intuit', 'intuit');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('investments', 'investments');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('io', 'io');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ipiranga', 'ipiranga');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('iq', 'iq');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ir', 'ir');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('irish', 'irish');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('is', 'is');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('iselect', 'iselect');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ismaili', 'ismaili');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ist', 'ist');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('istanbul', 'istanbul');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('it', 'it');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('itau', 'itau');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('itv', 'itv');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('iveco', 'iveco');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('iwc', 'iwc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jaguar', 'jaguar');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('java', 'java');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jcb', 'jcb');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jcp', 'jcp');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('je', 'je');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jeep', 'jeep');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jetzt', 'jetzt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jewelry', 'jewelry');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jio', 'jio');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jlc', 'jlc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jll', 'jll');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jm', 'jm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jmp', 'jmp');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jnj', 'jnj');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jo', 'jo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jobs', 'jobs');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('joburg', 'joburg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jot', 'jot');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('joy', 'joy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jp', 'jp');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jpmorgan', 'jpmorgan');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('jprs', 'jprs');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('juegos', 'juegos');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('juniper', 'juniper');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kaufen', 'kaufen');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kddi', 'kddi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ke', 'ke');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kerryhotels', 'kerryhotels');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kerrylogistics', 'kerrylogistics');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kerryproperties', 'kerryproperties');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kfh', 'kfh');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kg', 'kg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kh', 'kh');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ki', 'ki');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kia', 'kia');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kim', 'kim');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kinder', 'kinder');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kindle', 'kindle');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kitchen', 'kitchen');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kiwi', 'kiwi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('km', 'km');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kn', 'kn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('koeln', 'koeln');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('komatsu', 'komatsu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kosher', 'kosher');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kp', 'kp');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kpmg', 'kpmg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kpn', 'kpn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kr', 'kr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('krd', 'krd');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kred', 'kred');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kuokgroup', 'kuokgroup');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kw', 'kw');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ky', 'ky');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kyoto', 'kyoto');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('kz', 'kz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('la', 'la');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lacaixa', 'lacaixa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ladbrokes', 'ladbrokes');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lamborghini', 'lamborghini');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lamer', 'lamer');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lancaster', 'lancaster');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lancia', 'lancia');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lancome', 'lancome');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('land', 'land');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('landrover', 'landrover');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lanxess', 'lanxess');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lasalle', 'lasalle');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lat', 'lat');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('latino', 'latino');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('latrobe', 'latrobe');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('law', 'law');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lawyer', 'lawyer');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lb', 'lb');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lc', 'lc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lds', 'lds');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lease', 'lease');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('leclerc', 'leclerc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lefrak', 'lefrak');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('legal', 'legal');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lego', 'lego');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lexus', 'lexus');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lgbt', 'lgbt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('li', 'li');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('liaison', 'liaison');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lidl', 'lidl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('life', 'life');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lifeinsurance', 'lifeinsurance');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lifestyle', 'lifestyle');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lighting', 'lighting');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('like', 'like');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lilly', 'lilly');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('limited', 'limited');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('limo', 'limo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lincoln', 'lincoln');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('linde', 'linde');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('link', 'link');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lipsy', 'lipsy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('live', 'live');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('living', 'living');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lixil', 'lixil');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lk', 'lk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('llc', 'llc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('loan', 'loan');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('loans', 'loans');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('locker', 'locker');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('locus', 'locus');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('loft', 'loft');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lol', 'lol');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('london', 'london');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lotte', 'lotte');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lotto', 'lotto');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('love', 'love');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lpl', 'lpl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lplfinancial', 'lplfinancial');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lr', 'lr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ls', 'ls');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lt', 'lt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ltd', 'ltd');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ltda', 'ltda');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lu', 'lu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lundbeck', 'lundbeck');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lupin', 'lupin');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('luxe', 'luxe');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('luxury', 'luxury');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('lv', 'lv');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ly', 'ly');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ma', 'ma');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('macys', 'macys');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('madrid', 'madrid');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('maif', 'maif');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('maison', 'maison');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('makeup', 'makeup');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('man', 'man');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('management', 'management');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mango', 'mango');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('map', 'map');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('market', 'market');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('marketing', 'marketing');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('markets', 'markets');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('marriott', 'marriott');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('marshalls', 'marshalls');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('maserati', 'maserati');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mattel', 'mattel');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mba', 'mba');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mc', 'mc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mckinsey', 'mckinsey');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('md', 'md');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('me', 'me');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('med', 'med');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('media', 'media');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('meet', 'meet');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('melbourne', 'melbourne');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('meme', 'meme');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('memorial', 'memorial');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('men', 'men');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('menu', 'menu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('meo', 'meo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('merckmsd', 'merckmsd');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('metlife', 'metlife');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mg', 'mg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mh', 'mh');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('miami', 'miami');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('microsoft', 'microsoft');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mil', 'mil');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mini', 'mini');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mint', 'mint');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mit', 'mit');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mitsubishi', 'mitsubishi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mk', 'mk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ml', 'ml');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mlb', 'mlb');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mls', 'mls');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mm', 'mm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mma', 'mma');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mn', 'mn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mo', 'mo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mobi', 'mobi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mobile', 'mobile');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mobily', 'mobily');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('moda', 'moda');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('moe', 'moe');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('moi', 'moi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mom', 'mom');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('monash', 'monash');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('money', 'money');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('monster', 'monster');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mopar', 'mopar');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mormon', 'mormon');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mortgage', 'mortgage');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('moscow', 'moscow');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('moto', 'moto');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('motorcycles', 'motorcycles');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mov', 'mov');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('movie', 'movie');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('movistar', 'movistar');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mp', 'mp');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mq', 'mq');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mr', 'mr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ms', 'ms');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('msd', 'msd');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mt', 'mt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mtn', 'mtn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mtr', 'mtr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mu', 'mu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('museum', 'museum');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mutual', 'mutual');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mv', 'mv');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mw', 'mw');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mx', 'mx');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('my', 'my');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('mz', 'mz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('na', 'na');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nab', 'nab');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nadex', 'nadex');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nagoya', 'nagoya');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('name', 'name');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nationwide', 'nationwide');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('natura', 'natura');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('navy', 'navy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nba', 'nba');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nc', 'nc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ne', 'ne');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nec', 'nec');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('net', 'net');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('netbank', 'netbank');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('netflix', 'netflix');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('network', 'network');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('neustar', 'neustar');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('new', 'new');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('newholland', 'newholland');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('news', 'news');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('next', 'next');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nextdirect', 'nextdirect');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nexus', 'nexus');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nf', 'nf');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nfl', 'nfl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ng', 'ng');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ngo', 'ngo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nhk', 'nhk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ni', 'ni');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nico', 'nico');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nike', 'nike');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nikon', 'nikon');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ninja', 'ninja');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nissan', 'nissan');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nissay', 'nissay');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nl', 'nl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('no', 'no');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nokia', 'nokia');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('northwesternmutual', 'northwesternmutual');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('norton', 'norton');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('now', 'now');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nowruz', 'nowruz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nowtv', 'nowtv');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('np', 'np');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nr', 'nr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nra', 'nra');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nrw', 'nrw');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ntt', 'ntt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nu', 'nu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nyc', 'nyc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('nz', 'nz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('obi', 'obi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('observer', 'observer');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('off', 'off');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('office', 'office');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('okinawa', 'okinawa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('olayan', 'olayan');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('olayangroup', 'olayangroup');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('oldnavy', 'oldnavy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ollo', 'ollo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('om', 'om');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('omega', 'omega');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('one', 'one');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ong', 'ong');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('onl', 'onl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('online', 'online');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('onyourside', 'onyourside');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ooo', 'ooo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('open', 'open');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('oracle', 'oracle');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('orange', 'orange');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('org', 'org');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('organic', 'organic');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('origins', 'origins');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('osaka', 'osaka');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('otsuka', 'otsuka');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ott', 'ott');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ovh', 'ovh');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pa', 'pa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('page', 'page');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('panasonic', 'panasonic');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('panerai', 'panerai');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('paris', 'paris');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pars', 'pars');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('partners', 'partners');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('parts', 'parts');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('party', 'party');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('passagens', 'passagens');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pay', 'pay');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pccw', 'pccw');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pe', 'pe');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pet', 'pet');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pf', 'pf');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pfizer', 'pfizer');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pg', 'pg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ph', 'ph');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pharmacy', 'pharmacy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('phd', 'phd');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('philips', 'philips');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('phone', 'phone');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('photo', 'photo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('photography', 'photography');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('photos', 'photos');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('physio', 'physio');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('piaget', 'piaget');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pics', 'pics');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pictet', 'pictet');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pictures', 'pictures');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pid', 'pid');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pin', 'pin');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ping', 'ping');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pink', 'pink');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pioneer', 'pioneer');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pizza', 'pizza');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pk', 'pk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pl', 'pl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('place', 'place');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('play', 'play');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('playstation', 'playstation');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('plumbing', 'plumbing');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('plus', 'plus');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pm', 'pm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pn', 'pn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pnc', 'pnc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pohl', 'pohl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('poker', 'poker');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('politie', 'politie');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('porn', 'porn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('post', 'post');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pr', 'pr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pramerica', 'pramerica');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('praxi', 'praxi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('press', 'press');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('prime', 'prime');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pro', 'pro');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('prod', 'prod');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('productions', 'productions');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('prof', 'prof');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('progressive', 'progressive');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('promo', 'promo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('properties', 'properties');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('property', 'property');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('protection', 'protection');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pru', 'pru');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('prudential', 'prudential');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ps', 'ps');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pt', 'pt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pub', 'pub');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pw', 'pw');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('pwc', 'pwc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('py', 'py');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('qa', 'qa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('qpon', 'qpon');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('quebec', 'quebec');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('quest', 'quest');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('qvc', 'qvc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('racing', 'racing');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('radio', 'radio');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('raid', 'raid');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('re', 're');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('read', 'read');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('realestate', 'realestate');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('realtor', 'realtor');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('realty', 'realty');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('recipes', 'recipes');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('red', 'red');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('redstone', 'redstone');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('redumbrella', 'redumbrella');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rehab', 'rehab');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('reise', 'reise');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('reisen', 'reisen');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('reit', 'reit');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('reliance', 'reliance');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ren', 'ren');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rent', 'rent');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rentals', 'rentals');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('repair', 'repair');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('report', 'report');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('republican', 'republican');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rest', 'rest');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('restaurant', 'restaurant');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('review', 'review');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('reviews', 'reviews');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rexroth', 'rexroth');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rich', 'rich');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('richardli', 'richardli');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ricoh', 'ricoh');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rightathome', 'rightathome');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ril', 'ril');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rio', 'rio');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rip', 'rip');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rmit', 'rmit');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ro', 'ro');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rocher', 'rocher');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rocks', 'rocks');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rodeo', 'rodeo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rogers', 'rogers');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('room', 'room');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rs', 'rs');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rsvp', 'rsvp');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ru', 'ru');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rugby', 'rugby');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ruhr', 'ruhr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('run', 'run');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rw', 'rw');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('rwe', 'rwe');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ryukyu', 'ryukyu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sa', 'sa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('saarland', 'saarland');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('safe', 'safe');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('safety', 'safety');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sakura', 'sakura');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sale', 'sale');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('salon', 'salon');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('samsclub', 'samsclub');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('samsung', 'samsung');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sandvik', 'sandvik');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sandvikcoromant', 'sandvikcoromant');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sanofi', 'sanofi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sap', 'sap');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sapo', 'sapo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sarl', 'sarl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sas', 'sas');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('save', 'save');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('saxo', 'saxo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sb', 'sb');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sbi', 'sbi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sbs', 'sbs');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sc', 'sc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sca', 'sca');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('scb', 'scb');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('schaeffler', 'schaeffler');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('schmidt', 'schmidt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('scholarships', 'scholarships');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('school', 'school');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('schule', 'schule');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('schwarz', 'schwarz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('science', 'science');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('scjohnson', 'scjohnson');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('scor', 'scor');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('scot', 'scot');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sd', 'sd');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('se', 'se');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('search', 'search');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('seat', 'seat');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('secure', 'secure');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('security', 'security');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('seek', 'seek');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('select', 'select');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sener', 'sener');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('services', 'services');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ses', 'ses');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('seven', 'seven');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sew', 'sew');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sex', 'sex');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sexy', 'sexy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sfr', 'sfr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sg', 'sg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sh', 'sh');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('shangrila', 'shangrila');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sharp', 'sharp');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('shaw', 'shaw');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('shell', 'shell');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('shia', 'shia');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('shiksha', 'shiksha');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('shoes', 'shoes');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('shop', 'shop');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('shopping', 'shopping');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('shouji', 'shouji');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('show', 'show');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('showtime', 'showtime');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('shriram', 'shriram');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('si', 'si');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('silk', 'silk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sina', 'sina');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('singles', 'singles');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('site', 'site');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sj', 'sj');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sk', 'sk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ski', 'ski');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('skin', 'skin');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sky', 'sky');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('skype', 'skype');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sl', 'sl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sling', 'sling');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sm', 'sm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('smart', 'smart');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('smile', 'smile');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sn', 'sn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sncf', 'sncf');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('so', 'so');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('soccer', 'soccer');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('social', 'social');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('softbank', 'softbank');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('software', 'software');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sohu', 'sohu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('solar', 'solar');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('solutions', 'solutions');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('song', 'song');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sony', 'sony');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('soy', 'soy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('space', 'space');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('spiegel', 'spiegel');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sport', 'sport');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('spot', 'spot');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('spreadbetting', 'spreadbetting');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sr', 'sr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('srl', 'srl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('srt', 'srt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('st', 'st');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('stada', 'stada');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('staples', 'staples');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('star', 'star');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('starhub', 'starhub');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('statebank', 'statebank');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('statefarm', 'statefarm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('statoil', 'statoil');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('stc', 'stc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('stcgroup', 'stcgroup');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('stockholm', 'stockholm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('storage', 'storage');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('store', 'store');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('stream', 'stream');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('studio', 'studio');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('study', 'study');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('style', 'style');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('su', 'su');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sucks', 'sucks');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('supplies', 'supplies');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('supply', 'supply');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('support', 'support');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('surf', 'surf');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('surgery', 'surgery');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('suzuki', 'suzuki');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sv', 'sv');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('swatch', 'swatch');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('swiftcover', 'swiftcover');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('swiss', 'swiss');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sx', 'sx');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sy', 'sy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sydney', 'sydney');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('symantec', 'symantec');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('systems', 'systems');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('sz', 'sz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tab', 'tab');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('taipei', 'taipei');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('talk', 'talk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('taobao', 'taobao');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('target', 'target');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tatamotors', 'tatamotors');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tatar', 'tatar');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tattoo', 'tattoo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tax', 'tax');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('taxi', 'taxi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tc', 'tc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tci', 'tci');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('td', 'td');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tdk', 'tdk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('team', 'team');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tech', 'tech');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('technology', 'technology');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tel', 'tel');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('telecity', 'telecity');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('telefonica', 'telefonica');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('temasek', 'temasek');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tennis', 'tennis');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('teva', 'teva');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tf', 'tf');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tg', 'tg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('th', 'th');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('thd', 'thd');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('theater', 'theater');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('theatre', 'theatre');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tiaa', 'tiaa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tickets', 'tickets');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tienda', 'tienda');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tiffany', 'tiffany');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tips', 'tips');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tires', 'tires');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tirol', 'tirol');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tj', 'tj');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tjmaxx', 'tjmaxx');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tjx', 'tjx');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tk', 'tk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tkmaxx', 'tkmaxx');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tl', 'tl');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tm', 'tm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tmall', 'tmall');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tn', 'tn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('to', 'to');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('today', 'today');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tokyo', 'tokyo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tools', 'tools');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('top', 'top');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('toray', 'toray');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('toshiba', 'toshiba');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('total', 'total');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tours', 'tours');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('town', 'town');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('toyota', 'toyota');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('toys', 'toys');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tr', 'tr');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('trade', 'trade');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('trading', 'trading');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('training', 'training');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('travel', 'travel');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('travelchannel', 'travelchannel');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('travelers', 'travelers');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('travelersinsurance', 'travelersinsurance');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('trust', 'trust');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('trv', 'trv');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tt', 'tt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tube', 'tube');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tui', 'tui');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tunes', 'tunes');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tushu', 'tushu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tv', 'tv');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tvs', 'tvs');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tw', 'tw');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('tz', 'tz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ua', 'ua');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ubank', 'ubank');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ubs', 'ubs');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('uconnect', 'uconnect');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ug', 'ug');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('uk', 'uk');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('unicom', 'unicom');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('university', 'university');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('uno', 'uno');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('uol', 'uol');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ups', 'ups');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('us', 'us');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('uy', 'uy');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('uz', 'uz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('va', 'va');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vacations', 'vacations');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vana', 'vana');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vanguard', 'vanguard');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vc', 'vc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ve', 've');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vegas', 'vegas');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ventures', 'ventures');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('verisign', 'verisign');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('versicherung', 'versicherung');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vet', 'vet');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vg', 'vg');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vi', 'vi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('viajes', 'viajes');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('video', 'video');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vig', 'vig');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('viking', 'viking');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('villas', 'villas');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vin', 'vin');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vip', 'vip');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('virgin', 'virgin');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('visa', 'visa');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vision', 'vision');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vista', 'vista');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vistaprint', 'vistaprint');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('viva', 'viva');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vivo', 'vivo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vlaanderen', 'vlaanderen');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vn', 'vn');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vodka', 'vodka');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('volkswagen', 'volkswagen');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('volvo', 'volvo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vote', 'vote');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('voting', 'voting');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('voto', 'voto');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('voyage', 'voyage');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vu', 'vu');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('vuelos', 'vuelos');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wales', 'wales');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('walmart', 'walmart');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('walter', 'walter');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wang', 'wang');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wanggou', 'wanggou');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('warman', 'warman');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('watch', 'watch');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('watches', 'watches');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('weather', 'weather');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('weatherchannel', 'weatherchannel');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('webcam', 'webcam');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('weber', 'weber');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('website', 'website');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wed', 'wed');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wedding', 'wedding');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('weibo', 'weibo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('weir', 'weir');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wf', 'wf');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('whoswho', 'whoswho');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wien', 'wien');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wiki', 'wiki');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('williamhill', 'williamhill');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('win', 'win');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('windows', 'windows');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wine', 'wine');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('winners', 'winners');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wme', 'wme');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wolterskluwer', 'wolterskluwer');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('woodside', 'woodside');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('work', 'work');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('works', 'works');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('world', 'world');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wow', 'wow');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ws', 'ws');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wtc', 'wtc');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('wtf', 'wtf');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xbox', 'xbox');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xerox', 'xerox');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xfinity', 'xfinity');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xihuan', 'xihuan');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xin', 'xin');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--11b4c3d', 'कॉम');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--1ck2e1b', 'セール');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--1qqw23a', '佛山');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--2scrj9c', 'ಭಾರತ');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--30rr7y', '慈善');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--3bst00m', '集团');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--3ds443g', '在线');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--3e0b707e', '한국');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--3hcrj9c', 'ଭାରତ');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--3oq18vl8pn36a', '大众汽车');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--3pxu8k', '点看');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--42c2d9a', 'คอม');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--45br5cyl', 'ভাৰত');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--45brj9c', 'ভারত');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--45q11c', '八卦');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--4gbrim', 'موقع');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--54b7fta0cc', 'বাংলা');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--55qw42g', '公益');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--55qx5d', '公司');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--5su34j936bgsg', '香格里拉');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--5tzm5g', '网站');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--6frz82g', '移动');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--6qq986b3xl', '我爱你');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--80adxhks', 'москва');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--80ao21a', 'қаз');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--80aqecdr1a', 'католик');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--80asehdb', 'онлайн');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--80aswg', 'сайт');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--8y0a063a', '联通');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--90a3ac', 'срб');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--90ae', 'бг');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--90ais', 'бел');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--9dbq2a', 'קום');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--9et52u', '时尚');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--9krt00a', '微博');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--b4w605ferd', '淡马锡');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--bck1b9a5dre4c', 'ファッション');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--c1avg', 'орг');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--c2br7g', 'नेट');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--cck2b3b', 'ストア');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--cg4bki', '삼성');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--clchc0ea0b2g2a9gcd', 'சிங்கப்பூர்');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--czr694b', '商标');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--czrs0t', '商店');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--czru2d', '商城');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--d1acj3b', 'дети');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--d1alf', 'мкд');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--e1a4c', 'ею');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--eckvdtc9d', 'ポイント');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--efvy88h', '新闻');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--estv75g', '工行');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--fct429k', '家電');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--fhbei', 'كوم');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--fiq228c5hs', '中文网');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--fiq64b', '中信');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--fiqs8s', '中国');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--fiqz9s', '中國');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--fjq720a', '娱乐');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--flw351e', '谷歌');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--fpcrj9c3d', 'భారత్');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--fzc2c9e2c', 'ලංකා');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--fzys8d69uvgm', '電訊盈科');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--g2xx48c', '购物');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--gckr3f0f', 'クラウド');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--gecrj9c', 'ભારત');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--gk3at1e', '通販');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--h2breg3eve', 'भारतम्');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--h2brj9c', 'भारत');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--h2brj9c8c', 'भारोत');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--hxt814e', '网店');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--i1b6b1a6a2e', 'संगठन');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--imr513n', '餐厅');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--io0a7i', '网络');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--j1aef', 'ком');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--j1amh', 'укр');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--j6w193g', '香港');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--jlq61u9w7b', '诺基亚');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--jvr189m', '食品');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--kcrx77d1x4a', '飞利浦');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--kprw13d', '台湾');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--kpry57d', '台灣');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--kpu716f', '手表');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--kput3i', '手机');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--l1acc', 'мон');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--lgbbat1ad8j', 'الجزائر');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgb9awbf', 'عمان');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgba3a3ejt', 'ارامكو');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgba3a4f16a', 'ایران');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgba7c0bbn0a', 'العليان');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbaakc7dvf', 'اتصالات');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbaam7a8h', 'امارات');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbab2bd', 'بازار');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbai9azgqp6j', 'پاکستان');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbayh7gpa', 'الاردن');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbb9fbpob', 'موبايلي');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbbh1a', 'بارت');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbbh1a71e', 'بھارت');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbc0a9azcg', 'المغرب');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbca7dzdo', 'ابوظبي');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgberp4a5d4ar', 'السعودية');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbgu82a', 'ڀارت');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbi4ecexp', 'كاثوليك');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbpl2fh', 'سودان');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbt3dhd', 'همراه');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbtx2b', 'عراق');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mgbx4cd0ab', 'مليسيا');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mix891f', '澳門');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mk1bu44c', '닷컴');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--mxtq1m', '政府');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--ngbc5azd', 'شبكة');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--ngbe9e0a', 'بيتك');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--ngbrx', 'عرب');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--node', 'გე');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--nqv7f', '机构');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--nqv7fs00ema', '组织机构');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--nyqy26a', '健康');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--o3cw4h', 'ไทย');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--ogbpf8fl', 'سورية');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--otu796d', '招聘');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--p1acf', 'рус');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--p1ai', 'рф');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--pbt977c', '珠宝');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--pgbs0dh', 'تونس');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--pssy2u', '大拿');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--q9jyb4c', 'みんな');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--qcka1pmc', 'グーグル');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--qxam', 'ελ');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--rhqv96g', '世界');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--rovu88b', '書籍');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--rvc1e0am3e', 'ഭാരതം');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--s9brj9c', 'ਭਾਰਤ');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--ses554g', '网址');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--t60b56a', '닷넷');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--tckwe', 'コム');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--tiq49xqyj', '天主教');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--unup4y', '游戏');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--vermgensberater-ctb', 'vermögensberater');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--vermgensberatung-pwb', 'vermögensberatung');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--vhquv', '企业');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--vuq861b', '信息');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--w4r85el8fhu5dnra', '嘉里大酒店');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--w4rs40l', '嘉里');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--wgbh1c', 'مصر');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--wgbl6a', 'قطر');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--xhq521b', '广东');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--xkc2al3hye2a', 'இலங்கை');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--xkc2dl3a5ee0h', 'இந்தியா');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--y9a3aq', 'հայ');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--yfro4i67o', '新加坡');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--ygbi2ammx', 'فلسطين');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xn--zfr164b', '政务');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xperia', 'xperia');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xxx', 'xxx');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('xyz', 'xyz');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('yachts', 'yachts');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('yahoo', 'yahoo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('yamaxun', 'yamaxun');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('yandex', 'yandex');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('ye', 'ye');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('yodobashi', 'yodobashi');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('yoga', 'yoga');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('yokohama', 'yokohama');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('you', 'you');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('youtube', 'youtube');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('yt', 'yt');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('yun', 'yun');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('za', 'za');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('zappos', 'zappos');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('zara', 'zara');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('zero', 'zero');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('zip', 'zip');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('zippo', 'zippo');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('zm', 'zm');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('zone', 'zone');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('zuerich', 'zuerich');
INSERT INTO `top_domains` (`id`, `value`) VALUES ('zw', 'zw');
