/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 8.0.27 : Database - my_blog_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`my_blog_db` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `my_blog_db`;

/*Table structure for table `generator_test` */

DROP TABLE IF EXISTS `generator_test`;

CREATE TABLE `generator_test` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `test` varchar(100) NOT NULL COMMENT '测试字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `generator_test` */

/*Table structure for table `jdbc_test` */

DROP TABLE IF EXISTS `jdbc_test`;

CREATE TABLE `jdbc_test` (
  `type` varchar(100) DEFAULT NULL COMMENT '类型',
  `name` varchar(100) DEFAULT NULL COMMENT '名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `jdbc_test` */

insert  into `jdbc_test`(`type`,`name`) values ('com.zaxxer.hikari.HikariDataSource','hikari数据源'),('org.apache.commons.dbcp2.BasicDataSource','dbcp2数据源'),('test','测试类'),('类别2','测试类2');

/*Table structure for table `tb_admin_user` */

DROP TABLE IF EXISTS `tb_admin_user`;

CREATE TABLE `tb_admin_user` (
  `admin_user_id` int NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) NOT NULL COMMENT '管理员登陆名称',
  `login_password` varchar(50) NOT NULL COMMENT '管理员登陆密码',
  `nick_name` varchar(50) NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint DEFAULT '0' COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_admin_user` */

insert  into `tb_admin_user`(`admin_user_id`,`login_user_name`,`login_password`,`nick_name`,`locked`) values (1,'admin','0192023a7bbd73250516f069df18b500','薛定谔的喵',0);

/*Table structure for table `tb_blog` */

DROP TABLE IF EXISTS `tb_blog`;

CREATE TABLE `tb_blog` (
  `blog_id` bigint NOT NULL AUTO_INCREMENT COMMENT '博客表主键id',
  `blog_title` varchar(200) NOT NULL COMMENT '博客标题',
  `blog_sub_url` varchar(200) NOT NULL COMMENT '博客自定义路径url',
  `blog_cover_image` varchar(200) NOT NULL COMMENT '博客封面图',
  `blog_content` mediumtext NOT NULL COMMENT '博客内容',
  `blog_category_id` int NOT NULL COMMENT '博客分类id',
  `blog_category_name` varchar(50) NOT NULL COMMENT '博客分类(冗余字段)',
  `blog_tags` varchar(200) NOT NULL COMMENT '博客标签',
  `blog_status` tinyint NOT NULL DEFAULT '0' COMMENT '0-草稿 1-发布',
  `blog_views` bigint NOT NULL DEFAULT '0' COMMENT '阅读量',
  `enable_comment` tinyint NOT NULL DEFAULT '0' COMMENT '0-允许评论 1-不允许评论',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_blog` */

insert  into `tb_blog`(`blog_id`,`blog_title`,`blog_sub_url`,`blog_cover_image`,`blog_content`,`blog_category_id`,`blog_category_name`,`blog_tags`,`blog_status`,`blog_views`,`enable_comment`,`is_deleted`,`create_time`,`update_time`) values (6,'远程交互式康复外骨骼设备操作说明','','http://localhost:8080/admin/dist/img/rand/10.jpg','####设备介绍\n远程交互式康复外骨骼设备是一款用于帮助上肢运动机能衰退患者康复的设备，包含主动控制模式和被动控制两种模式......\n\n####操作说明\n康复前期，上肢机能微弱，无法自主运动，使用被动控制模式；\n康复后期，上肢机能增强，可以自主运动，使用主动控制模式。\n',26,'操作说明','操作说明',1,2,0,0,'2022-01-12 20:05:20','2022-01-12 20:05:20'),(7,'主动控制模式使用说明','','http://localhost:8080/admin/dist/img/rand/11.jpg','具体实现为阻抗控制，使用肌电信号采集设备采集上肢肌电信号，通过算法处理输出控制信号，包括速度位置力矩大小等......',27,'主动控制模式','操作说明,主动控制',1,2,0,0,'2022-01-12 20:09:01','2022-01-12 20:09:01'),(8,'被动控制模式使用说明','','http://localhost:8080/admin/dist/img/rand/20.jpg','被动控制模式具体实现为传统的PID控制，设备根据提前设定的电流速度位置值运转，带动患者上肢运动......',28,'被动控制模式','被动控制,操作说明',1,3,0,0,'2022-01-12 20:11:34','2022-01-12 20:11:34'),(9,'测试系统功能','','http://localhost:8080/admin/dist/img/rand/2.jpg','测试一下abaabaaba......',29,'康复知识','测试',1,9,0,0,'2022-01-12 20:14:43','2022-01-12 20:14:43');

/*Table structure for table `tb_blog_category` */

DROP TABLE IF EXISTS `tb_blog_category`;

CREATE TABLE `tb_blog_category` (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '分类表主键',
  `category_name` varchar(50) NOT NULL COMMENT '分类的名称',
  `category_icon` varchar(50) NOT NULL COMMENT '分类的图标',
  `category_rank` int NOT NULL DEFAULT '1' COMMENT '分类的排序值 被使用的越多数值越大',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_blog_category` */

insert  into `tb_blog_category`(`category_id`,`category_name`,`category_icon`,`category_rank`,`is_deleted`,`create_time`) values (26,'操作说明','/admin/dist/img/category/03.png',9,0,'2022-01-12 19:58:46'),(27,'主动控制模式','/admin/dist/img/category/08.png',4,0,'2022-01-12 19:59:07'),(28,'被动控制模式','/admin/dist/img/category/14.png',2,0,'2022-01-12 19:59:20'),(29,'康复知识','/admin/dist/img/category/12.png',4,0,'2022-01-12 20:00:01');

/*Table structure for table `tb_blog_comment` */

DROP TABLE IF EXISTS `tb_blog_comment`;

CREATE TABLE `tb_blog_comment` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `blog_id` bigint NOT NULL DEFAULT '0' COMMENT '关联的blog主键',
  `commentator` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者名称',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '评论人的邮箱',
  `website_url` varchar(50) NOT NULL DEFAULT '' COMMENT '网址',
  `comment_body` varchar(200) NOT NULL DEFAULT '' COMMENT '评论内容',
  `comment_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论提交时间',
  `commentator_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '评论时的ip地址',
  `reply_body` varchar(200) NOT NULL DEFAULT '' COMMENT '回复内容',
  `reply_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
  `comment_status` tinyint NOT NULL DEFAULT '0' COMMENT '是否审核通过 0-未审核 1-审核通过',
  `is_deleted` tinyint DEFAULT '0' COMMENT '是否删除 0-未删除 1-已删除',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_blog_comment` */

insert  into `tb_blog_comment`(`comment_id`,`blog_id`,`commentator`,`email`,`website_url`,`comment_body`,`comment_create_time`,`commentator_ip`,`reply_body`,`reply_create_time`,`comment_status`,`is_deleted`) values (27,9,'test_user','468685628@qq.com','','测试一下评论功能','2022-01-12 20:15:48','','','2022-01-12 20:15:48',1,0);

/*Table structure for table `tb_blog_tag` */

DROP TABLE IF EXISTS `tb_blog_tag`;

CREATE TABLE `tb_blog_tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT COMMENT '标签表主键id',
  `tag_name` varchar(100) NOT NULL COMMENT '标签名称',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_blog_tag` */

insert  into `tb_blog_tag`(`tag_id`,`tag_name`,`is_deleted`,`create_time`) values (136,'操作说明',0,'2022-01-12 20:05:20'),(137,'主动控制模式',0,'2022-01-12 20:09:01'),(138,'被动控制',0,'2022-01-12 20:11:34'),(139,'主动控制',0,'2022-01-12 20:12:18'),(140,'测试',0,'2022-01-12 20:14:43'),(141,'介绍',0,'2022-01-12 21:55:46');

/*Table structure for table `tb_blog_tag_relation` */

DROP TABLE IF EXISTS `tb_blog_tag_relation`;

CREATE TABLE `tb_blog_tag_relation` (
  `relation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '关系表id',
  `blog_id` bigint NOT NULL COMMENT '博客id',
  `tag_id` int NOT NULL COMMENT '标签id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_blog_tag_relation` */

insert  into `tb_blog_tag_relation`(`relation_id`,`blog_id`,`tag_id`,`create_time`) values (284,6,136,'2022-01-12 20:05:20'),(287,8,136,'2022-01-12 20:11:34'),(288,8,138,'2022-01-12 20:11:34'),(291,7,136,'2022-01-12 20:12:18'),(292,7,139,'2022-01-12 20:12:18'),(298,9,140,'2022-01-12 22:12:39'),(302,10,141,'2022-01-12 22:18:24');

/*Table structure for table `tb_config` */

DROP TABLE IF EXISTS `tb_config`;

CREATE TABLE `tb_config` (
  `config_name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置项的名称',
  `config_value` varchar(200) NOT NULL DEFAULT '' COMMENT '配置项的值',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_config` */

insert  into `tb_config`(`config_name`,`config_value`,`create_time`,`update_time`) values ('footerAbout','RIREE. Wish a speedy recovery.','2018-11-11 20:33:23','2022-01-13 06:46:24'),('footerCopyRight','2022 薛定谔的喵','2018-11-11 20:33:31','2022-01-13 06:46:24'),('footerICP','NEU&Faculty of Robotics Science and Engineering','2018-11-11 20:33:27','2022-01-13 06:46:24'),('footerPoweredBy','https://github.com/CONTINUE12','2018-11-11 20:33:36','2022-01-13 06:46:24'),('footerPoweredByURL','https://github.com/CONTINUE12','2018-11-11 20:33:39','2022-01-13 06:46:24'),('websiteDescription','RIREE（Remote interactive rehabilitation exoskeleton equipment）是一款远程交互式的康复外骨骼设备','2018-11-11 20:33:04','2022-01-12 11:47:00'),('websiteIcon','/admin/dist/img/favicon.png','2018-11-11 20:33:11','2022-01-12 11:47:00'),('websiteLogo','/admin/dist/img/logo_riree.png','2018-11-11 20:33:08','2022-01-12 11:47:00'),('websiteName','RIREE','2018-11-11 20:33:01','2022-01-12 11:47:00'),('yourAvatar','/admin/dist/img/13.png','2018-11-11 20:33:14','2022-01-12 03:20:23'),('yourEmail','468685628@qq.com','2018-11-11 20:33:17','2022-01-12 03:20:23'),('yourName','薛定谔的喵','2018-11-11 20:33:20','2022-01-12 03:20:23');

/*Table structure for table `tb_link` */

DROP TABLE IF EXISTS `tb_link`;

CREATE TABLE `tb_link` (
  `link_id` int NOT NULL AUTO_INCREMENT COMMENT '友链表主键id',
  `link_type` tinyint NOT NULL DEFAULT '0' COMMENT '友链类别 0-友链 1-推荐 2-个人网站',
  `link_name` varchar(50) NOT NULL COMMENT '网站名称',
  `link_url` varchar(100) NOT NULL COMMENT '网站链接',
  `link_description` varchar(100) NOT NULL COMMENT '网站描述',
  `link_rank` int NOT NULL DEFAULT '0' COMMENT '用于列表排序',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0-未删除 1-已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_link` */

insert  into `tb_link`(`link_id`,`link_type`,`link_name`,`link_url`,`link_description`,`link_rank`,`is_deleted`,`create_time`) values (20,1,'知乎','https://zhuanlan.zhihu.com/p/115288318','HAL康复外骨骼机器人技术解析',0,0,'2022-01-12 20:18:37'),(21,1,'搜狐','https://www.sohu.com/a/336642381_100204623','目前最具代表性的外骨骼康复机器人种类介绍 ',0,0,'2022-01-12 20:19:39'),(22,1,'健康百科','https://baike.120ask.com/art/217875','偏瘫后上肢如何进行康复训练',0,0,'2022-01-12 20:20:29'),(23,1,'腾讯网','https://new.qq.com/omn/20190820/20190820A09PCT00.html','康复基础知识汇编---运动疗法',0,0,'2022-01-12 20:20:59');

/*Table structure for table `tb_test` */

DROP TABLE IF EXISTS `tb_test`;

CREATE TABLE `tb_test` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `test_info` varchar(50) NOT NULL COMMENT '测试内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_test` */

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `login_user_name` varchar(50) NOT NULL COMMENT '用户登陆名称',
  `login_password` varchar(50) NOT NULL COMMENT '用户登陆密码',
  `nick_name` varchar(50) NOT NULL COMMENT '用户显示昵称',
  `locked` tinyint DEFAULT '0' COMMENT '是否锁定 0正常 1锁定',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`login_user_name`,`login_password`,`nick_name`,`locked`,`create_time`) values (1,'user1','user1123','dididi',0,'2022-01-12 17:40:25'),(8,'user2','user2123','haha',0,'2022-01-13 20:27:50');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
