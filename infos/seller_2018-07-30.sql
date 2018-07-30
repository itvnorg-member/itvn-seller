# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: seller
# Generation Time: 2018-07-30 14:27:32 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;

INSERT INTO `brands` (`id`, `name`, `active`, `order`, `created_at`, `updated_at`)
VALUES
	(1,'Samsung',1,0,'2018-07-30 10:45:46','2018-07-30 10:45:46');

/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table carts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(11) unsigned DEFAULT NULL,
  `partner_id` int(11) unsigned DEFAULT NULL,
  `customer_id` int(11) unsigned DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `discount_amount` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `level` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `parent_id`, `name`, `description`, `active`, `order`, `level`, `created_at`, `updated_at`)
VALUES
	(1,6,'Arrow111','sdfdfsf',1,2,2,'2018-05-03 10:56:26','2018-07-30 05:44:08'),
	(5,NULL,'test','',0,0,NULL,'2018-07-26 13:17:51','2018-07-30 05:52:46'),
	(6,5,'sdf','sdfsdf',1,NULL,1,'2018-07-26 08:18:49','2018-07-26 08:18:49'),
	(7,7,'tes','sdfsdf',1,NULL,127,'2018-07-26 08:20:32','2018-07-26 08:20:38');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table colors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `colors`;

CREATE TABLE `colors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;

INSERT INTO `colors` (`id`, `photo`, `code`, `name`, `active`, `order`, `created_at`, `updated_at`)
VALUES
	(1,NULL,NULL,'xanh',1,NULL,'2018-07-30 05:43:12','2018-07-30 05:43:12'),
	(2,'public/colors/a175c751e4c025bb688b26cc45072a1a.png',NULL,'test',1,NULL,'2018-07-30 07:31:28','2018-07-30 07:31:28');

/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_customer_id` int(11) DEFAULT NULL,
  `city_id` int(10) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;

INSERT INTO `customers` (`id`, `group_customer_id`, `city_id`, `code`, `name`, `email`, `phone`, `address`, `active`, `order`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,'abc','Dang','phidangmtv@gmail.com','123 223 222','5 lu gia',1,0,'2018-07-30 08:41:27','2018-07-30 08:41:42');

/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,'Group 111',200000111,1,0,'2018-07-25 14:54:57','2018-07-25 10:06:23'),
	(2,'Vip',1000,1,0,'2018-07-30 13:44:19','2018-07-30 13:44:19');

/*!40000 ALTER TABLE `group_customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table partners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `partners`;

CREATE TABLE `partners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `discount_amount` int(11) DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;

INSERT INTO `partners` (`id`, `city_id`, `code`, `name`, `discount_amount`, `email`, `phone`, `address`, `active`, `order`, `created_at`, `updated_at`)
VALUES
	(3,NULL,'abc111','test',11222333,'phidangmtv@gmail.comp','090 900 93 12',NULL,1,0,'2018-07-26 09:57:57','2018-07-26 10:02:04');

/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



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
	(9,'Quản lý khách hàng','customer_manager',1,0,'2018-07-25 14:24:05','2018-07-25 14:24:05'),
	(10,'Cộng Tác Viên','partner_manager',1,0,'2018-07-26 14:06:12','2018-07-26 14:06:12'),
	(11,'Nhà Cung Cấp','supplier_manager',1,0,'2018-07-30 13:58:29','2018-07-30 13:58:29');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `product_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `product_id` (`product_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;

INSERT INTO `product_category` (`product_id`, `category_id`, `created_at`, `updated_at`)
VALUES
	(1,5,'2018-07-30 10:47:40','2018-07-30 10:47:40'),
	(1,6,'2018-07-30 10:47:40','2018-07-30 10:47:40');

/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_detail`;

CREATE TABLE `product_detail` (
  `id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `color_id` int(11) unsigned DEFAULT NULL,
  `size_id` int(11) unsigned DEFAULT NULL,
  `quantity` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`,`size_id`,`color_id`),
  KEY `product_id_2` (`product_id`),
  KEY `color_id` (`color_id`),
  KEY `size_id` (`size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `product_detail` WRITE;
/*!40000 ALTER TABLE `product_detail` DISABLE KEYS */;

INSERT INTO `product_detail` (`id`, `product_id`, `color_id`, `size_id`, `quantity`, `created_at`, `updated_at`)
VALUES
	(0,1,NULL,NULL,0,'2018-07-30 05:47:40','2018-07-30 05:47:40');

