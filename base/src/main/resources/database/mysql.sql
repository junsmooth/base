INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (1,'ROOT','ROOT','a','/',NULL,NULL);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (2,'ϵͳ����','SYSTEM','a','system',NULL,1);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (3,'�û�����','USER','bb','user/list',NULL,2);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (4,'�˵�����','MENU','cc','menu/list',NULL,2);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (5,'��ɫ����','ROLE','cc','role/list',NULL,2);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (6, '��������', 'CONFIG', 'CONFIG', 'config', NULL, 1);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (7, '�������', 'MONTYPE', 'MONTYPE', 'config/montype', NULL, 6);
INSERT INTO `t_menu` (`id`,`menuname`,`modulename`,`menuorder`,`url`,`iconid`,`parentid`) VALUES (8, '����', 'MONPOINT', 'MONPOINT', 'config/monpoint', NULL, 6);

INSERT INTO `t_icon` VALUES (1,'pictures','.png','pictures','resources/custom/images');


INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (1,'ww','ww','ww','ww','ww','ww','ww',1);
INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (2,NULL,NULL,NULL,'ww','33',NULL,'22',1);

INSERT INTO `t_user` (`id`,`address`,`cardno`,`email`,`password`,`realname`,`telephone`,`username`,`enabled`) VALUES (12,NULL,'admin','admin','admin','admin','admin','admin',1);

INSERT INTO `t_operation` VALUES (1,'View','VIEW');
INSERT INTO `t_operation` VALUES (2,'Query','QUERY');
INSERT INTO `t_operation` VALUES (3,'Edit','EDIT');

INSERT INTO `t_authority` VALUES (1,NULL,'ROLE_SYSTEM');
INSERT INTO `t_authority` VALUES (2,NULL,'ROLE_USER_QUERY');
INSERT INTO `t_authority` VALUES (3,NULL,'ROLE_USER_EDIT');

INSERT INTO `t_role` VALUES (1,'ϵͳ����Ա','SYSMANAGE');
INSERT INTO `t_role_authority` VALUES (1,1);

INSERT INTO `t_user_role` VALUES (12,1);