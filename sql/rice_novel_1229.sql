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

 Date: 29/12/2023 15:30:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_base
-- ----------------------------
DROP TABLE IF EXISTS `t_base`;
CREATE TABLE `t_base`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `title` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '小说名',
  `author_name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '作者名',
  `channel` tinyint unsigned COMMENT '频道：0男频，1女频',
  `category_id` int unsigned COMMENT '小说分类ID',
  `introduction` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '小说简介',
  `cover` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '小说封面',
  `status` tinyint unsigned COMMENT '状态：0下架，1连载中，2已完结',
  `word_count` int unsigned COMMENT '小说总字数',
  `visit_count` int unsigned COMMENT '总点击量',
  `score` float unsigned COMMENT '小说评分（取t_rating平均数）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_title_author`(`title`, `author_name`) USING BTREE,
  INDEX `fk_book_category`(`category_id`) USING BTREE,
  CONSTRAINT `fk_book_category` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '小说信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES (1, '2021-04-29 14:17:46', '2021-05-13 17:10:13', '诡秘之主', '爱潜水的乌贼', 0, 1, '蒸汽与机械的浪潮中，谁能触及非凡？历史和黑暗的迷雾里，又是谁在耳语？我从诡秘中醒来，睁眼看见这个世界：枪械，大炮，巨舰，飞空艇，差分机；魔药，占卜，诅咒，倒吊人，封印物……光明依旧照耀，神秘从未远离，这是一段“愚者”的传说。', 'https://qidian.qpic.cn/qdbimg/349573/1010868264/300', 1, 260756, 623, 7.3);