/*!40000 ALTER TABLE `product_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_photos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_photos`;

CREATE TABLE `product_photos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `origin` varchar(255) NOT NULL DEFAULT '',
  `large` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `color_code` varchar(20) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `colors` varchar(500) DEFAULT NULL,
  `sizes` varchar(500) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `sell_price` int(11) DEFAULT NULL,
  `quantity` int(11) unsigned DEFAULT NULL,
  `quantity_available` int(10) unsigned DEFAULT NULL,
  `photo` varchar(255) DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `brand_id` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `supplier_id`, `brand_id`, `code`, `barcode`, `name`, `colors`, `sizes`, `price`, `sell_price`, `quantity`, `quantity_available`, `photo`, `description`, `content`, `active`, `order`, `created_at`, `updated_at`)
VALUES
	(1,NULL,1,'a1',NULL,'aaaa','','',-23,1000,0,NULL,'public/products/2c74c6817a2156ad44f3c63e659f1ef0.png','sdfsdf','<p>sdfsdf</p>',1,1,'2018-07-30 05:47:40','2018-07-30 05:47:40'),
	(2,NULL,NULL,'a1',NULL,'aaaa1',NULL,NULL,-1111,12323,0,NULL,'','sdfsdf','<p><br></p>',1,NULL,'2018-07-30 05:51:07','2018-07-30 05:51:07');

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
	(1,9,'2018-07-25 14:48:28','2018-07-25 14:48:28'),
	(1,10,'2018-07-26 14:06:24','2018-07-26 14:06:24'),
	(1,11,'2018-07-30 14:13:34','2018-07-30 14:13:34');

/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `alias` varchar(50) NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `alias`, `active`, `order`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','admin',1,0,'2018-04-09 04:26:57','2018-04-09 04:27:42'),
	(2,'Customer','customer',1,1,'2018-04-09 04:26:58','2018-04-09 04:27:16'),
	(3,'Manager','manager',1,0,'2018-04-10 03:46:55','2018-04-10 03:46:55');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sizes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sizes`;

CREATE TABLE `sizes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sizes` WRITE;
/*!40000 ALTER TABLE `sizes` DISABLE KEYS */;

INSERT INTO `sizes` (`id`, `code`, `name`, `active`, `order`, `created_at`, `updated_at`)
VALUES
	(1,'s','size s',1,0,'2018-07-30 10:47:30','2018-07-30 10:47:30');

/*!40000 ALTER TABLE `sizes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table suppliers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `tax_code` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `responsible_person` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;

INSERT INTO `suppliers` (`id`, `city_id`, `code`, `tax_code`, `name`, `responsible_person`, `email`, `phone`, `address`, `active`, `order`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'sn001','012345','Sony','Diep Phi Dang','phidangmtv@gmail.com','090 900 93 12','5 lu gia',1,0,'2018-07-30 09:17:55','2018-07-30 09:18:04'),
	(2,NULL,'sn0011','0123451','Sony1','DIep Phi Dang','phidangmtv@gmail.com','090 900 93 12',NULL,1,0,'2018-07-30 09:22:46','2018-07-30 09:22:46');

/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_failed_jobs`;

CREATE TABLE `sys_failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sys_failed_jobs` WRITE;
/*!40000 ALTER TABLE `sys_failed_jobs` DISABLE KEYS */;

