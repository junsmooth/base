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

 INSERT [t_operation] ( [id] , [name] , [opcode] ) VALUES (3,'�༭','EDIT');
SET IDENTITY_INSERT [t_operation] OFF


SET IDENTITY_INSERT [t_authority] ON
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 1 , 'ROLE_SYSTEM' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 2 , 'ROLE_USER_QUERY' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 3 , 'ROLE_USER_EDIT' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 4 , 'ROLE_ROOT_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 5 , 'ROLE_ROOT_EDIT' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 6 , 'ROLE_SATPIC_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 7 , 'ROLE_THREEDIMENSION_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 8 , 'ROLE_CHART_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 9 , 'ROLE_BMWYCHART_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 10 , 'ROLE_JINRUNXIAN_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 11 , 'ROLE_GANTANGAOCHENGXIAN_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 12 , 'ROLE_GANTANCHANGDUXIAN_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 13 , 'ROLE_KSWGUOCHENGXIAN_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 14 , 'ROLE_JIANGYULIANGXIAN_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 15 , 'ROLE_ANQUANCHAOGAOXIAN_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 16 , 'ROLE_BADINGGAOCHENGXIAN_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 17 , 'ROLE_SHELIULIANGXIAN_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 18 , 'ROLE_NEIBUWEIYIXIAN_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 19 , 'ROLE_DATA_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 20 , 'ROLE_BMWYDATA_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 21 , 'ROLE_JRXDATA_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 22 , 'ROLE_DRYBEACHELEVA_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 23 , 'ROLE_DRYBEACHLENGTH_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 24 , 'ROLE_WATERLEVEL_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 25 , 'ROLE_JIANGYULANGSHJU_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 26 , 'ROLE_ANUANCHAOGOSHUJU_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 27 , 'ROLE_BADINGGAOCHENGSHUJU_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 28 , 'ROLE_SHELIULIANGSHUJU_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 29 , 'ROLE_NEIBUWEIYISHUJU_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 30 , 'ROLE_LOG_VIEW' )
 INSERT [t_authority] ( [id] , [name] ) VALUES ( 31 , 'ROLE_ALARMLOG_VIEW' )


 SET IDENTITY_INSERT [t_authority] OFF

 SET IDENTITY_INSERT [t_role] ON

 INSERT [t_role] ( [id] , [name] , [roledesc] ) VALUES ( 1 , 'ϵͳ����Ա' , 'SYSMANAGE' )
 INSERT [t_role] ( [id] , [name] , [roledesc] ) VALUES ( 2 , '�û�' , '��ͨ�û�' )


 SET IDENTITY_INSERT [t_role] OFF

 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 1 , 1 )

 
 
 
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

