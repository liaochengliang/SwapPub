/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : swap_pub

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-05-26 13:19:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'lcl', '123', null);

-- ----------------------------
-- Table structure for `appoint`
-- ----------------------------
DROP TABLE IF EXISTS `appoint`;
CREATE TABLE `appoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id_1` int(11) DEFAULT NULL,
  `user_id_2` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `good_id_2` int(11) DEFAULT NULL,
  `appoint_date` datetime DEFAULT NULL COMMENT '成交日期',
  `good_id_1` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appoint
-- ----------------------------
INSERT INTO `appoint` VALUES ('64', '11', '13', null, '1', '19', null, '1');
INSERT INTO `appoint` VALUES ('71', '11', '12', null, '0', '15', null, '1');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belong_user` varchar(255) DEFAULT NULL COMMENT '所属用户',
  `goodName` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `hs_consumption` int(11) DEFAULT NULL,
  `g_img` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `s_category` int(11) DEFAULT NULL,
  `g_category` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '11', '笔记本', '4000', 'img/goods_img/1.jpg', '二手笔记本，8成新，I7处理器', '1', '4', '2015-12-12 12:10:10');
INSERT INTO `goods` VALUES ('2', '11', '被套', '30', 'img/goods_img/2.jpg', '二手被套', '1', '2', '2015-12-16 02:34:01');
INSERT INTO `goods` VALUES ('3', '11', '自行车', '50', 'img/goods_img/3.jpg', '二手自行车', '1', '2', '2019-04-11 11:22:33');
INSERT INTO `goods` VALUES ('4', '11', '网球拍', '50', 'img/goods_img/4.jpg', '二手网球拍，用过几天，九成新', '1', '5', '2019-04-16 12:00:16');
INSERT INTO `goods` VALUES ('5', '11', '篮球', '80', 'img/goods_img/5.jpg', '全牛皮篮球，', '1', '5', '2019-04-17 11:02:57');
INSERT INTO `goods` VALUES ('6', '11', '懒人桌', '15', 'img/goods_img/6.jpg', '加固型懒人桌，九成新', '1', '2', '2019-04-17 11:05:00');
INSERT INTO `goods` VALUES ('7', '11', '考研书', '30', 'img/goods_img/7.jpg', '聚星文登考研', '1', '1', '2019-04-01 11:07:22');
INSERT INTO `goods` VALUES ('8', '11', '公务员书', '30', 'img/goods_img/8.jpg', '公务员考试书籍，9成新', '1', '1', '2019-03-30 16:02:21');
INSERT INTO `goods` VALUES ('9', '11', '凉席', '60', 'img/goods_img/9.jpg', '寝室牛皮凉席', '1', '2', '2019-04-11 16:20:46');
INSERT INTO `goods` VALUES ('10', '11', '纯棉枕头', '50', 'img/goods_img/10.jpg', '纯棉枕头', '1', '2', '2019-04-12 16:21:37');
INSERT INTO `goods` VALUES ('11', '11', 'LED台灯，学习卧室床头书桌插电节能USB调光夹子台灯', '100', 'img/goods_img/11.jpg', '灯光颜色默认自然光，轻微偏黄的灯光颜色，台灯默认USB接口，台灯供电方式：1，可用一切手机充电器直接插220V家用插座。 2，可接电脑USB。 3，可接手机不带蓄电池，必须连着电源使用）', '1', '2', '2019-04-09 16:29:32');
INSERT INTO `goods` VALUES ('12', '11', '《c primer plus(第五版)中文版》C语言经典入门书籍', '23', 'img/goods_img/12.jpg', '只翻过几次，几乎全新。', '1', '1', '2019-04-10 01:02:27');
INSERT INTO `goods` VALUES ('13', '11', '诺基亚830手机', '1200', 'img/goods_img/13.jpg', '购买时间在一年内，无保修，屏幕无划痕或坏点，机身有破裂损伤，完全正常，曾无拆无修，待机时长超过2天。相关配件有原装电池。', '1', '4', '2019-04-08 01:08:58');
INSERT INTO `goods` VALUES ('14', '12', '室内物品收纳架，多功能免钉可伸缩衣柜分层隔板', '11', 'img/goods_img/14.jpg', '多功能免钉无痕衣柜分层架，', '1', '2', '2019-03-29 09:26:42');
INSERT INTO `goods` VALUES ('15', '12', '沃曼威斯韩版夜光双肩包大容量个性背包', '50', 'img/goods_img/15.jpg', '书包，8成新', '1', '3', '2019-03-31 09:36:38');
INSERT INTO `goods` VALUES ('16', '12', '华为荣耀4x手机', '450', 'img/goods_img/16.jpg', '移动4g标配版在保九新，京东抢购的，配件发票箱盒齐全，已经贴好钢化膜，送一软壳，便框有些许磕碰，不明显，屏幕右上方有出厂黄斑，4x通病，买回来就这样，无拆无修，特价处理。不议价，顺丰到付。', '1', '4', '2019-04-08 15:30:13');
INSERT INTO `goods` VALUES ('17', '13', '畅学STM32开发学习板，配套stm32f103c8t6最小系统核心板', '67', 'img/goods_img/17.jpg', '畅学STM32开发学习板，所有模块均可用', '1', '4', '2019-04-05 15:34:45');
INSERT INTO `goods` VALUES ('18', '13', '地球往事系列小说 ，三体1+三体2黑暗森林+三体3死神永生', '72', 'img/goods_img/18.jpg', '重庆出版集团出版\r\n全部是正版\r\nISBN编号: 9787536693968', '1', '1', '2019-04-02 15:43:54');
INSERT INTO `goods` VALUES ('19', '13', '《1984》(精装珍藏本) 奥威尔著  世界名著小说', '23', 'img/goods_img/19.jpg', '全部是正版ISBN编号: 9787536693968全新中国画报出版社出版', '1', '1', '2019-04-08 15:57:39');
INSERT INTO `goods` VALUES ('26', '11', 'test', '78', 'img/goods_img/test3.jpg', 'ccsdcdsc', '4', '4', '2019-04-21 21:03:19');
INSERT INTO `goods` VALUES ('27', '11', 'xscs', '78', 'img/goods_img/test3.jpg', 'ccsdcdsc', '1', '4', '2019-04-22 20:05:37');
INSERT INTO `goods` VALUES ('28', '11', 'xscs', '12', 'img/goods_img/test3.jpg', 'ccsdcdsc', '3', '3', '2019-04-23 13:21:28');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mess_id` int(11) NOT NULL AUTO_INCREMENT,
  `mess_from_id` int(11) DEFAULT NULL,
  `mess_to_id` int(11) DEFAULT NULL,
  `mess_text` varchar(255) DEFAULT NULL,
  `mess_time` datetime DEFAULT NULL,
  PRIMARY KEY (`mess_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '11', '10', 'fdgdf', '2019-05-18 17:18:54');
INSERT INTO `message` VALUES ('2', '11', '3', 'dsffdsf', '2019-05-18 17:19:14');
INSERT INTO `message` VALUES ('3', '11', '4', 'dade', '2019-05-18 17:25:44');
INSERT INTO `message` VALUES ('4', '11', '12', 'frfr', '2019-05-18 17:27:11');
INSERT INTO `message` VALUES ('5', '11', '11', 'dsfs', '2019-05-18 17:28:33');
INSERT INTO `message` VALUES ('6', '11', '12', 'fdsfs', '2019-05-18 17:30:04');
INSERT INTO `message` VALUES ('7', '11', '5', 'cdsc', '2019-05-18 17:45:50');
INSERT INTO `message` VALUES ('8', '11', '1', 'desd', '2019-05-18 17:57:15');
INSERT INTO `message` VALUES ('9', '11', '8', 'ds', '2019-05-18 17:58:06');
INSERT INTO `message` VALUES ('10', '11', '2', 'fesf', '2019-05-18 18:03:43');
INSERT INTO `message` VALUES ('11', '11', '4', 'fsfsd', '2019-05-18 18:04:48');
INSERT INTO `message` VALUES ('12', '11', '4', 'fdsfd', '2019-05-18 18:07:49');
INSERT INTO `message` VALUES ('13', '11', '4', 'rfewrw', '2019-05-18 18:08:03');
INSERT INTO `message` VALUES ('14', '11', '4', 'rfewrw', '2019-05-18 18:08:10');
INSERT INTO `message` VALUES ('15', '11', '3', 'dewf', '2019-05-18 18:09:11');
INSERT INTO `message` VALUES ('16', '11', '8', 'e3e', '2019-05-18 18:10:04');
INSERT INTO `message` VALUES ('17', '11', '4', 'cdsfcds', '2019-05-18 18:11:47');
INSERT INTO `message` VALUES ('18', '11', '4', 'cdsfcds', '2019-05-18 18:12:41');
INSERT INTO `message` VALUES ('19', '11', '4', 'dsd', '2019-05-18 18:12:53');
INSERT INTO `message` VALUES ('20', '11', '4', 'dfesd', '2019-05-18 18:15:07');
INSERT INTO `message` VALUES ('21', '11', '4', 'dsd', '2019-05-18 18:27:08');
INSERT INTO `message` VALUES ('22', '11', '7', 'dsad', '2019-05-18 18:27:36');
INSERT INTO `message` VALUES ('23', '11', '7', '你好', '2019-05-18 18:27:48');
INSERT INTO `message` VALUES ('24', '11', '11', '你好', '2019-05-18 19:12:16');
INSERT INTO `message` VALUES ('25', '11', '6', '我想要这个商品', '2019-05-18 19:12:48');
INSERT INTO `message` VALUES ('26', '11', '6', '我想要这个\r\n', '2019-05-18 19:13:20');
INSERT INTO `message` VALUES ('27', '11', '15', '你好，我想与你交换这个商品', '2019-05-24 21:57:06');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `honorScore` int(11) DEFAULT '100' COMMENT '信誉积分',
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('11', 'lcl', '123', '男', '18279154734', '2789094390@qq.com', '1250', 'iiiii');
INSERT INTO `user` VALUES ('12', 'zzy', '123', '男', '18279154734', '2789094390@qq.com', '100', 'img');
INSERT INTO `user` VALUES ('13', 'yhj', '123', '男', '18279154734', '2789094390@qq.com', '150', 'img');
INSERT INTO `user` VALUES ('14', 'vfd', '123', '男', '18279154734', '2789094390@qq.com', '100', 'im');
INSERT INTO `user` VALUES ('15', '廖承亮', '123', '男', '18279154734', '2789094390@qq.com', '100', 'imgggfh');
INSERT INTO `user` VALUES ('16', 'qx', '123', '男', '18279154734', '2789094390@qq.com', '100', 'imgggfh');
