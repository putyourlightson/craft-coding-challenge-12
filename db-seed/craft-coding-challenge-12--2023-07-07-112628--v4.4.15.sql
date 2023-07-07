-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_msabjvotpqgybymtyfljcwrvzrtnyhucxdav` (`ownerId`),
  CONSTRAINT `fk_dgkblzmegosoxlwxryjtdbhkrbfohigwbycg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_msabjvotpqgybymtyfljcwrvzrtnyhucxdav` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xvvdvfltlnmumqdrujwfrufypghpvyecfqib` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_wdonjwcjmusuiwvoxjfeqvnrnftiabwwhpnv` (`dateRead`),
  KEY `fk_mjbhbneargqbsylhjpocmgyrwhahsqucbfih` (`pluginId`),
  CONSTRAINT `fk_mjbhbneargqbsylhjpocmgyrwhahsqucbfih` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wgystrdsayywzgkmcnfxcpzowtnxzbmtqkmu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pzstlrhsipfnhohqpmuiepofdzqiebfnuncm` (`sessionId`,`volumeId`),
  KEY `idx_lqzzfwwrxltemchtrojiagufiswghhycocoj` (`volumeId`),
  CONSTRAINT `fk_busfusgyqfapgbutswdeaoxhseomjesubbtz` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkcwcinyyeqedaerwgyzcsklkawphwzwicvx` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jfpmfprwdynjfcunafmabpkexubpvfnmnyxy` (`filename`,`folderId`),
  KEY `idx_tvmpndkodcjapkihljtxnjyazlyrcalysmwx` (`folderId`),
  KEY `idx_mienudqugtqiatgcegjyzvfzxdmpjnexdrmz` (`volumeId`),
  KEY `fk_hcfugtsjvppjnfwaiurnyechkavucrofubtu` (`uploaderId`),
  CONSTRAINT `fk_hcfugtsjvppjnfwaiurnyechkavucrofubtu` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mvxjsllultcijerclhfbisuyaundnkhuilkh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_odvvmufxpihhnilsjhhmgxtxyzobzjewkkqs` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pzxrsrqaciuhoselhftuwfnacvgvodqfuema` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_umkydtzwqczqfzkhykuxxdybdsjgvtwytrbz` (`groupId`),
  KEY `fk_xzyemizxpqidqfmpbgcurdmzovcatfetfdib` (`parentId`),
  CONSTRAINT `fk_dvocndwjriwdpuvynroefopaprhuumpxvcce` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qfeynhqczqrlzyyaupujzwgiervohcqtpmtv` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xzyemizxpqidqfmpbgcurdmzovcatfetfdib` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bflpiuvhghruvcreinfpllgxkxrvbqgygcft` (`name`),
  KEY `idx_hwuoqmxtvkdbtxbbxoxksdtktbvtgobdebkd` (`handle`),
  KEY `idx_nxchuvfdzdsttmbzsqjofdzerhdiswingrkz` (`structureId`),
  KEY `idx_rdswxtefqkshrajrkijnrmmvdvdsumsbvpth` (`fieldLayoutId`),
  KEY `idx_wsouzqewrpejdecuulacewimvjumwdlvwype` (`dateDeleted`),
  CONSTRAINT `fk_dljxktjrqlxtasizqkgeftonbzhysiezdaly` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_fggpwcpbqluxdafddjhcvuokriaghmbbrlom` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tinjymvugtldpeuewopukgxffauzydjyblck` (`groupId`,`siteId`),
  KEY `idx_dmmpzkhwbkheqtumvvapnzksgtmgikbdovnn` (`siteId`),
  CONSTRAINT `fk_ayrpclmevzovlbvsphacezpmkytwiqviqbnx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fqtxalxicwkumjcxhrqmcgsubipzxqjzhcyu` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_iuqqziobcmsnzimuaveaoxcnzjjhktqdvloc` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_zboeazmaubtyfisfnodtttbdlmtnnxrqggna` (`siteId`),
  KEY `fk_djtbtnstxblwgqynusjgvjxkudsiqviiospk` (`userId`),
  CONSTRAINT `fk_djtbtnstxblwgqynusjgvjxkudsiqviiospk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_qjgnmqqxtwqxpiyeavhtxpdtqcmebtqmhkph` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zboeazmaubtyfisfnodtttbdlmtnnxrqggna` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_dhspaagrufjcydckwfjpupecdgxzgswmfhfj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_szmtdyzyzinmftywoguuovnrttiebtkredej` (`siteId`),
  KEY `fk_stuuzhstyyxgufqmcngnjsmzsyhlvromjxce` (`fieldId`),
  KEY `fk_nzvwouufkpbrzqhtlszzywtapoekcudlyoej` (`userId`),
  CONSTRAINT `fk_nzvwouufkpbrzqhtlszzywtapoekcudlyoej` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ovpgrlcyyuimieptsacalrorxuyqkkpcbpds` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stuuzhstyyxgufqmcngnjsmzsyhlvromjxce` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_szmtdyzyzinmftywoguuovnrttiebtkredej` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_dates_hozrxife` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jqzcffcvmftihrofdryftwugozjhktgjmowf` (`elementId`,`siteId`),
  KEY `idx_bgwnufnpfnfbmgdoqopioxdnmcrqpzcvkwit` (`siteId`),
  KEY `idx_rgrowoyqhhhtdbdzruigjzffxuavqtqeicid` (`title`),
  CONSTRAINT `fk_bqomwnmcsbqexhsrvlxcibreijzftpuhlrwp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xsvqkvgigqgvjhiyogqkkwjkwxlflzzdyigl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ektfcaaepmlvdscierryrdgxgddoporfluft` (`userId`),
  CONSTRAINT `fk_ektfcaaepmlvdscierryrdgxgddoporfluft` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ddtccbzofpndlamlrocvhoyicjxclrhjjjek` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_curwyhpvadatseawdryxhqsouklhgpvtqnfi` (`creatorId`,`provisional`),
  KEY `idx_jhjrorhssqwigiibsgvnsiymxkimnrxbkumo` (`saved`),
  KEY `fk_yoelqncjxhgfnsrreqjbmokgqugoonamzdnf` (`canonicalId`),
  CONSTRAINT `fk_sjxysysjhyppvvzfngazzyeqfcttdshgqiqq` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yoelqncjxhgfnsrreqjbmokgqugoonamzdnf` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gtsmheywkesqhdkgspsqleecvbxoumglircg` (`dateDeleted`),
  KEY `idx_qqgybcxnkbajppipzkfxbbilqzkpzmtrpcpg` (`fieldLayoutId`),
  KEY `idx_wjvxofnyicpedlomeeqmpzuiporthduxtxdi` (`type`),
  KEY `idx_ienjfaqmhnpboqvjugxatypbrdpxajteugzg` (`enabled`),
  KEY `idx_votqatyhpfdkjgiyvocmwsmjoyaohehsnthz` (`archived`,`dateCreated`),
  KEY `idx_wanficubtvzuuwqjzrbmlgrjqhxvvjdicmzh` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_eaeeimfsfcmdzcpsurjpmnscmrurjlqjosus` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_hkvlwkjxtlrrayypwrumgozetdfvzzynnhpq` (`canonicalId`),
  KEY `fk_bsfildfwwphnwammekzzdnxpyfoyzkdzsgrr` (`draftId`),
  KEY `fk_gbdzoypkeufspxygkegkwzocvqlncyungygg` (`revisionId`),
  CONSTRAINT `fk_bsfildfwwphnwammekzzdnxpyfoyzkdzsgrr` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gbdzoypkeufspxygkegkwzocvqlncyungygg` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hkvlwkjxtlrrayypwrumgozetdfvzzynnhpq` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tqmyrnrvxyvveunghayaxxnnadifrtysefpa` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hpdxtxcgefsyyatmwjnyuklkvaaxpwoekzpu` (`elementId`,`siteId`),
  KEY `idx_laiqjnniceelttilnnmjchqmynrtvcbuoaru` (`siteId`),
  KEY `idx_ofoxjbdnrsznxhyfdqpszhkxfqzhaarilody` (`slug`,`siteId`),
  KEY `idx_hnpltzcivigosragveapcznpacjdnedgdael` (`enabled`),
  KEY `idx_nynrfguuklmzqfbwqwwsghcqxcnztyybgeyy` (`uri`,`siteId`),
  CONSTRAINT `fk_kgzyxygnsnnvtdontfcthscuzxkjjxnebjpd` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qbtgabvbfiktiiswakthdhzsiiqgfxifcnsz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xbickxurytkhgbvsmyyvtxucfuueirdzqwev` (`postDate`),
  KEY `idx_urgqcomvjoruhyqecdmvczaizptdofxvkjra` (`expiryDate`),
  KEY `idx_loaufgdtfreoiblimqomupdyomfyhbecvfiq` (`authorId`),
  KEY `idx_eswztppsffqczyvvmzmxwwlzhqazdhuorkkb` (`sectionId`),
  KEY `idx_dmnsedghyviooycajhveibfuhjvwcxzlhhan` (`typeId`),
  KEY `fk_kbqvdhfkhqqunwmrsyvdomeqhxiekgepigis` (`parentId`),
  CONSTRAINT `fk_kbqvdhfkhqqunwmrsyvdomeqhxiekgepigis` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_oqbgakgfpwimmujvqytlrbyolrdgjqqnzprb` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pbhovcuuxyporbardqfedhsqjtccipcyfecx` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ttaloxtlzsdjqefkakhtdckcjydfvyojpdkf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yrviuyajjrrumhwtlmrupgyxggqgmihusnlj` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oudlojczyyxeofdquysqhmrqtbcguianwbgp` (`name`,`sectionId`),
  KEY `idx_ofttkwjsjyuqzjltvdelrmqsccvluddguqno` (`handle`,`sectionId`),
  KEY `idx_eojzyjlmxeqywwzqbgiezqsxztzezvtdtazy` (`sectionId`),
  KEY `idx_rfnpufswriackxsbmehadyvwkbwpqztynkbt` (`fieldLayoutId`),
  KEY `idx_mktvketumtcfmvsufzibrsbamqcokdjnshwd` (`dateDeleted`),
  CONSTRAINT `fk_kbkxbyifnvxxtozcdugycwntwtsfaveqlhpm` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xkpcldfuthhwfjeeqwtrezmfugsluibqdkaw` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_imwqoeblxzxjxivvckhfwkwcnsxjdotrikkc` (`name`),
  KEY `idx_vdcawaezccybhftaiexnzcmuiuzehobqssga` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oujiwocvtwlxvnnadigozpuzqfrttylfdvew` (`layoutId`,`fieldId`),
  KEY `idx_usjbmsttnddzmcavmvzbuvlklbonlvwdzzlv` (`sortOrder`),
  KEY `idx_nidridlbfdcgpxvbdxrvwvdlsdknccpvzsmk` (`tabId`),
  KEY `idx_nutysbxdxxbeglaqcicnfkbcyqebxbmmsicw` (`fieldId`),
  CONSTRAINT `fk_kwtwxstkeeplxystqsbbeumynqzsssoiuvwn` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tqnxdvvhqykxjybbkvlxtiukwtdgvrvdpvgp` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ydzjxxjrpkirghprbozltqtpyqpwrlkrjugj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_diixgfqdmrosirhncdxttjktqinuxabytsoa` (`dateDeleted`),
  KEY `idx_nbnbcrppsgzsqjkfcygumjtlsksygcxxgstk` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cgkrrpqvmuoewjgqikegegristhxdbrhnewm` (`sortOrder`),
  KEY `idx_pbnymoydnfsldjrpdqjvrhnonrycbfvqmxki` (`layoutId`),
  CONSTRAINT `fk_xfzilykajymmmdpezfvsdsbibikjsbpgjccv` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fjdwjydzxmgplyksgdfxccirnvqgqaxgkasz` (`handle`,`context`),
  KEY `idx_pxfrqqmdebjfjvarhcqhitilfnntpedtyphw` (`groupId`),
  KEY `idx_qdsbjuwemznsysnbpaqsloajrcwlrxoouyya` (`context`),
  CONSTRAINT `fk_ukoeadgflxsllkzthlrwrrtlmvhyanydwfts` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lcegtfuoeqylravucwcqolvzztzpwhzwkrhv` (`name`),
  KEY `idx_phaeisfusfvhzurupuhpcqfoywmrwxwfzdvm` (`handle`),
  KEY `idx_yxplscnjrapyeasnamuqvnajceococalfyui` (`fieldLayoutId`),
  KEY `idx_wjhhkehfapvepuusdkhjryttjoxsotaklmjr` (`sortOrder`),
  CONSTRAINT `fk_bpfauhmvzvafveapnlylgnogzacgbxyrtzgf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tjrgoubhfyuxzuhwqjbzmcphcaspluikfumi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qrxtttpguhgnmowubepwsccsiqognurhfuhr` (`accessToken`),
  UNIQUE KEY `idx_zftdlfvqbkhwmqlyrlxnhkifoutvbzlmksvt` (`name`),
  KEY `fk_pgdydkmejezpzfmkqplzymxsifvbqwhwvehm` (`schemaId`),
  CONSTRAINT `fk_pgdydkmejezpzfmkqplzymxsifvbqwhwvehm` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uozubtaczjmgounkzceydubgqxxjnhaoyqnq` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cvdoxggyqrozydzeilnvgsuiatwvezozieyp` (`name`),
  KEY `idx_bzlvvtwfxynqnfexgxxiinznucmauvhvjmxr` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lcgheyvlqbhhwdhxbozsfvnemndrohoahtja` (`primaryOwnerId`),
  KEY `idx_nbpjmalrzrbjuzjtonoecwqndcwhepsqrnsd` (`fieldId`),
  KEY `idx_knftlksklxxyswwjyglzjvfiebpmvmmehvbg` (`typeId`),
  CONSTRAINT `fk_fdvtfplkxpusezvohijyjeqxnxwntfukdxww` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mowckeoaqvlsdtxtkiitenhmnlgupxrsbofh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uayurabdnscdjvhbgfkypzgxsjheoixzgrxj` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wrvhzxvrgjxzwdezcmyshpjkwmxufrenmoqe` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_onshdkkpjryjzfcghhycgploqtmrupqpfvav` (`ownerId`),
  CONSTRAINT `fk_bewwjjxrtsezdkyleeahtnldlbbnerytnmpq` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_onshdkkpjryjzfcghhycgploqtmrupqpfvav` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ypqcbdqoueybauqqgivxasjizlaajshrheml` (`name`,`fieldId`),
  KEY `idx_ncfyenrlxvwemlaheyusretnvazovhneptrt` (`handle`,`fieldId`),
  KEY `idx_dstofwgtxnehqhjieskqvdcnmangfnanmidk` (`fieldId`),
  KEY `idx_qfvowxlwvjfnkuwazckwgpyzyypwzrdpfzei` (`fieldLayoutId`),
  CONSTRAINT `fk_bomyvchgsezdenucronkkluqjrivoyrxepwu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zbgnefgehceamrzgssdckvsqkoyejhkjpqxp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bwoitonatyluxwuitjyzgmluoqgbxasjjiup` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vuvauqxvdcciosbzvehxvnrpqngasulvjdkd` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_vcfkfdoxramrhqstyzfvlihfaupnsjkluxtm` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_uadakxmkzghrhcwiqlwvkcvejhvynyrgfvng` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=768 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_drobnvyajkynrbmkcooulabxcgghisdfxqow` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_crfnrsbokqcfjhfuifkwqmzkbblcaqiitirk` (`sourceId`),
  KEY `idx_casvyjipwiklphiwkocfuoyutkrmnebfayqj` (`targetId`),
  KEY `idx_buvzdxtoecztgmopusmrxqwgawbsjtiswflw` (`sourceSiteId`),
  CONSTRAINT `fk_byupggysxlkdqilhuciaazbiwgddmgjwftnp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ggdrstfcnfvbtglryujhhkfihkqvlytdnldq` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ipycaijurbitmtrpacupumcnahxwqplzlwbd` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rpsotpuindomtnqizjqaowgjvdwultqaodrl` (`canonicalId`,`num`),
  KEY `fk_xcgsnamhhxxfcdfihibvnmsfwlxmxwxizsia` (`creatorId`),
  CONSTRAINT `fk_ncsbvlhkikkkrypibqljgwamlwyzasjercbk` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xcgsnamhhxxfcdfihibvnmsfwlxmxwxizsia` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_qtifyfqpijgdbmwkkqerfpydggonvzyjdwuz` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vhzcobpdvxyrqrbrxwxclvsokayjnywincer` (`handle`),
  KEY `idx_ounocdtuxabltgkaqcitdandwyeoctzqpznt` (`name`),
  KEY `idx_mdcyhvxpudpcovusxxpbncqkfxjcerlfawod` (`structureId`),
  KEY `idx_avfauefjfcnxaayllprbomskbcfdnvmfnlkr` (`dateDeleted`),
  CONSTRAINT `fk_iixudohwzsevkmsesdtcfatdqllnnyomhlrc` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ugkanpqmretdbjbrjszptmbzpsqcujiyezzc` (`sectionId`,`siteId`),
  KEY `idx_ewbibexjibphcsjzgltkfzejpjirastnqksf` (`siteId`),
  CONSTRAINT `fk_swpuvuduilgpgrofyncxvllvqlyhplsjdrdw` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ysymocxxldspfetuukxbjsgnnletszmhiqah` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eoyjeqebjijvhysehazhglswvysnifxckzul` (`uid`),
  KEY `idx_foztuwjzdwrtrbsbygfiybjgjgauytnjkacq` (`token`),
  KEY `idx_yazneqmwxikhavqobhucihwgnflrdncmudzi` (`dateUpdated`),
  KEY `idx_oeujcbvyujkxarpuqhrldhvybvgkdiubxgys` (`userId`),
  CONSTRAINT `fk_tuhyhbgxqqomovzsxwiabcuitncpnjaxbcnf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gxmssnflplycfojhardquudwaaetzrteitnn` (`userId`,`message`),
  CONSTRAINT `fk_ocksebcmxnuruqdjxydsahnntfuuhfiewegm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ohkqjkhxdxmrbhpwxxwyrlvniducxqkdnldd` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zqcmgnlmbzvpnavqpwneqdjynhvexbyvbexj` (`dateDeleted`),
  KEY `idx_glaqmdscmayinzbkqwskyqdtqiwqoncnggxf` (`handle`),
  KEY `idx_qevogplhncnlkfadbelqjwrzuqhujdibrdwv` (`sortOrder`),
  KEY `fk_tovfslllqdwlapmlncjxigccikdudlzwqbuy` (`groupId`),
  CONSTRAINT `fk_tovfslllqdwlapmlncjxigccikdudlzwqbuy` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_acfxgvxjezglpilxdzkdheapyprjfkjpymzl` (`structureId`,`elementId`),
  KEY `idx_lqjmynzqkpfrdegwxvztqxdktqcsnrijogle` (`root`),
  KEY `idx_gtudhyaetwugfayjydzmowtdoklwkhmofxmv` (`lft`),
  KEY `idx_irdskieztirzdrspwebajbzftsbhokqhaerg` (`rgt`),
  KEY `idx_fcvhhbptaksrarpxhzblxugwciksaffnstph` (`level`),
  KEY `idx_qpcpkqlyjkeppalkzkvkresvylvfhusbrbgo` (`elementId`),
  CONSTRAINT `fk_pazvrrxkmmjfahwynrgetqhdpgddznysvbcw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zjyeakmqzcpfeivjaglxozperqulhqvumzry` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ucevqojawzwborkwvjwgsfcybbykorkzfzcx` (`key`,`language`),
  KEY `idx_yqurubbtmynqbgvfyhsltiilbxraaxtdhrfg` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pbzdufsswnridwsvcvvvwpqhrtarjqqrqeom` (`name`),
  KEY `idx_cigkbgpemwaiqmejjqqozrzoslqwijwmffxf` (`handle`),
  KEY `idx_lyrdtdfnogxxfpyvqmeghabtrpyjshzrhbyb` (`dateDeleted`),
  KEY `fk_zzzfmeaiovlpglzisnmnjdeqopmfjzbczadf` (`fieldLayoutId`),
  CONSTRAINT `fk_zzzfmeaiovlpglzisnmnjdeqopmfjzbczadf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qmxiwsskrpdhpehpwzavuqcouswjiqyveuiz` (`groupId`),
  CONSTRAINT `fk_bsncminnekinqvfhsuwyyuvoyasewbujixca` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rnuixgjlpkrtdhlcsztvfsuvzwxwjebribcy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ksjayqxjenllhvsrcijcqekllpaainfelnwr` (`token`),
  KEY `idx_xydvfzqpqjmjctcjljgvrzudtnkgjccuvrks` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oultxuqmrshfzkzeuvvfvzdtveebjsowvryt` (`handle`),
  KEY `idx_mnnejlifgwmksnurjzbmgaxasgwmtvukywty` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_txjpzwbdjjzejwutikmelanmcadawlswpvqm` (`groupId`,`userId`),
  KEY `idx_vriahrctfketywjhulmjvbmqxmmnigdcmcoy` (`userId`),
  CONSTRAINT `fk_bjauwyoxqbxevscsolngtfdimvpqxxmcuqoz` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_epjzskxcguxtmqwdnmclbuseazcotshkhzbj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ahzokmcpdjljbtvgnmnevbgybztsdjbblirv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ixxxcatmboxsnkkjcmwicmpoaxhrtltfrqix` (`permissionId`,`groupId`),
  KEY `idx_xruyntxcskjslgrtzklebpzncwaxhpksfsra` (`groupId`),
  CONSTRAINT `fk_goxzzzrupxuxzidhbpmtxnehrryqosmldvme` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mucwcdryxhvbjbmqpieghmtjpkpfcxuqmcmn` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kxetwhtoyvzesvjaqgfdyjpcnocntrdcolbs` (`permissionId`,`userId`),
  KEY `idx_kvloffvvabhsevkikqlzsjsrhrdzqhfsfyzu` (`userId`),
  CONSTRAINT `fk_qszjwuhobqeoofodprzptiawnwmyegdfekbg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wtfacjjfkksjallznpcnwmugbemqwrqemszv` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_dgqmxwihecruwjvulfajoaeyyeuzrqydzknb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_whhtlqdnasojfotsjgsfwhofwcrirrgebanq` (`active`),
  KEY `idx_vgjuuupdgvtxrchpvsfvutkwjchbyunkrpcm` (`locked`),
  KEY `idx_wslzawuwnkyiyoeusjzvhsjdqjshgkljgxfm` (`pending`),
  KEY `idx_qkimepwgickvaodroivqsftwbrylagnurcvp` (`suspended`),
  KEY `idx_ecyodzggbcbsxdjibjnxrckhiranlyhgcpft` (`verificationCode`),
  KEY `idx_duwcweslgdatyfwttebcrlzmvwtjihhknulv` (`email`),
  KEY `idx_wpcuagwrelorgdodrnbtzrhuxpsydxpxutbf` (`username`),
  KEY `fk_oekxohrklnsghmpspsxpvswjkzomcyhcgaer` (`photoId`),
  CONSTRAINT `fk_mjvmslgeiurroqcfnfqfktgoyszidvphnmta` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oekxohrklnsghmpspsxpvswjkzomcyhcgaer` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bgzmvocibypmwkbudogieakwqmyydxvykkuk` (`name`,`parentId`,`volumeId`),
  KEY `idx_junmbourfkiquxjjwgsrjndrqwjbztinxzge` (`parentId`),
  KEY `idx_xxxbgiaowddczjqxaxqrrucolfqwzshbqpnw` (`volumeId`),
  CONSTRAINT `fk_knuxmiriggkdroxikcalkngkhrbyfuyfrcmi` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nocbtbjnheegqsrefgqgvwnujwjuyoiwzomp` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tlfgayhaklkmadwyfhdmwppzrsplwkcoxlps` (`name`),
  KEY `idx_djldeizejicpbskculrwdfdylbevirlytlhg` (`handle`),
  KEY `idx_emvorgbvupdlscomjgtydgktupvuxgirruah` (`fieldLayoutId`),
  KEY `idx_asyqynflyuuxvsgaskmtnljcevfmwayiummn` (`dateDeleted`),
  CONSTRAINT `fk_mufrazjnhecngzahobbcjttwchrfejajdaxd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qmprcbxpsoeusvovcspkwubvkrrbcjaohwbq` (`userId`),
  CONSTRAINT `fk_yetzzdnkpczkkuuskiervpkwvhkqovoembzi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-07 11:26:29
-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (3,2,4,1,'japan_1289.jpg','image',NULL,660,660,13791,NULL,NULL,NULL,'2023-03-07 18:16:10','2023-03-07 18:16:10','2023-03-07 18:16:10'),(4,2,4,1,'brazil_1295.jpg','image',NULL,660,660,29861,NULL,NULL,NULL,'2023-03-07 18:16:10','2023-03-07 18:16:10','2023-03-07 18:16:10'),(5,2,4,1,'portugal3_1481.jpg','image',NULL,660,660,39234,NULL,NULL,NULL,'2023-03-07 18:16:10','2023-03-07 18:16:10','2023-03-07 18:16:10'),(6,2,4,1,'canada_1276.webp','image',NULL,660,660,4352,NULL,NULL,NULL,'2023-03-07 18:16:11','2023-03-07 18:16:11','2023-03-07 18:16:11'),(7,2,4,1,'greece_1280.jpg','image',NULL,660,660,22736,NULL,NULL,NULL,'2023-03-07 18:16:11','2023-03-07 18:16:11','2023-03-07 18:16:11'),(8,2,4,1,'mexico_1311.jpg','image',NULL,660,660,27944,NULL,NULL,NULL,'2023-03-07 18:16:11','2023-03-07 18:16:11','2023-03-07 18:16:11'),(9,2,4,1,'turkey_1274.jpg','image',NULL,660,660,19424,NULL,NULL,NULL,'2023-03-07 18:16:11','2023-03-07 18:16:11','2023-03-07 18:16:11'),(10,2,4,1,'spain2_1509.jpg','image',NULL,660,660,33567,NULL,NULL,NULL,'2023-03-07 18:16:11','2023-03-07 18:16:11','2023-03-07 18:16:11'),(11,2,4,1,'france_1244.jpg','image',NULL,660,660,12644,NULL,NULL,NULL,'2023-03-07 18:16:12','2023-03-07 18:16:12','2023-03-07 18:16:12'),(12,2,4,1,'australia_1304.jpg','image',NULL,660,660,34314,NULL,NULL,NULL,'2023-03-07 18:16:12','2023-03-07 18:16:12','2023-03-07 18:16:12'),(35,1,1,1,'limbo.png','image',NULL,512,512,14448,NULL,0,0,'2023-03-07 18:29:58','2023-03-07 18:29:58','2023-03-07 18:29:58'),(115,1,1,1,'limbo-competitor-04.svg','image',NULL,449,449,19614,NULL,NULL,NULL,'2023-03-14 15:37:42','2023-03-14 15:37:42','2023-03-14 15:37:42'),(116,1,1,1,'limbo-competitor-05.svg','image',NULL,449,449,17080,NULL,NULL,NULL,'2023-03-14 15:37:42','2023-03-14 15:37:42','2023-03-14 15:37:42'),(117,1,1,1,'limbo-competitor-03.svg','image',NULL,449,449,19911,NULL,NULL,NULL,'2023-03-14 15:37:42','2023-03-14 15:37:43','2023-03-14 15:37:43'),(118,1,1,1,'limbo-competitor-02.svg','image',NULL,449,449,19778,NULL,NULL,NULL,'2023-03-14 15:37:43','2023-03-14 15:37:43','2023-03-14 15:37:43'),(119,1,1,1,'limbo-competitor-08.svg','image',NULL,449,449,25172,NULL,NULL,NULL,'2023-03-14 15:37:43','2023-03-14 15:37:43','2023-03-14 15:37:43'),(120,1,1,1,'limbo-competitor-09.svg','image',NULL,449,449,15446,NULL,NULL,NULL,'2023-03-14 15:37:43','2023-03-14 15:37:43','2023-03-14 15:37:43'),(121,1,1,1,'limbo-competitor-10.svg','image',NULL,449,449,20344,NULL,NULL,NULL,'2023-03-14 15:37:43','2023-03-14 15:37:43','2023-03-14 15:37:43'),(122,1,1,1,'limbo-competitor-07.svg','image',NULL,449,449,16830,NULL,NULL,NULL,'2023-03-14 15:37:43','2023-03-14 15:37:44','2023-03-14 15:37:44'),(123,1,1,1,'limbo-competitor-01.svg','image',NULL,449,449,19816,NULL,NULL,NULL,'2023-03-14 15:37:44','2023-03-14 15:37:44','2023-03-14 15:37:44'),(124,1,1,1,'limbo-competitor-06.svg','image',NULL,449,449,17132,NULL,NULL,NULL,'2023-03-14 15:37:44','2023-03-14 15:37:44','2023-03-14 15:37:44');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'fullName','2023-03-07 18:04:04',0,1),(2,1,'postDate','2023-03-07 18:17:39',0,1),(2,1,'slug','2023-03-07 18:08:51',0,1),(2,1,'title','2023-03-07 18:08:51',0,1),(14,1,'postDate','2023-03-07 18:18:26',0,1),(14,1,'slug','2023-03-07 18:18:18',0,1),(14,1,'title','2023-03-07 18:18:18',0,1),(16,1,'postDate','2023-03-07 18:18:34',0,1),(16,1,'slug','2023-03-07 18:18:30',0,1),(16,1,'title','2023-03-07 18:18:30',0,1),(18,1,'postDate','2023-03-07 18:18:41',0,1),(18,1,'slug','2023-03-07 18:18:41',0,1),(18,1,'title','2023-03-07 18:18:41',0,1),(20,1,'postDate','2023-03-07 18:19:04',0,1),(20,1,'slug','2023-03-07 18:18:48',0,1),(20,1,'title','2023-03-07 18:18:48',0,1),(23,1,'postDate','2023-03-07 18:19:17',0,1),(23,1,'slug','2023-03-07 18:19:16',0,1),(23,1,'title','2023-03-07 18:19:16',0,1),(25,1,'postDate','2023-03-07 18:19:26',0,1),(25,1,'slug','2023-03-07 18:19:25',0,1),(25,1,'title','2023-03-07 18:19:25',0,1),(27,1,'postDate','2023-03-07 18:19:34',0,1),(27,1,'slug','2023-03-07 18:19:34',0,1),(27,1,'title','2023-03-07 18:19:34',0,1),(29,1,'postDate','2023-03-07 18:19:41',0,1),(29,1,'slug','2023-03-07 18:19:41',0,1),(29,1,'title','2023-03-07 18:19:41',0,1),(32,1,'postDate','2023-03-07 18:19:58',0,1),(32,1,'slug','2023-03-07 18:19:56',0,1),(32,1,'title','2023-03-07 18:19:56',0,1),(34,1,'enabled','2023-03-14 23:50:04',0,1),(34,1,'postDate','2023-03-07 18:30:08',0,1),(34,1,'slug','2023-03-07 18:20:10',0,1),(34,1,'title','2023-03-07 18:20:10',0,1),(37,1,'postDate','2023-03-07 18:30:24',0,1),(37,1,'slug','2023-03-07 18:30:18',0,1),(37,1,'title','2023-03-07 18:30:18',0,1),(40,1,'postDate','2023-03-07 18:30:40',0,1),(40,1,'slug','2023-03-07 18:30:33',0,1),(40,1,'title','2023-03-07 18:30:33',0,1),(42,1,'postDate','2023-03-07 18:31:00',0,1),(42,1,'slug','2023-03-07 18:30:57',0,1),(42,1,'title','2023-03-14 23:49:24',0,1),(44,1,'postDate','2023-03-07 18:31:15',0,1),(44,1,'slug','2023-03-07 18:31:09',0,1),(44,1,'title','2023-03-07 18:31:09',0,1),(46,1,'postDate','2023-03-07 18:31:44',0,1),(46,1,'slug','2023-03-07 18:31:36',0,1),(46,1,'title','2023-03-07 18:31:36',0,1),(48,1,'postDate','2023-03-07 18:32:06',0,1),(48,1,'slug','2023-03-07 18:34:39',0,1),(48,1,'title','2023-03-07 18:34:32',0,1),(50,1,'postDate','2023-03-07 18:32:46',0,1),(50,1,'slug','2023-03-07 18:32:39',0,1),(50,1,'title','2023-03-07 18:32:39',0,1),(53,1,'postDate','2023-03-07 18:34:14',0,1),(53,1,'slug','2023-03-07 18:34:11',0,1),(53,1,'title','2023-03-07 18:34:11',0,1),(55,1,'postDate','2023-03-07 18:35:34',0,1),(55,1,'slug','2023-03-07 18:35:28',0,1),(55,1,'title','2023-03-07 18:35:28',0,1),(99,1,'enabled','2023-03-07 22:50:52',0,1),(99,1,'postDate','2023-03-07 22:49:57',0,1),(99,1,'slug','2023-03-07 22:49:35',0,1),(99,1,'title','2023-03-07 22:50:33',0,1),(176,1,'postDate','2023-07-07 08:27:58',0,1),(176,1,'slug','2023-07-07 08:27:56',0,1),(176,1,'title','2023-07-07 08:27:56',0,1),(178,1,'slug','2023-07-07 08:28:03',0,1),(178,1,'title','2023-07-07 08:28:03',0,1),(180,1,'postDate','2023-07-07 08:28:14',0,1),(180,1,'slug','2023-07-07 08:28:14',0,1),(180,1,'title','2023-07-07 08:35:15',0,1),(182,1,'postDate','2023-07-07 08:28:22',0,1),(182,1,'slug','2023-07-07 08:28:22',0,1),(182,1,'title','2023-07-07 08:28:22',0,1),(184,1,'postDate','2023-07-07 08:29:47',0,1),(184,1,'slug','2023-07-07 08:29:44',0,1),(184,1,'title','2023-07-07 08:30:22',0,1),(189,1,'postDate','2023-07-07 08:30:45',0,1),(189,1,'slug','2023-07-07 08:30:44',0,1),(189,1,'title','2023-07-07 08:30:44',0,1),(191,1,'postDate','2023-07-07 08:31:01',0,1),(191,1,'slug','2023-07-07 08:31:00',0,1),(191,1,'title','2023-07-07 08:31:00',0,1),(193,1,'postDate','2023-07-07 08:31:27',0,1),(193,1,'slug','2023-07-07 08:31:26',0,1),(193,1,'title','2023-07-07 08:31:26',0,1),(195,1,'postDate','2023-07-07 08:31:58',0,1),(195,1,'slug','2023-07-07 08:31:57',0,1),(195,1,'title','2023-07-07 08:31:57',0,1),(197,1,'postDate','2023-07-07 08:32:12',0,1),(197,1,'slug','2023-07-07 08:32:11',0,1),(197,1,'title','2023-07-07 08:32:11',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (34,1,5,'2023-07-07 08:20:20',0,NULL),(37,1,5,'2023-07-07 08:20:20',0,NULL),(40,1,5,'2023-07-07 08:20:20',0,NULL),(42,1,5,'2023-07-07 08:20:20',0,NULL),(44,1,5,'2023-07-07 08:20:20',0,NULL),(46,1,5,'2023-07-07 08:20:20',0,NULL),(48,1,5,'2023-07-07 08:20:20',0,NULL),(50,1,5,'2023-07-07 08:20:20',0,NULL),(53,1,5,'2023-07-07 08:20:20',0,NULL),(55,1,5,'2023-07-07 08:20:20',0,NULL),(99,1,5,'2023-07-07 08:20:20',0,NULL),(176,1,5,'2023-07-07 08:35:43',0,1),(178,1,5,'2023-07-07 08:37:16',0,1),(180,1,5,'2023-07-07 08:35:15',0,1),(182,1,5,'2023-07-07 08:33:45',0,1),(184,1,5,'2023-07-07 08:36:40',0,1),(189,1,5,'2023-07-07 08:34:13',0,1),(191,1,5,'2023-07-07 08:32:55',0,1),(193,1,5,'2023-07-07 08:36:10',0,1),(195,1,5,'2023-07-07 08:34:39',0,1),(197,1,5,'2023-07-07 08:33:21',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2023-02-02 05:28:23','2023-03-07 18:04:04','e5f6e318-4d9f-4ce0-9c87-be98e1bd6559',NULL),(2,2,1,'Greece','2023-03-07 18:07:27','2023-03-07 18:17:39','b85db902-6ba1-42ff-8cd6-19ba547513f9',NULL),(3,3,1,'Japan 1289','2023-03-07 18:16:10','2023-03-07 18:16:10','9a7a2296-7fde-4b79-9936-68b7305af5db',NULL),(4,4,1,'Brazil 1295','2023-03-07 18:16:10','2023-03-07 18:16:10','8b621ff0-d846-43d5-a90b-3cb1d8279f77',NULL),(5,5,1,'Portugal3 1481','2023-03-07 18:16:10','2023-03-07 18:16:10','5db3a662-7b44-41bb-8948-b1abba29718d',NULL),(6,6,1,'Canada 1276','2023-03-07 18:16:10','2023-03-07 18:16:10','1a27c2ef-733c-46b4-a0e5-7c1902fa6138',NULL),(7,7,1,'Greece 1280','2023-03-07 18:16:11','2023-03-07 18:16:11','047339eb-c861-4288-b81e-7a71efae7631',NULL),(8,8,1,'Mexico 1311','2023-03-07 18:16:11','2023-03-07 18:16:11','89f6b8f5-612a-46c3-9e4a-c448036b61ed',NULL),(9,9,1,'Turkey 1274','2023-03-07 18:16:11','2023-03-07 18:16:11','f3ae2b10-9fbf-4555-965b-df7f2c75ee13',NULL),(10,10,1,'Spain2 1509','2023-03-07 18:16:11','2023-03-07 18:16:11','03e2ddd3-1c43-4f22-bf32-16c63edb4087',NULL),(11,11,1,'France 1244','2023-03-07 18:16:12','2023-03-07 18:16:12','f00aa31e-8742-425f-9dee-d758dae4f531',NULL),(12,12,1,'Australia 1304','2023-03-07 18:16:12','2023-03-07 18:16:12','72074281-648e-4e4b-ab1c-8e107524defa',NULL),(13,13,1,'Greece','2023-03-07 18:17:39','2023-03-07 18:17:39','e8a1a8b2-419c-49b2-8e56-d935dcf566b2',NULL),(14,14,1,'Brazil','2023-03-07 18:18:14','2023-03-07 18:18:26','c91063fb-5a07-48d0-ac7a-7aef7dfc1881',NULL),(15,15,1,'Brazil','2023-03-07 18:18:26','2023-03-07 18:18:26','4f25f4fe-b7c7-49b6-b42e-d58afa89734b',NULL),(16,16,1,'Australia','2023-03-07 18:18:26','2023-03-07 18:18:34','d1694ab4-a375-47c8-9d6d-35db316c6dec',NULL),(17,17,1,'Australia','2023-03-07 18:18:34','2023-03-07 18:18:34','dd1b6adc-a60e-42a6-9a49-e802a377f05b',NULL),(18,18,1,'France','2023-03-07 18:18:34','2023-03-07 18:18:41','cbe71500-8cb1-4f6c-ac9f-d05152ab2059',NULL),(19,19,1,'France','2023-03-07 18:18:41','2023-03-07 18:18:41','c2169142-ac46-49db-9f93-818812cdb984',NULL),(20,20,1,'Mexico','2023-03-07 18:18:41','2023-03-07 18:19:06','1a856ada-b566-4b42-9af1-35444823012f',NULL),(21,21,1,'Mexico','2023-03-07 18:19:04','2023-03-07 18:19:04','d7af4b28-8bbc-43c4-8196-6ce3618b7f4c',NULL),(22,22,1,'Mexico','2023-03-07 18:19:06','2023-03-07 18:19:06','11626a77-187b-4cf1-8989-97ea8c194ddf',NULL),(23,23,1,'Spain','2023-03-07 18:19:06','2023-03-07 18:19:17','7d08cfbd-9cb8-4016-a98d-9e164997221e',NULL),(24,24,1,'Spain','2023-03-07 18:19:17','2023-03-07 18:19:17','4459cc01-c73c-4360-85a3-b917cd534c63',NULL),(25,25,1,'Japan','2023-03-07 18:19:17','2023-03-07 18:19:26','a1547b27-dd6d-4e7e-8e53-1011249099f9',NULL),(26,26,1,'Japan','2023-03-07 18:19:26','2023-03-07 18:19:26','4b0bd6a7-ad2f-4519-91f5-b8f513e90d9e',NULL),(27,27,1,'Portugal','2023-03-07 18:19:26','2023-03-07 18:19:34','1a385194-8473-4c1d-8b7a-a01aaf156c1f',NULL),(28,28,1,'Portugal','2023-03-07 18:19:34','2023-03-07 18:19:34','f5e6cf5d-b8a3-48f4-96a9-b2c721b0a95b',NULL),(29,29,1,'Canada','2023-03-07 18:19:34','2023-03-07 18:19:42','199b6191-b446-4697-871b-c32aaedb04a5',NULL),(30,30,1,'Canada','2023-03-07 18:19:42','2023-03-07 18:19:42','530c7cf0-7a8f-4637-841f-0313a6489f08',NULL),(31,31,1,NULL,'2023-03-07 18:19:42','2023-03-07 18:19:42','174a0e5c-c434-4969-9c7d-0c5c67da9a8a',NULL),(32,32,1,'Turkey','2023-03-07 18:19:47','2023-03-07 18:19:58','507c87ea-0295-4db6-976d-00b4b320f108',NULL),(33,33,1,'Turkey','2023-03-07 18:19:58','2023-03-07 18:19:58','a1f89fe6-8ff8-4c92-b05a-1b75af258f68',NULL),(34,34,1,'Clare Ellis','2023-03-07 18:20:06','2023-07-07 08:20:20','aa1a5542-3ba6-48f8-bffd-852c6d0fca4b',NULL),(35,35,1,'Limbo','2023-03-07 18:29:57','2023-03-07 18:29:57','a44d2ab0-0f34-4e64-b0d7-db7acfb66109',NULL),(36,36,1,'Clare Ellis','2023-03-07 18:30:08','2023-07-07 08:18:49','de3e45a8-7ebc-4589-8e4b-11a5b51cc4bf',NULL),(37,37,1,'Cole Carr','2023-03-07 18:30:08','2023-07-07 08:20:20','f77a5078-e010-4080-a925-17d68883feba',NULL),(38,38,1,'Cole Carr','2023-03-07 18:30:24','2023-07-07 08:18:49','d107a884-79cc-421d-a5ab-6496cc052059',NULL),(39,39,1,'Cole Carr','2023-03-07 18:30:26','2023-07-07 08:18:49','01218426-fcde-42ea-aff6-de4a64bd07d7',NULL),(40,40,1,'Richard Pacheco','2023-03-07 18:30:26','2023-07-07 08:20:20','a8584aa3-6979-4369-8739-64b7d6e7f6c9',NULL),(41,41,1,'Richard Pacheco','2023-03-07 18:30:40','2023-07-07 08:18:49','cf259111-3eec-4747-bd2d-dda2e4b41ef4',NULL),(42,42,1,'Bryson Sanchez','2023-03-07 18:30:40','2023-07-07 08:20:20','124434ca-d206-4884-9307-de115c5b7cf2',NULL),(43,43,1,'Bryson Sanchez','2023-03-07 18:31:00','2023-07-07 08:18:49','943ca2cb-487c-4f74-becf-e29bb5208b10',NULL),(44,44,1,'Mekhi Roman','2023-03-07 18:31:00','2023-07-07 08:20:20','4f81a0e0-a27d-4618-b215-1c53b17b55f1',NULL),(45,45,1,'Mekhi Roman','2023-03-07 18:31:15','2023-07-07 08:18:49','ce06dfd5-d51f-4a89-b32b-e9ade96c5a8f',NULL),(46,46,1,'Izaiah Cruz','2023-03-07 18:31:15','2023-07-07 08:20:20','4f702284-b921-4729-a936-d0e7345689a7',NULL),(47,47,1,'Izaiah Cruz','2023-03-07 18:31:44','2023-07-07 08:18:49','04aabf04-657a-40df-9a38-3c2012c085a4',NULL),(48,48,1,'Omar Durham','2023-03-07 18:31:44','2023-07-07 08:20:20','d17302ea-57bb-4ae3-a8f2-10590222c6bc',NULL),(49,49,1,'Mohammad Durham','2023-03-07 18:32:07','2023-07-07 08:18:49','369ca6dd-2e83-4048-a564-72b6fafff045',NULL),(50,50,1,'Simone Munoz','2023-03-07 18:32:07','2023-07-07 08:20:20','315b7426-32b5-41d0-920a-7e80fe837444',NULL),(51,51,1,'Simone Munoz','2023-03-07 18:32:46','2023-07-07 08:18:49','e35e5549-67ac-4b7f-b665-877ec2afaf6b',NULL),(52,52,1,NULL,'2023-03-07 18:32:46','2023-07-07 08:18:49','d6545d0b-ef1f-4130-9127-a298af108133',NULL),(53,53,1,'Beau Prince','2023-03-07 18:33:48','2023-07-07 08:20:20','1cabde6e-4fec-4afa-a751-14dc470a36d5',NULL),(54,54,1,'Beau Prince','2023-03-07 18:34:14','2023-07-07 08:18:49','638e0f08-b0b6-4b62-924c-c453c7322b39',NULL),(55,55,1,'Azalea Clay','2023-03-07 18:34:14','2023-07-07 08:20:20','1050202a-fdc6-4cf3-a26f-692e4732ffd9',NULL),(57,57,1,'Omar Durham','2023-03-07 18:34:32','2023-07-07 08:18:49','ae1ddac5-9f3e-4039-a6b5-0e702fde47f5',NULL),(59,59,1,'Omar Durham','2023-03-07 18:34:39','2023-07-07 08:18:49','6b20bd28-9088-4326-a8a3-13b12dbb68c0',NULL),(61,61,1,'Mekhi Roman','2023-03-07 18:34:56','2023-07-07 08:18:49','3535a726-7bdc-4355-a3be-f0c0b65d8055',NULL),(62,62,1,'Azalea Clay','2023-03-07 18:35:34','2023-07-07 08:18:49','7475b1a2-08e3-4d0c-96e5-22a0dfeedf71',NULL),(63,63,1,NULL,'2023-03-07 18:35:34','2023-07-07 08:18:49','a1f9588b-2f91-4ed1-a821-650964178ced',NULL),(65,65,1,'Mekhi Roman','2023-03-07 18:43:56','2023-07-07 08:18:49','011b7e5e-b50f-4ed7-a049-c823e3b5fb5a',NULL),(67,67,1,'Azalea Clay','2023-03-07 18:45:37','2023-07-07 08:18:49','18161ee3-d49a-4b94-9571-fb4675a9b415',NULL),(69,69,1,'Beau Prince','2023-03-07 18:45:43','2023-07-07 08:18:49','a23624fb-b33b-448b-bfa5-c30c410e6197',NULL),(71,71,1,'Bryson Sanchez','2023-03-07 18:45:48','2023-07-07 08:18:49','f3180832-e9a3-4b26-8b99-64cd692e4496',NULL),(73,73,1,'Clare Ellis','2023-03-07 18:45:54','2023-07-07 08:18:49','995bb2c3-c5c6-4bb1-a527-3b1d339c1d6e',NULL),(75,75,1,'Cole Carr','2023-03-07 18:46:01','2023-07-07 08:18:49','0cf11928-96eb-4054-a0fe-800decf74572',NULL),(77,77,1,'Izaiah Cruz','2023-03-07 18:46:11','2023-07-07 08:18:49','f232a85c-0213-406d-a48e-8af090d63628',NULL),(79,79,1,'Mekhi Roman','2023-03-07 18:46:16','2023-07-07 08:18:49','de44b464-87b1-448e-9f58-07b9ef985702',NULL),(81,81,1,'Omar Durham','2023-03-07 18:46:21','2023-07-07 08:18:49','8b401ee6-677a-45cd-af96-769bbbd63730',NULL),(83,83,1,'Richard Pacheco','2023-03-07 18:46:29','2023-07-07 08:18:49','727e40a5-c2bd-4094-8cbe-686eb0ec3499',NULL),(85,85,1,'Simone Munoz','2023-03-07 18:46:34','2023-07-07 08:18:49','ea043508-1f80-43d0-91a4-fdaa3e6d876f',NULL),(88,88,1,'Izaiah Cruz','2023-03-07 18:47:41','2023-07-07 08:18:49','16bd0be2-4f39-4d67-9e87-2494296077c4',NULL),(89,89,1,'Simone Munoz','2023-03-07 18:47:50','2023-07-07 08:18:49','c61c2a58-c6ea-4a09-a056-caadc376dccb',NULL),(91,91,1,'Bryson Sanchez','2023-03-07 18:48:02','2023-07-07 08:18:49','7e8d5098-93ba-4e1d-8226-d3a788e33c4d',NULL),(92,92,1,'Azalea Clay','2023-03-07 18:48:08','2023-07-07 08:18:49','309ae4e7-e84a-421c-b009-48fd6fdd4602',NULL),(94,94,1,'Clare Ellis','2023-03-07 18:48:14','2023-07-07 08:18:49','3b37edb6-0c8e-46f1-b4ed-a97a088983a5',NULL),(96,96,1,'Cole Carr','2023-03-07 18:48:19','2023-07-07 08:18:49','e4cfe631-17d4-408c-abca-9a8b0181a56c',NULL),(98,98,1,'Simone Munoz','2023-03-07 21:50:58','2023-07-07 08:18:49','02a450cf-6555-43f7-826e-2cf646fb5629',NULL),(99,99,1,'Sub Prime','2023-03-07 22:48:57','2023-07-07 08:20:20','a8c3c028-0337-45a0-b4cc-7fdf448934db',NULL),(100,100,1,'Substitute Prime','2023-03-07 22:49:57','2023-07-07 08:18:49','0e6e872c-3b56-4661-b9af-88229e1bf4ee',NULL),(101,101,1,'Sub Prime','2023-03-07 22:50:33','2023-07-07 08:18:49','a339a2e2-06b9-4e8c-a8d5-65fafa232bf6',NULL),(102,102,1,'Sub Prime','2023-03-07 22:50:40','2023-07-07 08:18:49','2e827652-c51e-4f7a-a302-88e1244dc7a9',NULL),(103,103,1,'Sub Prime','2023-03-07 22:50:51','2023-07-07 08:18:49','28394614-b723-4d57-908e-41dd6b955d53',NULL),(110,110,1,NULL,'2023-03-07 22:52:59','2023-07-07 08:18:49','54597636-53cd-4e1f-8898-375c01057d26',NULL),(112,112,1,'Cole Carr','2023-03-07 22:54:34','2023-07-07 08:18:49','836e8397-d2ea-402b-944d-270fc72c320b',NULL),(114,114,1,'Sub Prime','2023-03-07 22:54:50','2023-07-07 08:18:49','b8b2d5d9-c154-4744-886c-220a3eea732e',NULL),(115,115,1,'Limbo competitor 04','2023-03-14 15:37:42','2023-03-14 15:37:42','7b18b368-2862-4f51-8106-32363f485f05',NULL),(116,116,1,'Limbo competitor 05','2023-03-14 15:37:42','2023-03-14 15:37:42','12516b75-d854-46b2-9915-4d1190b4714c',NULL),(117,117,1,'Limbo competitor 03','2023-03-14 15:37:42','2023-03-14 15:37:42','4e28c522-1ad0-4f9d-a71b-fb1556806a68',NULL),(118,118,1,'Limbo competitor 02','2023-03-14 15:37:43','2023-03-14 15:37:43','78c8946b-448a-4775-9f1f-20307df9952b',NULL),(119,119,1,'Limbo competitor 08','2023-03-14 15:37:43','2023-03-14 15:37:43','edf8fd72-8c2b-477c-8a03-7bc1e5162e9a',NULL),(120,120,1,'Limbo competitor 09','2023-03-14 15:37:43','2023-03-14 15:37:43','ad620433-f6ff-4723-a931-be37f88b32ae',NULL),(121,121,1,'Limbo competitor 10','2023-03-14 15:37:43','2023-03-14 15:37:43','14c6f3f1-7252-4c55-9af4-549406d41738',NULL),(122,122,1,'Limbo competitor 07','2023-03-14 15:37:43','2023-03-14 15:37:43','b659a215-ca8c-4600-88de-a8e39031e582',NULL),(123,123,1,'Limbo competitor 01','2023-03-14 15:37:44','2023-03-14 15:37:44','5d59bd8d-e94a-460b-abeb-5c2e1cc628e8',NULL),(124,124,1,'Limbo competitor 06','2023-03-14 15:37:44','2023-03-14 15:37:44','a7afe9c5-ff4b-4423-992c-3c824ec8157b',NULL),(126,126,1,'Izaiah Cruz','2023-03-14 15:39:17','2023-07-07 08:18:49','9992704b-a605-4cf0-9af0-e214b9ea9c9c',NULL),(127,127,1,'Mekhi Roman','2023-03-14 15:39:29','2023-07-07 08:18:50','e13de115-b8ae-4b4b-94d6-a4ae1cc0c5a3',NULL),(129,129,1,'Simone Munoz','2023-03-14 15:39:35','2023-07-07 08:18:50','ad371b84-28b4-4fd2-bcbb-2becb8bc1bb8',NULL),(131,131,1,'Omar Durham','2023-03-14 15:39:43','2023-07-07 08:18:50','6fcae3c0-67f7-46fc-a15d-bdabef66c80b',NULL),(133,133,1,'Bryson Sanchez','2023-03-14 15:39:55','2023-07-07 08:18:50','178625e3-1536-41de-bd7f-999e766665c1',NULL),(135,135,1,'Richard Pacheco','2023-03-14 15:40:08','2023-07-07 08:18:50','5b957fca-76e7-4762-94f7-78274c5802f2',NULL),(137,137,1,'Cole Carr','2023-03-14 15:40:28','2023-07-07 08:18:50','5c9f355e-95e9-40a3-b9fd-d5da881a8e5d',NULL),(139,139,1,'Azalea Clay','2023-03-14 15:40:39','2023-07-07 08:18:50','07b5d063-6b75-486b-98b6-03fe6eeb3df3',NULL),(141,141,1,'Beau Prince','2023-03-14 15:40:47','2023-07-07 08:18:50','ba30a6fb-c866-46fe-842a-6b07fe30e95b',NULL),(143,143,1,'Clare Ellis','2023-03-14 15:40:55','2023-07-07 08:18:50','bb14f653-104c-4a04-ab96-b765b8c962dd',NULL),(145,145,1,'Mekhi Roman','2023-03-14 16:12:02','2023-07-07 08:18:50','ae2d733c-ab49-4b9a-8832-c53ad2660faf',NULL),(148,148,1,'Clare Ellis','2023-03-14 23:47:44','2023-07-07 08:18:50','626024b5-bb52-4f41-bf9b-2b2e76da7238',NULL),(149,149,1,'Izaiah Cruz','2023-03-14 23:49:06','2023-07-07 08:18:50','55d4885e-121b-4bb8-bc3d-afb5ee486e99',NULL),(151,151,1,'Mekhi Roman','2023-03-14 23:49:11','2023-07-07 08:18:50','e9de59e0-b49c-4d04-9d69-2578732d71c0',NULL),(153,153,1,'Simone Munoz','2023-03-14 23:49:17','2023-07-07 08:18:50','86238c58-7da8-459a-9d38-87fbeb1752a9',NULL),(155,155,1,'Bryson Sanchez','2023-03-14 23:49:24','2023-07-07 08:18:50','a1163606-9174-45d0-8321-c32dee10b6be',NULL),(156,156,1,'Omar Durham','2023-03-14 23:49:29','2023-07-07 08:18:50','b6443d01-e8b2-4d91-89b3-d703c6126db2',NULL),(157,157,1,'Cole Carr','2023-03-14 23:49:34','2023-07-07 08:18:50','573a4447-ee12-4084-a43f-daf1df96f55a',NULL),(158,158,1,'Richard Pacheco','2023-03-14 23:49:39','2023-07-07 08:18:50','a5873674-30b9-402d-a248-26db260c8007',NULL),(159,159,1,'Azalea Clay','2023-03-14 23:49:43','2023-07-07 08:18:50','a07d57ca-4802-4843-9c0a-63afb3e73982',NULL),(160,160,1,'Beau Prince','2023-03-14 23:49:54','2023-07-07 08:18:50','ee4b1445-e084-4394-9d8f-cedb9109e53e',NULL),(162,162,1,'Clare Ellis','2023-03-14 23:50:04','2023-07-07 08:18:50','b66d89cb-1e9e-4016-93e0-f1eabfbb94d7',NULL),(163,163,1,'Sub Prime','2023-03-14 23:50:09','2023-07-07 08:18:50','c9f99659-4f79-4ac9-b3af-9a428c29cf95',NULL),(164,164,1,'Simone Munoz','2023-03-14 23:52:36','2023-07-07 08:18:50','3d35a9d2-eb94-4a72-84bb-8d3a46ed1c6c',NULL),(165,165,1,'Izaiah Cruz','2023-03-14 23:52:48','2023-07-07 08:18:50','d5c41e9d-2bc1-488b-82c3-b45dee1e4d17',NULL),(166,166,1,'Mekhi Roman','2023-03-14 23:52:55','2023-07-07 08:18:50','c09eed00-bd24-4caa-ac81-138a72877038',NULL),(167,167,1,'Simone Munoz','2023-03-14 23:53:00','2023-07-07 08:18:50','fe270cc3-9ed6-4078-ac5c-d97dc69c8687',NULL),(168,168,1,'Bryson Sanchez','2023-03-14 23:53:05','2023-07-07 08:18:50','7707855e-ef26-491d-ac03-642914d3ffcd',NULL),(169,169,1,'Bryson Sanchez','2023-03-14 23:53:10','2023-07-07 08:18:50','b19433a8-e2b6-4a04-b57e-db9e6173ce52',NULL),(170,170,1,'Omar Durham','2023-03-14 23:53:17','2023-07-07 08:18:50','fa292f43-0e17-43c3-8889-31d0c7537bbd',NULL),(171,171,1,'Izaiah Cruz','2023-03-14 23:55:00','2023-07-07 08:18:50','527b0c01-a611-458d-ae03-1e443da9613b',NULL),(173,173,1,'Mekhi Roman','2023-03-14 23:55:18','2023-07-07 08:18:50','f550f1ae-55f9-4da8-8b22-c5519e6e71a3',NULL),(175,175,1,'Mekhi Roman','2023-03-14 23:55:32','2023-07-07 08:18:50','f3695a60-9306-45ca-a6fd-3c48ceb51fab',NULL),(176,176,1,'Razzle Dazzle','2023-07-07 08:27:51','2023-07-07 08:35:43','ebe34d6e-b27d-4db0-81c0-84529f70593a','[{\"col1\":\"2023-07-16 07:00:00\",\"col2\":\"2023-07-08 03:30:00\"},{\"col1\":\"2023-08-13 07:00:00\",\"col2\":\"2023-07-08 03:30:00\"}]'),(177,177,1,'Razzle Dazzle','2023-07-07 08:27:58','2023-07-07 08:27:58','2a8c4471-b968-44d0-943d-565e113451ec','[{\"col1\":null,\"col2\":null}]'),(178,178,1,'Untamed Night','2023-07-07 08:28:00','2023-07-07 08:37:16','2d8277dc-905a-4b53-9da9-b95809e5ac47','[{\"col1\":\"2023-07-29 07:00:00\",\"col2\":\"2023-07-08 06:00:00\"},{\"col1\":\"2023-08-26 07:00:00\",\"col2\":\"2023-07-08 06:00:00\"}]'),(179,179,1,'Untamed Night','2023-07-07 08:28:03','2023-07-07 08:28:03','eac77b8d-c198-4420-9c50-47efe0140e6e','[{\"col1\":null,\"col2\":null}]'),(180,180,1,'Thirsty Thursday','2023-07-07 08:28:05','2023-07-07 08:35:15','2e9b55de-f703-4897-834d-2772e528f434','[{\"col1\":\"2023-07-06 07:00:00\",\"col2\":\"2023-07-08 01:00:00\"},{\"col1\":\"2023-08-24 07:00:00\",\"col2\":\"2023-07-08 01:00:00\"}]'),(181,181,1,'Martinis at Midnight','2023-07-07 08:28:14','2023-07-07 08:28:14','091223db-8832-4f71-b2b5-341b9325d9c1','[{\"col1\":null,\"col2\":null}]'),(182,182,1,'Ghoul\'s Night Out','2023-07-07 08:28:17','2023-07-07 08:33:45','1cee4065-f1ad-47df-b454-d2bd47fe7bce','[{\"col1\":\"2023-07-15 07:00:00\",\"col2\":\"2023-07-07 07:00:00\"},{\"col1\":\"2023-08-15 07:00:00\",\"col2\":\"2023-07-07 07:00:00\"}]'),(183,183,1,'Ghoul\'s Night Out','2023-07-07 08:28:22','2023-07-07 08:28:22','e45108a1-e31f-47d5-a638-de57000454d7','[{\"col1\":null,\"col2\":null}]'),(184,184,1,'Ryan\'s Popsicle Party','2023-07-07 08:29:36','2023-07-07 08:36:40','794e3457-2ce4-4a0a-beae-c1e663001da0','[{\"col1\":\"2023-07-02 07:00:00\",\"col2\":\"2023-07-07 20:00:00\"},{\"col1\":\"2023-08-06 07:00:00\",\"col2\":\"2023-07-07 20:00:00\"}]'),(185,185,1,'Ryan\'s summerpool party','2023-07-07 08:29:47','2023-07-07 08:29:47','debb355a-2d0f-4475-b1e7-9071ebf7b636','[{\"col1\":null,\"col2\":null}]'),(186,186,1,NULL,'2023-07-07 08:30:04','2023-07-07 08:30:04','decae3bf-848b-49a9-9484-05e74b3864a0','[{\"col1\":null,\"col2\":null}]'),(188,188,1,'Ryan\'s Popsicle Party','2023-07-07 08:30:22','2023-07-07 08:30:22','a0d96ef2-d653-426b-8024-8d980b9e7bb1','[{\"col1\":null,\"col2\":null}]'),(189,189,1,'Go Fly Andrew\'s Kite','2023-07-07 08:30:35','2023-07-07 08:34:13','5e9df9d2-b5ec-4584-bd31-9c91f03ee6e4','[{\"col1\":\"2023-07-05 07:00:00\",\"col2\":\"2023-07-07 21:00:00\"},{\"col1\":\"2023-08-09 07:00:00\",\"col2\":\"2023-07-07 21:00:00\"}]'),(190,190,1,'Go Fly Andrew\'s Kite','2023-07-07 08:30:45','2023-07-07 08:30:45','2a2bfc5e-aa98-4ef3-b865-a2c1909f328c','[{\"col1\":null,\"col2\":null}]'),(191,191,1,'Ben\'s Big Shift','2023-07-07 08:30:56','2023-07-07 08:32:55','f9214d35-7620-4bd4-a64f-4b063e0d1f26','[{\"col1\":\"2023-07-10 07:00:00\",\"col2\":\"2023-07-08 03:00:00\"},{\"col1\":\"2023-08-10 07:00:00\",\"col2\":\"2023-07-08 03:00:00\"}]'),(192,192,1,'Ben\'s Big Shift','2023-07-07 08:31:01','2023-07-07 08:31:01','81b50dfe-5ebd-42dc-89aa-0b37c81f599f','[{\"col1\":null,\"col2\":null}]'),(193,193,1,'Rocking\' Rollick','2023-07-07 08:31:20','2023-07-07 08:36:10','9fcf9d4c-ef32-4bfc-a58b-d83b05bf143e','[{\"col1\":\"2023-07-10 07:00:00\",\"col2\":\"2023-07-07 17:00:00\"},{\"col1\":\"2023-08-21 07:00:00\",\"col2\":\"2023-07-07 17:00:00\"}]'),(194,194,1,'Rocking\' Rollick','2023-07-07 08:31:28','2023-07-07 08:31:28','8497bbde-b75d-4726-90a8-d061fda6dc05','[{\"col1\":null,\"col2\":null}]'),(195,195,1,'Martinis at Michael\'s','2023-07-07 08:31:47','2023-07-07 08:34:39','1b45bdbb-4ce6-4734-975d-dac338fe6b84','[{\"col1\":\"2023-07-22 07:00:00\",\"col2\":\"2023-07-08 04:00:00\"},{\"col1\":\"2023-08-19 07:00:00\",\"col2\":\"2023-07-08 04:00:00\"}]'),(196,196,1,'Martinis at Michael\'s','2023-07-07 08:31:58','2023-07-07 08:31:58','4067d24d-a911-4e59-9d81-d9398a0a06ba','[{\"col1\":null,\"col2\":null}]'),(197,197,1,'Booty Balooza','2023-07-07 08:32:05','2023-07-07 08:33:21','a6d9fafa-e84a-4f9c-b5c7-809ae3a51c0c','[{\"col1\":\"2023-07-01 07:00:00\",\"col2\":\"2023-07-07 23:00:00\"},{\"col1\":\"2023-08-01 07:00:00\",\"col2\":\"2023-07-07 23:00:00\"}]'),(198,198,1,'Booty Balooza','2023-07-07 08:32:12','2023-07-07 08:32:12','6ad05865-0052-4dd2-934e-7d30c33aff4b','[{\"col1\":null,\"col2\":null}]'),(200,200,1,'Ben\'s Big Shift','2023-07-07 08:32:55','2023-07-07 08:32:55','9f1c7b83-2bf3-41b4-84e1-37401f1adae8','[{\"col1\":\"2023-07-10 07:00:00\",\"col2\":\"2023-07-08 03:00:00\"},{\"col1\":\"2023-08-10 07:00:00\",\"col2\":\"2023-07-08 03:00:00\"}]'),(202,202,1,'Booty Balooza','2023-07-07 08:33:21','2023-07-07 08:33:21','df2df1f2-60b9-4c40-b94d-7f6a561245dd','[{\"col1\":\"2023-07-01 07:00:00\",\"col2\":\"2023-07-07 23:00:00\"},{\"col1\":\"2023-08-01 07:00:00\",\"col2\":\"2023-07-07 23:00:00\"}]'),(204,204,1,'Ghoul\'s Night Out','2023-07-07 08:33:45','2023-07-07 08:33:45','5c4948ef-401b-4f98-a8c0-bf22bc14e8e1','[{\"col1\":\"2023-07-15 07:00:00\",\"col2\":\"2023-07-07 07:00:00\"},{\"col1\":\"2023-08-15 07:00:00\",\"col2\":\"2023-07-07 07:00:00\"}]'),(206,206,1,'Go Fly Andrew\'s Kite','2023-07-07 08:34:13','2023-07-07 08:34:13','42bd0309-17d1-46f9-b98e-dd406bc73a57','[{\"col1\":\"2023-07-05 07:00:00\",\"col2\":\"2023-07-07 21:00:00\"},{\"col1\":\"2023-08-09 07:00:00\",\"col2\":\"2023-07-07 21:00:00\"}]'),(208,208,1,'Martinis at Michael\'s','2023-07-07 08:34:39','2023-07-07 08:34:39','719fe29b-b56f-4ce7-9bdb-d30083d3b3b3','[{\"col1\":\"2023-07-22 07:00:00\",\"col2\":\"2023-07-08 04:00:00\"},{\"col1\":\"2023-08-19 07:00:00\",\"col2\":\"2023-07-08 04:00:00\"}]'),(210,210,1,'Thirsty Thursday','2023-07-07 08:35:15','2023-07-07 08:35:15','7a4875f7-f495-4f98-ae63-48c99c7ccb45','[{\"col1\":\"2023-07-06 07:00:00\",\"col2\":\"2023-07-08 01:00:00\"},{\"col1\":\"2023-08-24 07:00:00\",\"col2\":\"2023-07-08 01:00:00\"}]'),(212,212,1,'Razzle Dazzle','2023-07-07 08:35:43','2023-07-07 08:35:43','e90ea0f1-f06b-4edb-bebf-96a8a2670ed6','[{\"col1\":\"2023-07-16 07:00:00\",\"col2\":\"2023-07-08 03:30:00\"},{\"col1\":\"2023-08-13 07:00:00\",\"col2\":\"2023-07-08 03:30:00\"}]'),(214,214,1,'Rocking\' Rollick','2023-07-07 08:36:10','2023-07-07 08:36:10','3e85947b-21b8-4d62-8466-56a5d3fc4094','[{\"col1\":\"2023-07-10 07:00:00\",\"col2\":\"2023-07-07 17:00:00\"},{\"col1\":\"2023-08-21 07:00:00\",\"col2\":\"2023-07-07 17:00:00\"}]'),(216,216,1,'Ryan\'s Popsicle Party','2023-07-07 08:36:40','2023-07-07 08:36:40','bb5d95e4-b3bc-4c81-b3df-f1608be0d49b','[{\"col1\":\"2023-07-02 07:00:00\",\"col2\":\"2023-07-07 20:00:00\"},{\"col1\":\"2023-08-06 07:00:00\",\"col2\":\"2023-07-07 20:00:00\"}]'),(218,218,1,'Untamed Night','2023-07-07 08:37:16','2023-07-07 08:37:16','92f9d7a8-fb52-4b9f-85fd-e906d47e2842','[{\"col1\":\"2023-07-29 07:00:00\",\"col2\":\"2023-07-08 06:00:00\"},{\"col1\":\"2023-08-26 07:00:00\",\"col2\":\"2023-07-08 06:00:00\"}]');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (10,NULL,1,0,'First draft',NULL,0,NULL,0),(20,NULL,1,0,'First draft',NULL,0,NULL,1),(26,NULL,1,0,'First draft',NULL,0,NULL,1),(48,NULL,1,0,'First draft',NULL,0,NULL,1),(67,46,1,1,'Draft 1','',1,NULL,1),(75,NULL,1,0,'First draft',NULL,0,NULL,0);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-02-02 05:28:23','2023-03-07 18:04:04',NULL,NULL,'cdb3b2a1-cb8b-4271-bc6c-01ff3c34bcfd'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:07:27','2023-03-07 18:17:39',NULL,'2023-07-07 08:18:28','bba388ac-1a58-4bc7-9ce7-ec6745d888ce'),(3,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:10','2023-03-07 18:16:10',NULL,NULL,'2ec63e93-6ff4-48f0-820c-124dc7384837'),(4,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:10','2023-03-07 18:16:10',NULL,NULL,'68c269c1-879a-44dd-9ce7-2e05ebac264a'),(5,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:10','2023-03-07 18:16:10',NULL,NULL,'d54c2dcb-0169-4db8-89d4-aea612979644'),(6,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:10','2023-03-07 18:16:10',NULL,NULL,'4309dcc2-0d00-45b1-bec5-20dfcb3430ae'),(7,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:11','2023-03-07 18:16:11',NULL,NULL,'18a21b2f-b698-4a16-a217-0987f7c536e1'),(8,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:11','2023-03-07 18:16:11',NULL,NULL,'e19c2db6-a20d-46e3-8951-ebb76f6b6625'),(9,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:11','2023-03-07 18:16:11',NULL,NULL,'c8517074-78a1-44bf-9122-4b98c7110ac0'),(10,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:11','2023-03-07 18:16:11',NULL,NULL,'d71964f5-50c5-4f30-935e-f1a445e6628a'),(11,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:12','2023-03-07 18:16:12',NULL,NULL,'bfeb0610-137f-4659-a03e-10c92e52a863'),(12,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:12','2023-03-07 18:16:12',NULL,NULL,'3c963bdb-36fb-410c-a22f-a7b521ef754e'),(13,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:17:39','2023-03-07 18:17:39',NULL,NULL,'d1f0b1d5-3bf5-4074-b9e4-aa37edb02344'),(14,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:14','2023-03-07 18:18:26',NULL,'2023-07-07 08:18:28','095d8073-ff4d-41ef-bb0d-dfc100aa9025'),(15,14,NULL,2,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:26','2023-03-07 18:18:26',NULL,NULL,'3112b722-794b-462a-8a78-0dda322092b9'),(16,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:26','2023-03-07 18:18:34',NULL,'2023-07-07 08:18:28','15c96258-439d-4399-9c88-89c97d45fec9'),(17,16,NULL,3,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:34','2023-03-07 18:18:34',NULL,NULL,'1abb9dc5-47dc-418a-8070-94ca1a964058'),(18,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:34','2023-03-07 18:18:41',NULL,'2023-07-07 08:18:28','8d2fcdcc-3805-4fad-818c-baee0ed5b5f8'),(19,18,NULL,4,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:41','2023-03-07 18:18:41',NULL,NULL,'4e4f34b1-6f3b-4542-b6ac-d37ceae4a932'),(20,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:41','2023-03-07 18:19:06',NULL,'2023-07-07 08:18:28','6ce8d3dd-4312-4242-9c09-43659410e44b'),(21,20,NULL,5,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:04','2023-03-07 18:19:04',NULL,NULL,'70d200e3-3223-4ae9-944b-c836a492e620'),(22,20,NULL,6,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:06','2023-03-07 18:19:06',NULL,NULL,'0ca5be92-1458-44f5-9f88-8bdc151b9039'),(23,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:06','2023-03-07 18:19:17',NULL,'2023-07-07 08:18:28','6d69ebd1-916a-4fb2-8bcc-fb049aa5eb5d'),(24,23,NULL,7,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:17','2023-03-07 18:19:17',NULL,NULL,'67207b9f-5f5c-48f8-a775-b6fc5224d241'),(25,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:17','2023-03-07 18:19:26',NULL,'2023-07-07 08:18:28','b4e1ddd3-07aa-42db-b33b-fefe22e95da9'),(26,25,NULL,8,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:26','2023-03-07 18:19:26',NULL,NULL,'7932784b-95a6-4e89-9fc5-39c47da511a7'),(27,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:26','2023-03-07 18:19:34',NULL,'2023-07-07 08:18:28','bf9ddc0b-c1a2-4f1e-a582-959d8faf0259'),(28,27,NULL,9,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:34','2023-03-07 18:19:34',NULL,NULL,'1988ed8d-4531-4a10-9cba-440c1d7dc81d'),(29,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:34','2023-03-07 18:19:42',NULL,'2023-07-07 08:18:28','1ebd98e1-e580-44fb-b576-772f727f9fa8'),(30,29,NULL,10,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:42','2023-03-07 18:19:42',NULL,NULL,'97490613-6326-44ff-a74e-e52f493ce922'),(31,NULL,10,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:42','2023-03-07 18:19:42',NULL,'2023-07-07 08:18:28','3a9bcc1a-2d65-4123-909a-b72bda8ec685'),(32,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:47','2023-03-07 18:19:58',NULL,'2023-07-07 08:18:28','25c6d7fa-03ba-446c-89ee-853d359e3849'),(33,32,NULL,11,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:58','2023-03-07 18:19:58',NULL,NULL,'a9a457ad-6609-4f83-90e3-28d21fc1b69c'),(34,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:20:06','2023-03-14 23:50:04',NULL,'2023-07-07 08:22:32','8a6b4532-5d75-400e-b678-3ce1e8709b44'),(35,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-07 18:29:57','2023-03-07 18:29:57',NULL,'2023-03-14 15:37:53','3df5a18b-325b-42de-a98e-f7a1871a1e1b'),(36,34,NULL,12,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:08','2023-03-07 18:30:08',NULL,'2023-07-07 08:22:32','7f8652b9-68e4-47c3-90a5-bb42ae2e8894'),(37,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:08','2023-03-14 23:49:34',NULL,'2023-07-07 08:22:32','d3af3620-d383-436e-aaf7-be8d118b59d6'),(38,37,NULL,13,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:24','2023-03-07 18:30:24',NULL,'2023-07-07 08:22:32','37d3f439-055e-42e9-a35b-9e36049eb49d'),(39,37,NULL,14,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:26','2023-03-07 18:30:26',NULL,'2023-07-07 08:22:32','93e57a66-f5de-4388-af58-290d0e62312f'),(40,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:26','2023-03-14 23:49:39',NULL,'2023-07-07 08:22:32','2cafe334-8f93-401d-a022-f4c8430f69e2'),(41,40,NULL,15,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:40','2023-03-07 18:30:40',NULL,'2023-07-07 08:22:32','64b85e82-c4e7-4b8b-8a87-c47fb06386b7'),(42,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:40','2023-03-14 23:53:10',NULL,'2023-07-07 08:22:32','71e1be71-b468-4388-98db-5efa8b846374'),(43,42,NULL,16,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:31:00','2023-03-07 18:31:00',NULL,'2023-07-07 08:22:32','339e0149-103d-4641-ae38-19d2ecefe465'),(44,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:31:00','2023-03-14 23:55:32',NULL,'2023-07-07 08:22:32','106423b2-70b1-48e9-abb9-daef08aa4ee5'),(45,44,NULL,17,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:31:15','2023-03-07 18:31:15',NULL,'2023-07-07 08:22:32','ab196bf6-c09b-46df-a778-bec0bdcacb1a'),(46,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:31:15','2023-03-14 23:52:48',NULL,'2023-07-07 08:22:32','611f8fcc-8b92-4ae4-b20c-0e09312024e4'),(47,46,NULL,18,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:31:44','2023-03-07 18:31:44',NULL,'2023-07-07 08:22:32','08d84a59-0f87-4960-8c86-eacbd8451ea9'),(48,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:31:44','2023-03-14 23:53:17',NULL,'2023-07-07 08:22:32','4a3f5641-5c6f-4369-b5a4-85ffe5df8f6b'),(49,48,NULL,19,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:32:06','2023-03-07 18:32:07',NULL,'2023-07-07 08:22:32','f292f343-bafd-4741-a1e3-6eeec84798b3'),(50,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:32:07','2023-03-14 23:53:00',NULL,'2023-07-07 08:22:32','3a8277ae-a6db-41cc-a8c2-f8a8237f99bb'),(51,50,NULL,20,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:32:46','2023-03-07 18:32:46',NULL,'2023-07-07 08:22:32','afbf6304-4df3-4282-bc1b-fe4c1599bd9a'),(52,NULL,20,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:32:46','2023-03-07 18:32:46',NULL,'2023-07-07 08:22:32','f56f522d-f288-457a-a783-93f914336461'),(53,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:33:47','2023-03-14 23:49:54',NULL,'2023-07-07 08:22:32','51bfa186-61f4-4e74-a0e4-c328109b4283'),(54,53,NULL,21,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:34:14','2023-03-07 18:34:14',NULL,'2023-07-07 08:22:32','150af813-b813-4145-942c-efc8233353d7'),(55,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:34:14','2023-03-14 23:49:43',NULL,'2023-07-07 08:22:32','8c1802ac-936c-4ea5-86e1-fdac1f979f09'),(57,48,NULL,22,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:34:32','2023-03-07 18:34:32',NULL,'2023-07-07 08:22:32','5a848f19-5c9d-43d1-8ad3-c6313180c5c3'),(59,48,NULL,23,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:34:39','2023-03-07 18:34:39',NULL,'2023-07-07 08:22:32','03575f00-051e-48ce-881c-8826c20243db'),(61,44,NULL,24,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:34:56','2023-03-07 18:34:56',NULL,'2023-07-07 08:22:32','1b5230a7-70a2-4096-abb8-326c6ec3ef5b'),(62,55,NULL,25,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:35:34','2023-03-07 18:35:34',NULL,'2023-07-07 08:22:32','b30d6c6d-198d-4106-8490-ae7e7a0da99d'),(63,NULL,26,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:35:34','2023-03-07 18:35:34',NULL,'2023-07-07 08:22:32','16fc1b62-2c5c-4f12-8215-70790ada31f4'),(65,44,NULL,26,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:43:56','2023-03-07 18:43:56',NULL,'2023-07-07 08:22:32','ec051dd8-f7fc-447f-afca-2a422d8d78e2'),(67,55,NULL,27,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:45:37','2023-03-07 18:45:37',NULL,'2023-07-07 08:22:32','44a027f1-351b-412d-abfc-8e1205383d27'),(69,53,NULL,28,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:45:43','2023-03-07 18:45:43',NULL,'2023-07-07 08:22:32','1b899e85-878d-426d-8a2a-424673aa0e8a'),(71,42,NULL,29,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:45:48','2023-03-07 18:45:48',NULL,'2023-07-07 08:22:32','93ca38e5-bb9e-4b9b-a341-e96a578b057b'),(73,34,NULL,30,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:45:54','2023-03-07 18:45:54',NULL,'2023-07-07 08:22:32','0df2289d-a59f-478b-a109-a7ac210cb1e4'),(75,37,NULL,31,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:46:01','2023-03-07 18:46:01',NULL,'2023-07-07 08:22:32','9476dfb8-ca1f-4072-b8f0-442104d65cfa'),(77,46,NULL,32,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:46:11','2023-03-07 18:46:11',NULL,'2023-07-07 08:22:32','b8d270c6-710e-43e1-b23c-7e480082b2d6'),(79,44,NULL,33,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:46:16','2023-03-07 18:46:16',NULL,'2023-07-07 08:22:32','3feb65e3-2b79-4540-bfa5-5f1df89bc6fc'),(81,48,NULL,34,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:46:21','2023-03-07 18:46:21',NULL,'2023-07-07 08:22:32','42460766-8e8f-42f8-86ab-cd1959f4b739'),(83,40,NULL,35,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:46:29','2023-03-07 18:46:29',NULL,'2023-07-07 08:22:32','02b9acce-614c-4ea6-b48f-886e54a8dde4'),(85,50,NULL,36,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:46:34','2023-03-07 18:46:34',NULL,'2023-07-07 08:22:32','44a01f18-5e0a-41bd-aad8-c918769e0ad8'),(88,46,NULL,37,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:47:41','2023-03-07 18:47:41',NULL,'2023-07-07 08:22:32','476f7f9d-47a8-4757-8635-90a729469e11'),(89,50,NULL,38,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:47:50','2023-03-07 18:47:50',NULL,'2023-07-07 08:22:32','59687775-bdf0-45b2-bdd3-b8f73ef89545'),(91,42,NULL,39,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:48:02','2023-03-07 18:48:02',NULL,'2023-07-07 08:22:32','7bfb5e3f-1146-4ee1-be2c-f01046c0a0b4'),(92,55,NULL,40,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:48:08','2023-03-07 18:48:08',NULL,'2023-07-07 08:22:32','03b0bf03-af89-4b80-a984-ffe059b50e16'),(94,34,NULL,41,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:48:14','2023-03-07 18:48:14',NULL,'2023-07-07 08:22:32','d50ef7fe-8766-4674-90ef-d80989e54791'),(96,37,NULL,42,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:48:19','2023-03-07 18:48:19',NULL,'2023-07-07 08:22:32','3bf7be03-7fc0-4da0-aa68-870cb95911ce'),(98,50,NULL,43,2,'craft\\elements\\Entry',1,0,'2023-03-07 21:50:58','2023-03-07 21:50:58',NULL,'2023-07-07 08:22:32','349477cb-74b1-4364-930a-c0e180b450d2'),(99,NULL,NULL,NULL,2,'craft\\elements\\Entry',0,0,'2023-03-07 22:48:57','2023-03-14 23:50:09',NULL,'2023-07-07 08:22:32','a34171ea-f56c-4293-888f-3eefa11b5395'),(100,99,NULL,44,2,'craft\\elements\\Entry',0,0,'2023-03-07 22:49:57','2023-03-07 22:49:57',NULL,'2023-07-07 08:22:32','afd50f06-8c78-4eaa-a124-6bf7626474e0'),(101,99,NULL,45,2,'craft\\elements\\Entry',0,0,'2023-03-07 22:50:33','2023-03-07 22:50:33',NULL,'2023-07-07 08:22:32','5d1fb4cb-0025-4ca7-9a48-9ee40ff8c9d7'),(102,99,NULL,46,2,'craft\\elements\\Entry',1,0,'2023-03-07 22:50:40','2023-03-07 22:50:40',NULL,'2023-07-07 08:22:32','ee1a96d8-e933-4d99-bc8a-ce091a094dc0'),(103,99,NULL,47,2,'craft\\elements\\Entry',0,0,'2023-03-07 22:50:51','2023-03-07 22:50:51',NULL,'2023-07-07 08:22:32','ac697baa-9e65-4165-b1c8-918b409714f5'),(110,NULL,48,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 22:52:59','2023-03-07 22:52:59',NULL,'2023-07-07 08:22:32','732da14d-e055-4c52-b68f-4dafca75093b'),(112,37,NULL,51,2,'craft\\elements\\Entry',1,0,'2023-03-07 22:54:34','2023-03-07 22:54:34',NULL,'2023-07-07 08:22:32','325bb73c-00ec-4b64-a085-3198e39ada93'),(114,99,NULL,52,2,'craft\\elements\\Entry',0,0,'2023-03-07 22:54:50','2023-03-07 22:54:50',NULL,'2023-07-07 08:22:32','fe77e65d-224e-4996-a5bb-82fdc105fc84'),(115,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:42','2023-03-14 15:37:42',NULL,NULL,'7b9ba16b-034c-48af-9b36-58d74e918ec6'),(116,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:42','2023-03-14 15:37:42',NULL,NULL,'7cc46de0-eff1-4549-af5a-ed3793c1b0de'),(117,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:42','2023-03-14 15:37:42',NULL,NULL,'842b42d7-6457-4ff4-a449-abe7a24731c8'),(118,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:43','2023-03-14 15:37:43',NULL,NULL,'716bd3a0-4011-4344-9408-b95e80af74a6'),(119,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:43','2023-03-14 15:37:43',NULL,NULL,'a68eac46-efa5-4f2d-9f3c-f6265d95f883'),(120,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:43','2023-03-14 15:37:43',NULL,NULL,'23daad18-ab3b-4232-85a9-498ad2957756'),(121,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:43','2023-03-14 15:37:43',NULL,NULL,'95f28f9c-cf32-4465-bac9-6957d2998a32'),(122,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:43','2023-03-14 15:37:43',NULL,NULL,'c1824808-9af9-4c1d-bced-40388a7173ce'),(123,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:44','2023-03-14 15:37:44',NULL,NULL,'06e75290-f31d-48fb-aa3a-0574fbdcdf6a'),(124,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:44','2023-03-14 15:37:44',NULL,NULL,'409e4f1d-09a0-4398-a8bd-ee1c0afe168c'),(126,46,NULL,53,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:39:17','2023-03-14 15:39:17',NULL,'2023-07-07 08:22:32','435f8c94-35d1-4037-8605-a72a520d65dc'),(127,44,NULL,54,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:39:29','2023-03-14 15:39:29',NULL,'2023-07-07 08:22:32','249b9fb7-5330-40a4-8a2e-06622410a4a0'),(129,50,NULL,55,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:39:35','2023-03-14 15:39:35',NULL,'2023-07-07 08:22:32','8018304d-0ae6-440f-a171-29ceebd0d451'),(131,48,NULL,56,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:39:43','2023-03-14 15:39:43',NULL,'2023-07-07 08:22:32','00567a45-3c34-49ab-8aa4-066ccb254404'),(133,42,NULL,57,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:39:55','2023-03-14 15:39:55',NULL,'2023-07-07 08:22:32','aa5ff85d-89b5-4270-8599-bd7e0ff796e2'),(135,40,NULL,58,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:40:08','2023-03-14 15:40:08',NULL,'2023-07-07 08:22:32','bc9408cc-49ef-4d8d-ba8d-3711a6c999be'),(137,37,NULL,59,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:40:28','2023-03-14 15:40:28',NULL,'2023-07-07 08:22:32','f362cca5-a9fa-4958-952d-a05dfcb52516'),(139,55,NULL,60,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:40:39','2023-03-14 15:40:39',NULL,'2023-07-07 08:22:32','cbda46f9-c786-4e8f-bedc-035ce027fe13'),(141,53,NULL,61,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:40:47','2023-03-14 15:40:47',NULL,'2023-07-07 08:22:32','b3442498-72b1-4b63-9ed5-271fcae0c2bd'),(143,34,NULL,62,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:40:55','2023-03-14 15:40:55',NULL,'2023-07-07 08:22:32','722e9a36-e4df-4533-ae04-6e67f863c72c'),(145,44,NULL,63,2,'craft\\elements\\Entry',1,0,'2023-03-14 16:12:02','2023-03-14 16:12:02',NULL,'2023-07-07 08:22:32','504d3c61-b9d0-45c5-b9fc-dd5186bbd4cd'),(148,34,NULL,64,2,'craft\\elements\\Entry',0,0,'2023-03-14 23:47:44','2023-03-14 23:47:44',NULL,'2023-07-07 08:22:32','0f193875-bb6f-47ec-a597-b2b17b9dd71d'),(149,46,NULL,65,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:06','2023-03-14 23:49:06',NULL,'2023-07-07 08:22:32','65201c28-3d96-4971-b11a-b13b4c41af1d'),(151,44,NULL,66,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:11','2023-03-14 23:49:11',NULL,'2023-07-07 08:22:32','aec97af9-d441-480a-988b-de87023bf2af'),(153,50,NULL,67,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:17','2023-03-14 23:49:17',NULL,'2023-07-07 08:22:32','e0b4b9d5-7b4e-4717-a809-6a0819ed6265'),(155,42,NULL,68,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:24','2023-03-14 23:49:24',NULL,'2023-07-07 08:22:32','37aca33f-5ec7-42cf-bea4-9b9b8d2b725e'),(156,48,NULL,69,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:29','2023-03-14 23:49:29',NULL,'2023-07-07 08:22:32','53cc8b7b-d4ae-47bb-8e91-13108edcaca0'),(157,37,NULL,70,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:34','2023-03-14 23:49:34',NULL,'2023-07-07 08:22:32','ab6b0d17-0e04-4cc9-b233-38e48f252f73'),(158,40,NULL,71,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:39','2023-03-14 23:49:39',NULL,'2023-07-07 08:22:32','e898ce65-b21d-429f-9384-7409dde51a43'),(159,55,NULL,72,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:43','2023-03-14 23:49:43',NULL,'2023-07-07 08:22:32','8bc9fea5-33f9-4ba7-a48a-31c3945aea4b'),(160,53,NULL,73,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:54','2023-03-14 23:49:54',NULL,'2023-07-07 08:22:32','21cc2484-7479-4977-85e4-2a5ddcb606bc'),(162,34,NULL,74,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:50:04','2023-03-14 23:50:04',NULL,'2023-07-07 08:22:32','b4e4a3fc-188b-42c8-b6bc-2edee14a1933'),(163,99,NULL,75,2,'craft\\elements\\Entry',0,0,'2023-03-14 23:50:09','2023-03-14 23:50:09',NULL,'2023-07-07 08:22:32','1d53a93a-3f3c-4ffd-bebd-318fedb8f678'),(164,50,NULL,76,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:52:36','2023-03-14 23:52:36',NULL,'2023-07-07 08:22:32','533f6416-a640-4ccc-b3c8-cc1ea2e8869b'),(165,46,NULL,77,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:52:48','2023-03-14 23:52:48',NULL,'2023-07-07 08:22:32','adcdd5fd-3384-4414-ae41-fc04af5ba50e'),(166,44,NULL,78,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:52:55','2023-03-14 23:52:55',NULL,'2023-07-07 08:22:32','0a2dd91e-f73c-46b6-960e-60f01159155b'),(167,50,NULL,79,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:53:00','2023-03-14 23:53:00',NULL,'2023-07-07 08:22:32','3cf1127c-8bba-4cbb-88b6-e89f2956665a'),(168,42,NULL,80,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:53:05','2023-03-14 23:53:05',NULL,'2023-07-07 08:22:32','2f72f42f-e254-46b1-b730-ff860d9d4c05'),(169,42,NULL,81,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:53:10','2023-03-14 23:53:10',NULL,'2023-07-07 08:22:32','0e477f12-54b9-4a7f-ac1f-fb3fe0aa7805'),(170,48,NULL,82,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:53:17','2023-03-14 23:53:17',NULL,'2023-07-07 08:22:32','6bbb2e8a-1b6c-41a5-843c-214f48e02e8f'),(171,46,67,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:55:00','2023-03-14 23:55:00',NULL,'2023-07-07 08:22:32','11a385df-327a-48e9-9527-ef4381c2c6db'),(173,44,NULL,83,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:55:18','2023-03-14 23:55:18',NULL,'2023-07-07 08:22:32','3df60a4d-fce3-4921-875e-f6153e090e40'),(175,44,NULL,84,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:55:32','2023-03-14 23:55:32',NULL,'2023-07-07 08:22:32','fa0d7965-86f8-41c0-b263-4795a35aca27'),(176,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:27:51','2023-07-07 08:35:43',NULL,NULL,'815f1787-59d3-44ec-8dba-37cf9c1b2258'),(177,176,NULL,85,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:27:58','2023-07-07 08:27:58',NULL,NULL,'03d71bae-e99f-4d7b-a02f-5a10fedfda5b'),(178,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:28:00','2023-07-07 08:37:16',NULL,NULL,'0f15139e-ee2c-47a6-81ff-e201494a7ccf'),(179,178,NULL,86,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:28:03','2023-07-07 08:28:03',NULL,NULL,'2cf6cf56-b6dc-4c13-8f82-e566648a358d'),(180,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:28:05','2023-07-07 08:35:15',NULL,NULL,'d8e679fd-e350-483a-b7c0-9e4b1771177f'),(181,180,NULL,87,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:28:14','2023-07-07 08:28:14',NULL,NULL,'0372b4ff-b0d8-4a39-ba2e-2a1ccab54d4d'),(182,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:28:17','2023-07-07 08:33:45',NULL,NULL,'ca7bccc7-bc45-4195-b9e3-7e75be0899c3'),(183,182,NULL,88,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:28:22','2023-07-07 08:28:22',NULL,NULL,'32f542bc-33f6-4b95-ba1e-9a4ee41792d5'),(184,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:29:36','2023-07-07 08:36:40',NULL,NULL,'4ca8f90b-c094-4cd0-9029-ab02c615c34d'),(185,184,NULL,89,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:29:47','2023-07-07 08:29:47',NULL,NULL,'8d407e7e-d703-4152-8321-d7db28d51129'),(186,NULL,75,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:30:04','2023-07-07 08:30:04',NULL,NULL,'b32f239d-bb62-4a26-aef1-9373848b726b'),(188,184,NULL,90,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:30:22','2023-07-07 08:30:22',NULL,NULL,'b4cc9f36-7d6e-464a-b713-9f2100cca164'),(189,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:30:35','2023-07-07 08:34:13',NULL,NULL,'3d13a732-c69d-4c8e-b7c4-c3d925d74028'),(190,189,NULL,91,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:30:45','2023-07-07 08:30:45',NULL,NULL,'1a6cffe9-9280-4b1a-aa3b-42ba9a970cf6'),(191,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:30:56','2023-07-07 08:32:55',NULL,NULL,'35d60535-741f-4d94-9786-0d125987b148'),(192,191,NULL,92,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:31:01','2023-07-07 08:31:01',NULL,NULL,'badfee1f-882c-4e2f-8a4b-4d48af936c95'),(193,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:31:20','2023-07-07 08:36:10',NULL,NULL,'7518afcd-868f-40cf-93f7-54103e7587e1'),(194,193,NULL,93,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:31:27','2023-07-07 08:31:28',NULL,NULL,'c078c005-65d4-4713-aec5-1d114615fa59'),(195,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:31:47','2023-07-07 08:34:39',NULL,NULL,'087af51c-f2d0-4321-b792-9bccf000b198'),(196,195,NULL,94,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:31:58','2023-07-07 08:31:58',NULL,NULL,'f9117b8b-ca80-4244-ba06-b665352ecd61'),(197,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:32:05','2023-07-07 08:33:21',NULL,NULL,'e0163c96-30b4-47ed-b660-662a1d37b781'),(198,197,NULL,95,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:32:12','2023-07-07 08:32:12',NULL,NULL,'69955df6-154f-43b5-9637-0ca4810ffba5'),(200,191,NULL,96,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:32:55','2023-07-07 08:32:55',NULL,NULL,'417f2936-528c-4c42-9917-71da897dca16'),(202,197,NULL,97,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:33:21','2023-07-07 08:33:21',NULL,NULL,'a69f4144-0aa2-40b1-8c7e-83e9c92929d4'),(204,182,NULL,98,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:33:45','2023-07-07 08:33:45',NULL,NULL,'454b9dbd-710e-4996-bc8c-ad835c27bcf0'),(206,189,NULL,99,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:34:13','2023-07-07 08:34:13',NULL,NULL,'a279ada0-eabd-4d5f-876d-e0d119f0764a'),(208,195,NULL,100,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:34:39','2023-07-07 08:34:39',NULL,NULL,'a1f84da9-c19a-4e87-a691-62b4ecf60e28'),(210,180,NULL,101,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:35:15','2023-07-07 08:35:15',NULL,NULL,'23d4aa7c-27eb-40a8-997b-fa8c35b072d7'),(212,176,NULL,102,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:35:43','2023-07-07 08:35:43',NULL,NULL,'658d822b-3f7c-44f9-8a6c-0ee0949eea13'),(214,193,NULL,103,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:36:10','2023-07-07 08:36:10',NULL,NULL,'0b5d7d71-399b-4979-9af2-5fc5be01a461'),(216,184,NULL,104,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:36:40','2023-07-07 08:36:40',NULL,NULL,'44495866-8b6f-4f9d-85cd-2d77d5c007d0'),(218,178,NULL,105,2,'craft\\elements\\Entry',1,0,'2023-07-07 08:37:16','2023-07-07 08:37:16',NULL,NULL,'b09ed1d3-b974-4c3a-9e82-59d02f75d19a');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-02-02 05:28:23','2023-02-02 05:28:23','9276ec33-c4e9-4f94-9590-a6c8f9ed630a'),(2,2,1,'greece',NULL,1,'2023-03-07 18:07:27','2023-03-07 18:08:51','d5778f46-59f2-4f18-9072-22bdc1a97f0f'),(3,3,1,NULL,NULL,1,'2023-03-07 18:16:10','2023-03-07 18:16:10','e447cdf0-1e2e-4feb-800f-77980090e38b'),(4,4,1,NULL,NULL,1,'2023-03-07 18:16:10','2023-03-07 18:16:10','0c07baea-03c9-4ea5-a911-2bd67c47d2fe'),(5,5,1,NULL,NULL,1,'2023-03-07 18:16:10','2023-03-07 18:16:10','9403ac67-2260-4ef2-9952-d7fcd6f593d0'),(6,6,1,NULL,NULL,1,'2023-03-07 18:16:10','2023-03-07 18:16:10','bfe0c38b-0b3f-481f-850e-17ab41ab48a5'),(7,7,1,NULL,NULL,1,'2023-03-07 18:16:11','2023-03-07 18:16:11','420f04e7-b882-4843-b30c-a0dd5e889a71'),(8,8,1,NULL,NULL,1,'2023-03-07 18:16:11','2023-03-07 18:16:11','8ecbea9d-172c-4802-b634-766f32c08dd6'),(9,9,1,NULL,NULL,1,'2023-03-07 18:16:11','2023-03-07 18:16:11','3d232202-2d32-4063-8ea0-d4a91cc7e5a0'),(10,10,1,NULL,NULL,1,'2023-03-07 18:16:11','2023-03-07 18:16:11','42a6b6cd-19f1-4bed-a407-306078cbb07b'),(11,11,1,NULL,NULL,1,'2023-03-07 18:16:12','2023-03-07 18:16:12','800f368f-b740-4340-ac29-aeee491b0404'),(12,12,1,NULL,NULL,1,'2023-03-07 18:16:12','2023-03-07 18:16:12','eebdce7d-aa29-4313-bb9d-b3d1cf74399d'),(13,13,1,'greece',NULL,1,'2023-03-07 18:17:39','2023-03-07 18:17:39','9ffb0405-8cd7-490f-8f22-4913f25c2979'),(14,14,1,'brazil',NULL,1,'2023-03-07 18:18:14','2023-03-07 18:18:18','2152f33a-b73d-48bd-a4c3-b281150eef68'),(15,15,1,'brazil',NULL,1,'2023-03-07 18:18:26','2023-03-07 18:18:26','c974e223-a005-4fc8-831c-095ce4d9b3e2'),(16,16,1,'australia',NULL,1,'2023-03-07 18:18:26','2023-03-07 18:18:30','e479df40-1bf8-487e-bf09-fd1cd8d61355'),(17,17,1,'australia',NULL,1,'2023-03-07 18:18:34','2023-03-07 18:18:34','0659932a-56ab-4015-a1d4-16412626da54'),(18,18,1,'france',NULL,1,'2023-03-07 18:18:34','2023-03-07 18:18:41','dd52f95d-25be-4aec-8100-a217eb96e3fd'),(19,19,1,'france',NULL,1,'2023-03-07 18:18:41','2023-03-07 18:18:41','44e5edc1-4d85-411d-b787-1267d934a15e'),(20,20,1,'mexico',NULL,1,'2023-03-07 18:18:41','2023-03-07 18:18:48','b4846404-4b5d-4be4-b133-413583c9402e'),(21,21,1,'mexico',NULL,1,'2023-03-07 18:19:04','2023-03-07 18:19:04','2cf01b16-8e72-446e-ae5b-93fef9639654'),(22,22,1,'mexico',NULL,1,'2023-03-07 18:19:06','2023-03-07 18:19:06','8eb88547-f39a-46ae-930e-2f7fdbcaf084'),(23,23,1,'spain',NULL,1,'2023-03-07 18:19:06','2023-03-07 18:19:16','5ef1b4fd-d62b-4c1b-a731-c1dc809e9dd8'),(24,24,1,'spain',NULL,1,'2023-03-07 18:19:17','2023-03-07 18:19:17','b7a43cf2-e554-4f55-801a-530667e8477d'),(25,25,1,'japan',NULL,1,'2023-03-07 18:19:17','2023-03-07 18:19:25','838bf702-bfa8-410c-bcbe-587e0e4c45a5'),(26,26,1,'japan',NULL,1,'2023-03-07 18:19:26','2023-03-07 18:19:26','044460fd-fcdd-4311-b906-0ca6c6f4c246'),(27,27,1,'portugal',NULL,1,'2023-03-07 18:19:26','2023-03-07 18:19:34','0cfa35e6-bf13-473b-974b-1dbf3c145e72'),(28,28,1,'portugal',NULL,1,'2023-03-07 18:19:34','2023-03-07 18:19:34','28fa4c2f-fdcd-43be-84c6-b57fe2c290ce'),(29,29,1,'canada',NULL,1,'2023-03-07 18:19:34','2023-03-07 18:19:41','c01667b7-af69-4eb8-b86a-63e5ea27753f'),(30,30,1,'canada',NULL,1,'2023-03-07 18:19:42','2023-03-07 18:19:42','f8e51ac3-b1f9-48ed-8c94-fe596a462c1a'),(31,31,1,'__temp_gzxtiyduookdkysnqmgglpvxxacueuozlwbg',NULL,1,'2023-03-07 18:19:42','2023-03-07 18:19:42','804ab9e0-fc39-4137-bbbd-04d4f9849c0c'),(32,32,1,'turkey',NULL,1,'2023-03-07 18:19:47','2023-03-07 18:19:56','63c08fcc-63fd-4c9a-8d03-89ebb54fe374'),(33,33,1,'turkey',NULL,1,'2023-03-07 18:19:58','2023-03-07 18:19:58','b877cefb-abf7-44f7-afc6-f79f458e3c87'),(34,34,1,'clare-ellis',NULL,1,'2023-03-07 18:20:06','2023-03-07 18:20:10','d7f5fd3c-eb32-4968-8e4f-2d8b2f468a15'),(35,35,1,NULL,NULL,1,'2023-03-07 18:29:57','2023-03-07 18:29:57','c78ae88f-fc20-45db-92ac-5b069b113a95'),(36,36,1,'clare-ellis',NULL,1,'2023-03-07 18:30:08','2023-03-07 18:30:08','759327f9-af46-447f-844d-01492a4230d2'),(37,37,1,'cole-carr',NULL,1,'2023-03-07 18:30:08','2023-03-07 18:30:18','4189140f-d21f-4e0c-a293-9d6b801a0500'),(38,38,1,'cole-carr',NULL,1,'2023-03-07 18:30:24','2023-03-07 18:30:24','dcd6b33f-be8c-4e0e-af0b-6d21ffbf779d'),(39,39,1,'cole-carr',NULL,1,'2023-03-07 18:30:26','2023-03-07 18:30:26','c616ff93-9847-4f73-8e77-66d763bf1ecf'),(40,40,1,'richard-pacheco',NULL,1,'2023-03-07 18:30:26','2023-03-07 18:30:33','8271b49e-0b65-439e-bba5-bbc221267186'),(41,41,1,'richard-pacheco',NULL,1,'2023-03-07 18:30:40','2023-03-07 18:30:40','ed2d42d1-fe96-4ffb-8bd7-688f321d2b46'),(42,42,1,'bryson-sanchez',NULL,1,'2023-03-07 18:30:40','2023-03-07 18:30:57','998a210f-73f1-4369-88d1-dd47c411b6c8'),(43,43,1,'bryson-sanchez',NULL,1,'2023-03-07 18:31:00','2023-03-07 18:31:00','d3a10c38-09fc-4d72-81bf-909889a21eb7'),(44,44,1,'mekhi-roman',NULL,1,'2023-03-07 18:31:00','2023-03-07 18:31:09','736d5816-8cbd-4ebf-9021-7173350310ab'),(45,45,1,'mekhi-roman',NULL,1,'2023-03-07 18:31:15','2023-03-07 18:31:15','3842b90a-6045-4cc1-84dd-12aea7086607'),(46,46,1,'izaiah-cruz',NULL,1,'2023-03-07 18:31:15','2023-03-07 18:31:36','6e4d6f59-34eb-4a13-b156-e7c5e1d9f142'),(47,47,1,'izaiah-cruz',NULL,1,'2023-03-07 18:31:44','2023-03-07 18:31:44','22ac2889-1a28-4775-870c-d8ccaa7c9e7c'),(48,48,1,'omar-durham',NULL,1,'2023-03-07 18:31:44','2023-03-07 18:34:39','7ca5d619-6766-4fe0-b8ca-1f67778586cf'),(49,49,1,'mohammad-durham',NULL,1,'2023-03-07 18:32:07','2023-03-07 18:32:07','5292e0a3-0ad0-421b-84b9-a51668884f82'),(50,50,1,'simone-munoz',NULL,1,'2023-03-07 18:32:07','2023-03-07 18:32:39','02de636c-871d-4134-9c5a-09f136c6061e'),(51,51,1,'simone-munoz',NULL,1,'2023-03-07 18:32:46','2023-03-07 18:32:46','9b963fdd-b479-4c00-beb6-c4363004484c'),(52,52,1,'__temp_pmtqbgmubposriqnogaexmrdgwnakcbqaaae',NULL,1,'2023-03-07 18:32:46','2023-03-07 18:32:46','130c0faf-f8f7-4ab4-b244-22baee527102'),(53,53,1,'beau-prince',NULL,1,'2023-03-07 18:33:47','2023-03-07 18:34:11','e503c355-bac8-47cb-a6df-1516d8c43f64'),(54,54,1,'beau-prince',NULL,1,'2023-03-07 18:34:14','2023-03-07 18:34:14','cb7fe8f6-0dc3-4858-bcb4-3142bb0797c0'),(55,55,1,'azalea-clay',NULL,1,'2023-03-07 18:34:14','2023-03-07 18:35:28','2b624d66-9b84-4ebc-b9ff-809a445d94de'),(57,57,1,'mohammad-durham',NULL,1,'2023-03-07 18:34:32','2023-03-07 18:34:32','d28d5e6d-2ab6-4624-843a-b62bda21484b'),(59,59,1,'omar-durham',NULL,1,'2023-03-07 18:34:39','2023-03-07 18:34:39','8b2a5b7a-0467-4b84-8962-4cbd674e4ccc'),(61,61,1,'mekhi-roman',NULL,1,'2023-03-07 18:34:56','2023-03-07 18:34:56','9ddb5831-b5b1-430d-8912-7281067fb8fe'),(62,62,1,'azalea-clay',NULL,1,'2023-03-07 18:35:34','2023-03-07 18:35:34','c45cd64c-df2c-4539-9e63-635d53addc1f'),(63,63,1,'__temp_sdzyswmvltboadhnlqguugdkknhlmfkpnyxe',NULL,1,'2023-03-07 18:35:34','2023-03-07 18:35:34','aa20bf4b-0699-4c51-a84f-ea51f6e444ea'),(65,65,1,'mekhi-roman',NULL,1,'2023-03-07 18:43:56','2023-03-07 18:43:56','579cb787-88a6-49ff-8650-c8e5b50205e1'),(67,67,1,'azalea-clay',NULL,1,'2023-03-07 18:45:37','2023-03-07 18:45:37','16e47608-3c50-41ef-ad13-a3fef61c1de7'),(69,69,1,'beau-prince',NULL,1,'2023-03-07 18:45:43','2023-03-07 18:45:43','f0ab601c-369f-4ef4-bb0c-ffcbf2fbfb2d'),(71,71,1,'bryson-sanchez',NULL,1,'2023-03-07 18:45:48','2023-03-07 18:45:48','0a9a1962-2278-41db-8bba-f174a4fcad9a'),(73,73,1,'clare-ellis',NULL,1,'2023-03-07 18:45:54','2023-03-07 18:45:54','e14a4207-8717-45f7-809a-f3af2f261c86'),(75,75,1,'cole-carr',NULL,1,'2023-03-07 18:46:01','2023-03-07 18:46:01','fded8500-f3f7-4521-9011-0fb533cfff2d'),(77,77,1,'izaiah-cruz',NULL,1,'2023-03-07 18:46:11','2023-03-07 18:46:11','a55ce5a4-24a9-432f-a7b3-da84d1812ffc'),(79,79,1,'mekhi-roman',NULL,1,'2023-03-07 18:46:16','2023-03-07 18:46:16','b0ca6309-e4dd-4903-8fcc-cf155657ab8f'),(81,81,1,'omar-durham',NULL,1,'2023-03-07 18:46:21','2023-03-07 18:46:21','3e242781-f869-405f-b41d-fef0b546db42'),(83,83,1,'richard-pacheco',NULL,1,'2023-03-07 18:46:29','2023-03-07 18:46:29','d08f475e-c8dd-48a2-99a9-b194156cba3e'),(85,85,1,'simone-munoz',NULL,1,'2023-03-07 18:46:34','2023-03-07 18:46:34','7c0d057d-4934-4de2-80ab-2a7f659924c8'),(88,88,1,'izaiah-cruz',NULL,1,'2023-03-07 18:47:41','2023-03-07 18:47:41','0af9d1fe-fc53-4059-b5eb-d970e556a5b4'),(89,89,1,'simone-munoz',NULL,1,'2023-03-07 18:47:50','2023-03-07 18:47:50','0a584254-ec04-4e82-bf7c-1640e3a89dea'),(91,91,1,'bryson-sanchez',NULL,1,'2023-03-07 18:48:02','2023-03-07 18:48:02','2cec8103-7ece-4281-8cb3-5fb33b0aa89a'),(92,92,1,'azalea-clay',NULL,1,'2023-03-07 18:48:08','2023-03-07 18:48:08','8c44c68a-8b5b-4e72-9170-9465db32f680'),(94,94,1,'clare-ellis',NULL,1,'2023-03-07 18:48:14','2023-03-07 18:48:14','8b94aba5-3e47-408e-be71-29f71ce729c0'),(96,96,1,'cole-carr',NULL,1,'2023-03-07 18:48:19','2023-03-07 18:48:19','2c90b63c-c479-4be1-8ab0-4de0bad1867f'),(98,98,1,'simone-munoz',NULL,1,'2023-03-07 21:50:58','2023-03-07 21:50:58','b6fdc1ee-186e-4801-9ab6-8a8f42aee020'),(99,99,1,'substitute-prime',NULL,1,'2023-03-07 22:48:57','2023-03-07 22:49:35','5ed369bd-80f5-43a7-bbbe-441595a963b9'),(100,100,1,'substitute-prime',NULL,1,'2023-03-07 22:49:57','2023-03-07 22:49:57','c1f9e077-d5c1-4478-b0e2-7d48ac5779dd'),(101,101,1,'substitute-prime',NULL,1,'2023-03-07 22:50:33','2023-03-07 22:50:33','f4239468-ab0e-4312-9df1-58d9a5653645'),(102,102,1,'substitute-prime',NULL,1,'2023-03-07 22:50:40','2023-03-07 22:50:40','fc2e8cbc-088f-47d5-b464-1e58279ce46d'),(103,103,1,'substitute-prime',NULL,1,'2023-03-07 22:50:51','2023-03-07 22:50:51','6cd81e5b-173f-4987-9952-348d710766df'),(110,110,1,'__temp_fedqzevpvfvqeyqrgrupekcabsjkfllwbqlp',NULL,1,'2023-03-07 22:52:59','2023-03-07 22:52:59','c67ca3b3-c908-4a04-8951-b387481492d8'),(112,112,1,'cole-carr',NULL,1,'2023-03-07 22:54:34','2023-03-07 22:54:34','652c7601-f1b3-4d28-bc98-9ee6af7b1358'),(114,114,1,'substitute-prime',NULL,1,'2023-03-07 22:54:50','2023-03-07 22:54:50','7355736d-b733-4e80-a87c-7ec190ef47af'),(115,115,1,NULL,NULL,1,'2023-03-14 15:37:42','2023-03-14 15:37:42','05a224e7-3d72-459a-b432-8691483a7e7a'),(116,116,1,NULL,NULL,1,'2023-03-14 15:37:42','2023-03-14 15:37:42','ac8aeee4-b9c9-41bf-b28f-e6cd2fc7a1fb'),(117,117,1,NULL,NULL,1,'2023-03-14 15:37:42','2023-03-14 15:37:42','82f99735-c990-4255-8314-e7f8e8091410'),(118,118,1,NULL,NULL,1,'2023-03-14 15:37:43','2023-03-14 15:37:43','10908556-ddf4-493f-9953-22135e374fe0'),(119,119,1,NULL,NULL,1,'2023-03-14 15:37:43','2023-03-14 15:37:43','94a3a2d9-735a-4084-8266-344b11522f09'),(120,120,1,NULL,NULL,1,'2023-03-14 15:37:43','2023-03-14 15:37:43','feaf9963-1502-4b70-aff5-2f04d0fa971f'),(121,121,1,NULL,NULL,1,'2023-03-14 15:37:43','2023-03-14 15:37:43','a8f7d57e-69a6-4c08-be0b-b9c865925bbc'),(122,122,1,NULL,NULL,1,'2023-03-14 15:37:43','2023-03-14 15:37:43','099c0e53-7add-469d-802b-2966e15972a5'),(123,123,1,NULL,NULL,1,'2023-03-14 15:37:44','2023-03-14 15:37:44','606d4d12-21cd-481a-9f80-18de2aac7d13'),(124,124,1,NULL,NULL,1,'2023-03-14 15:37:44','2023-03-14 15:37:44','7eccb34e-24c3-44a7-b62d-b92b4bd2426b'),(126,126,1,'izaiah-cruz',NULL,1,'2023-03-14 15:39:17','2023-03-14 15:39:17','41b482ce-3fde-44e0-880e-74b80e7716b5'),(127,127,1,'mekhi-roman',NULL,1,'2023-03-14 15:39:29','2023-03-14 15:39:29','c0cdd795-6efa-41e8-a5aa-36b17d70908f'),(129,129,1,'simone-munoz',NULL,1,'2023-03-14 15:39:35','2023-03-14 15:39:35','7d1dd881-1191-479f-8cfa-96e248c2429c'),(131,131,1,'omar-durham',NULL,1,'2023-03-14 15:39:43','2023-03-14 15:39:43','638c0dcc-10b9-4166-8b6a-cdcac10dc431'),(133,133,1,'bryson-sanchez',NULL,1,'2023-03-14 15:39:55','2023-03-14 15:39:55','58fc4012-c592-4cb3-9e8b-274440034439'),(135,135,1,'richard-pacheco',NULL,1,'2023-03-14 15:40:08','2023-03-14 15:40:08','c56aa52d-5d4d-45eb-abdc-5ba7a55710e1'),(137,137,1,'cole-carr',NULL,1,'2023-03-14 15:40:28','2023-03-14 15:40:28','32c09cc7-de78-4064-a045-03bda0469e47'),(139,139,1,'azalea-clay',NULL,1,'2023-03-14 15:40:39','2023-03-14 15:40:39','2d452ae1-824f-4f69-8a08-29059ddb74f2'),(141,141,1,'beau-prince',NULL,1,'2023-03-14 15:40:47','2023-03-14 15:40:47','fb36e7ef-61d7-4916-ba89-0528244ed6b1'),(143,143,1,'clare-ellis',NULL,1,'2023-03-14 15:40:55','2023-03-14 15:40:55','1b3deccb-5685-4b88-a3ed-165c7ac5b5b7'),(145,145,1,'mekhi-roman',NULL,1,'2023-03-14 16:12:02','2023-03-14 16:12:02','361e7f9f-9cc9-4eb6-b652-ced307794ba8'),(148,148,1,'clare-ellis',NULL,1,'2023-03-14 23:47:44','2023-03-14 23:47:44','e38b35eb-66ee-43ad-aabb-5dc996cec23a'),(149,149,1,'izaiah-cruz',NULL,1,'2023-03-14 23:49:06','2023-03-14 23:49:06','31a1774b-3f64-4c71-89df-df87408fe0e4'),(151,151,1,'mekhi-roman',NULL,1,'2023-03-14 23:49:11','2023-03-14 23:49:11','9b8db380-f560-4ed4-9506-99742d4c6229'),(153,153,1,'simone-munoz',NULL,1,'2023-03-14 23:49:17','2023-03-14 23:49:17','f6061770-13ac-409c-bba4-1280e7687c2d'),(155,155,1,'bryson-sanchez',NULL,1,'2023-03-14 23:49:24','2023-03-14 23:49:24','5458c922-e28c-4038-bcaf-0c853f948031'),(156,156,1,'omar-durham',NULL,1,'2023-03-14 23:49:29','2023-03-14 23:49:29','a6b9091d-28b1-4059-901d-80adb54640e7'),(157,157,1,'cole-carr',NULL,1,'2023-03-14 23:49:34','2023-03-14 23:49:34','295c331b-90ae-4449-b7d5-f9bca204093f'),(158,158,1,'richard-pacheco',NULL,1,'2023-03-14 23:49:39','2023-03-14 23:49:39','d9ccf1d2-eae1-4017-a3eb-008cee44fa23'),(159,159,1,'azalea-clay',NULL,1,'2023-03-14 23:49:43','2023-03-14 23:49:43','398678be-0c74-4c19-aa52-2a9ff8e9b4fd'),(160,160,1,'beau-prince',NULL,1,'2023-03-14 23:49:54','2023-03-14 23:49:54','ed1d431a-e691-499b-8831-50583662c9c6'),(162,162,1,'clare-ellis',NULL,1,'2023-03-14 23:50:04','2023-03-14 23:50:04','262f2a04-2a28-4f1b-ae6a-d1b6899f06c5'),(163,163,1,'substitute-prime',NULL,1,'2023-03-14 23:50:09','2023-03-14 23:50:09','27b3117c-10c0-4113-b26f-b93aa3e45fc6'),(164,164,1,'simone-munoz',NULL,1,'2023-03-14 23:52:36','2023-03-14 23:52:36','e1a9c7d4-0a94-486e-884c-8ade694915c0'),(165,165,1,'izaiah-cruz',NULL,1,'2023-03-14 23:52:48','2023-03-14 23:52:48','47e95da2-2b29-4290-b7a1-b7901514b037'),(166,166,1,'mekhi-roman',NULL,1,'2023-03-14 23:52:55','2023-03-14 23:52:55','f6ca7916-5aca-4463-813f-9e5bc547b35f'),(167,167,1,'simone-munoz',NULL,1,'2023-03-14 23:53:00','2023-03-14 23:53:00','4482f533-ab94-48e4-b93b-c8b254753060'),(168,168,1,'bryson-sanchez',NULL,1,'2023-03-14 23:53:05','2023-03-14 23:53:05','ae351b9a-7683-422c-aff2-5ea410e071da'),(169,169,1,'bryson-sanchez',NULL,1,'2023-03-14 23:53:10','2023-03-14 23:53:10','cb02a3aa-b2f3-4bd2-94ee-1540a233b365'),(170,170,1,'omar-durham',NULL,1,'2023-03-14 23:53:17','2023-03-14 23:53:17','0c9dc4ef-c13f-410d-9c4a-f4240f1927c5'),(171,171,1,'izaiah-cruz',NULL,1,'2023-03-14 23:55:00','2023-03-14 23:55:00','0a59b958-104b-4354-b89b-576349794cec'),(173,173,1,'mekhi-roman',NULL,1,'2023-03-14 23:55:18','2023-03-14 23:55:18','c81834b4-36d6-4cd9-9b53-a6a3d2cc21d1'),(175,175,1,'mekhi-roman',NULL,1,'2023-03-14 23:55:32','2023-03-14 23:55:32','88833a45-91e3-48b2-9c21-91906c66f9a3'),(176,176,1,'razzle-dazzle',NULL,1,'2023-07-07 08:27:51','2023-07-07 08:27:56','bc8f311f-165e-4cc4-806e-5befab4a1ed8'),(177,177,1,'razzle-dazzle',NULL,1,'2023-07-07 08:27:58','2023-07-07 08:27:58','96e6487e-6c8a-428f-9645-abe95c475f1d'),(178,178,1,'untamed-night',NULL,1,'2023-07-07 08:28:00','2023-07-07 08:28:03','519c4637-f014-4ff5-b6a4-5d78091871ed'),(179,179,1,'untamed-night',NULL,1,'2023-07-07 08:28:03','2023-07-07 08:28:03','8d28aed4-99ca-47f4-89ee-89eebceeac9d'),(180,180,1,'martinis-at-midnight',NULL,1,'2023-07-07 08:28:05','2023-07-07 08:28:14','ea3b8f3d-adc8-41ce-82fe-8f6888a33412'),(181,181,1,'martinis-at-midnight',NULL,1,'2023-07-07 08:28:14','2023-07-07 08:28:14','2e0fd206-3bcb-42a5-8e70-3eef7310723a'),(182,182,1,'ghouls-night-out',NULL,1,'2023-07-07 08:28:17','2023-07-07 08:28:22','57c51dd2-db4d-47c4-9019-e8cd39ae810a'),(183,183,1,'ghouls-night-out',NULL,1,'2023-07-07 08:28:22','2023-07-07 08:28:22','397b2119-7dd8-4afa-9dea-af2950d88b2d'),(184,184,1,'ryans-summerpool-party',NULL,1,'2023-07-07 08:29:36','2023-07-07 08:29:44','96a215f0-de49-49f4-a0fb-a05bc4787e36'),(185,185,1,'ryans-summerpool-party',NULL,1,'2023-07-07 08:29:47','2023-07-07 08:29:47','fbfeb6ac-fc0d-41be-b241-3912e53cc920'),(186,186,1,'__temp_estrbkwlefkedkdjytyoshwmmedjebujqxqq',NULL,1,'2023-07-07 08:30:04','2023-07-07 08:30:04','e978779e-c676-4701-9a5c-b9e364172583'),(188,188,1,'ryans-summerpool-party',NULL,1,'2023-07-07 08:30:22','2023-07-07 08:30:22','25e1cee4-a860-4681-a8f6-fcb30d09bbf7'),(189,189,1,'go-fly-andrews-kite',NULL,1,'2023-07-07 08:30:35','2023-07-07 08:30:44','b1d9c9d4-8207-4478-877b-cb455667e900'),(190,190,1,'go-fly-andrews-kite',NULL,1,'2023-07-07 08:30:45','2023-07-07 08:30:45','050fae69-0686-42c1-94dc-ed498155cadf'),(191,191,1,'bens-big-shift',NULL,1,'2023-07-07 08:30:56','2023-07-07 08:31:00','2fe052cb-59d9-4b44-a3e6-0a82e2fa6440'),(192,192,1,'bens-big-shift',NULL,1,'2023-07-07 08:31:01','2023-07-07 08:31:01','da28fa22-34b5-43b5-8a65-5f5b1aeaee60'),(193,193,1,'rocking-rollick',NULL,1,'2023-07-07 08:31:20','2023-07-07 08:31:26','400da133-c006-46fd-bd26-4fdc3231c736'),(194,194,1,'rocking-rollick',NULL,1,'2023-07-07 08:31:28','2023-07-07 08:31:28','210f3933-d933-4a43-b0cc-cfe345dee8fc'),(195,195,1,'martinis-at-michaels',NULL,1,'2023-07-07 08:31:47','2023-07-07 08:31:57','387f6c7a-c93c-4a19-900a-e2c14cc2ba26'),(196,196,1,'martinis-at-michaels',NULL,1,'2023-07-07 08:31:58','2023-07-07 08:31:58','94b00301-b295-48d3-8f19-8e94e95dcb39'),(197,197,1,'booty-balooza',NULL,1,'2023-07-07 08:32:05','2023-07-07 08:32:11','4b844214-3304-4a06-941a-641a6e5e2298'),(198,198,1,'booty-balooza',NULL,1,'2023-07-07 08:32:12','2023-07-07 08:32:12','4b9b8b45-9ff1-4caf-b8b9-b03a3432562e'),(200,200,1,'bens-big-shift',NULL,1,'2023-07-07 08:32:55','2023-07-07 08:32:55','7eb2d1f3-95c0-4602-8713-f503aab42d5c'),(202,202,1,'booty-balooza',NULL,1,'2023-07-07 08:33:21','2023-07-07 08:33:21','97b05507-6668-4c03-87ab-f7d317040889'),(204,204,1,'ghouls-night-out',NULL,1,'2023-07-07 08:33:45','2023-07-07 08:33:45','184a20bb-cb98-4c2c-bbd0-8b886d7fb94b'),(206,206,1,'go-fly-andrews-kite',NULL,1,'2023-07-07 08:34:13','2023-07-07 08:34:13','330d4c27-1cfd-4945-be93-85a3f591e799'),(208,208,1,'martinis-at-michaels',NULL,1,'2023-07-07 08:34:39','2023-07-07 08:34:39','5ea57dc4-9deb-4f44-be1d-118a978c0b93'),(210,210,1,'martinis-at-midnight',NULL,1,'2023-07-07 08:35:15','2023-07-07 08:35:15','4f3a7194-3afe-4f1c-8e5e-05bdb00784bc'),(212,212,1,'razzle-dazzle',NULL,1,'2023-07-07 08:35:43','2023-07-07 08:35:43','54393420-94de-4a14-b18b-bc99b168a776'),(214,214,1,'rocking-rollick',NULL,1,'2023-07-07 08:36:10','2023-07-07 08:36:10','66e6399d-2d0a-42e2-a501-def1f1ff3f80'),(216,216,1,'ryans-summerpool-party',NULL,1,'2023-07-07 08:36:40','2023-07-07 08:36:40','7dd10777-a900-47d6-91ff-fa7521952c3b'),(218,218,1,'untamed-night',NULL,1,'2023-07-07 08:37:16','2023-07-07 08:37:16','de99e5a0-c60a-4446-8272-c17900cdaa71');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,1,'2023-03-07 18:17:00',NULL,1,'2023-03-07 18:07:27','2023-03-07 18:17:39'),(13,1,NULL,1,1,'2023-03-07 18:17:00',NULL,NULL,'2023-03-07 18:17:39','2023-03-07 18:17:39'),(14,1,NULL,1,1,'2023-03-07 18:18:00',NULL,1,'2023-03-07 18:18:14','2023-03-07 18:18:26'),(15,1,NULL,1,1,'2023-03-07 18:18:00',NULL,NULL,'2023-03-07 18:18:26','2023-03-07 18:18:26'),(16,1,NULL,1,1,'2023-03-07 18:18:00',NULL,1,'2023-03-07 18:18:26','2023-03-07 18:18:34'),(17,1,NULL,1,1,'2023-03-07 18:18:00',NULL,NULL,'2023-03-07 18:18:34','2023-03-07 18:18:34'),(18,1,NULL,1,1,'2023-03-07 18:18:00',NULL,1,'2023-03-07 18:18:34','2023-03-07 18:18:41'),(19,1,NULL,1,1,'2023-03-07 18:18:00',NULL,NULL,'2023-03-07 18:18:41','2023-03-07 18:18:41'),(20,1,NULL,1,1,'2023-03-07 18:19:00',NULL,1,'2023-03-07 18:18:41','2023-03-07 18:19:04'),(21,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:04','2023-03-07 18:19:04'),(22,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:06','2023-03-07 18:19:06'),(23,1,NULL,1,1,'2023-03-07 18:19:00',NULL,1,'2023-03-07 18:19:06','2023-03-07 18:19:16'),(24,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:17','2023-03-07 18:19:17'),(25,1,NULL,1,1,'2023-03-07 18:19:00',NULL,1,'2023-03-07 18:19:17','2023-03-07 18:19:26'),(26,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:26','2023-03-07 18:19:26'),(27,1,NULL,1,1,'2023-03-07 18:19:00',NULL,1,'2023-03-07 18:19:26','2023-03-07 18:19:34'),(28,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:34','2023-03-07 18:19:34'),(29,1,NULL,1,1,'2023-03-07 18:19:00',NULL,1,'2023-03-07 18:19:34','2023-03-07 18:19:41'),(30,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:42','2023-03-07 18:19:42'),(31,1,NULL,1,1,NULL,NULL,1,'2023-03-07 18:19:42','2023-03-07 18:19:42'),(32,1,NULL,1,1,'2023-03-07 18:19:00',NULL,1,'2023-03-07 18:19:47','2023-03-07 18:19:58'),(33,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:58','2023-03-07 18:19:58'),(34,2,NULL,2,1,'2023-03-07 18:30:00',NULL,0,'2023-03-07 18:20:06','2023-03-07 18:30:08'),(36,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:30:08','2023-03-07 18:30:08'),(37,2,NULL,2,1,'2023-03-07 18:30:00',NULL,0,'2023-03-07 18:30:08','2023-03-07 18:30:24'),(38,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:30:24','2023-03-07 18:30:24'),(39,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:30:26','2023-03-07 18:30:26'),(40,2,NULL,2,1,'2023-03-07 18:30:00',NULL,0,'2023-03-07 18:30:26','2023-03-07 18:30:40'),(41,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:30:40','2023-03-07 18:30:40'),(42,2,NULL,2,1,'2023-03-07 18:31:00',NULL,0,'2023-03-07 18:30:40','2023-03-07 18:31:00'),(43,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:31:00','2023-03-07 18:31:00'),(44,2,NULL,2,1,'2023-03-07 18:31:00',NULL,0,'2023-03-07 18:31:00','2023-03-07 18:31:15'),(45,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:31:15','2023-03-07 18:31:15'),(46,2,NULL,2,1,'2023-03-07 18:31:00',NULL,0,'2023-03-07 18:31:15','2023-03-07 18:31:44'),(47,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:31:44','2023-03-07 18:31:44'),(48,2,NULL,2,1,'2023-03-07 18:32:00',NULL,0,'2023-03-07 18:31:44','2023-03-07 18:32:06'),(49,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:32:07','2023-03-07 18:32:07'),(50,2,NULL,2,1,'2023-03-07 18:32:00',NULL,0,'2023-03-07 18:32:07','2023-03-07 18:32:46'),(51,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:32:46','2023-03-07 18:32:46'),(52,2,NULL,2,1,NULL,NULL,0,'2023-03-07 18:32:46','2023-03-07 18:32:46'),(53,2,NULL,2,1,'2023-03-07 18:34:00',NULL,0,'2023-03-07 18:33:47','2023-03-07 18:34:14'),(54,2,NULL,2,1,'2023-03-07 18:34:00',NULL,NULL,'2023-03-07 18:34:14','2023-03-07 18:34:14'),(55,2,NULL,2,1,'2023-03-07 18:35:00',NULL,0,'2023-03-07 18:34:14','2023-03-07 18:35:34'),(57,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:34:32','2023-03-07 18:34:32'),(59,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:34:39','2023-03-07 18:34:39'),(61,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:34:56','2023-03-07 18:34:56'),(62,2,NULL,2,1,'2023-03-07 18:35:00',NULL,NULL,'2023-03-07 18:35:34','2023-03-07 18:35:34'),(63,2,NULL,2,1,NULL,NULL,0,'2023-03-07 18:35:34','2023-03-07 18:35:34'),(65,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:43:56','2023-03-07 18:43:56'),(67,2,NULL,2,1,'2023-03-07 18:35:00',NULL,NULL,'2023-03-07 18:45:37','2023-03-07 18:45:37'),(69,2,NULL,2,1,'2023-03-07 18:34:00',NULL,NULL,'2023-03-07 18:45:43','2023-03-07 18:45:43'),(71,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:45:48','2023-03-07 18:45:48'),(73,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:45:54','2023-03-07 18:45:54'),(75,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:46:01','2023-03-07 18:46:01'),(77,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:46:11','2023-03-07 18:46:11'),(79,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:46:16','2023-03-07 18:46:16'),(81,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:46:21','2023-03-07 18:46:21'),(83,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:46:29','2023-03-07 18:46:29'),(85,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:46:34','2023-03-07 18:46:34'),(88,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:47:41','2023-03-07 18:47:41'),(89,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:47:50','2023-03-07 18:47:50'),(91,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:48:02','2023-03-07 18:48:02'),(92,2,NULL,2,1,'2023-03-07 18:35:00',NULL,NULL,'2023-03-07 18:48:08','2023-03-07 18:48:08'),(94,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:48:14','2023-03-07 18:48:14'),(96,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:48:19','2023-03-07 18:48:19'),(98,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 21:50:58','2023-03-07 21:50:58'),(99,2,NULL,2,1,'2023-03-07 22:49:00',NULL,0,'2023-03-07 22:48:57','2023-03-07 22:49:57'),(100,2,NULL,2,1,'2023-03-07 22:49:00',NULL,NULL,'2023-03-07 22:49:57','2023-03-07 22:49:57'),(101,2,NULL,2,1,'2023-03-07 22:49:00',NULL,NULL,'2023-03-07 22:50:33','2023-03-07 22:50:33'),(102,2,NULL,2,1,'2023-03-07 22:49:00',NULL,NULL,'2023-03-07 22:50:40','2023-03-07 22:50:40'),(103,2,NULL,2,1,'2023-03-07 22:49:00',NULL,NULL,'2023-03-07 22:50:51','2023-03-07 22:50:51'),(110,2,NULL,2,1,NULL,NULL,0,'2023-03-07 22:52:59','2023-03-07 22:52:59'),(112,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 22:54:34','2023-03-07 22:54:34'),(114,2,NULL,2,1,'2023-03-07 22:49:00',NULL,NULL,'2023-03-07 22:54:50','2023-03-07 22:54:50'),(126,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 15:39:17','2023-03-14 15:39:17'),(127,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 15:39:29','2023-03-14 15:39:29'),(129,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 15:39:35','2023-03-14 15:39:35'),(131,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 15:39:43','2023-03-14 15:39:43'),(133,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 15:39:55','2023-03-14 15:39:55'),(135,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 15:40:08','2023-03-14 15:40:08'),(137,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 15:40:28','2023-03-14 15:40:28'),(139,2,NULL,2,1,'2023-03-07 18:35:00',NULL,NULL,'2023-03-14 15:40:39','2023-03-14 15:40:39'),(141,2,NULL,2,1,'2023-03-07 18:34:00',NULL,NULL,'2023-03-14 15:40:47','2023-03-14 15:40:47'),(143,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 15:40:55','2023-03-14 15:40:55'),(145,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 16:12:02','2023-03-14 16:12:02'),(148,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 23:47:44','2023-03-14 23:47:44'),(149,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:49:06','2023-03-14 23:49:06'),(151,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:49:11','2023-03-14 23:49:11'),(153,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 23:49:17','2023-03-14 23:49:17'),(155,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:49:24','2023-03-14 23:49:24'),(156,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 23:49:29','2023-03-14 23:49:29'),(157,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 23:49:34','2023-03-14 23:49:34'),(158,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 23:49:39','2023-03-14 23:49:39'),(159,2,NULL,2,1,'2023-03-07 18:35:00',NULL,NULL,'2023-03-14 23:49:43','2023-03-14 23:49:43'),(160,2,NULL,2,1,'2023-03-07 18:34:00',NULL,NULL,'2023-03-14 23:49:54','2023-03-14 23:49:54'),(162,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 23:50:04','2023-03-14 23:50:04'),(163,2,NULL,2,1,'2023-03-07 22:49:00',NULL,NULL,'2023-03-14 23:50:09','2023-03-14 23:50:09'),(164,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 23:52:36','2023-03-14 23:52:36'),(165,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:52:48','2023-03-14 23:52:48'),(166,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:52:55','2023-03-14 23:52:55'),(167,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 23:53:00','2023-03-14 23:53:00'),(168,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:53:05','2023-03-14 23:53:05'),(169,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:53:10','2023-03-14 23:53:10'),(170,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 23:53:17','2023-03-14 23:53:17'),(171,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:55:00','2023-03-14 23:55:00'),(173,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:55:18','2023-03-14 23:55:18'),(175,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:55:32','2023-03-14 23:55:32'),(176,2,NULL,2,1,'2023-07-07 08:27:00',NULL,NULL,'2023-07-07 08:27:51','2023-07-07 08:27:58'),(177,2,NULL,2,1,'2023-07-07 08:27:00',NULL,NULL,'2023-07-07 08:27:58','2023-07-07 08:27:58'),(178,2,NULL,2,1,'2023-07-07 08:28:00',NULL,NULL,'2023-07-07 08:28:00','2023-07-07 08:28:00'),(179,2,NULL,2,1,'2023-07-07 08:28:00',NULL,NULL,'2023-07-07 08:28:03','2023-07-07 08:28:03'),(180,2,NULL,2,1,'2023-07-07 08:28:00',NULL,NULL,'2023-07-07 08:28:05','2023-07-07 08:28:14'),(181,2,NULL,2,1,'2023-07-07 08:28:00',NULL,NULL,'2023-07-07 08:28:14','2023-07-07 08:28:14'),(182,2,NULL,2,1,'2023-07-07 08:28:00',NULL,NULL,'2023-07-07 08:28:17','2023-07-07 08:28:22'),(183,2,NULL,2,1,'2023-07-07 08:28:00',NULL,NULL,'2023-07-07 08:28:22','2023-07-07 08:28:22'),(184,2,NULL,2,1,'2023-07-07 08:29:00',NULL,NULL,'2023-07-07 08:29:36','2023-07-07 08:29:47'),(185,2,NULL,2,1,'2023-07-07 08:29:00',NULL,NULL,'2023-07-07 08:29:47','2023-07-07 08:29:47'),(186,2,NULL,2,1,'2023-07-07 08:30:04',NULL,NULL,'2023-07-07 08:30:04','2023-07-07 08:30:04'),(188,2,NULL,2,1,'2023-07-07 08:29:00',NULL,NULL,'2023-07-07 08:30:22','2023-07-07 08:30:22'),(189,2,NULL,2,1,'2023-07-07 08:30:00',NULL,NULL,'2023-07-07 08:30:35','2023-07-07 08:30:45'),(190,2,NULL,2,1,'2023-07-07 08:30:00',NULL,NULL,'2023-07-07 08:30:45','2023-07-07 08:30:45'),(191,2,NULL,2,1,'2023-07-07 08:31:00',NULL,NULL,'2023-07-07 08:30:56','2023-07-07 08:31:01'),(192,2,NULL,2,1,'2023-07-07 08:31:00',NULL,NULL,'2023-07-07 08:31:01','2023-07-07 08:31:01'),(193,2,NULL,2,1,'2023-07-07 08:31:00',NULL,NULL,'2023-07-07 08:31:20','2023-07-07 08:31:27'),(194,2,NULL,2,1,'2023-07-07 08:31:00',NULL,NULL,'2023-07-07 08:31:28','2023-07-07 08:31:28'),(195,2,NULL,2,1,'2023-07-07 08:31:00',NULL,NULL,'2023-07-07 08:31:47','2023-07-07 08:31:58'),(196,2,NULL,2,1,'2023-07-07 08:31:00',NULL,NULL,'2023-07-07 08:31:58','2023-07-07 08:31:58'),(197,2,NULL,2,1,'2023-07-07 08:32:00',NULL,NULL,'2023-07-07 08:32:05','2023-07-07 08:32:12'),(198,2,NULL,2,1,'2023-07-07 08:32:00',NULL,NULL,'2023-07-07 08:32:12','2023-07-07 08:32:12'),(200,2,NULL,2,1,'2023-07-07 08:31:00',NULL,NULL,'2023-07-07 08:32:55','2023-07-07 08:32:55'),(202,2,NULL,2,1,'2023-07-07 08:32:00',NULL,NULL,'2023-07-07 08:33:21','2023-07-07 08:33:21'),(204,2,NULL,2,1,'2023-07-07 08:28:00',NULL,NULL,'2023-07-07 08:33:45','2023-07-07 08:33:45'),(206,2,NULL,2,1,'2023-07-07 08:30:00',NULL,NULL,'2023-07-07 08:34:13','2023-07-07 08:34:13'),(208,2,NULL,2,1,'2023-07-07 08:31:00',NULL,NULL,'2023-07-07 08:34:39','2023-07-07 08:34:39'),(210,2,NULL,2,1,'2023-07-07 08:28:00',NULL,NULL,'2023-07-07 08:35:15','2023-07-07 08:35:15'),(212,2,NULL,2,1,'2023-07-07 08:27:00',NULL,NULL,'2023-07-07 08:35:43','2023-07-07 08:35:43'),(214,2,NULL,2,1,'2023-07-07 08:31:00',NULL,NULL,'2023-07-07 08:36:10','2023-07-07 08:36:10'),(216,2,NULL,2,1,'2023-07-07 08:29:00',NULL,NULL,'2023-07-07 08:36:40','2023-07-07 08:36:40'),(218,2,NULL,2,1,'2023-07-07 08:28:00',NULL,NULL,'2023-07-07 08:37:16','2023-07-07 08:37:16');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Default','default',1,'site',NULL,NULL,1,'2023-03-07 17:54:19','2023-03-07 17:54:19','2023-07-07 08:18:28','fdd6118c-6893-4a3f-82dc-5d797b40339f'),(2,2,2,'Event','event',1,'site',NULL,NULL,1,'2023-03-07 17:54:51','2023-07-07 08:20:11',NULL,'d617503a-3829-4390-9c8f-7fb6612a702c');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2023-02-02 05:28:23','2023-02-02 05:28:23',NULL,'31006d4c-2f40-498c-9a4c-69cff4fd4279');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (11,2,12,5,0,1,'2023-07-07 08:20:11','2023-07-07 08:20:11','cea0aa12-f277-4498-9a66-e6539d51f150');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2023-03-07 17:54:19','2023-03-07 17:54:19','2023-07-07 08:18:28','bbe523c9-3019-4685-8997-f968e4341cd9'),(2,'craft\\elements\\Entry','2023-03-07 17:54:51','2023-03-07 17:54:51',NULL,'ea4a2d84-4ee4-4e07-b611-df7eafaf14cc'),(3,'craft\\elements\\Asset','2023-03-07 18:03:06','2023-03-07 18:03:06',NULL,'982d1856-ab0d-4255-99af-3b9b2cf21e73'),(4,'craft\\elements\\Asset','2023-03-07 18:16:02','2023-03-07 18:16:02',NULL,'66ef7281-e405-4f5b-81a4-51ba160e5768');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (6,4,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"8ef6d285-1c44-4e20-87de-02f30372640a\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-03-07 18:16:02','2023-03-07 18:16:02','f2b86cca-f27a-4f80-9915-dbe2a27acd94'),(7,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"289c07ee-2fd9-431e-a854-74d81c57c595\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"6934f460-88a8-4738-983f-96dfb2623fd8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6b6005ce-5d9a-4135-a8d1-48ae9c595f28\"}]',1,'2023-03-07 18:17:31','2023-03-07 18:17:31','11847b00-6470-45a9-bdb1-eff52861c646'),(11,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"53c06e16-eeec-47bd-93f6-bbedc9108d74\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-03-14 15:38:32','2023-03-14 15:38:32','ac7d28ea-81c0-4cf4-8e68-d37c81cb05c9'),(12,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"5fdac679-4921-4fb2-939b-88793a3666d6\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"9d3e9bd3-6011-4ffe-b601-dc5f166eb59a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"2b6ba2fc-c9f5-4598-a893-7dd3931f97b0\"}]',1,'2023-07-07 08:20:11','2023-07-07 08:20:11','39f6a1f9-5e31-41bb-ad6b-30dd22aefc80');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (5,1,'Dates','dates','global','hozrxife',NULL,0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a date\",\"columnType\":\"text\",\"columns\":{\"col1\":{\"heading\":\"Date\",\"handle\":\"date\",\"width\":\"\",\"type\":\"date\"},\"col2\":{\"heading\":\"Time\",\"handle\":\"time\",\"width\":\"\",\"type\":\"time\"}},\"maxRows\":null,\"minRows\":1}','2023-07-07 08:19:51','2023-07-07 08:19:51','2b6ba2fc-c9f5-4598-a893-7dd3931f97b0');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.4.15','4.4.0.4',0,'rbywjibqpzhu','3@jxsbnosthc','2023-02-02 05:28:23','2023-07-07 08:25:30','876de66d-7fde-40c5-b8b8-c4713c00d927');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','32ccba4d-556b-4fcd-9e7c-73a2e60aed4d'),(2,'craft','m210121_145800_asset_indexing_changes','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','110963d6-acbc-4052-ba24-5343051e4663'),(3,'craft','m210624_222934_drop_deprecated_tables','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','09e2ddd5-cb53-449a-bb38-f233c1571174'),(4,'craft','m210724_180756_rename_source_cols','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','ecb98123-06eb-4d65-9dae-588f920f5d1b'),(5,'craft','m210809_124211_remove_superfluous_uids','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','4de6ac73-1c13-4a53-8eaf-565ed1117d92'),(6,'craft','m210817_014201_universal_users','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','130028a6-a406-4471-96fb-6758b9525b0e'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','4b37ada2-81f1-4985-b0e5-e674b34e2968'),(8,'craft','m211115_135500_image_transformers','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','34b2fc16-745c-42d5-b4fb-e7ffbc312d7b'),(9,'craft','m211201_131000_filesystems','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','aca6e315-e112-496c-ba73-6e19bb36b7f3'),(10,'craft','m220103_043103_tab_conditions','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','8aa8b2fe-a585-4c84-8e23-1b3045b48e7a'),(11,'craft','m220104_003433_asset_alt_text','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','51804ab1-3c62-442e-a212-6fb539d779d5'),(12,'craft','m220123_213619_update_permissions','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','72bd9363-4be6-4094-bc55-b0aaf45b391b'),(13,'craft','m220126_003432_addresses','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','beb0b304-1443-4ca0-92e2-e2a93c99298f'),(14,'craft','m220209_095604_add_indexes','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','014c11d1-9f1b-4af9-b67b-6252d934ac91'),(15,'craft','m220213_015220_matrixblocks_owners_table','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','25e7db17-b5f4-470a-adf0-dae78569929b'),(16,'craft','m220214_000000_truncate_sessions','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','1451ff20-81bc-4270-890e-76ab3ede9c1c'),(17,'craft','m220222_122159_full_names','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','582ce54c-5d9d-42e4-a7ed-f01688cdc688'),(18,'craft','m220223_180559_nullable_address_owner','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','b95f7ab9-3df4-4bd2-bb9c-63a725405fa2'),(19,'craft','m220225_165000_transform_filesystems','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','04098051-2cc1-4706-96fc-6bd2af52dce4'),(20,'craft','m220309_152006_rename_field_layout_elements','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','ef9220f2-be58-466a-b464-dfa3a1c56e5d'),(21,'craft','m220314_211928_field_layout_element_uids','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','e1788361-9335-4b86-b917-08bbcab2cadb'),(22,'craft','m220316_123800_transform_fs_subpath','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','ac64d940-5a66-4f42-963d-0b31a660e0bd'),(23,'craft','m220317_174250_release_all_jobs','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','aa45919d-0094-40b9-9b56-12243f138a81'),(24,'craft','m220330_150000_add_site_gql_schema_components','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','15f9020e-4c57-4f00-a078-78245121f93f'),(25,'craft','m220413_024536_site_enabled_string','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','f7899074-4588-4744-be09-408addd05e81'),(26,'craft','m221027_160703_add_image_transform_fill','2023-03-14 15:59:08','2023-03-14 15:59:08','2023-03-14 15:59:08','3a713625-d4b2-4947-b66c-71a4fa1cbaf2'),(27,'craft','m221028_130548_add_canonical_id_index','2023-03-14 15:59:08','2023-03-14 15:59:08','2023-03-14 15:59:08','83b28248-de19-4756-a94e-2c687cb60cb2'),(28,'craft','m221118_003031_drop_element_fks','2023-03-14 15:59:08','2023-03-14 15:59:08','2023-03-14 15:59:08','fb063937-9399-47e3-9a2f-adb271711742'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2023-03-14 15:59:08','2023-03-14 15:59:08','2023-03-14 15:59:08','6f653d4e-9122-4280-bb8a-abb15d6e64d7'),(30,'craft','m230226_013114_drop_plugin_license_columns','2023-03-14 15:59:08','2023-03-14 15:59:08','2023-03-14 15:59:08','c675263f-73c8-48a5-bbbb-f4849fd70620');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'elements-panel','2.0.0','1.0.0','2023-03-07 18:43:17','2023-03-07 18:43:17','2023-03-14 15:55:33','f95e311e-ab01-4126-a56d-abd071347415');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1688718011'),('elementSources.craft\\elements\\Asset.0.defaultSort.0','\"filename\"'),('elementSources.craft\\elements\\Asset.0.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Asset.0.disabled','false'),('elementSources.craft\\elements\\Asset.0.key','\"volume:1b95b48c-6fd9-401d-bdc6-cd251a02d62b\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.0','\"filename\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.1','\"size\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.2','\"dateModified\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.3','\"uploader\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.4','\"link\"'),('elementSources.craft\\elements\\Asset.0.type','\"native\"'),('elementSources.craft\\elements\\Asset.1.defaultSort.0','\"filename\"'),('elementSources.craft\\elements\\Asset.1.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Asset.1.disabled','false'),('elementSources.craft\\elements\\Asset.1.key','\"volume:9f09fed0-269d-48bf-9b3a-4a0a3abc44e0\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.0','\"filename\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.1','\"size\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.2','\"dateModified\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.3','\"uploader\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.4','\"link\"'),('elementSources.craft\\elements\\Asset.1.type','\"native\"'),('elementSources.craft\\elements\\Asset.2.key','\"folder:52e0e4e6-a037-42c1-80dc-f7e300176065\"'),('elementSources.craft\\elements\\Asset.2.type','\"native\"'),('elementSources.craft\\elements\\Entry.0.defaultSort.0','\"field:6ba159b8-0e40-4ff9-b825-ceed90bdab7f\"'),('elementSources.craft\\elements\\Entry.0.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.0.disabled','false'),('elementSources.craft\\elements\\Entry.0.key','\"section:fa9f5968-32b5-4b05-b093-6bc4ef63ed9a\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.0','\"field:6ba159b8-0e40-4ff9-b825-ceed90bdab7f\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.1','\"field:846a33bd-87d8-4ec4-909f-32bd6399c92f\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.2','\"field:8278aaa3-21b9-457a-b25e-f0d5a43fdc35\"'),('elementSources.craft\\elements\\Entry.0.type','\"native\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.0','\"title\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.1.disabled','false'),('elementSources.craft\\elements\\Entry.1.key','\"section:c196afcb-c41e-4d19-8ff6-e95d277f98af\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes.0','\"field:6b6005ce-5d9a-4135-a8d1-48ae9c595f28\"'),('elementSources.craft\\elements\\Entry.1.type','\"native\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.2.disabled','false'),('elementSources.craft\\elements\\Entry.2.key','\"*\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.0','\"section\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.1','\"link\"'),('elementSources.craft\\elements\\Entry.2.type','\"native\"'),('email.fromEmail','\"info@domain.com\"'),('email.fromName','\"Craft Coding Challenge\"'),('email.replyToEmail','null'),('email.template','\"\"'),('email.transportSettings.command','\"/usr/sbin/sendmail -bs\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elementCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.autocapitalize','true'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.autocomplete','false'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.autocorrect','true'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.class','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.disabled','false'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.elementCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.id','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.instructions','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.label','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.max','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.min','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.name','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.orientation','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.placeholder','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.readonly','false'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.requirable','false'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.size','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.step','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.tip','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.title','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.uid','\"5fdac679-4921-4fb2-939b-88793a3666d6\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.userCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.warning','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.width','100'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.elementCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.fieldUid','\"2b6ba2fc-c9f5-4598-a893-7dd3931f97b0\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.instructions','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.label','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.required','false'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.tip','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.uid','\"9d3e9bd3-6011-4ffe-b601-dc5f166eb59a\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.userCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.warning','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.width','100'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.name','\"Content\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.uid','\"39f6a1f9-5e31-41bb-ad6b-30dd22aefc80\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.userCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.handle','\"event\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.hasTitleField','true'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.name','\"Event\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.section','\"fa9f5968-32b5-4b05-b093-6bc4ef63ed9a\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.sortOrder','1'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.titleFormat','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.titleTranslationKeyFormat','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.titleTranslationMethod','\"site\"'),('fieldGroups.31006d4c-2f40-498c-9a4c-69cff4fd4279.name','\"Common\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.columnSuffix','\"hozrxife\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.contentColumnType','\"text\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.fieldGroup','\"31006d4c-2f40-498c-9a4c-69cff4fd4279\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.handle','\"dates\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.instructions','null'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.name','\"Dates\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.searchable','false'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.addRowLabel','\"Add a date\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.0.0','\"col1\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Date\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.0.1.__assoc__.1.1','\"date\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.0.1.__assoc__.3.1','\"date\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.1.0','\"col2\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.1.1.__assoc__.0.1','\"Time\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.1.1.__assoc__.1.1','\"time\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columns.__assoc__.1.1.__assoc__.3.1','\"time\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.columnType','\"text\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.maxRows','null'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.settings.minRows','1'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.translationKeyFormat','null'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.translationMethod','\"none\"'),('fields.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0.type','\"craft\\\\fields\\\\Table\"'),('fs.competitors.hasUrls','true'),('fs.competitors.name','\"Competitors\"'),('fs.competitors.settings.path','\"@webroot/assets/competitors\"'),('fs.competitors.type','\"craft\\\\fs\\\\Local\"'),('fs.competitors.url','\"@web/assets/competitors\"'),('fs.flags.hasUrls','true'),('fs.flags.name','\"Flags\"'),('fs.flags.settings.path','\"@webroot/assets/flags\"'),('fs.flags.type','\"craft\\\\fs\\\\Local\"'),('fs.flags.url','\"@web/assets/flags\"'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('meta.__names__.0779f354-f5d2-4f82-9a36-28a252f70ce4','\"Public Schema\"'),('meta.__names__.0d89c679-f6f5-42ae-8341-4bea917c6af7','\"$CRAFT_SITE_NAME\"'),('meta.__names__.1b95b48c-6fd9-401d-bdc6-cd251a02d62b','\"Competitors\"'),('meta.__names__.2b6ba2fc-c9f5-4598-a893-7dd3931f97b0','\"Dates\"'),('meta.__names__.31006d4c-2f40-498c-9a4c-69cff4fd4279','\"Common\"'),('meta.__names__.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0','\"Flags\"'),('meta.__names__.c7c2807b-84cc-4e1f-9279-af044bc0b472','\"Public Schema\"'),('meta.__names__.d617503a-3829-4390-9c8f-7fb6612a702c','\"Event\"'),('meta.__names__.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6','\"$CRAFT_SITE_NAME\"'),('meta.__names__.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a','\"Events\"'),('plugins.elements-panel.edition','\"standard\"'),('plugins.elements-panel.enabled','true'),('plugins.elements-panel.schemaVersion','\"1.0.0\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.defaultPlacement','\"end\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.enableVersioning','true'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.handle','\"events\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.name','\"Events\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.propagationMethod','\"all\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.enabledByDefault','true'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.hasUrls','false'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.template','null'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.uriFormat','null'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.type','\"channel\"'),('siteGroups.0d89c679-f6f5-42ae-8341-4bea917c6af7.name','\"$CRAFT_SITE_NAME\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.enabled','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.handle','\"default\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.hasUrls','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.language','\"en-US\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.name','\"$CRAFT_SITE_NAME\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.primary','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.siteGroup','\"0d89c679-f6f5-42ae-8341-4bea917c6af7\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"$CRAFT_SITE_NAME\"'),('system.retryDuration','null'),('system.schemaVersion','\"4.4.0.4\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elementCondition','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.autocapitalize','true'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.autocomplete','false'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.autocorrect','true'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.class','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.disabled','false'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.elementCondition','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.id','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.instructions','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.label','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.max','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.min','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.name','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.orientation','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.placeholder','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.readonly','false'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.requirable','false'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.size','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.step','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.tip','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.title','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.uid','\"53c06e16-eeec-47bd-93f6-bbedc9108d74\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.userCondition','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.warning','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.width','100'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.name','\"Content\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.uid','\"ac7d28ea-81c0-4cf4-8e68-d37c81cb05c9\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.userCondition','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fs','\"competitors\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.handle','\"competitors\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.name','\"Competitors\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.sortOrder','1'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.titleTranslationKeyFormat','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.titleTranslationMethod','\"site\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.transformFs','\"\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.transformSubpath','\"\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elementCondition','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.autocapitalize','true'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.autocomplete','false'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.autocorrect','true'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.class','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.disabled','false'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.elementCondition','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.id','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.instructions','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.label','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.max','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.min','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.name','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.orientation','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.placeholder','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.readonly','false'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.requirable','false'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.size','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.step','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.tip','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.title','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.uid','\"8ef6d285-1c44-4e20-87de-02f30372640a\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.userCondition','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.warning','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.width','100'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.name','\"Content\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.uid','\"f2b86cca-f27a-4f80-9915-dbe2a27acd94\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.userCondition','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fs','\"flags\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.handle','\"flags\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.name','\"Flags\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.sortOrder','2'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.titleTranslationKeyFormat','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.titleTranslationMethod','\"site\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.transformFs','\"\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,''),(2,14,1,1,''),(3,16,1,1,''),(4,18,1,1,''),(5,20,1,1,''),(6,20,1,2,''),(7,23,1,1,''),(8,25,1,1,''),(9,27,1,1,''),(10,29,1,1,''),(11,32,1,1,''),(12,34,1,1,''),(13,37,1,1,''),(14,37,1,2,''),(15,40,1,1,''),(16,42,1,1,''),(17,44,1,1,''),(18,46,1,1,''),(19,48,1,1,''),(20,50,1,1,''),(21,53,1,1,''),(22,48,1,2,'Applied “Draft 1”'),(23,48,1,3,'Applied “Draft 1”'),(24,44,1,2,'Applied “Draft 1”'),(25,55,1,1,''),(26,44,1,3,'Applied “Draft 1”'),(27,55,1,2,'Applied “Draft 1”'),(28,53,1,2,'Applied “Draft 1”'),(29,42,1,2,'Applied “Draft 1”'),(30,34,1,2,'Applied “Draft 1”'),(31,37,1,3,'Applied “Draft 1”'),(32,46,1,2,'Applied “Draft 1”'),(33,44,1,4,'Applied “Draft 1”'),(34,48,1,4,'Applied “Draft 1”'),(35,40,1,2,'Applied “Draft 1”'),(36,50,1,2,'Applied “Draft 1”'),(37,46,1,3,'Applied “Draft 1”'),(38,50,1,3,''),(39,42,1,3,'Applied “Draft 1”'),(40,55,1,3,''),(41,34,1,3,''),(42,37,1,4,''),(43,50,1,4,'Applied “Draft 1”'),(44,99,1,1,''),(45,99,1,2,''),(46,99,1,3,NULL),(47,99,1,4,NULL),(51,37,1,5,'Applied “Draft 1”'),(52,99,1,5,'Applied “Draft 1”'),(53,46,1,4,'Applied “Draft 1”'),(54,44,1,5,'Applied “Draft 1”'),(55,50,1,5,'Applied “Draft 1”'),(56,48,1,5,''),(57,42,1,4,''),(58,40,1,3,'Applied “Draft 1”'),(59,37,1,6,''),(60,55,1,4,''),(61,53,1,3,'Applied “Draft 1”'),(62,34,1,4,''),(63,44,1,6,'Applied “Draft 1”'),(64,34,1,5,'Applied “Draft 1”'),(65,46,1,5,'Applied “Draft 1”'),(66,44,1,7,'Applied “Draft 1”'),(67,50,1,6,'Applied “Draft 1”'),(68,42,1,5,'Applied “Draft 1”'),(69,48,1,6,''),(70,37,1,7,''),(71,40,1,4,''),(72,55,1,5,''),(73,53,1,4,''),(74,34,1,6,'Applied “Draft 1”'),(75,99,1,6,''),(76,50,1,7,''),(77,46,1,6,''),(78,44,1,8,''),(79,50,1,8,''),(80,42,1,6,''),(81,42,1,7,''),(82,48,1,7,''),(83,44,1,9,'Applied “Draft 1”'),(84,44,1,10,'Applied “Draft 1”'),(85,176,1,1,''),(86,178,1,1,''),(87,180,1,1,''),(88,182,1,1,''),(89,184,1,1,''),(90,184,1,2,'Applied “Draft 1”'),(91,189,1,1,''),(92,191,1,1,''),(93,193,1,1,''),(94,195,1,1,''),(95,197,1,1,''),(96,191,1,2,'Applied “Draft 1”'),(97,197,1,2,'Applied “Draft 1”'),(98,182,1,2,'Applied “Draft 1”'),(99,189,1,2,'Applied “Draft 1”'),(100,195,1,2,'Applied “Draft 1”'),(101,180,1,2,'Applied “Draft 1”'),(102,176,1,2,'Applied “Draft 1”'),(103,193,1,2,'Applied “Draft 1”'),(104,184,1,3,'Applied “Draft 1”'),(105,178,1,2,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' info nystudio107 com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' greece '),(2,'title',0,1,' greece '),(3,'extension',0,1,' jpg '),(3,'filename',0,1,' japan 1289 jpg '),(3,'kind',0,1,' image '),(3,'slug',0,1,''),(3,'title',0,1,' japan 1289 '),(4,'extension',0,1,' jpg '),(4,'filename',0,1,' brazil 1295 jpg '),(4,'kind',0,1,' image '),(4,'slug',0,1,''),(4,'title',0,1,' brazil 1295 '),(5,'extension',0,1,' jpg '),(5,'filename',0,1,' portugal3 1481 jpg '),(5,'kind',0,1,' image '),(5,'slug',0,1,''),(5,'title',0,1,' portugal3 1481 '),(6,'extension',0,1,' webp '),(6,'filename',0,1,' canada 1276 webp '),(6,'kind',0,1,' image '),(6,'slug',0,1,''),(6,'title',0,1,' canada 1276 '),(7,'extension',0,1,' jpg '),(7,'filename',0,1,' greece 1280 jpg '),(7,'kind',0,1,' image '),(7,'slug',0,1,''),(7,'title',0,1,' greece 1280 '),(8,'extension',0,1,' jpg '),(8,'filename',0,1,' mexico 1311 jpg '),(8,'kind',0,1,' image '),(8,'slug',0,1,''),(8,'title',0,1,' mexico 1311 '),(9,'extension',0,1,' jpg '),(9,'filename',0,1,' turkey 1274 jpg '),(9,'kind',0,1,' image '),(9,'slug',0,1,''),(9,'title',0,1,' turkey 1274 '),(10,'extension',0,1,' jpg '),(10,'filename',0,1,' spain2 1509 jpg '),(10,'kind',0,1,' image '),(10,'slug',0,1,''),(10,'title',0,1,' spain2 1509 '),(11,'extension',0,1,' jpg '),(11,'filename',0,1,' france 1244 jpg '),(11,'kind',0,1,' image '),(11,'slug',0,1,''),(11,'title',0,1,' france 1244 '),(12,'extension',0,1,' jpg '),(12,'filename',0,1,' australia 1304 jpg '),(12,'kind',0,1,' image '),(12,'slug',0,1,''),(12,'title',0,1,' australia 1304 '),(14,'slug',0,1,' brazil '),(14,'title',0,1,' brazil '),(16,'slug',0,1,' australia '),(16,'title',0,1,' australia '),(18,'slug',0,1,' france '),(18,'title',0,1,' france '),(20,'slug',0,1,' mexico '),(20,'title',0,1,' mexico '),(23,'slug',0,1,' spain '),(23,'title',0,1,' spain '),(25,'slug',0,1,' japan '),(25,'title',0,1,' japan '),(27,'slug',0,1,' portugal '),(27,'title',0,1,' portugal '),(29,'slug',0,1,' canada '),(29,'title',0,1,' canada '),(31,'slug',0,1,' temp gzxtiyduookdkysnqmgglpvxxacueuozlwbg '),(31,'title',0,1,''),(32,'slug',0,1,' turkey '),(32,'title',0,1,' turkey '),(34,'slug',0,1,' clare ellis '),(34,'title',0,1,' clare ellis '),(35,'extension',0,1,' png '),(35,'filename',0,1,' limbo png '),(35,'kind',0,1,' image '),(35,'slug',0,1,''),(35,'title',0,1,' limbo '),(37,'slug',0,1,' cole carr '),(37,'title',0,1,' cole carr '),(40,'slug',0,1,' richard pacheco '),(40,'title',0,1,' richard pacheco '),(42,'slug',0,1,' bryson sanchez '),(42,'title',0,1,' bryson sanchez '),(44,'slug',0,1,' mekhi roman '),(44,'title',0,1,' mekhi roman '),(46,'slug',0,1,' izaiah cruz '),(46,'title',0,1,' izaiah cruz '),(48,'slug',0,1,' omar durham '),(48,'title',0,1,' omar durham '),(50,'slug',0,1,' simone munoz '),(50,'title',0,1,' simone munoz '),(52,'slug',0,1,' temp pmtqbgmubposriqnogaexmrdgwnakcbqaaae '),(52,'title',0,1,''),(53,'slug',0,1,' beau prince '),(53,'title',0,1,' beau prince '),(55,'slug',0,1,' azalea clay '),(55,'title',0,1,' azalea clay '),(63,'slug',0,1,' temp sdzyswmvltboadhnlqguugdkknhlmfkpnyxe '),(63,'title',0,1,''),(99,'slug',0,1,' substitute prime '),(99,'title',0,1,' sub prime '),(110,'slug',0,1,' temp fedqzevpvfvqeyqrgrupekcabsjkfllwbqlp '),(110,'title',0,1,''),(115,'extension',0,1,' svg '),(115,'filename',0,1,' limbo competitor 04 svg '),(115,'kind',0,1,' image '),(115,'slug',0,1,''),(115,'title',0,1,' limbo competitor 04 '),(116,'extension',0,1,' svg '),(116,'filename',0,1,' limbo competitor 05 svg '),(116,'kind',0,1,' image '),(116,'slug',0,1,''),(116,'title',0,1,' limbo competitor 05 '),(117,'extension',0,1,' svg '),(117,'filename',0,1,' limbo competitor 03 svg '),(117,'kind',0,1,' image '),(117,'slug',0,1,''),(117,'title',0,1,' limbo competitor 03 '),(118,'extension',0,1,' svg '),(118,'filename',0,1,' limbo competitor 02 svg '),(118,'kind',0,1,' image '),(118,'slug',0,1,''),(118,'title',0,1,' limbo competitor 02 '),(119,'extension',0,1,' svg '),(119,'filename',0,1,' limbo competitor 08 svg '),(119,'kind',0,1,' image '),(119,'slug',0,1,''),(119,'title',0,1,' limbo competitor 08 '),(120,'extension',0,1,' svg '),(120,'filename',0,1,' limbo competitor 09 svg '),(120,'kind',0,1,' image '),(120,'slug',0,1,''),(120,'title',0,1,' limbo competitor 09 '),(121,'extension',0,1,' svg '),(121,'filename',0,1,' limbo competitor 10 svg '),(121,'kind',0,1,' image '),(121,'slug',0,1,''),(121,'title',0,1,' limbo competitor 10 '),(122,'extension',0,1,' svg '),(122,'filename',0,1,' limbo competitor 07 svg '),(122,'kind',0,1,' image '),(122,'slug',0,1,''),(122,'title',0,1,' limbo competitor 07 '),(123,'extension',0,1,' svg '),(123,'filename',0,1,' limbo competitor 01 svg '),(123,'kind',0,1,' image '),(123,'slug',0,1,''),(123,'title',0,1,' limbo competitor 01 '),(124,'extension',0,1,' svg '),(124,'filename',0,1,' limbo competitor 06 svg '),(124,'kind',0,1,' image '),(124,'slug',0,1,''),(124,'title',0,1,' limbo competitor 06 '),(171,'slug',0,1,' izaiah cruz '),(171,'title',0,1,' izaiah cruz '),(176,'slug',0,1,' razzle dazzle '),(176,'title',0,1,' razzle dazzle '),(178,'slug',0,1,' untamed night '),(178,'title',0,1,' untamed night '),(180,'slug',0,1,' martinis at midnight '),(180,'title',0,1,' thirsty thursday '),(182,'slug',0,1,' ghouls night out '),(182,'title',0,1,' ghous night out '),(184,'slug',0,1,' ryans summerpool party '),(184,'title',0,1,' ryas popsicle party '),(186,'slug',0,1,' temp estrbkwlefkedkdjytyoshwmmedjebujqxqq '),(186,'title',0,1,''),(189,'slug',0,1,' go fly andrews kite '),(189,'title',0,1,' go fly andrews kite '),(191,'slug',0,1,' bens big shift '),(191,'title',0,1,' bes big shift '),(193,'slug',0,1,' rocking rollick '),(193,'title',0,1,' rocking rollick '),(195,'slug',0,1,' martinis at michaels '),(195,'title',0,1,' martinis at michaes '),(197,'slug',0,1,' booty balooza '),(197,'title',0,1,' booty balooza ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Countries','countries','channel',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-03-07 17:54:19','2023-03-07 17:54:19','2023-07-07 08:18:28','c196afcb-c41e-4d19-8ff6-e95d277f98af'),(2,NULL,'Events','events','channel',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-03-07 17:54:51','2023-07-07 08:18:42',NULL,'fa9f5968-32b5-4b05-b093-6bc4ef63ed9a');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,0,NULL,NULL,1,'2023-03-07 17:54:19','2023-03-07 17:54:19','25aa2ea3-2f16-4702-81d4-ecd3bf65ba40'),(2,2,1,0,NULL,NULL,1,'2023-03-07 17:54:51','2023-03-07 17:54:51','b427fac5-51b5-4daa-a560-940c1006caa6');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'$CRAFT_SITE_NAME','2023-02-02 05:28:23','2023-02-02 20:38:11',NULL,'0d89c679-f6f5-42ae-8341-4bea917c6af7');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','$CRAFT_SITE_NAME','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-02-02 05:28:23','2023-02-02 20:37:47',NULL,'f255ef6d-0c55-4bdc-9ced-f610bbb3bed6');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"notificationDuration\":\"5000\",\"showFieldHandles\":false,\"enableDebugToolbarForSite\":true,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin','',NULL,NULL,'info@nystudio107.com','$2y$13$crqJ.kzM.kBs.WsWGUxT9uUdR4Imi./d9prVKVya/MkWu/Bd/8.Ga','2023-07-07 11:26:13',NULL,NULL,NULL,'2023-07-07 11:26:10',NULL,1,NULL,NULL,NULL,0,'2023-02-02 05:28:24','2023-02-02 05:28:24','2023-07-07 11:26:13');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Competitors',NULL,'2023-03-07 18:03:06','2023-03-14 15:38:19','4e93e0ee-4d73-4a67-a31d-5d0972368c11'),(2,NULL,NULL,'Temporary filesystem',NULL,'2023-03-07 18:07:27','2023-03-07 18:07:27','cfd95049-96c2-41f6-aa70-1e5b1334fd5c'),(4,NULL,2,'Flags','','2023-03-07 18:16:02','2023-03-07 18:16:02','1d5dcf90-3601-4db4-ad28-21d7792c6dee'),(5,2,NULL,'user_1','user_1/','2023-03-14 15:37:33','2023-03-14 15:37:33','52e0e4e6-a037-42c1-80dc-f7e300176065');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,3,'Competitors','competitors','competitors','','','site',NULL,1,'2023-03-07 18:03:06','2023-03-14 15:38:32',NULL,'1b95b48c-6fd9-401d-bdc6-cd251a02d62b'),(2,4,'Flags','flags','flags','','','site',NULL,2,'2023-03-07 18:16:02','2023-03-07 18:16:02',NULL,'9f09fed0-269d-48bf-9b3a-4a0a3abc44e0');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','c53fbd79-71b8-4d8f-8c28-79fa730418d5'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','0882d0b5-810a-4e9e-adcc-3c52d35c6cee'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','b306bd06-fcad-4702-9075-fae37ad18291'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','70fc0edf-2bdd-4a72-ae90-5e6bb14e89d8');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-07 11:26:29
