

  SET IDENTITY_INSERT [t_icon] ON

 INSERT [t_icon] ( [id] , [iconcls] , [extension] , [iconname] , [iconpath] ) VALUES ( 1 , 'pictures' , '.png' , 'pictures' , 'resources/custom/images' )

 SET IDENTITY_INSERT [t_icon] OFF
 
 SET IDENTITY_INSERT [t_user] ON

 INSERT [t_user] ( [id] , [address] , [cardno] , [email] , [enabled] , [password] , [realname] , [telephone] , [username] ) VALUES ( 1 , 'sdfasdf' , '223' , 'dafd@sdf' , 'Y' , 'admin' , 'admin' , '212323' , 'admin' )

 SET IDENTITY_INSERT [t_user] OFF



SET IDENTITY_INSERT [t_menu] ON
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 1 , 'ROOT' , 'ROOT' , 'ROOT' , '/',NULL,NULL )
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 2 , 'ϵͳ����' , 'SYSTEM' , 'SYSTEM' , '',NULL,1 )
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 3 , '�û�����' , 'USER' , 'USER' , 'user',NULL,2)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 4 , '�˵�����' , 'MENU' , 'MENU' , 'menu',NULL,2)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 5 , '��ɫ����' , 'ROLE' , 'ROLE' , 'role',NULL,2)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 6 , '��������' , 'CONFIG' , 'CONFIG' , 'config',NULL,1)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 7 , '�������' , 'MONTYPE' , 'MONTYPE' , 'config/montype',NULL,6)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 8 , '����' , 'MONPOINT' , 'MONPOINT' , 'config/monpoint',NULL,6)
INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 9 , 'ʵʱ����' , 'CHART' , '' , 1 , 1 )
INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 10 , '����λ�ƹ�����' , 'BMWYCHART' , 'chart/bmwy' , 1 , 9 )
INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 11 , '��ʷ����' , 'DATA' , '' , 1 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 12 , '����λ������' , 'BMWYDATA' , 'bmwy/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 13 , 'ϵͳ��־' , 'LOG' , '' , 1 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 14 , '������¼' , 'ALARMLOG' , 'alarm/alarmrecord' , 1 , 13 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 15 , '����������' , 'JRXDATA' , 'jrx/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 16 , '��̲�߳�' , 'DRYBEACHELEVA' , 'dryBeachElevation/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 17 , '��̲��������' , 'DRYBEACHLENGTH' , 'dryBeachLength/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 18 , '��ˮλ����' , 'WATERLEVEL' , 'waterLevel/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 19 , '����������' , 'JIANGYULANGSHJU' , 'rainfall/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 20 , '��ȫ��������' , 'ANUANCHAOGOSHUJU' , 'freeBoard/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 21 , '�Ӷ��߳�����' , 'BADINGGAOCHENGSHUJU' , 'damCrest/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 22 , '����������' , 'SHELIULIANGSHUJU' , 'seepage/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 23 , '�ڲ�λ������' , 'NEIBUWEIYISHUJU' , 'innerDisp/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 24 , '�����߹�����' , 'JINRUNXIAN' , 'jrx/chart' , 1 , 9 )
INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 25 , '�������' , 'MONATTR' , 'config/monattr' , 1 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 26 , '������ֵ' , 'THRESHOLD' , 'alarm/threshold' , 1 , 6 )
 
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 27 , '��������' , 'ALARMTYPE' , 'alarm/alarmtype' , 1 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 28 , '������ɫ' , 'ALARMCOLOR' , 'alarm/alarmcolor' , 1 , 6 )

  INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 29 , '��̲�̹߳�����' , 'GANTANGAOCHENGXIAN' , 'gtgc/chart' , 2 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 30 , '��̲���ȹ�����' , 'GANTANCHANGDUXIAN' , 'gtcd/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 31 , '��ˮλ������' , 'KSWGUOCHENGXIAN' , 'ksw/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 32 , '������������' , 'JIANGYULIANGXIAN' , 'jyl/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 33 , '��ȫ���߹�����' , 'ANQUANCHAOGAOXIAN' , 'aqcg/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 34 , '�Ӷ��̹߳�����' , 'BADINGGAOCHENGXIAN' , 'bdgc/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 35 , '������������' , 'SHELIULIANGXIAN' , 'sll/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 36 , '�ڲ�λ�ƹ�����' , 'NEIBUWEIYIXIAN' , 'nbwy/chart' , 1 , 9 )

 
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

 SET IDENTITY_INSERT [t_role] OFF

 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 1 , 1 )
 
 
 
 INSERT [t_user_role] ( [uid] , [rid] ) VALUES ( 1 , 1 )
 
 SET IDENTITY_INSERT [t_montype] ON

 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 1 , 'BMWY' , 'org.bgrimm.domain.t4ddb.BMWY' , 'Y' , '����λ��' , 'MeanPos_DeformationMonitor_Default' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 2 , 'JYL' , 'Rainfall' , 'Y' , '������' , 'rainmointoring' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 3 , 'JRX' , 'org.bgrimm.domain.bgrimm.monitor.provided.JRX' , 'Y' , '������' , 'jrx' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 4 , 'GTGC' , 'DryBeachElevation' , 'Y' , '��̲�߳�' , 'gtgc' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 5 , 'GTCD' , 'DryBeachLength' , 'Y' , '��̲����' , 'gtcd' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 6 , 'NBWY' , 'InnerDisplacement' , 'Y' , '�ڲ�λ��' , 'nbwy' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 7 , 'SLL' , 'Seepage' , 'Y' , '������' , 'sll' )
 INSERT [t_montype] ( [id] , [code] , [enabled] , [name] , [tableName] ) VALUES ( 8 , 'SP' , 'Y' , '��Ƶ' , 'sp' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 9 , 'AQCG' , 'FreeBoard' , 'Y' , '��ȫ����' , 'aqcg' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 10 , 'BDGC' , 'DamCrest' , 'Y' , '�Ӷ��߳�' , 'bdgc' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 11 , 'KSW' , 'WaterLevel' , 'Y' , '��ˮλ' , 'ksw' )
 SET IDENTITY_INSERT [t_montype] OFF
 
 SET IDENTITY_INSERT [t_monpoint] ON

 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 1 , '����λ��1#' , 1 , 1 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 2 , '������1#' , 1 , 3 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 3 , '������2#' , 2 , 3 )
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

