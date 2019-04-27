/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2019-04-27 14:17:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `album`
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题',
  `picture` varchar(255) DEFAULT '' COMMENT 'Picture',
  `keywords` varchar(2550) DEFAULT '' COMMENT '关键词',
  `summary` varchar(255) DEFAULT '',
  `created` int(10) DEFAULT '0' COMMENT '发布时间',
  `viewnum` int(10) DEFAULT '0' COMMENT '阅读次数',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态: 0草稿，1已发布',
  PRIMARY KEY (`id`),
  KEY `INDEX_TCVS` (`title`,`created`,`viewnum`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='相册';

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES ('1', '1-1', '/static/uploadfile/2019-4/27/d5e0dee0de09c76e97fda485a462aea0.jpg', '', '', '1556345445', '1', '1');

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题',
  `uri` varchar(255) DEFAULT '' COMMENT 'URL',
  `keywords` varchar(2550) DEFAULT '' COMMENT '关键词',
  `summary` varchar(255) DEFAULT '',
  `content` longtext NOT NULL COMMENT '正文',
  `author` varchar(20) DEFAULT '' COMMENT '作者',
  `created` int(10) DEFAULT '0' COMMENT '发布时间',
  `viewnum` int(10) DEFAULT '0' COMMENT '阅读次数',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态: 0草稿，1已发布',
  PRIMARY KEY (`id`),
  KEY `INDEX_TCVS` (`title`,`created`,`viewnum`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='文章';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '所谓情商高，就是这样说话hello', 'http://www.nahehuo.com', '努力工作，勤奋，情绪管理', '毕业后，很多学习不如你的人，都慢慢赶超成为了存款6、7位数的winner？你却还是刚毕业时的状态，月光族一个，个人资产连5位数的存款都没有？', '<img src=\"/static/uploadfile/2016-6/7/0ef780a2f3bc341c2f84134bf64f9b1f.jpeg\" alt=\"\" />\n<p>\n	长江后浪推前浪，一浪更比一浪强。竞争社会，拼的就是谁更有能力，谁更能在社会中立得一席之地。\n</p>\n<p>\n	物竞天择适者生存，你不争不抢不去努力，结果只能是在原地打转，于是乎只能高高仰望别人的光芒。我们都听过这么一段话，这个世界上最可怕的不是有人比你优秀，而是比你优秀的人依然还在努力，那么这样的你为什么还不去奋斗。从来不怕大器晚成，怕的是一生平庸。\n</p>\n他孩子打我孩子1下，傲慢的开口说不就一巴掌赔你一万块，我有足够资格拿出五万甚至十万让孩子打回去。<br />\n之前在网上流传起来的这句话，乍听之下会觉得好笑，可是在这句话之下隐藏着的是什么本质呢？试想一下，如果你有钱，那么当别人这么侮辱你侮辱你的孩子时，你完全有资格有资本可以拿出更多的钱来还回去，这并不是教育小孩子暴力和虚荣，而是不愿意让自己的孩子或者自己承受如此大的委屈和伤害。不然假设一下你没钱的情境呢，当别人这么说之后，你顶多会发怒的吼回去“有钱了不起啊，”然后在背地里孩子看不见的地方偷偷哭泣，当然你也可以选择让孩子打回去，可是那时候的你要承担接下来的什么索赔，你又没钱又没势拿什么和人家斗。<br />\n<p>\n	你努力创造更好的生活之后，你孩子出生的环境也是良好的，他可以接受好的教育，见识更多的精彩，可以不会因为没钱而忍受饥饿和寒冷，早早的见识了社会的黑暗，他能有更多的机会做他想做的事情，而你也有能力满足他一切合理要求。事实证明，家庭优越的孩子比家庭贫苦的孩子要更加自信，成长的也更健康。当然，如果你教育有问题或者太过溺爱造成他嚣张跋扈那就另说了。\n</p>\n<p>\n	<img src=\"/static/uploadfile/2016-6/7/7ce38ffb5cf3872cdb6813679298c9da.jpg\" alt=\"\" style=\"white-space:normal;\" />\n</p>', 'lock', '1556345765', '0', '1');
INSERT INTO `article` VALUES ('42', 'hello', '', '', '', '<p>\n	hello word\n</p>\n<p>\n<pre class=\"prettyprint lang-cpp\">#include &lt;stdio.h&gt;\n\nvoid main(){\n  printf(\"hello word\");\n}</pre>\n<pre class=\"prettyprint lang-cpp\">\n</pre>\n</p>', '', '1556345765', '1', '0');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `article_id` int(10) DEFAULT NULL,
  `nickname` varchar(15) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` text,
  `created` int(10) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1' COMMENT '0屏蔽，1正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `user_profile_id` int(10) DEFAULT NULL,
  `created` int(10) DEFAULT NULL COMMENT '注册时间',
  `changed` int(10) DEFAULT NULL COMMENT '编辑时间',
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '状态: 0屏蔽，1正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '13412345678', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '1');

-- ----------------------------
-- Table structure for `user_profile`
-- ----------------------------
DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `realname` varchar(15) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '1' COMMENT '1boy,0girl',
  `birth` varchar(20) NOT NULL DEFAULT '' COMMENT '生日',
  `email` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `hobby` varchar(255) NOT NULL DEFAULT '' COMMENT '爱好',
  `intro` text COMMENT '介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户详情';

-- ----------------------------
-- Records of user_profile
-- ----------------------------
INSERT INTO `user_profile` VALUES ('1', '李白', '1', '1995-5-1', 'blog@gmail.com', '1234567', '中国 武汉', '看没有看过的电影', '加油，给自己');
