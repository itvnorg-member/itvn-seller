# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: seller
# Generation Time: 2018-07-25 15:10:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_customer_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table group_customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `group_customers`;

CREATE TABLE `group_customers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `discount_amount` int(11) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `group_customers` WRITE;
/*!40000 ALTER TABLE `group_customers` DISABLE KEYS */;

INSERT INTO `group_customers` (`id`, `name`, `discount_amount`, `active`, `order`, `created_at`, `updated_at`)
VALUES
	(1,'Group 111',200000111,1,0,'2018-07-25 14:54:57','2018-07-25 10:06:23');

/*!40000 ALTER TABLE `group_customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `alias` varchar(50) NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `name`, `alias`, `active`, `order`, `created_at`, `updated_at`)
VALUES
	(1,'Cửa hàng','shop_manager',1,0,'2018-04-09 04:46:03','2018-07-24 13:21:41'),
	(2,'Quản lý bán hàng','seller_manager',1,0,'2018-04-09 04:46:57','2018-07-24 13:21:26'),
	(3,'Sản phẩm','product_manager',1,0,'2018-04-09 04:47:16','2018-07-24 13:21:58'),
	(4,'Kho hàng','warehouse_manager',1,0,'2018-07-24 13:22:43','2018-07-24 13:22:43'),
	(5,'Kế toán','accountant_manager',1,0,'2018-07-24 13:23:02','2018-07-24 13:23:31'),
	(6,'Quản lý tài khoản','user_manager',1,0,'2018-07-24 13:24:37','2018-07-24 13:24:37'),
	(7,'Thống kê','report_manager',1,0,'2018-07-24 13:25:00','2018-07-24 13:25:00'),
	(8,'Cài đặt','setting_manager',1,0,'2018-07-24 13:25:09','2018-07-24 13:25:09'),
	(9,'Quản lý khách hàng','customer_manager',1,0,'2018-07-25 14:24:05','2018-07-25 14:24:05');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `role_id` int(11) unsigned NOT NULL,
  `permission_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `permission_id` (`permission_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;

INSERT INTO `role_permission` (`role_id`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2018-07-24 13:59:18','2018-07-24 13:59:18'),
	(1,2,'2018-07-24 13:59:25','2018-07-24 13:59:25'),
	(1,3,'2018-07-24 13:59:28','2018-07-24 13:59:28'),
	(1,4,'2018-07-24 13:59:31','2018-07-24 13:59:31'),
	(1,5,'2018-07-24 13:59:34','2018-07-24 13:59:34'),
	(1,6,'2018-07-24 13:59:37','2018-07-25 14:48:25'),
	(1,7,'2018-07-24 13:59:41','2018-07-24 13:59:41'),
	(1,8,'2018-07-24 13:59:43','2018-07-24 13:59:43'),
	(1,9,'2018-07-25 14:48:28','2018-07-25 14:48:28');

/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
