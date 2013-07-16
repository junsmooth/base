 SET IDENTITY_INSERT [t_icon_type] ON

 INSERT [t_icon_type] ( [id] , [cnname] , [name] ) VALUES ( 1 , '菜单图标' , 'MENUICON' )
 INSERT [t_icon_type] ( [id] , [cnname] , [name] ) VALUES ( 2 , '监测图标' , 'MONITORICON' )

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
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 2 , '系统管理' , 'SYSTEM' , 'SYSTEM' , '' , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 3 , '用户管理' , 'USER' , 'USER' , 'user' , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 4 , '菜单管理' , 'MENU' , 'MENU' , 'menu' , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 5 , '角色管理' , 'ROLE' , 'ROLE' , 'role' , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 6 , '参数配置' , 'CONFIG' , 'CONFIG' , 'config' , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 7 , '监测类型' , 'MONTYPE' , 'MONTYPE' , 'config/montype' , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [parentid] ) VALUES ( 8 , '监测点' , 'MONPOINT' , 'MONPOINT' , 'config/monpoint' , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 9 , '实时分析' , 'CHART' , '' , 1 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 10 , '表面位移过程线' , 'BMWYCHART' , 'bmwy/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 11 , '历史数据' , 'DATA' , '' , 1 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 12 , '表面位移数据' , 'BMWYDATA' , 'bmwy/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 13 , '系统日志' , 'LOG' , '' , 1 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 14 , '报警记录' , 'ALARMLOG' , 'alarm/alarmrecord' , 1 , 13 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 15 , '浸润线数据' , 'JRXDATA' , 'jrx/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 16 , '干滩高程' , 'DRYBEACHELEVA' , 'gtgc/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 17 , '干滩长度数据' , 'DRYBEACHLENGTH' , 'gtcd/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 18 , '库水位数据' , 'WATERLEVEL' , 'ksw/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 19 , '降雨量数据' , 'JIANGYULANGSHJU' , 'jyl/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 20 , '安全超高数据' , 'ANUANCHAOGOSHUJU' , 'aqcg/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 21 , '坝顶高程数据' , 'BADINGGAOCHENGSHUJU' , 'bdgc/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 22 , '渗流量数据' , 'SHELIULIANGSHUJU' , 'sll/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 23 , '内部位移数据' , 'NEIBUWEIYISHUJU' , 'nbwy/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 24 , '浸润线过程线' , 'JINRUNXIAN' , 'jrx/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 25 , '监测属性' , 'MONATTR' , 'config/monattr' , 1 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 26 , '报警阈值' , 'THRESHOLD' , 'alarm/threshold' , 1 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 27 , '报警级别' , 'ALARMTYPE' , 'alarm/alarmtype' , 1 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 28 , '报警颜色' , 'ALARMCOLOR' , 'alarm/alarmcolor' , 1 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 29 , '干滩高程过程线' , 'GANTANGAOCHENGXIAN' , 'gtgc/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 30 , '干滩长度过程线' , 'GANTANCHANGDUXIAN' , 'gtcd/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 31 , '库水位过程线' , 'KSWGUOCHENGXIAN' , 'ksw/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 32 , '降雨量过程线' , 'JIANGYULIANGXIAN' , 'jyl/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 33 , '安全超高过程线' , 'ANQUANCHAOGAOXIAN' , 'aqcg/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 34 , '坝顶高程过程线' , 'BADINGGAOCHENGXIAN' , 'bdgc/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 35 , '渗流量过程线' , 'SHELIULIANGXIAN' , 'sll/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 36 , '内部位移过程线' , 'NEIBUWEIYIXIAN' , 'nbwy/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 37 , '图标管理' , 'ICON' , 'icon' , 1 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 38 , 'Portal' , 'Portal' , 'homepage/information' , 1 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 39 , '监测图' , 'JIANCETU' , 'topo/main' , 1 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 40 , '卫星云图' , 'SATPIC' , 'topo/satellite' , 1 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 41 , '三维地图' , 'THREEDIMENSION' , 'topo/threedimension' , 1 , 2 )

 SET IDENTITY_INSERT [t_menu] OFF

SET IDENTITY_INSERT [t_operation] ON

 INSERT [t_operation] ( [id] , [name] , [opcode] ) VALUES (1,'浏览','VIEW');
 INSERT [t_operation] ( [id] , [name] , [opcode] ) VALUES (2,'查询','QUERY');
 INSERT [t_operation] ( [id] , [name] , [opcode] ) VALUES (3,'修改','EDIT');
SET IDENTITY_INSERT [t_operation] OFF


