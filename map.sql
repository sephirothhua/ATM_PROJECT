/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : map

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 13/02/2019 09:47:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for api_camera
-- ----------------------------
DROP TABLE IF EXISTS `api_camera`;
CREATE TABLE `api_camera`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `longitude` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `latitude` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rstp` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(10) NULL DEFAULT 0,
  `created_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_camera
-- ----------------------------
INSERT INTO `api_camera` VALUES (1, 'c', '哈尔滨', '126.5', '45.5', 'rtsp://192.167.0.136:8555/test0', 1, '2018-12-03 11:44:19');
INSERT INTO `api_camera` VALUES (2, 'd', 'ss', '126.5', '45.5', 'rtsp://192.167.0.136:8555/test0', 1, '2018-12-05 09:31:03');

-- ----------------------------
-- Table structure for api_error
-- ----------------------------
DROP TABLE IF EXISTS `api_error`;
CREATE TABLE `api_error`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `type` tinyint(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_error
-- ----------------------------
INSERT INTO `api_error` VALUES (1, '视频流读取错误', '2018-12-10 10:25:49', 1);
INSERT INTO `api_error` VALUES (2, '视频流读取错误', '2018-12-10 10:25:50', 1);
INSERT INTO `api_error` VALUES (3, '视频流读取错误', '2018-12-11 01:21:42', 1);
INSERT INTO `api_error` VALUES (4, '视频流读取错误', '2018-12-11 01:21:43', 1);
INSERT INTO `api_error` VALUES (5, '视频流读取错误', '2018-12-11 01:21:57', 1);
INSERT INTO `api_error` VALUES (6, '视频流读取错误', '2018-12-11 01:21:58', 1);
INSERT INTO `api_error` VALUES (7, '视频流读取错误', '2018-12-11 01:22:12', 1);
INSERT INTO `api_error` VALUES (8, '视频流读取错误', '2018-12-11 01:22:13', 1);
INSERT INTO `api_error` VALUES (9, '生产进程崩溃', '2018-12-11 01:35:27', 3);
INSERT INTO `api_error` VALUES (10, '消费进程崩溃', '2018-12-11 01:37:57', 3);
INSERT INTO `api_error` VALUES (11, 'camera: c 视频流读取错误', '2018-12-11 01:37:58', 1);
INSERT INTO `api_error` VALUES (12, 'camera: d 视频流读取错误', '2018-12-11 01:37:59', 1);
INSERT INTO `api_error` VALUES (13, 'camera: d 视频流读取错误', '2018-12-11 01:38:13', 1);
INSERT INTO `api_error` VALUES (14, 'camera: c 视频流读取错误', '2018-12-11 01:38:14', 1);
INSERT INTO `api_error` VALUES (15, 'camera: d 视频流读取错误', '2018-12-11 01:38:28', 1);
INSERT INTO `api_error` VALUES (16, 'camera: c 视频流读取错误', '2018-12-11 01:38:29', 1);
INSERT INTO `api_error` VALUES (17, '生产进程崩溃', '2018-12-11 01:38:57', 3);
INSERT INTO `api_error` VALUES (18, '消费进程崩溃', '2018-12-11 01:38:57', 3);
INSERT INTO `api_error` VALUES (19, '生产进程崩溃', '2018-12-11 01:39:57', 3);
INSERT INTO `api_error` VALUES (20, '消费进程崩溃', '2018-12-11 01:39:57', 3);
INSERT INTO `api_error` VALUES (21, 'camera: c 视频流读取错误', '2018-12-11 09:39:48', 1);
INSERT INTO `api_error` VALUES (22, 'camera: d 视频流读取错误', '2018-12-11 09:39:49', 1);
INSERT INTO `api_error` VALUES (23, 'camera: test1 视频流抓取为空', '2018-12-21 01:48:31', 1);
INSERT INTO `api_error` VALUES (24, 'camera: test2 视频流抓取为空', '2018-12-21 01:48:33', 1);
INSERT INTO `api_error` VALUES (25, 'camera: test3 视频流抓取为空', '2018-12-21 01:48:33', 1);
INSERT INTO `api_error` VALUES (26, 'camera: test2 视频流读取错误', '2018-12-21 01:49:35', 1);
INSERT INTO `api_error` VALUES (27, 'camera: test5 视频流读取错误', '2018-12-21 01:51:03', 1);
INSERT INTO `api_error` VALUES (28, 'camera: test3 视频流读取错误', '2018-12-21 01:52:23', 1);
INSERT INTO `api_error` VALUES (29, 'camera: test5 视频流读取错误', '2018-12-21 01:52:32', 1);
INSERT INTO `api_error` VALUES (30, 'camera: test1 视频流读取错误', '2018-12-21 01:52:32', 1);
INSERT INTO `api_error` VALUES (31, 'camera: test3 视频流读取错误', '2018-12-21 01:52:57', 1);
INSERT INTO `api_error` VALUES (32, 'camera: test4 视频流读取错误', '2018-12-21 01:52:57', 1);
INSERT INTO `api_error` VALUES (33, 'camera: test1 视频流读取错误', '2018-12-21 01:53:09', 1);
INSERT INTO `api_error` VALUES (34, 'camera: test2 视频流读取错误', '2018-12-21 01:53:09', 1);
INSERT INTO `api_error` VALUES (35, 'camera: test3 视频流读取错误', '2018-12-21 01:53:24', 1);
INSERT INTO `api_error` VALUES (36, 'camera: test3 视频流读取错误', '2018-12-21 01:53:27', 1);
INSERT INTO `api_error` VALUES (37, 'camera: test4 视频流读取错误', '2018-12-21 01:53:27', 1);
INSERT INTO `api_error` VALUES (38, 'camera: test1 视频流读取错误', '2018-12-21 01:53:27', 1);
INSERT INTO `api_error` VALUES (39, 'camera: test4 视频流读取错误', '2018-12-21 01:53:27', 1);
INSERT INTO `api_error` VALUES (40, 'camera: test5 视频流读取错误', '2018-12-21 01:53:27', 1);
INSERT INTO `api_error` VALUES (41, 'camera: test2 视频流读取错误', '2018-12-21 01:53:27', 1);
INSERT INTO `api_error` VALUES (42, 'camera: test3 视频流读取错误', '2018-12-21 01:55:28', 1);
INSERT INTO `api_error` VALUES (43, 'camera: test4 视频流读取错误', '2018-12-21 01:55:28', 1);
INSERT INTO `api_error` VALUES (44, 'camera: test1 视频流读取错误', '2018-12-21 01:55:33', 1);
INSERT INTO `api_error` VALUES (45, 'camera: test8 视频流读取错误', '2018-12-21 01:55:33', 1);
INSERT INTO `api_error` VALUES (46, 'camera: test1 视频流读取错误', '2018-12-21 01:55:36', 1);
INSERT INTO `api_error` VALUES (47, 'camera: test6 视频流读取错误', '2018-12-21 01:55:36', 1);
INSERT INTO `api_error` VALUES (48, 'camera: test7 视频流读取错误', '2018-12-21 01:55:41', 1);
INSERT INTO `api_error` VALUES (49, 'camera: test2 视频流读取错误', '2018-12-21 01:55:44', 1);
INSERT INTO `api_error` VALUES (50, 'camera: test9 视频流读取错误', '2018-12-21 01:55:49', 1);
INSERT INTO `api_error` VALUES (51, 'camera: test4 视频流读取错误', '2018-12-21 01:55:54', 1);
INSERT INTO `api_error` VALUES (52, 'camera: test6 视频流读取错误', '2018-12-21 01:55:54', 1);
INSERT INTO `api_error` VALUES (53, 'camera: test7 视频流读取错误', '2018-12-21 01:55:55', 1);
INSERT INTO `api_error` VALUES (54, 'camera: test5 视频流读取错误', '2018-12-21 01:55:55', 1);
INSERT INTO `api_error` VALUES (55, 'camera: test4 视频流读取错误', '2018-12-21 01:58:18', 1);
INSERT INTO `api_error` VALUES (56, 'camera: test5 视频流读取错误', '2018-12-21 01:58:19', 1);
INSERT INTO `api_error` VALUES (57, 'camera: test12 视频流读取错误', '2018-12-21 01:58:20', 1);
INSERT INTO `api_error` VALUES (58, 'camera: test19 视频流读取错误', '2018-12-21 01:58:22', 1);
INSERT INTO `api_error` VALUES (59, 'camera: test17 视频流读取错误', '2018-12-21 01:58:23', 1);
INSERT INTO `api_error` VALUES (60, 'camera: test15 视频流读取错误', '2018-12-21 01:58:24', 1);
INSERT INTO `api_error` VALUES (61, 'camera: test3 视频流读取错误', '2018-12-21 01:58:26', 1);
INSERT INTO `api_error` VALUES (62, 'camera: test1 视频流读取错误', '2018-12-21 01:58:27', 1);
INSERT INTO `api_error` VALUES (63, 'camera: test14 视频流读取错误', '2018-12-21 01:58:28', 1);
INSERT INTO `api_error` VALUES (64, 'camera: test1 视频流读取错误', '2018-12-21 01:59:14', 1);
INSERT INTO `api_error` VALUES (65, 'camera: test17 视频流读取错误', '2018-12-21 01:59:16', 1);
INSERT INTO `api_error` VALUES (66, 'camera: test11 视频流读取错误', '2018-12-21 01:59:16', 1);
INSERT INTO `api_error` VALUES (67, 'camera: test6 视频流读取错误', '2018-12-21 01:59:16', 1);
INSERT INTO `api_error` VALUES (68, 'camera: test4 视频流读取错误', '2018-12-21 01:59:16', 1);
INSERT INTO `api_error` VALUES (69, 'camera: test19 视频流读取错误', '2018-12-21 01:59:18', 1);
INSERT INTO `api_error` VALUES (70, 'camera: test4 视频流读取错误', '2018-12-21 01:59:49', 1);
INSERT INTO `api_error` VALUES (71, 'camera: test2 视频流读取错误', '2018-12-21 01:59:49', 1);
INSERT INTO `api_error` VALUES (72, 'camera: test7 视频流读取错误', '2018-12-21 01:59:49', 1);
INSERT INTO `api_error` VALUES (73, 'camera: test6 视频流读取错误', '2018-12-21 01:59:53', 1);
INSERT INTO `api_error` VALUES (74, 'camera: test1 视频流读取错误', '2018-12-21 01:59:53', 1);
INSERT INTO `api_error` VALUES (75, 'camera: test3 视频流读取错误', '2018-12-21 01:59:58', 1);
INSERT INTO `api_error` VALUES (76, 'camera: test16 视频流读取错误', '2018-12-21 01:59:58', 1);
INSERT INTO `api_error` VALUES (77, 'camera: test18 视频流读取错误', '2018-12-21 01:59:59', 1);
INSERT INTO `api_error` VALUES (78, 'camera: test15 视频流读取错误', '2018-12-21 02:00:00', 1);
INSERT INTO `api_error` VALUES (79, 'camera: test17 视频流读取错误', '2018-12-21 02:00:02', 1);
INSERT INTO `api_error` VALUES (80, 'camera: test5 视频流读取错误', '2018-12-21 02:00:02', 1);
INSERT INTO `api_error` VALUES (81, 'camera: test19 视频流读取错误', '2018-12-21 02:00:22', 1);
INSERT INTO `api_error` VALUES (82, 'camera: test11 视频流读取错误', '2018-12-21 02:00:22', 1);
INSERT INTO `api_error` VALUES (83, 'camera: test9 视频流读取错误', '2018-12-21 02:00:22', 1);
INSERT INTO `api_error` VALUES (84, 'camera: test5 视频流读取错误', '2018-12-21 02:00:47', 1);
INSERT INTO `api_error` VALUES (85, 'camera: test10 视频流读取错误', '2018-12-21 02:00:47', 1);
INSERT INTO `api_error` VALUES (86, 'camera: test14 视频流读取错误', '2018-12-21 02:00:47', 1);
INSERT INTO `api_error` VALUES (87, 'camera: test16 视频流读取错误', '2018-12-21 02:00:47', 1);
INSERT INTO `api_error` VALUES (88, 'camera: test13 视频流读取错误', '2018-12-21 02:00:49', 1);
INSERT INTO `api_error` VALUES (89, 'camera: test2 视频流读取错误', '2018-12-21 02:00:50', 1);
INSERT INTO `api_error` VALUES (90, 'camera: test20 视频流读取错误', '2018-12-21 02:00:50', 1);
INSERT INTO `api_error` VALUES (91, 'camera: test15 视频流读取错误', '2018-12-21 02:00:52', 1);
INSERT INTO `api_error` VALUES (92, 'camera: test4 视频流读取错误', '2018-12-21 02:00:54', 1);
INSERT INTO `api_error` VALUES (93, 'camera: test11 视频流读取错误', '2018-12-21 02:00:54', 1);
INSERT INTO `api_error` VALUES (94, 'camera: test14 视频流抓取为空', '2018-12-25 03:03:59', 1);

-- ----------------------------
-- Table structure for api_log
-- ----------------------------
DROP TABLE IF EXISTS `api_log`;
CREATE TABLE `api_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `created_date` datetime(0) NOT NULL,
  `camera_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `camera_id`(`camera_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 557 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_log
-- ----------------------------
INSERT INTO `api_log` VALUES (483, '/static/tmp/2018-12-11 15:24:32-cdf4d39e-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:33', 1);
INSERT INTO `api_log` VALUES (484, '/static/tmp/2018-12-11 15:24:32-cdf4d39f-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:33', 1);
INSERT INTO `api_log` VALUES (485, '/static/tmp/2018-12-11 15:24:33-cdf4d3a0-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:33', 1);
INSERT INTO `api_log` VALUES (486, '/static/tmp/2018-12-11 15:24:33-cdf4d3a1-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:33', 2);
INSERT INTO `api_log` VALUES (487, '/static/tmp/2018-12-11 15:24:33-cdf4d3a2-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:34', 1);
INSERT INTO `api_log` VALUES (488, '/static/tmp/2018-12-11 15:24:33-cdf4d3a3-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:34', 2);
INSERT INTO `api_log` VALUES (489, '/static/tmp/2018-12-11 15:24:34-ceceaf56-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:34', 1);
INSERT INTO `api_log` VALUES (490, '/static/tmp/2018-12-11 15:24:34-ceceaf57-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:34', 2);
INSERT INTO `api_log` VALUES (491, '/static/tmp/2018-12-11 15:24:34-ceceaf58-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:34', 1);
INSERT INTO `api_log` VALUES (492, '/static/tmp/2018-12-11 15:24:34-ceceaf59-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:35', 2);
INSERT INTO `api_log` VALUES (493, '/static/tmp/2018-12-11 15:24:34-ceceaf5a-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:35', 1);
INSERT INTO `api_log` VALUES (494, '/static/tmp/2018-12-11 15:24:34-ceceaf5b-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:35', 2);
INSERT INTO `api_log` VALUES (495, '/static/tmp/2018-12-11 15:24:35-ceceaf5c-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:35', 1);
INSERT INTO `api_log` VALUES (496, '/static/tmp/2018-12-11 15:24:35-ceceaf5d-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:35', 2);
INSERT INTO `api_log` VALUES (497, '/static/tmp/2018-12-11 15:24:35-ceceaf5e-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:36', 1);
INSERT INTO `api_log` VALUES (498, '/static/tmp/2018-12-11 15:24:35-ceceaf5f-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:36', 2);
INSERT INTO `api_log` VALUES (499, '/static/tmp/2018-12-11 15:24:36-d00bb81e-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:36', 1);
INSERT INTO `api_log` VALUES (500, '/static/tmp/2018-12-11 15:24:36-d00bb81f-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:36', 2);
INSERT INTO `api_log` VALUES (501, '/static/tmp/2018-12-11 15:24:36-d00bb820-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:37', 1);
INSERT INTO `api_log` VALUES (502, '/static/tmp/2018-12-11 15:24:36-d00bb821-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:37', 2);
INSERT INTO `api_log` VALUES (503, '/static/tmp/2018-12-11 15:24:36-d00bb822-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:37', 1);
INSERT INTO `api_log` VALUES (504, '/static/tmp/2018-12-11 15:24:37-d00bb823-fd15-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 07:24:37', 2);
INSERT INTO `api_log` VALUES (505, '/static/tmp/2018-12-11 17:41:37-f48f834c-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:38', 1);
INSERT INTO `api_log` VALUES (506, '/static/tmp/2018-12-11 17:41:37-f48f834d-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:38', 1);
INSERT INTO `api_log` VALUES (507, '/static/tmp/2018-12-11 17:41:38-f48f834e-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:38', 1);
INSERT INTO `api_log` VALUES (508, '/static/tmp/2018-12-11 17:41:38-f48f834f-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:38', 2);
INSERT INTO `api_log` VALUES (509, '/static/tmp/2018-12-11 17:41:38-f48f8350-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:38', 1);
INSERT INTO `api_log` VALUES (510, '/static/tmp/2018-12-11 17:41:38-f48f8351-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:38', 2);
INSERT INTO `api_log` VALUES (511, '/static/tmp/2018-12-11 17:41:38-f48f8352-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:38', 1);
INSERT INTO `api_log` VALUES (512, '/static/tmp/2018-12-11 17:41:38-f48f8353-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:39', 2);
INSERT INTO `api_log` VALUES (513, '/static/tmp/2018-12-11 17:41:38-f48f8354-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:39', 1);
INSERT INTO `api_log` VALUES (514, '/static/tmp/2018-12-11 17:41:38-f48f8355-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:39', 2);
INSERT INTO `api_log` VALUES (515, '/static/tmp/2018-12-11 17:41:38-f48f8356-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:39', 1);
INSERT INTO `api_log` VALUES (516, '/static/tmp/2018-12-11 17:41:38-f48f8357-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:39', 2);
INSERT INTO `api_log` VALUES (517, '/static/tmp/2018-12-11 17:41:38-f48f8358-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:39', 1);
INSERT INTO `api_log` VALUES (518, '/static/tmp/2018-12-11 17:41:39-f5480a2a-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:39', 2);
INSERT INTO `api_log` VALUES (519, '/static/tmp/2018-12-11 17:41:39-f5480a2b-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:39', 1);
INSERT INTO `api_log` VALUES (520, '/static/tmp/2018-12-11 17:41:39-f5480a2c-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:39', 2);
INSERT INTO `api_log` VALUES (521, '/static/tmp/2018-12-11 17:41:39-f5480a2d-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:39', 1);
INSERT INTO `api_log` VALUES (522, '/static/tmp/2018-12-11 17:41:39-f5480a2e-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:39', 2);
INSERT INTO `api_log` VALUES (523, '/static/tmp/2018-12-11 17:41:39-f5480a2f-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:39', 1);
INSERT INTO `api_log` VALUES (524, '/static/tmp/2018-12-11 17:41:39-f5480a30-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:40', 2);
INSERT INTO `api_log` VALUES (525, '/static/tmp/2018-12-11 17:41:39-f5480a31-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:40', 1);
INSERT INTO `api_log` VALUES (526, '/static/tmp/2018-12-11 17:41:39-f5480a32-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:40', 2);
INSERT INTO `api_log` VALUES (527, '/static/tmp/2018-12-11 17:41:39-f5480a33-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:40', 1);
INSERT INTO `api_log` VALUES (528, '/static/tmp/2018-12-11 17:41:39-f5480a34-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:40', 2);
INSERT INTO `api_log` VALUES (529, '/static/tmp/2018-12-11 17:41:40-f5480a35-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:40', 1);
INSERT INTO `api_log` VALUES (530, '/static/tmp/2018-12-11 17:41:40-f5480a36-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:40', 2);
INSERT INTO `api_log` VALUES (531, '/static/tmp/2018-12-11 17:41:40-f5480a37-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:40', 1);
INSERT INTO `api_log` VALUES (532, '/static/tmp/2018-12-11 17:41:40-f5480a38-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:40', 2);
INSERT INTO `api_log` VALUES (533, '/static/tmp/2018-12-11 17:41:40-f5480a39-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:40', 1);
INSERT INTO `api_log` VALUES (534, '/static/tmp/2018-12-11 17:41:40-f5480a3a-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:40', 2);
INSERT INTO `api_log` VALUES (535, '/static/tmp/2018-12-11 17:41:40-f5480a3b-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:41', 1);
INSERT INTO `api_log` VALUES (536, '/static/tmp/2018-12-11 17:41:40-f5480a3c-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:41', 2);
INSERT INTO `api_log` VALUES (537, '/static/tmp/2018-12-11 17:41:40-f5480a3d-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:41', 1);
INSERT INTO `api_log` VALUES (538, '/static/tmp/2018-12-11 17:41:40-f5480a3e-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:41', 2);
INSERT INTO `api_log` VALUES (539, '/static/tmp/2018-12-11 17:41:40-f5480a3f-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:41', 1);
INSERT INTO `api_log` VALUES (540, '/static/tmp/2018-12-11 17:41:41-f67ed162-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:41', 2);
INSERT INTO `api_log` VALUES (541, '/static/tmp/2018-12-11 17:41:41-f67ed163-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:41', 1);
INSERT INTO `api_log` VALUES (542, '/static/tmp/2018-12-11 17:41:41-f67ed164-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:41', 2);
INSERT INTO `api_log` VALUES (543, '/static/tmp/2018-12-11 17:41:41-f67ed165-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:41', 1);
INSERT INTO `api_log` VALUES (544, '/static/tmp/2018-12-11 17:41:41-f67ed166-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:42', 2);
INSERT INTO `api_log` VALUES (545, '/static/tmp/2018-12-11 17:41:41-f67ed167-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:42', 1);
INSERT INTO `api_log` VALUES (546, '/static/tmp/2018-12-11 17:41:41-f67ed168-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:42', 2);
INSERT INTO `api_log` VALUES (547, '/static/tmp/2018-12-11 17:41:41-f67ed169-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:42', 1);
INSERT INTO `api_log` VALUES (548, '/static/tmp/2018-12-11 17:41:41-f67ed16a-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:42', 2);
INSERT INTO `api_log` VALUES (549, '/static/tmp/2018-12-11 17:41:41-f67ed16b-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:42', 1);
INSERT INTO `api_log` VALUES (550, '/static/tmp/2018-12-11 17:41:42-f67ed16c-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:42', 2);
INSERT INTO `api_log` VALUES (551, '/static/tmp/2018-12-11 17:41:42-f67ed16d-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:42', 1);
INSERT INTO `api_log` VALUES (552, '/static/tmp/2018-12-11 17:41:42-f67ed16e-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:42', 2);
INSERT INTO `api_log` VALUES (553, '/static/tmp/2018-12-11 17:41:42-f67ed16f-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:42', 1);
INSERT INTO `api_log` VALUES (554, '/static/tmp/2018-12-11 17:41:42-f67ed170-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:42', 2);
INSERT INTO `api_log` VALUES (555, '/static/tmp/2018-12-11 17:41:42-f67ed171-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:43', 2);
INSERT INTO `api_log` VALUES (556, '/static/tmp/2018-12-11 17:41:42-f67ed172-fd28-11e8-a7a3-d89ef336e3e0.jpg', 1, '2018-12-11 09:41:43', 2);

-- ----------------------------
-- Table structure for api_user
-- ----------------------------
DROP TABLE IF EXISTS `api_user`;
CREATE TABLE `api_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_joined` datetime(0) NOT NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_staff` tinyint(1) NOT NULL DEFAULT 1,
  `is_superuser` tinyint(1) NOT NULL DEFAULT 1,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `api_user_username_cf4e88d2_uniq`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_user
-- ----------------------------
INSERT INTO `api_user` VALUES (2, 'vv', 'pbkdf2_sha256$120000$zO18qRQOBU6I$hHS+i9UuCOpFJApNXg77qBJL8xue8SI9zsNaDIDP97M=', '1@qq.com', '2018-12-04 01:48:00', '2018-12-19 06:09:31', '', 1, 1, 1, '');
INSERT INTO `api_user` VALUES (9, 'aa', 'pbkdf2_sha256$120000$dp8H7N1lKNcB$bDlrC1msqe9yHejBxIbZBrnk2cyK0dMWjiPeQRgitvg=', '1@qq.com', '2018-12-05 02:36:00', NULL, '', 1, 1, 0, '');
INSERT INTO `api_user` VALUES (10, 'dd', '123456', '', '2018-12-18 06:23:00', NULL, '', 1, 0, 0, '');

-- ----------------------------
-- Table structure for api_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `api_user_groups`;
CREATE TABLE `api_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `api_user_groups_user_id_group_id_9c7ddfb5_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `api_user_groups_group_id_3af85785_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `api_user_groups_group_id_3af85785_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `api_user_groups_user_id_a5ff39fa_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_user_groups
-- ----------------------------
INSERT INTO `api_user_groups` VALUES (2, 2, 1);
INSERT INTO `api_user_groups` VALUES (3, 9, 1);
INSERT INTO `api_user_groups` VALUES (1, 10, 2);

-- ----------------------------
-- Table structure for api_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `api_user_user_permissions`;
CREATE TABLE `api_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `api_user_user_permissions_user_id_permission_id_a06dd704_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `api_user_user_permis_permission_id_305b7fea_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `api_user_user_permis_permission_id_305b7fea_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `api_user_user_permissions_user_id_f3945d65_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (2, '日志管理');
INSERT INTO `auth_group` VALUES (1, '设备管理');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES (1, 1, 9);
INSERT INTO `auth_group_permissions` VALUES (2, 1, 10);
INSERT INTO `auth_group_permissions` VALUES (3, 1, 11);
INSERT INTO `auth_group_permissions` VALUES (4, 1, 12);
INSERT INTO `auth_group_permissions` VALUES (5, 2, 1);
INSERT INTO `auth_group_permissions` VALUES (6, 2, 2);
INSERT INTO `auth_group_permissions` VALUES (7, 2, 3);
INSERT INTO `auth_group_permissions` VALUES (8, 2, 4);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add 日志', 1, 'add_log');
INSERT INTO `auth_permission` VALUES (2, 'Can change 日志', 1, 'change_log');
INSERT INTO `auth_permission` VALUES (3, 'Can delete 日志', 1, 'delete_log');
INSERT INTO `auth_permission` VALUES (4, 'Can view 日志', 1, 'view_log');
INSERT INTO `auth_permission` VALUES (5, 'Can add 用户', 2, 'add_user');
INSERT INTO `auth_permission` VALUES (6, 'Can change 用户', 2, 'change_user');
INSERT INTO `auth_permission` VALUES (7, 'Can delete 用户', 2, 'delete_user');
INSERT INTO `auth_permission` VALUES (8, 'Can view 用户', 2, 'view_user');
INSERT INTO `auth_permission` VALUES (9, 'Can add 设备', 3, 'add_camera');
INSERT INTO `auth_permission` VALUES (10, 'Can change 设备', 3, 'change_camera');
INSERT INTO `auth_permission` VALUES (11, 'Can delete 设备', 3, 'delete_camera');
INSERT INTO `auth_permission` VALUES (12, 'Can view 设备', 3, 'view_camera');
INSERT INTO `auth_permission` VALUES (13, 'Can add log entry', 4, 'add_logentry');
INSERT INTO `auth_permission` VALUES (14, 'Can change log entry', 4, 'change_logentry');
INSERT INTO `auth_permission` VALUES (15, 'Can delete log entry', 4, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (16, 'Can view log entry', 4, 'view_logentry');
INSERT INTO `auth_permission` VALUES (17, 'Can add permission', 5, 'add_permission');
INSERT INTO `auth_permission` VALUES (18, 'Can change permission', 5, 'change_permission');
INSERT INTO `auth_permission` VALUES (19, 'Can delete permission', 5, 'delete_permission');
INSERT INTO `auth_permission` VALUES (20, 'Can view permission', 5, 'view_permission');
INSERT INTO `auth_permission` VALUES (21, 'Can add group', 6, 'add_group');
INSERT INTO `auth_permission` VALUES (22, 'Can change group', 6, 'change_group');
INSERT INTO `auth_permission` VALUES (23, 'Can delete group', 6, 'delete_group');
INSERT INTO `auth_permission` VALUES (24, 'Can view group', 6, 'view_group');
INSERT INTO `auth_permission` VALUES (25, 'Can add content type', 7, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (26, 'Can change content type', 7, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (27, 'Can delete content type', 7, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (28, 'Can view content type', 7, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (29, 'Can add session', 8, 'add_session');
INSERT INTO `auth_permission` VALUES (30, 'Can change session', 8, 'change_session');
INSERT INTO `auth_permission` VALUES (31, 'Can delete session', 8, 'delete_session');
INSERT INTO `auth_permission` VALUES (32, 'Can view session', 8, 'view_session');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_api_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2018-12-18 06:23:37.965437', '1', '设备管理', 1, '[{\"added\": {}}]', 6, 2);
INSERT INTO `django_admin_log` VALUES (2, '2018-12-18 06:23:53.676214', '2', '日志管理', 1, '[{\"added\": {}}]', 6, 2);
INSERT INTO `django_admin_log` VALUES (3, '2018-12-18 06:24:42.837757', '10', 'dd', 1, '[{\"added\": {}}]', 2, 2);
INSERT INTO `django_admin_log` VALUES (4, '2018-12-18 06:25:09.306894', '2', 'vv', 2, '[{\"changed\": {\"fields\": [\"last_login\", \"groups\"]}}]', 2, 2);
INSERT INTO `django_admin_log` VALUES (5, '2018-12-18 06:25:26.101520', '9', 'aa', 2, '[{\"changed\": {\"fields\": [\"is_superuser\", \"groups\"]}}]', 2, 2);
INSERT INTO `django_admin_log` VALUES (6, '2018-12-18 06:25:42.719929', '8', 'ccc', 3, '', 2, 2);
INSERT INTO `django_admin_log` VALUES (7, '2018-12-18 06:25:42.724178', '7', 'vvv1', 3, '', 2, 2);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (4, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'api', 'camera');
INSERT INTO `django_content_type` VALUES (1, 'api', 'log');
INSERT INTO `django_content_type` VALUES (2, 'api', 'user');
INSERT INTO `django_content_type` VALUES (6, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (5, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (7, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (8, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-12-03 09:04:28.451043');
INSERT INTO `django_migrations` VALUES (2, 'api', '0001_initial', '2018-12-03 09:04:28.537002');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2018-12-03 09:04:28.663925');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2018-12-03 09:04:28.672440');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2018-12-03 09:04:28.679595');
INSERT INTO `django_migrations` VALUES (6, 'admin', '0004_auto_20181203_1633', '2018-12-03 09:04:28.739846');
INSERT INTO `django_migrations` VALUES (7, 'admin', '0005_auto_20181203_1637', '2018-12-03 09:04:28.808177');
INSERT INTO `django_migrations` VALUES (8, 'admin', '0006_auto_20181203_1638', '2018-12-03 09:04:28.876189');
INSERT INTO `django_migrations` VALUES (9, 'admin', '0007_auto_20181203_1639', '2018-12-03 09:04:28.942335');
INSERT INTO `django_migrations` VALUES (10, 'admin', '0008_auto_20181203_1704', '2018-12-03 09:04:29.010704');
INSERT INTO `django_migrations` VALUES (11, 'contenttypes', '0002_remove_content_type_name', '2018-12-03 09:04:29.085305');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0001_initial', '2018-12-03 09:04:29.320820');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0002_alter_permission_name_max_length', '2018-12-03 09:04:29.373565');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0003_alter_user_email_max_length', '2018-12-03 09:04:29.385530');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0004_alter_user_username_opts', '2018-12-03 09:04:29.394025');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0005_alter_user_last_login_null', '2018-12-03 09:04:29.400502');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0006_require_contenttypes_0002', '2018-12-03 09:04:29.403028');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0007_alter_validators_add_error_messages', '2018-12-03 09:04:29.413356');
INSERT INTO `django_migrations` VALUES (19, 'auth', '0008_alter_user_username_max_length', '2018-12-03 09:04:29.422043');
INSERT INTO `django_migrations` VALUES (20, 'auth', '0009_alter_user_last_name_max_length', '2018-12-03 09:04:29.428309');
INSERT INTO `django_migrations` VALUES (21, 'api', '0002_auto_20181203_1704', '2018-12-03 09:04:30.264859');
INSERT INTO `django_migrations` VALUES (22, 'sessions', '0001_initial', '2018-12-03 09:04:30.316481');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('2zgzp8wqrtiupnnimhl1ttyq3vv81sli', 'MmFiOGYwOGM4OWYwZDNhZTFiOWJmNzk2Yzk0ZmQ4MThjYjM5MmFlZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImY1MzI5MjU2MmY4ZGRlYWFkMmVkZjlkNjUwMWFlMTI3YjQwNTRmM2UiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2019-01-01 06:16:22.379955');
INSERT INTO `django_session` VALUES ('saszu3m3aqltvmnugvolrqmi86rmypgc', 'OTg3MzdhMTZkY2Q5OWU1YmU4OWRiMzAwNjcwM2RkZWEwYzQ2YjU4NDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjUzMjkyNTYyZjhkZGVhYWQyZWRmOWQ2NTAxYWUxMjdiNDA1NGYzZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2019-01-02 06:09:30.801594');

SET FOREIGN_KEY_CHECKS = 1;
