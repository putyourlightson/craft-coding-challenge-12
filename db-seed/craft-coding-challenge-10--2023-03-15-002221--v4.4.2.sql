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
  `field_score_zsrmwbmz` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jqzcffcvmftihrofdryftwugozjhktgjmowf` (`elementId`,`siteId`),
  KEY `idx_bgwnufnpfnfbmgdoqopioxdnmcrqpzcvkwit` (`siteId`),
  KEY `idx_rgrowoyqhhhtdbdzruigjzffxuavqtqeicid` (`title`),
  CONSTRAINT `fk_bqomwnmcsbqexhsrvlxcibreijzftpuhlrwp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xsvqkvgigqgvjhiyogqkkwjkwxlflzzdyigl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=589 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
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

-- Dump completed on 2023-03-15  0:22:21
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
INSERT INTO `changedattributes` VALUES (1,1,'fullName','2023-03-07 18:04:04',0,1),(2,1,'postDate','2023-03-07 18:17:39',0,1),(2,1,'slug','2023-03-07 18:08:51',0,1),(2,1,'title','2023-03-07 18:08:51',0,1),(14,1,'postDate','2023-03-07 18:18:26',0,1),(14,1,'slug','2023-03-07 18:18:18',0,1),(14,1,'title','2023-03-07 18:18:18',0,1),(16,1,'postDate','2023-03-07 18:18:34',0,1),(16,1,'slug','2023-03-07 18:18:30',0,1),(16,1,'title','2023-03-07 18:18:30',0,1),(18,1,'postDate','2023-03-07 18:18:41',0,1),(18,1,'slug','2023-03-07 18:18:41',0,1),(18,1,'title','2023-03-07 18:18:41',0,1),(20,1,'postDate','2023-03-07 18:19:04',0,1),(20,1,'slug','2023-03-07 18:18:48',0,1),(20,1,'title','2023-03-07 18:18:48',0,1),(23,1,'postDate','2023-03-07 18:19:17',0,1),(23,1,'slug','2023-03-07 18:19:16',0,1),(23,1,'title','2023-03-07 18:19:16',0,1),(25,1,'postDate','2023-03-07 18:19:26',0,1),(25,1,'slug','2023-03-07 18:19:25',0,1),(25,1,'title','2023-03-07 18:19:25',0,1),(27,1,'postDate','2023-03-07 18:19:34',0,1),(27,1,'slug','2023-03-07 18:19:34',0,1),(27,1,'title','2023-03-07 18:19:34',0,1),(29,1,'postDate','2023-03-07 18:19:41',0,1),(29,1,'slug','2023-03-07 18:19:41',0,1),(29,1,'title','2023-03-07 18:19:41',0,1),(32,1,'postDate','2023-03-07 18:19:58',0,1),(32,1,'slug','2023-03-07 18:19:56',0,1),(32,1,'title','2023-03-07 18:19:56',0,1),(34,1,'enabled','2023-03-14 23:50:04',0,1),(34,1,'postDate','2023-03-07 18:30:08',0,1),(34,1,'slug','2023-03-07 18:20:10',0,1),(34,1,'title','2023-03-07 18:20:10',0,1),(37,1,'postDate','2023-03-07 18:30:24',0,1),(37,1,'slug','2023-03-07 18:30:18',0,1),(37,1,'title','2023-03-07 18:30:18',0,1),(40,1,'postDate','2023-03-07 18:30:40',0,1),(40,1,'slug','2023-03-07 18:30:33',0,1),(40,1,'title','2023-03-07 18:30:33',0,1),(42,1,'postDate','2023-03-07 18:31:00',0,1),(42,1,'slug','2023-03-07 18:30:57',0,1),(42,1,'title','2023-03-14 23:49:24',0,1),(44,1,'postDate','2023-03-07 18:31:15',0,1),(44,1,'slug','2023-03-07 18:31:09',0,1),(44,1,'title','2023-03-07 18:31:09',0,1),(46,1,'postDate','2023-03-07 18:31:44',0,1),(46,1,'slug','2023-03-07 18:31:36',0,1),(46,1,'title','2023-03-07 18:31:36',0,1),(48,1,'postDate','2023-03-07 18:32:06',0,1),(48,1,'slug','2023-03-07 18:34:39',0,1),(48,1,'title','2023-03-07 18:34:32',0,1),(50,1,'postDate','2023-03-07 18:32:46',0,1),(50,1,'slug','2023-03-07 18:32:39',0,1),(50,1,'title','2023-03-07 18:32:39',0,1),(53,1,'postDate','2023-03-07 18:34:14',0,1),(53,1,'slug','2023-03-07 18:34:11',0,1),(53,1,'title','2023-03-07 18:34:11',0,1),(55,1,'postDate','2023-03-07 18:35:34',0,1),(55,1,'slug','2023-03-07 18:35:28',0,1),(55,1,'title','2023-03-07 18:35:28',0,1),(99,1,'enabled','2023-03-07 22:50:52',0,1),(99,1,'postDate','2023-03-07 22:49:57',0,1),(99,1,'slug','2023-03-07 22:49:35',0,1),(99,1,'title','2023-03-07 22:50:33',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,2,'2023-03-07 18:16:29',0,1),(2,1,4,'2023-03-07 18:17:38',0,1),(14,1,4,'2023-03-07 18:18:22',0,1),(16,1,4,'2023-03-07 18:18:33',0,1),(18,1,4,'2023-03-07 18:18:38',0,1),(20,1,4,'2023-03-07 18:18:45',0,1),(23,1,4,'2023-03-07 18:19:13',0,1),(25,1,4,'2023-03-07 18:19:20',0,1),(27,1,4,'2023-03-07 18:19:30',0,1),(29,1,4,'2023-03-07 18:19:38',0,1),(32,1,4,'2023-03-07 18:19:53',0,1),(34,1,1,'2023-03-07 18:20:16',0,1),(34,1,2,'2023-03-14 15:40:55',0,1),(34,1,3,'2023-03-14 23:50:04',0,1),(37,1,1,'2023-03-07 18:30:21',0,1),(37,1,2,'2023-03-14 15:40:28',0,1),(37,1,3,'2023-03-14 23:49:34',0,1),(40,1,1,'2023-03-07 18:30:35',0,1),(40,1,2,'2023-03-14 15:40:08',0,1),(40,1,3,'2023-03-14 23:49:39',0,1),(42,1,1,'2023-03-07 18:30:56',0,1),(42,1,2,'2023-03-14 15:39:55',0,1),(42,1,3,'2023-03-14 23:53:10',0,1),(44,1,1,'2023-03-07 18:43:56',0,1),(44,1,2,'2023-03-14 23:55:32',0,1),(44,1,3,'2023-03-14 23:52:55',0,1),(46,1,1,'2023-03-07 18:31:40',0,1),(46,1,2,'2023-03-14 15:39:17',0,1),(46,1,3,'2023-03-14 23:52:48',0,1),(48,1,1,'2023-03-07 18:32:00',0,1),(48,1,2,'2023-03-14 15:39:43',0,1),(48,1,3,'2023-03-14 23:53:17',0,1),(50,1,1,'2023-03-07 21:50:58',0,1),(50,1,2,'2023-03-14 15:39:35',0,1),(50,1,3,'2023-03-14 23:53:00',0,1),(53,1,1,'2023-03-07 18:33:53',0,1),(53,1,2,'2023-03-14 15:40:47',0,1),(53,1,3,'2023-03-14 23:49:54',0,1),(55,1,1,'2023-03-07 18:35:30',0,1),(55,1,2,'2023-03-14 15:40:39',0,1),(55,1,3,'2023-03-14 23:49:43',0,1),(99,1,1,'2023-03-07 22:49:49',0,1),(99,1,2,'2023-03-07 22:49:52',0,1),(99,1,3,'2023-03-14 23:50:09',0,1),(171,1,2,'2023-03-14 23:55:00',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2023-02-02 05:28:23','2023-03-07 18:04:04','e5f6e318-4d9f-4ce0-9c87-be98e1bd6559',NULL),(2,2,1,'Greece','2023-03-07 18:07:27','2023-03-07 18:17:39','b85db902-6ba1-42ff-8cd6-19ba547513f9',NULL),(3,3,1,'Japan 1289','2023-03-07 18:16:10','2023-03-07 18:16:10','9a7a2296-7fde-4b79-9936-68b7305af5db',NULL),(4,4,1,'Brazil 1295','2023-03-07 18:16:10','2023-03-07 18:16:10','8b621ff0-d846-43d5-a90b-3cb1d8279f77',NULL),(5,5,1,'Portugal3 1481','2023-03-07 18:16:10','2023-03-07 18:16:10','5db3a662-7b44-41bb-8948-b1abba29718d',NULL),(6,6,1,'Canada 1276','2023-03-07 18:16:10','2023-03-07 18:16:10','1a27c2ef-733c-46b4-a0e5-7c1902fa6138',NULL),(7,7,1,'Greece 1280','2023-03-07 18:16:11','2023-03-07 18:16:11','047339eb-c861-4288-b81e-7a71efae7631',NULL),(8,8,1,'Mexico 1311','2023-03-07 18:16:11','2023-03-07 18:16:11','89f6b8f5-612a-46c3-9e4a-c448036b61ed',NULL),(9,9,1,'Turkey 1274','2023-03-07 18:16:11','2023-03-07 18:16:11','f3ae2b10-9fbf-4555-965b-df7f2c75ee13',NULL),(10,10,1,'Spain2 1509','2023-03-07 18:16:11','2023-03-07 18:16:11','03e2ddd3-1c43-4f22-bf32-16c63edb4087',NULL),(11,11,1,'France 1244','2023-03-07 18:16:12','2023-03-07 18:16:12','f00aa31e-8742-425f-9dee-d758dae4f531',NULL),(12,12,1,'Australia 1304','2023-03-07 18:16:12','2023-03-07 18:16:12','72074281-648e-4e4b-ab1c-8e107524defa',NULL),(13,13,1,'Greece','2023-03-07 18:17:39','2023-03-07 18:17:39','e8a1a8b2-419c-49b2-8e56-d935dcf566b2',NULL),(14,14,1,'Brazil','2023-03-07 18:18:14','2023-03-07 18:18:26','c91063fb-5a07-48d0-ac7a-7aef7dfc1881',NULL),(15,15,1,'Brazil','2023-03-07 18:18:26','2023-03-07 18:18:26','4f25f4fe-b7c7-49b6-b42e-d58afa89734b',NULL),(16,16,1,'Australia','2023-03-07 18:18:26','2023-03-07 18:18:34','d1694ab4-a375-47c8-9d6d-35db316c6dec',NULL),(17,17,1,'Australia','2023-03-07 18:18:34','2023-03-07 18:18:34','dd1b6adc-a60e-42a6-9a49-e802a377f05b',NULL),(18,18,1,'France','2023-03-07 18:18:34','2023-03-07 18:18:41','cbe71500-8cb1-4f6c-ac9f-d05152ab2059',NULL),(19,19,1,'France','2023-03-07 18:18:41','2023-03-07 18:18:41','c2169142-ac46-49db-9f93-818812cdb984',NULL),(20,20,1,'Mexico','2023-03-07 18:18:41','2023-03-07 18:19:06','1a856ada-b566-4b42-9af1-35444823012f',NULL),(21,21,1,'Mexico','2023-03-07 18:19:04','2023-03-07 18:19:04','d7af4b28-8bbc-43c4-8196-6ce3618b7f4c',NULL),(22,22,1,'Mexico','2023-03-07 18:19:06','2023-03-07 18:19:06','11626a77-187b-4cf1-8989-97ea8c194ddf',NULL),(23,23,1,'Spain','2023-03-07 18:19:06','2023-03-07 18:19:17','7d08cfbd-9cb8-4016-a98d-9e164997221e',NULL),(24,24,1,'Spain','2023-03-07 18:19:17','2023-03-07 18:19:17','4459cc01-c73c-4360-85a3-b917cd534c63',NULL),(25,25,1,'Japan','2023-03-07 18:19:17','2023-03-07 18:19:26','a1547b27-dd6d-4e7e-8e53-1011249099f9',NULL),(26,26,1,'Japan','2023-03-07 18:19:26','2023-03-07 18:19:26','4b0bd6a7-ad2f-4519-91f5-b8f513e90d9e',NULL),(27,27,1,'Portugal','2023-03-07 18:19:26','2023-03-07 18:19:34','1a385194-8473-4c1d-8b7a-a01aaf156c1f',NULL),(28,28,1,'Portugal','2023-03-07 18:19:34','2023-03-07 18:19:34','f5e6cf5d-b8a3-48f4-96a9-b2c721b0a95b',NULL),(29,29,1,'Canada','2023-03-07 18:19:34','2023-03-07 18:19:42','199b6191-b446-4697-871b-c32aaedb04a5',NULL),(30,30,1,'Canada','2023-03-07 18:19:42','2023-03-07 18:19:42','530c7cf0-7a8f-4637-841f-0313a6489f08',NULL),(31,31,1,NULL,'2023-03-07 18:19:42','2023-03-07 18:19:42','174a0e5c-c434-4969-9c7d-0c5c67da9a8a',NULL),(32,32,1,'Turkey','2023-03-07 18:19:47','2023-03-07 18:19:58','507c87ea-0295-4db6-976d-00b4b320f108',NULL),(33,33,1,'Turkey','2023-03-07 18:19:58','2023-03-07 18:19:58','a1f89fe6-8ff8-4c92-b05a-1b75af258f68',NULL),(34,34,1,'Clare Ellis','2023-03-07 18:20:06','2023-03-14 23:50:04','aa1a5542-3ba6-48f8-bffd-852c6d0fca4b',62),(35,35,1,'Limbo','2023-03-07 18:29:57','2023-03-07 18:29:57','a44d2ab0-0f34-4e64-b0d7-db7acfb66109',NULL),(36,36,1,'Clare Ellis','2023-03-07 18:30:08','2023-03-07 18:30:08','de3e45a8-7ebc-4589-8e4b-11a5b51cc4bf',NULL),(37,37,1,'Cole Carr','2023-03-07 18:30:08','2023-03-14 23:49:34','f77a5078-e010-4080-a925-17d68883feba',55),(38,38,1,'Cole Carr','2023-03-07 18:30:24','2023-03-07 18:30:24','d107a884-79cc-421d-a5ab-6496cc052059',NULL),(39,39,1,'Cole Carr','2023-03-07 18:30:26','2023-03-07 18:30:26','01218426-fcde-42ea-aff6-de4a64bd07d7',NULL),(40,40,1,'Richard Pacheco','2023-03-07 18:30:26','2023-03-14 23:49:39','a8584aa3-6979-4369-8739-64b7d6e7f6c9',59),(41,41,1,'Richard Pacheco','2023-03-07 18:30:40','2023-03-07 18:30:40','cf259111-3eec-4747-bd2d-dda2e4b41ef4',NULL),(42,42,1,'Bryson Sanchez','2023-03-07 18:30:40','2023-03-14 23:53:10','124434ca-d206-4884-9307-de115c5b7cf2',48),(43,43,1,'Bryson Sanchez','2023-03-07 18:31:00','2023-03-07 18:31:00','943ca2cb-487c-4f74-becf-e29bb5208b10',NULL),(44,44,1,'Mekhi Roman','2023-03-07 18:31:00','2023-03-14 23:55:32','4f81a0e0-a27d-4618-b215-1c53b17b55f1',39),(45,45,1,'Mekhi Roman','2023-03-07 18:31:15','2023-03-07 18:31:15','ce06dfd5-d51f-4a89-b32b-e9ade96c5a8f',NULL),(46,46,1,'Izaiah Cruz','2023-03-07 18:31:15','2023-03-14 23:52:48','4f702284-b921-4729-a936-d0e7345689a7',37),(47,47,1,'Izaiah Cruz','2023-03-07 18:31:44','2023-03-07 18:31:44','04aabf04-657a-40df-9a38-3c2012c085a4',NULL),(48,48,1,'Omar Durham','2023-03-07 18:31:44','2023-03-14 23:53:17','d17302ea-57bb-4ae3-a8f2-10590222c6bc',51),(49,49,1,'Mohammad Durham','2023-03-07 18:32:07','2023-03-07 18:32:07','369ca6dd-2e83-4048-a564-72b6fafff045',NULL),(50,50,1,'Simone Munoz','2023-03-07 18:32:07','2023-03-14 23:53:00','315b7426-32b5-41d0-920a-7e80fe837444',40),(51,51,1,'Simone Munoz','2023-03-07 18:32:46','2023-03-07 18:32:46','e35e5549-67ac-4b7f-b665-877ec2afaf6b',NULL),(52,52,1,NULL,'2023-03-07 18:32:46','2023-03-07 18:32:46','d6545d0b-ef1f-4130-9127-a298af108133',NULL),(53,53,1,'Beau Prince','2023-03-07 18:33:48','2023-03-14 23:49:54','1cabde6e-4fec-4afa-a751-14dc470a36d5',62),(54,54,1,'Beau Prince','2023-03-07 18:34:14','2023-03-07 18:34:14','638e0f08-b0b6-4b62-924c-c453c7322b39',NULL),(55,55,1,'Azalea Clay','2023-03-07 18:34:14','2023-03-14 23:49:43','1050202a-fdc6-4cf3-a26f-692e4732ffd9',61),(57,57,1,'Omar Durham','2023-03-07 18:34:32','2023-03-07 18:34:32','ae1ddac5-9f3e-4039-a6b5-0e702fde47f5',NULL),(59,59,1,'Omar Durham','2023-03-07 18:34:39','2023-03-07 18:34:39','6b20bd28-9088-4326-a8a3-13b12dbb68c0',NULL),(61,61,1,'Mekhi Roman','2023-03-07 18:34:56','2023-03-07 18:34:56','3535a726-7bdc-4355-a3be-f0c0b65d8055',NULL),(62,62,1,'Azalea Clay','2023-03-07 18:35:34','2023-03-07 18:35:34','7475b1a2-08e3-4d0c-96e5-22a0dfeedf71',NULL),(63,63,1,NULL,'2023-03-07 18:35:34','2023-03-07 18:35:34','a1f9588b-2f91-4ed1-a821-650964178ced',NULL),(65,65,1,'Mekhi Roman','2023-03-07 18:43:56','2023-03-07 18:43:56','011b7e5e-b50f-4ed7-a049-c823e3b5fb5a',NULL),(67,67,1,'Azalea Clay','2023-03-07 18:45:37','2023-03-07 18:45:37','18161ee3-d49a-4b94-9571-fb4675a9b415',5),(69,69,1,'Beau Prince','2023-03-07 18:45:43','2023-03-07 18:45:43','a23624fb-b33b-448b-bfa5-c30c410e6197',6),(71,71,1,'Bryson Sanchez','2023-03-07 18:45:48','2023-03-07 18:45:48','f3180832-e9a3-4b26-8b99-64cd692e4496',7),(73,73,1,'Clare Ellis','2023-03-07 18:45:54','2023-03-07 18:45:54','995bb2c3-c5c6-4bb1-a527-3b1d339c1d6e',2),(75,75,1,'Cole Carr','2023-03-07 18:46:01','2023-03-07 18:46:01','0cf11928-96eb-4054-a0fe-800decf74572',1),(77,77,1,'Izaiah Cruz','2023-03-07 18:46:11','2023-03-07 18:46:11','f232a85c-0213-406d-a48e-8af090d63628',9),(79,79,1,'Mekhi Roman','2023-03-07 18:46:16','2023-03-07 18:46:16','de44b464-87b1-448e-9f58-07b9ef985702',9),(81,81,1,'Omar Durham','2023-03-07 18:46:21','2023-03-07 18:46:21','8b401ee6-677a-45cd-af96-769bbbd63730',8),(83,83,1,'Richard Pacheco','2023-03-07 18:46:29','2023-03-07 18:46:29','727e40a5-c2bd-4094-8cbe-686eb0ec3499',7),(85,85,1,'Simone Munoz','2023-03-07 18:46:34','2023-03-07 18:46:34','ea043508-1f80-43d0-91a4-fdaa3e6d876f',8),(88,88,1,'Izaiah Cruz','2023-03-07 18:47:41','2023-03-07 18:47:41','16bd0be2-4f39-4d67-9e87-2494296077c4',10),(89,89,1,'Simone Munoz','2023-03-07 18:47:50','2023-03-07 18:47:50','c61c2a58-c6ea-4a09-a056-caadc376dccb',9),(91,91,1,'Bryson Sanchez','2023-03-07 18:48:02','2023-03-07 18:48:02','7e8d5098-93ba-4e1d-8226-d3a788e33c4d',8),(92,92,1,'Azalea Clay','2023-03-07 18:48:08','2023-03-07 18:48:08','309ae4e7-e84a-421c-b009-48fd6fdd4602',7),(94,94,1,'Clare Ellis','2023-03-07 18:48:14','2023-03-07 18:48:14','3b37edb6-0c8e-46f1-b4ed-a97a088983a5',5),(96,96,1,'Cole Carr','2023-03-07 18:48:19','2023-03-07 18:48:19','e4cfe631-17d4-408c-abca-9a8b0181a56c',4),(98,98,1,'Simone Munoz','2023-03-07 21:50:58','2023-03-07 21:50:58','02a450cf-6555-43f7-826e-2cf646fb5629',9),(99,99,1,'Sub Prime','2023-03-07 22:48:57','2023-03-14 23:50:09','a8c3c028-0337-45a0-b4cc-7fdf448934db',99),(100,100,1,'Substitute Prime','2023-03-07 22:49:57','2023-03-07 22:49:57','0e6e872c-3b56-4661-b9af-88229e1bf4ee',0),(101,101,1,'Sub Prime','2023-03-07 22:50:33','2023-03-07 22:50:33','a339a2e2-06b9-4e8c-a8d5-65fafa232bf6',0),(102,102,1,'Sub Prime','2023-03-07 22:50:40','2023-03-07 22:50:40','2e827652-c51e-4f7a-a302-88e1244dc7a9',0),(103,103,1,'Sub Prime','2023-03-07 22:50:51','2023-03-07 22:50:51','28394614-b723-4d57-908e-41dd6b955d53',0),(110,110,1,NULL,'2023-03-07 22:52:59','2023-03-07 22:52:59','54597636-53cd-4e1f-8898-375c01057d26',NULL),(112,112,1,'Cole Carr','2023-03-07 22:54:34','2023-03-07 22:54:34','836e8397-d2ea-402b-944d-270fc72c320b',7),(114,114,1,'Sub Prime','2023-03-07 22:54:50','2023-03-07 22:54:50','b8b2d5d9-c154-4744-886c-220a3eea732e',1),(115,115,1,'Limbo competitor 04','2023-03-14 15:37:42','2023-03-14 15:37:42','7b18b368-2862-4f51-8106-32363f485f05',NULL),(116,116,1,'Limbo competitor 05','2023-03-14 15:37:42','2023-03-14 15:37:42','12516b75-d854-46b2-9915-4d1190b4714c',NULL),(117,117,1,'Limbo competitor 03','2023-03-14 15:37:42','2023-03-14 15:37:42','4e28c522-1ad0-4f9d-a71b-fb1556806a68',NULL),(118,118,1,'Limbo competitor 02','2023-03-14 15:37:43','2023-03-14 15:37:43','78c8946b-448a-4775-9f1f-20307df9952b',NULL),(119,119,1,'Limbo competitor 08','2023-03-14 15:37:43','2023-03-14 15:37:43','edf8fd72-8c2b-477c-8a03-7bc1e5162e9a',NULL),(120,120,1,'Limbo competitor 09','2023-03-14 15:37:43','2023-03-14 15:37:43','ad620433-f6ff-4723-a931-be37f88b32ae',NULL),(121,121,1,'Limbo competitor 10','2023-03-14 15:37:43','2023-03-14 15:37:43','14c6f3f1-7252-4c55-9af4-549406d41738',NULL),(122,122,1,'Limbo competitor 07','2023-03-14 15:37:43','2023-03-14 15:37:43','b659a215-ca8c-4600-88de-a8e39031e582',NULL),(123,123,1,'Limbo competitor 01','2023-03-14 15:37:44','2023-03-14 15:37:44','5d59bd8d-e94a-460b-abeb-5c2e1cc628e8',NULL),(124,124,1,'Limbo competitor 06','2023-03-14 15:37:44','2023-03-14 15:37:44','a7afe9c5-ff4b-4423-992c-3c824ec8157b',NULL),(126,126,1,'Izaiah Cruz','2023-03-14 15:39:17','2023-03-14 15:39:17','9992704b-a605-4cf0-9af0-e214b9ea9c9c',10),(127,127,1,'Mekhi Roman','2023-03-14 15:39:29','2023-03-14 15:39:29','e13de115-b8ae-4b4b-94d6-a4ae1cc0c5a3',10),(129,129,1,'Simone Munoz','2023-03-14 15:39:35','2023-03-14 15:39:35','ad371b84-28b4-4fd2-bcbb-2becb8bc1bb8',9),(131,131,1,'Omar Durham','2023-03-14 15:39:43','2023-03-14 15:39:43','6fcae3c0-67f7-46fc-a15d-bdabef66c80b',8),(133,133,1,'Bryson Sanchez','2023-03-14 15:39:55','2023-03-14 15:39:55','178625e3-1536-41de-bd7f-999e766665c1',8),(135,135,1,'Richard Pacheco','2023-03-14 15:40:08','2023-03-14 15:40:08','5b957fca-76e7-4762-94f7-78274c5802f2',7),(137,137,1,'Cole Carr','2023-03-14 15:40:28','2023-03-14 15:40:28','5c9f355e-95e9-40a3-b9fd-d5da881a8e5d',7),(139,139,1,'Azalea Clay','2023-03-14 15:40:39','2023-03-14 15:40:39','07b5d063-6b75-486b-98b6-03fe6eeb3df3',7),(141,141,1,'Beau Prince','2023-03-14 15:40:47','2023-03-14 15:40:47','ba30a6fb-c866-46fe-842a-6b07fe30e95b',6),(143,143,1,'Clare Ellis','2023-03-14 15:40:55','2023-03-14 15:40:55','bb14f653-104c-4a04-ab96-b765b8c962dd',5),(145,145,1,'Mekhi Roman','2023-03-14 16:12:02','2023-03-14 16:12:02','ae2d733c-ab49-4b9a-8832-c53ad2660faf',9),(148,148,1,'Clare Ellis','2023-03-14 23:47:44','2023-03-14 23:47:44','626024b5-bb52-4f41-bf9b-2b2e76da7238',5),(149,149,1,'Izaiah Cruz','2023-03-14 23:49:06','2023-03-14 23:49:06','55d4885e-121b-4bb8-bc3d-afb5ee486e99',39),(151,151,1,'Mekhi Roman','2023-03-14 23:49:11','2023-03-14 23:49:11','e9de59e0-b49c-4d04-9d69-2578732d71c0',41),(153,153,1,'Simone Munoz','2023-03-14 23:49:17','2023-03-14 23:49:17','86238c58-7da8-459a-9d38-87fbeb1752a9',44),(155,155,1,'Bryson Sanchez','2023-03-14 23:49:24','2023-03-14 23:49:24','a1163606-9174-45d0-8321-c32dee10b6be',48),(156,156,1,'Omar Durham','2023-03-14 23:49:29','2023-03-14 23:49:29','b6443d01-e8b2-4d91-89b3-d703c6126db2',53),(157,157,1,'Cole Carr','2023-03-14 23:49:34','2023-03-14 23:49:34','573a4447-ee12-4084-a43f-daf1df96f55a',55),(158,158,1,'Richard Pacheco','2023-03-14 23:49:39','2023-03-14 23:49:39','a5873674-30b9-402d-a248-26db260c8007',59),(159,159,1,'Azalea Clay','2023-03-14 23:49:43','2023-03-14 23:49:43','a07d57ca-4802-4843-9c0a-63afb3e73982',61),(160,160,1,'Beau Prince','2023-03-14 23:49:54','2023-03-14 23:49:54','ee4b1445-e084-4394-9d8f-cedb9109e53e',62),(162,162,1,'Clare Ellis','2023-03-14 23:50:04','2023-03-14 23:50:04','b66d89cb-1e9e-4016-93e0-f1eabfbb94d7',62),(163,163,1,'Sub Prime','2023-03-14 23:50:09','2023-03-14 23:50:09','c9f99659-4f79-4ac9-b3af-9a428c29cf95',99),(164,164,1,'Simone Munoz','2023-03-14 23:52:36','2023-03-14 23:52:36','3d35a9d2-eb94-4a72-84bb-8d3a46ed1c6c',45),(165,165,1,'Izaiah Cruz','2023-03-14 23:52:48','2023-03-14 23:52:48','d5c41e9d-2bc1-488b-82c3-b45dee1e4d17',37),(166,166,1,'Mekhi Roman','2023-03-14 23:52:55','2023-03-14 23:52:55','c09eed00-bd24-4caa-ac81-138a72877038',39),(167,167,1,'Simone Munoz','2023-03-14 23:53:00','2023-03-14 23:53:00','fe270cc3-9ed6-4078-ac5c-d97dc69c8687',40),(168,168,1,'Bryson Sanchez','2023-03-14 23:53:05','2023-03-14 23:53:05','7707855e-ef26-491d-ac03-642914d3ffcd',45),(169,169,1,'Bryson Sanchez','2023-03-14 23:53:10','2023-03-14 23:53:10','b19433a8-e2b6-4a04-b57e-db9e6173ce52',48),(170,170,1,'Omar Durham','2023-03-14 23:53:17','2023-03-14 23:53:17','fa292f43-0e17-43c3-8889-31d0c7537bbd',51),(171,171,1,'Izaiah Cruz','2023-03-14 23:55:00','2023-03-14 23:55:00','527b0c01-a611-458d-ae03-1e443da9613b',37),(173,173,1,'Mekhi Roman','2023-03-14 23:55:18','2023-03-14 23:55:18','f550f1ae-55f9-4da8-8b22-c5519e6e71a3',39),(175,175,1,'Mekhi Roman','2023-03-14 23:55:32','2023-03-14 23:55:32','f3695a60-9306-45ca-a6fd-3c48ceb51fab',39);
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
INSERT INTO `drafts` VALUES (10,NULL,1,0,'First draft',NULL,0,NULL,0),(20,NULL,1,0,'First draft',NULL,0,NULL,0),(26,NULL,1,0,'First draft',NULL,0,NULL,0),(48,NULL,1,0,'First draft',NULL,0,NULL,0),(67,46,1,1,'Draft 1','',1,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-02-02 05:28:23','2023-03-07 18:04:04',NULL,NULL,'cdb3b2a1-cb8b-4271-bc6c-01ff3c34bcfd'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:07:27','2023-03-07 18:17:39',NULL,NULL,'bba388ac-1a58-4bc7-9ce7-ec6745d888ce'),(3,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:10','2023-03-07 18:16:10',NULL,NULL,'2ec63e93-6ff4-48f0-820c-124dc7384837'),(4,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:10','2023-03-07 18:16:10',NULL,NULL,'68c269c1-879a-44dd-9ce7-2e05ebac264a'),(5,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:10','2023-03-07 18:16:10',NULL,NULL,'d54c2dcb-0169-4db8-89d4-aea612979644'),(6,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:10','2023-03-07 18:16:10',NULL,NULL,'4309dcc2-0d00-45b1-bec5-20dfcb3430ae'),(7,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:11','2023-03-07 18:16:11',NULL,NULL,'18a21b2f-b698-4a16-a217-0987f7c536e1'),(8,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:11','2023-03-07 18:16:11',NULL,NULL,'e19c2db6-a20d-46e3-8951-ebb76f6b6625'),(9,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:11','2023-03-07 18:16:11',NULL,NULL,'c8517074-78a1-44bf-9122-4b98c7110ac0'),(10,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:11','2023-03-07 18:16:11',NULL,NULL,'d71964f5-50c5-4f30-935e-f1a445e6628a'),(11,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:12','2023-03-07 18:16:12',NULL,NULL,'bfeb0610-137f-4659-a03e-10c92e52a863'),(12,NULL,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2023-03-07 18:16:12','2023-03-07 18:16:12',NULL,NULL,'3c963bdb-36fb-410c-a22f-a7b521ef754e'),(13,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:17:39','2023-03-07 18:17:39',NULL,NULL,'d1f0b1d5-3bf5-4074-b9e4-aa37edb02344'),(14,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:14','2023-03-07 18:18:26',NULL,NULL,'095d8073-ff4d-41ef-bb0d-dfc100aa9025'),(15,14,NULL,2,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:26','2023-03-07 18:18:26',NULL,NULL,'3112b722-794b-462a-8a78-0dda322092b9'),(16,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:26','2023-03-07 18:18:34',NULL,NULL,'15c96258-439d-4399-9c88-89c97d45fec9'),(17,16,NULL,3,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:34','2023-03-07 18:18:34',NULL,NULL,'1abb9dc5-47dc-418a-8070-94ca1a964058'),(18,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:34','2023-03-07 18:18:41',NULL,NULL,'8d2fcdcc-3805-4fad-818c-baee0ed5b5f8'),(19,18,NULL,4,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:41','2023-03-07 18:18:41',NULL,NULL,'4e4f34b1-6f3b-4542-b6ac-d37ceae4a932'),(20,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:18:41','2023-03-07 18:19:06',NULL,NULL,'6ce8d3dd-4312-4242-9c09-43659410e44b'),(21,20,NULL,5,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:04','2023-03-07 18:19:04',NULL,NULL,'70d200e3-3223-4ae9-944b-c836a492e620'),(22,20,NULL,6,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:06','2023-03-07 18:19:06',NULL,NULL,'0ca5be92-1458-44f5-9f88-8bdc151b9039'),(23,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:06','2023-03-07 18:19:17',NULL,NULL,'6d69ebd1-916a-4fb2-8bcc-fb049aa5eb5d'),(24,23,NULL,7,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:17','2023-03-07 18:19:17',NULL,NULL,'67207b9f-5f5c-48f8-a775-b6fc5224d241'),(25,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:17','2023-03-07 18:19:26',NULL,NULL,'b4e1ddd3-07aa-42db-b33b-fefe22e95da9'),(26,25,NULL,8,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:26','2023-03-07 18:19:26',NULL,NULL,'7932784b-95a6-4e89-9fc5-39c47da511a7'),(27,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:26','2023-03-07 18:19:34',NULL,NULL,'bf9ddc0b-c1a2-4f1e-a582-959d8faf0259'),(28,27,NULL,9,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:34','2023-03-07 18:19:34',NULL,NULL,'1988ed8d-4531-4a10-9cba-440c1d7dc81d'),(29,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:34','2023-03-07 18:19:42',NULL,NULL,'1ebd98e1-e580-44fb-b576-772f727f9fa8'),(30,29,NULL,10,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:42','2023-03-07 18:19:42',NULL,NULL,'97490613-6326-44ff-a74e-e52f493ce922'),(31,NULL,10,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:42','2023-03-07 18:19:42',NULL,NULL,'3a9bcc1a-2d65-4123-909a-b72bda8ec685'),(32,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:47','2023-03-07 18:19:58',NULL,NULL,'25c6d7fa-03ba-446c-89ee-853d359e3849'),(33,32,NULL,11,1,'craft\\elements\\Entry',1,0,'2023-03-07 18:19:58','2023-03-07 18:19:58',NULL,NULL,'a9a457ad-6609-4f83-90e3-28d21fc1b69c'),(34,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:20:06','2023-03-14 23:50:04',NULL,NULL,'8a6b4532-5d75-400e-b678-3ce1e8709b44'),(35,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-07 18:29:57','2023-03-07 18:29:57',NULL,'2023-03-14 15:37:53','3df5a18b-325b-42de-a98e-f7a1871a1e1b'),(36,34,NULL,12,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:08','2023-03-07 18:30:08',NULL,NULL,'7f8652b9-68e4-47c3-90a5-bb42ae2e8894'),(37,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:08','2023-03-14 23:49:34',NULL,NULL,'d3af3620-d383-436e-aaf7-be8d118b59d6'),(38,37,NULL,13,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:24','2023-03-07 18:30:24',NULL,NULL,'37d3f439-055e-42e9-a35b-9e36049eb49d'),(39,37,NULL,14,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:26','2023-03-07 18:30:26',NULL,NULL,'93e57a66-f5de-4388-af58-290d0e62312f'),(40,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:26','2023-03-14 23:49:39',NULL,NULL,'2cafe334-8f93-401d-a022-f4c8430f69e2'),(41,40,NULL,15,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:40','2023-03-07 18:30:40',NULL,NULL,'64b85e82-c4e7-4b8b-8a87-c47fb06386b7'),(42,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:30:40','2023-03-14 23:53:10',NULL,NULL,'71e1be71-b468-4388-98db-5efa8b846374'),(43,42,NULL,16,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:31:00','2023-03-07 18:31:00',NULL,NULL,'339e0149-103d-4641-ae38-19d2ecefe465'),(44,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:31:00','2023-03-14 23:55:32',NULL,NULL,'106423b2-70b1-48e9-abb9-daef08aa4ee5'),(45,44,NULL,17,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:31:15','2023-03-07 18:31:15',NULL,NULL,'ab196bf6-c09b-46df-a778-bec0bdcacb1a'),(46,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:31:15','2023-03-14 23:52:48',NULL,NULL,'611f8fcc-8b92-4ae4-b20c-0e09312024e4'),(47,46,NULL,18,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:31:44','2023-03-07 18:31:44',NULL,NULL,'08d84a59-0f87-4960-8c86-eacbd8451ea9'),(48,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:31:44','2023-03-14 23:53:17',NULL,NULL,'4a3f5641-5c6f-4369-b5a4-85ffe5df8f6b'),(49,48,NULL,19,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:32:06','2023-03-07 18:32:07',NULL,NULL,'f292f343-bafd-4741-a1e3-6eeec84798b3'),(50,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:32:07','2023-03-14 23:53:00',NULL,NULL,'3a8277ae-a6db-41cc-a8c2-f8a8237f99bb'),(51,50,NULL,20,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:32:46','2023-03-07 18:32:46',NULL,NULL,'afbf6304-4df3-4282-bc1b-fe4c1599bd9a'),(52,NULL,20,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:32:46','2023-03-07 18:32:46',NULL,NULL,'f56f522d-f288-457a-a783-93f914336461'),(53,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:33:47','2023-03-14 23:49:54',NULL,NULL,'51bfa186-61f4-4e74-a0e4-c328109b4283'),(54,53,NULL,21,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:34:14','2023-03-07 18:34:14',NULL,NULL,'150af813-b813-4145-942c-efc8233353d7'),(55,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:34:14','2023-03-14 23:49:43',NULL,NULL,'8c1802ac-936c-4ea5-86e1-fdac1f979f09'),(57,48,NULL,22,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:34:32','2023-03-07 18:34:32',NULL,NULL,'5a848f19-5c9d-43d1-8ad3-c6313180c5c3'),(59,48,NULL,23,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:34:39','2023-03-07 18:34:39',NULL,NULL,'03575f00-051e-48ce-881c-8826c20243db'),(61,44,NULL,24,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:34:56','2023-03-07 18:34:56',NULL,NULL,'1b5230a7-70a2-4096-abb8-326c6ec3ef5b'),(62,55,NULL,25,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:35:34','2023-03-07 18:35:34',NULL,NULL,'b30d6c6d-198d-4106-8490-ae7e7a0da99d'),(63,NULL,26,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:35:34','2023-03-07 18:35:34',NULL,NULL,'16fc1b62-2c5c-4f12-8215-70790ada31f4'),(65,44,NULL,26,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:43:56','2023-03-07 18:43:56',NULL,NULL,'ec051dd8-f7fc-447f-afca-2a422d8d78e2'),(67,55,NULL,27,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:45:37','2023-03-07 18:45:37',NULL,NULL,'44a027f1-351b-412d-abfc-8e1205383d27'),(69,53,NULL,28,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:45:43','2023-03-07 18:45:43',NULL,NULL,'1b899e85-878d-426d-8a2a-424673aa0e8a'),(71,42,NULL,29,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:45:48','2023-03-07 18:45:48',NULL,NULL,'93ca38e5-bb9e-4b9b-a341-e96a578b057b'),(73,34,NULL,30,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:45:54','2023-03-07 18:45:54',NULL,NULL,'0df2289d-a59f-478b-a109-a7ac210cb1e4'),(75,37,NULL,31,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:46:01','2023-03-07 18:46:01',NULL,NULL,'9476dfb8-ca1f-4072-b8f0-442104d65cfa'),(77,46,NULL,32,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:46:11','2023-03-07 18:46:11',NULL,NULL,'b8d270c6-710e-43e1-b23c-7e480082b2d6'),(79,44,NULL,33,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:46:16','2023-03-07 18:46:16',NULL,NULL,'3feb65e3-2b79-4540-bfa5-5f1df89bc6fc'),(81,48,NULL,34,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:46:21','2023-03-07 18:46:21',NULL,NULL,'42460766-8e8f-42f8-86ab-cd1959f4b739'),(83,40,NULL,35,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:46:29','2023-03-07 18:46:29',NULL,NULL,'02b9acce-614c-4ea6-b48f-886e54a8dde4'),(85,50,NULL,36,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:46:34','2023-03-07 18:46:34',NULL,NULL,'44a01f18-5e0a-41bd-aad8-c918769e0ad8'),(88,46,NULL,37,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:47:41','2023-03-07 18:47:41',NULL,NULL,'476f7f9d-47a8-4757-8635-90a729469e11'),(89,50,NULL,38,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:47:50','2023-03-07 18:47:50',NULL,NULL,'59687775-bdf0-45b2-bdd3-b8f73ef89545'),(91,42,NULL,39,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:48:02','2023-03-07 18:48:02',NULL,NULL,'7bfb5e3f-1146-4ee1-be2c-f01046c0a0b4'),(92,55,NULL,40,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:48:08','2023-03-07 18:48:08',NULL,NULL,'03b0bf03-af89-4b80-a984-ffe059b50e16'),(94,34,NULL,41,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:48:14','2023-03-07 18:48:14',NULL,NULL,'d50ef7fe-8766-4674-90ef-d80989e54791'),(96,37,NULL,42,2,'craft\\elements\\Entry',1,0,'2023-03-07 18:48:19','2023-03-07 18:48:19',NULL,NULL,'3bf7be03-7fc0-4da0-aa68-870cb95911ce'),(98,50,NULL,43,2,'craft\\elements\\Entry',1,0,'2023-03-07 21:50:58','2023-03-07 21:50:58',NULL,NULL,'349477cb-74b1-4364-930a-c0e180b450d2'),(99,NULL,NULL,NULL,2,'craft\\elements\\Entry',0,0,'2023-03-07 22:48:57','2023-03-14 23:50:09',NULL,NULL,'a34171ea-f56c-4293-888f-3eefa11b5395'),(100,99,NULL,44,2,'craft\\elements\\Entry',0,0,'2023-03-07 22:49:57','2023-03-07 22:49:57',NULL,NULL,'afd50f06-8c78-4eaa-a124-6bf7626474e0'),(101,99,NULL,45,2,'craft\\elements\\Entry',0,0,'2023-03-07 22:50:33','2023-03-07 22:50:33',NULL,NULL,'5d1fb4cb-0025-4ca7-9a48-9ee40ff8c9d7'),(102,99,NULL,46,2,'craft\\elements\\Entry',1,0,'2023-03-07 22:50:40','2023-03-07 22:50:40',NULL,NULL,'ee1a96d8-e933-4d99-bc8a-ce091a094dc0'),(103,99,NULL,47,2,'craft\\elements\\Entry',0,0,'2023-03-07 22:50:51','2023-03-07 22:50:51',NULL,NULL,'ac697baa-9e65-4165-b1c8-918b409714f5'),(110,NULL,48,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-07 22:52:59','2023-03-07 22:52:59',NULL,NULL,'732da14d-e055-4c52-b68f-4dafca75093b'),(112,37,NULL,51,2,'craft\\elements\\Entry',1,0,'2023-03-07 22:54:34','2023-03-07 22:54:34',NULL,NULL,'325bb73c-00ec-4b64-a085-3198e39ada93'),(114,99,NULL,52,2,'craft\\elements\\Entry',0,0,'2023-03-07 22:54:50','2023-03-07 22:54:50',NULL,NULL,'fe77e65d-224e-4996-a5bb-82fdc105fc84'),(115,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:42','2023-03-14 15:37:42',NULL,NULL,'7b9ba16b-034c-48af-9b36-58d74e918ec6'),(116,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:42','2023-03-14 15:37:42',NULL,NULL,'7cc46de0-eff1-4549-af5a-ed3793c1b0de'),(117,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:42','2023-03-14 15:37:42',NULL,NULL,'842b42d7-6457-4ff4-a449-abe7a24731c8'),(118,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:43','2023-03-14 15:37:43',NULL,NULL,'716bd3a0-4011-4344-9408-b95e80af74a6'),(119,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:43','2023-03-14 15:37:43',NULL,NULL,'a68eac46-efa5-4f2d-9f3c-f6265d95f883'),(120,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:43','2023-03-14 15:37:43',NULL,NULL,'23daad18-ab3b-4232-85a9-498ad2957756'),(121,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:43','2023-03-14 15:37:43',NULL,NULL,'95f28f9c-cf32-4465-bac9-6957d2998a32'),(122,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:43','2023-03-14 15:37:43',NULL,NULL,'c1824808-9af9-4c1d-bced-40388a7173ce'),(123,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:44','2023-03-14 15:37:44',NULL,NULL,'06e75290-f31d-48fb-aa3a-0574fbdcdf6a'),(124,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-03-14 15:37:44','2023-03-14 15:37:44',NULL,NULL,'409e4f1d-09a0-4398-a8bd-ee1c0afe168c'),(126,46,NULL,53,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:39:17','2023-03-14 15:39:17',NULL,NULL,'435f8c94-35d1-4037-8605-a72a520d65dc'),(127,44,NULL,54,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:39:29','2023-03-14 15:39:29',NULL,NULL,'249b9fb7-5330-40a4-8a2e-06622410a4a0'),(129,50,NULL,55,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:39:35','2023-03-14 15:39:35',NULL,NULL,'8018304d-0ae6-440f-a171-29ceebd0d451'),(131,48,NULL,56,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:39:43','2023-03-14 15:39:43',NULL,NULL,'00567a45-3c34-49ab-8aa4-066ccb254404'),(133,42,NULL,57,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:39:55','2023-03-14 15:39:55',NULL,NULL,'aa5ff85d-89b5-4270-8599-bd7e0ff796e2'),(135,40,NULL,58,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:40:08','2023-03-14 15:40:08',NULL,NULL,'bc9408cc-49ef-4d8d-ba8d-3711a6c999be'),(137,37,NULL,59,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:40:28','2023-03-14 15:40:28',NULL,NULL,'f362cca5-a9fa-4958-952d-a05dfcb52516'),(139,55,NULL,60,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:40:39','2023-03-14 15:40:39',NULL,NULL,'cbda46f9-c786-4e8f-bedc-035ce027fe13'),(141,53,NULL,61,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:40:47','2023-03-14 15:40:47',NULL,NULL,'b3442498-72b1-4b63-9ed5-271fcae0c2bd'),(143,34,NULL,62,2,'craft\\elements\\Entry',1,0,'2023-03-14 15:40:55','2023-03-14 15:40:55',NULL,NULL,'722e9a36-e4df-4533-ae04-6e67f863c72c'),(145,44,NULL,63,2,'craft\\elements\\Entry',1,0,'2023-03-14 16:12:02','2023-03-14 16:12:02',NULL,NULL,'504d3c61-b9d0-45c5-b9fc-dd5186bbd4cd'),(148,34,NULL,64,2,'craft\\elements\\Entry',0,0,'2023-03-14 23:47:44','2023-03-14 23:47:44',NULL,NULL,'0f193875-bb6f-47ec-a597-b2b17b9dd71d'),(149,46,NULL,65,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:06','2023-03-14 23:49:06',NULL,NULL,'65201c28-3d96-4971-b11a-b13b4c41af1d'),(151,44,NULL,66,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:11','2023-03-14 23:49:11',NULL,NULL,'aec97af9-d441-480a-988b-de87023bf2af'),(153,50,NULL,67,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:17','2023-03-14 23:49:17',NULL,NULL,'e0b4b9d5-7b4e-4717-a809-6a0819ed6265'),(155,42,NULL,68,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:24','2023-03-14 23:49:24',NULL,NULL,'37aca33f-5ec7-42cf-bea4-9b9b8d2b725e'),(156,48,NULL,69,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:29','2023-03-14 23:49:29',NULL,NULL,'53cc8b7b-d4ae-47bb-8e91-13108edcaca0'),(157,37,NULL,70,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:34','2023-03-14 23:49:34',NULL,NULL,'ab6b0d17-0e04-4cc9-b233-38e48f252f73'),(158,40,NULL,71,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:39','2023-03-14 23:49:39',NULL,NULL,'e898ce65-b21d-429f-9384-7409dde51a43'),(159,55,NULL,72,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:43','2023-03-14 23:49:43',NULL,NULL,'8bc9fea5-33f9-4ba7-a48a-31c3945aea4b'),(160,53,NULL,73,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:49:54','2023-03-14 23:49:54',NULL,NULL,'21cc2484-7479-4977-85e4-2a5ddcb606bc'),(162,34,NULL,74,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:50:04','2023-03-14 23:50:04',NULL,NULL,'b4e4a3fc-188b-42c8-b6bc-2edee14a1933'),(163,99,NULL,75,2,'craft\\elements\\Entry',0,0,'2023-03-14 23:50:09','2023-03-14 23:50:09',NULL,NULL,'1d53a93a-3f3c-4ffd-bebd-318fedb8f678'),(164,50,NULL,76,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:52:36','2023-03-14 23:52:36',NULL,NULL,'533f6416-a640-4ccc-b3c8-cc1ea2e8869b'),(165,46,NULL,77,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:52:48','2023-03-14 23:52:48',NULL,NULL,'adcdd5fd-3384-4414-ae41-fc04af5ba50e'),(166,44,NULL,78,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:52:55','2023-03-14 23:52:55',NULL,NULL,'0a2dd91e-f73c-46b6-960e-60f01159155b'),(167,50,NULL,79,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:53:00','2023-03-14 23:53:00',NULL,NULL,'3cf1127c-8bba-4cbb-88b6-e89f2956665a'),(168,42,NULL,80,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:53:05','2023-03-14 23:53:05',NULL,NULL,'2f72f42f-e254-46b1-b730-ff860d9d4c05'),(169,42,NULL,81,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:53:10','2023-03-14 23:53:10',NULL,NULL,'0e477f12-54b9-4a7f-ac1f-fb3fe0aa7805'),(170,48,NULL,82,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:53:17','2023-03-14 23:53:17',NULL,NULL,'6bbb2e8a-1b6c-41a5-843c-214f48e02e8f'),(171,46,67,NULL,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:55:00','2023-03-14 23:55:00',NULL,NULL,'11a385df-327a-48e9-9527-ef4381c2c6db'),(173,44,NULL,83,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:55:18','2023-03-14 23:55:18',NULL,NULL,'3df60a4d-fce3-4921-875e-f6153e090e40'),(175,44,NULL,84,2,'craft\\elements\\Entry',1,0,'2023-03-14 23:55:32','2023-03-14 23:55:32',NULL,NULL,'fa0d7965-86f8-41c0-b263-4795a35aca27');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-02-02 05:28:23','2023-02-02 05:28:23','9276ec33-c4e9-4f94-9590-a6c8f9ed630a'),(2,2,1,'greece',NULL,1,'2023-03-07 18:07:27','2023-03-07 18:08:51','d5778f46-59f2-4f18-9072-22bdc1a97f0f'),(3,3,1,NULL,NULL,1,'2023-03-07 18:16:10','2023-03-07 18:16:10','e447cdf0-1e2e-4feb-800f-77980090e38b'),(4,4,1,NULL,NULL,1,'2023-03-07 18:16:10','2023-03-07 18:16:10','0c07baea-03c9-4ea5-a911-2bd67c47d2fe'),(5,5,1,NULL,NULL,1,'2023-03-07 18:16:10','2023-03-07 18:16:10','9403ac67-2260-4ef2-9952-d7fcd6f593d0'),(6,6,1,NULL,NULL,1,'2023-03-07 18:16:10','2023-03-07 18:16:10','bfe0c38b-0b3f-481f-850e-17ab41ab48a5'),(7,7,1,NULL,NULL,1,'2023-03-07 18:16:11','2023-03-07 18:16:11','420f04e7-b882-4843-b30c-a0dd5e889a71'),(8,8,1,NULL,NULL,1,'2023-03-07 18:16:11','2023-03-07 18:16:11','8ecbea9d-172c-4802-b634-766f32c08dd6'),(9,9,1,NULL,NULL,1,'2023-03-07 18:16:11','2023-03-07 18:16:11','3d232202-2d32-4063-8ea0-d4a91cc7e5a0'),(10,10,1,NULL,NULL,1,'2023-03-07 18:16:11','2023-03-07 18:16:11','42a6b6cd-19f1-4bed-a407-306078cbb07b'),(11,11,1,NULL,NULL,1,'2023-03-07 18:16:12','2023-03-07 18:16:12','800f368f-b740-4340-ac29-aeee491b0404'),(12,12,1,NULL,NULL,1,'2023-03-07 18:16:12','2023-03-07 18:16:12','eebdce7d-aa29-4313-bb9d-b3d1cf74399d'),(13,13,1,'greece',NULL,1,'2023-03-07 18:17:39','2023-03-07 18:17:39','9ffb0405-8cd7-490f-8f22-4913f25c2979'),(14,14,1,'brazil',NULL,1,'2023-03-07 18:18:14','2023-03-07 18:18:18','2152f33a-b73d-48bd-a4c3-b281150eef68'),(15,15,1,'brazil',NULL,1,'2023-03-07 18:18:26','2023-03-07 18:18:26','c974e223-a005-4fc8-831c-095ce4d9b3e2'),(16,16,1,'australia',NULL,1,'2023-03-07 18:18:26','2023-03-07 18:18:30','e479df40-1bf8-487e-bf09-fd1cd8d61355'),(17,17,1,'australia',NULL,1,'2023-03-07 18:18:34','2023-03-07 18:18:34','0659932a-56ab-4015-a1d4-16412626da54'),(18,18,1,'france',NULL,1,'2023-03-07 18:18:34','2023-03-07 18:18:41','dd52f95d-25be-4aec-8100-a217eb96e3fd'),(19,19,1,'france',NULL,1,'2023-03-07 18:18:41','2023-03-07 18:18:41','44e5edc1-4d85-411d-b787-1267d934a15e'),(20,20,1,'mexico',NULL,1,'2023-03-07 18:18:41','2023-03-07 18:18:48','b4846404-4b5d-4be4-b133-413583c9402e'),(21,21,1,'mexico',NULL,1,'2023-03-07 18:19:04','2023-03-07 18:19:04','2cf01b16-8e72-446e-ae5b-93fef9639654'),(22,22,1,'mexico',NULL,1,'2023-03-07 18:19:06','2023-03-07 18:19:06','8eb88547-f39a-46ae-930e-2f7fdbcaf084'),(23,23,1,'spain',NULL,1,'2023-03-07 18:19:06','2023-03-07 18:19:16','5ef1b4fd-d62b-4c1b-a731-c1dc809e9dd8'),(24,24,1,'spain',NULL,1,'2023-03-07 18:19:17','2023-03-07 18:19:17','b7a43cf2-e554-4f55-801a-530667e8477d'),(25,25,1,'japan',NULL,1,'2023-03-07 18:19:17','2023-03-07 18:19:25','838bf702-bfa8-410c-bcbe-587e0e4c45a5'),(26,26,1,'japan',NULL,1,'2023-03-07 18:19:26','2023-03-07 18:19:26','044460fd-fcdd-4311-b906-0ca6c6f4c246'),(27,27,1,'portugal',NULL,1,'2023-03-07 18:19:26','2023-03-07 18:19:34','0cfa35e6-bf13-473b-974b-1dbf3c145e72'),(28,28,1,'portugal',NULL,1,'2023-03-07 18:19:34','2023-03-07 18:19:34','28fa4c2f-fdcd-43be-84c6-b57fe2c290ce'),(29,29,1,'canada',NULL,1,'2023-03-07 18:19:34','2023-03-07 18:19:41','c01667b7-af69-4eb8-b86a-63e5ea27753f'),(30,30,1,'canada',NULL,1,'2023-03-07 18:19:42','2023-03-07 18:19:42','f8e51ac3-b1f9-48ed-8c94-fe596a462c1a'),(31,31,1,'__temp_gzxtiyduookdkysnqmgglpvxxacueuozlwbg',NULL,1,'2023-03-07 18:19:42','2023-03-07 18:19:42','804ab9e0-fc39-4137-bbbd-04d4f9849c0c'),(32,32,1,'turkey',NULL,1,'2023-03-07 18:19:47','2023-03-07 18:19:56','63c08fcc-63fd-4c9a-8d03-89ebb54fe374'),(33,33,1,'turkey',NULL,1,'2023-03-07 18:19:58','2023-03-07 18:19:58','b877cefb-abf7-44f7-afc6-f79f458e3c87'),(34,34,1,'clare-ellis',NULL,1,'2023-03-07 18:20:06','2023-03-07 18:20:10','d7f5fd3c-eb32-4968-8e4f-2d8b2f468a15'),(35,35,1,NULL,NULL,1,'2023-03-07 18:29:57','2023-03-07 18:29:57','c78ae88f-fc20-45db-92ac-5b069b113a95'),(36,36,1,'clare-ellis',NULL,1,'2023-03-07 18:30:08','2023-03-07 18:30:08','759327f9-af46-447f-844d-01492a4230d2'),(37,37,1,'cole-carr',NULL,1,'2023-03-07 18:30:08','2023-03-07 18:30:18','4189140f-d21f-4e0c-a293-9d6b801a0500'),(38,38,1,'cole-carr',NULL,1,'2023-03-07 18:30:24','2023-03-07 18:30:24','dcd6b33f-be8c-4e0e-af0b-6d21ffbf779d'),(39,39,1,'cole-carr',NULL,1,'2023-03-07 18:30:26','2023-03-07 18:30:26','c616ff93-9847-4f73-8e77-66d763bf1ecf'),(40,40,1,'richard-pacheco',NULL,1,'2023-03-07 18:30:26','2023-03-07 18:30:33','8271b49e-0b65-439e-bba5-bbc221267186'),(41,41,1,'richard-pacheco',NULL,1,'2023-03-07 18:30:40','2023-03-07 18:30:40','ed2d42d1-fe96-4ffb-8bd7-688f321d2b46'),(42,42,1,'bryson-sanchez',NULL,1,'2023-03-07 18:30:40','2023-03-07 18:30:57','998a210f-73f1-4369-88d1-dd47c411b6c8'),(43,43,1,'bryson-sanchez',NULL,1,'2023-03-07 18:31:00','2023-03-07 18:31:00','d3a10c38-09fc-4d72-81bf-909889a21eb7'),(44,44,1,'mekhi-roman',NULL,1,'2023-03-07 18:31:00','2023-03-07 18:31:09','736d5816-8cbd-4ebf-9021-7173350310ab'),(45,45,1,'mekhi-roman',NULL,1,'2023-03-07 18:31:15','2023-03-07 18:31:15','3842b90a-6045-4cc1-84dd-12aea7086607'),(46,46,1,'izaiah-cruz',NULL,1,'2023-03-07 18:31:15','2023-03-07 18:31:36','6e4d6f59-34eb-4a13-b156-e7c5e1d9f142'),(47,47,1,'izaiah-cruz',NULL,1,'2023-03-07 18:31:44','2023-03-07 18:31:44','22ac2889-1a28-4775-870c-d8ccaa7c9e7c'),(48,48,1,'omar-durham',NULL,1,'2023-03-07 18:31:44','2023-03-07 18:34:39','7ca5d619-6766-4fe0-b8ca-1f67778586cf'),(49,49,1,'mohammad-durham',NULL,1,'2023-03-07 18:32:07','2023-03-07 18:32:07','5292e0a3-0ad0-421b-84b9-a51668884f82'),(50,50,1,'simone-munoz',NULL,1,'2023-03-07 18:32:07','2023-03-07 18:32:39','02de636c-871d-4134-9c5a-09f136c6061e'),(51,51,1,'simone-munoz',NULL,1,'2023-03-07 18:32:46','2023-03-07 18:32:46','9b963fdd-b479-4c00-beb6-c4363004484c'),(52,52,1,'__temp_pmtqbgmubposriqnogaexmrdgwnakcbqaaae',NULL,1,'2023-03-07 18:32:46','2023-03-07 18:32:46','130c0faf-f8f7-4ab4-b244-22baee527102'),(53,53,1,'beau-prince',NULL,1,'2023-03-07 18:33:47','2023-03-07 18:34:11','e503c355-bac8-47cb-a6df-1516d8c43f64'),(54,54,1,'beau-prince',NULL,1,'2023-03-07 18:34:14','2023-03-07 18:34:14','cb7fe8f6-0dc3-4858-bcb4-3142bb0797c0'),(55,55,1,'azalea-clay',NULL,1,'2023-03-07 18:34:14','2023-03-07 18:35:28','2b624d66-9b84-4ebc-b9ff-809a445d94de'),(57,57,1,'mohammad-durham',NULL,1,'2023-03-07 18:34:32','2023-03-07 18:34:32','d28d5e6d-2ab6-4624-843a-b62bda21484b'),(59,59,1,'omar-durham',NULL,1,'2023-03-07 18:34:39','2023-03-07 18:34:39','8b2a5b7a-0467-4b84-8962-4cbd674e4ccc'),(61,61,1,'mekhi-roman',NULL,1,'2023-03-07 18:34:56','2023-03-07 18:34:56','9ddb5831-b5b1-430d-8912-7281067fb8fe'),(62,62,1,'azalea-clay',NULL,1,'2023-03-07 18:35:34','2023-03-07 18:35:34','c45cd64c-df2c-4539-9e63-635d53addc1f'),(63,63,1,'__temp_sdzyswmvltboadhnlqguugdkknhlmfkpnyxe',NULL,1,'2023-03-07 18:35:34','2023-03-07 18:35:34','aa20bf4b-0699-4c51-a84f-ea51f6e444ea'),(65,65,1,'mekhi-roman',NULL,1,'2023-03-07 18:43:56','2023-03-07 18:43:56','579cb787-88a6-49ff-8650-c8e5b50205e1'),(67,67,1,'azalea-clay',NULL,1,'2023-03-07 18:45:37','2023-03-07 18:45:37','16e47608-3c50-41ef-ad13-a3fef61c1de7'),(69,69,1,'beau-prince',NULL,1,'2023-03-07 18:45:43','2023-03-07 18:45:43','f0ab601c-369f-4ef4-bb0c-ffcbf2fbfb2d'),(71,71,1,'bryson-sanchez',NULL,1,'2023-03-07 18:45:48','2023-03-07 18:45:48','0a9a1962-2278-41db-8bba-f174a4fcad9a'),(73,73,1,'clare-ellis',NULL,1,'2023-03-07 18:45:54','2023-03-07 18:45:54','e14a4207-8717-45f7-809a-f3af2f261c86'),(75,75,1,'cole-carr',NULL,1,'2023-03-07 18:46:01','2023-03-07 18:46:01','fded8500-f3f7-4521-9011-0fb533cfff2d'),(77,77,1,'izaiah-cruz',NULL,1,'2023-03-07 18:46:11','2023-03-07 18:46:11','a55ce5a4-24a9-432f-a7b3-da84d1812ffc'),(79,79,1,'mekhi-roman',NULL,1,'2023-03-07 18:46:16','2023-03-07 18:46:16','b0ca6309-e4dd-4903-8fcc-cf155657ab8f'),(81,81,1,'omar-durham',NULL,1,'2023-03-07 18:46:21','2023-03-07 18:46:21','3e242781-f869-405f-b41d-fef0b546db42'),(83,83,1,'richard-pacheco',NULL,1,'2023-03-07 18:46:29','2023-03-07 18:46:29','d08f475e-c8dd-48a2-99a9-b194156cba3e'),(85,85,1,'simone-munoz',NULL,1,'2023-03-07 18:46:34','2023-03-07 18:46:34','7c0d057d-4934-4de2-80ab-2a7f659924c8'),(88,88,1,'izaiah-cruz',NULL,1,'2023-03-07 18:47:41','2023-03-07 18:47:41','0af9d1fe-fc53-4059-b5eb-d970e556a5b4'),(89,89,1,'simone-munoz',NULL,1,'2023-03-07 18:47:50','2023-03-07 18:47:50','0a584254-ec04-4e82-bf7c-1640e3a89dea'),(91,91,1,'bryson-sanchez',NULL,1,'2023-03-07 18:48:02','2023-03-07 18:48:02','2cec8103-7ece-4281-8cb3-5fb33b0aa89a'),(92,92,1,'azalea-clay',NULL,1,'2023-03-07 18:48:08','2023-03-07 18:48:08','8c44c68a-8b5b-4e72-9170-9465db32f680'),(94,94,1,'clare-ellis',NULL,1,'2023-03-07 18:48:14','2023-03-07 18:48:14','8b94aba5-3e47-408e-be71-29f71ce729c0'),(96,96,1,'cole-carr',NULL,1,'2023-03-07 18:48:19','2023-03-07 18:48:19','2c90b63c-c479-4be1-8ab0-4de0bad1867f'),(98,98,1,'simone-munoz',NULL,1,'2023-03-07 21:50:58','2023-03-07 21:50:58','b6fdc1ee-186e-4801-9ab6-8a8f42aee020'),(99,99,1,'substitute-prime',NULL,1,'2023-03-07 22:48:57','2023-03-07 22:49:35','5ed369bd-80f5-43a7-bbbe-441595a963b9'),(100,100,1,'substitute-prime',NULL,1,'2023-03-07 22:49:57','2023-03-07 22:49:57','c1f9e077-d5c1-4478-b0e2-7d48ac5779dd'),(101,101,1,'substitute-prime',NULL,1,'2023-03-07 22:50:33','2023-03-07 22:50:33','f4239468-ab0e-4312-9df1-58d9a5653645'),(102,102,1,'substitute-prime',NULL,1,'2023-03-07 22:50:40','2023-03-07 22:50:40','fc2e8cbc-088f-47d5-b464-1e58279ce46d'),(103,103,1,'substitute-prime',NULL,1,'2023-03-07 22:50:51','2023-03-07 22:50:51','6cd81e5b-173f-4987-9952-348d710766df'),(110,110,1,'__temp_fedqzevpvfvqeyqrgrupekcabsjkfllwbqlp',NULL,1,'2023-03-07 22:52:59','2023-03-07 22:52:59','c67ca3b3-c908-4a04-8951-b387481492d8'),(112,112,1,'cole-carr',NULL,1,'2023-03-07 22:54:34','2023-03-07 22:54:34','652c7601-f1b3-4d28-bc98-9ee6af7b1358'),(114,114,1,'substitute-prime',NULL,1,'2023-03-07 22:54:50','2023-03-07 22:54:50','7355736d-b733-4e80-a87c-7ec190ef47af'),(115,115,1,NULL,NULL,1,'2023-03-14 15:37:42','2023-03-14 15:37:42','05a224e7-3d72-459a-b432-8691483a7e7a'),(116,116,1,NULL,NULL,1,'2023-03-14 15:37:42','2023-03-14 15:37:42','ac8aeee4-b9c9-41bf-b28f-e6cd2fc7a1fb'),(117,117,1,NULL,NULL,1,'2023-03-14 15:37:42','2023-03-14 15:37:42','82f99735-c990-4255-8314-e7f8e8091410'),(118,118,1,NULL,NULL,1,'2023-03-14 15:37:43','2023-03-14 15:37:43','10908556-ddf4-493f-9953-22135e374fe0'),(119,119,1,NULL,NULL,1,'2023-03-14 15:37:43','2023-03-14 15:37:43','94a3a2d9-735a-4084-8266-344b11522f09'),(120,120,1,NULL,NULL,1,'2023-03-14 15:37:43','2023-03-14 15:37:43','feaf9963-1502-4b70-aff5-2f04d0fa971f'),(121,121,1,NULL,NULL,1,'2023-03-14 15:37:43','2023-03-14 15:37:43','a8f7d57e-69a6-4c08-be0b-b9c865925bbc'),(122,122,1,NULL,NULL,1,'2023-03-14 15:37:43','2023-03-14 15:37:43','099c0e53-7add-469d-802b-2966e15972a5'),(123,123,1,NULL,NULL,1,'2023-03-14 15:37:44','2023-03-14 15:37:44','606d4d12-21cd-481a-9f80-18de2aac7d13'),(124,124,1,NULL,NULL,1,'2023-03-14 15:37:44','2023-03-14 15:37:44','7eccb34e-24c3-44a7-b62d-b92b4bd2426b'),(126,126,1,'izaiah-cruz',NULL,1,'2023-03-14 15:39:17','2023-03-14 15:39:17','41b482ce-3fde-44e0-880e-74b80e7716b5'),(127,127,1,'mekhi-roman',NULL,1,'2023-03-14 15:39:29','2023-03-14 15:39:29','c0cdd795-6efa-41e8-a5aa-36b17d70908f'),(129,129,1,'simone-munoz',NULL,1,'2023-03-14 15:39:35','2023-03-14 15:39:35','7d1dd881-1191-479f-8cfa-96e248c2429c'),(131,131,1,'omar-durham',NULL,1,'2023-03-14 15:39:43','2023-03-14 15:39:43','638c0dcc-10b9-4166-8b6a-cdcac10dc431'),(133,133,1,'bryson-sanchez',NULL,1,'2023-03-14 15:39:55','2023-03-14 15:39:55','58fc4012-c592-4cb3-9e8b-274440034439'),(135,135,1,'richard-pacheco',NULL,1,'2023-03-14 15:40:08','2023-03-14 15:40:08','c56aa52d-5d4d-45eb-abdc-5ba7a55710e1'),(137,137,1,'cole-carr',NULL,1,'2023-03-14 15:40:28','2023-03-14 15:40:28','32c09cc7-de78-4064-a045-03bda0469e47'),(139,139,1,'azalea-clay',NULL,1,'2023-03-14 15:40:39','2023-03-14 15:40:39','2d452ae1-824f-4f69-8a08-29059ddb74f2'),(141,141,1,'beau-prince',NULL,1,'2023-03-14 15:40:47','2023-03-14 15:40:47','fb36e7ef-61d7-4916-ba89-0528244ed6b1'),(143,143,1,'clare-ellis',NULL,1,'2023-03-14 15:40:55','2023-03-14 15:40:55','1b3deccb-5685-4b88-a3ed-165c7ac5b5b7'),(145,145,1,'mekhi-roman',NULL,1,'2023-03-14 16:12:02','2023-03-14 16:12:02','361e7f9f-9cc9-4eb6-b652-ced307794ba8'),(148,148,1,'clare-ellis',NULL,1,'2023-03-14 23:47:44','2023-03-14 23:47:44','e38b35eb-66ee-43ad-aabb-5dc996cec23a'),(149,149,1,'izaiah-cruz',NULL,1,'2023-03-14 23:49:06','2023-03-14 23:49:06','31a1774b-3f64-4c71-89df-df87408fe0e4'),(151,151,1,'mekhi-roman',NULL,1,'2023-03-14 23:49:11','2023-03-14 23:49:11','9b8db380-f560-4ed4-9506-99742d4c6229'),(153,153,1,'simone-munoz',NULL,1,'2023-03-14 23:49:17','2023-03-14 23:49:17','f6061770-13ac-409c-bba4-1280e7687c2d'),(155,155,1,'bryson-sanchez',NULL,1,'2023-03-14 23:49:24','2023-03-14 23:49:24','5458c922-e28c-4038-bcaf-0c853f948031'),(156,156,1,'omar-durham',NULL,1,'2023-03-14 23:49:29','2023-03-14 23:49:29','a6b9091d-28b1-4059-901d-80adb54640e7'),(157,157,1,'cole-carr',NULL,1,'2023-03-14 23:49:34','2023-03-14 23:49:34','295c331b-90ae-4449-b7d5-f9bca204093f'),(158,158,1,'richard-pacheco',NULL,1,'2023-03-14 23:49:39','2023-03-14 23:49:39','d9ccf1d2-eae1-4017-a3eb-008cee44fa23'),(159,159,1,'azalea-clay',NULL,1,'2023-03-14 23:49:43','2023-03-14 23:49:43','398678be-0c74-4c19-aa52-2a9ff8e9b4fd'),(160,160,1,'beau-prince',NULL,1,'2023-03-14 23:49:54','2023-03-14 23:49:54','ed1d431a-e691-499b-8831-50583662c9c6'),(162,162,1,'clare-ellis',NULL,1,'2023-03-14 23:50:04','2023-03-14 23:50:04','262f2a04-2a28-4f1b-ae6a-d1b6899f06c5'),(163,163,1,'substitute-prime',NULL,1,'2023-03-14 23:50:09','2023-03-14 23:50:09','27b3117c-10c0-4113-b26f-b93aa3e45fc6'),(164,164,1,'simone-munoz',NULL,1,'2023-03-14 23:52:36','2023-03-14 23:52:36','e1a9c7d4-0a94-486e-884c-8ade694915c0'),(165,165,1,'izaiah-cruz',NULL,1,'2023-03-14 23:52:48','2023-03-14 23:52:48','47e95da2-2b29-4290-b7a1-b7901514b037'),(166,166,1,'mekhi-roman',NULL,1,'2023-03-14 23:52:55','2023-03-14 23:52:55','f6ca7916-5aca-4463-813f-9e5bc547b35f'),(167,167,1,'simone-munoz',NULL,1,'2023-03-14 23:53:00','2023-03-14 23:53:00','4482f533-ab94-48e4-b93b-c8b254753060'),(168,168,1,'bryson-sanchez',NULL,1,'2023-03-14 23:53:05','2023-03-14 23:53:05','ae351b9a-7683-422c-aff2-5ea410e071da'),(169,169,1,'bryson-sanchez',NULL,1,'2023-03-14 23:53:10','2023-03-14 23:53:10','cb02a3aa-b2f3-4bd2-94ee-1540a233b365'),(170,170,1,'omar-durham',NULL,1,'2023-03-14 23:53:17','2023-03-14 23:53:17','0c9dc4ef-c13f-410d-9c4a-f4240f1927c5'),(171,171,1,'izaiah-cruz',NULL,1,'2023-03-14 23:55:00','2023-03-14 23:55:00','0a59b958-104b-4354-b89b-576349794cec'),(173,173,1,'mekhi-roman',NULL,1,'2023-03-14 23:55:18','2023-03-14 23:55:18','c81834b4-36d6-4cd9-9b53-a6a3d2cc21d1'),(175,175,1,'mekhi-roman',NULL,1,'2023-03-14 23:55:32','2023-03-14 23:55:32','88833a45-91e3-48b2-9c21-91906c66f9a3');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,1,'2023-03-07 18:17:00',NULL,NULL,'2023-03-07 18:07:27','2023-03-07 18:17:39'),(13,1,NULL,1,1,'2023-03-07 18:17:00',NULL,NULL,'2023-03-07 18:17:39','2023-03-07 18:17:39'),(14,1,NULL,1,1,'2023-03-07 18:18:00',NULL,NULL,'2023-03-07 18:18:14','2023-03-07 18:18:26'),(15,1,NULL,1,1,'2023-03-07 18:18:00',NULL,NULL,'2023-03-07 18:18:26','2023-03-07 18:18:26'),(16,1,NULL,1,1,'2023-03-07 18:18:00',NULL,NULL,'2023-03-07 18:18:26','2023-03-07 18:18:34'),(17,1,NULL,1,1,'2023-03-07 18:18:00',NULL,NULL,'2023-03-07 18:18:34','2023-03-07 18:18:34'),(18,1,NULL,1,1,'2023-03-07 18:18:00',NULL,NULL,'2023-03-07 18:18:34','2023-03-07 18:18:41'),(19,1,NULL,1,1,'2023-03-07 18:18:00',NULL,NULL,'2023-03-07 18:18:41','2023-03-07 18:18:41'),(20,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:18:41','2023-03-07 18:19:04'),(21,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:04','2023-03-07 18:19:04'),(22,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:06','2023-03-07 18:19:06'),(23,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:06','2023-03-07 18:19:16'),(24,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:17','2023-03-07 18:19:17'),(25,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:17','2023-03-07 18:19:26'),(26,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:26','2023-03-07 18:19:26'),(27,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:26','2023-03-07 18:19:34'),(28,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:34','2023-03-07 18:19:34'),(29,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:34','2023-03-07 18:19:41'),(30,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:42','2023-03-07 18:19:42'),(31,1,NULL,1,1,NULL,NULL,NULL,'2023-03-07 18:19:42','2023-03-07 18:19:42'),(32,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:47','2023-03-07 18:19:58'),(33,1,NULL,1,1,'2023-03-07 18:19:00',NULL,NULL,'2023-03-07 18:19:58','2023-03-07 18:19:58'),(34,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:20:06','2023-03-07 18:30:08'),(36,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:30:08','2023-03-07 18:30:08'),(37,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:30:08','2023-03-07 18:30:24'),(38,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:30:24','2023-03-07 18:30:24'),(39,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:30:26','2023-03-07 18:30:26'),(40,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:30:26','2023-03-07 18:30:40'),(41,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:30:40','2023-03-07 18:30:40'),(42,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:30:40','2023-03-07 18:31:00'),(43,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:31:00','2023-03-07 18:31:00'),(44,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:31:00','2023-03-07 18:31:15'),(45,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:31:15','2023-03-07 18:31:15'),(46,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:31:15','2023-03-07 18:31:44'),(47,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:31:44','2023-03-07 18:31:44'),(48,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:31:44','2023-03-07 18:32:06'),(49,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:32:07','2023-03-07 18:32:07'),(50,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:32:07','2023-03-07 18:32:46'),(51,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:32:46','2023-03-07 18:32:46'),(52,2,NULL,2,1,NULL,NULL,NULL,'2023-03-07 18:32:46','2023-03-07 18:32:46'),(53,2,NULL,2,1,'2023-03-07 18:34:00',NULL,NULL,'2023-03-07 18:33:47','2023-03-07 18:34:14'),(54,2,NULL,2,1,'2023-03-07 18:34:00',NULL,NULL,'2023-03-07 18:34:14','2023-03-07 18:34:14'),(55,2,NULL,2,1,'2023-03-07 18:35:00',NULL,NULL,'2023-03-07 18:34:14','2023-03-07 18:35:34'),(57,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:34:32','2023-03-07 18:34:32'),(59,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:34:39','2023-03-07 18:34:39'),(61,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:34:56','2023-03-07 18:34:56'),(62,2,NULL,2,1,'2023-03-07 18:35:00',NULL,NULL,'2023-03-07 18:35:34','2023-03-07 18:35:34'),(63,2,NULL,2,1,NULL,NULL,NULL,'2023-03-07 18:35:34','2023-03-07 18:35:34'),(65,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:43:56','2023-03-07 18:43:56'),(67,2,NULL,2,1,'2023-03-07 18:35:00',NULL,NULL,'2023-03-07 18:45:37','2023-03-07 18:45:37'),(69,2,NULL,2,1,'2023-03-07 18:34:00',NULL,NULL,'2023-03-07 18:45:43','2023-03-07 18:45:43'),(71,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:45:48','2023-03-07 18:45:48'),(73,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:45:54','2023-03-07 18:45:54'),(75,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:46:01','2023-03-07 18:46:01'),(77,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:46:11','2023-03-07 18:46:11'),(79,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:46:16','2023-03-07 18:46:16'),(81,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:46:21','2023-03-07 18:46:21'),(83,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:46:29','2023-03-07 18:46:29'),(85,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:46:34','2023-03-07 18:46:34'),(88,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:47:41','2023-03-07 18:47:41'),(89,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 18:47:50','2023-03-07 18:47:50'),(91,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-07 18:48:02','2023-03-07 18:48:02'),(92,2,NULL,2,1,'2023-03-07 18:35:00',NULL,NULL,'2023-03-07 18:48:08','2023-03-07 18:48:08'),(94,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:48:14','2023-03-07 18:48:14'),(96,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 18:48:19','2023-03-07 18:48:19'),(98,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-07 21:50:58','2023-03-07 21:50:58'),(99,2,NULL,2,1,'2023-03-07 22:49:00',NULL,NULL,'2023-03-07 22:48:57','2023-03-07 22:49:57'),(100,2,NULL,2,1,'2023-03-07 22:49:00',NULL,NULL,'2023-03-07 22:49:57','2023-03-07 22:49:57'),(101,2,NULL,2,1,'2023-03-07 22:49:00',NULL,NULL,'2023-03-07 22:50:33','2023-03-07 22:50:33'),(102,2,NULL,2,1,'2023-03-07 22:49:00',NULL,NULL,'2023-03-07 22:50:40','2023-03-07 22:50:40'),(103,2,NULL,2,1,'2023-03-07 22:49:00',NULL,NULL,'2023-03-07 22:50:51','2023-03-07 22:50:51'),(110,2,NULL,2,1,NULL,NULL,NULL,'2023-03-07 22:52:59','2023-03-07 22:52:59'),(112,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-07 22:54:34','2023-03-07 22:54:34'),(114,2,NULL,2,1,'2023-03-07 22:49:00',NULL,NULL,'2023-03-07 22:54:50','2023-03-07 22:54:50'),(126,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 15:39:17','2023-03-14 15:39:17'),(127,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 15:39:29','2023-03-14 15:39:29'),(129,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 15:39:35','2023-03-14 15:39:35'),(131,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 15:39:43','2023-03-14 15:39:43'),(133,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 15:39:55','2023-03-14 15:39:55'),(135,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 15:40:08','2023-03-14 15:40:08'),(137,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 15:40:28','2023-03-14 15:40:28'),(139,2,NULL,2,1,'2023-03-07 18:35:00',NULL,NULL,'2023-03-14 15:40:39','2023-03-14 15:40:39'),(141,2,NULL,2,1,'2023-03-07 18:34:00',NULL,NULL,'2023-03-14 15:40:47','2023-03-14 15:40:47'),(143,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 15:40:55','2023-03-14 15:40:55'),(145,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 16:12:02','2023-03-14 16:12:02'),(148,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 23:47:44','2023-03-14 23:47:44'),(149,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:49:06','2023-03-14 23:49:06'),(151,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:49:11','2023-03-14 23:49:11'),(153,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 23:49:17','2023-03-14 23:49:17'),(155,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:49:24','2023-03-14 23:49:24'),(156,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 23:49:29','2023-03-14 23:49:29'),(157,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 23:49:34','2023-03-14 23:49:34'),(158,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 23:49:39','2023-03-14 23:49:39'),(159,2,NULL,2,1,'2023-03-07 18:35:00',NULL,NULL,'2023-03-14 23:49:43','2023-03-14 23:49:43'),(160,2,NULL,2,1,'2023-03-07 18:34:00',NULL,NULL,'2023-03-14 23:49:54','2023-03-14 23:49:54'),(162,2,NULL,2,1,'2023-03-07 18:30:00',NULL,NULL,'2023-03-14 23:50:04','2023-03-14 23:50:04'),(163,2,NULL,2,1,'2023-03-07 22:49:00',NULL,NULL,'2023-03-14 23:50:09','2023-03-14 23:50:09'),(164,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 23:52:36','2023-03-14 23:52:36'),(165,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:52:48','2023-03-14 23:52:48'),(166,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:52:55','2023-03-14 23:52:55'),(167,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 23:53:00','2023-03-14 23:53:00'),(168,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:53:05','2023-03-14 23:53:05'),(169,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:53:10','2023-03-14 23:53:10'),(170,2,NULL,2,1,'2023-03-07 18:32:00',NULL,NULL,'2023-03-14 23:53:17','2023-03-14 23:53:17'),(171,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:55:00','2023-03-14 23:55:00'),(173,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:55:18','2023-03-14 23:55:18'),(175,2,NULL,2,1,'2023-03-07 18:31:00',NULL,NULL,'2023-03-14 23:55:32','2023-03-14 23:55:32');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Default','default',1,'site',NULL,NULL,1,'2023-03-07 17:54:19','2023-03-07 17:54:19',NULL,'fdd6118c-6893-4a3f-82dc-5d797b40339f'),(2,2,2,'Default','default',1,'site',NULL,NULL,1,'2023-03-07 17:54:51','2023-03-07 17:54:51',NULL,'d617503a-3829-4390-9c8f-7fb6612a702c');
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
INSERT INTO `fieldlayoutfields` VALUES (4,1,7,4,1,1,'2023-03-07 18:17:31','2023-03-07 18:17:31','1a14969f-6de1-47f7-8a1e-92440dab9309'),(8,2,9,3,1,1,'2023-03-07 18:47:05','2023-03-07 18:47:05','71237217-726c-48e8-9635-aa32eef78d93'),(9,2,9,1,1,2,'2023-03-07 18:47:05','2023-03-07 18:47:05','29a8b09b-d5f5-4b6e-a0c1-7b203b15107a'),(10,2,9,2,1,3,'2023-03-07 18:47:05','2023-03-07 18:47:05','0750aad0-1b36-4566-a0d2-fb3f6889dba8');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2023-03-07 17:54:19','2023-03-07 17:54:19',NULL,'bbe523c9-3019-4685-8997-f968e4341cd9'),(2,'craft\\elements\\Entry','2023-03-07 17:54:51','2023-03-07 17:54:51',NULL,'ea4a2d84-4ee4-4e07-b611-df7eafaf14cc'),(3,'craft\\elements\\Asset','2023-03-07 18:03:06','2023-03-07 18:03:06',NULL,'982d1856-ab0d-4255-99af-3b9b2cf21e73'),(4,'craft\\elements\\Asset','2023-03-07 18:16:02','2023-03-07 18:16:02',NULL,'66ef7281-e405-4f5b-81a4-51ba160e5768');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (6,4,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"8ef6d285-1c44-4e20-87de-02f30372640a\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-03-07 18:16:02','2023-03-07 18:16:02','f2b86cca-f27a-4f80-9915-dbe2a27acd94'),(7,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"289c07ee-2fd9-431e-a854-74d81c57c595\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"6934f460-88a8-4738-983f-96dfb2623fd8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6b6005ce-5d9a-4135-a8d1-48ae9c595f28\"}]',1,'2023-03-07 18:17:31','2023-03-07 18:17:31','11847b00-6470-45a9-bdb1-eff52861c646'),(9,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"5fdac679-4921-4fb2-939b-88793a3666d6\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"bc5aa98b-1cfc-4bba-ace4-be28f8473941\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6ba159b8-0e40-4ff9-b825-ceed90bdab7f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"fdea5e47-4001-49ee-a86e-45dd91585fe7\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"846a33bd-87d8-4ec4-909f-32bd6399c92f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"120b714b-7d7d-493c-bd23-ac83fea563d0\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8278aaa3-21b9-457a-b25e-f0d5a43fdc35\"}]',1,'2023-03-07 18:47:05','2023-03-07 18:47:05','39f6a1f9-5e31-41bb-ad6b-30dd22aefc80'),(11,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"53c06e16-eeec-47bd-93f6-bbedc9108d74\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-03-14 15:38:32','2023-03-14 15:38:32','ac7d28ea-81c0-4cf4-8e68-d37c81cb05c9');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,1,'Country','country','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"localizeRelations\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"},\"selectionLabel\":\"Add a country\",\"showSiteMenu\":false,\"source\":null,\"sources\":[\"section:c196afcb-c41e-4d19-8ff6-e95d277f98af\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2023-03-07 17:55:11','2023-03-07 17:55:11','846a33bd-87d8-4ec4-909f-32bd6399c92f'),(2,1,'Image','image','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:1b95b48c-6fd9-401d-bdc6-cd251a02d62b\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:1b95b48c-6fd9-401d-bdc6-cd251a02d62b\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":\"Add an image\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2023-03-07 18:05:22','2023-03-07 18:05:55','8278aaa3-21b9-457a-b25e-f0d5a43fdc35'),(3,1,'Score','score','global','zsrmwbmz','The lower the better.',0,'none',NULL,'craft\\fields\\Number','{\"decimals\":0,\"defaultValue\":null,\"max\":null,\"min\":0,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":null,\"suffix\":null}','2023-03-07 18:07:04','2023-03-14 23:50:27','6ba159b8-0e40-4ff9-b825-ceed90bdab7f'),(4,1,'Flag','flag','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:1b95b48c-6fd9-401d-bdc6-cd251a02d62b\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:9f09fed0-269d-48bf-9b3a-4a0a3abc44e0\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":\"Add a flag\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2023-03-07 18:16:43','2023-03-07 18:18:08','6b6005ce-5d9a-4135-a8d1-48ae9c595f28');
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
INSERT INTO `info` VALUES (1,'4.4.2','4.4.0.4',0,'encfmtzuryda','3@czzhavnqlm','2023-02-02 05:28:23','2023-03-15 00:21:11','876de66d-7fde-40c5-b8b8-c4713c00d927');
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
INSERT INTO `projectconfig` VALUES ('dateModified','1678839671'),('elementSources.craft\\elements\\Asset.0.defaultSort.0','\"filename\"'),('elementSources.craft\\elements\\Asset.0.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Asset.0.disabled','false'),('elementSources.craft\\elements\\Asset.0.key','\"volume:1b95b48c-6fd9-401d-bdc6-cd251a02d62b\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.0','\"filename\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.1','\"size\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.2','\"dateModified\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.3','\"uploader\"'),('elementSources.craft\\elements\\Asset.0.tableAttributes.4','\"link\"'),('elementSources.craft\\elements\\Asset.0.type','\"native\"'),('elementSources.craft\\elements\\Asset.1.defaultSort.0','\"filename\"'),('elementSources.craft\\elements\\Asset.1.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Asset.1.disabled','false'),('elementSources.craft\\elements\\Asset.1.key','\"volume:9f09fed0-269d-48bf-9b3a-4a0a3abc44e0\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.0','\"filename\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.1','\"size\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.2','\"dateModified\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.3','\"uploader\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.4','\"link\"'),('elementSources.craft\\elements\\Asset.1.type','\"native\"'),('elementSources.craft\\elements\\Asset.2.key','\"folder:52e0e4e6-a037-42c1-80dc-f7e300176065\"'),('elementSources.craft\\elements\\Asset.2.type','\"native\"'),('elementSources.craft\\elements\\Entry.0.defaultSort.0','\"field:6ba159b8-0e40-4ff9-b825-ceed90bdab7f\"'),('elementSources.craft\\elements\\Entry.0.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.0.disabled','false'),('elementSources.craft\\elements\\Entry.0.key','\"section:fa9f5968-32b5-4b05-b093-6bc4ef63ed9a\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.0','\"field:6ba159b8-0e40-4ff9-b825-ceed90bdab7f\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.1','\"field:846a33bd-87d8-4ec4-909f-32bd6399c92f\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.2','\"field:8278aaa3-21b9-457a-b25e-f0d5a43fdc35\"'),('elementSources.craft\\elements\\Entry.0.type','\"native\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.0','\"title\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.1.disabled','false'),('elementSources.craft\\elements\\Entry.1.key','\"section:c196afcb-c41e-4d19-8ff6-e95d277f98af\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes.0','\"field:6b6005ce-5d9a-4135-a8d1-48ae9c595f28\"'),('elementSources.craft\\elements\\Entry.1.type','\"native\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.2.disabled','false'),('elementSources.craft\\elements\\Entry.2.key','\"*\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.0','\"section\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.1','\"link\"'),('elementSources.craft\\elements\\Entry.2.type','\"native\"'),('email.fromEmail','\"info@domain.com\"'),('email.fromName','\"Craft Coding Challenge\"'),('email.replyToEmail','null'),('email.template','\"\"'),('email.transportSettings.command','\"/usr/sbin/sendmail -bs\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elementCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.autocapitalize','true'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.autocomplete','false'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.autocorrect','true'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.class','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.disabled','false'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.elementCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.id','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.instructions','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.label','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.max','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.min','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.name','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.orientation','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.placeholder','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.readonly','false'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.requirable','false'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.size','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.step','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.tip','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.title','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.uid','\"5fdac679-4921-4fb2-939b-88793a3666d6\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.userCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.warning','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.0.width','100'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.elementCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.fieldUid','\"6ba159b8-0e40-4ff9-b825-ceed90bdab7f\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.instructions','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.label','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.required','true'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.tip','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.uid','\"bc5aa98b-1cfc-4bba-ace4-be28f8473941\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.userCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.warning','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.1.width','100'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.2.elementCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.2.fieldUid','\"846a33bd-87d8-4ec4-909f-32bd6399c92f\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.2.instructions','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.2.label','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.2.required','true'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.2.tip','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.2.uid','\"fdea5e47-4001-49ee-a86e-45dd91585fe7\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.2.userCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.2.warning','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.2.width','100'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.3.elementCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.3.fieldUid','\"8278aaa3-21b9-457a-b25e-f0d5a43fdc35\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.3.instructions','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.3.label','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.3.required','true'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.3.tip','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.3.uid','\"120b714b-7d7d-493c-bd23-ac83fea563d0\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.3.userCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.3.warning','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.elements.3.width','100'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.name','\"Content\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.uid','\"39f6a1f9-5e31-41bb-ad6b-30dd22aefc80\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.fieldLayouts.ea4a2d84-4ee4-4e07-b611-df7eafaf14cc.tabs.0.userCondition','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.handle','\"default\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.hasTitleField','true'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.name','\"Default\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.section','\"fa9f5968-32b5-4b05-b093-6bc4ef63ed9a\"'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.sortOrder','1'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.titleFormat','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.titleTranslationKeyFormat','null'),('entryTypes.d617503a-3829-4390-9c8f-7fb6612a702c.titleTranslationMethod','\"site\"'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elementCondition','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.autocapitalize','true'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.autocomplete','false'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.autocorrect','true'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.class','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.disabled','false'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.elementCondition','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.id','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.instructions','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.label','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.max','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.min','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.name','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.orientation','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.placeholder','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.readonly','false'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.requirable','false'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.size','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.step','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.tip','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.title','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.uid','\"289c07ee-2fd9-431e-a854-74d81c57c595\"'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.userCondition','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.warning','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.0.width','100'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.1.elementCondition','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.1.fieldUid','\"6b6005ce-5d9a-4135-a8d1-48ae9c595f28\"'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.1.instructions','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.1.label','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.1.required','true'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.1.tip','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.1.uid','\"6934f460-88a8-4738-983f-96dfb2623fd8\"'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.1.userCondition','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.1.warning','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.elements.1.width','100'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.name','\"Content\"'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.uid','\"11847b00-6470-45a9-bdb1-eff52861c646\"'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.fieldLayouts.bbe523c9-3019-4685-8997-f968e4341cd9.tabs.0.userCondition','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.handle','\"default\"'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.hasTitleField','true'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.name','\"Default\"'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.section','\"c196afcb-c41e-4d19-8ff6-e95d277f98af\"'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.sortOrder','1'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.titleFormat','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.titleTranslationKeyFormat','null'),('entryTypes.fdd6118c-6893-4a3f-82dc-5d797b40339f.titleTranslationMethod','\"site\"'),('fieldGroups.31006d4c-2f40-498c-9a4c-69cff4fd4279.name','\"Common\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.columnSuffix','null'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.contentColumnType','\"string\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.fieldGroup','\"31006d4c-2f40-498c-9a4c-69cff4fd4279\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.handle','\"flag\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.instructions','null'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.name','\"Flag\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.searchable','false'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.allowedKinds.0','\"image\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.allowSelfRelations','false'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.allowSubfolders','false'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.allowUploads','true'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.defaultUploadLocationSource','\"volume:1b95b48c-6fd9-401d-bdc6-cd251a02d62b\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.defaultUploadLocationSubpath','null'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.localizeRelations','false'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.maxRelations','1'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.minRelations','null'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.previewMode','\"full\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.restrictedDefaultUploadSubpath','null'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.restrictedLocationSource','\"volume:9f09fed0-269d-48bf-9b3a-4a0a3abc44e0\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.restrictedLocationSubpath','null'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.restrictFiles','true'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.restrictLocation','true'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.selectionLabel','\"Add a flag\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.showSiteMenu','true'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.showUnpermittedFiles','false'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.showUnpermittedVolumes','false'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.source','null'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.sources','\"*\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.targetSiteId','null'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.validateRelatedElements','false'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.settings.viewMode','\"list\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.translationKeyFormat','null'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.translationMethod','\"site\"'),('fields.6b6005ce-5d9a-4135-a8d1-48ae9c595f28.type','\"craft\\\\fields\\\\Assets\"'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.columnSuffix','\"zsrmwbmz\"'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.contentColumnType','\"integer(10)\"'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.fieldGroup','\"31006d4c-2f40-498c-9a4c-69cff4fd4279\"'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.handle','\"score\"'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.instructions','\"The lower the better.\"'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.name','\"Score\"'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.searchable','false'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.settings.decimals','0'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.settings.defaultValue','null'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.settings.max','null'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.settings.min','0'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.settings.prefix','null'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.settings.previewCurrency','null'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.settings.previewFormat','\"decimal\"'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.settings.size','null'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.settings.suffix','null'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.translationKeyFormat','null'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.translationMethod','\"none\"'),('fields.6ba159b8-0e40-4ff9-b825-ceed90bdab7f.type','\"craft\\\\fields\\\\Number\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.columnSuffix','null'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.contentColumnType','\"string\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.fieldGroup','\"31006d4c-2f40-498c-9a4c-69cff4fd4279\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.handle','\"image\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.instructions','null'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.name','\"Image\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.searchable','false'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.allowedKinds.0','\"image\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.allowSelfRelations','false'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.allowSubfolders','false'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.allowUploads','true'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.defaultUploadLocationSource','\"volume:1b95b48c-6fd9-401d-bdc6-cd251a02d62b\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.defaultUploadLocationSubpath','null'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.localizeRelations','false'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.maxRelations','1'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.minRelations','null'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.previewMode','\"full\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.restrictedDefaultUploadSubpath','null'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.restrictedLocationSource','\"volume:1b95b48c-6fd9-401d-bdc6-cd251a02d62b\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.restrictedLocationSubpath','null'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.restrictFiles','true'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.restrictLocation','false'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.selectionLabel','\"Add an image\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.showSiteMenu','true'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.showUnpermittedFiles','false'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.showUnpermittedVolumes','false'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.source','null'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.sources','\"*\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.targetSiteId','null'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.validateRelatedElements','false'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.settings.viewMode','\"list\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.translationKeyFormat','null'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.translationMethod','\"site\"'),('fields.8278aaa3-21b9-457a-b25e-f0d5a43fdc35.type','\"craft\\\\fields\\\\Assets\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.columnSuffix','null'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.contentColumnType','\"string\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.fieldGroup','\"31006d4c-2f40-498c-9a4c-69cff4fd4279\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.handle','\"country\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.instructions','null'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.name','\"Country\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.searchable','false'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.allowSelfRelations','false'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.localizeRelations','false'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.maxRelations','1'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.minRelations','null'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Entry\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.selectionLabel','\"Add a country\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.showSiteMenu','false'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.source','null'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.sources.0','\"section:c196afcb-c41e-4d19-8ff6-e95d277f98af\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.targetSiteId','null'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.validateRelatedElements','false'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.settings.viewMode','null'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.translationKeyFormat','null'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.translationMethod','\"site\"'),('fields.846a33bd-87d8-4ec4-909f-32bd6399c92f.type','\"craft\\\\fields\\\\Entries\"'),('fs.competitors.hasUrls','true'),('fs.competitors.name','\"Competitors\"'),('fs.competitors.settings.path','\"@webroot/assets/competitors\"'),('fs.competitors.type','\"craft\\\\fs\\\\Local\"'),('fs.competitors.url','\"@web/assets/competitors\"'),('fs.flags.hasUrls','true'),('fs.flags.name','\"Flags\"'),('fs.flags.settings.path','\"@webroot/assets/flags\"'),('fs.flags.type','\"craft\\\\fs\\\\Local\"'),('fs.flags.url','\"@web/assets/flags\"'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('meta.__names__.0779f354-f5d2-4f82-9a36-28a252f70ce4','\"Public Schema\"'),('meta.__names__.0d89c679-f6f5-42ae-8341-4bea917c6af7','\"$CRAFT_SITE_NAME\"'),('meta.__names__.1b95b48c-6fd9-401d-bdc6-cd251a02d62b','\"Competitors\"'),('meta.__names__.31006d4c-2f40-498c-9a4c-69cff4fd4279','\"Common\"'),('meta.__names__.6b6005ce-5d9a-4135-a8d1-48ae9c595f28','\"Flag\"'),('meta.__names__.6ba159b8-0e40-4ff9-b825-ceed90bdab7f','\"Score\"'),('meta.__names__.8278aaa3-21b9-457a-b25e-f0d5a43fdc35','\"Image\"'),('meta.__names__.846a33bd-87d8-4ec4-909f-32bd6399c92f','\"Country\"'),('meta.__names__.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0','\"Flags\"'),('meta.__names__.c196afcb-c41e-4d19-8ff6-e95d277f98af','\"Countries\"'),('meta.__names__.c7c2807b-84cc-4e1f-9279-af044bc0b472','\"Public Schema\"'),('meta.__names__.d617503a-3829-4390-9c8f-7fb6612a702c','\"Default\"'),('meta.__names__.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6','\"$CRAFT_SITE_NAME\"'),('meta.__names__.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a','\"Competitors\"'),('meta.__names__.fdd6118c-6893-4a3f-82dc-5d797b40339f','\"Default\"'),('plugins.elements-panel.edition','\"standard\"'),('plugins.elements-panel.enabled','true'),('plugins.elements-panel.schemaVersion','\"1.0.0\"'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.defaultPlacement','\"end\"'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.enableVersioning','true'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.handle','\"countries\"'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.name','\"Countries\"'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.propagationMethod','\"all\"'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.enabledByDefault','true'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.hasUrls','false'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.template','null'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.uriFormat','null'),('sections.c196afcb-c41e-4d19-8ff6-e95d277f98af.type','\"channel\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.defaultPlacement','\"end\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.enableVersioning','true'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.handle','\"competitors\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.name','\"Competitors\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.propagationMethod','\"all\"'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.enabledByDefault','true'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.hasUrls','false'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.template','null'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.siteSettings.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.uriFormat','null'),('sections.fa9f5968-32b5-4b05-b093-6bc4ef63ed9a.type','\"channel\"'),('siteGroups.0d89c679-f6f5-42ae-8341-4bea917c6af7.name','\"$CRAFT_SITE_NAME\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.enabled','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.handle','\"default\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.hasUrls','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.language','\"en-US\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.name','\"$CRAFT_SITE_NAME\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.primary','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.siteGroup','\"0d89c679-f6f5-42ae-8341-4bea917c6af7\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"$CRAFT_SITE_NAME\"'),('system.retryDuration','null'),('system.schemaVersion','\"4.4.0.4\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elementCondition','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.autocapitalize','true'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.autocomplete','false'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.autocorrect','true'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.class','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.disabled','false'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.elementCondition','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.id','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.instructions','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.label','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.max','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.min','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.name','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.orientation','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.placeholder','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.readonly','false'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.requirable','false'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.size','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.step','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.tip','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.title','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.uid','\"53c06e16-eeec-47bd-93f6-bbedc9108d74\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.userCondition','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.warning','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.elements.0.width','100'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.name','\"Content\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.uid','\"ac7d28ea-81c0-4cf4-8e68-d37c81cb05c9\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fieldLayouts.982d1856-ab0d-4255-99af-3b9b2cf21e73.tabs.0.userCondition','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.fs','\"competitors\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.handle','\"competitors\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.name','\"Competitors\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.sortOrder','1'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.titleTranslationKeyFormat','null'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.titleTranslationMethod','\"site\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.transformFs','\"\"'),('volumes.1b95b48c-6fd9-401d-bdc6-cd251a02d62b.transformSubpath','\"\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elementCondition','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.autocapitalize','true'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.autocomplete','false'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.autocorrect','true'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.class','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.disabled','false'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.elementCondition','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.id','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.instructions','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.label','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.max','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.min','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.name','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.orientation','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.placeholder','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.readonly','false'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.requirable','false'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.size','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.step','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.tip','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.title','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.uid','\"8ef6d285-1c44-4e20-87de-02f30372640a\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.userCondition','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.warning','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.elements.0.width','100'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.name','\"Content\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.uid','\"f2b86cca-f27a-4f80-9915-dbe2a27acd94\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fieldLayouts.66ef7281-e405-4f5b-81a4-51ba160e5768.tabs.0.userCondition','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.fs','\"flags\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.handle','\"flags\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.name','\"Flags\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.sortOrder','2'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.titleTranslationKeyFormat','null'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.titleTranslationMethod','\"site\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.transformFs','\"\"'),('volumes.9f09fed0-269d-48bf-9b3a-4a0a3abc44e0.transformSubpath','\"\"');
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
INSERT INTO `relations` VALUES (1,2,2,NULL,7,1,'2023-03-07 18:16:29','2023-03-07 18:16:29','8d913cbb-38d2-49fd-9aa3-e074e27aeb94'),(2,4,2,NULL,7,1,'2023-03-07 18:17:38','2023-03-07 18:17:38','c750ad8e-e174-404b-b034-bb78c027c09b'),(3,4,13,NULL,7,1,'2023-03-07 18:17:39','2023-03-07 18:17:39','5eac9c81-126f-4238-95e8-5510797f3d55'),(4,4,14,NULL,4,1,'2023-03-07 18:18:22','2023-03-07 18:18:22','9de4ed67-b640-4aed-a540-20a913c6721c'),(5,4,15,NULL,4,1,'2023-03-07 18:18:26','2023-03-07 18:18:26','5abdab88-3a13-4d1b-ab16-bedf9026931f'),(6,4,16,NULL,12,1,'2023-03-07 18:18:33','2023-03-07 18:18:33','0b6aad2f-3f2c-4c1a-859a-8c048770d9c1'),(7,4,17,NULL,12,1,'2023-03-07 18:18:34','2023-03-07 18:18:34','bc38ef44-ac15-4f07-91fe-de707f579685'),(8,4,18,NULL,11,1,'2023-03-07 18:18:38','2023-03-07 18:18:38','3db6ae85-695f-448e-8a22-8affbf72274c'),(9,4,19,NULL,11,1,'2023-03-07 18:18:41','2023-03-07 18:18:41','e2f45cb7-d087-4347-8ffc-f3c5c6aa0cc1'),(10,4,20,NULL,8,1,'2023-03-07 18:18:45','2023-03-07 18:18:45','50d38240-3f6a-4a8a-853c-29451cee6b94'),(11,4,21,NULL,8,1,'2023-03-07 18:19:04','2023-03-07 18:19:04','69842780-2690-40c1-aef6-647df4d91fa9'),(12,4,22,NULL,8,1,'2023-03-07 18:19:06','2023-03-07 18:19:06','406d6297-5217-4f66-a7b3-56cd0447b2c3'),(13,4,23,NULL,10,1,'2023-03-07 18:19:13','2023-03-07 18:19:13','2be8c8c3-7a76-4cd1-b82a-228292b7545e'),(14,4,24,NULL,10,1,'2023-03-07 18:19:17','2023-03-07 18:19:17','4b9dd65f-657a-41cc-8bef-5b4043466781'),(15,4,25,NULL,3,1,'2023-03-07 18:19:20','2023-03-07 18:19:20','99d4c12c-5136-4290-8406-1651e4faeccf'),(16,4,26,NULL,3,1,'2023-03-07 18:19:26','2023-03-07 18:19:26','0f5f29ae-d700-4923-8369-0d566038a2ea'),(17,4,27,NULL,5,1,'2023-03-07 18:19:30','2023-03-07 18:19:30','a7998798-6caf-4be3-95e8-5393c1c466ed'),(18,4,28,NULL,5,1,'2023-03-07 18:19:34','2023-03-07 18:19:34','fbc7fd7d-52b0-402b-8e68-75974c78a13b'),(19,4,29,NULL,6,1,'2023-03-07 18:19:38','2023-03-07 18:19:38','a8aa22b2-4751-4002-9de8-bf5a0813fcf3'),(20,4,30,NULL,6,1,'2023-03-07 18:19:42','2023-03-07 18:19:42','c900779a-7cc4-4207-8e74-e0c8222d37e6'),(21,4,32,NULL,9,1,'2023-03-07 18:19:53','2023-03-07 18:19:53','0d2d0085-d2f2-43d3-8dc9-ec2789b7da04'),(22,4,33,NULL,9,1,'2023-03-07 18:19:58','2023-03-07 18:19:58','e8b5dcb7-f33e-482b-a8cc-be8314175016'),(23,1,34,NULL,16,1,'2023-03-07 18:20:16','2023-03-07 18:20:16','a0d7338c-3e58-47d4-bae2-4ffc3053d585'),(25,1,36,NULL,16,1,'2023-03-07 18:30:08','2023-03-07 18:30:08','687999c4-dda7-4d0a-9411-50d123de6e46'),(26,2,36,NULL,35,1,'2023-03-07 18:30:08','2023-03-07 18:30:08','cb4bdbe1-eecf-4121-99ec-92e4fb1995dd'),(27,1,37,NULL,29,1,'2023-03-07 18:30:21','2023-03-07 18:30:21','f7b9dab4-6ca3-48fb-a1f9-fdd11e9044fd'),(29,1,38,NULL,29,1,'2023-03-07 18:30:24','2023-03-07 18:30:24','d42d767c-acf4-4af2-85ac-fe60dfdabb32'),(30,2,38,NULL,35,1,'2023-03-07 18:30:24','2023-03-07 18:30:24','5d25df61-8882-4130-a32b-f33c381c454b'),(31,1,39,NULL,29,1,'2023-03-07 18:30:26','2023-03-07 18:30:26','482b6cb5-0170-4953-92a9-4121bdbcddd3'),(32,2,39,NULL,35,1,'2023-03-07 18:30:26','2023-03-07 18:30:26','b33f8ccd-0cb8-415e-b84f-cf5daced13fd'),(33,1,40,NULL,27,1,'2023-03-07 18:30:35','2023-03-07 18:30:35','34204a9b-1295-4961-85a6-a7a3227b9fbd'),(35,1,41,NULL,27,1,'2023-03-07 18:30:40','2023-03-07 18:30:40','4b7b33cc-44fe-435f-8eb1-80c073987b36'),(36,2,41,NULL,35,1,'2023-03-07 18:30:40','2023-03-07 18:30:40','a4c1d178-5979-45ae-9639-6a0988ed93b7'),(37,1,42,NULL,23,1,'2023-03-07 18:30:56','2023-03-07 18:30:56','10c257c7-741b-4559-84c2-4cbf3ec318e2'),(39,1,43,NULL,23,1,'2023-03-07 18:31:00','2023-03-07 18:31:00','e95e9334-3d13-43b8-bd4a-08e4ed7d248f'),(40,2,43,NULL,35,1,'2023-03-07 18:31:00','2023-03-07 18:31:00','af699e78-b24c-426a-89c7-c4bbedc1b4bc'),(43,1,45,NULL,32,1,'2023-03-07 18:31:15','2023-03-07 18:31:15','8ce91692-6cb8-4edc-bdc2-5e694921ac6f'),(44,2,45,NULL,35,1,'2023-03-07 18:31:15','2023-03-07 18:31:15','d6f38166-ca53-4ece-b166-426ee1304c1b'),(45,1,46,NULL,14,1,'2023-03-07 18:31:40','2023-03-07 18:31:40','e3658506-96c6-4eeb-bd11-22a988de9c07'),(47,1,47,NULL,14,1,'2023-03-07 18:31:44','2023-03-07 18:31:44','c053e2ca-499f-4cf5-abc5-3243d008a4ac'),(48,2,47,NULL,35,1,'2023-03-07 18:31:44','2023-03-07 18:31:44','1737f0f3-8301-4732-b07d-71940062b3d1'),(49,1,48,NULL,32,1,'2023-03-07 18:32:00','2023-03-07 18:32:00','4f374ff1-019c-4a46-be83-772d507fde4b'),(51,1,49,NULL,32,1,'2023-03-07 18:32:07','2023-03-07 18:32:07','00a29c70-893d-41db-b98b-3e712a584fe2'),(52,2,49,NULL,35,1,'2023-03-07 18:32:07','2023-03-07 18:32:07','32e25dbe-e3b3-42cc-805c-8e098ccaf761'),(55,1,51,NULL,20,1,'2023-03-07 18:32:46','2023-03-07 18:32:46','2039f753-698f-4d09-a419-dc36d5183ae4'),(56,2,51,NULL,35,1,'2023-03-07 18:32:46','2023-03-07 18:32:46','bba21f2d-2277-432a-9ec7-716d60d5f0a8'),(57,1,53,NULL,18,1,'2023-03-07 18:33:53','2023-03-07 18:33:53','539c0848-97b7-4279-80a6-5e567a67b846'),(59,1,54,NULL,18,1,'2023-03-07 18:34:14','2023-03-07 18:34:14','ce9e1e27-b874-46fc-abda-9596fcaa68f0'),(60,2,54,NULL,35,1,'2023-03-07 18:34:14','2023-03-07 18:34:14','5a1b528b-7b15-42ef-b0c2-581dcfb6a5fe'),(63,1,57,NULL,32,1,'2023-03-07 18:34:32','2023-03-07 18:34:32','bf5f8af0-3bc8-41b9-be26-afb24202d8d2'),(64,2,57,NULL,35,1,'2023-03-07 18:34:32','2023-03-07 18:34:32','098977d3-5983-4c34-81ca-45621a2236e2'),(67,1,59,NULL,32,1,'2023-03-07 18:34:39','2023-03-07 18:34:39','f7b0eebb-695d-410d-8562-bf5c8cf296c4'),(68,2,59,NULL,35,1,'2023-03-07 18:34:39','2023-03-07 18:34:39','6c7afc62-733b-4fce-aa0e-590e62bffd5c'),(73,1,61,NULL,29,1,'2023-03-07 18:34:56','2023-03-07 18:34:56','fc12a52b-ede3-4114-a28d-3752d2dffb81'),(74,2,61,NULL,35,1,'2023-03-07 18:34:56','2023-03-07 18:34:56','43adbec5-a039-488e-8c9d-b9599e1e8f6e'),(75,1,55,NULL,2,1,'2023-03-07 18:35:30','2023-03-07 18:35:30','1f47fa97-2149-460e-9249-a827099e1460'),(77,1,62,NULL,2,1,'2023-03-07 18:35:34','2023-03-07 18:35:34','b859fce5-1482-489c-9af6-d8b0244dd466'),(78,2,62,NULL,35,1,'2023-03-07 18:35:34','2023-03-07 18:35:34','8c0c3309-042c-4b8a-be45-982b92ed89bf'),(82,1,44,NULL,25,1,'2023-03-07 18:43:56','2023-03-07 18:43:56','7c5cbd35-59e9-4ebf-a52a-547fefbfc2fd'),(83,1,65,NULL,25,1,'2023-03-07 18:43:56','2023-03-07 18:43:56','b69b29d8-2338-41ec-95db-f23e0d3a469c'),(84,2,65,NULL,35,1,'2023-03-07 18:43:56','2023-03-07 18:43:56','449f0110-829e-441a-964f-07011d948f6c'),(87,1,67,NULL,2,1,'2023-03-07 18:45:37','2023-03-07 18:45:37','22e0b0c4-bab7-4420-8cc3-616adbff3177'),(88,2,67,NULL,35,1,'2023-03-07 18:45:37','2023-03-07 18:45:37','8cbb0c26-0408-468a-a563-f19337c0a33e'),(91,1,69,NULL,18,1,'2023-03-07 18:45:43','2023-03-07 18:45:43','7a30f0e7-d357-4a72-a457-f46f29cade51'),(92,2,69,NULL,35,1,'2023-03-07 18:45:43','2023-03-07 18:45:43','6690d36e-93b2-4558-bf5b-19c8ce564b0d'),(95,1,71,NULL,23,1,'2023-03-07 18:45:48','2023-03-07 18:45:48','143fa69c-7d91-45d8-af1e-281d67740095'),(96,2,71,NULL,35,1,'2023-03-07 18:45:48','2023-03-07 18:45:48','2ef6dd22-9a70-480e-ab82-19cfa584628f'),(99,1,73,NULL,16,1,'2023-03-07 18:45:54','2023-03-07 18:45:54','225519d9-20c6-4e80-ba0a-8565058f097e'),(100,2,73,NULL,35,1,'2023-03-07 18:45:54','2023-03-07 18:45:54','7a8a130e-581b-4358-ae5a-ae258b15fc65'),(103,1,75,NULL,29,1,'2023-03-07 18:46:01','2023-03-07 18:46:01','132540e9-6766-44dd-8158-794b93990af6'),(104,2,75,NULL,35,1,'2023-03-07 18:46:01','2023-03-07 18:46:01','963b63b6-2f4a-4124-a29f-961b557d0cc5'),(107,1,77,NULL,14,1,'2023-03-07 18:46:11','2023-03-07 18:46:11','38d572f2-bf48-4739-aab8-3f395f7e6d28'),(108,2,77,NULL,35,1,'2023-03-07 18:46:11','2023-03-07 18:46:11','9573a909-3858-45f8-bce1-3b0912b18505'),(111,1,79,NULL,25,1,'2023-03-07 18:46:16','2023-03-07 18:46:16','247015a2-dbf2-4195-91b3-8a572296ff2d'),(112,2,79,NULL,35,1,'2023-03-07 18:46:16','2023-03-07 18:46:16','2e18a13a-31bf-46e7-9173-c26bfd9373b2'),(115,1,81,NULL,32,1,'2023-03-07 18:46:21','2023-03-07 18:46:21','b3881204-b690-4416-b91c-449c315a5b04'),(116,2,81,NULL,35,1,'2023-03-07 18:46:21','2023-03-07 18:46:21','d72c7ec2-ced2-4317-90f9-3314f2984682'),(119,1,83,NULL,27,1,'2023-03-07 18:46:29','2023-03-07 18:46:29','ccc0266c-a4ef-408e-bd9f-de552f1432e4'),(120,2,83,NULL,35,1,'2023-03-07 18:46:29','2023-03-07 18:46:29','8661a87d-4719-4352-b4d0-370b1926a9a8'),(123,1,85,NULL,20,1,'2023-03-07 18:46:34','2023-03-07 18:46:34','c99eca16-c8ea-4ccd-84c3-a1c2f99d5026'),(124,2,85,NULL,35,1,'2023-03-07 18:46:34','2023-03-07 18:46:34','1bc9b290-6606-423b-9623-aa60a09105b7'),(129,1,88,NULL,14,1,'2023-03-07 18:47:41','2023-03-07 18:47:41','50e5b6bd-b8b0-47fd-99f3-6332ec30e2e4'),(130,2,88,NULL,35,1,'2023-03-07 18:47:41','2023-03-07 18:47:41','e3c1b74e-3a65-4d32-9784-91e08b7e9738'),(131,1,89,NULL,20,1,'2023-03-07 18:47:50','2023-03-07 18:47:50','699641c1-b55d-4942-adb6-1bb3ddc1782e'),(132,2,89,NULL,35,1,'2023-03-07 18:47:50','2023-03-07 18:47:50','d0213964-e1be-4b54-b308-973a8883afcf'),(135,1,91,NULL,23,1,'2023-03-07 18:48:02','2023-03-07 18:48:02','27bfd540-9eab-43c6-ac4c-0f620febb84f'),(136,2,91,NULL,35,1,'2023-03-07 18:48:02','2023-03-07 18:48:02','77d0952d-8c1e-4b60-9287-0029bb2f4018'),(137,1,92,NULL,2,1,'2023-03-07 18:48:08','2023-03-07 18:48:08','a2d4e81f-9849-4e80-a0c7-01728e5c3706'),(138,2,92,NULL,35,1,'2023-03-07 18:48:08','2023-03-07 18:48:08','70bcacf4-8f90-4e3f-9680-d76d803dba4c'),(141,1,94,NULL,16,1,'2023-03-07 18:48:14','2023-03-07 18:48:14','f36eeae4-d16c-45f5-bc06-24ab8d9fd26a'),(142,2,94,NULL,35,1,'2023-03-07 18:48:14','2023-03-07 18:48:14','08ce6ac4-5b6c-499a-90e4-810a5293c02d'),(145,1,96,NULL,29,1,'2023-03-07 18:48:19','2023-03-07 18:48:19','a67aa1d1-d018-414a-a687-89c35cec03dd'),(146,2,96,NULL,35,1,'2023-03-07 18:48:19','2023-03-07 18:48:19','489d0dfd-b821-4621-803d-db33c11577d2'),(150,1,50,NULL,14,1,'2023-03-07 21:50:58','2023-03-07 21:50:58','3c471912-d472-4e18-85a2-bedd5d10df5e'),(151,1,98,NULL,14,1,'2023-03-07 21:50:58','2023-03-07 21:50:58','dddc9dba-2be8-4f18-a746-59bfc9c54d1c'),(152,2,98,NULL,35,1,'2023-03-07 21:50:58','2023-03-07 21:50:58','bb22c656-991e-4020-b80d-8e0acd9f4872'),(153,1,99,NULL,29,1,'2023-03-07 22:49:49','2023-03-07 22:49:49','69ede3bc-7be6-44d9-bf7e-94b39b4ebd84'),(154,2,99,NULL,35,1,'2023-03-07 22:49:52','2023-03-07 22:49:52','9c1d85b7-81ed-40d2-ac49-10c00e57455e'),(155,1,100,NULL,29,1,'2023-03-07 22:49:57','2023-03-07 22:49:57','a73e3e91-b77e-4401-b100-5ac910f4b69e'),(156,2,100,NULL,35,1,'2023-03-07 22:49:57','2023-03-07 22:49:57','cab93895-00bd-4194-b376-dd0ef570e40d'),(157,1,101,NULL,29,1,'2023-03-07 22:50:33','2023-03-07 22:50:33','2b003143-5827-4be0-bb37-7e0f9fb1815d'),(158,2,101,NULL,35,1,'2023-03-07 22:50:33','2023-03-07 22:50:33','96be52a6-2efb-4c7d-a1b2-3b7af6754d24'),(159,1,102,NULL,29,1,'2023-03-07 22:50:40','2023-03-07 22:50:40','c31e16c4-3c98-4a5d-957f-e69b34b13251'),(160,2,102,NULL,35,1,'2023-03-07 22:50:40','2023-03-07 22:50:40','55d5900c-052f-4af3-a9d1-c0d1830c6164'),(161,1,103,NULL,29,1,'2023-03-07 22:50:51','2023-03-07 22:50:51','5cfa70c1-6730-44c8-bf89-1dee17332f0a'),(162,2,103,NULL,35,1,'2023-03-07 22:50:52','2023-03-07 22:50:52','11f47b3c-9b76-4799-9f46-bf045af1014c'),(177,1,112,NULL,29,1,'2023-03-07 22:54:34','2023-03-07 22:54:34','3477a60c-afa1-4118-bcd4-a63f812da392'),(178,2,112,NULL,35,1,'2023-03-07 22:54:34','2023-03-07 22:54:34','3d61e3cf-dee8-4578-93ce-bc19adc9eb15'),(181,1,114,NULL,29,1,'2023-03-07 22:54:50','2023-03-07 22:54:50','22a4ebdf-b2bf-4226-bbdb-d13d4928ed26'),(182,2,114,NULL,35,1,'2023-03-07 22:54:50','2023-03-07 22:54:50','302c29db-52f5-4623-82ce-9f84a24623de'),(185,2,46,NULL,123,1,'2023-03-14 15:39:17','2023-03-14 15:39:17','1a8e15dd-3910-4803-928c-5f3e70d77fa8'),(186,1,126,NULL,14,1,'2023-03-14 15:39:17','2023-03-14 15:39:17','87a0cc71-10e9-40f6-a7ac-66a372ac54de'),(187,2,126,NULL,123,1,'2023-03-14 15:39:17','2023-03-14 15:39:17','3cc9ce17-e247-4b98-bc3a-8628965188a5'),(190,1,127,NULL,25,1,'2023-03-14 15:39:29','2023-03-14 15:39:29','bd0c0a52-0a80-4ce2-848f-0ad370584da1'),(191,2,127,NULL,124,1,'2023-03-14 15:39:29','2023-03-14 15:39:29','8593eb07-35bf-4844-a1f4-1f6f759cc555'),(194,2,50,NULL,118,1,'2023-03-14 15:39:35','2023-03-14 15:39:35','6da56793-2f44-4fb3-8573-47dacfdf450f'),(195,1,129,NULL,14,1,'2023-03-14 15:39:35','2023-03-14 15:39:35','1fcd1f07-796f-450e-8871-10182dbe580c'),(196,2,129,NULL,118,1,'2023-03-14 15:39:35','2023-03-14 15:39:35','be7a89b3-b1df-4e75-9954-0ff02f266d4e'),(199,2,48,NULL,119,1,'2023-03-14 15:39:43','2023-03-14 15:39:43','d491cf96-e465-45ee-bbbb-c4870a46eea8'),(200,1,131,NULL,32,1,'2023-03-14 15:39:43','2023-03-14 15:39:43','e9174075-052c-4224-a91d-81438ae79fc5'),(201,2,131,NULL,119,1,'2023-03-14 15:39:43','2023-03-14 15:39:43','9edda400-61a8-4800-9378-dd2e75cae52c'),(204,2,42,NULL,122,1,'2023-03-14 15:39:55','2023-03-14 15:39:55','c6a378a9-2747-436e-92dc-b9dabbe2c346'),(205,1,133,NULL,23,1,'2023-03-14 15:39:55','2023-03-14 15:39:55','b84470e7-b01b-4cab-846a-0c28134537d3'),(206,2,133,NULL,122,1,'2023-03-14 15:39:55','2023-03-14 15:39:55','970e9c32-6820-4a6f-a774-a2b582e0332f'),(209,2,40,NULL,116,1,'2023-03-14 15:40:08','2023-03-14 15:40:08','8f57c231-f133-4c91-a3af-f15edd8109ed'),(210,1,135,NULL,27,1,'2023-03-14 15:40:08','2023-03-14 15:40:08','1382ecc4-2674-427f-8cab-9c3241ca6a4b'),(211,2,135,NULL,116,1,'2023-03-14 15:40:08','2023-03-14 15:40:08','94640b07-7e6f-419e-8730-774282f41bfd'),(214,2,37,NULL,115,1,'2023-03-14 15:40:28','2023-03-14 15:40:28','a197d839-1386-4e8c-9e2e-76b872a6c233'),(215,1,137,NULL,29,1,'2023-03-14 15:40:28','2023-03-14 15:40:28','348ab5e5-eec8-4471-9a41-7e89bb7d195f'),(216,2,137,NULL,115,1,'2023-03-14 15:40:28','2023-03-14 15:40:28','3c643677-acce-4767-a27f-f0b023c7e45f'),(219,2,55,NULL,117,1,'2023-03-14 15:40:39','2023-03-14 15:40:39','30aebe2e-fb30-4d7d-afdc-981115f5545c'),(220,1,139,NULL,2,1,'2023-03-14 15:40:39','2023-03-14 15:40:39','56030af2-929a-4ddc-afd8-e872fe52887c'),(221,2,139,NULL,117,1,'2023-03-14 15:40:39','2023-03-14 15:40:39','6639f16b-caae-4507-bda2-fbbf70026f2c'),(224,2,53,NULL,120,1,'2023-03-14 15:40:47','2023-03-14 15:40:47','ef6cc639-74d0-4aab-92ef-7be7d2d90cc5'),(225,1,141,NULL,18,1,'2023-03-14 15:40:47','2023-03-14 15:40:47','7fde6d56-f2e6-4148-99b3-7e2986e61f51'),(226,2,141,NULL,120,1,'2023-03-14 15:40:47','2023-03-14 15:40:47','e14fddf3-80de-493b-aa0c-b515a62293a5'),(229,2,34,NULL,121,1,'2023-03-14 15:40:55','2023-03-14 15:40:55','72baccbf-9fba-4c27-b540-2dfb8105b8c2'),(230,1,143,NULL,16,1,'2023-03-14 15:40:55','2023-03-14 15:40:55','a6d8f883-a83c-4778-bc05-5fc6f5acbdc6'),(231,2,143,NULL,121,1,'2023-03-14 15:40:55','2023-03-14 15:40:55','85c7e8bc-33d1-419b-9f57-68a1ac40ae7c'),(234,1,145,NULL,25,1,'2023-03-14 16:12:02','2023-03-14 16:12:02','02388296-dcf4-4634-ae73-968f7bcc2fbe'),(235,2,145,NULL,124,1,'2023-03-14 16:12:02','2023-03-14 16:12:02','719df1f4-f7d8-4ca3-9cbf-710c9ba00625'),(240,1,148,NULL,16,1,'2023-03-14 23:47:44','2023-03-14 23:47:44','fc031755-8552-4b67-a980-c69199da6d27'),(241,2,148,NULL,121,1,'2023-03-14 23:47:44','2023-03-14 23:47:44','8bb30907-887f-4667-8fbb-354a56601653'),(242,1,149,NULL,14,1,'2023-03-14 23:49:06','2023-03-14 23:49:06','67096062-bf7d-4bbb-8f47-7875647e2d59'),(243,2,149,NULL,123,1,'2023-03-14 23:49:06','2023-03-14 23:49:06','9a0a4316-2b96-465c-94c3-4e6333056101'),(246,1,151,NULL,25,1,'2023-03-14 23:49:11','2023-03-14 23:49:11','1206f4ca-5a52-4bf9-bd38-1c81a21c4fcd'),(247,2,151,NULL,124,1,'2023-03-14 23:49:11','2023-03-14 23:49:11','8d43b685-52bd-426c-8722-7b856d875fb5'),(250,1,153,NULL,14,1,'2023-03-14 23:49:17','2023-03-14 23:49:17','c36f518f-3a34-4d18-a783-d96295bd6984'),(251,2,153,NULL,118,1,'2023-03-14 23:49:17','2023-03-14 23:49:17','43da776a-1e85-4d00-8db2-87d2ca93e654'),(254,1,155,NULL,23,1,'2023-03-14 23:49:24','2023-03-14 23:49:24','115fb502-3d4d-4929-92f4-a08b3cc53d12'),(255,2,155,NULL,122,1,'2023-03-14 23:49:24','2023-03-14 23:49:24','51c20254-e179-4dc6-8054-339a61cce76b'),(256,1,156,NULL,32,1,'2023-03-14 23:49:29','2023-03-14 23:49:29','a301ba86-87c3-4678-891d-59a2c80092ef'),(257,2,156,NULL,119,1,'2023-03-14 23:49:29','2023-03-14 23:49:29','088dfec0-8471-440a-a559-1dbaca3a9036'),(258,1,157,NULL,29,1,'2023-03-14 23:49:34','2023-03-14 23:49:34','57ffc5ee-5e6c-45b8-a75a-f76b338a0771'),(259,2,157,NULL,115,1,'2023-03-14 23:49:34','2023-03-14 23:49:34','6647297a-419f-4b56-b20e-0d83cfba1cc8'),(260,1,158,NULL,27,1,'2023-03-14 23:49:39','2023-03-14 23:49:39','296d0631-df84-4cdd-bbb6-cfc19f74894a'),(261,2,158,NULL,116,1,'2023-03-14 23:49:39','2023-03-14 23:49:39','c687bb70-84e8-46d8-a779-b3407164197b'),(262,1,159,NULL,2,1,'2023-03-14 23:49:43','2023-03-14 23:49:43','56907467-b22a-4f5e-8ca3-740b698115a3'),(263,2,159,NULL,117,1,'2023-03-14 23:49:43','2023-03-14 23:49:43','5413a60b-0b0b-4125-86ec-d6b11c300286'),(264,1,160,NULL,18,1,'2023-03-14 23:49:54','2023-03-14 23:49:54','54f8c026-65f6-4e34-bdb2-494d49482da9'),(265,2,160,NULL,120,1,'2023-03-14 23:49:54','2023-03-14 23:49:54','1b3b07db-f7c0-4066-80b7-28f93d0266b2'),(268,1,162,NULL,16,1,'2023-03-14 23:50:04','2023-03-14 23:50:04','4f9ef6ef-a79d-4c91-9667-bbbb3c9ba1a4'),(269,2,162,NULL,121,1,'2023-03-14 23:50:04','2023-03-14 23:50:04','a5d97666-139b-46cc-9f9f-4dc6e78fe631'),(270,1,163,NULL,29,1,'2023-03-14 23:50:09','2023-03-14 23:50:09','50839911-93df-476b-aaad-6514f335a1df'),(271,1,164,NULL,14,1,'2023-03-14 23:52:36','2023-03-14 23:52:36','2607be8a-23c9-4afe-9016-ae8dbdafff32'),(272,2,164,NULL,118,1,'2023-03-14 23:52:36','2023-03-14 23:52:36','7500faa6-af64-4e20-81c0-30ec23167990'),(273,1,165,NULL,14,1,'2023-03-14 23:52:48','2023-03-14 23:52:48','6c895250-68a1-46de-8442-10a889fc08de'),(274,2,165,NULL,123,1,'2023-03-14 23:52:48','2023-03-14 23:52:48','09015001-96ce-40f8-8b34-ccfea05fc315'),(275,1,166,NULL,25,1,'2023-03-14 23:52:55','2023-03-14 23:52:55','bcaae2bd-8dfa-41d3-913e-b0c5d7fb1ca7'),(276,2,166,NULL,124,1,'2023-03-14 23:52:55','2023-03-14 23:52:55','36471b83-9ad3-4805-ad69-7e76c7d82f57'),(277,1,167,NULL,14,1,'2023-03-14 23:53:00','2023-03-14 23:53:00','0dcbf7b3-16f5-4524-9c67-48073ba3f626'),(278,2,167,NULL,118,1,'2023-03-14 23:53:00','2023-03-14 23:53:00','ae5b7524-718a-463f-9dc5-faa8f779f766'),(279,1,168,NULL,23,1,'2023-03-14 23:53:05','2023-03-14 23:53:05','3e0982de-b97a-450a-a778-f291736d484e'),(280,2,168,NULL,122,1,'2023-03-14 23:53:05','2023-03-14 23:53:05','4d1fa042-d189-4cec-bbff-902fa4c59e82'),(281,1,169,NULL,23,1,'2023-03-14 23:53:10','2023-03-14 23:53:10','80e9152d-2102-4d9e-b004-134a4f04f864'),(282,2,169,NULL,122,1,'2023-03-14 23:53:10','2023-03-14 23:53:10','19d4641b-b081-4734-b18c-44e3dc4aa6d2'),(283,1,170,NULL,32,1,'2023-03-14 23:53:17','2023-03-14 23:53:17','6c613225-3753-4af0-b051-02439f2410bc'),(284,2,170,NULL,119,1,'2023-03-14 23:53:17','2023-03-14 23:53:17','42632627-eda9-4075-91c6-28d3ce7fc2aa'),(285,1,171,NULL,14,1,'2023-03-14 23:55:00','2023-03-14 23:55:00','7fa68519-d0a6-4765-9f2f-82a56bb78ff7'),(291,1,173,NULL,25,1,'2023-03-14 23:55:18','2023-03-14 23:55:18','bf460b05-bfb0-461d-8bb8-0d69bde08918'),(292,2,173,NULL,123,1,'2023-03-14 23:55:18','2023-03-14 23:55:18','a1b826b4-b0c3-4c23-93d8-88af823dc743'),(296,2,44,NULL,124,1,'2023-03-14 23:55:32','2023-03-14 23:55:32','a92ddc55-7e9c-4676-9083-469f01ba6842'),(297,1,175,NULL,25,1,'2023-03-14 23:55:32','2023-03-14 23:55:32','3061a3bc-1ec9-4f51-befd-019d2d815bda'),(298,2,175,NULL,124,1,'2023-03-14 23:55:32','2023-03-14 23:55:32','5f5de6e8-a0ae-4e9d-ac12-2dae8022709c');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,''),(2,14,1,1,''),(3,16,1,1,''),(4,18,1,1,''),(5,20,1,1,''),(6,20,1,2,''),(7,23,1,1,''),(8,25,1,1,''),(9,27,1,1,''),(10,29,1,1,''),(11,32,1,1,''),(12,34,1,1,''),(13,37,1,1,''),(14,37,1,2,''),(15,40,1,1,''),(16,42,1,1,''),(17,44,1,1,''),(18,46,1,1,''),(19,48,1,1,''),(20,50,1,1,''),(21,53,1,1,''),(22,48,1,2,'Applied “Draft 1”'),(23,48,1,3,'Applied “Draft 1”'),(24,44,1,2,'Applied “Draft 1”'),(25,55,1,1,''),(26,44,1,3,'Applied “Draft 1”'),(27,55,1,2,'Applied “Draft 1”'),(28,53,1,2,'Applied “Draft 1”'),(29,42,1,2,'Applied “Draft 1”'),(30,34,1,2,'Applied “Draft 1”'),(31,37,1,3,'Applied “Draft 1”'),(32,46,1,2,'Applied “Draft 1”'),(33,44,1,4,'Applied “Draft 1”'),(34,48,1,4,'Applied “Draft 1”'),(35,40,1,2,'Applied “Draft 1”'),(36,50,1,2,'Applied “Draft 1”'),(37,46,1,3,'Applied “Draft 1”'),(38,50,1,3,''),(39,42,1,3,'Applied “Draft 1”'),(40,55,1,3,''),(41,34,1,3,''),(42,37,1,4,''),(43,50,1,4,'Applied “Draft 1”'),(44,99,1,1,''),(45,99,1,2,''),(46,99,1,3,NULL),(47,99,1,4,NULL),(51,37,1,5,'Applied “Draft 1”'),(52,99,1,5,'Applied “Draft 1”'),(53,46,1,4,'Applied “Draft 1”'),(54,44,1,5,'Applied “Draft 1”'),(55,50,1,5,'Applied “Draft 1”'),(56,48,1,5,''),(57,42,1,4,''),(58,40,1,3,'Applied “Draft 1”'),(59,37,1,6,''),(60,55,1,4,''),(61,53,1,3,'Applied “Draft 1”'),(62,34,1,4,''),(63,44,1,6,'Applied “Draft 1”'),(64,34,1,5,'Applied “Draft 1”'),(65,46,1,5,'Applied “Draft 1”'),(66,44,1,7,'Applied “Draft 1”'),(67,50,1,6,'Applied “Draft 1”'),(68,42,1,5,'Applied “Draft 1”'),(69,48,1,6,''),(70,37,1,7,''),(71,40,1,4,''),(72,55,1,5,''),(73,53,1,4,''),(74,34,1,6,'Applied “Draft 1”'),(75,99,1,6,''),(76,50,1,7,''),(77,46,1,6,''),(78,44,1,8,''),(79,50,1,8,''),(80,42,1,6,''),(81,42,1,7,''),(82,48,1,7,''),(83,44,1,9,'Applied “Draft 1”'),(84,44,1,10,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' info nystudio107 com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' greece '),(2,'title',0,1,' greece '),(3,'extension',0,1,' jpg '),(3,'filename',0,1,' japan 1289 jpg '),(3,'kind',0,1,' image '),(3,'slug',0,1,''),(3,'title',0,1,' japan 1289 '),(4,'extension',0,1,' jpg '),(4,'filename',0,1,' brazil 1295 jpg '),(4,'kind',0,1,' image '),(4,'slug',0,1,''),(4,'title',0,1,' brazil 1295 '),(5,'extension',0,1,' jpg '),(5,'filename',0,1,' portugal3 1481 jpg '),(5,'kind',0,1,' image '),(5,'slug',0,1,''),(5,'title',0,1,' portugal3 1481 '),(6,'extension',0,1,' webp '),(6,'filename',0,1,' canada 1276 webp '),(6,'kind',0,1,' image '),(6,'slug',0,1,''),(6,'title',0,1,' canada 1276 '),(7,'extension',0,1,' jpg '),(7,'filename',0,1,' greece 1280 jpg '),(7,'kind',0,1,' image '),(7,'slug',0,1,''),(7,'title',0,1,' greece 1280 '),(8,'extension',0,1,' jpg '),(8,'filename',0,1,' mexico 1311 jpg '),(8,'kind',0,1,' image '),(8,'slug',0,1,''),(8,'title',0,1,' mexico 1311 '),(9,'extension',0,1,' jpg '),(9,'filename',0,1,' turkey 1274 jpg '),(9,'kind',0,1,' image '),(9,'slug',0,1,''),(9,'title',0,1,' turkey 1274 '),(10,'extension',0,1,' jpg '),(10,'filename',0,1,' spain2 1509 jpg '),(10,'kind',0,1,' image '),(10,'slug',0,1,''),(10,'title',0,1,' spain2 1509 '),(11,'extension',0,1,' jpg '),(11,'filename',0,1,' france 1244 jpg '),(11,'kind',0,1,' image '),(11,'slug',0,1,''),(11,'title',0,1,' france 1244 '),(12,'extension',0,1,' jpg '),(12,'filename',0,1,' australia 1304 jpg '),(12,'kind',0,1,' image '),(12,'slug',0,1,''),(12,'title',0,1,' australia 1304 '),(14,'slug',0,1,' brazil '),(14,'title',0,1,' brazil '),(16,'slug',0,1,' australia '),(16,'title',0,1,' australia '),(18,'slug',0,1,' france '),(18,'title',0,1,' france '),(20,'slug',0,1,' mexico '),(20,'title',0,1,' mexico '),(23,'slug',0,1,' spain '),(23,'title',0,1,' spain '),(25,'slug',0,1,' japan '),(25,'title',0,1,' japan '),(27,'slug',0,1,' portugal '),(27,'title',0,1,' portugal '),(29,'slug',0,1,' canada '),(29,'title',0,1,' canada '),(31,'slug',0,1,' temp gzxtiyduookdkysnqmgglpvxxacueuozlwbg '),(31,'title',0,1,''),(32,'slug',0,1,' turkey '),(32,'title',0,1,' turkey '),(34,'slug',0,1,' clare ellis '),(34,'title',0,1,' clare ellis '),(35,'extension',0,1,' png '),(35,'filename',0,1,' limbo png '),(35,'kind',0,1,' image '),(35,'slug',0,1,''),(35,'title',0,1,' limbo '),(37,'slug',0,1,' cole carr '),(37,'title',0,1,' cole carr '),(40,'slug',0,1,' richard pacheco '),(40,'title',0,1,' richard pacheco '),(42,'slug',0,1,' bryson sanchez '),(42,'title',0,1,' bryson sanchez '),(44,'slug',0,1,' mekhi roman '),(44,'title',0,1,' mekhi roman '),(46,'slug',0,1,' izaiah cruz '),(46,'title',0,1,' izaiah cruz '),(48,'slug',0,1,' omar durham '),(48,'title',0,1,' omar durham '),(50,'slug',0,1,' simone munoz '),(50,'title',0,1,' simone munoz '),(52,'slug',0,1,' temp pmtqbgmubposriqnogaexmrdgwnakcbqaaae '),(52,'title',0,1,''),(53,'slug',0,1,' beau prince '),(53,'title',0,1,' beau prince '),(55,'slug',0,1,' azalea clay '),(55,'title',0,1,' azalea clay '),(63,'slug',0,1,' temp sdzyswmvltboadhnlqguugdkknhlmfkpnyxe '),(63,'title',0,1,''),(99,'slug',0,1,' substitute prime '),(99,'title',0,1,' sub prime '),(110,'slug',0,1,' temp fedqzevpvfvqeyqrgrupekcabsjkfllwbqlp '),(110,'title',0,1,''),(115,'extension',0,1,' svg '),(115,'filename',0,1,' limbo competitor 04 svg '),(115,'kind',0,1,' image '),(115,'slug',0,1,''),(115,'title',0,1,' limbo competitor 04 '),(116,'extension',0,1,' svg '),(116,'filename',0,1,' limbo competitor 05 svg '),(116,'kind',0,1,' image '),(116,'slug',0,1,''),(116,'title',0,1,' limbo competitor 05 '),(117,'extension',0,1,' svg '),(117,'filename',0,1,' limbo competitor 03 svg '),(117,'kind',0,1,' image '),(117,'slug',0,1,''),(117,'title',0,1,' limbo competitor 03 '),(118,'extension',0,1,' svg '),(118,'filename',0,1,' limbo competitor 02 svg '),(118,'kind',0,1,' image '),(118,'slug',0,1,''),(118,'title',0,1,' limbo competitor 02 '),(119,'extension',0,1,' svg '),(119,'filename',0,1,' limbo competitor 08 svg '),(119,'kind',0,1,' image '),(119,'slug',0,1,''),(119,'title',0,1,' limbo competitor 08 '),(120,'extension',0,1,' svg '),(120,'filename',0,1,' limbo competitor 09 svg '),(120,'kind',0,1,' image '),(120,'slug',0,1,''),(120,'title',0,1,' limbo competitor 09 '),(121,'extension',0,1,' svg '),(121,'filename',0,1,' limbo competitor 10 svg '),(121,'kind',0,1,' image '),(121,'slug',0,1,''),(121,'title',0,1,' limbo competitor 10 '),(122,'extension',0,1,' svg '),(122,'filename',0,1,' limbo competitor 07 svg '),(122,'kind',0,1,' image '),(122,'slug',0,1,''),(122,'title',0,1,' limbo competitor 07 '),(123,'extension',0,1,' svg '),(123,'filename',0,1,' limbo competitor 01 svg '),(123,'kind',0,1,' image '),(123,'slug',0,1,''),(123,'title',0,1,' limbo competitor 01 '),(124,'extension',0,1,' svg '),(124,'filename',0,1,' limbo competitor 06 svg '),(124,'kind',0,1,' image '),(124,'slug',0,1,''),(124,'title',0,1,' limbo competitor 06 '),(171,'slug',0,1,' izaiah cruz '),(171,'title',0,1,' izaiah cruz ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Countries','countries','channel',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-03-07 17:54:19','2023-03-07 17:54:19',NULL,'c196afcb-c41e-4d19-8ff6-e95d277f98af'),(2,NULL,'Competitors','competitors','channel',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-03-07 17:54:51','2023-03-07 17:54:51',NULL,'fa9f5968-32b5-4b05-b093-6bc4ef63ed9a');
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
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin','',NULL,NULL,'info@nystudio107.com','$2y$13$crqJ.kzM.kBs.WsWGUxT9uUdR4Imi./d9prVKVya/MkWu/Bd/8.Ga','2023-03-14 15:37:30',NULL,NULL,NULL,'2023-02-02 05:28:58',NULL,1,NULL,NULL,NULL,0,'2023-02-02 05:28:24','2023-02-02 05:28:24','2023-03-14 15:37:30');
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

-- Dump completed on 2023-03-15  0:22:21
