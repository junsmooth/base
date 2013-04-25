INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (1,'ROOT','ROOT','a','/',NULL,NULL);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (2,'系统管理','SYSTEM','a','system',NULL,1);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (3,'用户管理','USER','bb','user/list',NULL,2);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (4,'菜单管理','MENU','cc','menu/list',NULL,2);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (5,'角色管理','ROLE','cc','role/list',NULL,2);



INSERT INTO `t_icon` VALUES (1,'pictures','.png','pictures','resources/custom/images');


INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (1,'ww','ww','ww','ww','ww','ww','ww',1);
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (2,NULL,NULL,NULL,NULL,'33',NULL,'22',1);
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (3,'123',NULL,NULL,NULL,NULL,'qe','qe',1);
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (4,'qe','e','qwe','qwe','qwe','qe','qe',1);
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (5,NULL,'e','qwe','qe','qweq','eq','e',1);
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (6,NULL,'qe','qe','qe','qwe','qew','e',1);
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (7,NULL,'qew','qe','qew','qwe','qwe','qew',1);
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (8,NULL,'qwe','qe','qwe','qwe','qew','qwe',1);
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (9,NULL,'qe','qe','qe','qe','qeq','e',1);
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (10,'q','eq','e','qe','qe','qe','qe',1);
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (11,NULL,'qe','qe','qe','qe','qe','qe',1);
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (12,NULL,'admin','admin','admin','admin','admin','admin',1);

INSERT INTO `t_operation` VALUES (1,'View','VIEW');
INSERT INTO `t_operation` VALUES (2,'Query','QUERY');
INSERT INTO `t_operation` VALUES (3,'Edit','EDIT');

INSERT INTO `t_authority` VALUES (1,NULL,'ROLE_SYSTEM',null,null);
INSERT INTO `t_authority` VALUES (2,NULL,'ROLE_USER_QUERY',3,1);
INSERT INTO `t_authority` VALUES (3,NULL,'ROLE_USER_EDIT',3,2);

INSERT INTO `t_role` VALUES (1,'系统管理员','SYSMANAGE');
INSERT INTO `t_role_authority` VALUES (1,1);

INSERT INTO `t_user_role` VALUES (12,1);