/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : itvn_seller

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-08-02 14:30:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES ('1', 'Samsung', '1', '0', '2018-07-30 10:45:46', '2018-07-30 10:45:46');

-- ----------------------------
-- Table structure for carts
-- ----------------------------
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

-- ----------------------------
-- Records of carts
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '6', 'Arrow111', 'sdfdfsf', '1', '2', '2', '2018-05-03 10:56:26', '2018-07-30 05:44:08');
INSERT INTO `categories` VALUES ('5', null, 'test', '', '0', '0', null, '2018-07-26 13:17:51', '2018-07-30 05:52:46');
INSERT INTO `categories` VALUES ('6', '5', 'sdf', 'sdfsdf', '1', null, '1', '2018-07-26 08:18:49', '2018-07-26 08:18:49');
INSERT INTO `categories` VALUES ('7', '7', 'tes', 'sdfsdf', '1', null, '127', '2018-07-26 08:20:32', '2018-07-26 08:20:38');

-- ----------------------------
-- Table structure for cities
-- ----------------------------
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

-- ----------------------------
-- Records of cities
-- ----------------------------

-- ----------------------------
-- Table structure for colors
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of colors
-- ----------------------------
INSERT INTO `colors` VALUES ('1', null, null, 'xanh', '1', null, '2018-07-30 05:43:12', '2018-07-30 05:43:12');
INSERT INTO `colors` VALUES ('2', 'public/colors/a175c751e4c025bb688b26cc45072a1a.png', null, 'test', '1', null, '2018-07-30 07:31:28', '2018-07-30 07:31:28');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('1', '1', null, 'abc', 'Dang', 'phidangmtv@gmail.com', '123 223 222', '5 lu gia', '1', '0', '2018-07-30 08:41:27', '2018-07-30 08:41:42');

-- ----------------------------
-- Table structure for group_customers
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_customers
-- ----------------------------
INSERT INTO `group_customers` VALUES ('1', 'Group 111', '200000111', '1', '0', '2018-07-25 14:54:57', '2018-07-25 10:06:23');
INSERT INTO `group_customers` VALUES ('2', 'Vip', '1000', '1', '0', '2018-07-30 13:44:19', '2018-07-30 13:44:19');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------

-- ----------------------------
-- Table structure for partners
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partners
-- ----------------------------
INSERT INTO `partners` VALUES ('3', null, 'abc111', 'test', '11222333', 'phidangmtv@gmail.comp', '090 900 93 12', null, '1', '0', '2018-07-26 09:57:57', '2018-07-26 10:02:04');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'Cửa hàng', 'shop_manager', '1', '0', '2018-04-09 04:46:03', '2018-07-24 13:21:41');
INSERT INTO `permissions` VALUES ('2', 'Quản lý bán hàng', 'seller_manager', '1', '0', '2018-04-09 04:46:57', '2018-07-24 13:21:26');
INSERT INTO `permissions` VALUES ('3', 'Sản phẩm', 'product_manager', '1', '0', '2018-04-09 04:47:16', '2018-07-24 13:21:58');
INSERT INTO `permissions` VALUES ('4', 'Kho hàng', 'warehouse_manager', '1', '0', '2018-07-24 13:22:43', '2018-07-24 13:22:43');
INSERT INTO `permissions` VALUES ('5', 'Kế toán', 'accountant_manager', '1', '0', '2018-07-24 13:23:02', '2018-07-24 13:23:31');
INSERT INTO `permissions` VALUES ('6', 'Quản lý tài khoản', 'user_manager', '1', '0', '2018-07-24 13:24:37', '2018-07-24 13:24:37');
INSERT INTO `permissions` VALUES ('7', 'Thống kê', 'report_manager', '1', '0', '2018-07-24 13:25:00', '2018-07-24 13:25:00');
INSERT INTO `permissions` VALUES ('8', 'Cài đặt', 'setting_manager', '1', '0', '2018-07-24 13:25:09', '2018-07-24 13:25:09');
INSERT INTO `permissions` VALUES ('9', 'Quản lý khách hàng', 'customer_manager', '1', '0', '2018-07-25 14:24:05', '2018-07-25 14:24:05');
INSERT INTO `permissions` VALUES ('10', 'Cộng Tác Viên', 'partner_manager', '1', '0', '2018-07-26 14:06:12', '2018-07-26 14:06:12');
INSERT INTO `permissions` VALUES ('11', 'Nhà Cung Cấp', 'supplier_manager', '1', '0', '2018-07-30 13:58:29', '2018-07-30 13:58:29');

