/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : sfms

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-05-10 17:30:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `deptNo` varchar(255) DEFAULT NULL,
  `deptName` varchar(255) DEFAULT NULL,
  `deptTel` varchar(255) DEFAULT NULL,
  `deptDesc` varchar(255) DEFAULT NULL,
  `deptLeader` varchar(255) DEFAULT NULL,
  `parentDeptId` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'rw0001', '软件外包', null, '软外', 'admin', '4', null);
INSERT INTO `department` VALUES ('2', 'yd001', '移动互联', null, '软外', 'admin', '1', null);
INSERT INTO `department` VALUES ('3', 'dsj001', '大数据', null, '软外', 'admin', '1', null);
INSERT INTO `department` VALUES ('4', 'zcb001', '总裁办', null, '董事会', 'admin', null, null);
INSERT INTO `department` VALUES ('5', 'xmgl001', '项目管理部', '123', '23', 'admin', '4', '32');
INSERT INTO `department` VALUES ('15', '123aaa', '123aaa', '123aaa', '123aaa', '123aaaa', null, '1231232aaa');
INSERT INTO `department` VALUES ('16', '123', '1231', '231', '231', '123', null, '23123');
INSERT INTO `department` VALUES ('19', '123', '3123', '2312', '231', '123', null, '1231');
INSERT INTO `department` VALUES ('20', '123', '123', '312', '12', '123', null, '123');
INSERT INTO `department` VALUES ('21', '1111', '11', '', '', '', null, '');

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `dicNo` varchar(255) DEFAULT NULL,
  `dicType` varchar(255) DEFAULT NULL,
  `dicCode` varchar(255) DEFAULT NULL,
  `dicValue` varchar(255) DEFAULT NULL,
  `dicSort` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `validateFlag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('1', 'province', '籍贯', 'SD', '山东', '', null, '0');
INSERT INTO `dictionary` VALUES ('2', 'province', '籍贯', 'JS', '江苏', null, null, '0');
INSERT INTO `dictionary` VALUES ('3', 'province', '籍贯', 'SH', '上海', null, null, '0');
INSERT INTO `dictionary` VALUES ('4', 'province', '籍贯', 'BJ', '北京', null, null, '0');
INSERT INTO `dictionary` VALUES ('5', 'sex', '性别', '0', '男', '', '', '0');
INSERT INTO `dictionary` VALUES ('6', 'sex', '性别', '1', '女', '', '', '0');
INSERT INTO `dictionary` VALUES ('7', 'province', '籍贯', 'SX', '山西', '', '', '0');
INSERT INTO `dictionary` VALUES ('8', 'stockState', '入库状态', '00', '创建', null, null, '0');
INSERT INTO `dictionary` VALUES ('9', 'stockState', '入库状态', '02', '记账', null, null, '0');
INSERT INTO `dictionary` VALUES ('10', 'productType', '饲料分类', '1型', '1型饲料', null, null, '0');
INSERT INTO `dictionary` VALUES ('11', 'productType', '饲料分类', '2型', '2型饲料', null, null, '0');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `productNo` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productType` varchar(255) DEFAULT NULL,
  `productStandard` varchar(255) DEFAULT NULL,
  `supplierId` varchar(255) DEFAULT NULL,
  `productDate` datetime DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'JY_JAVA_0001', 'JAVA程序设计', 'office', '400*800', '2', '2015-10-16 00:00:00', '本', '68.80', ' ');
INSERT INTO `goods` VALUES ('2', 'SP_ZAO_0001', '青岛啤酒', 'drink', '500ml', '1', '2015-10-21 00:00:00', '箱', '998.99', ' ');
INSERT INTO `goods` VALUES ('3', 'SP_ZAO_0002', '青岛啤酒1', 'drink', '501ml', '4', '2015-10-21 00:00:00', '箱', '998.99', ' ');
INSERT INTO `goods` VALUES ('4', 'YL_2015-01', '医用纱布', 'medical', '3333*9999', '5', '2015-10-14 00:00:00', '袋', '13.80', ' ');
INSERT INTO `goods` VALUES ('5', 'SY_RICE_0001', '东北大米', '1型', '10', '1', '2016-04-30 00:00:00', '斤', '3.58', '');
INSERT INTO `goods` VALUES ('8', 'tttt111222', 'ttttt12222', '', 'tttt222222', null, '2016-05-09 00:00:00', '111222', '2222.00', '11111111122222');
INSERT INTO `goods` VALUES ('100', 'JY_JAVA_0001', 'JAVA程序设计', 'office', '400*800', '2', '2015-10-16 00:00:00', '本', '68.80', ' ');