INSERT INTO `sys_failed_jobs` (`id`, `connection`, `queue`, `payload`, `exception`, `failed_at`)
VALUES
	(18,'database','default','{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:77;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}','ErrorException: simplexml_load_file(https://dhd-films-test.s3.amazonaws.com/panoramas/2/dl58rtLEcKdVgOkeH5Gy8yUlu4NDiWSsE3KVHzwP.xml): failed to open stream: HTTP request failed! HTTP/1.1 403 Forbidden\r\n in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:70\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 70, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(70): simplexml_load_file(\'https://dhd-fil...\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(99): App\\Services\\XMLPano->addScene(\'https://dhd-fil...\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}','2018-04-23 04:25:05'),
	(19,'database','default','{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:78;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}','ErrorException: simplexml_load_file(https://dhd-films-test.s3.amazonaws.com/panoramas/11/WeAiqxhlRjqMe3P3FkEWuiGGoGr5uJ9MPZpBvF2J.xml): failed to open stream: HTTP request failed! HTTP/1.1 403 Forbidden\r\n in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:70\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 70, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(70): simplexml_load_file(\'https://dhd-fil...\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(99): App\\Services\\XMLPano->addScene(\'https://dhd-fil...\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}','2018-04-23 20:55:16'),
	(20,'database','default','{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:79;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}','ErrorException: simplexml_load_file(https://dhd-films-test.s3.amazonaws.com/panoramas/11/WeAiqxhlRjqMe3P3FkEWuiGGoGr5uJ9MPZpBvF2J.xml): failed to open stream: HTTP request failed! HTTP/1.1 403 Forbidden\r\n in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:70\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 70, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(70): simplexml_load_file(\'https://dhd-fil...\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(99): App\\Services\\XMLPano->addScene(\'https://dhd-fil...\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}','2018-04-24 02:03:34'),
	(21,'database','default','{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:80;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}','ErrorException: simplexml_load_file(https://dhd-films-test.s3.amazonaws.com/panoramas/11/WeAiqxhlRjqMe3P3FkEWuiGGoGr5uJ9MPZpBvF2J.xml): failed to open stream: HTTP request failed! HTTP/1.1 403 Forbidden\r\n in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:70\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 70, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(70): simplexml_load_file(\'https://dhd-fil...\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(99): App\\Services\\XMLPano->addScene(\'https://dhd-fil...\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}','2018-04-24 02:58:30'),
	(22,'database','default','{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:81;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}','Illuminate\\Queue\\MaxAttemptsExceededException: A queued job has been attempted too many times. The job may have previously timed out. in /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php:385\nStack trace:\n#0 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(311): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), 1)\n#1 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#2 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#3 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#5 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#11 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#13 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#14 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#15 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 {main}','2018-04-24 03:50:49'),
	(23,'database','default','{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:82;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}','ErrorException: simplexml_load_file(https://dhd-films-test.s3.amazonaws.com/panoramas/2/dl58rtLEcKdVgOkeH5Gy8yUlu4NDiWSsE3KVHzwP.xml): failed to open stream: HTTP request failed! HTTP/1.1 403 Forbidden\r\n in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:70\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 70, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(70): simplexml_load_file(\'https://dhd-fil...\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(95): App\\Services\\XMLPano->addScene(\'https://dhd-fil...\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}','2018-05-03 04:04:52'),
	(24,'database','default','{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:83;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}','ErrorException: simplexml_load_file(https://dhd-films-test.s3.amazonaws.com/panoramas/2/dl58rtLEcKdVgOkeH5Gy8yUlu4NDiWSsE3KVHzwP.xml): failed to open stream: HTTP request failed! HTTP/1.1 403 Forbidden\r\n in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:70\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 70, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(70): simplexml_load_file(\'https://dhd-fil...\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(95): App\\Services\\XMLPano->addScene(\'https://dhd-fil...\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}','2018-05-03 05:54:09'),
	(25,'database','default','{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:87;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}','ErrorException: simplexml_load_file(): I/O warning : failed to load external entity \"\" in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:117\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 117, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(117): simplexml_load_file(\'\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(97): App\\Services\\XMLPano->updateSceneAttribute(\'\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}','2018-05-24 03:32:59');

/*!40000 ALTER TABLE `sys_failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_jobs`;

CREATE TABLE `sys_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `full_name` varchar(151) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `role_id`, `username`, `email`, `password`, `avatar`, `remember_token`, `first_name`, `last_name`, `full_name`, `active`, `deleted_at`, `created_at`, `updated_at`)
VALUES
	(1,1,'hieu','hieu@coolglow.com','$2y$10$FF/Gp/LiUXEfzrdpWeNObOHL8yY.Mi2BPV4wD1tCzdDQAMMJRdfDK','public/users/62d9b96b66228da6e45abc1664bc741e.png','LjFDdeJvkZoAiqgIu0ANCN8gPxNxx9jViO8z4u3eQbCQVrHHkQqtEqgur7A6','Dang','Diep','Dang111',1,NULL,'2018-04-10 03:46:21','2018-07-25 09:59:06'),
	(10,1,'','phidangmtv@gmail.com','$2y$10$zsn9yzd87SNmUeXoBDdSiO97InBGMeuUFYJMEIHtWkIyxUNOBOZkK',NULL,'r62Fcf6VdvyFE4gZHc9Bps8e8EwL0SOyq7syXUwl54L6xQx2g8PzVeuVW3wX','aa','bb','aa bb',1,NULL,'2018-04-11 06:12:44','2018-07-26 12:28:21');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
