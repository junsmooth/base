 SET IDENTITY_INSERT [t_icon_type] ON

 INSERT [t_icon_type] ( [id] , [cnname] , [name] ) VALUES ( 1 , '�˵�ͼ��' , 'MENUICON' )
 INSERT [t_icon_type] ( [id] , [cnname] , [name] ) VALUES ( 2 , '���ͼ��' , 'MONITORICON' )

 SET IDENTITY_INSERT [t_icon_type] OFF


 SET IDENTITY_INSERT [t_icon] ON

  INSERT [t_icon] ( [id] , [iconcls] , [extension] , [iconname] , [iconpath] , [type_id] ) VALUES ( 1 , 'pictures' , '.png' , 'pictures' , 'resources/custom/images' , 1 )

 SET IDENTITY_INSERT [t_icon] OFF
 
 SET IDENTITY_INSERT [t_user] ON

 INSERT [t_user] ( [id] , [address] , [cardno] , [email] , [enabled] , [password] , [realname] , [telephone] , [username] ) VALUES ( 1 , 'sdfasdf' , '223' , 'dafd@sdf' , 'Y' , 'admin' , 'admin' , '212323' , 'admin' )
 INSERT [t_user] ( [id] , [address] , [email] , [enabled] , [password] , [realname] , [telephone] , [username] ) VALUES ( 3 , 'user' , '' , 'Y' , 'user' , 'user' , '13260053081' , 'user' )

 SET IDENTITY_INSERT [t_user] OFF


SET IDENTITY_INSERT [t_menu] ON
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] ) VALUES ( 1 , 'ROOT' , 'ROOT' , 'ROOT' , '/' )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 2 , 'ϵͳ����' , 'SYSTEM' , 'SYSTEM' , '' , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 3 , '�û�����' , 'USER' , 'USER' , 'user' , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 4 , '�˵�����' , 'MENU' , 'MENU' , 'menu' , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 5 , '��ɫ����' , 'ROLE' , 'ROLE' , 'role' , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 6 , '��������' , 'CONFIG' , 'CONFIG' , 'config' , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 7 , '�������' , 'MONTYPE' , 'MONTYPE' , 'config/montype' , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 8 , '����' , 'MONPOINT' , 'MONPOINT' , 'config/monpoint' , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 9 , 'ʵʱ����' , 'CHART' , '' , 1 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 10 , '����λ�ƹ�����' , 'BMWYCHART' , 'bmwy/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 11 , '��ʷ����' , 'DATA' , '' , 1 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 12 , '����λ������' , 'BMWYDATA' , 'bmwy/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 13 , 'ϵͳ��־' , 'LOG' , '' , 1 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 14 , '������¼' , 'ALARMLOG' , 'alarm/alarmrecord' , 1 , 13 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 15 , '����������' , 'JRXDATA' , 'jrx/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 16 , '��̲�߳�' , 'DRYBEACHELEVA' , 'gtgc/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 17 , '��̲��������' , 'DRYBEACHLENGTH' , 'gtcd/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 18 , '��ˮλ����' , 'WATERLEVEL' , 'ksw/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 19 , '����������' , 'JIANGYULANGSHJU' , 'jyl/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 20 , '��ȫ��������' , 'ANUANCHAOGOSHUJU' , 'aqcg/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 21 , '�Ӷ��߳�����' , 'BADINGGAOCHENGSHUJU' , 'bdgc/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 22 , '����������' , 'SHELIULIANGSHUJU' , 'sll/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 23 , '�ڲ�λ������' , 'NEIBUWEIYISHUJU' , 'nbwy/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 24 , '�����߹�����' , 'JINRUNXIAN' , 'jrx/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 25 , '�������' , 'MONATTR' , 'config/monattr' , 1 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 26 , '������ֵ' , 'THRESHOLD' , 'alarm/threshold' , 1 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 27 , '��������' , 'ALARMTYPE' , 'alarm/alarmtype' , 1 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 28 , '������ɫ' , 'ALARMCOLOR' , 'alarm/alarmcolor' , 1 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 29 , '��̲�̹߳�����' , 'GANTANGAOCHENGXIAN' , 'gtgc/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 30 , '��̲���ȹ�����' , 'GANTANCHANGDUXIAN' , 'gtcd/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 31 , '��ˮλ������' , 'KSWGUOCHENGXIAN' , 'ksw/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 32 , '������������' , 'JIANGYULIANGXIAN' , 'jyl/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 33 , '��ȫ���߹�����' , 'ANQUANCHAOGAOXIAN' , 'aqcg/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 34 , '�Ӷ��̹߳�����' , 'BADINGGAOCHENGXIAN' , 'bdgc/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 35 , '������������' , 'SHELIULIANGXIAN' , 'sll/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 36 , '�ڲ�λ�ƹ�����' , 'NEIBUWEIYIXIAN' , 'nbwy/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 37 , 'ͼ�����' , 'ICON' , 'icon' , 1 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 38 , 'Portal' , 'Portal' , 'homepage/information' , 1 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 39 , '���ͼ' , 'JIANCETU' , 'topo/main' , 1 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 40 , '������ͼ' , 'SATPIC' , 'topo/satellite' , 1 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 41 , '��ά��ͼ' , 'THREEDIMENSION' , 'topo/threedimension' , 1 , 2 )

 SET IDENTITY_INSERT [t_menu] OFF

