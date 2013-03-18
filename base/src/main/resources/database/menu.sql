# MySQL-Front 5.1  (Build 4.13)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: jpa
# ------------------------------------------------------
# Server version 5.5.12

USE `jpa`;

#
# Dumping data for table menu
#

/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,NULL,NULL,0,'系统管理',NULL);
INSERT INTO `menu` VALUES (2,'Auth',NULL,1,'权限管理',1);
INSERT INTO `menu` VALUES (3,'Role',NULL,1,'角色管理',1);
INSERT INTO `menu` VALUES (4,'User',NULL,1,'用户管理',1);
INSERT INTO `menu` VALUES (5,NULL,NULL,0,'爆破管理',NULL);
INSERT INTO `menu` VALUES (6,'BlastingTask',NULL,1,'爆破任务',5);
INSERT INTO `menu` VALUES (7,'BlastingMon',NULL,1,'过程监控',5);
INSERT INTO `menu` VALUES (8,NULL,NULL,0,'系统记录',NULL);
INSERT INTO `menu` VALUES (9,'AlarmLog',NULL,1,'报警记录',8);
INSERT INTO `menu` VALUES (10,'OPLog',NULL,1,'操作日志',8);
INSERT INTO `menu` VALUES (11,NULL,NULL,0,'统计分析',NULL);
INSERT INTO `menu` VALUES (12,'Report',NULL,1,'统计报表',8);
INSERT INTO `menu` VALUES (13,'Chart',NULL,1,'图表统计',8);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