-- ----------------------------
-- Table structure for immune
-- ----------------------------
DROP TABLE IF EXISTS `immune`;
CREATE TABLE `immune` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `immunename` varchar(50) DEFAULT NULL,
  `sheeptype` varchar(20) DEFAULT NULL,
  `immunetype` varchar(20) DEFAULT NULL,
  `intervals` varchar(20) DEFAULT NULL,
  `necessary` varchar(10) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of immune
-- ----------------------------
INSERT INTO `immune` VALUES ('1', '疫苗001', '山羊', '羊三联四防疫苗', '11111', '1', '111');
INSERT INTO `immune` VALUES ('2', '1', '1', '口蹄疫疫苗', '1111', '1', '1');

-- ----------------------------
-- Table structure for instock
-- ----------------------------
DROP TABLE IF EXISTS `instock`;
CREATE TABLE `instock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `instockNo` varchar(255) DEFAULT NULL,
  `stockId` varchar(255) DEFAULT NULL,
  `supplierId` varchar(255) DEFAULT NULL,
  `instockDate` datetime DEFAULT NULL,
  `instockState` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `goodId` varchar(25) DEFAULT NULL,
  `numbers` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instock
-- ----------------------------
INSERT INTO `instock` VALUES ('14', 'RK201705092251795', '1', '1', null, '00', '', '1', '2222');
INSERT INTO `instock` VALUES ('15', 'RK201705092252009', '1', '1', null, '00', '', '8', '1111');
INSERT INTO `instock` VALUES ('16', 'RK201705092320815', '1', '1', null, '00', '', '1', '111');
INSERT INTO `instock` VALUES ('17', 'RK201705092344333', '1', '1', null, '00', '', '1', '111');

-- ----------------------------
-- Table structure for instockdetail
-- ----------------------------
DROP TABLE IF EXISTS `instockdetail`;
CREATE TABLE `instockdetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `instockId` varchar(255) DEFAULT NULL,
  `productNo` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productStandard` varchar(255) DEFAULT NULL,
  `productNum` decimal(19,2) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `totalPrice` decimal(19,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instockdetail
-- ----------------------------

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `stockId` varchar(255) DEFAULT NULL,
  `productNo` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productStandard` varchar(255) DEFAULT NULL,
  `inventoryNum` decimal(19,2) DEFAULT NULL,
  `inventoryPrice` decimal(19,2) DEFAULT NULL,
  `maxNum` decimal(19,2) DEFAULT NULL,
  `minNum` decimal(19,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('1', '2', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '1.00', '68.80', '1.20', '0.20', null);
INSERT INTO `inventory` VALUES ('2', '2', 'SY_RICE_0001', '东北大米1', '100', '1.25', '4.48', '1.50', '0.25', null);
INSERT INTO `inventory` VALUES ('5', '1', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '7.00', '481.60', '2.40', '0.40', null);
INSERT INTO `inventory` VALUES ('6', '1', 'YL_2015-01', '医用纱布', '3333*9999', '10.00', '138.00', '6.00', '1.00', null);
INSERT INTO `inventory` VALUES ('7', '1', 'SP_ZAO_0002', '青岛啤酒1', '501ml', '18.00', '17981.82', '7.20', '1.20', null);
INSERT INTO `inventory` VALUES ('8', '3', 'SP_ZAO_0001', '青岛啤酒', '500ml', '100.00', '99899.00', '300.00', '30.00', null);
INSERT INTO `inventory` VALUES ('9', '3', 'YL_2015-01', '医用纱布', '3333*9999', '1000.00', '13800.00', '3000.00', '300.00', null);
INSERT INTO `inventory` VALUES ('10', '3', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '998.00', '68662.40', '2994.00', '299.40', null);

-- ----------------------------
-- Table structure for k_dept
-- ----------------------------
DROP TABLE IF EXISTS `k_dept`;
CREATE TABLE `k_dept` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deptNo` varchar(20) NOT NULL COMMENT '部门编号',
  `deptName` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `deptLeader` varchar(20) DEFAULT NULL COMMENT '部门领导',
  `deptTel` varchar(15) DEFAULT NULL COMMENT '联系方式',
  `parentDeptNo` varchar(20) DEFAULT NULL COMMENT '上级部门',
  `deptDesc` varchar(200) DEFAULT NULL COMMENT '部门描述',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='部门信息表';

-- ----------------------------
-- Records of k_dept
-- ----------------------------
INSERT INTO `k_dept` VALUES ('1', 'rw000001', '软件研发部', 'admin', '123', '123', '123', '123');
INSERT INTO `k_dept` VALUES ('2', 'sale0001', '销售部啊', 'admin', '123123', '123', '123', '123');
INSERT INTO `k_dept` VALUES ('6', 'zg00001', '综管部', 'admin', '23423', '234', '234', '234');

-- ----------------------------
-- Table structure for k_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `k_dictionary`;
CREATE TABLE `k_dictionary` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dicId` varchar(255) DEFAULT NULL COMMENT '字典类型ID',
  `dicType` varchar(255) DEFAULT NULL COMMENT '字典类型',
  `dicCode` varchar(255) DEFAULT NULL COMMENT '字典编码',
  `dicValue` varchar(255) DEFAULT NULL COMMENT '字典值',
  `dicSort` varchar(255) DEFAULT NULL COMMENT '排序',
  `validateFlag` varchar(1) DEFAULT '0' COMMENT '有效性标记(0 生效 1失效 9挂起)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of k_dictionary
-- ----------------------------
INSERT INTO `k_dictionary` VALUES ('1', 'stockState', '库存申请单状态', '00', '创建', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('2', 'stockState', '库存申请单状态', '02', '记账', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('3', 'productType', '产品分类', 'jiaocai', '教材', '', '0', ' ');
INSERT INTO `k_dictionary` VALUES ('4', 'productType', '产品分类', 'office', '办公用品', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('5', 'province', '省市', 'SD', '山东', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('6', 'province', '省市', 'JS', '江苏', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('7', 'province', '省市', 'BJ', '北京', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('8', 'province', '省市', 'SH', '上海', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('9', 'province', '省市', 'GZ', '广州', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('16', 'year', '年份', '2010', '2010', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('17', 'year', '年份', '2011', '2011', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('18', 'year', '年份', '2012', '2012', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('19', 'year', '年份', '2013', '2013', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('20', 'year', '年份', '2014', '2014', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('21', 'year', '年份', '2015', '2015', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('22', 'year', '年份', '2016', '2016', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('23', 'year', '年份', '2017', '2017', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('24', 'month', '月份', '01', '01', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('25', 'month', '月份', '02', '02', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('26', 'month', '月份', '03', '03', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('27', 'month', '月份', '04', '04', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('28', 'month', '月份', '05', '05', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('29', 'month', '月份', '06', '06', null, '0', null);
INSERT INTO `k_dictionary` VALUES ('30', 'month', '月份', '07', '07', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('31', 'month', '月份', '08', '08', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('32', 'month', '月份', '09', '09', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('33', 'month', '月份', '10', '10', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('34', 'month', '月份', '11', '11', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('35', 'month', '月份', '12', '12', '', '0', '');
INSERT INTO `k_dictionary` VALUES ('36', 'productType', '产品分类', 'medical', '医疗用品', '', '0', ' ');
INSERT INTO `k_dictionary` VALUES ('37', 'productType', '产品分类', 'drink', '酒水', '', '0', ' ');

-- ----------------------------
-- Table structure for k_goods
-- ----------------------------
DROP TABLE IF EXISTS `k_goods`;
CREATE TABLE `k_goods` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `productNo` varchar(30) NOT NULL COMMENT '产品编码',
  `productName` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `productTypeCode` varchar(10) DEFAULT NULL COMMENT '产品分类代码',
  `productStandard` varchar(50) DEFAULT NULL COMMENT '产品规格',
  `supplierNo` varchar(20) DEFAULT NULL COMMENT '供应商代码',
  `productDate` date DEFAULT NULL COMMENT '生产日期',
  `productNum` int(10) DEFAULT NULL COMMENT '产品数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '计量单位',
  `price` double DEFAULT NULL COMMENT '单价',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='货物信息表';

-- ----------------------------
-- Records of k_goods
-- ----------------------------
INSERT INTO `k_goods` VALUES ('1', 'JY_JAVA_0001', 'JAVA程序设计', 'office', '400*800', 'ugrow', '2015-10-16', '1000', '本', '68.8', '此乃大神也');
INSERT INTO `k_goods` VALUES ('2', 'SP_ZAO_0001', '青岛啤酒', 'drink', '500ml', '1', '2015-10-21', '99999', '箱', '998.99', '青岛啤酒，奢侈品中的战斗机');
INSERT INTO `k_goods` VALUES ('3', 'SP_ZAO_0002', '青岛啤酒1', 'drink', '501ml', '4', '2015-10-21', '99999', '箱', '998.99', '青岛啤酒，奢侈品中的战斗机');
INSERT INTO `k_goods` VALUES ('4', 'YL_2015-01', '医用纱布', 'medical', '3333*9999', '5', '2015-10-14', '12345', '袋', '13.8', '');

-- ----------------------------
-- Table structure for k_instock
-- ----------------------------
DROP TABLE IF EXISTS `k_instock`;
CREATE TABLE `k_instock` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `inStockNo` varchar(30) NOT NULL COMMENT '入库单编码',
  `stockId` varchar(20) DEFAULT NULL COMMENT '仓库代码',
  `supplierId` varchar(20) DEFAULT NULL COMMENT '供应商编码',
  `inStockState` varchar(2) DEFAULT NULL COMMENT '入库单状态（00：创建  02:记账）',
  `inStockNum` int(15) DEFAULT NULL COMMENT '入库数量',
  `inStockPrice` decimal(20,2) DEFAULT NULL COMMENT '入库金额',
  `inStockDate` date DEFAULT NULL COMMENT '申请日期',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='入库主表';

-- ----------------------------
-- Records of k_instock
-- ----------------------------
INSERT INTO `k_instock` VALUES ('7', 'ruku201510261022001', '1', '3', '02', '0', '0.00', '2015-10-28', '测试库');
INSERT INTO `k_instock` VALUES ('8', 'ruku2015102610240001', '2', '5', '02', '0', '0.00', '2015-10-13', '11111');
INSERT INTO `k_instock` VALUES ('9', 'ruku2015102610250001', '3', '3', '02', '0', '0.00', '2015-10-09', 'ssss');
INSERT INTO `k_instock` VALUES ('10', 'ruku2015102610260001', '1', '4', '02', '0', '0.00', '2015-09-09', 'sdfsdf ');
INSERT INTO `k_instock` VALUES ('11', 'RK2015102815120001', '2', '3', '02', '0', '0.00', '2015-09-24', '234');
INSERT INTO `k_instock` VALUES ('13', 'kc2015103016590001', '1', '1', '02', '0', '0.00', '2015-10-15', 'dddd');
INSERT INTO `k_instock` VALUES ('14', 'RK2015103017170001', '4', '4', '00', '0', '0.00', '2015-10-29', '121平台');
INSERT INTO `k_instock` VALUES ('15', 'RK20151104110', '1', '1', '02', '0', '0.00', '2015-11-05', 'sdkfls;d\r\n');

-- ----------------------------
-- Table structure for k_instock_detail
-- ----------------------------
DROP TABLE IF EXISTS `k_instock_detail`;
CREATE TABLE `k_instock_detail` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `inStockID` int(20) NOT NULL COMMENT '入库单ID',
  `productNo` varchar(30) NOT NULL COMMENT '产品编码',
  `productName` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `productStandard` varchar(50) DEFAULT NULL COMMENT '产品规格',
  `productNum` int(10) DEFAULT NULL COMMENT '入库数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '计量单位',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `totalPrice` decimal(20,2) DEFAULT NULL COMMENT '入库金额',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='入库物料明细表';

-- ----------------------------
-- Records of k_instock_detail
-- ----------------------------
INSERT INTO `k_instock_detail` VALUES ('20', '7', 'SP_ZAO_0001', '青岛啤酒', '500ml', '1235', '箱', '998.99', '1233752.65', '');
INSERT INTO `k_instock_detail` VALUES ('21', '7', 'SP_ZAO_0002', '青岛啤酒1', '501ml', '1000', '箱', '998.99', '998990.00', '');
INSERT INTO `k_instock_detail` VALUES ('22', '8', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '100', '本', '68.80', '6880.00', '');
INSERT INTO `k_instock_detail` VALUES ('23', '8', 'SP_ZAO_0002', '青岛啤酒1', '501ml', '2000', '箱', '998.99', '1997980.00', '');
INSERT INTO `k_instock_detail` VALUES ('24', '9', 'SP_ZAO_0001', '青岛啤酒', '500ml', '2000', '箱', '998.99', '1997980.00', '');
INSERT INTO `k_instock_detail` VALUES ('25', '9', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '500', '本', '68.80', '34400.00', '');
INSERT INTO `k_instock_detail` VALUES ('26', '10', 'SP_ZAO_0001', '青岛啤酒', '500ml', '3000', '箱', '998.99', '2996970.00', '');
INSERT INTO `k_instock_detail` VALUES ('27', '10', 'SP_ZAO_0002', '青岛啤酒1', '501ml', '555', '箱', '998.99', '554439.45', '');
INSERT INTO `k_instock_detail` VALUES ('28', '10', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '200', '本', '68.80', '13760.00', '');
INSERT INTO `k_instock_detail` VALUES ('33', '11', 'SP_ZAO_0001', '青岛啤酒', '500ml', '999', '箱', '998.99', '997991.01', '');
INSERT INTO `k_instock_detail` VALUES ('34', '13', 'YL_2015-01', '医用纱布', '3333*9999', '1000', '袋', '13.80', '13800.00', '');
INSERT INTO `k_instock_detail` VALUES ('35', '13', 'SP_ZAO_0002', '青岛啤酒1', '501ml', '1', '箱', '998.99', '998.99', '');
INSERT INTO `k_instock_detail` VALUES ('36', '13', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '1', '本', '20.00', '20.00', '');
INSERT INTO `k_instock_detail` VALUES ('37', '14', 'SP_ZAO_0002', '青岛啤酒1', '501ml', '444', '箱', '998.99', '443551.56', '');
INSERT INTO `k_instock_detail` VALUES ('38', '15', 'SP_ZAO_0001', '青岛啤酒', '500ml', '10', '箱', '998.99', '9989.90', '');

-- ----------------------------
-- Table structure for k_inventory
-- ----------------------------
DROP TABLE IF EXISTS `k_inventory`;
CREATE TABLE `k_inventory` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `stockId` varchar(20) NOT NULL COMMENT '仓库ID',
  `productNo` varchar(30) NOT NULL COMMENT '产品编码',
  `productName` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `productStandard` varchar(100) DEFAULT NULL COMMENT '产品规格',
  `inventoryNum` int(15) DEFAULT NULL COMMENT '库存量',
  `inventoryPrice` decimal(20,2) DEFAULT NULL COMMENT '库存价值金额',
  `inStockNum` int(15) DEFAULT NULL COMMENT '入库量',
  `inStockPrice` decimal(20,2) DEFAULT NULL COMMENT '入库金额',
  `outStockNum` int(15) DEFAULT NULL COMMENT '出库量',
  `outStockPrice` decimal(20,2) DEFAULT NULL COMMENT '出库金额',
  `maxNum` int(15) DEFAULT NULL COMMENT '库存量上限',
  `minNum` int(15) DEFAULT NULL COMMENT '库存下限',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='库存信息主表';

-- ----------------------------
-- Records of k_inventory
-- ----------------------------
INSERT INTO `k_inventory` VALUES ('10', '1', 'SP_ZAO_0001', '青岛啤酒', '500ml', '3255', '3251712.45', '4255', '4250702.45', '1000', '998990.00', '1853', '370', '');
INSERT INTO `k_inventory` VALUES ('11', '1', 'SP_ZAO_0002', '青岛啤酒1', '501ml', '1000', '998990.00', '1555', '1553429.45', '555', '554439.45', '1500', '300', '');
INSERT INTO `k_inventory` VALUES ('12', '2', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '100', '6880.00', '100', '6880.00', '0', '0.00', '150', '30', '');
INSERT INTO `k_inventory` VALUES ('13', '2', 'SP_ZAO_0002', '青岛啤酒1', '501ml', '1500', '1498485.00', '2000', '1997980.00', '500', '499495.00', '3000', '600', '');
INSERT INTO `k_inventory` VALUES ('14', '3', 'SP_ZAO_0001', '青岛啤酒', '500ml', '2000', '1997980.00', '2000', '1997980.00', '0', '0.00', '3000', '600', '');
INSERT INTO `k_inventory` VALUES ('15', '3', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '500', '34400.00', '500', '34400.00', '0', '0.00', '750', '150', '');
INSERT INTO `k_inventory` VALUES ('16', '1', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '200', '13760.00', '200', '13760.00', '0', '0.00', '300', '60', '');
INSERT INTO `k_inventory` VALUES ('17', '4', 'JY_JAVA_0001', 'JAVA程序设计', '400*800', '200', '13760.00', '200', '13760.00', '0', '0.00', '300', '60', '');
INSERT INTO `k_inventory` VALUES ('18', '2', 'SP_ZAO_0001', '青岛啤酒', '500ml', '999', '997991.01', '999', '997991.01', '0', '0.00', '1499', '300', '');
INSERT INTO `k_inventory` VALUES ('19', '1', 'YL_2015-01', '医用纱布', '3333*9999', '1000', '13800.00', '1000', '13800.00', '0', '0.00', '1500', '300', '');

-- ----------------------------
-- Table structure for k_outstock
-- ----------------------------
DROP TABLE IF EXISTS `k_outstock`;
CREATE TABLE `k_outstock` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `outStockNo` varchar(30) NOT NULL COMMENT '出库单编码',
  `stockId` varchar(20) DEFAULT NULL COMMENT '仓库代码',
  `supplierId` varchar(20) DEFAULT NULL COMMENT '供应商编码',
  `outStockState` varchar(255) DEFAULT NULL COMMENT '出库状态（00：创建  02：记账',
  `outStockNum` int(15) DEFAULT NULL COMMENT '出库量',
  `outStockPrice` decimal(10,0) DEFAULT NULL COMMENT '出库金额',
  `outStockDate` date DEFAULT NULL COMMENT '申请日期',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='出库主表';

-- ----------------------------
-- Records of k_outstock
-- ----------------------------
INSERT INTO `k_outstock` VALUES ('4', 'chuku2015102615510001', '1', '1', '02', '0', '0', '2015-10-28', '');
INSERT INTO `k_outstock` VALUES ('5', 'CK2015103014410001', '2', '6', '02', '0', '0', '2015-10-30', '医院急用');
INSERT INTO `k_outstock` VALUES ('6', 'ck201510301700111', '1', '6', '00', '0', '0', '2015-10-22', '2342234');

-- ----------------------------
-- Table structure for k_outstock_detail
-- ----------------------------
DROP TABLE IF EXISTS `k_outstock_detail`;
CREATE TABLE `k_outstock_detail` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `outStockId` int(20) NOT NULL COMMENT '出库单ID',
  `productNo` varchar(30) NOT NULL COMMENT '产品编码',
  `productName` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `productStandard` varchar(50) DEFAULT NULL COMMENT '产品规格',
  `productNum` int(10) DEFAULT NULL COMMENT '入库数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '计量单位',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `totalPrice` decimal(20,2) DEFAULT NULL COMMENT '出库金额',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='出库物料明细表';

-- ----------------------------
-- Records of k_outstock_detail
-- ----------------------------
INSERT INTO `k_outstock_detail` VALUES ('3', '4', 'SP_ZAO_0001', '青岛啤酒', '500ml', '1000', '箱', '998.99', '998990.00', '');
INSERT INTO `k_outstock_detail` VALUES ('4', '4', 'SP_ZAO_0002', '青岛啤酒1', '501ml', '555', '箱', '998.99', '554439.45', '');
INSERT INTO `k_outstock_detail` VALUES ('5', '5', 'SP_ZAO_0002', '青岛啤酒1', '501ml', '500', '箱', '998.99', '499495.00', '');

-- ----------------------------
-- Table structure for k_stock
-- ----------------------------
DROP TABLE IF EXISTS `k_stock`;
CREATE TABLE `k_stock` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `stockNo` varchar(20) NOT NULL COMMENT '仓库代码',
  `stockName` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `provinceCode` varchar(20) DEFAULT NULL COMMENT '所在地区编码',
  `stockAddress` varchar(100) DEFAULT NULL COMMENT '仓库地址',
  `stockTel` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `userId` varchar(20) DEFAULT NULL COMMENT '仓管员编码ID',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='仓库信息表';

-- ----------------------------
-- Records of k_stock
-- ----------------------------
INSERT INTO `k_stock` VALUES ('1', 'JN001', '青岛港', 'SD', '山东省青岛市市南区', '2342', '234234', '');
INSERT INTO `k_stock` VALUES ('2', '002', '成品库', 'JS', '江苏省南京市仙林区', '23423', '234234', '23424');
INSERT INTO `k_stock` VALUES ('3', '001', '原料库', 'SD', '山东省青岛市崂山区', '123123', '1231', '1231撒旦飞洒地方');
INSERT INTO `k_stock` VALUES ('4', '003', '半成品库', 'SH', '上海市宝山区XXX', '234', '234', '234');

-- ----------------------------
-- Table structure for k_supplier
-- ----------------------------
DROP TABLE IF EXISTS `k_supplier`;
CREATE TABLE `k_supplier` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `supplierNo` varchar(20) NOT NULL COMMENT '供应商编码',
  `supplierName` varchar(50) DEFAULT NULL COMMENT '供应商姓名',
  `provinceCode` varchar(20) DEFAULT NULL COMMENT '所在地区代码',
  `supplierAddress` varchar(100) DEFAULT NULL COMMENT '供应商详细地址',
  `supplierEmail` varchar(30) DEFAULT NULL COMMENT '供应商邮箱',
  `supplierTel` varchar(20) DEFAULT NULL COMMENT '供应商联系方式',
  `supplierTax` varchar(20) DEFAULT NULL COMMENT '传真号',
  `userName` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `userTel` varchar(20) DEFAULT NULL COMMENT '联系人联系方式',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='供应商信息表';

-- ----------------------------
-- Records of k_supplier
-- ----------------------------
INSERT INTO `k_supplier` VALUES ('1', 'beer2', '青岛二啤', 'bj', '阿打算地方的发生地方啥地方萨芬爱的风格的嘎发顺丰干', '123', '123', '123', '123', '123', '123123撒地方');
INSERT INTO `k_supplier` VALUES ('3', 'yujin', '青岛誉金', 'sh', 'bb', 'bb', 'bbb', 'bb', 'bb', 'bb', 'bb');
INSERT INTO `k_supplier` VALUES ('4', 'ugrow', '英谷教育', 'js', ' 都是', '第三方', '撒地方', '撒地方', ' sdf', ' 撒旦f', '撒旦发');
INSERT INTO `k_supplier` VALUES ('5', 'donghe', '青岛东合', 'SD', '', '', '', '', '', '', '');
INSERT INTO `k_supplier` VALUES ('6', 'hospital401', '401医院', 'BJ', '北京市天安门', '123', '2342', '123', '1', '1', '1');

-- ----------------------------
-- Table structure for k_user
-- ----------------------------
DROP TABLE IF EXISTS `k_user`;
CREATE TABLE `k_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID序列号',
  `userNo` varchar(20) NOT NULL COMMENT '用户代码',
  `userName` varchar(50) NOT NULL COMMENT '用户姓名',
  `pwd` varchar(20) NOT NULL COMMENT '密码',
  `deptNo` varchar(20) DEFAULT NULL COMMENT '部门编号',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别(0：男 1：女)',
  `age` int(3) DEFAULT NULL,
  `position` varchar(30) DEFAULT NULL COMMENT '职位',
  `hometown` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `telphone` varchar(15) DEFAULT NULL COMMENT '联系方式',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `roleNo` varchar(20) DEFAULT NULL COMMENT '角色 (0：Admin   1：Boss  2：Manager 3：Employee 4：StockAdmin 5：Supplier)',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of k_user
-- ----------------------------
INSERT INTO `k_user` VALUES ('14', 'test', '测试用户', '123456', '2', '1', '2', '2', 'JS', '2', '2', 'emp', '2');
INSERT INTO `k_user` VALUES ('15', 'admin', 'admin', '123456', '1', '0', '22', '管理员', 'SH', 'www', '', 'emp', '');
INSERT INTO `k_user` VALUES ('18', 'test3', '测试用户3', '123456', '2', '0', '23', '23', 'SH', '23', '23', 'emp', '23');
INSERT INTO `k_user` VALUES ('19', 'test4', '测试用户4', '123456', '2', '0', '234', '测试岗位', 'BJ', '23423', '234', 'emp', '234');

-- ----------------------------
-- Table structure for outstock
-- ----------------------------
DROP TABLE IF EXISTS `outstock`;
CREATE TABLE `outstock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `outstockNo` varchar(255) DEFAULT NULL,
  `stockId` varchar(255) DEFAULT NULL,
  `supplierId` varchar(255) DEFAULT NULL,
  `outstockDate` datetime DEFAULT NULL,
  `outstockState` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `maxNum` decimal(19,2) DEFAULT NULL,
  `minNum` decimal(19,2) DEFAULT NULL,
  `outstockNum` decimal(19,2) DEFAULT NULL,
  `outstockPrice` decimal(19,2) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productNo` varchar(255) DEFAULT NULL,
  `productStandard` varchar(255) DEFAULT NULL,
  `goodid` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of outstock
-- ----------------------------
INSERT INTO `outstock` VALUES ('4', 'CK201705092317211', '1', '1', '2017-05-09 00:00:00', '00', '', null, null, '11111.00', null, null, null, null, '1');
INSERT INTO `outstock` VALUES ('5', 'CK201705092318278', '1', '1', null, '00', '', null, null, '11111.00', null, null, null, null, '1');
INSERT INTO `outstock` VALUES ('7', 'CK201705092344132', '1', '1', null, '00', null, null, null, '111.00', null, null, null, null, '1');
INSERT INTO `outstock` VALUES ('8', 'CK201705092347873', '1', '1', null, '00', '', null, null, '111.00', null, null, null, null, '1');
INSERT INTO `outstock` VALUES ('9', 'CK201705092348634', '1', '1', null, '00', '', null, null, '11111.00', null, null, null, null, '1');

-- ----------------------------
-- Table structure for outstockdetail
-- ----------------------------
DROP TABLE IF EXISTS `outstockdetail`;
CREATE TABLE `outstockdetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `outstockId` varchar(255) DEFAULT NULL,
  `productNo` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productStandard` varchar(255) DEFAULT NULL,
  `productNum` decimal(19,2) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `totalPrice` decimal(19,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of outstockdetail
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `remark` varchar(255) DEFAULT NULL,
  `roleLevel` varchar(255) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `roleNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', null, '999', '管理员', 'admin');
INSERT INTO `role` VALUES ('2', null, '1', '员工', 'emp');
INSERT INTO `role` VALUES ('3', null, '2', '经理', 'manager');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `stockNo` varchar(255) DEFAULT NULL,
  `stockName` varchar(255) DEFAULT NULL,
  `provinceCode` varchar(255) DEFAULT NULL,
  `stockAddress` varchar(255) DEFAULT NULL,
  `stockTel` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('1', 'JN001', '青岛港', 'SD', '山东省青岛市市南区', '2342', 'admin', '');
INSERT INTO `stock` VALUES ('2', '002', '成品库', 'JS', '江苏省南京市仙林区', '23423', 'admin', '23424');
INSERT INTO `stock` VALUES ('3', '001', '原料库', 'SD', '山东省青岛市崂山区', '123123', 'admin', '1231撒旦飞洒地方');
INSERT INTO `stock` VALUES ('4', '003', '半成品库', 'SH', '上海市宝山区XXX', '234', 'admin', '234');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `supplierNo` varchar(255) DEFAULT NULL,
  `supplierName` varchar(255) DEFAULT NULL,
  `provinceCode` varchar(255) DEFAULT NULL,
  `supplierAddress` varchar(255) DEFAULT NULL,
  `supplierEmail` varchar(255) DEFAULT NULL,
  `supplierTel` varchar(255) DEFAULT NULL,
  `supplierTax` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userTel` varchar(255) DEFAULT NULL,
  `userTex` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'beer2', '青岛二厂', 'SD', '阿打算地方的发生地方啥地方萨芬爱的风格的嘎发顺丰干', '123', '123', '123', '123', '123', '123123撒地方', '');

-- ----------------------------
-- Table structure for sys_product
-- ----------------------------
DROP TABLE IF EXISTS `sys_product`;
CREATE TABLE `sys_product` (
  `ID` int(11) NOT NULL,
  `ProdCode` varchar(50) DEFAULT NULL,
  `ProdName` varchar(50) DEFAULT NULL,
  `ProdSpec` varchar(50) DEFAULT NULL,
  `ProdType` varchar(50) DEFAULT NULL,
  `Price` decimal(18,2) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_product
-- ----------------------------
INSERT INTO `sys_product` VALUES ('1', 'YQFT020001', 'ä¼ åŠ¨æ†', '80*20', 'A80', '60.00', '123');
INSERT INTO `sys_product` VALUES ('2', 'YQFT020001', 'ä¼ åŠ¨æ†', '80*20', 'A80', '60.00', '123');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userNo` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telphone` varchar(255) DEFAULT NULL,
  `hometown` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_iv5n36gjhou09ti5khys2sh18` (`deptId`),
  KEY `FK_ao5g1e3yutsfcfv8pp9ym93c2` (`roleId`),
  CONSTRAINT `FK_ao5g1e3yutsfcfv8pp9ym93c2` FOREIGN KEY (`roleId`) REFERENCES `role` (`ID`),
  CONSTRAINT `FK_iv5n36gjhou09ti5khys2sh18` FOREIGN KEY (`deptId`) REFERENCES `department` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '管理员', '123', '999', '0', 'admin@admin.com', '123456', 'SD', '管理员', '1', '1', null);
INSERT INTO `user` VALUES ('2', 'yangjx', '杨敬熹', '123', '29', '0', 'ads', null, 'SD', null, '1', null, null);
INSERT INTO `user` VALUES ('3', 'liujl', '刘江林', null, '33', '0', '123', '123', 'SD', '12312', '3', null, '123123');
INSERT INTO `user` VALUES ('4', 'fangh', '方慧', '123', '33', '1', null, null, 'SD', null, '4', null, null);
INSERT INTO `user` VALUES ('5', 'songgq', '宋国强', '123', '36', '0', null, null, 'SD', '经理', '1', null, null);
INSERT INTO `user` VALUES ('6', 'tianb', '田波', null, '40', '0', 'wer123', '12123', 'BJ', '123', '3', null, '');
INSERT INTO `user` VALUES ('7', 'wangwq', '王万琪', '123', '32', '0', null, null, 'SD', null, '3', null, null);
INSERT INTO `user` VALUES ('12', 'helj', '何莉娟', '123', '23', '1', '234', '123', 'SD', '234', '2', null, '撒地方');
INSERT INTO `user` VALUES ('13', 'houfc', '侯方超', '123', '34', '0', '23', '321', 'SD', '34', '3', null, '34');
INSERT INTO `user` VALUES ('17', 'shaozw', '邵作伟', '123', '27', '0', '123', '123', 'SD', '开发工程师', '1', null, '');
INSERT INTO `user` VALUES ('18', 'wangq', '王千', '123', '29', '0', '1212', '233', 'BJ', '23', '2', null, '撒地方');
INSERT INTO `user` VALUES ('19', '111', '1111', '123', '', null, '', '', 'SD', '', '1', '1', '111');

-- ----------------------------
-- Table structure for user_t
-- ----------------------------
DROP TABLE IF EXISTS `user_t`;
CREATE TABLE `user_t` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_t
-- ----------------------------
INSERT INTO `user_t` VALUES ('1', '测试', 'sfasgfaf', '24');