SET IDENTITY_INSERT [t_operation] ON

 INSERT [t_operation] ( [id] , [name] , [opcode] ) VALUES (1,'���','VIEW');
 INSERT [t_operation] ( [id] , [name] , [opcode] ) VALUES (2,'��ѯ','QUERY');
 INSERT [t_operation] ( [id] , [name] , [opcode] ) VALUES (3,'�޸�','EDIT');
SET IDENTITY_INSERT [t_operation] OFF


SET IDENTITY_INSERT [t_authority] ON
INSERT [t_authority] ( [id] , [description] , [name] ) VALUES ( 1 , NULL,'ROLE_SYSTEM');
INSERT [t_authority] ( [id] , [description] , [name] ) VALUES ( 2 , NULL,'ROLE_USER_QUERY');
INSERT [t_authority] ( [id] , [description] , [name] ) VALUES ( 3 , NULL,'ROLE_USER_EDIT');


 SET IDENTITY_INSERT [t_authority] OFF

 SET IDENTITY_INSERT [t_role] ON

 INSERT [t_role] ( [id] , [name] , [roledesc] ) VALUES ( 1 , 'ϵͳ����Ա' , 'SYSMANAGE' )
 INSERT [t_role] ( [id] , [name] , [roledesc] ) VALUES ( 2 , '�û�' , '��ͨ�û�' )


 SET IDENTITY_INSERT [t_role] OFF

 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 1 , 1 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 4 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 5 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 6 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 7 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 8 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 9 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 10 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 11 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 12 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 13 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 14 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 15 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 16 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 17 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 18 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 19 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 20 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 21 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 22 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 23 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 24 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 25 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 26 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 27 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 28 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 29 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 30 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 31 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 32 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 33 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 34 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 35 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 36 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 37 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 38 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 39 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 40 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 41 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 42 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 43 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 44 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 45 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 46 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 47 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 48 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 49 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 50 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 51 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 52 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 53 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 54 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 55 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 56 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 57 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 58 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 59 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 60 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 61 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 62 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 63 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 64 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 65 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 66 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 67 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 68 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 69 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 70 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 71 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 72 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 73 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 74 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 75 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 76 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 77 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 78 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 79 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 80 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 81 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 82 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 83 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 84 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 85 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 86 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 87 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 88 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 89 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 90 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 91 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 92 )
 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 2 , 93 )
 
 
 
 INSERT [t_user_role] ( [uid] , [rid] ) VALUES ( 1 , 1 )
 INSERT [t_user_role] ( [uid] , [rid] ) VALUES ( 3 , 2 )
 
 SET IDENTITY_INSERT [t_montype] ON

 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 1 , 'BMWY' , 'org.bgrimm.domain.t4ddb.BMWY' , 'Y' , '����λ��' , 'MeanPos_DeformationMonitor_Default' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 2 , 'JYL' , 'org.bgrimm.domain.bgrimm.monitor.provided.JYL' , 'Y' , '������' , 'rainmointoring' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 3 , 'JRX' , 'org.bgrimm.domain.bgrimm.monitor.provided.JRX' , 'Y' , '������' , 'jrx' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 4 , 'GTGC' , 'org.bgrimm.domain.bgrimm.monitor.provided.GTGC' , 'Y' , '��̲�߳�' , 'gtgc' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 5 , 'GTCD' , 'org.bgrimm.domain.bgrimm.monitor.provided.GTCD' , 'Y' , '��̲����' , 'gtcd' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 6 , 'NBWY' , 'org.bgrimm.domain.bgrimm.monitor.provided.NBWY' , 'Y' , '�ڲ�λ��' , 'nbwy' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 7 , 'SLL' , 'org.bgrimm.domain.bgrimm.monitor.provided.SLL' , 'Y' , '������' , 'sll' )
 INSERT [t_montype] ( [id] , [code] , [enabled] , [name] , [tableName] ) VALUES ( 8 , 'SP' , 'Y' , '��Ƶ' , 'sp' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 9 , 'AQCG' , 'org.bgrimm.domain.bgrimm.monitor.extended.AQCG' , 'Y' , '��ȫ����' , 'aqcg' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 10 , 'BDGC' , 'org.bgrimm.domain.bgrimm.monitor.extended.BDGC' , 'Y' , '�Ӷ��߳�' , 'bdgc' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 11 , 'KSW' , 'org.bgrimm.domain.bgrimm.monitor.provided.KSW' , 'Y' , '��ˮλ' , 'ksw' )
 SET IDENTITY_INSERT [t_montype] OFF
 
 SET IDENTITY_INSERT [t_monpoint] ON

 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 1 , '����λ��1#' , 1 , 1 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 2 , '������1#' , 1 , 3 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 3 , '������2#' , 2 , 3 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 4 , '������8#' , 8 , 3 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 5 , '1#��ȫ����' , 1 , 9 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 6 , '2#����λ��' , 2 , 1 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 7 , '3#����λ��' , 3 , 1 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 8 , '4#����λ��' , 4 , 1 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 9 , '1#��̲����' , 1 , 5 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 10 , '2#��̲����' , 2 , 5 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 11 , '1#�Ӷ��߳�' , 1 , 10 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 12 , '������' , 1 , 2 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 13 , '��ˮλ' , 1 , 11 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 14 , '�ڲ�λ��' , 1 , 6 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 15 , '������' , 1 , 7 )
 
 SET IDENTITY_INSERT [t_monpoint] OFF
 
 SET IDENTITY_INSERT [dbo].[t_thresholdop] ON
