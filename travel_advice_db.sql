-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2023-08-10 00:52:43
-- 服务器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `travel_advice_db`
--

-- --------------------------------------------------------

--
-- 表的结构 `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `account_emailaddress`
--

INSERT INTO `account_emailaddress` (`id`, `email`, `verified`, `primary`, `user_id`) VALUES
(11, 'cl980820@gmail.com', 0, 1, 12),
(12, 'testUser2@abc.com', 0, 1, 13);

-- --------------------------------------------------------

--
-- 表的结构 `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('3b8ca5a46b3cbd08bf91a50ffbb809e75b56bc46', '2023-08-06 20:18:48.662283', 12),
('8a739b7ee8623b07a04615c93d38d1099f1eaf42', '2023-08-09 20:54:00.899904', 13);

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add question', 7, 'add_question'),
(26, 'Can change question', 7, 'change_question'),
(27, 'Can delete question', 7, 'delete_question'),
(28, 'Can view question', 7, 'view_question'),
(29, 'Can add choice', 8, 'add_choice'),
(30, 'Can change choice', 8, 'change_choice'),
(31, 'Can delete choice', 8, 'delete_choice'),
(32, 'Can view choice', 8, 'view_choice'),
(33, 'Can add idea', 9, 'add_idea'),
(34, 'Can change idea', 9, 'change_idea'),
(35, 'Can delete idea', 9, 'delete_idea'),
(36, 'Can view idea', 9, 'view_idea'),
(37, 'Can add tag', 10, 'add_tag'),
(38, 'Can change tag', 10, 'change_tag'),
(39, 'Can delete tag', 10, 'delete_tag'),
(40, 'Can view tag', 10, 'view_tag'),
(41, 'Can add tagged item', 11, 'add_taggeditem'),
(42, 'Can change tagged item', 11, 'change_taggeditem'),
(43, 'Can delete tagged item', 11, 'delete_taggeditem'),
(44, 'Can view tagged item', 11, 'view_taggeditem'),
(45, 'Can add Token', 12, 'add_token'),
(46, 'Can change Token', 12, 'change_token'),
(47, 'Can delete Token', 12, 'delete_token'),
(48, 'Can view Token', 12, 'view_token'),
(49, 'Can add token', 13, 'add_tokenproxy'),
(50, 'Can change token', 13, 'change_tokenproxy'),
(51, 'Can delete token', 13, 'delete_tokenproxy'),
(52, 'Can view token', 13, 'view_tokenproxy'),
(53, 'Can add email address', 14, 'add_emailaddress'),
(54, 'Can change email address', 14, 'change_emailaddress'),
(55, 'Can delete email address', 14, 'delete_emailaddress'),
(56, 'Can view email address', 14, 'view_emailaddress'),
(57, 'Can add email confirmation', 15, 'add_emailconfirmation'),
(58, 'Can change email confirmation', 15, 'change_emailconfirmation'),
(59, 'Can delete email confirmation', 15, 'delete_emailconfirmation'),
(60, 'Can view email confirmation', 15, 'view_emailconfirmation'),
(61, 'Can add social account', 16, 'add_socialaccount'),
(62, 'Can change social account', 16, 'change_socialaccount'),
(63, 'Can delete social account', 16, 'delete_socialaccount'),
(64, 'Can view social account', 16, 'view_socialaccount'),
(65, 'Can add social application', 17, 'add_socialapp'),
(66, 'Can change social application', 17, 'change_socialapp'),
(67, 'Can delete social application', 17, 'delete_socialapp'),
(68, 'Can view social application', 17, 'view_socialapp'),
(69, 'Can add social application token', 18, 'add_socialtoken'),
(70, 'Can change social application token', 18, 'change_socialtoken'),
(71, 'Can delete social application token', 18, 'delete_socialtoken'),
(72, 'Can view social application token', 18, 'view_socialtoken');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$eDZHvGlLrKvWz1YofjaGmB$jj+FUx7XRfMSyrLCf54+LnW7hZELcBLxh9wpZA2Etdg=', '2023-08-07 09:02:43.020998', 1, 'cl980820', '', '', 'cl980820@hotmail.com', 1, 1, '2023-07-27 19:24:37.043008'),
(12, 'pbkdf2_sha256$320000$FkIHOLs9VJd1bkONWU141Z$8+qtZLFZKIcxg4WyaB19SZAYcejO0mk1y5fObEs3n3Y=', '2023-08-09 17:28:40.725222', 0, 'nichloride', '', '', 'cl980820@gmail.com', 0, 1, '2023-08-06 20:18:31.713877'),
(13, 'pbkdf2_sha256$320000$fh7T7kFzzsW2TkUJRvlFVc$PaEVbq/Rwdt1R2qWNPOCtyfR9ZAj00KhgCVO3qdEYHw=', '2023-08-09 22:33:16.085376', 0, 'testUser2', '', '', 'testUser2@abc.com', 0, 1, '2023-08-09 20:53:44.177459');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-07-29 16:12:26.847225', '2', 'How often?', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"Once per week\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"Never\"}}]', 7, 1),
(2, '2023-07-29 16:12:50.666749', '3', 'How much?', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"100\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"2000\"}}]', 7, 1),
(3, '2023-07-29 16:13:21.537991', '4', 'Where?', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"here\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"not here\"}}]', 7, 1),
(4, '2023-07-31 17:55:53.290099', '3', '3:test1', 1, '[{\"added\": {}}]', 9, 1),
(5, '2023-07-31 17:56:05.474803', '3', '3:test1', 2, '[]', 9, 1),
(6, '2023-07-31 17:56:45.508944', '3', '3: test1', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 9, 1),
(7, '2023-07-31 17:56:49.094306', '3', '3: test1', 2, '[]', 9, 1),
(8, '2023-07-31 17:58:21.943761', '3', '3: test1', 2, '[{\"changed\": {\"fields\": [\"Tags\"]}}]', 9, 1),
(9, '2023-07-31 20:26:00.886004', '3', '3: test1', 2, '[]', 9, 1),
(10, '2023-07-31 20:26:20.560396', '3', '3: test1', 2, '[]', 9, 1),
(11, '2023-08-06 20:11:39.038666', '6', 'chenglang', 3, '', 4, 1),
(12, '2023-08-06 20:11:39.041667', '10', 'dasdas3', 3, '', 4, 1),
(13, '2023-08-06 20:11:39.042666', '2', 'NiChloride', 3, '', 4, 1),
(14, '2023-08-06 20:11:39.044667', '3', 'testuser2', 3, '', 4, 1),
(15, '2023-08-06 20:11:39.047664', '5', 'testuser3', 3, '', 4, 1),
(16, '2023-08-06 20:11:39.049664', '7', 'testuser4', 3, '', 4, 1),
(17, '2023-08-06 20:11:39.051664', '8', 'testuser5', 3, '', 4, 1),
(18, '2023-08-06 20:11:39.052664', '9', 'TestUser6', 3, '', 4, 1),
(19, '2023-08-06 20:11:39.054663', '4', 'user1', 3, '', 4, 1),
(20, '2023-08-06 20:17:36.405562', '11', 'nichloride', 3, '', 4, 1),
(21, '2023-08-09 18:53:10.538993', '18', '18: create new tags test', 3, '', 9, 1),
(22, '2023-08-09 18:53:10.541994', '17', '17: Create Post Test', 3, '', 9, 1),
(23, '2023-08-09 18:53:10.543990', '9', '9: it should work', 3, '', 9, 1),
(24, '2023-08-09 18:53:10.544990', '8', '8: UPDATED', 3, '', 9, 1),
(25, '2023-08-09 18:53:10.548990', '7', '7: test tags', 3, '', 9, 1),
(26, '2023-08-09 18:53:10.549993', '6', '6: UPDATED', 3, '', 9, 1),
(27, '2023-08-09 18:53:10.551991', '4', '4: REST', 3, '', 9, 1),
(28, '2023-08-09 18:53:10.553990', '3', '3: UPDATED', 3, '', 9, 1);

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(14, 'account', 'emailaddress'),
(15, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(12, 'authtoken', 'token'),
(13, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(9, 'manage_travel_ideas', 'idea'),
(8, 'polls', 'choice'),
(7, 'polls', 'question'),
(6, 'sessions', 'session'),
(16, 'socialaccount', 'socialaccount'),
(17, 'socialaccount', 'socialapp'),
(18, 'socialaccount', 'socialtoken'),
(10, 'taggit', 'tag'),
(11, 'taggit', 'taggeditem');

-- --------------------------------------------------------

--
-- 表的结构 `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-27 16:10:58.075023'),
(2, 'auth', '0001_initial', '2023-07-27 16:10:58.335387'),
(3, 'admin', '0001_initial', '2023-07-27 16:10:58.398478'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-27 16:10:58.404993'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-27 16:10:58.411496'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-27 16:10:58.446046'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-27 16:10:58.475089'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-27 16:10:58.504897'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-27 16:10:58.511411'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-27 16:10:58.535126'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-27 16:10:58.538128'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-27 16:10:58.544195'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-27 16:10:58.554245'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-27 16:10:58.563757'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-27 16:10:58.595263'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-27 16:10:58.603521'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-27 16:10:58.614037'),
(18, 'sessions', '0001_initial', '2023-07-27 16:10:58.656083'),
(19, 'polls', '0001_initial', '2023-07-27 19:04:53.029577'),
(20, 'taggit', '0001_initial', '2023-07-31 17:47:55.694435'),
(21, 'taggit', '0002_auto_20150616_2121', '2023-07-31 17:47:55.778520'),
(22, 'taggit', '0003_taggeditem_add_unique_index', '2023-07-31 17:47:55.789508'),
(23, 'taggit', '0004_alter_taggeditem_content_type_alter_taggeditem_tag', '2023-07-31 17:47:55.798509'),
(24, 'taggit', '0005_auto_20220424_2025', '2023-07-31 17:47:55.802508'),
(25, 'manage_travel_ideas', '0001_initial', '2023-07-31 17:47:55.814711'),
(26, 'authtoken', '0001_initial', '2023-08-06 16:40:10.472757'),
(27, 'authtoken', '0002_auto_20160226_1747', '2023-08-06 16:40:10.489758'),
(28, 'authtoken', '0003_tokenproxy', '2023-08-06 16:40:10.493757'),
(29, 'account', '0001_initial', '2023-08-06 17:40:32.803304'),
(30, 'account', '0002_email_max_length', '2023-08-06 17:40:32.909326'),
(31, 'socialaccount', '0001_initial', '2023-08-06 17:40:33.050852'),
(32, 'socialaccount', '0002_token_max_lengths', '2023-08-06 17:40:33.073854'),
(33, 'socialaccount', '0003_extra_data_default_dict', '2023-08-06 17:40:33.080849'),
(34, 'manage_travel_ideas', '0002_idea_author_token', '2023-08-07 09:05:55.444652'),
(35, 'manage_travel_ideas', '0003_idea_created_at_idea_updated_at', '2023-08-09 17:24:57.904154');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1d9kg6vp01ggzcet2esglacekzsvw0mq', '.eJxVjEEOwiAQAP_C2RCgtGw9evcNZBdYqRpISnsy_l1JetDrzGRewuO-Zb-3tPolirPQRpx-IWF4pNJNvGO5VRlq2daFZE_kYZu81piel6P9G2RsuX8HM4EdjRlJxeDQKW3DRIRROeTwpawdMRi2BBHJ8TDPWgMYsOCYxfsD-_Q4BA:1qTR9a:aYDWJEDit7hSOThhSIifb74-Q7WgIsmexFlEJgRmkq4', '2023-08-22 18:09:58.113099'),
('1jf7flh1zoitjl3kvbsewclpvytmv76d', '.eJxVjEEOwiAQAP_C2RCgtGw9evcNZBdYqRpISnsy_l1JetDrzGRewuO-Zb-3tPolirPQRpx-IWF4pNJNvGO5VRlq2daFZE_kYZu81piel6P9G2RsuX8HM4EdjRlJxeDQKW3DRIRROeTwpawdMRi2BBHJ8TDPWgMYsOCYxfsD-_Q4BA:1qSkXW:QmHy5ukLE-xPtKmapzivl5AY7FAExbxI6kPYgZllnJo', '2023-08-20 20:39:50.434630'),
('1nzqm79prwo7iwktn0m1vqof41rn9bf4', '.eJxVjEEOgyAUBe_C2hAQEXTZfc9APvCptBQSlW6a3r3amCZuZ-a9NwHnSs2reeEcQ0Rv8AkxkTHXlJq_rQvOZCSWNMRAXacfMNFvjPMztOAemHfj75BvhbqS1zlauif0sAu9Fo_pcrSngwmWaVv3jEkbQtd5KZzVOkj0jENrGUBo1SB7rrDzDFFw23vHdTuoQTAlJNMcFfl8AdB6SV0:1qSk7f:N4qgpdoHT7sG49zrH5ugzDWMuIH09HiW60MfWRCNHuc', '2023-08-20 20:13:07.661253'),
('3s8fkvqrnbqklalkcqk52eeuz8eakx5g', '.eJxVjEEOwiAQAP_C2RCgtGw9evcNZBdYqRpISnsy_l1JetDrzGRewuO-Zb-3tPolirPQRpx-IWF4pNJNvGO5VRlq2daFZE_kYZu81piel6P9G2RsuX8HM4EdjRlJxeDQKW3DRIRROeTwpawdMRi2BBHJ8TDPWgMYsOCYxfsD-_Q4BA:1qSkSD:7n5Anp2JZ-lccEorZ-G-WYcK2wpIUCq0iFd7xjB7-BU', '2023-08-20 20:34:21.533627'),
('40lmo59pkobv0fhbtzooq0pjy48fnxt2', '.eJxVjEsOwiAUAO_CuiEU-Xbp3jOQx4NaFCFpixvj3bWmMel2ZjIvAoi1ldU945zGFIOLD0iZDKXl3P1tW-JMBgKkIw7aOv2AS-HLenaEHvAey2bCDcq1UqxlnZOnW0J3u9BLDTGf9_YwmGCZti8PKkTGpLJcehukBPRcoFRCW4MRvQI7Si-4RM00Cz0zozKoBe_hJA15fwC_UEk2:1qSjkG:O3-HrDLXK1LMR3hkq6y1xkWTyTf4a9m8pvcesf0_QCo', '2023-08-20 19:48:56.623211'),
('7bcdrrzqbizmw5h0h2mvkgqio9wbuvuy', '.eJxVjEEOwiAQAP_C2RCgtGw9evcNZBdYqRpISnsy_l1JetDrzGRewuO-Zb-3tPolirPQRpx-IWF4pNJNvGO5VRlq2daFZE_kYZu81piel6P9G2RsuX8HM4EdjRlJxeDQKW3DRIRROeTwpawdMRi2BBHJ8TDPWgMYsOCYxfsD-_Q4BA:1qT4D6:ICulMjE5rw0e_iQF7qUf3wdVZJ_CcZUBh10193-q9LQ', '2023-08-21 17:40:04.664989'),
('8s0jec6x6u1h1ik0g8t1q9y18n6m588h', '.eJxVjEEOwiAQAP_C2RCgtGw9evcNZBdYqRpISnsy_l1JetDrzGRewuO-Zb-3tPolirPQRpx-IWF4pNJNvGO5VRlq2daFZE_kYZu81piel6P9G2RsuX8HM4EdjRlJxeDQKW3DRIRROeTwpawdMRi2BBHJ8TDPWgMYsOCYxfsD-_Q4BA:1qSkan:us1w9giT7WvMXUtgzeCXGVPTbEdlHRsnJ8eCEeyTd34', '2023-08-20 20:43:13.131124'),
('9pjjcy4ppwmb2b0q395w2yzmn5stydmh', '.eJxVjEEOwiAQAP_C2RCgtGw9evcNZBdYqRpISnsy_l1JetDrzGRewuO-Zb-3tPolirPQRpx-IWF4pNJNvGO5VRlq2daFZE_kYZu81piel6P9G2RsuX8HM4EdjRlJxeDQKW3DRIRROeTwpawdMRi2BBHJ8TDPWgMYsOCYxfsD-_Q4BA:1qTR42:rCfwI3--ySSm00D8JOI8TvbPO7fP_P2luyfSLVw0QbQ', '2023-08-22 18:04:14.876904'),
('a6vtf96febmh47hq7j5gtjd0tk7n0aie', '.eJxVjMsOwiAQAP-FsyGsPNejd7-BLCyVqqFJaU_GfzckPeh1ZjJvEWnfatx7WePM4iJAnH5ZovwsbQh-ULsvMi9tW-ckRyIP2-Vt4fK6Hu3foFKvY2smmIxTKlhKHk1AQAanUUExFIgZtXYeHIEFCKwsK5XO2Qa0yXgtPl-tHTZO:1qQZ8X:MU2RYDDuC5ZXxzaa11bYWSHllHO1dor8W8mG_m9l_LY', '2023-08-14 20:05:01.355009'),
('blo29szx98c1r1rm6o1o3arakxwrbanp', '.eJxVjDsOwjAQRO_iGlnrz2JDSZ8zWOsfDiBbipMKcXccKQUUI43mzcybOdrW4raeFjdHdmVCsdNv6Ck8U91JfFC9Nx5aXZfZ873CD9r51GJ63Y7u30GhXsbaGzDnSzBKUBZoCSVJ0Bm8tgJxKAEpKaKWCFKBVdng8FlHH4TNwD5f0m42mA:1qTqBs:6dNgedfE5-VkW7QGKNQ3lbuvIXZuq8JRgv6svrMV61s', '2023-08-23 20:54:00.908905'),
('cmgz2wtcp7kjrcnnirkh7hjdr1e6azz2', '.eJxljEEOwiAUBe_CuiFQSgGX7j0D-cDHoghJW9wY7641jYlxOzPvPQh4X1tZ7R3nFBMGizdImRxKy7n72rbgTA5kJB2x0NbpA2wK_8yBv2LZRLhAOVfqa1nn5OiW0N0u9FQD5uPe_hxMsEzvNTOOC8UVcD5qiVqIXqrBcDAixNE5GUXUSsQ-oB40G5iPmulgovYyAFfk-QJNhkjD:1qSjKc:wpKZm0KJy3lKw3VJN-T39YqMAcBL4sMSDIUTxNDXL0w', '2023-08-20 19:22:26.775557'),
('d3pmencwru6pdwlwlkasp17t4cceqcjj', '.eJxljEEOgjAQRe_SNWlohVJYuvcMzXRmkGptE6BujHdXDDExbt97_z8EIOaSVnfnOYyByfENQhRDKjFWX1sWnsUgOlEJB2WdPsAF-mce8MppE3SBdM4Sc1rn4OWWyN0u8pSJ43Fvfw4mWKb32tfWYG208lYBawUHbzQhE9S-AbK26w9ACLYdNSkCo4h6bsjYFhRbI54vk2tKSw:1qSjMy:DtqJsEP_v4cgBfU6t8vgYlDxjHG12LAskiqBfzomvIY', '2023-08-20 19:24:52.302020'),
('ezypxhmf407raultd3w7ond3fgliuy3n', '.eJxVjEEOwiAQAP_C2RCgtGw9evcNZBdYqRpISnsy_l1JetDrzGRewuO-Zb-3tPolirPQRpx-IWF4pNJNvGO5VRlq2daFZE_kYZu81piel6P9G2RsuX8HM4EdjRlJxeDQKW3DRIRROeTwpawdMRi2BBHJ8TDPWgMYsOCYxfsD-_Q4BA:1qSkSS:9jQZtGRMNRRpbRflQOgoZiS0gRYKlSmUmaygaaBOcmY', '2023-08-20 20:34:36.987033'),
('fq9oajb6za1x3kzdfxnvwec9wr6tdl62', '.eJxVjEEOwiAQAP_C2RCgtGw9evcNZBdYqRpISnsy_l1JetDrzGRewuO-Zb-3tPolirPQRpx-IWF4pNJNvGO5VRlq2daFZE_kYZu81piel6P9G2RsuX8HM4EdjRlJxeDQKW3DRIRROeTwpawdMRi2BBHJ8TDPWgMYsOCYxfsD-_Q4BA:1qT4Dy:3ravKYaUw1A5utcaAJmIfrDBz-mrYF1XGRylufU1lww', '2023-08-21 17:40:58.136373'),
('g4x2pzcg3jaiosngprqxdix30u63ajez', '.eJxVjMsOwiAQRf-FdUN4Cnbp3m8gw8uiCElb3Bj_XWoaky4muTnn3nkjcK62sppXmFNMwZvwhJTRWFrOw9-2JcxoRB4NyEBbpx8wyXdG-RFacI9QNuPvUG4Vu1rWOVm8VfBuF3ytPuTL3j08mGCZ-toqok5npziFSKUGyYAREYkVmkrZLxDgjHrBJGGcaB6V7DkKbx3VkaDPF5mASFs:1qTqBc:0sFzDdeFgCVs3zLJOMxPu5Hj0i3HVIvq_ILpe-MjAok', '2023-08-23 20:53:44.298465'),
('hszrd58bzgns8lfbqpkhj6tqf8q7utnr', '.eJxVjDsOwjAQRO_iGlnrz2JDSZ8zWOsfDiBbipMKcXccKQUUI43mzcybOdrW4raeFjdHdmVCsdNv6Ck8U91JfFC9Nx5aXZfZ873CD9r51GJ63Y7u30GhXsbaGzDnSzBKUBZoCSVJ0Bm8tgJxKAEpKaKWCFKBVdng8FlHH4TNwD5f0m42mA:1qTrjw:NPVuerkCIJtDt07_fl-cXdt2J1mXepf2ZcRoyptxOiY', '2023-08-23 22:33:16.089376'),
('i85w9jf04zivlboe8zl4d6agusflzmar', '.eJxVjEEOwiAQAP_C2RCgtGw9evcNZBdYqRpISnsy_l1JetDrzGRewuO-Zb-3tPolirPQRpx-IWF4pNJNvGO5VRlq2daFZE_kYZu81piel6P9G2RsuX8HM4EdjRlJxeDQKW3DRIRROeTwpawdMRi2BBHJ8TDPWgMYsOCYxfsD-_Q4BA:1qSkQ1:G_nNPRMry7uSvdm0cfwPXHOw2A_5Vm98YZn-Q1w8xzU', '2023-08-20 20:32:05.273976'),
('ihkalf3ps90louaee2l6svxand7u84fk', '.eJxljEEOgjAQRe_SNSFOpVBZuvcMzXRmkGptE6BujHdXDDExbt97_z8UEuWSFneXKQxB2MkNQ1R9KjFWX1tmmVSvjKqUw7KMH-AC_zOPdJW0Cr5gOueaclqm4Os1qTc716fMEo9b-3Mw4jy-1wJkrWYPhhqwKJoZLGsAEdnvhpYsgCfddg3BoZWOvLEWDQxgNFhP6vkChd9JjA:1qSjAq:kW30Q3NS36jHTR2bT2J4m07ANTm1rtj0m2HF1dIFeJA', '2023-08-20 19:12:20.272338'),
('kbwql551kylqn8bhgaxsydxkg7w1r8uy', '.eJxljMEOwiAQBf9lzw0pLYXi0bvfQBZYLIqQtMWL8d-1pjExXmfmvQegc6Xm1dxpjiGSN3TDmOCQa0rN19aFZjiAhgYM1nX6ABP9P7PorpQ34S-Yz4W5ktc5WrYlbLcLOxVP6bi3PwcTLtN7TcNIhBaJgkRuR6E054OTpIUSWgrdWm8H7JXtMATqKeiuDc63ikvhQg_PF6ndSm4:1qSjTe:EnBkT3shtLiAxy5719srpmDLxU8lcUx9F9mQzrK5xi8', '2023-08-20 19:31:46.084646'),
('o8owhlf25r7an9zb0rjtsah2ryiy1kph', '.eJxljEEOgjAQRe_SNSGdQoG6dO8ZmmlnkGptE6BujHdXDDExbt97_z8Eep9LWu2d5zAGJss3DFEcUomx-tqy8CwOYhCVsFjW6QNsoH_m0F85bYIumM659jmtc3D1ltS7XepTJo7Hvf05mHCZ3usOW9lo40YeZesBlIfeKQWdBgNEDkFqph58K41Gor5poENnBmRSjWLxfAFu1ElL:1qSjQy:OwAdcC-NDPHH-SjMZTcU015BjwGk2ImE_ATQNHjfdxQ', '2023-08-20 19:29:00.904678'),
('p3xjkyd3q5s1lakw653rc4gyvasvc5dj', '.eJxVjEEOwiAQAP_C2RCgtGw9evcNZBdYqRpISnsy_l1JetDrzGRewuO-Zb-3tPolirPQRpx-IWF4pNJNvGO5VRlq2daFZE_kYZu81piel6P9G2RsuX8HM4EdjRlJxeDQKW3DRIRROeTwpawdMRi2BBHJ8TDPWgMYsOCYxfsD-_Q4BA:1qSw12:w-YNTyGDDmjkVOKwGMvIiy3QBhBM7jmxA-zoEW1sF0s', '2023-08-21 08:55:04.577583'),
('pkpnbttjcus6u8qkeo0f1ly2mohdkujg', '.eJxVjMsOwiAQAP-FsyGsPNejd7-BLCyVqqFJaU_GfzckPeh1ZjJvEWnfatx7WePM4iJAnH5ZovwsbQh-ULsvMi9tW-ckRyIP2-Vt4fK6Hu3foFKvY2smmIxTKlhKHk1AQAanUUExFIgZtXYeHIEFCKwsK5XO2Qa0yXgtPl-tHTZO:1qSw8R:J3quvLtzFAIMzEss8wSbStdGAZvvCo22jXSWyY5P3Wg', '2023-08-21 09:02:43.024998'),
('smriu1t1x3ds878vz12qecih8dsuendl', '.eJxVjEEOwiAQAP_C2RCgtGw9evcNZBdYqRpISnsy_l1JetDrzGRewuO-Zb-3tPolirPQRpx-IWF4pNJNvGO5VRlq2daFZE_kYZu81piel6P9G2RsuX8HM4EdjRlJxeDQKW3DRIRROeTwpawdMRi2BBHJ8TDPWgMYsOCYxfsD-_Q4BA:1qSwZ6:FjNIBw5au_Bg8Ger2SnxE15I48Gs-udMTrvaymUlZrU', '2023-08-21 09:30:16.484610'),
('tf4dmydetv45vp8tfyj06umdss16rag1', '.eJxVjMsOwiAQAP-FsyGsPNejd7-BLCyVqqFJaU_GfzckPeh1ZjJvEWnfatx7WePM4iJAnH5ZovwsbQh-ULsvMi9tW-ckRyIP2-Vt4fK6Hu3foFKvY2smmIxTKlhKHk1AQAanUUExFIgZtXYeHIEFCKwsK5XO2Qa0yXgtPl-tHTZO:1qQ9WL:b3eNgzmtYx00yFSFjBvjoxG7KKZQPzNo51L4T4OJjfI', '2023-08-13 16:43:53.467152'),
('walwznwjiy88enedl4tqo3h4kiqrafzm', '.eJxVjEsOgyAUAO_C2hDBD-iy-56BvAe8SkshUemm6d2rjWnidmYybwbW5pJW8_JzoOCd8U8IkY2pxFj9bVn8zEZmWcUMlHX6ARPcxoQ8QwT78Gk37g7plrnNaZ0D8j3hh134NTsfL0d7GkywTPu3kb1uOyk7rJ1VoGrR2h4RXK2A7EZJKCQtqUXtABU1wyCE1lK3WhGxzxfCWEnG:1qSkCt:EJzFAOYxiekNa4ytciTrIz4wCMxRfq4Hhc0DZlxWf9I', '2023-08-20 20:18:31.820886'),
('x78d7kxhlttbefng7s3r1b4xlkwmezkw', '.eJxVjEEOwiAQAP_C2RCgtGw9evcNZBdYqRpISnsy_l1JetDrzGRewuO-Zb-3tPolirPQRpx-IWF4pNJNvGO5VRlq2daFZE_kYZu81piel6P9G2RsuX8HM4EdjRlJxeDQKW3DRIRROeTwpawdMRi2BBHJ8TDPWgMYsOCYxfsD-_Q4BA:1qTmzA:1Jtr86vFmoYAW9Q0M_VP67HhSBMW4YbKIcZNFR3n7ck', '2023-08-23 17:28:40.727222'),
('zxlv2ewjur3eujqe2vwpmgc06tql0d6h', '.eJxljMEOwiAQBf-Fc0MAqdAevfsNZGG3FkVI2uLF-O-2pjExXmfmvSeDEErNi3vQFIdI6OgOMbE-15Sar60zTaxnB9YwB3UZP8BF_Gcewo3yJvAK-VJ4KHmZoudbwnc783NBSqe9_TkYYR7XdScFBtFab7WUVrbG2hYUojkKMMoLRSAHEl6QH2yHwiMEXKOgTRBaK_Z6A2JvSVU:1qSiyZ:3wph-icIQ770wCkuqA6W584HYJSLP0lGYaCqw-2oCwU', '2023-08-20 18:59:39.941303');

-- --------------------------------------------------------

--
-- 表的结构 `manage_travel_ideas_idea`
--

CREATE TABLE `manage_travel_ideas_idea` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `author_token` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `manage_travel_ideas_idea`
--

INSERT INTO `manage_travel_ideas_idea` (`id`, `title`, `destination`, `description`, `start_date`, `end_date`, `author_token`, `created_at`, `updated_at`) VALUES
(19, 'Uncleftish beholding', 'Angeland', 'For most of its being, mankind did not know what things are made of, but could only guess. With the growth of worldken, we began to learn, and today we have a beholding of stuff and work that watching bears out, both in the workstead and in daily life.\n\nThe underlying kinds of stuff are the firststuffs, which link together in sundry ways to give rise to the rest. Formerly we knew of ninety-two firststuffs, from waterstuff, the lightest and barest, to ymirstuff, the heaviest. Now we have made more, such as aegirstuff and helstuff.\n\nThe firststuffs have their being as motes called unclefts. These are mightly small; one seedweight of waterstuff holds a tale of them like unto two followed by twenty-two naughts. Most unclefts link together to make what are called bulkbits. Thus, the waterstuff bulkbit bestands of two waterstuff unclefts, the sourstuff bulkbit of two sourstuff unclefts, and so on. (Some kinds, such as sunstuff, keep alone; others, such as iron, cling together in ices when in the fast standing; and there are yet more yokeways.) When unlike clefts link in a bulkbit, they make bindings. Thus, water is a binding of two waterstuff unclefts with one sourstuff uncleft, while a bulkbit of one of the forestuffs making up flesh may have a thousand thousand or more unclefts of these two firststuffs together with coalstuff and chokestuff.\n\nAt first it was thought that the uncleft was a hard thing that could be split no further; hence the name. Now we know it is made up of lesser motes. There is a heavy kernel with a forward bernstonish lading, and around it one or more light motes with backward ladings. The least uncleft is that of ordinary waterstuff. Its kernel is a lone forwardladen mote called a firstbit. Outside it is a backwardladen mote called a bernstonebit. The firstbit has a heaviness about 1840-fold that of the bernstonebit. Early worldken folk thought bernstonebits swing around the kernel like the earth around the sun, but now we understand they are more like waves or clouds.', '2023-08-10', '2023-08-10', '3b8ca5a46b3cbd08bf91a50ffbb809e75b56bc46', '2023-08-09 17:24:57.886154', '2023-08-09 17:24:57.897154'),
(20, 'I want to go to tokyo', 'Tokyo', 'I want to go to tokyo', '2023-09-26', '2023-09-30', '3b8ca5a46b3cbd08bf91a50ffbb809e75b56bc46', '2023-08-09 18:54:03.166760', '2023-08-09 18:54:03.166760'),
(22, 'Hawaii is not America!', 'Hawaii', 'RT', '2023-08-30', '2023-09-19', '3b8ca5a46b3cbd08bf91a50ffbb809e75b56bc46', '2023-08-09 18:57:36.329882', '2023-08-09 18:57:36.329882'),
(24, 'This post is definitely not used for testing', 'Tokyo', 'Brother Ephraim sold his Cow\nAnd bought him a Commission;\nAnd then he went to Canada\nTo fight for the Nation;\n\nBut when Ephraim he came home\nHe proved an arrant Coward,\nHe wouldn\'t fight the Frenchmen there\nFor fear of being devoured.', '2023-08-03', '2023-08-09', '8a739b7ee8623b07a04615c93d38d1099f1eaf42', '2023-08-09 22:42:07.932217', '2023-08-09 22:42:07.932217'),
(25, 'Korea is the best country in the world', 'Kyoto', 'Long live Kim Jong Un!', '2023-08-10', '2023-09-27', '8a739b7ee8623b07a04615c93d38d1099f1eaf42', '2023-08-09 22:43:59.634046', '2023-08-09 22:43:59.634046');

-- --------------------------------------------------------

--
-- 表的结构 `polls_choice`
--

CREATE TABLE `polls_choice` (
  `id` bigint(20) NOT NULL,
  `choice_text` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `polls_choice`
--

INSERT INTO `polls_choice` (`id`, `choice_text`, `votes`, `question_id`) VALUES
(1, 'Not much', 2, 1),
(2, 'The sky', 2, 1),
(4, 'Once per week', 0, 2),
(5, 'Never', 0, 2),
(6, '100', 0, 3),
(7, '2000', 0, 3),
(8, 'here', 0, 4),
(9, 'not here', 0, 4);

-- --------------------------------------------------------

--
-- 表的结构 `polls_question`
--

CREATE TABLE `polls_question` (
  `id` bigint(20) NOT NULL,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `polls_question`
--

INSERT INTO `polls_question` (`id`, `question_text`, `pub_date`) VALUES
(1, 'What\'s up?', '2023-07-27 19:06:41.536722'),
(2, 'How often?', '2023-07-29 16:12:25.000000'),
(3, 'How much?', '2023-07-29 16:12:48.000000'),
(4, 'Where?', '2023-07-02 16:13:13.000000');

-- --------------------------------------------------------

--
-- 表的结构 `socialaccount_socialaccount`
--

CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `socialaccount_socialapp`
--

CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `socialaccount_socialtoken`
--

CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `taggit_tag`
--

CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `taggit_tag`
--

INSERT INTO `taggit_tag` (`id`, `name`, `slug`) VALUES
(7, 'test', 'test'),
(8, 'hk', 'hk'),
(9, 'idea', 'idea'),
(10, 'test --- 001', 'test-001'),
(11, 'rest', 'rest'),
(12, 'hey', 'hey'),
(13, 'placeholder tag', 'placeholder-tag'),
(14, 'updated tags', 'updated-tags'),
(15, '3rd tag', '3rd-tag'),
(16, 'hahaha', 'hahaha'),
(17, 'Anglish', 'anglish'),
(18, 'Linguistics', 'linguistics'),
(19, 'Japan', 'japan'),
(20, 'Asia', 'asia'),
(21, 'USA', 'usa'),
(22, 'Pacific', 'pacific'),
(23, 'East Asia', 'east-asia'),
(24, 'tag2', 'tag2'),
(25, 'Somaliland', 'somaliland'),
(26, 'DPRK', 'dprk');

-- --------------------------------------------------------

--
-- 表的结构 `taggit_taggeditem`
--

CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `taggit_taggeditem`
--

INSERT INTO `taggit_taggeditem` (`id`, `object_id`, `content_type_id`, `tag_id`) VALUES
(36, 19, 9, 17),
(37, 19, 9, 18),
(38, 20, 9, 19),
(39, 20, 9, 20),
(40, 22, 9, 21),
(41, 22, 9, 22),
(44, 24, 9, 24),
(45, 24, 9, 25),
(47, 25, 9, 19),
(46, 25, 9, 26);

--
-- 转储表的索引
--

--
-- 表的索引 `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`);

--
-- 表的索引 `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`);

--
-- 表的索引 `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- 表的索引 `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 表的索引 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- 表的索引 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- 表的索引 `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 表的索引 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- 表的索引 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- 表的索引 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- 表的索引 `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- 表的索引 `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- 表的索引 `manage_travel_ideas_idea`
--
ALTER TABLE `manage_travel_ideas_idea`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `polls_choice`
--
ALTER TABLE `polls_choice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `polls_choice_question_id_c5b4b260_fk_polls_question_id` (`question_id`);

--
-- 表的索引 `polls_question`
--
ALTER TABLE `polls_question`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  ADD KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`);

--
-- 表的索引 `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  ADD KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`);

--
-- 表的索引 `taggit_tag`
--
ALTER TABLE `taggit_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- 表的索引 `taggit_taggeditem`
--
ALTER TABLE `taggit_taggeditem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq` (`content_type_id`,`object_id`,`tag_id`),
  ADD KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  ADD KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  ADD KEY `taggit_taggeditem_content_type_id_object_id_196cc965_idx` (`content_type_id`,`object_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- 使用表AUTO_INCREMENT `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- 使用表AUTO_INCREMENT `manage_travel_ideas_idea`
--
ALTER TABLE `manage_travel_ideas_idea`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用表AUTO_INCREMENT `polls_choice`
--
ALTER TABLE `polls_choice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `polls_question`
--
ALTER TABLE `polls_question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `taggit_tag`
--
ALTER TABLE `taggit_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- 使用表AUTO_INCREMENT `taggit_taggeditem`
--
ALTER TABLE `taggit_taggeditem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- 限制导出的表
--

--
-- 限制表 `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- 限制表 `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 限制表 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `polls_choice`
--
ALTER TABLE `polls_choice`
  ADD CONSTRAINT `polls_choice_question_id_c5b4b260_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`);

--
-- 限制表 `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  ADD CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`);

--
-- 限制表 `taggit_taggeditem`
--
ALTER TABLE `taggit_taggeditem`
  ADD CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
