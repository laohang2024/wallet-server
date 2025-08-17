-- MySQL dump 10.13  Distrib 8.4.5, for macos15.2 (arm64)
--
-- Host: localhost    Database: ry
-- ------------------------------------------------------
-- Server version	8.4.5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chain_btc_wallet`
--

DROP TABLE IF EXISTS `chain_btc_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chain_btc_wallet` (
  `address` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '钱包地址',
  `btc_balance` decimal(30,6) NOT NULL DEFAULT '0.000000' COMMENT '比特币余额',
  `create_time` bigint NOT NULL COMMENT '创建时间',
  `update_time` bigint NOT NULL COMMENT '更新时间',
  `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据库更新时间',
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='BTC钱包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chain_btc_wallet`
--

LOCK TABLES `chain_btc_wallet` WRITE;
/*!40000 ALTER TABLE `chain_btc_wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `chain_btc_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chain_eth_wallet`
--

DROP TABLE IF EXISTS `chain_eth_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chain_eth_wallet` (
  `address` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '钱包地址',
  `eth_balance` decimal(30,6) NOT NULL DEFAULT '0.000000' COMMENT '以太币余额',
  `create_time` bigint NOT NULL COMMENT '创建时间',
  `update_time` bigint NOT NULL COMMENT '更新时间',
  `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据库更新时间',
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ETH钱包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chain_eth_wallet`
--

LOCK TABLES `chain_eth_wallet` WRITE;
/*!40000 ALTER TABLE `chain_eth_wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `chain_eth_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chain_tron_wallet`
--

DROP TABLE IF EXISTS `chain_tron_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chain_tron_wallet` (
  `address` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '钱包地址',
  `trx_balance` decimal(30,6) NOT NULL DEFAULT '0.000000' COMMENT 'TRX余额',
  `usdt_balance` decimal(30,6) NOT NULL DEFAULT '0.000000' COMMENT 'usdt余额',
  `create_time` bigint NOT NULL COMMENT '创建时间',
  `update_time` bigint NOT NULL COMMENT '更新时间',
  `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据库更新时间',
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='TRON钱包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chain_tron_wallet`
--

LOCK TABLES `chain_tron_wallet` WRITE;
/*!40000 ALTER TABLE `chain_tron_wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `chain_tron_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成功能作者',
  `form_col_num` int DEFAULT '1' COMMENT '表单布局（单列 双列 三列）',
  `gen_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (5,'mch_chain_wallet_info','商户用户钱包','',NULL,'MchChainWalletInfo','crud','com.ruoyi.blockchain','blockchain','mchChainWattle','商户用户钱包','ruoyi',1,'0','/','{\"parentMenuId\":\"2008\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"钱包管理\",\"treeCode\":\"\"}','admin','2025-08-16 18:23:28','','2025-08-16 19:54:02',''),(6,'chain_btc_wallet','比特币钱包','',NULL,'ChainBtcWallet','crud','com.ruoyi.blockchain','blockchain','btcWattle','BTC钱包','ruoyi',1,'0','/','{\"parentMenuId\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"\",\"treeCode\":\"\"}','admin','2025-08-16 18:25:16','','2025-08-16 18:37:08',''),(7,'chain_eth_wallet','以太坊钱包','',NULL,'ChainEthWallet','crud','com.ruoyi.blockchain','blockchain','ethWattle','ETH钱包','ruoyi',1,'0','/','{\"parentMenuId\":\"2008\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"钱包管理\",\"treeCode\":\"\"}','admin','2025-08-16 18:25:17','','2025-08-16 18:36:28',''),(8,'chain_tron_wallet','USDT钱包','',NULL,'ChainTronWallet','crud','com.ruoyi.blockchain','blockchain','tronWallet','TRON钱包','ruoyi',1,'0','/','{\"parentMenuId\":\"2008\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"钱包管理\",\"treeCode\":\"\"}','admin','2025-08-16 18:25:17','','2025-08-16 18:36:49','');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (23,5,'id','用户标识','varchar(32)','String','id','1','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-08-16 18:23:28',NULL,'2025-08-16 19:54:02'),(24,5,'mch_no','商户号','varchar(32)','String','mchNo','0','0','1',NULL,NULL,'1','1','LIKE','input','',2,'admin','2025-08-16 18:23:28',NULL,'2025-08-16 19:54:02'),(25,5,'user_id','用户ID','varchar(32)','String','userId','0','0','1',NULL,NULL,'1','1','EQ','input','',3,'admin','2025-08-16 18:23:28',NULL,'2025-08-16 19:54:02'),(27,5,'address','地址','varchar(64)','String','address','0','0','1',NULL,NULL,'1','1','LIKE','input','',5,'admin','2025-08-16 18:23:28',NULL,'2025-08-16 19:54:02'),(28,5,'created_time','创建时间','bigint','Long','createdTime','0','0','1',NULL,NULL,NULL,NULL,'EQ','input','',6,'admin','2025-08-16 18:23:28',NULL,'2025-08-16 19:54:02'),(29,5,'db_update_time','数据库更新时间','datetime','Date','dbUpdateTime','0','0','1',NULL,NULL,NULL,NULL,'EQ','datetime','',7,'admin','2025-08-16 18:23:28',NULL,'2025-08-16 19:54:02'),(30,6,'address','钱包地址','varchar(64)','String','address','1','0','1',NULL,NULL,'1','1','LIKE','input','',1,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:37:08'),(31,6,'btc_balance','比特币余额','decimal(30,6)','BigDecimal','btcBalance','0','0','1',NULL,NULL,'1','1','BETWEEN','input','',2,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:37:08'),(32,6,'create_time','创建时间','bigint','Long','createTime','0','0','1',NULL,NULL,'1',NULL,'EQ','input','',3,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:37:08'),(33,6,'update_time','更新时间','bigint','Long','updateTime','0','0','1',NULL,NULL,'1',NULL,'EQ','input','',4,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:37:08'),(34,6,'db_update_time','数据库更新时间','datetime','Date','dbUpdateTime','0','0','1',NULL,NULL,NULL,NULL,'EQ','datetime','',5,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:37:08'),(35,7,'address','钱包地址','varchar(64)','String','address','1','0',NULL,NULL,NULL,'1','1','LIKE','input','',1,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:36:28'),(36,7,'eth_balance','以太币余额','decimal(30,6)','BigDecimal','ethBalance','0','0','1',NULL,NULL,'1','1','BETWEEN','input','',2,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:36:28'),(37,7,'create_time','创建时间','bigint','Long','createTime','0','0','1',NULL,NULL,NULL,NULL,'EQ','input','',3,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:36:28'),(38,7,'update_time','更新时间','bigint','Long','updateTime','0','0','1',NULL,NULL,NULL,NULL,'EQ','input','',4,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:36:28'),(39,7,'db_update_time','数据库更新时间','datetime','Date','dbUpdateTime','0','0','1',NULL,NULL,NULL,NULL,'EQ','datetime','',5,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:36:28'),(40,8,'address','钱包地址','varchar(64)','String','address','1','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',1,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:36:49'),(41,8,'trx_balance','TRX余额','decimal(30,6)','BigDecimal','trxBalance','0','0','1',NULL,NULL,'1','1','LIKE','input','',2,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:36:49'),(42,8,'usdt_balance','usdt余额','decimal(30,6)','BigDecimal','usdtBalance','0','0','1',NULL,NULL,'1','1','BETWEEN','input','',3,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:36:49'),(43,8,'create_time','创建时间','bigint','Long','createTime','0','0','1',NULL,NULL,'1',NULL,'EQ','input','',4,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:36:49'),(44,8,'update_time','更新时间','bigint','Long','updateTime','0','0','1',NULL,NULL,'1',NULL,'EQ','input','',5,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:36:49'),(45,8,'db_update_time','数据库更新时间','datetime','Date','dbUpdateTime','0','0','1',NULL,NULL,NULL,NULL,'EQ','datetime','',6,'admin','2025-08-16 18:25:17',NULL,'2025-08-16 18:36:49'),(46,5,'chain_type','钱包类型','varchar(10)','String','chainType','0','0','1',NULL,NULL,'1','1','EQ','select','coin_type',4,'','2025-08-16 19:53:11',NULL,'2025-08-16 19:54:02');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mch_chain_wallet_info`
--

DROP TABLE IF EXISTS `mch_chain_wallet_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mch_chain_wallet_info` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键 ex: 商户号_用户ID_币种',
  `mch_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商户号',
  `user_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户ID',
  `chain_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '钱包类型 TRON、ETH、BTC、DOGE',
  `address` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `created_time` bigint NOT NULL COMMENT '创建时间',
  `db_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据库更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mch_chain_wallet_info_address_uindex` (`address`),
  KEY `mch_chain_wallet_info_mch_no_user_id_index` (`mch_no`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商户用户钱包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mch_chain_wallet_info`
--

LOCK TABLES `mch_chain_wallet_info` WRITE;
/*!40000 ALTER TABLE `mch_chain_wallet_info` DISABLE KEYS */;
INSERT INTO `mch_chain_wallet_info` VALUES ('123_1234_BTC','123','1234','BTC','bc1qrxgg2mnywe63rugurvnul3ush0mjzfn5ppecvv',1755346591858,'2025-08-16 20:16:31'),('123_1234_ETH','123','1234','ETH','0xbcafc80ffe74823b1c28453abc054c0eb2df81bb',1755346591849,'2025-08-16 20:16:31'),('123_1234_TRON','123','1234','TRON','TYxQsFVrvc5rWMkjKTZhFQozCcp7FdAByc',1755346591861,'2025-08-16 20:16:31'),('123_1235_BTC','123','1235','BTC','bc1q73j0myw0uwf2c7ek7hpt88dqujnya7z85as8n2',1755346577018,'2025-08-16 20:16:17'),('123_1235_ETH','123','1235','ETH','0xe048e1d93968ca48a1f89f43222040ff6bfb2479',1755346576994,'2025-08-16 20:16:16'),('123_1235_TRON','123','1235','TRON','TA74owDiYXtshQ3vb61Hzw5h126fAZ2c4a',1755346577063,'2025-08-16 20:16:17');
/*!40000 ALTER TABLE `mch_chain_wallet_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2025-08-13 21:59:25','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2025-08-13 21:59:25','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2025-08-13 21:59:25','',NULL,'深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue'),(4,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2025-08-13 21:59:25','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(5,'用户管理-密码字符范围','sys.account.chrtype','0','Y','admin','2025-08-13 21:59:25','',NULL,'默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）'),(6,'用户管理-初始密码修改策略','sys.account.initPasswordModify','1','Y','admin','2025-08-13 21:59:25','',NULL,'0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框'),(7,'用户管理-账号密码更新周期','sys.account.passwordValidateDays','0','Y','admin','2025-08-13 21:59:25','',NULL,'密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框'),(8,'主框架页-菜单导航显示风格','sys.index.menuStyle','default','Y','admin','2025-08-13 21:59:25','',NULL,'菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）'),(9,'主框架页-是否开启页脚','sys.index.footer','true','Y','admin','2025-08-13 21:59:25','',NULL,'是否开启底部页脚显示（true显示，false隐藏）'),(10,'主框架页-是否开启页签','sys.index.tagsView','true','Y','admin','2025-08-13 21:59:25','',NULL,'是否开启菜单多页签显示（true显示，false隐藏）'),(11,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2025-08-13 21:59:25','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2025-08-13 21:59:23','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-08-13 21:59:23','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-08-13 21:59:23','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-08-13 21:59:23','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-08-13 21:59:23','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2025-08-13 21:59:23','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2025-08-13 21:59:23','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2025-08-13 21:59:23','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-08-13 21:59:23','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-08-13 21:59:23','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2025-08-13 21:59:24','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2025-08-13 21:59:24','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2025-08-13 21:59:24','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2025-08-13 21:59:24','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2025-08-13 21:59:24','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2025-08-13 21:59:24','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2025-08-13 21:59:24','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2025-08-13 21:59:24','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2025-08-13 21:59:24','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2025-08-13 21:59:24','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2025-08-13 21:59:24','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2025-08-13 21:59:24','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2025-08-13 21:59:24','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2025-08-13 21:59:24','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2025-08-13 21:59:24','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2025-08-13 21:59:24','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2025-08-13 21:59:24','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2025-08-13 21:59:24','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2025-08-13 21:59:24','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2025-08-13 21:59:24','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2025-08-13 21:59:24','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2025-08-13 21:59:24','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2025-08-13 21:59:24','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2025-08-13 21:59:24','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2025-08-13 21:59:24','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2025-08-13 21:59:24','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2025-08-13 21:59:25','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2025-08-13 21:59:25','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2025-08-13 21:59:25','',NULL,'停用状态'),(100,1,'TRON','TRON','coin_type','','default','Y','0','admin','2025-08-14 16:55:05','admin','2025-08-16 18:28:31',''),(101,2,'BTC','BTC','coin_type',NULL,'default','N','0','admin','2025-08-14 16:55:21','',NULL,NULL),(102,3,'ETH','ETH','coin_type',NULL,'default','N','0','admin','2025-08-14 16:55:39','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2025-08-13 21:59:24','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2025-08-13 21:59:24','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2025-08-13 21:59:24','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2025-08-13 21:59:24','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2025-08-13 21:59:24','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2025-08-13 21:59:24','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2025-08-13 21:59:24','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2025-08-13 21:59:24','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2025-08-13 21:59:24','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2025-08-13 21:59:24','',NULL,'登录状态列表'),(100,'币种','coin_type','0','admin','2025-08-14 16:54:21','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2025-08-13 21:59:25','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2025-08-13 21:59:25','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2025-08-13 21:59:25','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-08-13 22:08:43'),(101,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-08-13 22:08:47'),(102,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-08-13 22:08:52'),(103,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-08-14 16:37:13'),(104,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-08-14 17:02:16'),(105,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','1','验证码错误','2025-08-14 17:44:00'),(106,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-08-14 17:44:03'),(107,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-08-15 13:47:31'),(108,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-08-16 18:15:30'),(109,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-08-16 18:23:02'),(110,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-08-16 19:53:00'),(111,'admin','127.0.0.1','内网IP','Chrome 13','Mac OS X','0','登录成功','2025-08-16 20:12:49');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'#','','M','0','1','','fa fa-gear','admin','2025-08-13 21:59:23','',NULL,'系统管理目录'),(2,'系统监控',0,2,'#','','M','0','1','','fa fa-video-camera','admin','2025-08-13 21:59:23','',NULL,'系统监控目录'),(3,'系统工具',0,3,'#','','M','0','1','','fa fa-bars','admin','2025-08-13 21:59:23','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip','menuBlank','C','0','1','','fa fa-location-arrow','admin','2025-08-13 21:59:23','',NULL,'若依官网地址'),(100,'用户管理',1,1,'/system/user','','C','0','1','system:user:view','fa fa-user-o','admin','2025-08-13 21:59:23','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'/system/role','','C','0','1','system:role:view','fa fa-user-secret','admin','2025-08-13 21:59:23','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'/system/menu','','C','0','1','system:menu:view','fa fa-th-list','admin','2025-08-13 21:59:23','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'/system/dept','','C','0','1','system:dept:view','fa fa-outdent','admin','2025-08-13 21:59:23','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'/system/post','','C','0','1','system:post:view','fa fa-address-card-o','admin','2025-08-13 21:59:23','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'/system/dict','','C','0','1','system:dict:view','fa fa-bookmark-o','admin','2025-08-13 21:59:23','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'/system/config','','C','0','1','system:config:view','fa fa-sun-o','admin','2025-08-13 21:59:23','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'/system/notice','','C','0','1','system:notice:view','fa fa-bullhorn','admin','2025-08-13 21:59:23','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'#','','M','0','1','','fa fa-pencil-square-o','admin','2025-08-13 21:59:23','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'/monitor/online','','C','0','1','monitor:online:view','fa fa-user-circle','admin','2025-08-13 21:59:23','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'/monitor/job','','C','0','1','monitor:job:view','fa fa-tasks','admin','2025-08-13 21:59:23','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'/monitor/data','','C','0','1','monitor:data:view','fa fa-bug','admin','2025-08-13 21:59:23','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'/monitor/server','','C','0','1','monitor:server:view','fa fa-server','admin','2025-08-13 21:59:23','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'/monitor/cache','','C','0','1','monitor:cache:view','fa fa-cube','admin','2025-08-13 21:59:23','',NULL,'缓存监控菜单'),(114,'表单构建',3,1,'/tool/build','','C','0','1','tool:build:view','fa fa-wpforms','admin','2025-08-13 21:59:23','',NULL,'表单构建菜单'),(115,'代码生成',3,2,'/tool/gen','','C','0','1','tool:gen:view','fa fa-code','admin','2025-08-13 21:59:23','',NULL,'代码生成菜单'),(116,'系统接口',3,3,'/tool/swagger','','C','0','1','tool:swagger:view','fa fa-gg','admin','2025-08-13 21:59:23','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'/monitor/operlog','','C','0','1','monitor:operlog:view','fa fa-address-book','admin','2025-08-13 21:59:23','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'/monitor/logininfor','','C','0','1','monitor:logininfor:view','fa fa-file-image-o','admin','2025-08-13 21:59:23','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'#','','F','0','1','system:user:list','#','admin','2025-08-13 21:59:23','',NULL,''),(1001,'用户新增',100,2,'#','','F','0','1','system:user:add','#','admin','2025-08-13 21:59:23','',NULL,''),(1002,'用户修改',100,3,'#','','F','0','1','system:user:edit','#','admin','2025-08-13 21:59:23','',NULL,''),(1003,'用户删除',100,4,'#','','F','0','1','system:user:remove','#','admin','2025-08-13 21:59:23','',NULL,''),(1004,'用户导出',100,5,'#','','F','0','1','system:user:export','#','admin','2025-08-13 21:59:23','',NULL,''),(1005,'用户导入',100,6,'#','','F','0','1','system:user:import','#','admin','2025-08-13 21:59:23','',NULL,''),(1006,'重置密码',100,7,'#','','F','0','1','system:user:resetPwd','#','admin','2025-08-13 21:59:23','',NULL,''),(1007,'角色查询',101,1,'#','','F','0','1','system:role:list','#','admin','2025-08-13 21:59:23','',NULL,''),(1008,'角色新增',101,2,'#','','F','0','1','system:role:add','#','admin','2025-08-13 21:59:23','',NULL,''),(1009,'角色修改',101,3,'#','','F','0','1','system:role:edit','#','admin','2025-08-13 21:59:23','',NULL,''),(1010,'角色删除',101,4,'#','','F','0','1','system:role:remove','#','admin','2025-08-13 21:59:23','',NULL,''),(1011,'角色导出',101,5,'#','','F','0','1','system:role:export','#','admin','2025-08-13 21:59:23','',NULL,''),(1012,'菜单查询',102,1,'#','','F','0','1','system:menu:list','#','admin','2025-08-13 21:59:23','',NULL,''),(1013,'菜单新增',102,2,'#','','F','0','1','system:menu:add','#','admin','2025-08-13 21:59:23','',NULL,''),(1014,'菜单修改',102,3,'#','','F','0','1','system:menu:edit','#','admin','2025-08-13 21:59:23','',NULL,''),(1015,'菜单删除',102,4,'#','','F','0','1','system:menu:remove','#','admin','2025-08-13 21:59:23','',NULL,''),(1016,'部门查询',103,1,'#','','F','0','1','system:dept:list','#','admin','2025-08-13 21:59:23','',NULL,''),(1017,'部门新增',103,2,'#','','F','0','1','system:dept:add','#','admin','2025-08-13 21:59:23','',NULL,''),(1018,'部门修改',103,3,'#','','F','0','1','system:dept:edit','#','admin','2025-08-13 21:59:23','',NULL,''),(1019,'部门删除',103,4,'#','','F','0','1','system:dept:remove','#','admin','2025-08-13 21:59:23','',NULL,''),(1020,'岗位查询',104,1,'#','','F','0','1','system:post:list','#','admin','2025-08-13 21:59:23','',NULL,''),(1021,'岗位新增',104,2,'#','','F','0','1','system:post:add','#','admin','2025-08-13 21:59:23','',NULL,''),(1022,'岗位修改',104,3,'#','','F','0','1','system:post:edit','#','admin','2025-08-13 21:59:23','',NULL,''),(1023,'岗位删除',104,4,'#','','F','0','1','system:post:remove','#','admin','2025-08-13 21:59:23','',NULL,''),(1024,'岗位导出',104,5,'#','','F','0','1','system:post:export','#','admin','2025-08-13 21:59:23','',NULL,''),(1025,'字典查询',105,1,'#','','F','0','1','system:dict:list','#','admin','2025-08-13 21:59:23','',NULL,''),(1026,'字典新增',105,2,'#','','F','0','1','system:dict:add','#','admin','2025-08-13 21:59:23','',NULL,''),(1027,'字典修改',105,3,'#','','F','0','1','system:dict:edit','#','admin','2025-08-13 21:59:23','',NULL,''),(1028,'字典删除',105,4,'#','','F','0','1','system:dict:remove','#','admin','2025-08-13 21:59:23','',NULL,''),(1029,'字典导出',105,5,'#','','F','0','1','system:dict:export','#','admin','2025-08-13 21:59:23','',NULL,''),(1030,'参数查询',106,1,'#','','F','0','1','system:config:list','#','admin','2025-08-13 21:59:23','',NULL,''),(1031,'参数新增',106,2,'#','','F','0','1','system:config:add','#','admin','2025-08-13 21:59:23','',NULL,''),(1032,'参数修改',106,3,'#','','F','0','1','system:config:edit','#','admin','2025-08-13 21:59:23','',NULL,''),(1033,'参数删除',106,4,'#','','F','0','1','system:config:remove','#','admin','2025-08-13 21:59:23','',NULL,''),(1034,'参数导出',106,5,'#','','F','0','1','system:config:export','#','admin','2025-08-13 21:59:23','',NULL,''),(1035,'公告查询',107,1,'#','','F','0','1','system:notice:list','#','admin','2025-08-13 21:59:23','',NULL,''),(1036,'公告新增',107,2,'#','','F','0','1','system:notice:add','#','admin','2025-08-13 21:59:23','',NULL,''),(1037,'公告修改',107,3,'#','','F','0','1','system:notice:edit','#','admin','2025-08-13 21:59:23','',NULL,''),(1038,'公告删除',107,4,'#','','F','0','1','system:notice:remove','#','admin','2025-08-13 21:59:23','',NULL,''),(1039,'操作查询',500,1,'#','','F','0','1','monitor:operlog:list','#','admin','2025-08-13 21:59:23','',NULL,''),(1040,'操作删除',500,2,'#','','F','0','1','monitor:operlog:remove','#','admin','2025-08-13 21:59:23','',NULL,''),(1041,'详细信息',500,3,'#','','F','0','1','monitor:operlog:detail','#','admin','2025-08-13 21:59:23','',NULL,''),(1042,'日志导出',500,4,'#','','F','0','1','monitor:operlog:export','#','admin','2025-08-13 21:59:23','',NULL,''),(1043,'登录查询',501,1,'#','','F','0','1','monitor:logininfor:list','#','admin','2025-08-13 21:59:23','',NULL,''),(1044,'登录删除',501,2,'#','','F','0','1','monitor:logininfor:remove','#','admin','2025-08-13 21:59:23','',NULL,''),(1045,'日志导出',501,3,'#','','F','0','1','monitor:logininfor:export','#','admin','2025-08-13 21:59:23','',NULL,''),(1046,'账户解锁',501,4,'#','','F','0','1','monitor:logininfor:unlock','#','admin','2025-08-13 21:59:24','',NULL,''),(1047,'在线查询',109,1,'#','','F','0','1','monitor:online:list','#','admin','2025-08-13 21:59:24','',NULL,''),(1048,'批量强退',109,2,'#','','F','0','1','monitor:online:batchForceLogout','#','admin','2025-08-13 21:59:24','',NULL,''),(1049,'单条强退',109,3,'#','','F','0','1','monitor:online:forceLogout','#','admin','2025-08-13 21:59:24','',NULL,''),(1050,'任务查询',110,1,'#','','F','0','1','monitor:job:list','#','admin','2025-08-13 21:59:24','',NULL,''),(1051,'任务新增',110,2,'#','','F','0','1','monitor:job:add','#','admin','2025-08-13 21:59:24','',NULL,''),(1052,'任务修改',110,3,'#','','F','0','1','monitor:job:edit','#','admin','2025-08-13 21:59:24','',NULL,''),(1053,'任务删除',110,4,'#','','F','0','1','monitor:job:remove','#','admin','2025-08-13 21:59:24','',NULL,''),(1054,'状态修改',110,5,'#','','F','0','1','monitor:job:changeStatus','#','admin','2025-08-13 21:59:24','',NULL,''),(1055,'任务详细',110,6,'#','','F','0','1','monitor:job:detail','#','admin','2025-08-13 21:59:24','',NULL,''),(1056,'任务导出',110,7,'#','','F','0','1','monitor:job:export','#','admin','2025-08-13 21:59:24','',NULL,''),(1057,'生成查询',115,1,'#','','F','0','1','tool:gen:list','#','admin','2025-08-13 21:59:24','',NULL,''),(1058,'生成修改',115,2,'#','','F','0','1','tool:gen:edit','#','admin','2025-08-13 21:59:24','',NULL,''),(1059,'生成删除',115,3,'#','','F','0','1','tool:gen:remove','#','admin','2025-08-13 21:59:24','',NULL,''),(1060,'预览代码',115,4,'#','','F','0','1','tool:gen:preview','#','admin','2025-08-13 21:59:24','',NULL,''),(1061,'生成代码',115,5,'#','','F','0','1','tool:gen:code','#','admin','2025-08-13 21:59:24','',NULL,''),(2008,'钱包管理',0,1,'#','menuItem','M','0','1',NULL,'fa fa-credit-card-alt','admin','2025-08-16 18:16:48','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2025-08-13 21:59:25','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2025-08-13 21:59:25','',NULL,'管理员'),(3,'若依开源框架介绍','1',_binary '<p><span style=\"color: rgb(230, 0, 0);\">项目介绍</span></p><p><font color=\"#333333\">RuoYi开源项目是为企业用户定制的后台脚手架框架，为企业打造的一站式解决方案，降低企业开发成本，提升开发效率。主要包括用户管理、角色管理、部门管理、菜单管理、参数管理、字典管理、</font><span style=\"color: rgb(51, 51, 51);\">岗位管理</span><span style=\"color: rgb(51, 51, 51);\">、定时任务</span><span style=\"color: rgb(51, 51, 51);\">、</span><span style=\"color: rgb(51, 51, 51);\">服务监控、登录日志、操作日志、代码生成等功能。其中，还支持多数据源、数据权限、国际化、Redis缓存、Docker部署、滑动验证码、第三方认证登录、分布式事务、</span><font color=\"#333333\">分布式文件存储</font><span style=\"color: rgb(51, 51, 51);\">、分库分表处理等技术特点。</span></p><p><img src=\"https://foruda.gitee.com/images/1705030583977401651/5ed5db6a_1151004.png\" style=\"width: 64px;\"><br></p><p><span style=\"color: rgb(230, 0, 0);\">官网及演示</span></p><p><span style=\"color: rgb(51, 51, 51);\">若依官网地址：&nbsp;</span><a href=\"http://ruoyi.vip\" target=\"_blank\">http://ruoyi.vip</a><a href=\"http://ruoyi.vip\" target=\"_blank\"></a></p><p><span style=\"color: rgb(51, 51, 51);\">若依文档地址：&nbsp;</span><a href=\"http://doc.ruoyi.vip\" target=\"_blank\">http://doc.ruoyi.vip</a><br></p><p><span style=\"color: rgb(51, 51, 51);\">演示地址【不分离版】：&nbsp;</span><a href=\"http://demo.ruoyi.vip\" target=\"_blank\">http://demo.ruoyi.vip</a></p><p><span style=\"color: rgb(51, 51, 51);\">演示地址【分离版本】：&nbsp;</span><a href=\"http://vue.ruoyi.vip\" target=\"_blank\">http://vue.ruoyi.vip</a></p><p><span style=\"color: rgb(51, 51, 51);\">演示地址【微服务版】：&nbsp;</span><a href=\"http://cloud.ruoyi.vip\" target=\"_blank\">http://cloud.ruoyi.vip</a></p><p><span style=\"color: rgb(51, 51, 51);\">演示地址【移动端版】：&nbsp;</span><a href=\"http://h5.ruoyi.vip\" target=\"_blank\">http://h5.ruoyi.vip</a></p><p><br style=\"color: rgb(48, 49, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12px;\"></p>','0','admin','2025-08-13 21:59:25','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":[\"b_account_info\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 16:52:26',101),(101,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"b_account_info\"],\"tableComment\":[\"虚拟币\"],\"className\":[\"BAccountInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户标识\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商户号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mchNo\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户ID\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"币种\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"coinType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5]','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 16:53:33',14),(102,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.addSave()','POST',1,'admin','研发部门','/system/dict/add','127.0.0.1','内网IP','{\"dictName\":[\"币种\"],\"dictType\":[\"coin_type\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 16:54:21',6),(103,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"USDT\"],\"dictValue\":[\"USDT\"],\"dictType\":[\"coin_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 16:55:05',22),(104,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"BTC\"],\"dictValue\":[\"BTC\"],\"dictType\":[\"coin_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 16:55:21',21),(105,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"ETH\"],\"dictValue\":[\"ETH\"],\"dictType\":[\"coin_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"default\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 16:55:39',9),(106,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"DOGE\"],\"dictValue\":[\"DOGE\"],\"dictType\":[\"coin_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"default\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 16:56:05',16),(107,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"b_account_info\"],\"tableComment\":[\"虚拟币\"],\"className\":[\"BAccountInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户标识\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商户号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mchNo\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户ID\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"币种\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"coinType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"coin_type\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"createdTime\"],\"columns[5].queryType\":[\"EQ\"],\"colum','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 16:57:06',17),(108,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"虚拟币管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-money\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 16:59:01',9),(109,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"虚拟币地址列表\"],\"url\":[\"/t\"],\"target\":[\"menuItem\"],\"perms\":[\"List\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 17:00:01',8),(110,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"虚拟币地址列表\"],\"url\":[\"/t\"],\"target\":[\"menuItem\"],\"perms\":[\"blockchain\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 17:00:48',14),(111,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"虚拟币地址列表\"],\"url\":[\"/blockchain/address\"],\"target\":[\"menuItem\"],\"perms\":[\"blockchain:address:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 17:03:06',6),(112,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"地址列表\"],\"url\":[\"/blockchain/address\"],\"target\":[\"menuItem\"],\"perms\":[\"blockchain:address:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 17:03:18',5),(113,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"b_account_info\"],\"tableComment\":[\"虚拟币信息\"],\"className\":[\"BAccountInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户标识\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商户号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mchNo\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户ID\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"币种\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"coinType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"coin_type\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"createdTime\"],\"columns[5].queryType\":[\"EQ\"],\"col','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 17:03:49',11),(114,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"b_account_info\"],\"tableComment\":[\"虚拟币信息\"],\"className\":[\"BAccountInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户标识\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商户号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mchNo\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户ID\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"币种\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"coinType\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"coin_type\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"createdTime\"],\"columns[5].queryType\":[\"EQ\"],\"col','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 17:05:35',36),(115,'代码生成',8,'com.ruoyi.generator.controller.GenController.download()','GET',1,'admin','研发部门','/tool/gen/download/b_account_info','127.0.0.1','内网IP','\"b_account_info\"',NULL,0,NULL,'2025-08-14 17:17:24',63),(116,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','GET',1,'admin','研发部门','/system/menu/remove/2001','127.0.0.1','内网IP','2001','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-14 17:18:34',26),(117,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"钱包管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-credit-card-alt\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:16:49',47),(118,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','GET',1,'admin','研发部门','/system/menu/remove/2003','127.0.0.1','内网IP','2003','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:17:08',16),(119,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','GET',1,'admin','研发部门','/system/menu/remove/2007','127.0.0.1','内网IP','2007','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:17:19',17),(120,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','GET',1,'admin','研发部门','/system/menu/remove/2006','127.0.0.1','内网IP','2006','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:17:32',15),(121,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','GET',1,'admin','研发部门','/system/menu/remove/2004','127.0.0.1','内网IP','2004','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:17:40',13),(122,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','GET',1,'admin','研发部门','/system/menu/remove/2005','127.0.0.1','内网IP','2005','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:17:46',14),(123,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','GET',1,'admin','研发部门','/system/menu/remove/2002','127.0.0.1','内网IP','2002','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:17:50',9),(124,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','GET',1,'admin','研发部门','/system/menu/remove/2000','127.0.0.1','内网IP','2000','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:17:55',10),(125,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','POST',1,'admin','研发部门','/tool/gen/remove','127.0.0.1','内网IP','{\"ids\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:23:19',22),(126,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":[\"mch_chain_wallet_info,chain_eth_wallet,chain_btc_wallet,chain_tron_wallet\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:23:28',101),(127,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/chain_btc_wallet','127.0.0.1','内网IP','\"chain_btc_wallet\"','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:24:55',38),(128,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/chain_eth_wallet','127.0.0.1','内网IP','\"chain_eth_wallet\"','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:24:57',31),(129,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','POST',1,'admin','研发部门','/tool/gen/remove','127.0.0.1','内网IP','{\"ids\":[\"2\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:25:01',8),(130,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','POST',1,'admin','研发部门','/tool/gen/remove','127.0.0.1','内网IP','{\"ids\":[\"3\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:25:07',8),(131,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','POST',1,'admin','研发部门','/tool/gen/remove','127.0.0.1','内网IP','{\"ids\":[\"4\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:25:09',8),(132,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":[\"chain_tron_wallet,chain_eth_wallet,chain_btc_wallet\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:25:17',95),(133,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"5\"],\"tableName\":[\"mch_chain_wallet_info\"],\"tableComment\":[\"商户用户钱包\"],\"className\":[\"MchChainWalletInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"23\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户标识\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"24\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商户号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mchNo\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"25\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户ID\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"26\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"币种 USDT、ETH、BTC、DOGE\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"coinType\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"coin_type\"],\"columns[4].columnId\":[\"27\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"28\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"createdTime\"],\"col','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:26:32',20),(134,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"5\"],\"tableName\":[\"mch_chain_wallet_info\"],\"tableComment\":[\"商户用户钱包\"],\"className\":[\"MchChainWalletInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"23\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户标识\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"24\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商户号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mchNo\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"25\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户ID\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"26\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"币种 USDT、ETH、BTC、DOGE\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"coinType\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"coin_type\"],\"columns[4].columnId\":[\"27\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"28\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"createdTime\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].isRequ','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:28:11',21),(135,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.editSave()','POST',1,'admin','研发部门','/system/dict/data/edit','127.0.0.1','内网IP','{\"dictCode\":[\"100\"],\"dictLabel\":[\"TRON\"],\"dictValue\":[\"TRON\"],\"dictType\":[\"coin_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:28:31',9),(136,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"7\"],\"tableName\":[\"chain_eth_wallet\"],\"tableComment\":[\"以太坊钱包\"],\"className\":[\"ChainEthWallet\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"35\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"钱包地址\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"address\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"36\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"以太币余额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"ethBalance\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"37\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"创建时间\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"createTime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"38\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"更新时间\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"updateTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"39\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"数据库更新时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"dbUpdateTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"wallet\"],\"functionName\":[\"ETH钱包\"],\"formColNum\":[\"1\"],\"genType','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:29:05',13),(137,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"8\"],\"tableName\":[\"chain_tron_wallet\"],\"tableComment\":[\"USDT钱包\"],\"className\":[\"ChainTronWallet\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"40\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"钱包地址\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"address\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"41\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"TRX余额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"trxBalance\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"42\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"usdt余额\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"usdtBalance\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"43\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"44\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"更新时间\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"updateTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"45\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"数据库更新时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"dbUpdate','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:29:18',18),(138,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"6\"],\"tableName\":[\"chain_btc_wallet\"],\"tableComment\":[\"比特币钱包\"],\"className\":[\"ChainBtcWallet\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"30\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"钱包地址\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"address\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"31\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比特币余额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"btcBalance\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"32\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"创建时间\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"createTime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"33\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"更新时间\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"updateTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"34\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"数据库更新时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"dbUpdateTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"wallet\"],\"functionName\":[\"BTC钱包\"],\"formColNum\":[\"1\"],\"genType','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:29:32',9),(139,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"5\"],\"tableName\":[\"mch_chain_wallet_info\"],\"tableComment\":[\"商户用户钱包\"],\"className\":[\"MchChainWalletInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"23\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户标识\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"24\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商户号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mchNo\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"25\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户ID\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"26\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"币种 USDT、ETH、BTC、DOGE\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"coinType\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"coin_type\"],\"columns[4].columnId\":[\"27\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"28\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"createdTime\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].isRequ','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:30:47',17),(140,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"6\"],\"tableName\":[\"chain_btc_wallet\"],\"tableComment\":[\"比特币钱包\"],\"className\":[\"ChainBtcWallet\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"30\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"钱包地址\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"address\"],\"columns[0].isList\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"LIKE\"],\"columns[0].isRequired\":[\"1\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"31\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比特币余额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"btcBalance\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"32\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"创建时间\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"createTime\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"BETWEEN\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"33\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"更新时间\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"updateTime\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"BETWEEN\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"34\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"数据库更新时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"dbUpdateTime\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.blockchain\"],\"moduleName\":[\"blockchain\"],\"businessName\":[\"btcWattle\"],\"functionName\":[\"BTC钱包\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"\"],\"params[parentMen','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:32:46',12),(141,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"8\"],\"tableName\":[\"chain_tron_wallet\"],\"tableComment\":[\"USDT钱包\"],\"className\":[\"ChainTronWallet\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"40\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"钱包地址\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"address\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"41\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"TRX余额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"trxBalance\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"42\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"usdt余额\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"usdtBalance\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"BETWEEN\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"43\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"BETWEEN\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"44\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"更新时间\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"updateTime\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"BETWEEN\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"45\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"数据库更新时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"dbUpdateTime\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].isRequired\":[\"1\"],\"columns[5].htmlType\":','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:33:54',51),(142,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"6\"],\"tableName\":[\"chain_btc_wallet\"],\"tableComment\":[\"比特币钱包\"],\"className\":[\"ChainBtcWallet\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"30\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"钱包地址\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"address\"],\"columns[0].isList\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"LIKE\"],\"columns[0].isRequired\":[\"1\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"31\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比特币余额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"btcBalance\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"BETWEEN\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"32\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"创建时间\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"createTime\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"BETWEEN\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"33\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"更新时间\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"updateTime\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"BETWEEN\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"34\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"数据库更新时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"dbUpdateTime\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.blockchain\"],\"moduleName\":[\"blockchain\"],\"businessName\":[\"btcWattle\"],\"functionName\":[\"BTC钱包\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"\"],\"params[pare','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:34:02',17),(143,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"8\"],\"tableName\":[\"chain_tron_wallet\"],\"tableComment\":[\"USDT钱包\"],\"className\":[\"ChainTronWallet\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"40\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"钱包地址\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"address\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"41\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"TRX余额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"trxBalance\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"42\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"usdt余额\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"usdtBalance\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"BETWEEN\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"43\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"BETWEEN\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"44\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"更新时间\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"updateTime\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"BETWEEN\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"45\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"数据库更新时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"dbUpdateTime\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].isRequired\":[\"1\"],\"columns[5].htmlType\":','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:35:28',21),(144,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"7\"],\"tableName\":[\"chain_eth_wallet\"],\"tableComment\":[\"以太坊钱包\"],\"className\":[\"ChainEthWallet\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"35\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"钱包地址\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"address\"],\"columns[0].isList\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"LIKE\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"36\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"以太币余额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"ethBalance\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"BETWEEN\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"37\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"创建时间\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"createTime\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"38\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"更新时间\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"updateTime\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"39\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"数据库更新时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"dbUpdateTime\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.blockchain\"],\"moduleName\":[\"blockchain\"],\"businessName\":[\"ethWattle\"],\"functionName\":[\"ETH钱包\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"2008\"],\"params[parentMenuName]\":[\"钱包管理\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:36:28',17),(145,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"8\"],\"tableName\":[\"chain_tron_wallet\"],\"tableComment\":[\"USDT钱包\"],\"className\":[\"ChainTronWallet\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"40\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"钱包地址\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"address\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"41\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"TRX余额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"trxBalance\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"42\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"usdt余额\"],\"columns[2].javaType\":[\"BigDecimal\"],\"columns[2].javaField\":[\"usdtBalance\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"BETWEEN\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"43\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"44\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"更新时间\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"updateTime\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"45\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"数据库更新时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"dbUpdateTime\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].isRequired\":[\"1\"],\"columns[5].htmlType\":[\"datetime\"],\"columns[5].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packag','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:36:49',18),(146,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"6\"],\"tableName\":[\"chain_btc_wallet\"],\"tableComment\":[\"比特币钱包\"],\"className\":[\"ChainBtcWallet\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"30\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"钱包地址\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"address\"],\"columns[0].isList\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"LIKE\"],\"columns[0].isRequired\":[\"1\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"31\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比特币余额\"],\"columns[1].javaType\":[\"BigDecimal\"],\"columns[1].javaField\":[\"btcBalance\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"BETWEEN\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"32\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"创建时间\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"createTime\"],\"columns[2].isList\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"33\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"更新时间\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"updateTime\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"34\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"数据库更新时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"dbUpdateTime\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.blockchain\"],\"moduleName\":[\"blockchain\"],\"businessName\":[\"btcWattle\"],\"functionName\":[\"BTC钱包\"],\"formColNum\":[\"1\"],\"genType\":[\"0\"],\"params[parentMenuId]\":[\"\"],\"params[parentMenuName]\":[\"\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:37:08',22),(147,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"chain_eth_wallet,chain_tron_wallet,chain_btc_wallet,mch_chain_wallet_info\"]}',NULL,0,NULL,'2025-08-16 18:42:51',244),(148,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"5\"],\"tableName\":[\"mch_chain_wallet_info\"],\"tableComment\":[\"商户用户钱包\"],\"className\":[\"MchChainWalletInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"23\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户标识\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"24\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商户号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mchNo\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"25\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户ID\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"26\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"币种 TRON、ETH、BTC、DOGE\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"coinType\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"coin_type\"],\"columns[4].columnId\":[\"27\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"28\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"createdTime\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].isRequ','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 18:46:12',15),(149,'字典数据',3,'com.ruoyi.web.controller.system.SysDictDataController.remove()','POST',1,'admin','研发部门','/system/dict/data/remove','127.0.0.1','内网IP','{\"ids\":[\"103\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 19:05:08',106),(150,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/mch_chain_wallet_info','127.0.0.1','内网IP','\"mch_chain_wallet_info\"','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 19:53:11',112),(151,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"5\"],\"tableName\":[\"mch_chain_wallet_info\"],\"tableComment\":[\"商户用户钱包\"],\"className\":[\"MchChainWalletInfo\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"23\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户标识\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"24\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商户号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"mchNo\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"25\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户ID\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"46\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"钱包类型\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"chainType\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"coin_type\"],\"columns[4].columnId\":[\"27\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"28\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"createdTime\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].isRequired\":[\"1\"],\"columns[5].htmlType\":[\"input','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2025-08-16 19:54:02',20),(152,'代码生成',8,'com.ruoyi.generator.controller.GenController.download()','GET',1,'admin','研发部门','/tool/gen/download/mch_chain_wallet_info','127.0.0.1','内网IP','\"mch_chain_wallet_info\"',NULL,0,NULL,'2025-08-16 19:54:51',128);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2025-08-13 21:59:23','',NULL,''),(2,'se','项目经理',2,'0','admin','2025-08-13 21:59:23','',NULL,''),(3,'hr','人力资源',3,'0','admin','2025-08-13 21:59:23','',NULL,''),(4,'user','普通员工',4,'0','admin','2025-08-13 21:59:23','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1','0','0','admin','2025-08-13 21:59:23','',NULL,'超级管理员'),(2,'普通角色','common',2,'2','0','0','admin','2025-08-13 21:59:23','',NULL,'普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(2,1061);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '盐加密',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','29c67a30398638269fe600f73a054934','111111','0','0','127.0.0.1','2025-08-16 20:12:49',NULL,'admin','2025-08-13 21:59:23','','2025-08-16 20:12:49','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','8e6d98b90472783cc73c17047ddccf36','222222','0','0','127.0.0.1',NULL,NULL,'admin','2025-08-13 21:59:23','',NULL,'测试员');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_online`
--

DROP TABLE IF EXISTS `sys_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='在线用户记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_online`
--

LOCK TABLES `sys_user_online` WRITE;
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-17 14:51:57