INSERT INTO `t_book` VALUES (2, '2021-04-23 15:00:12', '2021-04-29 15:00:12', '在下壶中仙', '海底漫步者', 0, 4, '炼妖壶可以炼化妖物，还自带一个空间“壶中天地”。这看起来还是很不错的，可惜……找了两年，现实世界中没有妖怪，想炼妖没得原材料；壶中天地中被困在一隅，周围全是打不过的树精，寸步难行。找不到修仙功法，没有灵丹妙药，都市修仙爽文之旅胎死腹中，娶九个老婆胜过唐伯虎鄙视韦爵爷的梦想直接幻灭，只能改了校园奋斗 恋爱爽文剧情，但……妖怪来了！', 'https://qidian.qpic.cn/qdbimg/349573/1025745191/300', 1, 501478, 71, 8);
INSERT INTO `t_book` VALUES (3, '2021-04-29 15:03:33', '2021-05-12 17:10:34', '\r\n奥术神座', '爱潜水的乌贼', 0, 5, '\r\n“知识就等于力量。”“所谓神，不过是强大一点的奥术师。”带着一大堆知识的夏风穿越而来了。', 'https://qidian.qpic.cn/qdbimg/349573/2643379/300', 2, 31620000, 142, 3.5);
INSERT INTO `t_book` VALUES (4, '2021-04-22 14:59:53', '2021-05-11 17:10:41', '幻想世界大穿越', '辰一十一', 0, 1, '当幻想成为现实，天朝少年能否踏上成神之路？拥有穿越异能的陈昂，穿越在幻想世界里。在《永无止境》的世界里，获得超人的智慧，在《超体》的世界里，窥视成神的奥秘，从《笑傲江湖》开始，修行内功，进化自己，由《狂蟒之灾》中，拿到长生的钥匙，超人血清，绝境药剂，X因子，蜘蛛基因，蜥蜴药剂嗑药成神的道路漫长而崎岖，窥视上帝的禁区危险而艰难，我一路不悔！', 'https://qidian.qpic.cn/qdbimg/349573/3542798/300', 1, 40610000, 537, 10);
INSERT INTO `t_book` VALUES (10, '2021-05-01 22:02:01', '2021-05-12 00:55:23', '赘婿', '愤怒的香蕉', 0, 4, '武朝末年，岁月峥嵘，天下纷乱，金辽相抗，局势动荡，百年屈辱，终于望见结束的第一缕曙光，天祚帝、完颜阿骨打、吴乞买，成吉思汗铁木真、札木合、赤老温、木华黎、博尔忽、博尔术、秦桧、岳飞、李纲、种师道、唐恪、吴敏、耿南仲、张邦昌，忠臣与奸臣的较量，英雄与枭雄的博弈，胡虏南下，百万铁骑叩雁门，江山沦陷，生灵涂炭，一个国家与民族百年的屈辱与抗争，先行者的哭泣、呐喊与悲怆……而在这之前一点点，江宁城中，暗流涌动，一个商贾家毫不起眼的小小赘婿，正在很没责任感地过着他那只想吃东西、看表演的悠闲人生…………郭麒麟、宋轶主演热播影视剧同名原著。', 'https://qidian.qpic.cn/qdbimg/349573/1979049/300', 0, 501478, 18, 6.5);
INSERT INTO `t_book` VALUES (11, '2021-04-15 18:41:37', '2021-04-16 16:00:34', '云亦苍途', '一个大帅猪', 0, 2, '自古正邪不两立，而又有正教门派之间的明争暗斗，尔虞我诈，数不胜数，多有陨落又有兴起，温香暖玉纵然能解世间万毒，也解不了这心中情故，凤凰神鸟拥有梵尽世间之力，也不过终会涅槃重生，本欲拯救天下苍生万物，却解救不了心爱之人，余生有泪，爱意深情入骨。    这世间何为正?何为邪?时光荏苒,岁月如梭，人生......一梦，白云苍狗，此生缘，镜花水月，都成空幻，相遇也好，放下也罢，尘世间的发生的点点滴滴，终究只因一个    “缘    “字。【展开】【收起】  <br/>', 'http://www.shuquge.com/files/article/image/140/140008/140008s.jpg', 1, 67708, 464549, 6);
INSERT INTO `t_book` VALUES (12, '2021-04-15 18:42:29', '2021-04-16 15:59:47', '逆流诸天', '菜刀手', 0, 1, '飞鱼服，绣春刀，整条街上，哥就是最靓的崽！李自成，张献忠，皇太极，多尔衮，可识得锦衣卫诏狱否？    穿越明朝末年，陆凡的逆伐诸天之路，从成为一名光荣的锦衣卫总旗开始！    已有精品作品《诸天之最强BOSS》《漫漫诸天》《信仰诸天》等，请放心阅读。  <br/>', 'http://www.shuquge.com/files/article/image/133/133264/133264s.jpg', 1, 670445, 625341, 4);
INSERT INTO `t_book` VALUES (13, '2021-04-15 18:44:05', '2021-04-16 15:59:46', '快穿之大佬她总在伪装', '很是矫情', 0, 5, '真大佬娇气大魔王扶嘉X各个位面无情的主角扶嘉穿越了，在狗比系统操作下，成为无数小说位面中的无数炮灰。    该炮灰死法多种多样，包括但不仅限于被走火入魔的魔教教主拍死的侍女，宠妃落胎皇帝迁怒被杖杀的宫女，救人反被灭口的农女……作为总是无辜被杀的炮灰，扶嘉一边嘤嘤嘤，一边锤爆了他们。    并跺脚和系统撒娇，地动山摇，    “我说你们这些人能不能搞点阳间的操作，呜呜呜，好可怕，系统保护我。”系统：他们有你可怕吗？  <br/>', 'http://www.shuquge.com/files/article/image/139/139384/139384s.jpg', 1, 918817, 701624, 9.2);
INSERT INTO `t_book` VALUES (14, '2021-04-15 18:41:41', '2021-04-16 15:59:45', '开局签到回复术士的重启人生', '梦寻三千度', 0, 6, '【本书偏向脑洞，轻松】一场突如其来的大火烧烬了一切，却让白墨穿越到了回复术士的重启人生，并且获得了攻略系统，只要提升好感值，就可以获得各种能力及其物品！    ［你喝下了芙列雅亲自熬制的毒药，芙列雅对宿主好感度到达百分之四十，获得奖励：高位魔法，隐身！    ］［你接受了    “剑圣”克蕾赫.葛莱列特的赎罪，克蕾赫对宿主好感度达到百分之六十，获得奖励：剑术精通，鹰眼］［你拒绝了    “炮之勇者”布列特的黑屋邀请，布列特对宿主好感度低于零，危险警告！    ］……  <br/>', 'http://www.shuquge.com/files/article/image/139/139812/139812s.jpg', 1, 106164, 702782, 7.6);
INSERT INTO `t_book` VALUES (15, '2021-04-15 18:41:45', '2021-04-16 15:59:45', '反派从疯人院开始崛起', '扬帆', 0, 3, '前世叱咤风云的魔尊大人，灵魂穿越到被人陷害而进疯人院的陆千炼身上，从此开启崛起之路。    “老子不敬天地，不信鬼神，只信自己。”    “抢走我的，我把它抢回来；欺凌我的，我必辱之。”    “我是疯子我怕谁！”（非正经沙雕文，勿代入现实，考据党和较真者请绕行。    ）  <br/>', 'http://www.shuquge.com/files/article/image/138/138064/138064s.jpg', 1, 183732, 38234, 2.3);
INSERT INTO `t_book` VALUES (16, '2021-04-15 18:42:55', '2021-04-16 15:59:44', '母老虎升仙道', '小盘古', 0, 2, '老天爷啊~是不是瞎，把你亲孙女送到畜生道了，你造不造啊！前世的佣兵头子被炸成一只小老虎，她这个心情，先崩溃一下。    以为长本事了可以出去耍耍，又被从妖灵界送到修仙界，谁说兽兽不会炼丹炼器，画符布阵，她就要做个样样精通的神兽。    待我再回妖灵界之时，必将一统江湖，千秋万代……  <br/>', 'http://www.shuquge.com/files/article/image/133/133448/133448s.jpg', 1, 921900, 401416, 5);
INSERT INTO `t_book` VALUES (17, '2021-04-15 18:42:39', '2021-04-16 15:59:44', '图腾甲', '梦虚', 0, 6, '苏日安：人皇？哼！不过是那沽名钓誉之辈，总有一天，我当斩你！还人族一盛世乾坤！  <br/>', 'http://www.shuquge.com/files/article/image/134/134616/134616s.jpg', 1, 1041134, 282806, 5);
INSERT INTO `t_book` VALUES (18, '2021-04-15 18:42:42', '2021-04-16 15:59:43', '重生之全球首富', '不谷', 0, 3, '下载客户端，查看完整作品简介。  <br/>', 'http://www.shuquge.com/files/article/image/136/136272/136272s.jpg', 1, 600748, 760570, 9.2);
INSERT INTO `t_book` VALUES (19, '2021-04-15 18:44:12', '2021-04-16 15:59:42', '我的七个女徒弟风华绝代', '陈笑生', 0, 1, '图书管理员王钟穿越到异世大陆，觉醒仙门系统。    只要壮大浩然宗，就能增强实力。    王钟先后收了七个风华绝代女弟子。    王钟给出《道德经》，大弟子读书成圣。    王钟给出《家常菜做法大全》，二弟子铁锅炼丹。    王钟给出《老黄历》，三弟子顿悟天机占星术。    ……    面对外人震惊的目光，王钟表示统统坐下，这都是一般操作。    什么？    你还惦记我每天看的禁书？    我一巴掌拍死你！  <br/>', 'http://www.shuquge.com/files/article/image/132/132206/132206s.jpg', 1, 1522269, 905554, 0.4);
INSERT INTO `t_book` VALUES (20, '2021-04-15 18:44:25', '2021-04-16 15:59:39', '斯坦索姆神豪', '余云飞', 0, 6, '父慈子孝二傻子；    万年绿帽一粒蛋。    二刀流龙瓦里安；    无尽船王吉安娜。    或许你们不信，其实以上黑霉龟都是麦当肯的败家对象而已。    败家的日子，就是这么枯燥无味，人生总是要有点追求的，当法神之路在前面打开时……    等等！是谁告诉我天赋是1点【光亮术】，然后全点【冲锋】、【狂暴】、【泰坦之握】的？    还有……谁把沙雕玩家放进来的！？  <br/>', 'http://www.shuquge.com/files/article/image/129/129403/129403s.jpg', 1, 1269872, 360426, 4.2);
INSERT INTO `t_book` VALUES (21, '2021-04-15 18:45:12', '2021-04-16 15:59:38', '当医生开了外挂', '浅笙一梦', 0, 3, '刘浩，国内医科学院的应届毕业生，他对自己的人生规划就是安安稳稳的在一家不错的医院，寻一份称心的医生工作，然后拿着稳定的工资收入，娶妻生子，安慰且平凡的度过一生。    可没想到，在一次偶然的时间，随着一个    “叮咚”声音的响起，他的人生轨迹开始有了转变。  <br/>', 'http://www.shuquge.com/files/article/image/130/130918/130918s.jpg', 1, 1861055, 698117, 5.6);
INSERT INTO `t_book` VALUES (22, '2021-04-15 18:44:31', '2021-04-16 15:59:33', '金刚不坏大寨主', '请叫我小佳佳', 0, 2, '内练一口九阳气，外练一身金刚骨，金背九环刀在手，挥手间滚滚头颅落地。    大寨主江大力雄壮之极的身躯静坐在雕花梨木大椅上，虎皮大衣下满是鼓凸强健的肌肉，坚硬，霸道，浑身充满刚猛强横的力量感。    他眼神冷峻从容，注视着周边两侧新招收的玩家。    各种阿谀奉承之言，从这些韭菜口中不绝于耳传来。    “大寨主威武神勇，刀枪不入铁掌无敌，求大寨主传授小的武艺！”    “大寨主，敏感肌能练铁布衫吗？”    “老弟，骚话少说，大寨主可是出了名的心狠手辣。”    一名刚从城隍庙复活过来的玩家哭丧着脸，“像我，初听不知话中意，再听已是刀下魂。大寨主说一不二，每次提问再问第二遍就送人上路，我已经无FK可说。”    简介凑合看，总之就是个猛练肌肉提大刀的猛人闯荡江湖综武的那些事儿，无女主，霸道果决，铁打的大BOSS，流水的玩家.....  <br/>', 'http://www.shuquge.com/files/article/image/129/129211/129211s.jpg', 1, 1843621, 20395, 8.2);
INSERT INTO `t_book` VALUES (23, '2021-04-15 18:44:38', '2021-04-16 15:59:23', '我的治愈系游戏', '我会修空调', 0, 5, '警察同志，如果我说这是一款休闲治愈系游戏，你们信吗？  <br/>', 'http://www.shuquge.com/files/article/image/136/136189/136189s.jpg', 1, 417200, 104459, 6.3);
INSERT INTO `t_book` VALUES (24, '2021-04-15 18:45:18', '2021-04-16 15:59:49', '九天帝尊', '尘山', 0, 1, '周辰的身份原是天界的一名混天大帝，因至交好友在他突破至高境界紧要关头时背叛导致命陨，残魂转世附身于凡界的一个普通少年。    而周辰在重返天界后，竟然发现自己在天界的那些徒弟、弟子，一个个都修成了天帝，就连侍奉自己的仆从，都成为一方霸主，甚至是他随手种的一颗古树，都成了妖界至尊。  <br/>', 'http://www.shuquge.com/files/article/image/134/134412/134412s.jpg', 1, 794282, 801171, 6.2);
INSERT INTO `t_book` VALUES (25, '2021-04-15 18:44:31', '2021-04-16 15:59:49', '我舍友变成美少女了', '白胡子徐提莫', 0, 6, '我叫吕临，我刚睡醒后就发现室友都变成了美少女。    可那能咋办？    毕竟一起睡那么多年了，都是亲生的只能帮衬着了。    可没想到，我的生活因此而陷入了“水深火热”当中。    ——因为这些舍友实在是缠的太紧了！    ……    本书又名《我舍友变成美少女后竟然想冲我！》，《你们这是强人锁男！》，《没有了真的一点都没有了》  <br/>', 'http://www.shuquge.com/files/article/image/140/140152/140152s.jpg', 1, 30474, 282132, 1.4);
INSERT INTO `t_book` VALUES (26, '2021-04-15 18:44:40', '2021-04-16 16:00:34', '棋魂：随身阿尔法狗', '由来是', 0, 6, '来到棋魂世界，傅俞获得了来自未来世界的阿尔法go伴生围棋系统……塔矢亮：“总有一天，我会击败你！”进藤光：“傅俞，你是我一生的目标……”藤原佐为：“俞君是距离神之一手最近的男人……”塔矢行洋：“围棋在他的手中，拥有着无穷无尽的变数，他就像看透了一切……”  <br/>', 'http://www.shuquge.com/files/article/image/140/140087/140087s.jpg', 1, 102321, 149975, 10);
INSERT INTO `t_book` VALUES (27, '2021-04-15 18:46:32', '2021-04-16 16:00:33', '道茫记', '疯语先生', 0, 2, '大道茫茫人道艰，一入修途难成仙，看赤胆少年闯仙路，化仙缘，观世间大道，修一心向仙。  <br/>', 'http://www.shuquge.com/files/article/image/114/114341/114341s.jpg', 1, 2352651, 310332, 7.5);
INSERT INTO `t_book` VALUES (28, '2021-04-15 18:47:02', '2021-04-16 16:00:33', '大灾变时代', '团猪', 0, 5, '重生灾变时代，所有的一切都将改变，重活这一世，注定要活的精彩！  <br/>', 'http://www.shuquge.com/files/article/image/126/126343/126343s.jpg', 1, 2749943, 546546, 3);
INSERT INTO `t_book` VALUES (29, '2021-04-15 18:44:57', '2021-04-16 16:00:32', '签到斗罗从史莱姆开始', '想吃肘子', 0, 6, '‘这是一条神奇的评论，当写下自己想要穿越的人物和世界之后，梦想即刻成真’‘恭喜你成为第一位填写评论之人！    ’‘穿越世界：斗罗大陆！’‘穿越地点：星斗大森林！’‘穿越人物：利姆露！    ’‘备注：鉴于您是第一位评论者，已随机获得签到系统，请查收！’  <br/>', 'http://www.shuquge.com/files/article/image/138/138253/138253s.jpg', 1, 223255, 591417, 8.5);
INSERT INTO `t_book` VALUES (30, '2021-04-15 18:45:19', '2021-04-16 16:00:32', '荣耀圈小团宠', '弄七绝', 0, 6, '叶秋原本以为自家混账哥哥离家出走多年不回家已经够让人糟心的了，直到他在自家家门口遇见了那个闪着金光的小姑娘……    小姑娘一口交代了自己有个“119”救火系统，无力抵抗对方焦糖色大眼睛的叶秋为她办了身份证——叶夏。    ???    叶夏原本以为，这个因为自动补全设定而不断作死的世界已经够让人头疼了，毕竟她得面对:    1.周泽楷的私生饭，    2. 张佳乐退役的网络暴力事件，    3.在黑化的刘皓手里救下叶神可怜的右手    ……    但是谁能告诉她她一个兢兢业业的救火员为什么要强制绑定荣耀选手主职业？还得在五年内完成世界冠军成就？!    总之， 这是一个拥有系统造出来的完美身体、天赋顶尖但是毫无游戏经验的小姑娘在全职高手的荣耀联盟里努力成长，还得时时刻刻关注着“关键人物们”安全的故事～    关于cp:会分结局!至于分几个结局，得看他们的化学反应啦\\（?～?）／    ps:这本一定会有ooc啦，不然咋去救火捏。  <br/>', 'http://www.shuquge.com/files/article/image/127/127497/127497s.jpg', 1, 299864, 317767, 4.2);
INSERT INTO `t_book` VALUES (31, '2021-04-15 18:45:18', '2021-04-16 16:00:32', '豪门替身影后召唤的神尊成真了', '陈国主', 0, 3, '连今拥有无数光环，娱乐圈豪门贵女、顶级名媛、史上最年轻影后、全球十大最美面孔冠军……但是她也十分清楚，她是俞家替真千金俞前培养出来的替身。    一次偶然的游戏活动，她无意间召唤出了游戏官方设定的先天圣者神白。    神白修为逆天，孤高万世，清冷无情，恰恰是这位俯瞰三界的仙界第一神尊，从游戏中穿越而出，来到她的生命里。    神白的出现，惊艳了全世界，无数粉丝为他疯狂，各路大佬震撼他的崛起，他的粉丝认为他神圣不可亵渎，他的对手认为他诡异至极，只有连今晓得，这个美绝人寰的家伙简直中二病晚期！    日常一    神白：“这世道过于污浊，要我帮你血洗人间吗？”    连今：“洗人间之前先把碗洗了。”    神白捻了个清洁咒，把碗刷的干干净净。    某神一脸骄傲：“无所不能的我接受你的崇拜！”    连今：“……”    日常二    “本尊有一本上古菜谱，你试着做一下。”    连今一看，菜谱上满是凤凰胆麒麟血龙王须，这些材料她哪有，于是搞了一锅小龙虾。    没想到神白对这个味道非常满意，隔天，某龙虾养殖场发来产权转让合同。    神白：“从今以后，这个养殖场就被你承包了！”    连今：“……”    满以为得到一位贴心忠犬地表最强者，没想到招来一只中二度爆表的土豪吃货。  <br/>', 'http://www.shuquge.com/files/article/image/140/140185/140185s.jpg', 1, 22910, 714950, 3.3);
INSERT INTO `t_book` VALUES (32, '2021-04-15 18:45:25', '2021-04-16 16:00:31', '女总裁的生活助理', '吊晴白额虎', 0, 3, '“壁咚”通常指男性将女性逼到墙边，单手或者靠在墙上发出“咚”的一声。    类型也千奇百怪：如甜蜜羞涩双手咚，近距离肘部咚，有点怕怕高压咚，病娇风格头痛咚。    演变出几种不同的形式：如完全变态的蝉咚，胸咚以及没有对象，自己玩的空气咚。    反映也大不相同：害羞型，冷淡型，天然型，学问型，和根本没人壁咚型。    方子错做梦也没有想到，堂堂七尺男儿竟然在一个狭小空间内被一个高冷女总裁给壁咚了！    被咚也就算了，还出现了一个玩死人不偿命的系统。    没有选择的方子错只好以牙还牙，以嘴还嘴。    回吻过去！！！    本书又名《最强吃软饭系统》《我的总裁女友》《如何讨取富婆欢心》    PS：书中情节纯属虚构，请不要以身试法，如果执意如此，后果自行承担。    书友群：750311226  <br/>', 'http://www.shuquge.com/files/article/image/139/139995/139995s.jpg', 1, 79590, 724160, 5.7);
INSERT INTO `t_book` VALUES (33, '2021-04-15 18:46:22', '2021-04-16 16:00:29', '师父修仙不渡劫', '书海一逍', 0, 1, '金丹要渡劫。    筑基要渡劫！    练气也要渡劫？    就连最基础的锻体都得渡六劫扛九雷。    穿越到天雷滚滚的世界，陆通能提前感知劫云变化，如何借机避雷长生？    那就先定一个大目标，广收门徒、传道授法，在每次天劫降临之前想尽办法消除劫云。    师父修仙，不渡天劫！  <br/>', 'http://www.shuquge.com/files/article/image/131/131783/131783s.jpg', 1, 819425, 324499, 9);
INSERT INTO `t_book` VALUES (34, '2021-04-15 18:46:25', '2021-04-16 16:00:23', '末日拼图游戏', '更从心', 0, 6, '你一觉醒来，发现自己来到了高塔末世，人类住进高塔，塔外都是怪物。    而你的眼睛里能够看到奇怪的备注：【一千六百米外藏着两只恶堕，你在极端愤怒时一记滑铲，能把它们喂的饱饱的。    】【在你想着蒸煮油炸之前，最好摸摸它的左侧口袋，千万不要养成杀怪不舔包的恶习。    】【居然会有人盯着自己的脸看，我承认你的脸很有带入感，假如我是人类的话，我可以给你打9分，当然了，我97分。    】【对方是一个等级比你高出太多的大佬，我给你三个建议，跪舔，跪舔，或者跪舔。    弱点？不应当，我只是一个能力有限的小备注。】象征末世明珠的高塔，被恶念吸引的塔外畸变怪物，上位者的赌局，探索者的险境，末日中的陷阱，在你的双眼下，都以调皮的风格呈现。  <br/>', 'http://www.shuquge.com/files/article/image/130/130756/130756s.jpg', 1, 1425253, 648012, 9.2);
INSERT INTO `t_book` VALUES (35, '2021-04-15 18:45:37', '2021-04-16 16:00:17', '重生之最强败家子', '香菜有毒', 0, 3, '下载客户端，查看完整作品简介。  <br/>', 'http://www.shuquge.com/files/article/image/139/139034/139034s.jpg', 1, 68417, 391743, 4.7);
INSERT INTO `t_book` VALUES (36, '2021-04-15 18:46:03', '2021-04-16 15:59:54', '都市超级神兵', '一味然', 0, 3, '为保全家族，父母蒙冤屈死，自己也被逼参军。戎马十年，非但没让楚沧惨死战场，反而还让他练就了一身绝技！    当楚沧踏出战营回归都市，这方天地，终将为之而颤动！  <br/>', 'http://www.shuquge.com/files/article/image/136/136821/136821s.jpg', 1, 315969, 611024, 5.6);
INSERT INTO `t_book` VALUES (37, '2021-04-15 18:46:45', '2021-04-16 15:59:50', '从零开始的富豪人生', '驾雾', 0, 3, '命运让事业成功的林启山，变成了一穷二白的少年。    不过还好，系统爸爸及时出现。    从今天开始当一名多才多亿的男神吧！    马术、赛车、飞行、帆船、品酒、乐器……掌握其中任意一项或多项，    每一项入门奖励一百万！    每一项熟练奖励一千万！    每一项精通奖励一个亿！    林启山赶紧查看自己的开车段位，感觉这趟怕是要起飞了！  <br/>', 'http://www.shuquge.com/files/article/image/136/136598/136598s.jpg', 1, 586133, 83777, 3.8);
INSERT INTO `t_book` VALUES (38, '2021-04-15 18:47:49', '2021-04-16 15:59:23', '大衍苍穹', '悟尘心', 0, 1, '她衍化沧蔺，因劫以身化道，他应劫而生，别人眼中的废体，却以妖孽之资，成就传奇，追溯身世，破劫救卿，征战苍宇，重衍沧蔺。  <br/>', 'http://www.shuquge.com/files/article/image/132/132745/132745s.jpg', 1, 1365759, 92535, 2.7);
INSERT INTO `t_book` VALUES (39, '2021-04-15 18:48:44', '2021-04-16 15:59:22', '繁星书士', '李昆仑', 0, 2, '悠悠青陆，禹禹独行，落落飞鸿，蓬莱渐翼。我就是求道之人，陆禹。  <br/>', 'http://www.shuquge.com/files/article/image/130/130091/130091s.jpg', 1, 1633335, 4186, 6.6);
INSERT INTO `t_book` VALUES (40, '2021-04-15 18:47:32', '2021-05-15 15:29:17', '大佬你不对劲', '彩笔明安', 0, 3, '袁雅被迫替嫁，嫁给传闻中已死掉的总裁盛辰逸。    成亲后，她才发现这个死鬼老公不但没死，活还特好！！    “媳妇儿，我病又犯了，快点帮我冶。”某男人不要脸的拍着胸口。    袁雅一根针扎过去，这一夜尖叫声传遍整个别墅。    次日，某总裁指着电脑上的数据哭唧唧：“媳妇儿，电脑被黑了，快帮帮为夫。”    某袁一巴掌拍过去，总裁的脑袋磕在电脑上，电脑好了……    直到有一天，袁雅觉得不对劲儿，为什么她的小马甲一个一个的都掉没了？可是她这便宜老公却怪怪的？  <br/>', 'http://www.shuquge.com/files/article/image/138/138469/138469s.jpg', 1, 429983, 246718, 0.5);
INSERT INTO `t_book` VALUES (41, '2021-04-15 18:48:56', '2021-05-15 15:28:57', '超能灵卡师', '雪花有罪', 0, 5, '一个属于灵卡师的时代。    【机械之心+深海结晶+玄铁&#61;战斗暴龙兽？】    【灵猴之心+紫檀铁棒+灵明石&#61;齐天大圣？】    【魔法之心+玛雅神杖+精灵球&#61;黑魔导女孩？】    当所有灵卡师绞尽脑汁闭关创造灵卡之时。    陈峰很严肃的在思考一个问题。    “还有哪个神兽没出来透透气来着？”    ————    PS：书友群679686345，另有百万完本作品《全能电竞系统》，人品保证，放心阅读。  <br/>', 'http://www.shuquge.com/files/article/image/134/134635/134635s.jpg', 1, 1809806, 649955, 0.8);
INSERT INTO `t_book` VALUES (42, '2021-04-15 18:48:05', '2021-05-15 15:28:45', '神豪从拒绝白富美开始', '暴躁疯', 0, 3, '当张闲面对白富美表白的时候，意外觉醒了正三观选择系统！    “抱歉，学姐！”    “我是一个有操守的人！”叮——恭喜获得兰博基尼Veneno一辆……  <br/>', 'http://www.shuquge.com/files/article/image/135/135957/135957s.jpg', 1, 591781, 128702, 0.2);
INSERT INTO `t_book` VALUES (43, '2021-04-15 18:48:50', '2021-05-15 15:27:51', '农门团宠小娇娘', '花期迟迟', 0, 1, '方圆儿穿越了，穿成了农家女。原本以为会是家徒四壁无依无靠的孤女人设，没想到爹娘疼，哥哥宠，成为全家团宠小娇娘！    还有外挂空间，能和花花草草们对话？那就建庄园，种梨花，预警旱涝和蝗灾，顺带做个预言家，带领全家致富！    但，谁能告诉她，为啥她肚里有个娃？  <br/>', 'http://www.shuquge.com/files/article/image/139/139631/139631s.jpg', 1, 1002469, 595747, 6);
INSERT INTO `t_book` VALUES (44, '2021-04-15 18:48:47', '2021-05-15 15:27:25', '桃源小农医', '崔家二少', 0, 3, '高大帅气的小农医文浩，凭借道医经传承，不但能医各种疑难杂症，还能破邪除煞，吊打各种不服；桃源村，山美人更美，帮着美女村长闫玥一起带领村民们一起发家致富，搞养殖，种大棚，视频直播把一个贫瘠的小山村打造成了一个富得流油的金山银山……  <br/>', 'http://www.shuquge.com/files/article/image/138/138016/138016s.jpg', 1, 805813, 160887, 1.9);
INSERT INTO `t_book` VALUES (45, '2021-04-15 18:49:58', '2021-05-15 15:27:16', '宋时雪', '雪山飞机', 0, 4, '李三坚，琼台儋州人氏，自幼父兄病亡，与母亲相依为命。为了摆脱家中贫困，走上了宋贡举之路。    李三坚只想让自己家人过上舒心的日子，可却一步步卷入了朝堂纷争，一步步的走上了一条荆棘之路，并亲眼见证了宋之繁荣、文明。    遽变将至，国之将亡，皮之不存，毛将焉附？国至危难，家又何存？李三坚为了自己家人......，为了如画家园免于虏骑的践踏，振臂而起，奋起与之抗争！    金戈铁马，气吞万里如虎！铁蹄纷沓，卷起千堆雪！战旗猎猎，风卷残云！    将军带甲沙场死，雄躯不倒拄剑笑！【展开】【收起】  <br/>', 'http://www.shuquge.com/files/article/image/115/115107/115107s.jpg', 1, 2007709, 695124, 2.4);
INSERT INTO `t_book` VALUES (46, '2021-04-15 18:49:30', '2021-05-15 15:26:40', '族谱太厚怎么办', '海鲜烧肉', 0, 2, '又名：《重生喊仇人叫爹怎么办》、《本老祖真的是好人啊》微黑暗、微冷血、无女主。    谦虚善良和蔼可亲的好老祖王多宝，带领着他占据天下八成人口的孝子贤孙们，展开了自己的复仇大计。    “嗯，想必你们也认为能为本老祖献出生命是一件很光荣的事情吧！”王多宝笑着说到，随后手起刀落……  <br/>', 'http://www.shuquge.com/files/article/image/134/134980/134980s.jpg', 1, 762753, 759396, 7.7);
INSERT INTO `t_book` VALUES (47, '2021-04-15 18:50:09', '2021-05-15 15:26:20', '全职镇守', '校区南门', 0, 3, '为了防止世界被破坏，为了守护宇宙的和平，我镇守一族的凡杨，对全宇宙宣布，不管你是仙神，还是妖魔鬼怪，一经发现有违规行为，将严惩不贷。  <br/>', 'http://www.shuquge.com/files/article/image/136/136651/136651s.jpg', 1, 1822432, 172414, 4.9);
INSERT INTO `t_book` VALUES (48, '2021-04-15 18:49:04', '2021-05-15 15:26:08', '我真的不想喷人啊', '严七官', 0, 1, '因为一次意外。林非凡穿越了。还自带了个奇怪的系统。需要变强就必须不停地喷人……看着一个个修真大能和王公贵族，林非凡清了清嗓子视死如归地开喷了……    “不是我林非凡针对某一个，而是在座的各位都是渣渣！”  <br/>', 'http://www.shuquge.com/files/article/image/138/138750/138750s.jpg', 1, 318367, 441263, 3.9);
INSERT INTO `t_book` VALUES (49, '2021-04-15 18:49:38', '2021-05-15 15:26:00', '金牌工具人', '八十分妈妈', 0, 5, '快穿文。    **********************    男主不爱女主怎么办？    水淼淼苦口婆心：“你俩天生一对，千万不要去祸害别人。”    女主要跟男二跑路怎么办？    水淼淼挺身而出：“放开那个男二，让我来！”    女主只想搞事业不想恋爱怎么办？    水淼淼语重心长：“成家立业，先成家再立业，听姐姐的准没错。”    女主不肯跟男二跑路怎么办？    水淼淼悍不畏死：“我拦着霸总，你们先撤。”    演戏，水淼淼很专业，当工具人，水淼淼更专业。  <br/>', 'http://www.shuquge.com/files/article/image/134/134879/134879s.jpg', 1, 595338, 832298, 0.3);
INSERT INTO `t_book` VALUES (50, '2021-04-15 18:51:20', '2021-05-15 15:25:41', '万古第一战神', '那时樱花开', 0, 1, '仙帝重生觉醒，再踏武道，我定斩杀辱我之人，天下无不在我脚下！  <br/>', 'http://www.shuquge.com/files/article/image/117/117693/117693s.jpg', 1, 2604980, 842274, 0.7);
INSERT INTO `t_book` VALUES (51, '2021-04-15 18:49:44', '2021-05-15 15:29:25', '知否知否，红楼可签到', '三元肘子', 0, 6, '都市白领林晴岚一觉醒来，就发现自己出现在了林黛玉从扬州去往贾府的船上，她的身份是林黛玉的庶女妹妹。    林黛玉去的是贾府，而她却是被自己的姨娘，临终托付给了一位长辈勇毅侯独女盛老太太，和盛明兰做了个伴。    身具签到系统，演绎庶女风流！  <br/>', 'http://www.shuquge.com/files/article/image/137/137512/137512s.jpg', 1, 420185, 512564, 0.1);
INSERT INTO `t_book` VALUES (52, '2021-04-15 18:49:56', '2021-05-15 15:29:39', '顶级气运，悄悄修炼千年', '任我笑', 0, 2, '转世来到修仙世界，韩绝发现自己带着游戏属性，竟然可以摇骰子刷新灵根资质与先天气运。    于是乎，他花了十一年摇先天气运。    【绝世无双：仙姿，魅力顶级】    【天命剑痴：剑道资质顶级，剑道悟性顶级】    【身法绝尘：身法资质顶级】    【仙帝后裔：获得一部绝世修仙功法、一千块上品灵石】    韩绝为了长生，决定悄悄修炼，不出风头。    千年后，修真界一代换一代。    当仙界清理凡间时，韩绝不得不出手。    他这才发现，好像仙神也不过如此！  <br/>', 'http://www.shuquge.com/files/article/image/138/138249/138249s.jpg', 1, 566835, 158244, 5.4);
INSERT INTO `t_book` VALUES (53, '2021-04-15 18:49:43', '2021-04-16 15:59:22', '诡异求生：开局获得百倍强化', '木子的蛙蛙', 0, 5, '【【起点国际·出海作品征文大赛】参赛作品】    全世界人类降临到诡异世界，每人一间小黑屋。    白天，请你尽快去寻找物资和辟邪之物，夜晚，最好呆在小黑屋，外面处处都是诡异。    夜晚，诡异来敲门，诡异规则将会把你笼罩。    第一夜，全世界遭遇诡异规则：诡吹灯，蜡烛熄灭了就会死。    苏原觉醒百倍强化的天赋，强化后的蜡烛，来吹啊！    屋里的诡异直接被吓走了。    夜晚的世界，到处都是宝箱，为什么不去？    怕死？    不怕，百倍强化后，咱有一百条命！    死一次算什么？  <br/>', 'http://www.shuquge.com/files/article/image/139/139919/139919s.jpg', 1, 73606, 393574, 1.7);
INSERT INTO `t_book` VALUES (54, '2021-04-15 18:55:35', '2021-04-16 15:59:21', '快穿之不服来战呀', '轩辕钢铁', 0, 5, '被    “悲天悯人救赎系统”绑定的靳青，被要求到各个世界拯救目标人物。虽然觉得自己每活一天都是在造孽，但既然找不到机会自我了断，那就顽强的活下去吧！    我们的目标是：凭借自己力大无穷的属性，让每个世界来找茬的人都不自在。    面对在各个世界都会出现的找死型人物，靳青掏出自己那1米3的狼牙棒：不服来战！    ！！确定无CP，坚决不攻略！  <br/>', 'http://www.shuquge.com/files/article/image/128/128354/128354s.jpg', 1, 4393769, 53718, 4.5);
INSERT INTO `t_book` VALUES (55, '2021-04-15 18:50:51', '2021-04-16 15:59:19', '女教授的日常小男友', '一吻余生', 0, 6, '季某人一生中曾经喝醉过两次酒，然后两次误入神秘莫测的女厕所，最后被同一个女人捶爆了狗头。  <br/>', 'http://www.shuquge.com/files/article/image/133/133724/133724s.jpg', 1, 840705, 478464, 9.3);
INSERT INTO `t_book` VALUES (56, '2021-04-15 18:52:07', '2021-04-16 15:59:12', '开局从召唤诸天崛起', '吉祥小猪', 0, 2, '【召唤流】【争霸流】【不圣母】【杀伐果断】    世家作乱，逆臣谋反；万年皇朝，分崩离析。    覆灭就在顷刻间！    值此之时，秦无痕穿越而来，重生成为当朝太子，并激活了诸天召唤系统……    “即日起，我大夏天威，将遍布神州、乃至九天仙界任何一个角落！”    吕布：“奉先愿为陛下开疆扩土，横扫宇内！”    项羽：“力拔山兮气盖世！尔等记好了，吾乃大夏霸王！”    …    叶天帝：“吾大夏降临，当盖压万古，横推世间一切敌！”    萧炎：“三十年河西，三十年河东……说错台词，重来：域外邪魔，也敢犯我大夏，杀！”    法海：“雕虫小技还敢在老衲面前班门弄斧，大威天龙！”    …    …    孙悟空：“大胆妖孽，吃俺老孙一棒！”    通天教主：“道友可敢进诛仙剑阵一战！”    鸿钧：“凡阳光所照之地，皆为夏土；有生灵存在之域，皆为陛下统辖！”    ………………    本书又名《大夏天庭》《异界召唤之无上帝君》  <br/>', 'http://www.shuquge.com/files/article/image/128/128178/128178s.jpg', 1, 2101220, 607373, 6.1);
INSERT INTO `t_book` VALUES (57, '2021-04-15 18:51:25', '2021-04-16 15:59:12', '大宋安乐侯', '马来福', 0, 4, '“娘，儿子只想一世平安快乐，便知足了。”范宇拱手说道。    “好好好，我这便让官家，赐我儿一生富贵。”李太后笑意漾然的哄道。    仁宗皇帝赵祯黑脸默然不语，怀疑自己是不是亲生的。  <br/>', 'http://www.shuquge.com/files/article/image/128/128219/128219s.jpg', 1, 1025436, 233916, 2.1);
INSERT INTO `t_book` VALUES (58, '2021-04-15 18:50:44', '2021-04-16 15:59:11', '夫人你的人设翻车了', '木木酱紫呀', 0, 3, '京都圈里的最近都在传一件事，听说四大豪门苏家从小丢失的女儿回来了。    有人不屑，一个村姑罢了，难不成还反了天。    没想到。    苏父：“谁敢欺负我女儿，就是看不起我们苏家。    ”京都少爷叶秦川：“那是我的未婚妻，敢惹她，想灭门？”    跌破众人眼睛没想到，被京都叶少护着的女人竟然是一位隐形大佬。    黑客、神医、书法、音乐，大佬都会“一点。    ”只不过大佬所谓的一点和我们所知的一点相差万里。  <br/>', 'http://www.shuquge.com/files/article/image/137/137267/137267s.jpg', 1, 440901, 978062, 5.4);
INSERT INTO `t_book` VALUES (59, '2021-04-15 18:51:54', '2021-05-16 23:03:02', '太初剑仙', '狗米饭', 1, 1, '荒芜之地，青山学院，少年叶轻尘在后山修炼偶然捡到重伤昏迷的神秘女子。    女子的身份，魔道的至宝，强敌接踵而至！  <br/>', 'http://www.shuquge.com/files/article/image/137/137132/137132s.jpg', 2, 579659, 477969, 2.8);
INSERT INTO `t_book` VALUES (60, '2021-04-15 18:51:33', '2021-05-15 15:30:47', '回到三国当伙夫', '三国伙夫', 0, 4, '刘浩穿越到东汉末年，成为曹营的一个伙夫。靠着系统签到度日。    可是最近这伙房中来了一群奇怪的人。    老典:刘兄，这张绣真的投降了!    老荀:刘兄，你这曲辕犁造福百姓，彧在这里代天下百姓谢过了!    老许:刘兄，赵云是谁?    老郭:刘兄，郭某这病?    老曹:哈哈，我得伙夫刘浩，乃得天下啊!    刘浩:低调低调，我只是个小小的伙夫!  <br/>', 'http://www.shuquge.com/files/article/image/140/140036/140036s.jpg', 1, 169078, 278644, 5.4);
INSERT INTO `t_book` VALUES (61, '2021-04-15 18:52:52', '2021-05-15 15:30:33', '孤才不要做太子', '抉望', 0, 4, '穿越唐朝，成为太子李承乾。是谨守本心，放弃太子之位，追求自由，还是顺应时势，以一己微小之力，撬动封建王朝的腐朽？    承乾陷入了思考....  <br/>', 'http://www.shuquge.com/files/article/image/130/130800/130800s.jpg', 1, 1797162, 992618, 7.7);
INSERT INTO `t_book` VALUES (62, '2021-04-15 18:53:56', '2021-05-15 15:30:22', '我在冥王星上做巨巨', '韶华呓语', 0, 1, '我终归是我，不甘心黯淡一生的鬼火！其实，不认命不服输的人都是一颗冥王星，虽遭受命运的不公，却宁弯不折，渐次蓄力，逆天改命！  <br/>', 'http://www.shuquge.com/files/article/image/135/135456/135456s.jpg', 1, 1623353, 351890, 6.7);
INSERT INTO `t_book` VALUES (63, '2021-04-15 18:52:48', '2021-05-15 15:30:18', '高阳', '安知', 0, 2, '“你听说过苍梧吗？”    “万物的终点是神明，那神明的最终归宿呢？”    “冥国的光辉就在那片大幕上，点点烁烁。”    “我曾听人讲过许多道理，但最后还是觉得自己最有道理。”  <br/>', 'http://www.shuquge.com/files/article/image/132/132696/132696s.jpg', 1, 700645, 752363, 7.6);
INSERT INTO `t_book` VALUES (64, '2021-04-15 18:55:42', '2021-05-15 15:29:59', '凤凰珞', '停不了的歌声', 0, 2, '平平无奇小女主一枚，拯救苍生的重任……扛不动！  <br/>', 'http://www.shuquge.com/files/article/image/121/121395/121395s.jpg', 1, 2443080, 127873, 4.8);
INSERT INTO `t_book` VALUES (65, '2021-04-15 18:54:16', '2021-05-15 15:25:19', '大宋有种', '大罗罗', 0, 4, '大宋宣和七年末。    大金铁骑正在黄河北岸疾驰向南，东京汴梁，已经危如巢卵。    一代青楼天子，道君皇帝，已经吓瘫在了龙床之上，只想着抛却亿万斯民，退位跑路。    精忠岳飞，尚蛰伏于行伍之列，看着神洲陆沉，气得怒发冲冠。    两宋之交间的风云人物们，还不知道自己何时可以崭露头角。    也就在这时，赵楷魂穿而来，带着他的满腔热血和四大兵法，变成了才华横溢的大宋郓王赵楷。    随着赵楷一声大吼：“父皇别跑，儿臣有种。”    大宋有种的故事就此展开！    读者群号：959444276  <br/>', 'http://www.shuquge.com/files/article/image/131/131592/131592s.jpg', 1, 1624202, 658337, 2.1);
INSERT INTO `t_book` VALUES (66, '2021-04-15 18:58:14', '2021-04-15 18:58:14', '都跟', '梦入神机', 0, 1, 'aaa', '/images/default.gif', 1, 6, 357557, 6.7);

