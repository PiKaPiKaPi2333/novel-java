/*
 Navicat Premium Data Transfer

 Source Server         : MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : rice_novel

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 14/12/2023 11:12:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_book_index
-- ----------------------------
DROP TABLE IF EXISTS `t_book_index`;
CREATE TABLE `t_book_index`  (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `book_id` int unsigned NOT NULL COMMENT '小说ID',
  `word_count` int unsigned NOT NULL COMMENT '章节字数',
  `title` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '章节名',
  `status` tinyint unsigned NOT NULL COMMENT '状态:0草稿，1发布',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_bookid_title`(`book_id`, `title`) USING BTREE,
  INDEX `idx_bookid_utime`(`book_id`, `update_time`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  CONSTRAINT `fk_index_book` FOREIGN KEY (`book_id`) REFERENCES `t_book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '小说目录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_book_index
-- ----------------------------
INSERT INTO `t_book_index` VALUES (1, '2021-05-10 01:34:08', '2021-05-17 01:48:20', 1, 8, '第一章 绯红', 1);
INSERT INTO `t_book_index` VALUES (4, '2021-05-10 01:34:12', '2021-05-10 01:34:12', 1, 4, '第五章 jaoefjiefo', 0);
INSERT INTO `t_book_index` VALUES (7, '2021-05-10 01:34:34', '2021-05-10 01:34:34', 1, 1, '第二章 ajfoej就就efjijajaefefefef', 1);
INSERT INTO `t_book_index` VALUES (9, '2021-05-10 01:33:28', '2021-05-10 01:33:28', 1, 1, '第三章', 1);
INSERT INTO `t_book_index` VALUES (10, '2021-05-10 01:34:51', '2021-05-17 01:52:48', 1, 3319, '第四章 占卜', 1);
INSERT INTO `t_book_index` VALUES (11, '2021-05-10 01:33:47', '2021-05-10 01:33:47', 1, 1, '第六章', 1);
INSERT INTO `t_book_index` VALUES (12, '2021-05-16 23:03:01', '2021-05-16 23:03:01', 59, 2884, '第一章 凡胎圣体', 1);
INSERT INTO `t_book_index` VALUES (14, '2021-05-17 01:51:26', '2021-05-17 01:51:34', 2, 3333, '第五十四章 计划通，开工！', 1);
INSERT INTO `t_book_index` VALUES (15, '2021-05-17 01:54:51', '2021-05-17 01:54:56', 3, 2674, '第五十八章 天空之城', 1);
INSERT INTO `t_book_index` VALUES (16, '2021-05-17 01:57:04', '2021-05-17 01:57:04', 4, 3524, '第一百二十四章 猩球大战', 1);
INSERT INTO `t_book_index` VALUES (17, '2021-05-17 02:00:15', '2021-05-17 02:00:15', 10, 6301, ' 第一〇八二章 乱·战', 1);
INSERT INTO `t_book_index` VALUES (19, '2021-05-17 02:18:06', '2021-05-17 02:18:06', 11, 2438, '第一章 夙愿', 1);
INSERT INTO `t_book_index` VALUES (20, '2021-05-17 02:38:57', '2021-05-17 02:38:57', 11, 5, '第二章 变故', 1);
INSERT INTO `t_book_index` VALUES (21, '2021-05-17 02:39:41', '2021-05-17 02:39:41', 11, 5, '第三章 斗法', 1);
INSERT INTO `t_book_index` VALUES (22, '2021-05-17 02:39:51', '2021-05-17 02:39:51', 11, 5, '第四章 暖玉', 1);
INSERT INTO `t_book_index` VALUES (23, '2021-05-17 02:39:57', '2021-05-17 02:39:57', 11, 5, '第五章 云来', 1);
INSERT INTO `t_book_index` VALUES (24, '2021-05-17 02:40:07', '2021-05-17 02:40:07', 11, 5, '第六章 苍芜', 1);
INSERT INTO `t_book_index` VALUES (25, '2021-05-17 02:40:16', '2021-05-17 02:40:16', 11, 5, '第七章 谜团', 1);
INSERT INTO `t_book_index` VALUES (26, '2021-05-17 02:40:24', '2021-05-17 02:40:24', 11, 5, '第八章 往事', 1);
INSERT INTO `t_book_index` VALUES (27, '2021-05-17 02:40:31', '2021-05-17 02:40:31', 11, 5, '第九章 拜师', 1);
INSERT INTO `t_book_index` VALUES (28, '2021-05-17 02:40:38', '2021-05-17 02:40:38', 11, 5, '第十章 入门', 1);
INSERT INTO `t_book_index` VALUES (29, '2021-05-17 02:40:46', '2021-05-17 02:40:46', 11, 6, '第十一章 苍洱', 1);
INSERT INTO `t_book_index` VALUES (30, '2021-05-17 02:40:56', '2021-05-17 02:40:56', 11, 7, '第十二章 水晶盏', 1);
INSERT INTO `t_book_index` VALUES (31, '2021-05-17 02:41:13', '2021-05-17 02:41:13', 11, 7, '第十三章 云与泥', 1);
INSERT INTO `t_book_index` VALUES (32, '2021-05-17 02:41:20', '2021-05-17 02:41:20', 11, 6, '第十四章 巨狼', 1);
INSERT INTO `t_book_index` VALUES (33, '2021-05-17 02:41:29', '2021-05-17 02:41:29', 11, 6, '第十五章 浅墨', 1);
INSERT INTO `t_book_index` VALUES (34, '2021-05-17 02:41:37', '2021-05-17 02:41:37', 11, 6, '第十六章 玄术', 1);
INSERT INTO `t_book_index` VALUES (35, '2021-05-17 02:41:44', '2021-05-17 02:41:44', 11, 6, '第十七章 修炼', 1);
INSERT INTO `t_book_index` VALUES (36, '2021-05-17 02:41:50', '2021-05-17 02:41:50', 11, 6, '第十八章 不甘', 1);
INSERT INTO `t_book_index` VALUES (37, '2021-05-17 02:41:59', '2021-05-17 02:41:59', 11, 6, '第十九章 飞瀑', 1);
INSERT INTO `t_book_index` VALUES (38, '2021-05-17 02:42:06', '2021-05-17 02:42:06', 11, 6, '第二十章 三年', 1);
INSERT INTO `t_book_index` VALUES (39, '2021-05-17 02:42:16', '2021-05-17 02:42:16', 11, 7, '第二十一章 少女', 1);
INSERT INTO `t_book_index` VALUES (40, '2021-05-17 02:42:21', '2021-05-17 02:42:21', 11, 7, '第二十二章 善缘', 1);
INSERT INTO `t_book_index` VALUES (41, '2021-05-17 02:42:37', '2021-05-17 02:42:37', 11, 7, '第二十三章 独白', 1);
INSERT INTO `t_book_index` VALUES (42, '2021-05-17 02:42:45', '2021-05-17 02:42:45', 11, 7, '第二十四章 情愫', 1);
INSERT INTO `t_book_index` VALUES (43, '2021-05-17 02:42:51', '2021-05-17 02:42:51', 11, 7, '第二十五章 断尘', 1);
INSERT INTO `t_book_index` VALUES (44, '2021-05-17 02:42:57', '2021-05-17 02:42:57', 11, 7, '第二十六章 挑衅', 1);
INSERT INTO `t_book_index` VALUES (45, '2021-05-17 02:43:05', '2021-05-17 02:43:05', 11, 7, '第二十七章 奇才', 1);
INSERT INTO `t_book_index` VALUES (46, '2021-05-17 02:43:12', '2021-05-17 02:43:12', 11, 7, '第二十八章 前夕', 1);
INSERT INTO `t_book_index` VALUES (47, '2021-05-17 02:43:20', '2021-05-17 02:43:20', 11, 7, '第二十九章 名册', 1);
INSERT INTO `t_book_index` VALUES (48, '2021-05-17 02:43:26', '2021-05-17 02:43:26', 11, 6, '第三十章 历练', 1);
INSERT INTO `t_book_index` VALUES (49, '2021-05-17 02:43:33', '2021-05-17 02:43:33', 11, 7, '第三十一章 黑影', 1);
INSERT INTO `t_book_index` VALUES (50, '2021-05-17 02:43:40', '2021-05-17 02:43:40', 11, 7, '第三十二章 妖袭', 1);
INSERT INTO `t_book_index` VALUES (51, '2021-05-17 02:43:48', '2021-05-17 02:43:48', 11, 7, '第三十三章 商封', 1);
INSERT INTO `t_book_index` VALUES (52, '2021-05-17 02:43:56', '2021-05-17 02:43:56', 11, 7, '第三十四章 击杀', 1);
INSERT INTO `t_book_index` VALUES (53, '2021-05-17 02:44:03', '2021-05-17 02:44:03', 11, 7, '第三十五章 聆听', 1);
INSERT INTO `t_book_index` VALUES (54, '2021-05-17 02:44:16', '2021-05-17 02:44:16', 11, 7, '第三十六章 紫烟', 1);
INSERT INTO `t_book_index` VALUES (55, '2021-05-17 02:44:22', '2021-05-17 02:44:22', 11, 7, '第三十七章 昊天', 1);
INSERT INTO `t_book_index` VALUES (56, '2021-05-17 02:44:29', '2021-05-17 02:44:29', 11, 7, '第三十八章 朦胧', 1);
INSERT INTO `t_book_index` VALUES (57, '2021-05-17 02:44:40', '2021-05-17 02:44:40', 11, 7, '第三十九章 冲突', 1);

SET FOREIGN_KEY_CHECKS = 1;