-- ----------------------------
-- Table structure for products
-- ----------------------------
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
  `meta_keyword` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_robot` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `brand_id` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', null, '1', 'a1', 'asd', 'aaaa', 'xanh,Chọn màu,test', 'size s', '23', '1000', '50', null, null, 'sdfsdf', '<p>sdfsdf</p>', '1', '1', '2018-07-30 05:47:40', '2018-08-02 02:23:47', null, null, null);
INSERT INTO `products` VALUES ('2', null, null, 'a1', null, 'aaaa1', null, null, '-1111', '12323', '0', null, '', 'sdfsdf', '<p><br></p>', '1', null, '2018-07-30 05:51:07', '2018-07-30 05:51:07', null, null, null);
INSERT INTO `products` VALUES ('3', null, '1', 'A3L01', 'A3L01000001', 'Áo 3 lỗ', 'xanh,test', 'size s', '50000', '100000', '34', null, 'public/products/51a3d6a058508247296a4d9f302a1866.jpg', 'Áo 3 lỗ', '<p>Áo 3 lỗ<br></p>', '1', '1', '2018-08-02 02:25:38', '2018-08-02 02:28:22', 'haha', 'hehe', 'hihi');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `product_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `product_id` (`product_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('1', '5', '2018-07-30 10:47:40', '2018-07-30 10:47:40');
INSERT INTO `product_category` VALUES ('1', '6', '2018-07-30 10:47:40', '2018-07-30 10:47:40');
INSERT INTO `product_category` VALUES ('3', '5', '2018-08-02 14:25:38', '2018-08-02 14:25:38');
INSERT INTO `product_category` VALUES ('3', '6', '2018-08-02 14:25:39', '2018-08-02 14:25:39');
INSERT INTO `product_category` VALUES ('3', '1', '2018-08-02 14:25:39', '2018-08-02 14:25:39');

-- ----------------------------
-- Table structure for product_detail
-- ----------------------------
DROP TABLE IF EXISTS `product_detail`;
CREATE TABLE `product_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_detail
-- ----------------------------
INSERT INTO `product_detail` VALUES ('10', '1', '1', '1', '32', '2018-08-02 02:23:47', '2018-08-02 02:23:47');
INSERT INTO `product_detail` VALUES ('11', '1', '0', '1', '10', '2018-08-02 02:23:47', '2018-08-02 02:23:47');
INSERT INTO `product_detail` VALUES ('12', '1', '2', '1', '8', '2018-08-02 02:23:47', '2018-08-02 02:23:47');
INSERT INTO `product_detail` VALUES ('13', '3', '1', '1', '11', '2018-08-02 02:25:39', '2018-08-02 02:25:39');
INSERT INTO `product_detail` VALUES ('14', '3', '2', '1', '23', '2018-08-02 02:25:39', '2018-08-02 02:25:39');

-- ----------------------------
-- Table structure for product_photos
-- ----------------------------
DROP TABLE IF EXISTS `product_photos`;
CREATE TABLE `product_photos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `origin` varchar(255) NOT NULL DEFAULT '',
  `large` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `color_code` varchar(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `order` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_photos
-- ----------------------------
INSERT INTO `product_photos` VALUES ('16', '1', 'course-default-img-min.jpg', 'public/product_photos/7ce00c772c131648493e8d5ebdf66010.jpg', '', '', '2', '1', '0', '2018-08-02 02:23:48', '2018-08-02 02:23:48');
INSERT INTO `product_photos` VALUES ('17', '1', '1', 'public/product_photos/a6e9e6d82412b0870f6dd2c858570252.png', '', '', '1', '1', '1', '2018-08-02 02:23:48', '2018-08-02 02:23:48');
INSERT INTO `product_photos` VALUES ('18', '3', '2', 'public/product_photos/b38be8d8e7dc6626353b7030e37c958c.jpg', '', '', null, '1', '0', '2018-08-02 02:25:39', '2018-08-02 02:25:39');
INSERT INTO `product_photos` VALUES ('19', '3', 'default-logo-ecep.png', 'public/product_photos/e78aa6ef2d973419d6deb110193c5b8b.png', '', '', '1', '1', '1', '2018-08-02 02:25:39', '2018-08-02 02:25:39');
INSERT INTO `product_photos` VALUES ('20', '3', 'logo-ecep.png', 'public/product_photos/087c7fc9fa0cc49ed5f91d5c786cca37.png', '', '', '2', '1', '2', '2018-08-02 02:25:39', '2018-08-02 02:25:39');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'Admin', 'admin', '1', '0', '2018-04-09 04:26:57', '2018-04-09 04:27:42');
INSERT INTO `roles` VALUES ('2', 'Customer', 'customer', '1', '1', '2018-04-09 04:26:58', '2018-04-09 04:27:16');
INSERT INTO `roles` VALUES ('3', 'Manager', 'manager', '1', '0', '2018-04-10 03:46:55', '2018-04-10 03:46:55');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
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

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '2018-07-24 13:59:18', '2018-07-24 13:59:18');
INSERT INTO `role_permission` VALUES ('1', '2', '2018-07-24 13:59:25', '2018-07-24 13:59:25');
INSERT INTO `role_permission` VALUES ('1', '3', '2018-07-24 13:59:28', '2018-07-24 13:59:28');
INSERT INTO `role_permission` VALUES ('1', '4', '2018-07-24 13:59:31', '2018-07-24 13:59:31');
INSERT INTO `role_permission` VALUES ('1', '5', '2018-07-24 13:59:34', '2018-07-24 13:59:34');
INSERT INTO `role_permission` VALUES ('1', '6', '2018-07-24 13:59:37', '2018-07-25 14:48:25');
INSERT INTO `role_permission` VALUES ('1', '7', '2018-07-24 13:59:41', '2018-07-24 13:59:41');
INSERT INTO `role_permission` VALUES ('1', '8', '2018-07-24 13:59:43', '2018-07-24 13:59:43');
INSERT INTO `role_permission` VALUES ('1', '9', '2018-07-25 14:48:28', '2018-07-25 14:48:28');
INSERT INTO `role_permission` VALUES ('1', '10', '2018-07-26 14:06:24', '2018-07-26 14:06:24');
INSERT INTO `role_permission` VALUES ('1', '11', '2018-07-30 14:13:34', '2018-07-30 14:13:34');

-- ----------------------------
-- Table structure for sizes
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sizes
-- ----------------------------
INSERT INTO `sizes` VALUES ('1', 's', 'size s', '1', '0', '2018-07-30 10:47:30', '2018-07-30 10:47:30');

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suppliers
-- ----------------------------
INSERT INTO `suppliers` VALUES ('1', null, 'sn001', '012345', 'Sony', 'Diep Phi Dang', 'phidangmtv@gmail.com', '090 900 93 12', '5 lu gia', '1', '0', '2018-07-30 09:17:55', '2018-07-30 09:18:04');
INSERT INTO `suppliers` VALUES ('2', null, 'sn0011', '0123451', 'Sony1', 'DIep Phi Dang', 'phidangmtv@gmail.com', '090 900 93 12', null, '1', '0', '2018-07-30 09:22:46', '2018-07-30 09:22:46');

-- ----------------------------
-- Table structure for sys_failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `sys_failed_jobs`;
CREATE TABLE `sys_failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_failed_jobs
-- ----------------------------
INSERT INTO `sys_failed_jobs` VALUES ('18', 'database', 'default', '{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:77;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', 'ErrorException: simplexml_load_file(https://dhd-films-test.s3.amazonaws.com/panoramas/2/dl58rtLEcKdVgOkeH5Gy8yUlu4NDiWSsE3KVHzwP.xml): failed to open stream: HTTP request failed! HTTP/1.1 403 Forbidden\r\n in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:70\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 70, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(70): simplexml_load_file(\'https://dhd-fil...\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(99): App\\Services\\XMLPano->addScene(\'https://dhd-fil...\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}', '2018-04-23 04:25:05');
INSERT INTO `sys_failed_jobs` VALUES ('19', 'database', 'default', '{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:78;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', 'ErrorException: simplexml_load_file(https://dhd-films-test.s3.amazonaws.com/panoramas/11/WeAiqxhlRjqMe3P3FkEWuiGGoGr5uJ9MPZpBvF2J.xml): failed to open stream: HTTP request failed! HTTP/1.1 403 Forbidden\r\n in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:70\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 70, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(70): simplexml_load_file(\'https://dhd-fil...\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(99): App\\Services\\XMLPano->addScene(\'https://dhd-fil...\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}', '2018-04-23 20:55:16');
INSERT INTO `sys_failed_jobs` VALUES ('20', 'database', 'default', '{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:79;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', 'ErrorException: simplexml_load_file(https://dhd-films-test.s3.amazonaws.com/panoramas/11/WeAiqxhlRjqMe3P3FkEWuiGGoGr5uJ9MPZpBvF2J.xml): failed to open stream: HTTP request failed! HTTP/1.1 403 Forbidden\r\n in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:70\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 70, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(70): simplexml_load_file(\'https://dhd-fil...\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(99): App\\Services\\XMLPano->addScene(\'https://dhd-fil...\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}', '2018-04-24 02:03:34');
INSERT INTO `sys_failed_jobs` VALUES ('21', 'database', 'default', '{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:80;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', 'ErrorException: simplexml_load_file(https://dhd-films-test.s3.amazonaws.com/panoramas/11/WeAiqxhlRjqMe3P3FkEWuiGGoGr5uJ9MPZpBvF2J.xml): failed to open stream: HTTP request failed! HTTP/1.1 403 Forbidden\r\n in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:70\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 70, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(70): simplexml_load_file(\'https://dhd-fil...\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(99): App\\Services\\XMLPano->addScene(\'https://dhd-fil...\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}', '2018-04-24 02:58:30');
INSERT INTO `sys_failed_jobs` VALUES ('22', 'database', 'default', '{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:81;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', 'Illuminate\\Queue\\MaxAttemptsExceededException: A queued job has been attempted too many times. The job may have previously timed out. in /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php:385\nStack trace:\n#0 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(311): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), 1)\n#1 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#2 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#3 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#5 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#11 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#13 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#14 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#15 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 {main}', '2018-04-24 03:50:49');
INSERT INTO `sys_failed_jobs` VALUES ('23', 'database', 'default', '{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:82;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', 'ErrorException: simplexml_load_file(https://dhd-films-test.s3.amazonaws.com/panoramas/2/dl58rtLEcKdVgOkeH5Gy8yUlu4NDiWSsE3KVHzwP.xml): failed to open stream: HTTP request failed! HTTP/1.1 403 Forbidden\r\n in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:70\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 70, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(70): simplexml_load_file(\'https://dhd-fil...\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(95): App\\Services\\XMLPano->addScene(\'https://dhd-fil...\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}', '2018-05-03 04:04:52');
INSERT INTO `sys_failed_jobs` VALUES ('24', 'database', 'default', '{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:83;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', 'ErrorException: simplexml_load_file(https://dhd-films-test.s3.amazonaws.com/panoramas/2/dl58rtLEcKdVgOkeH5Gy8yUlu4NDiWSsE3KVHzwP.xml): failed to open stream: HTTP request failed! HTTP/1.1 403 Forbidden\r\n in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:70\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 70, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(70): simplexml_load_file(\'https://dhd-fil...\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(95): App\\Services\\XMLPano->addScene(\'https://dhd-fil...\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}', '2018-05-03 05:54:09');
INSERT INTO `sys_failed_jobs` VALUES ('25', 'database', 'default', '{\"displayName\":\"App\\\\Jobs\\\\MakePano\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\MakePano\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\MakePano\\\":9:{s:8:\\\"\\u0000*\\u0000scene\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Scene\\\";s:2:\\\"id\\\";i:87;}s:6:\\\"\\u0000*\\u0000log\\\";O:35:\\\"App\\\\Repositories\\\\SceneLogRepository\\\":0:{}s:11:\\\"\\u0000*\\u0000panorama\\\";O:35:\\\"App\\\\Repositories\\\\PanoramaRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000xml\\\";O:20:\\\"App\\\\Services\\\\XMLPano\\\":0:{}s:9:\\\"\\u0000*\\u0000server\\\";O:33:\\\"App\\\\Repositories\\\\ServerRepository\\\":0:{}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', 'ErrorException: simplexml_load_file(): I/O warning : failed to load external entity \"\" in /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php:117\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'simplexml_load_...\', \'/var/www/client...\', 117, Array)\n#1 /var/www/client/dhd-gigapixel-dev/app/Services/XMLPano.php(117): simplexml_load_file(\'\')\n#2 /var/www/client/dhd-gigapixel-dev/app/Jobs/MakePano.php(97): App\\Services\\XMLPano->updateSceneAttribute(\'\', Array)\n#3 [internal function]: App\\Jobs\\MakePano->handle(Object(App\\Repositories\\SceneRepository))\n#4 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#5 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#6 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(94): Illuminate\\Container\\Container->call(Array)\n#9 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(114): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\MakePano))\n#10 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\MakePano))\n#11 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(42): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\MakePano), false)\n#13 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(69): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#14 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(317): Illuminate\\Queue\\Jobs\\Job->fire()\n#15 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(267): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#16 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(113): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#17 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#18 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(85): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#19 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->fire()\n#20 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(29): call_user_func_array(Array, Array)\n#21 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(87): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#22 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(31): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Container/Container.php(539): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Illuminate\\Container\\Container->call(Array)\n#25 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Command/Command.php(252): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#26 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Console/Command.php(167): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#27 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(946): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#28 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(248): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#29 /var/www/client/dhd-gigapixel-dev/vendor/symfony/console/Application.php(148): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 /var/www/client/dhd-gigapixel-dev/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(122): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 /var/www/client/dhd-gigapixel-dev/artisan(35): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 {main}', '2018-05-24 03:32:59');

-- ----------------------------
-- Table structure for sys_jobs
-- ----------------------------
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

-- ----------------------------
-- Records of sys_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'hieu', 'hieu@coolglow.com', '$2y$10$FF/Gp/LiUXEfzrdpWeNObOHL8yY.Mi2BPV4wD1tCzdDQAMMJRdfDK', 'public/users/62d9b96b66228da6e45abc1664bc741e.png', 'LjFDdeJvkZoAiqgIu0ANCN8gPxNxx9jViO8z4u3eQbCQVrHHkQqtEqgur7A6', 'Dang', 'Diep', 'Dang111', '1', null, '2018-04-10 03:46:21', '2018-07-25 09:59:06');
INSERT INTO `users` VALUES ('10', '1', '', 'phidangmtv@gmail.com', '$2y$10$zsn9yzd87SNmUeXoBDdSiO97InBGMeuUFYJMEIHtWkIyxUNOBOZkK', null, 'r62Fcf6VdvyFE4gZHc9Bps8e8EwL0SOyq7syXUwl54L6xQx2g8PzVeuVW3wX', 'aa', 'bb', 'aa bb', '1', null, '2018-04-11 06:12:44', '2018-07-26 12:28:21');
