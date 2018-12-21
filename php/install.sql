-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-12-21 13:54:18
-- 服务器版本： 5.7.18
-- PHP Version: 7.0.27-1+ubuntu14.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `customerservice`
--

-- --------------------------------------------------------

--
-- 表的结构 `oa_admin_access`
--

CREATE TABLE `oa_admin_access` (
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oa_admin_access`
--

INSERT INTO `oa_admin_access` (`user_id`, `group_id`) VALUES
(2, 15),
(4, 17),
(5, 17),
(6, 19);

-- --------------------------------------------------------

--
-- 表的结构 `oa_admin_group`
--

CREATE TABLE `oa_admin_group` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `rules` varchar(4000) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限组表';

--
-- 转存表中的数据 `oa_admin_group`
--

INSERT INTO `oa_admin_group` (`id`, `title`, `rules`, `pid`, `remark`, `status`) VALUES
(16, '开发人员', '66,67,68,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,59,61,62,63,64,69,70', 0, '', 1),
(17, '运营', '10,59,64,66,67,68,69,70,71,72', 0, '邮箱功能', 1),
(18, '主管', '10,54,55,56,57,59,62', 0, '人员管理功能', 1),
(19, 'user01', '73,76,66,67,68,69,70,64,10,59,63,38,39,40,41,43,30,31,32,33,35,34', NULL, 'user01', 1);

-- --------------------------------------------------------

--
-- 表的结构 `oa_admin_menu`
--

CREATE TABLE `oa_admin_menu` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '菜单ID',
  `pid` int(11) UNSIGNED DEFAULT '0' COMMENT '上级菜单ID',
  `title` varchar(32) DEFAULT '' COMMENT '菜单名称',
  `url` varchar(127) DEFAULT '' COMMENT '链接地址',
  `icon` varchar(64) DEFAULT '' COMMENT '图标',
  `menu_type` tinyint(4) DEFAULT NULL COMMENT '菜单类型',
  `sort` tinyint(4) UNSIGNED DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `rule_id` int(11) DEFAULT NULL COMMENT '权限id',
  `module` varchar(50) DEFAULT NULL,
  `menu` varchar(50) DEFAULT NULL COMMENT '三级菜单吗'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【配置】后台菜单表';

--
-- 转存表中的数据 `oa_admin_menu`
--

INSERT INTO `oa_admin_menu` (`id`, `pid`, `title`, `url`, `icon`, `menu_type`, `sort`, `status`, `rule_id`, `module`, `menu`) VALUES
(52, 0, '系统模块', '', '', 1, 0, 1, 59, 'Admin', ''),
(53, 52, '系统配置', '', '', 1, 100, 1, 61, 'Admin', ''),
(54, 53, '菜单管理', '/admin/menu/list', '', 1, 0, 1, 21, 'Admin', 'menu'),
(55, 53, '系统参数', '/admin/config/add', '', 1, 0, 1, 29, 'Admin', 'systemConfig'),
(56, 53, '权限规则', '/admin/rule/list', '', 1, 0, 1, 13, 'Admin', 'rule'),
(57, 52, '组织架构', '', '', 1, 1, 1, 63, 'Admin', ''),
(58, 57, '岗位管理', '/admin/position/list', '', 1, 0, 1, 31, 'Admin', 'position'),
(59, 57, '部门管理', '/admin/structures/list', '', 1, 0, 1, 39, 'Admin', 'structures'),
(60, 57, '用户组管理', '/admin/groups/list', '', 1, 0, 1, 47, 'Admin', 'groups'),
(61, 52, '成员管理', '', '', 1, 0, 1, 62, 'Admin', ''),
(62, 61, '成员列表', '/admin/users/list', '', 1, 0, 1, 55, 'Admin', 'users'),
(63, 66, '邮件管理', '', '', 1, 2, 1, 64, 'Busi', ''),
(64, 63, '收信箱', '/busi/mail/list', '', 1, 0, 1, 66, 'Busi', 'maildatas'),
(65, 63, '写信', '/busi/mail/send', '', 1, 0, 1, 71, 'Busi', 'mailSends'),
(66, 0, '业务模块', '', '', 1, 0, 1, 76, 'Busi', '');

-- --------------------------------------------------------

--
-- 表的结构 `oa_admin_post`
--

CREATE TABLE `oa_admin_post` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '岗位备注',
  `create_time` int(11) DEFAULT NULL COMMENT '数据创建时间',
  `status` tinyint(5) DEFAULT '1' COMMENT '状态1启用,0禁用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='岗位表';

--
-- 转存表中的数据 `oa_admin_post`
--

INSERT INTO `oa_admin_post` (`id`, `name`, `remark`, `create_time`, `status`) VALUES
(75, 'cc', 'cc', 1535939310, 1),
(85, '99', '99', 1545017251, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oa_admin_rule`
--

CREATE TABLE `oa_admin_rule` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `name` varchar(100) DEFAULT '' COMMENT '定义',
  `level` tinyint(5) DEFAULT NULL COMMENT '级别。1模块,2控制器,3操作',
  `pid` int(11) DEFAULT '0' COMMENT '父id，默认0',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态，1启用，0禁用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

--
-- 转存表中的数据 `oa_admin_rule`
--

INSERT INTO `oa_admin_rule` (`id`, `title`, `name`, `level`, `pid`, `status`) VALUES
(10, '系统模块', 'admin', 1, 0, 1),
(11, '权限规则', 'rules', 2, 10, 1),
(13, '规则列表', 'index', 3, 11, 1),
(14, '权限详情', 'read', 3, 11, 1),
(15, '编辑权限', 'update', 3, 11, 1),
(16, '删除权限', 'delete', 3, 11, 1),
(17, '添加权限', 'save', 3, 11, 1),
(18, '批量删除权限', 'deletes', 3, 11, 1),
(19, '批量启用/禁用权限', 'enables', 3, 11, 1),
(20, '菜单管理', 'menus', 2, 10, 1),
(21, '菜单列表', 'index', 3, 20, 1),
(22, '添加菜单', 'save', 3, 20, 1),
(23, '菜单详情', 'read', 3, 20, 1),
(24, '编辑菜单', 'update', 3, 20, 1),
(25, '删除菜单', 'delete', 3, 20, 1),
(26, '批量删除菜单', 'deletes', 3, 20, 1),
(27, '批量启用/禁用菜单', 'enables', 3, 20, 1),
(28, '系统参数', 'systemConfigs', 2, 10, 1),
(29, '修改系统配置', 'save', 3, 28, 1),
(30, '岗位管理', 'posts', 2, 10, 1),
(31, '岗位列表', 'index', 3, 30, 1),
(32, '岗位详情', 'read', 3, 30, 1),
(33, '编辑岗位', 'update', 3, 30, 1),
(34, '删除岗位', 'delete', 3, 30, 1),
(35, '添加岗位', 'save', 3, 30, 1),
(36, '批量删除岗位', 'deletes', 3, 30, 1),
(37, '批量启用/禁用岗位', 'enables', 3, 30, 1),
(38, '部门管理', 'structures', 2, 10, 1),
(39, '部门列表', 'index', 3, 38, 1),
(40, '部门详情', 'read', 3, 38, 1),
(41, '编辑部门', 'update', 3, 38, 1),
(42, '删除部门', 'delete', 3, 38, 1),
(43, '添加部门', 'save', 3, 38, 1),
(44, '批量删除部门', 'deletes', 3, 38, 1),
(45, '批量启用/禁用部门', 'enables', 3, 38, 1),
(46, '用户组管理', 'groups', 2, 10, 1),
(47, '用户组列表', 'index', 3, 46, 1),
(48, '用户组详情', 'read', 3, 46, 1),
(49, '编辑用户组', 'update', 3, 46, 1),
(50, '删除用户组', 'delete', 3, 46, 1),
(51, '添加用户组', 'save', 3, 46, 1),
(52, '批量删除用户组', 'deletes', 3, 46, 1),
(53, '批量启用/禁用用户组', 'enables', 3, 46, 1),
(54, '成员管理', 'users', 2, 10, 1),
(55, '成员列表', 'index', 3, 54, 1),
(56, '成员详情', 'read', 3, 54, 1),
(57, '删除成员', 'delete', 3, 54, 1),
(59, '系统模块（菜单）', 'Adminstrative', 2, 10, 1),
(61, '系统配置（菜单）', 'systemConfig', 1, 59, 1),
(62, '成员管理（菜单）', 'personnel', 3, 59, 1),
(63, '组织架构（菜单）', 'structures', 3, 59, 1),
(64, '邮件管理（菜单）', 'subEmail', 3, 73, 1),
(66, '收信箱', 'maildatas', 2, 73, 1),
(67, '邮件列表', 'index', 3, 66, 1),
(68, '邮件详情', 'read', 3, 66, 1),
(69, '删除邮件', 'delete', 3, 66, 1),
(70, '批量标记为已读/未读', 'unreads', 3, 66, 1),
(71, '写信', 'mailSends', 2, 73, 1),
(72, '发送邮件', 'send', 3, 71, 1),
(73, '业务模块', 'busi', 1, 0, 1),
(76, '业务模块（菜单）', 'Busi', 2, 73, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oa_admin_structure`
--

CREATE TABLE `oa_admin_structure` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT '',
  `pid` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oa_admin_structure`
--

INSERT INTO `oa_admin_structure` (`id`, `name`, `pid`, `status`) VALUES
(1, '随便测试', 55, 1),
(5, '设计部', 1, 1),
(6, '职能部', 1, 1),
(37, '总经办', 1, 1),
(52, '项目部', 1, 1),
(53, '测试部', 1, 1),
(54, '开发部', 1, 1),
(55, '市场部', 37, 1),
(56, '研发部', 1, 1),
(57, '企业微信', 57, 1),
(58, '村上春树', 60, 1),
(59, '12321', 5, 1),
(60, 'test456', 60, 1),
(61, '哈哈哈', 61, 1),
(62, 'nhbh', 61, 1),
(63, '111111111', 65, 1),
(64, '2222222222222', 63, 1),
(65, '333333333333', 64, 1),
(66, '爱上', 66, 1),
(67, '111', 67, 1),
(68, '1去', 68, 1),
(69, 'aaaa', 69, 1),
(70, 'wwww', 70, 1),
(71, 'aa', 70, 1),
(72, '1', 72, 1),
(73, '去', 73, 1),
(74, '111', 69, 1),
(75, '测试', 77, 1),
(76, '222', 75, 1),
(77, '22', 76, 1),
(78, '333', 77, 1),
(79, '888', 79, 1),
(80, '1111', 80, 1),
(81, '2222', 80, 1),
(82, '222222', 80, 1),
(83, '4', 0, 1),
(84, '4', 83, 1),
(85, '41414', 85, 1),
(86, '好用这', 0, 1),
(87, 'eee', 86, 1),
(88, 'sdf', 0, 1),
(89, 'egqgw', 86, 1),
(90, '？？', 86, 1),
(91, '1231', 86, 1),
(92, '12', 88, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oa_admin_user`
--

CREATE TABLE `oa_admin_user` (
  `id` int(11) NOT NULL COMMENT '主键',
  `username` varchar(100) DEFAULT NULL COMMENT '管理后台账号',
  `password` varchar(100) DEFAULT NULL COMMENT '管理后台密码',
  `remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  `create_time` int(11) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `structure_id` int(11) DEFAULT NULL COMMENT '部门',
  `post_id` int(11) DEFAULT NULL COMMENT '岗位',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态,1启用0禁用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `oa_admin_user`
--

INSERT INTO `oa_admin_user` (`id`, `username`, `password`, `remark`, `create_time`, `realname`, `structure_id`, `post_id`, `status`) VALUES
(1, 'admin', 'd93a5def7511da3d0f2d171d9c344e91', '', NULL, '超级管理员', 1, 5, 1),
(6, 'user01', 'a55a44bdc1fcc92b575b5f48f04483aa', 'user01', 1520393301, 'user01', 1, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `oa_system_config`
--

CREATE TABLE `oa_system_config` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '配置ID',
  `name` varchar(50) DEFAULT '',
  `value` varchar(100) DEFAULT '' COMMENT '配置值',
  `group` tinyint(4) UNSIGNED DEFAULT '0' COMMENT '配置分组',
  `need_auth` tinyint(4) DEFAULT '1' COMMENT '1需要登录后才能获取，0不需要登录即可获取'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='【配置】系统配置表';

--
-- 转存表中的数据 `oa_system_config`
--

INSERT INTO `oa_system_config` (`id`, `name`, `value`, `group`, `need_auth`) VALUES
(1, 'SYSTEM_NAME', 'VueThink通用后台登录', 0, 1),
(2, 'SYSTEM_LOGO', 'uploads\\20170219\\d9fe7b784e1b1f406234b7b301e627e8.png', 0, 1),
(3, 'LOGIN_SESSION_VALID', '43200', 0, 1),
(4, 'IDENTIFYING_CODE', '0', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oa_admin_group`
--
ALTER TABLE `oa_admin_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oa_admin_menu`
--
ALTER TABLE `oa_admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oa_admin_post`
--
ALTER TABLE `oa_admin_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oa_admin_rule`
--
ALTER TABLE `oa_admin_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oa_admin_structure`
--
ALTER TABLE `oa_admin_structure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oa_admin_user`
--
ALTER TABLE `oa_admin_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oa_system_config`
--
ALTER TABLE `oa_system_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `参数名` (`name`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `oa_admin_group`
--
ALTER TABLE `oa_admin_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `oa_admin_menu`
--
ALTER TABLE `oa_admin_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单ID', AUTO_INCREMENT=67;
--
-- 使用表AUTO_INCREMENT `oa_admin_post`
--
ALTER TABLE `oa_admin_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- 使用表AUTO_INCREMENT `oa_admin_rule`
--
ALTER TABLE `oa_admin_rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- 使用表AUTO_INCREMENT `oa_admin_structure`
--
ALTER TABLE `oa_admin_structure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- 使用表AUTO_INCREMENT `oa_admin_user`
--
ALTER TABLE `oa_admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `oa_system_config`
--
ALTER TABLE `oa_system_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID', AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
