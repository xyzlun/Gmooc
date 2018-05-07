/*
Navicat MySQL Data Transfer

Source Server         : my_SQL
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : mxonline

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-05-07 17:30:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 用户信息', '7', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 用户信息', '7', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 用户信息', '7', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 邮箱验证码', '8', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 邮箱验证码', '8', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 邮箱验证码', '8', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 轮播图', '9', 'add_banner');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 轮播图', '9', 'change_banner');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 轮播图', '9', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 课程', '10', 'add_course');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 课程', '10', 'change_course');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 课程', '10', 'delete_course');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 章节', '11', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 章节', '11', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 章节', '11', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 视频', '12', 'add_video');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 视频', '12', 'change_video');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 视频', '12', 'delete_video');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 课程资源', '13', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 课程资源', '13', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 课程资源', '13', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 城市', '14', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 城市', '14', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 城市', '14', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 课程机构', '15', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 课程机构', '15', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 课程机构', '15', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 教师', '16', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 教师', '16', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 教师', '16', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 用户咨询', '17', 'add_userask');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 用户咨询', '17', 'change_userask');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 用户咨询', '17', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 课程评论', '18', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 课程评论', '18', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 课程评论', '18', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 用户收藏', '19', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 用户收藏', '19', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 用户收藏', '19', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('58', 'Can add 用户消息', '20', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('59', 'Can change 用户消息', '20', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete 用户消息', '20', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 用户课程', '21', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 用户课程', '21', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 用户课程', '21', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('64', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('65', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('66', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('67', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 课程', '10', 'view_course');
INSERT INTO `auth_permission` VALUES ('69', 'Can view 课程资源', '13', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('70', 'Can view 章节', '11', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('71', 'Can view 视频', '12', 'view_video');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 课程评论', '18', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('73', 'Can view 用户咨询', '17', 'view_userask');
INSERT INTO `auth_permission` VALUES ('74', 'Can view 用户课程', '21', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('75', 'Can view 用户收藏', '19', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 用户消息', '20', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('77', 'Can view 城市', '14', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('78', 'Can view 课程机构', '15', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('79', 'Can view 教师', '16', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('80', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('81', 'Can view 轮播图', '9', 'view_banner');
INSERT INTO `auth_permission` VALUES ('82', 'Can view 邮箱验证码', '8', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('83', 'Can view 用户信息', '7', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('84', 'Can add Bookmark', '22', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('85', 'Can change Bookmark', '22', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('86', 'Can delete Bookmark', '22', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('87', 'Can add User Setting', '23', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('88', 'Can change User Setting', '23', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('89', 'Can delete User Setting', '23', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('90', 'Can add User Widget', '24', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('91', 'Can change User Widget', '24', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('92', 'Can delete User Widget', '24', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('93', 'Can view Bookmark', '22', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('94', 'Can view User Setting', '23', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('95', 'Can view User Widget', '24', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('96', 'Can add log entry', '25', 'add_log');
INSERT INTO `auth_permission` VALUES ('97', 'Can change log entry', '25', 'change_log');
INSERT INTO `auth_permission` VALUES ('98', 'Can delete log entry', '25', 'delete_log');
INSERT INTO `auth_permission` VALUES ('99', 'Can view log entry', '25', 'view_log');
INSERT INTO `auth_permission` VALUES ('100', 'Can add captcha store', '26', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('101', 'Can change captcha store', '26', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('102', 'Can delete captcha store', '26', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('103', 'Can view captcha store', '26', 'view_captchastore');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11),
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11),
  `need_know` varchar(300) NOT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_11456c5a` (`course_org_id`),
  KEY `courses_course_d9614d40` (`teacher_id`),
  CONSTRAINT `courses_cour_course_org_id_4d2c4aab_fk_organization_courseorg_id` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES ('1', 'django入门', 'django入门', 'django入门', 'cj', '0', '0', '0', 'courses/2018/05/6aa513bae5e1ca06a6c43d942ffbfe47dd33eb0bc94a-Zvna7r_fw658.jpg', '49', '2018-04-08 15:02:00.000000', '1', '后端开发', 'python', '1', 'python基础', 'django进阶开发');
INSERT INTO `courses_course` VALUES ('2', 'python入门', 'python入门', 'python入门', 'cj', '0', '0', '0', 'courses/2018/05/20180409111540_7vSlS4v.jpg', '2', '2018-05-02 16:16:00.000000', '2', '后端开发', 'python', '2', '', '');
INSERT INTO `courses_course` VALUES ('3', 'python入门2', 'python入门2', 'python入门2', 'zj', '0', '0', '0', 'courses/2018/05/b72954ee520a9a065bca726b57597fdad36beefe3e2bd-rFVGaH_fw658.jpg', '0', '2018-05-02 16:18:00.000000', '3', '后端开发', '', null, '', '');
INSERT INTO `courses_course` VALUES ('4', 'python入门3', 'python入门3', 'python入门3', 'gj', '0', '0', '0', 'courses/2018/05/timg_4OSfqh2.jpg', '0', '2018-05-02 16:18:00.000000', '3', '后端开发', '', null, '', '');
INSERT INTO `courses_course` VALUES ('5', 'python入门4', 'python入门4', 'python入门4', 'cj', '0', '0', '0', 'courses/2018/05/a6c40a978dfb0bbeae54d5c4bd8c732272e930d048893-brax02_fw658.jpg', '0', '2018-05-02 16:18:00.000000', '5', '后端开发', '', null, '', '');
INSERT INTO `courses_course` VALUES ('6', 'python入门5', 'python入门5', 'python入门5', 'cj', '0', '0', '0', 'courses/2018/05/timg.jpg', '24', '2018-05-02 16:19:00.000000', '6', '后端开发', '', null, '', '');
INSERT INTO `courses_course` VALUES ('7', 'python入门6', 'python入门6', 'python入门6', 'cj', '0', '0', '0', 'courses/2018/05/20180409111540.jpg', '2', '2018-05-02 16:19:00.000000', '1', '后端开发', '', null, '', '');

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES ('2', '前端页面', 'courses/resource/2018/05/mysql.jpg', '2018-05-03 16:39:00.000000', '1');

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES ('1', '第一章', '2018-04-08 15:05:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('2', '第二章', '2018-05-03 15:35:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('3', '第三章', '2018-05-03 15:35:00.000000', '1');

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES ('1', '第1.1节', '2018-05-03 15:37:00.000000', '1', 'http://www.xyzlun.me', '0');
INSERT INTO `courses_video` VALUES ('2', '第2.1节', '2018-05-03 15:37:00.000000', '2', 'http://www.xyzlun.me', '0');
INSERT INTO `courses_video` VALUES ('3', '第3.1节', '2018-05-03 15:37:00.000000', '3', 'http://www.xyzlun.me', '0');
INSERT INTO `courses_video` VALUES ('4', '第1.2节', '2018-05-03 15:59:00.000000', '1', 'http://www.xyzlun.me', '0');
INSERT INTO `courses_video` VALUES ('5', '第2.2节', '2018-05-03 15:59:00.000000', '2', 'http://www.xyzlun.me', '0');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('10', '2018-04-04 16:38:07.274000', '7', 'yyx', '1', 'Added.', '7', '4');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('26', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('13', 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES ('11', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('12', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('18', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('17', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('21', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('19', 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('20', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('14', 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES ('15', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('16', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('9', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('25', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-04-03 01:41:44.582000');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-04-03 01:41:50.814000');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-04-03 01:41:52.381000');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-04-03 01:41:52.497000');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-04-03 01:41:53.696000');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-04-03 01:41:54.282000');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-04-03 01:41:55.019000');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-04-03 01:41:55.080000');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-04-03 01:41:55.497000');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-04-03 01:41:55.531000');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-04-03 01:41:55.584000');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2018-04-03 01:41:56.186000');
INSERT INTO `django_migrations` VALUES ('13', 'users', '0001_initial', '2018-04-03 03:06:51.158000');
INSERT INTO `django_migrations` VALUES ('14', 'courses', '0001_initial', '2018-04-04 03:04:55.008000');
INSERT INTO `django_migrations` VALUES ('15', 'operation', '0001_initial', '2018-04-04 03:04:59.417000');
INSERT INTO `django_migrations` VALUES ('16', 'organization', '0001_initial', '2018-04-04 03:05:01.584000');
INSERT INTO `django_migrations` VALUES ('17', 'users', '0002_banner_emailverifyrecord', '2018-04-04 03:05:02.112000');
INSERT INTO `django_migrations` VALUES ('18', 'users', '0003_auto_20180404_1523', '2018-04-04 07:23:17.154000');
INSERT INTO `django_migrations` VALUES ('19', 'users', '0004_auto_20180404_1630', '2018-04-04 16:30:50.553000');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0001_initial', '2018-04-08 09:15:43.195000');
INSERT INTO `django_migrations` VALUES ('21', 'users', '0005_auto_20180408_1125', '2018-04-08 11:25:35.852000');
INSERT INTO `django_migrations` VALUES ('22', 'xadmin', '0002_log', '2018-04-08 11:25:37.234000');
INSERT INTO `django_migrations` VALUES ('23', 'xadmin', '0003_auto_20160715_0100', '2018-04-08 11:25:38.140000');
INSERT INTO `django_migrations` VALUES ('24', 'courses', '0002_auto_20180408_1459', '2018-04-08 14:59:35.420000');
INSERT INTO `django_migrations` VALUES ('25', 'captcha', '0001_initial', '2018-04-12 14:26:41.334000');
INSERT INTO `django_migrations` VALUES ('26', 'organization', '0002_auto_20180412_1426', '2018-04-12 14:26:41.534000');
INSERT INTO `django_migrations` VALUES ('27', 'auth', '0008_auto_20180420_0911', '2018-04-20 09:11:35.124000');
INSERT INTO `django_migrations` VALUES ('28', 'organization', '0003_auto_20180420_0911', '2018-04-20 09:11:35.907000');
INSERT INTO `django_migrations` VALUES ('29', 'users', '0006_auto_20180420_0911', '2018-04-20 09:11:36.269000');
INSERT INTO `django_migrations` VALUES ('30', 'organization', '0004_auto_20180425_0935', '2018-04-25 09:35:17.638000');
INSERT INTO `django_migrations` VALUES ('31', 'courses', '0003_course_course_org', '2018-04-27 09:32:31.781000');
INSERT INTO `django_migrations` VALUES ('32', 'organization', '0005_teacher_image', '2018-04-27 11:31:11.016000');
INSERT INTO `django_migrations` VALUES ('33', 'organization', '0006_teacher_course_num', '2018-04-28 15:09:54.431000');
INSERT INTO `django_migrations` VALUES ('34', 'courses', '0004_course_category', '2018-05-03 09:14:42.689000');
INSERT INTO `django_migrations` VALUES ('35', 'courses', '0005_course_tag', '2018-05-03 09:53:00.764000');
INSERT INTO `django_migrations` VALUES ('36', 'courses', '0006_video_url', '2018-05-03 15:56:56.757000');
INSERT INTO `django_migrations` VALUES ('37', 'courses', '0007_video_learn_times', '2018-05-03 16:28:49.993000');
INSERT INTO `django_migrations` VALUES ('38', 'courses', '0008_auto_20180503_1652', '2018-05-03 16:53:03.828000');
INSERT INTO `django_migrations` VALUES ('39', 'courses', '0009_auto_20180503_1713', '2018-05-03 17:13:33.973000');
INSERT INTO `django_migrations` VALUES ('40', 'organization', '0007_teacher_recommend', '2018-05-07 15:25:34.429000');
INSERT INTO `django_migrations` VALUES ('41', 'organization', '0008_auto_20180507_1525', '2018-05-07 15:25:35.807000');
INSERT INTO `django_migrations` VALUES ('42', 'organization', '0009_teacher_age', '2018-05-07 16:23:50.496000');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('8ol4suhoywbzceb54n0kcz3j9me114iu', 'MTlhZjcyNDhhODQ4YTJmZWRiZWNiZmMzNzI1YzRlODQ1YmE5OTQ3Njp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5YmU4N2U3ZmZlY2NkYzI5MTg5ODVjYzg3Y2Q3MDc0MTE3ZjU2NjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==', '2018-05-21 15:17:06.474000');
INSERT INTO `django_session` VALUES ('u6qb1oe4uza2qqseblmv1ebsad4mdytf', 'MTM4YTU2NzA3ODE5YTY1NTgxZDMxZDMwMzNhNDZlZjE1NzgzNjMyMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjMxY2ZjZTFhOWM1ZDIwOGQ2YWQwYzFiNDg4ZTk0NWY3ZGQyYjliYTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjExIn0=', '2018-04-26 17:31:43.084000');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES ('1', '打得不错', '2018-05-04 16:24:46.012000', '1', '4');
INSERT INTO `operation_coursecomments` VALUES ('2', '打的很不错', '2018-05-04 16:25:13.104000', '1', '4');
INSERT INTO `operation_coursecomments` VALUES ('3', '可以可以', '2018-05-04 16:25:25.291000', '1', '4');
INSERT INTO `operation_coursecomments` VALUES ('4', '666', '2018-05-04 16:26:05.543000', '1', '4');
INSERT INTO `operation_coursecomments` VALUES ('5', '强', '2018-05-04 16:54:24.040000', '1', '4');

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES ('1', '2018-05-03 09:16:00.000000', '1', '4');
INSERT INTO `operation_usercourse` VALUES ('2', '2018-05-03 09:16:00.000000', '1', '11');
INSERT INTO `operation_usercourse` VALUES ('3', '2018-05-03 09:16:00.000000', '2', '11');

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES ('9', '1', '2', '2018-05-03 11:22:08.645000', '4');

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES ('1', '北京', '北京', '2018-04-24 15:02:00.000000');
INSERT INTO `organization_citydict` VALUES ('2', '上海', '上海', '2018-04-24 15:03:00.000000');
INSERT INTO `organization_citydict` VALUES ('3', '广州', '广州', '2018-04-24 15:03:00.000000');
INSERT INTO `organization_citydict` VALUES ('4', '深圳', '深圳', '2018-04-24 15:03:00.000000');
INSERT INTO `organization_citydict` VALUES ('5', '杭州', '杭州', '2018-04-24 15:04:00.000000');
INSERT INTO `organization_citydict` VALUES ('6', '成都', '成都', '2018-04-24 15:04:00.000000');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(10) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `recommend` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`),
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES ('1', '慕学网01', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', '0', '0', 'org/2018/04/imooc_PZ0LaR9.png', '北京', '2018-04-24 15:00:00.000000', '1', 'pxjg', '0', '0', '4');
INSERT INTO `organization_courseorg` VALUES ('2', '慕学网02', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', '0', '0', 'org/2018/04/imooc_PZ0LaR9_cckKM2g.png', '上海', '2018-04-24 15:04:00.000000', '2', 'gx', '0', '0', '4');
INSERT INTO `organization_courseorg` VALUES ('3', '慕学网03', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', '0', '0', 'org/2018/04/imooc_yeT8zqy_CWj4J99.png', '广州', '2018-04-24 15:05:00.000000', '3', 'pxjg', '0', '0', '4');
INSERT INTO `organization_courseorg` VALUES ('4', '慕学网04', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', '0', '0', 'org/2018/04/imooc_3kO9Q3W_m3ONtss.png', '深圳', '2018-04-24 15:05:00.000000', '4', 'gx', '0', '0', '4');
INSERT INTO `organization_courseorg` VALUES ('5', '慕学网05', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', '0', '0', 'org/2018/04/imooc_3kO9Q3W_m3ONtss_vMiFJOR.png', '杭州', '2018-04-24 15:05:00.000000', '5', 'pxjg', '0', '0', '4');
INSERT INTO `organization_courseorg` VALUES ('6', '慕学网06', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', '0', '0', 'org/2018/04/imooc_ObUAywt_2M2PXmn.png', '成都', '2018-04-24 15:05:00.000000', '6', 'pxjg', '0', '0', '4');
INSERT INTO `organization_courseorg` VALUES ('7', '慕学网07', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', '0', '0', 'org/2018/04/imooc_AB0SCNt_UPP7uTw.png', '北京', '2018-04-24 15:12:00.000000', '1', 'gr', '0', '0', '4');
INSERT INTO `organization_courseorg` VALUES ('8', '慕学网08', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', '0', '0', 'org/2018/04/imooc_AB0SCNt_UPP7uTw_Fz5hmsw.png', '上海', '2018-04-24 15:12:00.000000', '2', 'pxjg', '0', '0', '4');
INSERT INTO `organization_courseorg` VALUES ('9', '慕学网09', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', '0', '0', 'org/2018/04/imooc_AB0SCNt_UPP7uTw_Fz5hmsw_rjxFJA3.png', '广州', '2018-04-24 15:13:00.000000', '3', 'pxjg', '0', '0', '4');
INSERT INTO `organization_courseorg` VALUES ('10', '慕学网10', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', '0', '0', 'org/2018/04/imooc_AB0SCNt_UPP7uTw_O50D9IN.png', '深圳', '2018-04-24 15:13:00.000000', '4', 'gr', '0', '0', '4');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `course_num` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` (`org_id`),
  CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES ('1', '程天伦', '5', 'XXX', 'XXX', 'XXX', '0', '0', '2018-04-27 09:12:00.000000', '1', 'teacher/2018/04/aobama.png', '3', '0');
INSERT INTO `organization_teacher` VALUES ('2', '叶一熹', '4', 'YYY', 'YYY', 'YYY', '0', '0', '2018-04-27 09:13:00.000000', '2', 'teacher/2018/04/6aa513bae5e1ca06a6c43d942ffbfe47dd33eb0bc94a-Zvna7r_fw658.jpg', '0', '0');
INSERT INTO `organization_teacher` VALUES ('3', '二条', '3', 'ZZZ', 'ZZZ', 'XXX', '0', '0', '2018-04-28 15:40:00.000000', '1', 'teacher/2018/04/curry.jpg', '5', '0');

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_banner
-- ----------------------------

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(10) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES ('3', 'admin', 'xxx@qq.com', 'register', '2018-04-08 11:32:00.000000');
INSERT INTO `users_emailverifyrecord` VALUES ('4', 'xtl', '123@123.com', 'forget', '2018-04-08 11:40:00.000000');
INSERT INTO `users_emailverifyrecord` VALUES ('5', 'rsSJ6OeM6u5dwLRA', '450347106@qq.com', 'register', '2018-04-12 16:33:03.985000');
INSERT INTO `users_emailverifyrecord` VALUES ('6', '6HcuQxEVUCawww7L', 'xyzlun@163.com', 'register', '2018-04-12 16:36:55.029000');
INSERT INTO `users_emailverifyrecord` VALUES ('7', 'GYy6BwglhcnvMYwY', 'xyzlun@163.com', 'register', '2018-04-12 16:39:00.167000');
INSERT INTO `users_emailverifyrecord` VALUES ('8', 'BMdhw3kZFb9YlyTJ', '450347106@qq.com', 'register', '2018-04-12 16:44:11.638000');
INSERT INTO `users_emailverifyrecord` VALUES ('9', 'O0gEBfqQuErtFv2b', '450347106@qq.com', 'forget', '2018-04-16 10:28:48.494000');
INSERT INTO `users_emailverifyrecord` VALUES ('10', 'oHz9jZ4hFbJNEKCd', '450347106@qq.com', 'forget', '2018-04-16 10:36:24.999000');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) unsigned zerofill NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$CNfQRdrGtbvN$xY4wN+62y2JHT/LOHgsH2wq0gnEtC04D4VsewnIssns=', '2018-04-20 09:12:00.000000', '1', 'admin', '', '', '1@1.com', '1', '1', '2018-04-04 07:23:00.000000', 'admin', null, 'female', '北京', '', 'image/2018/05/b72954ee520a9a065bca726b57597fdad36beefe3e2bd-rFVGaH_fw658.jpg');
INSERT INTO `users_userprofile` VALUES ('4', 'pbkdf2_sha256$24000$b6ISDzYGJ0zn$FVl22g4OWlSvk6Hmz8apfiuvlZZ9wcJdbzHbSCib8u0=', '2018-05-07 15:17:06.371000', '1', 'chengtianlun', '', '', '2@2.com', '1', '1', '2018-04-04 16:24:00.000000', 'chengtianlun', null, 'male', '成都', '', 'image/2018/05/curry.jpg');
INSERT INTO `users_userprofile` VALUES ('7', 'admin123', null, '0', 'yyx', '', '', '', '0', '1', '2018-04-04 16:37:00.000000', 'yyx', null, 'female', 'chengdu', '', 'image/2018/05/timg.jpg');
INSERT INTO `users_userprofile` VALUES ('11', 'pbkdf2_sha256$24000$axXGqfAXpWJx$1iDMMOUJNAZ7T7gL3bDzPu/xQMJqHEdfPLAHOt/U6wE=', '2018-04-16 16:31:00.000000', '0', '450347106@qq.com', '', '', '450347106@qq.com', '0', '1', '2018-04-12 16:44:00.000000', '450347106', null, 'female', '杭州', '', 'image/2018/05/20180409111540.jpg');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-04-08 11:28:04.181000', '127.0.0.1', '2', 'EmailVerifyRecord object', 'create', '已添加', '8', '4');
INSERT INTO `xadmin_log` VALUES ('2', '2018-04-08 11:28:50.781000', '127.0.0.1', '2', 'EmailVerifyRecord object', 'delete', '', '8', '4');
INSERT INTO `xadmin_log` VALUES ('3', '2018-04-08 11:32:15.183000', '127.0.0.1', '3', 'admin(xxx@qq.com)', 'create', '已添加', '8', '4');
INSERT INTO `xadmin_log` VALUES ('4', '2018-04-08 11:40:55.109000', '127.0.0.1', '4', 'xtl(123@123.com)', 'create', '已添加', '8', '4');
INSERT INTO `xadmin_log` VALUES ('5', '2018-04-08 15:03:52.182000', '127.0.0.1', '1', 'Course object', 'create', '已添加', '10', '4');
INSERT INTO `xadmin_log` VALUES ('6', '2018-04-08 15:05:53.413000', '127.0.0.1', '1', '第一章', 'create', '已添加', '11', '4');
INSERT INTO `xadmin_log` VALUES ('7', '2018-04-24 15:03:09.936000', '127.0.0.1', '1', '北京', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-04-24 15:03:24.188000', '127.0.0.1', '1', '慕学网01', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-04-24 15:03:48.477000', '127.0.0.1', '2', '上海', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-04-24 15:03:57.365000', '127.0.0.1', '3', '广州', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-04-24 15:04:04.535000', '127.0.0.1', '4', '深圳', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-04-24 15:04:12.775000', '127.0.0.1', '5', '杭州', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-04-24 15:04:22.980000', '127.0.0.1', '6', '成都', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-04-24 15:05:03.977000', '127.0.0.1', '2', '慕学网02', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-04-24 15:05:20.213000', '127.0.0.1', '3', '慕学网03', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-04-24 15:05:36.694000', '127.0.0.1', '4', '慕学网04', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-04-24 15:05:56.095000', '127.0.0.1', '5', '慕学网05', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-04-24 15:06:15.238000', '127.0.0.1', '6', '慕学网06', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-04-24 15:12:34.000000', '127.0.0.1', '7', '慕学网07', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-04-24 15:13:00.394000', '127.0.0.1', '8', '慕学网08', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-04-24 15:13:18.007000', '127.0.0.1', '9', '慕学网09', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-04-24 15:13:36.349000', '127.0.0.1', '10', '慕学网10', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-04-27 09:13:07.430000', '127.0.0.1', '1', 'Teacher object', 'create', '已添加', '16', '4');
INSERT INTO `xadmin_log` VALUES ('24', '2018-04-27 09:13:48.517000', '127.0.0.1', '2', '叶一熹', 'create', '已添加', '16', '4');
INSERT INTO `xadmin_log` VALUES ('25', '2018-04-27 09:33:03.762000', '127.0.0.1', '1', 'django入门', 'change', '已修改 course_org 。', '10', '4');
INSERT INTO `xadmin_log` VALUES ('26', '2018-04-27 10:30:35.673000', '127.0.0.1', '1', 'django入门', 'change', '已修改 image 。', '10', '4');
INSERT INTO `xadmin_log` VALUES ('27', '2018-04-27 11:31:25.286000', '127.0.0.1', '1', '程天伦', 'change', '已修改 image 。', '16', '4');
INSERT INTO `xadmin_log` VALUES ('28', '2018-04-28 15:40:02.959000', '127.0.0.1', '1', '程天伦', 'change', '已修改 course_num 。', '16', '4');
INSERT INTO `xadmin_log` VALUES ('29', '2018-04-28 15:41:07.336000', '127.0.0.1', '3', '二条', 'create', '已添加', '16', '4');
INSERT INTO `xadmin_log` VALUES ('30', '2018-04-28 15:51:10.597000', '127.0.0.1', '2', '叶一熹', 'change', '已修改 image 。', '16', '4');
INSERT INTO `xadmin_log` VALUES ('31', '2018-05-02 16:18:04.434000', '127.0.0.1', '2', 'python入门', 'create', '已添加', '10', '4');
INSERT INTO `xadmin_log` VALUES ('32', '2018-05-02 16:18:25.400000', '127.0.0.1', '3', 'python入门2', 'create', '已添加', '10', '4');
INSERT INTO `xadmin_log` VALUES ('33', '2018-05-02 16:18:40.250000', '127.0.0.1', '4', 'python入门3', 'create', '已添加', '10', '4');
INSERT INTO `xadmin_log` VALUES ('34', '2018-05-02 16:19:00.241000', '127.0.0.1', '5', 'python入门4', 'create', '已添加', '10', '4');
INSERT INTO `xadmin_log` VALUES ('35', '2018-05-02 16:19:16.723000', '127.0.0.1', '6', 'python入门5', 'create', '已添加', '10', '4');
INSERT INTO `xadmin_log` VALUES ('36', '2018-05-02 16:19:36.474000', '127.0.0.1', '7', 'python入门6', 'create', '已添加', '10', '4');
INSERT INTO `xadmin_log` VALUES ('37', '2018-05-02 16:20:43.211000', '127.0.0.1', '7', 'python入门6', 'change', '已修改 image 。', '10', '4');
INSERT INTO `xadmin_log` VALUES ('38', '2018-05-02 16:20:51.980000', '127.0.0.1', '6', 'python入门5', 'change', '已修改 image 。', '10', '4');
INSERT INTO `xadmin_log` VALUES ('39', '2018-05-02 16:20:58.821000', '127.0.0.1', '5', 'python入门4', 'change', '已修改 image 。', '10', '4');
INSERT INTO `xadmin_log` VALUES ('40', '2018-05-02 16:21:05.432000', '127.0.0.1', '4', 'python入门3', 'change', '已修改 image 。', '10', '4');
INSERT INTO `xadmin_log` VALUES ('41', '2018-05-02 16:21:12.443000', '127.0.0.1', '3', 'python入门2', 'change', '已修改 image 。', '10', '4');
INSERT INTO `xadmin_log` VALUES ('42', '2018-05-02 16:21:18.826000', '127.0.0.1', '2', 'python入门', 'change', '已修改 image 。', '10', '4');
INSERT INTO `xadmin_log` VALUES ('43', '2018-05-02 16:21:28.967000', '127.0.0.1', '1', 'django入门', 'change', '已修改 image 。', '10', '4');
INSERT INTO `xadmin_log` VALUES ('44', '2018-05-03 09:16:11.853000', '127.0.0.1', '1', 'UserCourse object', 'create', '已添加', '21', '4');
INSERT INTO `xadmin_log` VALUES ('45', '2018-05-03 09:16:20.232000', '127.0.0.1', '2', 'UserCourse object', 'create', '已添加', '21', '4');
INSERT INTO `xadmin_log` VALUES ('46', '2018-05-03 09:16:32.011000', '127.0.0.1', '3', 'UserCourse object', 'create', '已添加', '21', '4');
INSERT INTO `xadmin_log` VALUES ('47', '2018-05-03 09:18:32.579000', '127.0.0.1', '11', '450347106@qq.com', 'change', '已修改 last_login，nick_name，address 和 image 。', '7', '4');
INSERT INTO `xadmin_log` VALUES ('48', '2018-05-03 09:18:52.306000', '127.0.0.1', '4', 'chengtianlun', 'change', '已修改 last_login，nick_name，gender，address 和 image 。', '7', '4');
INSERT INTO `xadmin_log` VALUES ('49', '2018-05-03 09:19:02.773000', '127.0.0.1', '7', 'yyx', 'change', '已修改 image 。', '7', '4');
INSERT INTO `xadmin_log` VALUES ('50', '2018-05-03 09:19:29.126000', '127.0.0.1', '1', 'admin', 'change', '已修改 last_login，nick_name，address 和 image 。', '7', '4');
INSERT INTO `xadmin_log` VALUES ('51', '2018-05-03 15:35:30.018000', '127.0.0.1', '2', '第一章', 'create', '已添加', '11', '4');
INSERT INTO `xadmin_log` VALUES ('52', '2018-05-03 15:35:41.033000', '127.0.0.1', '3', '第二章', 'create', '已添加', '11', '4');
INSERT INTO `xadmin_log` VALUES ('53', '2018-05-03 15:35:52.015000', '127.0.0.1', '2', '第二章', 'change', '已修改 name 。', '11', '4');
INSERT INTO `xadmin_log` VALUES ('54', '2018-05-03 15:35:58.473000', '127.0.0.1', '3', '第三章', 'change', '已修改 name 。', '11', '4');
INSERT INTO `xadmin_log` VALUES ('55', '2018-05-03 15:37:25.403000', '127.0.0.1', '1', '第一节', 'create', '已添加', '12', '4');
INSERT INTO `xadmin_log` VALUES ('56', '2018-05-03 15:37:41.201000', '127.0.0.1', '2', '第一节', 'create', '已添加', '12', '4');
INSERT INTO `xadmin_log` VALUES ('57', '2018-05-03 15:37:56.180000', '127.0.0.1', '3', '第三节', 'create', '已添加', '12', '4');
INSERT INTO `xadmin_log` VALUES ('58', '2018-05-03 15:39:16.034000', '127.0.0.1', '3', '第3.1节', 'change', '已修改 name 。', '12', '4');
INSERT INTO `xadmin_log` VALUES ('59', '2018-05-03 15:39:22.250000', '127.0.0.1', '2', '第2.1节', 'change', '已修改 name 。', '12', '4');
INSERT INTO `xadmin_log` VALUES ('60', '2018-05-03 15:39:28.239000', '127.0.0.1', '1', '第1.1节', 'change', '已修改 name 。', '12', '4');
INSERT INTO `xadmin_log` VALUES ('61', '2018-05-03 15:57:41.399000', '127.0.0.1', '3', '第3.1节', 'change', '已修改 url 。', '12', '4');
INSERT INTO `xadmin_log` VALUES ('62', '2018-05-03 15:57:46.817000', '127.0.0.1', '2', '第2.1节', 'change', '已修改 url 。', '12', '4');
INSERT INTO `xadmin_log` VALUES ('63', '2018-05-03 15:57:50.828000', '127.0.0.1', '1', '第1.1节', 'change', '已修改 url 。', '12', '4');
INSERT INTO `xadmin_log` VALUES ('64', '2018-05-03 15:59:34.397000', '127.0.0.1', '4', '第1.2节', 'create', '已添加', '12', '4');
INSERT INTO `xadmin_log` VALUES ('65', '2018-05-03 15:59:50.179000', '127.0.0.1', '5', '第2.2节', 'create', '已添加', '12', '4');
INSERT INTO `xadmin_log` VALUES ('66', '2018-05-03 16:37:48.673000', '127.0.0.1', '1', '前端页面', 'create', '已添加', '13', '4');
INSERT INTO `xadmin_log` VALUES ('67', '2018-05-03 16:38:58.401000', '127.0.0.1', '1', '前端页面', 'change', '没有字段被修改。', '13', '4');
INSERT INTO `xadmin_log` VALUES ('68', '2018-05-03 16:39:29.750000', '127.0.0.1', '1', '前端页面', 'delete', '', '13', '4');
INSERT INTO `xadmin_log` VALUES ('69', '2018-05-03 16:39:55.445000', '127.0.0.1', '2', '前端页面', 'create', '已添加', '13', '4');
INSERT INTO `xadmin_log` VALUES ('70', '2018-05-03 16:53:48.032000', '127.0.0.1', '1', 'django入门', 'change', '已修改 teacher 。', '10', '4');
INSERT INTO `xadmin_log` VALUES ('71', '2018-05-03 16:53:55.602000', '127.0.0.1', '2', 'python入门', 'change', '已修改 teacher 。', '10', '4');
INSERT INTO `xadmin_log` VALUES ('72', '2018-05-03 17:15:09.403000', '127.0.0.1', '1', 'django入门', 'change', '已修改 need_know 和 teacher_tell 。', '10', '4');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '4');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', 'https://bootswatch.com/3/sandstone/bootstrap.min.css', '4');
INSERT INTO `xadmin_usersettings` VALUES ('3', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('4', 'site-theme', 'https://bootswatch.com/3/simplex/bootstrap.min.css', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