SET IDENTITY_INSERT [t_authority] ON
INSERT [t_authority] ( [id] , [description] , [name] ) VALUES ( 1 , NULL,'ROLE_SYSTEM');
INSERT [t_authority] ( [id] , [description] , [name] ) VALUES ( 2 , NULL,'ROLE_USER_QUERY');
INSERT [t_authority] ( [id] , [description] , [name] ) VALUES ( 3 , NULL,'ROLE_USER_EDIT');


 SET IDENTITY_INSERT [t_authority] OFF

 SET IDENTITY_INSERT [t_role] ON

 INSERT [t_role] ( [id] , [name] , [roledesc] ) VALUES ( 1 , '系统管理员' , 'SYSMANAGE' )
 INSERT [t_role] ( [id] , [name] , [roledesc] ) VALUES ( 2 , '用户' , '普通用户' )


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

 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 1 , 'BMWY' , 'org.bgrimm.domain.t4ddb.BMWY' , 'Y' , '表面位移' , 'MeanPos_DeformationMonitor_Default' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 2 , 'JYL' , 'org.bgrimm.domain.bgrimm.monitor.provided.JYL' , 'Y' , '降雨量' , 'rainmointoring' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 3 , 'JRX' , 'org.bgrimm.domain.bgrimm.monitor.provided.JRX' , 'Y' , '浸润线' , 'jrx' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 4 , 'GTGC' , 'org.bgrimm.domain.bgrimm.monitor.provided.GTGC' , 'Y' , '干滩高程' , 'gtgc' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 5 , 'GTCD' , 'org.bgrimm.domain.bgrimm.monitor.provided.GTCD' , 'Y' , '干滩长度' , 'gtcd' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 6 , 'NBWY' , 'org.bgrimm.domain.bgrimm.monitor.provided.NBWY' , 'Y' , '内部位移' , 'nbwy' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 7 , 'SLL' , 'org.bgrimm.domain.bgrimm.monitor.provided.SLL' , 'Y' , '渗流量' , 'sll' )
 INSERT [t_montype] ( [id] , [code] , [enabled] , [name] , [tableName] ) VALUES ( 8 , 'SP' , 'Y' , '视频' , 'sp' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 9 , 'AQCG' , 'org.bgrimm.domain.bgrimm.monitor.extended.AQCG' , 'Y' , '安全超高' , 'aqcg' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 10 , 'BDGC' , 'org.bgrimm.domain.bgrimm.monitor.extended.BDGC' , 'Y' , '坝顶高程' , 'bdgc' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 11 , 'KSW' , 'org.bgrimm.domain.bgrimm.monitor.provided.KSW' , 'Y' , '库水位' , 'ksw' )
 SET IDENTITY_INSERT [t_montype] OFF
 
 SET IDENTITY_INSERT [t_monpoint] ON

 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 1 , '表面位移1#' , 1 , 1 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 2 , '浸润线1#' , 1 , 3 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 3 , '浸润线2#' , 2 , 3 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 4 , '浸润线8#' , 8 , 3 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 5 , '1#安全超高' , 1 , 9 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 6 , '2#表面位移' , 2 , 1 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 7 , '3#表面位移' , 3 , 1 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 8 , '4#表面位移' , 4 , 1 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 9 , '1#干滩长度' , 1 , 5 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 10 , '2#干滩长度' , 2 , 5 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 11 , '1#坝顶高程' , 1 , 10 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 12 , '降雨量' , 1 , 2 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 13 , '库水位' , 1 , 11 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 14 , '内部位移' , 1 , 6 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 15 , '渗流量' , 1 , 7 )
 
 SET IDENTITY_INSERT [t_monpoint] OFF
 
 SET IDENTITY_INSERT [dbo].[t_thresholdop] ON
INSERT [t_thresholdop] ( [id] , [displayName] , [opName] ) VALUES ( 1 , '大于' , 'GT' )
 INSERT [t_thresholdop] ( [id] , [displayName] , [opName] ) VALUES ( 2 , '大于等于' , 'GE' )
 INSERT [t_thresholdop] ( [id] , [displayName] , [opName] ) VALUES ( 4 , '小于等于' , 'LE' )
 INSERT [t_thresholdop] ( [id] , [displayName] , [opName] ) VALUES ( 3 , '小于' , 'LT' )

 SET IDENTITY_INSERT [t_thresholdop] OFF

 
 SET IDENTITY_INSERT [t_montypeattr] ON
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 1 , 'dN' , '平行坝轴线变化' , 1 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 2 , 'value' , '库水位' , 11 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 3 , 'value' , '浸润线' , 3 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 4 , 'dE' , '垂直坝轴线变化' , 1 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 5 , 'dH' , '铅垂方向变化' , 1 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 6 , 'value' , '干滩高程' , 4 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 7 , 'value' , '干滩长度' , 5 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 8 , 'value' , '渗流量' , 7 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 9 , 'value' , '安全超高' , 9 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 10 , 'value' , '坝顶高程' , 10 )

 SET IDENTITY_INSERT [t_montypeattr] OFF
 
 SET IDENTITY_INSERT [t_alarmcolor] ON

 INSERT [t_alarmcolor] ( [id] , [code] , [name] ) VALUES ( 1 , '#FF0000' , '红色' )
 INSERT [t_alarmcolor] ( [id] , [code] , [name] ) VALUES ( 2 , '#FFFF00' , '黄色' )

 SET IDENTITY_INSERT [t_alarmcolor] OFF

 
  SET IDENTITY_INSERT [t_alarmtype] ON

 INSERT [t_alarmtype] ( [id] , [name] , [severity] , [color_id] ) VALUES ( 1 , '一级报警' , 1 , 2 )
 INSERT [t_alarmtype] ( [id] , [name] , [severity] , [color_id] ) VALUES ( 3 , '二级警报' , 2 , 1 )

 SET IDENTITY_INSERT [t_alarmtype] OFF

 
  SET IDENTITY_INSERT [t_threshold] ON

 INSERT [t_threshold] ( [id] , [removed] , [value] , [alarmTypeid] , [montypeattrid] , [thresholdopid] , [monpointid] ) VALUES ( 1 , 'N' , 10.0 , 1 , 1 , 3 , 1 )
 INSERT [t_threshold] ( [id] , [removed] , [value] , [alarmTypeid] , [montypeattrid] , [thresholdopid] , [monpointid] ) VALUES ( 2 , 'N' , 10.0 , 1 , 3 , 3 , 2 )
 SET IDENTITY_INSERT [t_threshold] OFF

