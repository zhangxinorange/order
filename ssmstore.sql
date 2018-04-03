/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.18-log : Database - ssmstore
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssmstore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssmstore`;

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `gId` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `status` int(2) DEFAULT '0' COMMENT '商品状态',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `goodType` bigint(20) DEFAULT NULL COMMENT '商品类型',
  PRIMARY KEY (`gId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`gId`,`goodsName`,`status`,`createDate`,`goodType`) values (1,'橡皮',0,'2018-04-03 11:13:35',9),(2,'铅笔',0,'2018-04-03 11:13:47',9),(3,'冰箱',0,'2018-04-03 11:13:54',8),(4,'电视',0,'2018-04-03 11:14:01',8),(5,'桌子',0,'2018-04-03 11:14:09',7),(6,'茶几',0,'2018-04-03 11:14:27',7),(7,'感冒药',0,'2018-04-03 11:14:34',6),(8,'哮喘药',0,'2018-04-03 11:14:49',6),(9,'面条',0,'2018-04-03 11:16:31',5),(12,'三页笔记本',0,'2018-04-03 14:12:45',11);

/*Table structure for table `goodstype` */

DROP TABLE IF EXISTS `goodstype`;

CREATE TABLE `goodstype` (
  `tId` bigint(20) NOT NULL AUTO_INCREMENT,
  `tName` varchar(100) DEFAULT NULL COMMENT '类别名称',
  `status` int(1) DEFAULT '0' COMMENT '类型状态',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`tId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `goodstype` */

insert  into `goodstype`(`tId`,`tName`,`status`,`createDate`) values (5,'食品',0,'2018-04-02 18:02:09'),(6,'药品',0,'2018-04-02 18:02:12'),(7,'家具',0,'2018-04-02 18:02:15'),(8,'电器',0,'2018-04-02 18:02:18'),(9,'文具',0,'2018-04-02 18:02:36'),(10,'电脑',0,'2018-04-03 13:56:07'),(11,'笔记本',0,'2018-04-03 14:12:25');

/*Table structure for table `ordert` */

DROP TABLE IF EXISTS `ordert`;

CREATE TABLE `ordert` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderName` varchar(500) DEFAULT NULL COMMENT '订单名称',
  `customName` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `orderGood` varchar(100) DEFAULT NULL COMMENT '所需货物',
  `ordernum` double DEFAULT NULL COMMENT '货物数量',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `uId` int(100) DEFAULT NULL COMMENT '创建者',
  `ordertotal` double DEFAULT NULL COMMENT '订单总额',
  `orderDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `oStatus` int(2) DEFAULT '0' COMMENT '订单状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `ordert` */

insert  into `ordert`(`id`,`orderName`,`customName`,`orderGood`,`ordernum`,`remark`,`uId`,`ordertotal`,`orderDate`,`oStatus`) values (7,'vvvvvvv','444','2',666,'6777',1,1222,'2018-03-27 10:21:14',0),(9,'dddeee','eee','1',444,'dddddddddddeee',1,555,'2018-03-27 10:39:15',0),(13,'rrrrr','rr','8',44,'eee',1,22222,'2018-03-27 13:24:47',0),(14,'真正的订单','北京大学','9',50,'测试',1,80000,'2018-03-27 15:54:17',0),(15,'王五的订单','北医三院','化学药品',3000,'真贵啊',3,5000,'2018-03-28 15:21:58',1),(16,'你好北京','北京广播1','7',100,'测试',3,9000,'2018-03-28 18:10:56',0),(18,'2','34','5',6,'t',1,7,'2018-04-02 10:50:34',0),(20,'测试订单2','北京大学','6',300,'',12,50000,'2018-04-02 11:02:04',0),(21,'222','33333','5',444,'ttt',1,555,'2018-04-03 13:05:50',0),(22,'ee','eee3','4',222,'222',1,222,'2018-04-03 13:10:17',0),(23,'12','222','12',333,'rrr',1,4445,'2018-04-03 13:42:01',0);

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `personName` varchar(500) DEFAULT NULL COMMENT '用户姓名',
  `password` varchar(500) DEFAULT NULL COMMENT '用户密码',
  `role` int(2) DEFAULT NULL COMMENT '用户角色，1普通用户，2，管理员',
  `sex` int(2) DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `company` varchar(500) DEFAULT NULL COMMENT '公司名称',
  `post` varchar(100) DEFAULT NULL COMMENT '所属岗位',
  `username` varchar(100) DEFAULT NULL COMMENT '登录名',
  `status` int(2) DEFAULT '0' COMMENT '用户状态',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `person` */

insert  into `person`(`id`,`personName`,`password`,`role`,`sex`,`phone`,`company`,`post`,`username`,`status`,`createDate`) values (1,'张三','123',1,0,NULL,NULL,NULL,'admin',0,'2018-03-28 13:11:26'),(2,'李四','1',0,1,NULL,NULL,NULL,'super',0,'2018-03-28 13:11:26'),(3,'王五','123',1,2,'13811055555','北京医院','院长 ','wangwu',0,'2018-03-28 15:17:54'),(4,'1','111',0,0,'11111','2','3','admin1',0,'2018-03-28 15:53:59'),(5,'dd','3333',0,0,'33','33','33','333',0,'2018-03-28 15:55:07'),(7,'ddd','1',0,0,'ddd','dd','dd','dd',0,'2018-03-28 16:02:11'),(8,'ffffff','1',1,1,'333','444','555','f123',0,'2018-04-02 10:09:55'),(9,'fre','1',1,1,'q','w','e','www',0,'2018-04-02 10:13:31'),(12,'test2','1',1,0,'1','','','test2',0,'2018-04-02 11:00:41');

/*Table structure for table `preuser` */

DROP TABLE IF EXISTS `preuser`;

CREATE TABLE `preuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'c_id',
  `c_name` varchar(255) DEFAULT NULL COMMENT '公司名',
  `c_area` varchar(255) DEFAULT NULL COMMENT '所属地区',
  `c_ind` varchar(50) DEFAULT NULL COMMENT '所属行业',
  `c_user` varchar(50) DEFAULT NULL COMMENT '用户名',
  `c_passwd` varchar(50) DEFAULT NULL COMMENT '用户密码',
  `c_mail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `c_tel` varchar(50) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `preuser` */

insert  into `preuser`(`id`,`c_name`,`c_area`,`c_ind`,`c_user`,`c_passwd`,`c_mail`,`c_tel`) values (26,'dbfk','111111','周杰伦','dbfk','222222','1112','111');

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `c_id` int(11) DEFAULT NULL COMMENT '公司id',
  `r_date` datetime NOT NULL COMMENT '日期',
  `r_state` int(10) DEFAULT NULL COMMENT '状态',
  `r_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `r_unit` varchar(255) DEFAULT NULL COMMENT '单位',
  `r_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `r_comp` varchar(255) DEFAULT NULL COMMENT '供应商',
  `r_num` int(11) DEFAULT NULL COMMENT '数量',
  `r_repertory` varchar(255) DEFAULT NULL COMMENT '仓库',
  `r_operate` varchar(255) DEFAULT NULL COMMENT '入库人',
  `r_minnum` int(11) DEFAULT NULL COMMENT '库存下限',
  `r_maxnum` int(11) DEFAULT NULL COMMENT '库存上限',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='库存表';

/*Data for the table `store` */

insert  into `store`(`id`,`c_id`,`r_date`,`r_state`,`r_id`,`r_unit`,`r_name`,`r_comp`,`r_num`,`r_repertory`,`r_operate`,`r_minnum`,`r_maxnum`,`remark`) values (5,26,'2017-06-22 12:08:00',0,NULL,'公斤','货品2','周杰伦',111,NULL,'1',111,222,'1'),(6,26,'2017-06-22 12:12:29',0,NULL,'kg','火炮','周杰伦',33,NULL,'00',50,60,'a'),(7,26,'2018-03-26 14:54:48',0,NULL,'zhangsan','zhangsan','周杰伦',12,NULL,'zhangsan',5,90,'');

/*Table structure for table `storedetail` */

DROP TABLE IF EXISTS `storedetail`;

CREATE TABLE `storedetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL COMMENT '公司id',
  `r_id` int(11) DEFAULT NULL COMMENT '商品id',
  `r_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `r_unit` varchar(255) DEFAULT NULL COMMENT '单位',
  `type` int(10) DEFAULT NULL COMMENT '类型，入库，出库，损耗',
  `s_num` int(11) DEFAULT NULL COMMENT '库存量',
  `price` double(10,0) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL COMMENT '出库日期',
  `pull_com` varchar(255) DEFAULT NULL COMMENT '供货商',
  `let_com` varchar(255) DEFAULT NULL COMMENT '提货商',
  `oprator` varchar(255) DEFAULT NULL COMMENT '负责人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='明细表';

/*Data for the table `storedetail` */

insert  into `storedetail`(`id`,`c_id`,`r_id`,`r_name`,`r_unit`,`type`,`s_num`,`price`,`order_date`,`pull_com`,`let_com`,`oprator`,`remark`) values (11,26,6,'火炮','kg',1,50,11,'2017-06-22 00:00:00','1','1','1','');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`psw`,`nickname`,`created`,`role`,`level`) values (1,'admin','admin123','管理员',NULL,0,1),(2,'admin2','admin123','普通管理员',NULL,1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