-- ----------------------------
-- Table structure for t_book_index
-- ----------------------------
DROP TABLE IF EXISTS `t_book_index`;
CREATE TABLE `t_book_index`  (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `chapter` int unsigned NOT NULL COMMENT '小说章节',
  `book_id` int unsigned NOT NULL COMMENT '小说ID',
  `word_count` int unsigned NOT NULL COMMENT '章节字数',
  `title` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '章节名',
  `status` tinyint unsigned NOT NULL COMMENT '状态:0草稿，1发布',
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '章节内容',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_bookid_title`(`book_id`, `title`) USING BTREE,
  INDEX `idx_bookid_utime`(`book_id`, `update_time`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  CONSTRAINT `fk_index_book` FOREIGN KEY (`book_id`) REFERENCES `t_book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '小说目录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_book_index
-- ----------------------------
INSERT INTO `t_book_index` VALUES (1, '2021-05-10 01:34:08', '2023-12-14 11:16:16', 0, 1, 8, '第一章 绯红', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (4, '2021-05-10 01:34:12', '2023-12-14 11:16:16', 0, 1, 4, '第五章 jaoefjiefo', 0, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (7, '2021-05-10 01:34:34', '2023-12-14 11:16:16', 0, 1, 1, '第二章 ajfoej就就efjijajaefefefef', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (9, '2021-05-10 01:33:28', '2023-12-14 11:16:16', 0, 1, 1, '第三章', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (10, '2021-05-10 01:34:51', '2023-12-14 11:16:16', 0, 1, 3319, '第四章 占卜', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (11, '2021-05-10 01:33:47', '2023-12-14 11:16:16', 0, 1, 1, '第六章', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (12, '2021-05-16 23:03:01', '2023-12-14 11:16:16', 0, 59, 2884, '第一章 凡胎圣体', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (14, '2021-05-17 01:51:26', '2023-12-14 11:16:16', 0, 2, 3333, '第五十四章 计划通，开工！', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (15, '2021-05-17 01:54:51', '2023-12-14 11:16:16', 0, 3, 2674, '第五十八章 天空之城', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (16, '2021-05-17 01:57:04', '2023-12-14 11:16:16', 0, 4, 3524, '第一百二十四章 猩球大战', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (17, '2021-05-17 02:00:15', '2023-12-14 11:16:16', 0, 10, 6301, ' 第一〇八二章 乱·战', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (19, '2021-05-17 02:18:06', '2023-12-14 11:16:16', 0, 11, 2438, '第一章 夙愿', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (20, '2021-05-17 02:38:57', '2023-12-14 11:16:16', 0, 11, 5, '第二章 变故', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (21, '2021-05-17 02:39:41', '2023-12-14 11:16:16', 0, 11, 5, '第三章 斗法', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (22, '2021-05-17 02:39:51', '2023-12-14 11:16:16', 0, 11, 5, '第四章 暖玉', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (23, '2021-05-17 02:39:57', '2023-12-14 11:16:16', 0, 11, 5, '第五章 云来', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (24, '2021-05-17 02:40:07', '2023-12-14 11:16:16', 0, 11, 5, '第六章 苍芜', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (25, '2021-05-17 02:40:16', '2023-12-14 11:16:16', 0, 11, 5, '第七章 谜团', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (26, '2021-05-17 02:40:24', '2023-12-14 11:16:16', 0, 11, 5, '第八章 往事', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (27, '2021-05-17 02:40:31', '2023-12-14 11:16:16', 0, 11, 5, '第九章 拜师', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (28, '2021-05-17 02:40:38', '2023-12-14 11:16:16', 0, 11, 5, '第十章 入门', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (29, '2021-05-17 02:40:46', '2023-12-14 11:16:16', 0, 11, 6, '第十一章 苍洱', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (30, '2021-05-17 02:40:56', '2023-12-14 11:16:16', 0, 11, 7, '第十二章 水晶盏', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (31, '2021-05-17 02:41:13', '2023-12-14 11:16:16', 0, 11, 7, '第十三章 云与泥', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (32, '2021-05-17 02:41:20', '2023-12-14 11:16:16', 0, 11, 6, '第十四章 巨狼', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (33, '2021-05-17 02:41:29', '2023-12-14 11:16:16', 0, 11, 6, '第十五章 浅墨', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (34, '2021-05-17 02:41:37', '2023-12-14 11:16:16', 0, 11, 6, '第十六章 玄术', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (35, '2021-05-17 02:41:44', '2023-12-14 11:16:16', 0, 11, 6, '第十七章 修炼', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (36, '2021-05-17 02:41:50', '2023-12-14 11:16:16', 0, 11, 6, '第十八章 不甘', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (37, '2021-05-17 02:41:59', '2023-12-14 11:16:16', 0, 11, 6, '第十九章 飞瀑', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (38, '2021-05-17 02:42:06', '2023-12-14 11:16:16', 0, 11, 6, '第二十章 三年', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (39, '2021-05-17 02:42:16', '2023-12-14 11:16:16', 0, 11, 7, '第二十一章 少女', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (40, '2021-05-17 02:42:21', '2023-12-14 11:16:16', 0, 11, 7, '第二十二章 善缘', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (41, '2021-05-17 02:42:37', '2023-12-14 11:16:16', 0, 11, 7, '第二十三章 独白', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (42, '2021-05-17 02:42:45', '2023-12-14 11:16:16', 0, 11, 7, '第二十四章 情愫', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (43, '2021-05-17 02:42:51', '2023-12-14 11:16:16', 0, 11, 7, '第二十五章 断尘', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (44, '2021-05-17 02:42:57', '2023-12-14 11:16:16', 0, 11, 7, '第二十六章 挑衅', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (45, '2021-05-17 02:43:05', '2023-12-14 11:16:16', 0, 11, 7, '第二十七章 奇才', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (46, '2021-05-17 02:43:12', '2023-12-14 11:16:16', 0, 11, 7, '第二十八章 前夕', 1, '<这里填写该章节内容>');
INSERT INTO `t_book_index` VALUES (47, '2021-05-17 02:43:20', '2021-05-17 02:43:20', 0, 11, 7, '第二十九章 名册', 1, NULL);
INSERT INTO `t_book_index` VALUES (48, '2021-05-17 02:43:26', '2021-05-17 02:43:26', 0, 11, 6, '第三十章 历练', 1, NULL);
INSERT INTO `t_book_index` VALUES (49, '2021-05-17 02:43:33', '2021-05-17 02:43:33', 0, 11, 7, '第三十一章 黑影', 1, NULL);
INSERT INTO `t_book_index` VALUES (50, '2021-05-17 02:43:40', '2021-05-17 02:43:40', 0, 11, 7, '第三十二章 妖袭', 1, NULL);
INSERT INTO `t_book_index` VALUES (51, '2021-05-17 02:43:48', '2021-05-17 02:43:48', 0, 11, 7, '第三十三章 商封', 1, NULL);
INSERT INTO `t_book_index` VALUES (52, '2021-05-17 02:43:56', '2021-05-17 02:43:56', 0, 11, 7, '第三十四章 击杀', 1, NULL);
INSERT INTO `t_book_index` VALUES (53, '2021-05-17 02:44:03', '2021-05-17 02:44:03', 0, 11, 7, '第三十五章 聆听', 1, NULL);
INSERT INTO `t_book_index` VALUES (54, '2021-05-17 02:44:16', '2021-05-17 02:44:16', 0, 11, 7, '第三十六章 紫烟', 1, NULL);
INSERT INTO `t_book_index` VALUES (55, '2021-05-17 02:44:22', '2021-05-17 02:44:22', 0, 11, 7, '第三十七章 昊天', 1, NULL);
INSERT INTO `t_book_index` VALUES (56, '2021-05-17 02:44:29', '2021-05-17 02:44:29', 0, 11, 7, '第三十八章 朦胧', 1, NULL);
INSERT INTO `t_book_index` VALUES (57, '2021-05-17 02:44:40', '2021-05-17 02:44:40', 0, 11, 7, '第三十九章 冲突', 1, NULL);

-- ----------------------------
-- Table structure for t_book_setting
-- ----------------------------
DROP TABLE IF EXISTS `t_book_setting`;
CREATE TABLE `t_book_setting`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `book_id` int unsigned NOT NULL COMMENT '小说ID',
  `type` tinyint unsigned NOT NULL COMMENT '类型，1：轮播图，2：本周强推，3：热门推荐，4：精品推荐',
  `sort` tinyint unsigned COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_setting_book`(`book_id`) USING BTREE,
  CONSTRAINT `fk_setting_book` FOREIGN KEY (`book_id`) REFERENCES `t_book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '首页小说推荐表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_book_setting
-- ----------------------------
INSERT INTO `t_book_setting` VALUES (1, '2021-05-16 15:33:04', '2021-05-16 15:34:21', 3, 1, 0);
INSERT INTO `t_book_setting` VALUES (2, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 55, 1, 1);
INSERT INTO `t_book_setting` VALUES (3, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 13, 1, 2);
INSERT INTO `t_book_setting` VALUES (4, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 34, 1, 3);
INSERT INTO `t_book_setting` VALUES (5, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 18, 2, 4);
INSERT INTO `t_book_setting` VALUES (6, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 33, 2, 5);
INSERT INTO `t_book_setting` VALUES (7, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 29, 2, 6);
INSERT INTO `t_book_setting` VALUES (8, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 22, 2, 7);
INSERT INTO `t_book_setting` VALUES (9, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 46, 2, 8);
INSERT INTO `t_book_setting` VALUES (10, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 61, 2, 9);
INSERT INTO `t_book_setting` VALUES (11, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 14, 3, 10);
INSERT INTO `t_book_setting` VALUES (12, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 63, 3, 11);
INSERT INTO `t_book_setting` VALUES (13, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 27, 3, 12);
INSERT INTO `t_book_setting` VALUES (14, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 1, 3, 13);
INSERT INTO `t_book_setting` VALUES (15, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 62, 3, 14);
INSERT INTO `t_book_setting` VALUES (16, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 66, 3, 15);
INSERT INTO `t_book_setting` VALUES (17, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 39, 4, 16);
INSERT INTO `t_book_setting` VALUES (18, '2021-05-16 15:33:04', '2021-05-16 15:33:04', 4, 4, 17);
INSERT INTO `t_book_setting` VALUES (19, '2021-05-16 15:33:05', '2021-05-16 15:33:05', 2, 4, 18);
INSERT INTO `t_book_setting` VALUES (20, '2021-05-16 15:33:05', '2021-05-16 15:33:05', 10, 4, 19);
INSERT INTO `t_book_setting` VALUES (21, '2021-05-16 15:33:05', '2021-05-16 15:33:05', 11, 4, 20);
INSERT INTO `t_book_setting` VALUES (22, '2021-05-16 15:33:05', '2021-05-16 15:33:05', 23, 4, 21);

-- ----------------------------
-- Table structure for t_booklist
-- ----------------------------
DROP TABLE IF EXISTS `t_booklist`;
CREATE TABLE `t_booklist`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `user_id` int unsigned NOT NULL COMMENT '用户ID',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '书单名',
  `introduction` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '书单简介',
  `visit_count` bigint unsigned COMMENT '总点击量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userid`(`user_id`) USING BTREE,
  CONSTRAINT `fk_booklist_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户书单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_bookshelf
-- ----------------------------
DROP TABLE IF EXISTS `t_bookshelf`;
CREATE TABLE `t_bookshelf`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `user_id` int unsigned NOT NULL COMMENT '用户ID',
  `book_id` int unsigned NOT NULL COMMENT '小说ID',
  `reading_process` tinyint unsigned NOT NULL COMMENT '阅读进度：1正在追看，2养肥待看，3已经看过',
  `reading_history_id` int unsigned COMMENT '上次阅读章节ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_userid_bookid`(`user_id`, `book_id`) USING BTREE,
  INDEX `fk_shelf_user`(`user_id`) USING BTREE,
  INDEX `fk_shelf_book`(`book_id`) USING BTREE,
  CONSTRAINT `fk_shelf_book` FOREIGN KEY (`book_id`) REFERENCES `t_book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_shelf_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户书架' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_bookshelf
-- ----------------------------
INSERT INTO `t_bookshelf` VALUES (14, '2021-04-30 23:33:43', '2023-12-20 14:23:20', 5, 3, 2, NULL);
INSERT INTO `t_bookshelf` VALUES (23, '2021-05-13 21:29:48', '2021-05-13 21:29:48', 5, 4, 2, NULL);
INSERT INTO `t_bookshelf` VALUES (25, '2021-05-13 21:30:18', '2021-05-20 00:06:28', 6, 2, 3, 10);
INSERT INTO `t_bookshelf` VALUES (28, '2021-05-16 22:30:30', '2021-05-16 22:30:30', 5, 63, 2, NULL);
INSERT INTO `t_bookshelf` VALUES (58, '2021-05-18 20:49:56', '2021-05-18 20:49:56', 6, 11, 2, 19);
INSERT INTO `t_bookshelf` VALUES (59, '2023-12-15 10:27:35', '2023-12-15 10:27:35', 5, 62, 1, NULL);

-- ----------------------------
-- Table structure for t_boolist_book
-- ----------------------------
DROP TABLE IF EXISTS `t_boolist_book`;
CREATE TABLE `t_boolist_book`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `booklist_id` int unsigned NOT NULL COMMENT '书单ID',
  `book_id` int unsigned NOT NULL COMMENT '小说ID',
  `recommendation` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '小说推荐语',
  `book_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '（冗余）小说名',
  `book_author` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '（冗余）作者名',
  `word_count` int(0) DEFAULT NULL COMMENT '（冗余）小说字数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_list_booklist`(`booklist_id`) USING BTREE,
  INDEX `fk_list_book`(`book_id`) USING BTREE,
  CONSTRAINT `fk_list_book` FOREIGN KEY (`book_id`) REFERENCES `t_book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_list_booklist` FOREIGN KEY (`booklist_id`) REFERENCES `t_booklist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '书单小说关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_carousel
-- ----------------------------
DROP TABLE IF EXISTS `t_carousel`;
CREATE TABLE `t_carousel`  (
  `id` int(0) NOT NULL COMMENT '编号',
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '轮播图',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '跳转地址',
  `create_time` timestamp(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_carousel
-- ----------------------------
INSERT INTO `t_carousel` VALUES (1, 'https://th.bing.com/th/id/OIP.nA5lY6lewj0XnPnZiz2URQHaDe?w=305&h=164&c=7&r=0&o=5&dpr=1.5&pid=1.7', '/', '2023-11-15 11:22:22', '2023-11-15 11:22:25');
INSERT INTO `t_carousel` VALUES (2, 'https://th.bing.com/th/id/OIP.Dvq-OBFveJlROrlhsbeOeQHaDX?w=340&h=159&c=7&r=0&o=5&dpr=1.5&pid=1.7', '/', '2023-11-15 11:22:59', '2023-11-15 11:23:01');
INSERT INTO `t_carousel` VALUES (3, 'https://th.bing.com/th/id/OIP.iXw1u6ecnPr4DNpjiHQXjAHaDH?w=298&h=147&c=7&r=0&o=5&dpr=1.5&pid=1.7', '/', '2023-11-15 11:24:06', '2023-11-15 11:24:09');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '小说分类',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '小说分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (1, '2021-04-25 04:29:37', '2021-04-25 04:29:37', '玄幻奇幻');
INSERT INTO `t_category` VALUES (2, '2021-04-25 04:30:08', '2021-05-16 01:01:48', '武侠仙侠');
INSERT INTO `t_category` VALUES (3, '2021-04-25 04:30:18', '2021-05-16 01:01:50', '都市言情');
INSERT INTO `t_category` VALUES (4, '2021-04-25 04:30:25', '2021-05-16 01:01:55', '历史军事');
INSERT INTO `t_category` VALUES (5, '2021-04-25 04:30:34', '2021-05-16 01:02:01', '科幻灵异');
INSERT INTO `t_category` VALUES (6, '2021-04-25 04:30:49', '2021-05-16 01:02:09', '网游竞技');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `resource_type` tinyint unsigned NOT NULL COMMENT '目标资源类型：小说，书单',
  `resource_id` int unsigned NOT NULL COMMENT '目标资源ID',
  `user_id` int unsigned NOT NULL COMMENT '本评论发出者用户ID',
  `content` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论内容',
  `star` tinyint unsigned NOT NULL COMMENT '评分（五分制）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_rtype_rid_userid`(`resource_type`, `resource_id`, `user_id`) USING BTREE,
  INDEX `fk_comment_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '评价表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (5, '2021-05-12 03:04:44', '2023-12-21 14:37:29', 1, 3, 5, '又名', 4);
INSERT INTO `t_comment` VALUES (7, '2021-05-14 04:05:42', '2023-12-21 09:58:16', 1, 4, 5, '一点点把78', 4);
INSERT INTO `t_comment` VALUES (9, '2021-05-18 19:34:36', '2023-12-21 09:58:17', 1, 11, 5, '干草+', 4);
INSERT INTO `t_comment` VALUES (10, '2021-05-18 19:37:16', '2023-12-21 09:58:20', 1, 11, 6, '沙发', 4);
INSERT INTO `t_comment` VALUES (12, '2023-12-21 11:23:05', '2023-12-21 11:23:05', 1, 3, 5, '好书！五星好评', 5);

-- ----------------------------
-- Table structure for t_comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_reply`;
CREATE TABLE `t_comment_reply`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `resource_type` tinyint unsigned NOT NULL COMMENT '目标资源类型：小说，书单',
  `resource_id` int unsigned NOT NULL COMMENT '目标资源ID',
  `pid` int unsigned NOT NULL COMMENT '回复的父ID：0表示评论，其他均为回复',
  `from_user_id` int unsigned NOT NULL COMMENT '本评论/回复的发出者用户ID',
  `to_user_id` int unsigned COMMENT '本评论/回复的目标用户ID，评论为null，当from=to即对评论的回复',
  `content` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '评论/回复内容',
  `from_user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '（冗余）本评论/回复的发出者用户名',
  `from_user_avater` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '（冗余）本评论/回复的发出者用户头像',
  `to_user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '（冗余）本评论/回复的目标用户用户名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_type_resourceid_fromuserid`(`resource_type`, `resource_id`, `from_user_id`) USING BTREE,
  INDEX `fk_reply_fromuser`(`from_user_id`) USING BTREE,
  INDEX `fk_reply_touser`(`to_user_id`) USING BTREE,
  CONSTRAINT `fk_reply_fromuser` FOREIGN KEY (`from_user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_reply_touser` FOREIGN KEY (`to_user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '评价/回复表\r\nTODO:使用触发器维护用户头像，用户名字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `user_id` int unsigned NOT NULL COMMENT '用户ID',
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息体',
  `done` tinyint unsigned COMMENT '是否已经处理：0未处理，1已处理',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_feedback_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_feedback_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户反馈' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES (1, '2021-05-16 05:16:36', '2023-12-28 16:01:16', 5, 'XXX小说有错', 1);
INSERT INTO `t_feedback` VALUES (3, '2021-05-16 05:17:14', '2023-12-28 16:01:17', 5, 'XXX言论不当', 1);
INSERT INTO `t_feedback` VALUES (4, '2021-05-16 05:46:30', '2023-12-29 10:02:31', 5, '', 2);

-- ----------------------------
-- Table structure for t_like
-- ----------------------------
DROP TABLE IF EXISTS `t_like`;
CREATE TABLE `t_like`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `resouce_type` int unsigned NOT NULL COMMENT '资源类型',
  `resource_id` int unsigned NOT NULL COMMENT '资源ID',
  `user_id` int unsigned COMMENT '用户ID',
  `like` tinyint unsigned NOT NULL COMMENT '喜欢或踩',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_type_rid_uid`(`resouce_type`, `resource_id`, `user_id`) USING BTREE,
  INDEX `fk_like_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_like_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '点赞踩表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `title` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '标题',
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '消息体',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '站内消息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (2, '2021-04-28 03:14:35', '2023-12-14 14:07:46', '【公告】欢迎来到汤圆书屋！', '用户享有言论自由的权利，但为了构建一个健康文明的网络环境，净化网络空间，请进入“刺猬猫”的用户，严格遵守以下规定：\n\n1、本版以交流、讨论为主。触犯包括但不限于构成以下情节，及诽谤、谩骂、造谣等进行人身攻击的，灌水、广告、非法链接等无实质内容的，以及从事非法商业活动的。一律进行删帖、禁言等处理。情节严重者，将进行封号处理。\n\n2、用户发表的不得违反《计算机信息网络国际联网安全保护管理办法》、《互联网信息服务管理办法》、《互联网电子公告服务管理规定》、《维护互联网安全的决定》、《互联网新闻信息服务管理规定》等相关法律规定。如有触犯，将一律进行永久封号处理。情节严重者，将承担法律责任。\n\n3、用户的个人信息受到保护，不接受任何个人或单位的查询。但国家机关依法查询除外，用户的个人设置公开除外。\n\n4、除重大活动或确有必要外，本版禁止交流一切聊天工具帐号，包括但不限于QQ号、QQ群、飞信号、微信号、微博号、邮箱地址等等。一切联络途径以论坛留言或网站私信为主。\n\n5、用户在论坛行为，若出现下列情况任意一种或几种，将承担包括被关闭全部或者部分权限、被暂停或被删除其帐号的后果，情节严重的，还将承担相应的法律责任。\n\n    1）使用不雅或不恰当ID和昵称；\n\n    2）发表含有猥亵、色情、人身攻击和反政府言论等非法或侵权言论的；\n\n    3）涉及反动、色情的头像、签名档和发布不良内容的；\n\n    4）模仿刺猬猫管理人员ID或者他人ID，用以假冒管理人员或破坏管理人员形象；\n\n    5）使用发贴机等非法软件进行刷屏、违规发贴的行为。\n\n    6）其他管理员认为不恰当的情况。\n\n6、对于其他内容，管理将遵循规则和惯例，凡规则有明确规定者，从其规定；规则没有规定或不够明确的，依循习惯和先例进行管理。\n\n7、本版块属于交流讨论版块平台，用户发帖仅代表其个人观点，与刺猬猫无关。对于用户言论的真实性引发的全部责任，由用户自行承担，本网站不承担任何责任。\n\n8、管理员有权取消违规用户在本区域的发言权，并无需向其通报。情况严重的可提请全区封杀、注销ID和封锁IP直至依法报警。');
INSERT INTO `t_notice` VALUES (3, '2021-05-17 03:10:24', '2023-12-14 14:07:31', '【公告】网站维护公告', '各位客户您们好：\n    本网站定于2021年3月29日12：00至2021年3月31日19：：00进行网站维护，届时，本网站的访问和部分服务可能受到影响，由此给您带来的不便，敬请谅解。\n    特此通知。\n                                                                                                                                 摸鱼小说网');
INSERT INTO `t_notice` VALUES (4, '2021-05-17 03:13:51', '2021-05-17 03:13:51', '【公告】“五一”期间疫情防控温馨提示', '4月28日，教育部印发通知部署各地教育部门和学校统筹做好2021年“五一”假期期间师生出行和校园疫情防控。\n\n　　通知指出，要正确认识疫情防控形势。“五一”假期来临，各地教育部门和学校要高度重视“五一”假期疫情防控，坚持常态化精准防控和应急处置相结合，巩固拓展疫情防控成果，确保广大师生安全快乐度假。\n\n　　通知强调，要切实强化旅途防护指导。各地教育部门和学校要教育引导师生遵守学校所在地和出行目的地疫情防控规定，践行勤洗手、常通风、戴口罩、少聚集等公民防疫基本行为准则。多形式多渠道教育引导师生做好旅途防护，主动配合交通场站做好体温检测、查验“健康码”等防控措施，乘坐交通工具时全程戴口罩。\n\n　　通知要求，要有力保障留校师生假期生活需要。各地教育部门和学校要强化校园服务供给，开放教室、图书馆、实验室和体育场馆等，充分保障留校师生学习、工作和生活需求。加强校园安全管理，确保师生身心健康、校园和谐稳定。\n\n　　通知强调，要严格落实常态化疫情防控举措。各地教育部门和学校要落实国家卫生健康委、教育部印发的《关于印发高等学校、中小学校、托幼机构春季学期新冠肺炎疫情防控技术方案（第三版）的通知》，加强“五一”假期期间校园活动疫情防控。坚持“人”“物”和环境同查、同防，多病共防，加强来访人员登记和体温检测，按照“早预防、早发现、早报告、早隔离、早治疗”要求，全面细致落实校园常态化疫情防控举措。\n\n　　通知要求，要分类加强健康监测。各地教育部门和学校要坚持“日报告”“零报告”制度，动态精准掌握师生健康状况和出行去向，做到留校人数、离校行程轨迹等健康管理信息底数清、情况明。引导师生主动加强健康监测，如发现疑似症状，及时向社区（村）和学校报告，并到具有发热门诊（诊室）的医疗机构就诊。\n\n　　通知强调，要认真做好值班值守与应急准备。各地教育部门和学校要认真履行防控责任，加强“五一”假期值班值守，确保疫情防控领导体制、应急机制、指挥体系正常运行。要完善应急预案，做好口罩、洗手液、消毒剂、非接触式温度计等防疫物资储备。一旦出现新冠肺炎病例，迅速启动应急预案并做好处置。');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '2021-04-25 03:14:17', '2021-04-25 03:14:17', 'admin');
INSERT INTO `t_role` VALUES (2, '2021-04-25 03:14:29', '2021-04-25 03:14:29', 'reader');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int unsigned NOT NULL COMMENT '主键ID',
  `create_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '头像url',
  `sex` tinyint unsigned COMMENT '性别：0男，1女',
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '邮件',
  `mobile` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint unsigned COMMENT '状态：0禁用，1可用',
  `role_id` int unsigned COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_username`(`username`) USING BTREE,
  INDEX `fk_user_role`(`role_id`) USING BTREE,
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (5, '2021-05-14 02:20:49', '2021-05-18 14:37:55', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'https://img.youxi369.com/article/contents/2021/02/10/small_20210210112721737.jpeg', 1, 'admin@qq.com', '13286181873', 1, 1);
INSERT INTO `t_user` VALUES (6, '2021-05-14 01:03:11', '2021-05-18 14:36:05', 'zhangsan', '01d7f40760960e7bd9443513f22ab9af', 'https://i.pinimg.com/originals/ce/10/81/ce10818cef2696f7445bd0673c51d1ba.png', 0, 'zhangsan@qq.com', '13286181879', 1, 1);
INSERT INTO `t_user` VALUES (7, '2021-05-14 01:04:05', '2021-05-14 01:04:05', 'like', 'be1ab1632e4285edc3733b142935c60b', NULL, 0, 'aief@qq.com', '13546545313', 1, 2);
INSERT INTO `t_user` VALUES (8, '2021-05-14 01:04:23', '2021-05-14 01:04:23', '李四', 'dc3a8f1670d65bea69b7b65048a0ac40', NULL, 1, 'lisi@qq.com', '13286181872', 1, 2);
INSERT INTO `t_user` VALUES (9, '2021-05-15 13:28:27', '2021-05-15 13:29:42', 'admin1', 'e00cf25ad42683b3df678c61f42c6bda', NULL, 0, 'admin1@qq.com', '13245784212', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