INSERT [t_thresholdop] ( [id] , [displayName] , [opName] ) VALUES ( 1 , '����' , 'GT' )
 INSERT [t_thresholdop] ( [id] , [displayName] , [opName] ) VALUES ( 2 , '���ڵ���' , 'GE' )
 INSERT [t_thresholdop] ( [id] , [displayName] , [opName] ) VALUES ( 4 , 'С�ڵ���' , 'LE' )
 INSERT [t_thresholdop] ( [id] , [displayName] , [opName] ) VALUES ( 3 , 'С��' , 'LT' )

 SET IDENTITY_INSERT [t_thresholdop] OFF

 
 SET IDENTITY_INSERT [t_montypeattr] ON
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 1 , 'dN' , 'ƽ�а����߱仯' , 1 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 2 , 'value' , '��ˮλ' , 11 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 3 , 'value' , '������' , 3 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 4 , 'dE' , '��ֱ�����߱仯' , 1 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 5 , 'dH' , 'Ǧ������仯' , 1 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 6 , 'value' , '��̲�߳�' , 4 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 7 , 'value' , '��̲����' , 5 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 8 , 'value' , '������' , 7 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 9 , 'value' , '��ȫ����' , 9 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 10 , 'value' , '�Ӷ��߳�' , 10 )

 SET IDENTITY_INSERT [t_montypeattr] OFF
 
 SET IDENTITY_INSERT [t_alarmcolor] ON

 INSERT [t_alarmcolor] ( [id] , [code] , [name] ) VALUES ( 1 , '#FF0000' , '��ɫ' )
 INSERT [t_alarmcolor] ( [id] , [code] , [name] ) VALUES ( 2 , '#FFFF00' , '��ɫ' )

 SET IDENTITY_INSERT [t_alarmcolor] OFF

 
  SET IDENTITY_INSERT [t_alarmtype] ON

 INSERT [t_alarmtype] ( [id] , [name] , [severity] , [color_id] ) VALUES ( 1 , 'һ������' , 1 , 2 )
 INSERT [t_alarmtype] ( [id] , [name] , [severity] , [color_id] ) VALUES ( 3 , '��������' , 2 , 1 )

 SET IDENTITY_INSERT [t_alarmtype] OFF

 
  SET IDENTITY_INSERT [t_threshold] ON

 INSERT [t_threshold] ( [id] , [removed] , [value] , [alarmTypeid] , [montypeattrid] , [thresholdopid] , [monpointid] ) VALUES ( 1 , 'N' , 10.0 , 1 , 1 , 3 , 1 )
 INSERT [t_threshold] ( [id] , [removed] , [value] , [alarmTypeid] , [montypeattrid] , [thresholdopid] , [monpointid] ) VALUES ( 2 , 'N' , 10.0 , 1 , 3 , 3 , 2 )
 SET IDENTITY_INSERT [t_threshold] OFF

