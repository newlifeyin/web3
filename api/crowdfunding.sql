/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : crowdfunding4

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 13/10/2024 02:43:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `CATEGORY_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别标识',
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'medical');
INSERT INTO `category` VALUES ('2', 'education');
INSERT INTO `category` VALUES ('3', 'social impact');
INSERT INTO `category` VALUES ('4', 'crisis relief');

-- ----------------------------
-- Table structure for donation
-- ----------------------------
DROP TABLE IF EXISTS `donation`;
CREATE TABLE `donation`  (
  `DONATION_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '捐赠标识',
  `DATE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日期',
  `AMOUNT` int NULL DEFAULT NULL COMMENT '金额',
  `GIVER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '捐赠人',
  `FUNDRAISER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '筹款人标识',
  PRIMARY KEY (`DONATION_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of donation
-- ----------------------------
INSERT INTO `donation` VALUES ('1', '1', 1, '1', 'HongweiYin');
INSERT INTO `donation` VALUES ('1728756771484', '1728756771454', 11, '1', 'HongweiYin');
INSERT INTO `donation` VALUES ('1728756787948', '1728741450834', 100, 'Bob', '1');
INSERT INTO `donation` VALUES ('1728756808890', '1728756771454', 11, '1', 'HongweiYin');
INSERT INTO `donation` VALUES ('1728757020820', '1728757020798', 2222, '111', 'HongweiYin');

-- ----------------------------
-- Table structure for fundraiser
-- ----------------------------
DROP TABLE IF EXISTS `fundraiser`;
CREATE TABLE `fundraiser`  (
  `FUNDRAISER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '募捐者 ID (PK)',
  `ORGANIZER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织者',
  `CAPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `TARGET_FUNDING` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目标资金',
  `CURRENT_FUNDING` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前资金',
  `CITY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `ACTIVE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活跃状态',
  `CATEGORY_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fundraiser
-- ----------------------------
INSERT INTO `fundraiser` VALUES ('HongweiYin', 'Yuezhong Liang', 'Guangxi University of Science and Technology Fundraising Association', '50000000', '24000000', 'Liuzhou', 'Active', '1');
INSERT INTO `fundraiser` VALUES ('Liuzhou CivilAffairsBureau', 'Yongmei Chen ', 'Sliding Star Dream', '60000000', '47000000', 'Liuzhou', 'Not active', '2');
INSERT INTO `fundraiser` VALUES ('YizhouDing', 'China \"Chinese Charity Day\"', 'Join hands in charity and create a better life together', '95200000', '61000000', 'Liuzhou', 'Active', '1');
INSERT INTO `fundraiser` VALUES ('TencentCharity', 'Twenty social organizations in Liuzhou City', 'Doing good things together doubles love', '60000000', '54000000', 'Liuzhou', 'Active', '1');
INSERT INTO `fundraiser` VALUES ('QiaoqiaoDou ', 'Chenzhou Charity Federation', 'Flood prevention and drought resistance in Chenzhou City', '70000000', '32000000', 'Chenzhou', 'Not active', '2');
INSERT INTO `fundraiser` VALUES ('ZengkaiYang', 'Yuezhong Liang', 'Guangxi University of Science and Technology Red Foundation', '5000000', '1800000', 'LiuZhou', 'Active', '1');
INSERT INTO `fundraiser` VALUES ('WeiZhang', 'Yuezhong Liang', 'Liuzhou Red Cross Society', '8500000', '2300000', 'LiuZhou', 'Active', '1');
INSERT INTO `fundraiser` VALUES ('ShirongLan', 'Yuezhong Liang', 'Guangxi Li Ning Foundation', '7000000', '5000000', 'Liuzhou', 'inactive', '1');
INSERT INTO `fundraiser` VALUES ('MeijiaChen', 'Yuezhong Liang', 'Liuzhou Jiangsu Chamber of Commerce', '16500', '8500', 'Liuzhou', 'inactive', '1');
INSERT INTO `fundraiser` VALUES ('YouyouTang', 'Yuezhong Liang', 'Rongshui Hongshun Wood Industry Co., Ltd', '10000', '10000', 'Liuzhou', 'Active', '2');

SET FOREIGN_KEY_CHECKS = 1;
