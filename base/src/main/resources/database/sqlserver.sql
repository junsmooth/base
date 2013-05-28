

  SET IDENTITY_INSERT [t_icon] ON

 INSERT [t_icon] ( [id] , [iconcls] , [extension] , [iconname] , [iconpath] ) VALUES ( 1 , 'pictures' , '.png' , 'pictures' , 'resources/custom/images' )

 SET IDENTITY_INSERT [t_icon] OFF
 
 SET IDENTITY_INSERT [t_user] ON

 INSERT [t_user] ( [id] , [address] , [cardno] , [email] , [enabled] , [password] , [realname] , [telephone] , [username] ) VALUES ( 1 , 'sdfasdf' , '223' , 'dafd@sdf' , 'Y' , 'admin' , 'admin' , '212323' , 'admin' )

 SET IDENTITY_INSERT [t_user] OFF



SET IDENTITY_INSERT [t_menu] ON
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 1 , 'ROOT' , 'ROOT' , 'ROOT' , '/',NULL,NULL )
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 2 , 'ϵͳ����' , 'SYSTEM' , 'SYSTEM' , 'system',NULL,1 )
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 3 , '�û�����' , 'USER' , 'USER' , 'user/list',NULL,2)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 4 , '�˵�����' , 'MENU' , 'MENU' , 'menu/list',NULL,2)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 5 , '��ɫ����' , 'ROLE' , 'ROLE' , 'role/list',NULL,2)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 6 , '��������' , 'CONFIG' , 'CONFIG' , 'config',NULL,1)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 7 , '�������' , 'MONTYPE' , 'MONTYPE' , 'config/montype',NULL,6)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 8 , '����' , 'MONPOINT' , 'MONPOINT' , 'config/monpoint',NULL,6)
INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 9 , 'ʵʱ����' , 'CHART' , 'chart' , 1 , 1 )
INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 10 , '����λ�ƹ�����' , 'BMWYCHART' , 'chart/bmwy' , 1 , 9 )
INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 11 , '��ʷ����' , 'DATA' , 'data' , 1 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 12 , '����λ������' , 'BMWYDATA' , 'data/bmwy' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 13 , 'ϵͳ��־' , 'LOG' , 'log' , 1 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 14 , '������־' , 'ALARMLOG' , 'log/alarm' , 1 , 13 )

SET IDENTITY_INSERT [t_menu] OFF

SET IDENTITY_INSERT [t_operation] ON

 INSERT [t_operation] ( [id] , [name] , [opcode] ) VALUES (1,'View','VIEW');
 INSERT [t_operation] ( [id] , [name] , [opcode] ) VALUES (2,'Query','QUERY');
 INSERT [t_operation] ( [id] , [name] , [opcode] ) VALUES (3,'Edit','EDIT');
SET IDENTITY_INSERT [t_operation] OFF


SET IDENTITY_INSERT [t_authority] ON
INSERT [t_authority] ( [id] , [description] , [name] ) VALUES ( 1 , NULL,'ROLE_SYSTEM');
INSERT [t_authority] ( [id] , [description] , [name] ) VALUES ( 2 , NULL,'ROLE_USER_QUERY');
INSERT [t_authority] ( [id] , [description] , [name] ) VALUES ( 3 , NULL,'ROLE_USER_EDIT');


 SET IDENTITY_INSERT [t_authority] OFF

 SET IDENTITY_INSERT [t_role] ON

 INSERT [t_role] ( [id] , [name] , [roledesc] ) VALUES ( 1 , 'ϵͳ����Ա' , 'SYSMANAGE' )

 SET IDENTITY_INSERT [t_role] OFF

 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 1 , 1 )
 
 
 
 INSERT [t_user_role] ( [uid] , [rid] ) VALUES ( 1 , 1 )
 
 SET IDENTITY_INSERT [t_montype] ON

 INSERT [t_montype] ( [id] , [code] , [name] , [tableName] ) VALUES ( 1 , 'BMWY' , '����λ��' , 'MeanPos_DeformationMonitor_Default' )

 SET IDENTITY_INSERT [t_montype] OFF
 SET IDENTITY_INSERT [t_monpoint] ON

 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 1 , '����λ��1#' , 1 , 1 )

 SET IDENTITY_INSERT [t_monpoint] OFF
 
 