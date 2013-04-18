INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (1,'ROOT','ROOT','a',NULL,NULL,NULL);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (2,'系统管理','SYSTEM','a',NULL,NULL,1);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (3,'用户管理','USER','bb','user/list',NULL,2);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (4,'菜单管理','MENU','cc','menu/list',NULL,2);



INSERT INTO `t_icon` VALUES (1,'pictures','.png','pictures','resources/custom/images');


INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`) VALUES (1,'ww','ww','ww','ww','ww','ww','ww');
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`) VALUES (2,NULL,NULL,NULL,NULL,'33',NULL,'22');
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`) VALUES (3,'123',NULL,NULL,NULL,NULL,'qe','qe');
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`) VALUES (4,'qe','e','qwe','qwe','qwe','qe','qe');
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`) VALUES (5,NULL,'e','qwe','qe','qweq','eq','e');
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`) VALUES (6,NULL,'qe','qe','qe','qwe','qew','e');
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`) VALUES (7,NULL,'qew','qe','qew','qwe','qwe','qew');
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`) VALUES (8,NULL,'qwe','qe','qwe','qwe','qew','qwe');
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`) VALUES (9,NULL,'qe','qe','qe','qe','qeq','e');
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`) VALUES (10,'q','eq','e','qe','qe','qe','qe');
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`) VALUES (11,NULL,'qe','qe','qe','qe','qe','qe');


INSERT INTO `t_operation` VALUES (1,'Query','QUERY');
INSERT INTO `t_operation` VALUES (2,'Edit','EDIT');


INSERT INTO `t_authority` VALUES (1,NULL,'ROLE_USER_QUERY',3,1);
INSERT INTO `t_authority` VALUES (2,NULL,'ROLE_USER_EDIT',3,2);