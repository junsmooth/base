 SET IDENTITY_INSERT [t_icon_type] ON

 INSERT [t_icon_type] ( [id] , [cnname] , [name] ) VALUES ( 1 , '菜单图标' , 'MENUICON' )
 INSERT [t_icon_type] ( [id] , [cnname] , [name] ) VALUES ( 2 , '监测图标' , 'MONITORICON' )

 SET IDENTITY_INSERT [t_icon_type] OFF


 SET IDENTITY_INSERT [t_icon] ON


  INSERT [t_icon] ( [id] , [iconcls] , [extension] , [iconname] , [iconpath] , [type_id] ) VALUES ( 1 , 'pictures' , '.png' , 'pictures' , 'resources/custom/images' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 2 , 'custom1375324175906' , '菜单' , 'resources/custom/images/1375324174437.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 3 , 'custom1375324347296' , '用户' , 'resources/custom/images/1375324346078.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 4 , 'custom1375324420000' , '角色' , 'resources/custom/images/1375324418921.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 5 , 'custom1375324487265' , '图标管理' , 'resources/custom/images/1375324485968.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 6 , 'custom1375324606234' , '拓扑图' , 'resources/custom/images/1375324604968.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 7 , 'custom1375324743859' , '监测类型' , 'resources/custom/images/1375324742750.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 8 , 'custom1375324762281' , '监测点' , 'resources/custom/images/1375324760640.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 9 , 'custom1375324790265' , '监测属性' , 'resources/custom/images/1375324789250.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 10 , 'custom1375324835078' , '报警阈值' , 'resources/custom/images/1375324833937.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 11 , 'custom1375324887296' , '报警级别' , 'resources/custom/images/1375324886328.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 12 , 'custom1375324913640' , '报警颜色' , 'resources/custom/images/1375324912765.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 13 , 'custom1375325045609' , 'map' , 'resources/custom/images/1375325044625.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 14 , 'custom1375325355328' , 'rain' , 'resources/custom/images/1375325354015.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 15 , 'custom1375325379437' , 'rain_p' , 'resources/custom/images/1375325378453.png' , 2 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 16 , 'custom1375325598109' , 'ksw' , 'resources/custom/images/1375325745109.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 17 , 'custom1375325619421' , 'ksw_p' , 'resources/custom/images/1375325751328.png' , 2 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 18 , 'custom1375325784562' , 'gtcd' , 'resources/custom/images/1375327082781.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 19 , 'custom1375325804843' , 'gtcd_p' , 'resources/custom/images/1375327089500.png' , 2 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 20 , 'custom1375325840609' , 'gtgc' , 'resources/custom/images/1375326921109.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 21 , 'custom1375325853765' , 'gtgc_p' , 'resources/custom/images/1375326928437.png' , 2 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 22 , 'custom1375325872671' , 'bmwy' , 'resources/custom/images/1375325871750.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 23 , 'custom1375325888437' , 'bmwy_p' , 'resources/custom/images/1375325887625.png' , 2 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 24 , 'custom1375325944515' , 'aqcg' , 'resources/custom/images/1375325943500.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 25 , 'custom1375325957015' , 'aqcg_p' , 'resources/custom/images/1375325955937.png' , 2 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 26 , 'custom1375325983218' , 'bdgc' , 'resources/custom/images/1375325981187.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 27 , 'custom1375325997046' , 'bdgc_p' , 'resources/custom/images/1375325995625.png' , 2 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 28 , 'custom1375326051437' , 'sll' , 'resources/custom/images/1375326050453.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 29 , 'custom1375326065421' , 'sll_p' , 'resources/custom/images/1375326064578.png' , 2 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 30 , 'custom1375326228906' , 'nbwy' , 'resources/custom/images/1375326227984.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 31 , 'custom1375326244359' , 'nbwy_p' , 'resources/custom/images/1375326243296.png' , 2 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 32 , 'custom1375326507187' , 'log' , 'resources/custom/images/1375326506328.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 33 , 'custom1375326556421' , 'jrx' , 'resources/custom/images/1375326555421.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 34 , 'custom1375326569796' , 'jrx_p' , 'resources/custom/images/1375326568968.png' , 2 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 35 , 'custom1375326985921' , 'portal' , 'resources/custom/images/1375326984968.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 36 , 'custom1375327170343' , 'line' , 'resources/custom/images/1375327169984.png' , 1 )
 INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 37 , 'custom1375327285218' , 'data' , 'resources/custom/images/1375327284312.png' , 1 )
INSERT [t_icon] ( [id] , [iconcls] , [iconname] , [iconpath] , [type_id] ) VALUES ( 38 , 'custom1376292242421' , '视频 ' , 'resources/custom/images/1376292232421.png' , 2 )


 SET IDENTITY_INSERT [t_icon] OFF
 
 SET IDENTITY_INSERT [t_user] ON

 INSERT [t_user] ( [id] , [address] , [cardno] , [email] , [enabled] , [password] , [realname] , [telephone] , [username] ) VALUES ( 1 , 'sdfasdf' , '223' , 'dafd@sdf' , 'Y' , 'c815cb993165894fea35eb5d80b6e6cb' , 'admin' , '212323' , 'admin' )
 INSERT [t_user] ( [id] , [address] , [email] , [enabled] , [password] , [realname] , [telephone] , [username] ) VALUES ( 3 , 'user' , '' , 'Y' , '5654a2867771091d4f5a2870a208f8bb' , 'user' , '13260053081' , 'user' )

 SET IDENTITY_INSERT [t_user] OFF


SET IDENTITY_INSERT [t_menu] ON
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] ) VALUES ( 1 , 'ROOT' , 'ROOT' , 'ROOT' , '/' )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 2 , '系统管理' , 'E' , 'SYSTEM' , '' , 2 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 3 , '用户管理' , 'USER' , 'user' , 3 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 4 , '菜单管理' , 'MENU' , 'menu' , 2 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 5 , '角色管理' , 'ROLE' , 'role' , 4 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 6 , '参数配置' , 'B' , 'CONFIG' , 'config' , 2 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 7 , '监测类型' , 'MONTYPE' , 'config/montype' , 7 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 8 , '监测点' , 'MONPOINT' , 'config/monpoint' , 8 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 9 , '历史曲线' , 'C' , 'CHART' , '' , 2 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 10 , '表面位移过程线' , 'B' , 'BMWYCHART' , 'bmwy/chart' , 22 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 11 , '历史数据' , 'D' , 'DATA' , '' , 2 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 12 , '表面位移数据' , 'BMWYDATA' , 'bmwy/data' , 22 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 13 , '系统日志' , 'F' , 'LOG' , '' , 2 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 14 , '报警记录' , 'ALARMLOG' , 'alarm/alarmrecord' , 32 , 13 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 15 , '浸润线数据' , 'JRXDATA' , 'jrx/data' , 33 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 16 , '干滩高程数据' , 'GTGCDATA' , 'gtgc/data' , 20 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 17 , '干滩长度数据' , 'GTCDDATA' , 'gtcd/data' , 18 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 18 , '库水位数据' , 'KSWDATA' , 'ksw/data' , 16 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 19 , '降雨量数据' , 'JYLDATA' , 'jyl/data' , 14 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 20 , '安全超高数据' , 'AQCGDATA' , 'aqcg/data' , 24 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 21 , '坝顶高程数据' , 'BDGCDATA' , 'bdgc/data' , 26 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 22 , '渗流量数据' , 'SLLDATA' , 'sll/data' , 28 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 23 , '内部位移数据' , 'NBWYDATA' , 'nbwy/data' , 30 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 24 , '浸润线过程线' , 'C' , 'JRXCHART' , 'jrx/chart' , 33 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 25 , '监测属性' , 'MONATTR' , 'config/monattr' , 9 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 26 , '报警阈值' , 'THRESHOLD' , 'alarm/threshold' , 10 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 27 , '报警级别' , 'ALARMTYPE' , 'alarm/alarmtype' , 11 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 28 , '报警颜色' , 'ALARMCOLOR' , 'alarm/alarmcolor' , 12 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 29 , '干滩高程过程线' , 'D' , 'GTGCCHART' , 'gtgc/chart' , 20 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 30 , '干滩长度过程线' , 'E' , 'GTCDCHART' , 'gtcd/chart' , 18 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 31 , '库水位过程线' , 'KSWCHART' , 'ksw/chart' , 16 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 32 , '降雨量过程线' , 'JYLCHART' , 'jyl/chart' , 14 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 33 , '安全超高过程线' , 'AQCGCHART' , 'aqcg/chart' , 24 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 34 , '坝顶高程过程线' , 'BDGCCHART' , 'bdgc/chart' , 26 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 35 , '渗流量过程线' , 'SLLCHART' , 'sll/chart' , 28 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 36 , '内部位移过程线' , 'NBWYCHART' , 'nbwy/chart' , 30 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 37 , '图标管理' , 'ICON' , 'icon' , 5 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 38 , 'Portal' , 'Portal' , 'homepage/information' , 35 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 39 , '监测图' , 'JIANCETU' , 'topo/main' , 6 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 40 , '卫星云图' , 'SATPIC' , 'topo/satellite' , 13 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 41 , '三维地图' , 'THREEDIMENSION' , 'topo/threedimension' , 36 , 2 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 42 , '项目信息' , 'A' , 'PROINFO' , '' , 2 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 43 , '项目概况' , '' , 'PROJECT' , 'xmgk/iniData' , 7 , 42 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 44 , '尾矿库概况' , '' , 'TAILINGSINFO' , 'wkkgk/iniData' , 8 , 42 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 45 , '监测点列表' , 'A' , 'JCDL' , 'jcdlb/init' , 8 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 46 , '实时监测' , 'B1' , 'REALTIME' , '' , 2 , 1 )

 

 SET IDENTITY_INSERT [t_menu] OFF

SET IDENTITY_INSERT [t_operation] ON

 INSERT [t_operation] ( [id] , [name] , [opcode] ) VALUES (1,'浏览','VIEW');

 INSERT [t_operation] ( [id] , [name] , [opcode] ) VALUES (3,'编辑','EDIT');
SET IDENTITY_INSERT [t_operation] OFF


SET IDENTITY_INSERT [t_authority] ON
  INSERT [t_authority] ( [id] , [name] ) VALUES ( 1 , 'ROLE_SYSTEM' )
 SET IDENTITY_INSERT [t_authority] OFF

 SET IDENTITY_INSERT [t_role] ON

 INSERT [t_role] ( [id] , [name] , [roledesc] ) VALUES ( 1 , '系统管理员' , 'SYSMANAGE' )
 INSERT [t_role] ( [id] , [name] , [roledesc] ) VALUES ( 2 , '用户' , '普通用户' )


 SET IDENTITY_INSERT [t_role] OFF

 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 1 , 1 )

 
 
 
 INSERT [t_user_role] ( [uid] , [rid] ) VALUES ( 1 , 1 )
 INSERT [t_user_role] ( [uid] , [rid] ) VALUES ( 3 , 2 )
 
 SET IDENTITY_INSERT [t_montype] ON

  INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [iconid] ) VALUES ( 1 , 'BMWY' , 'org.bgrimm.domain.bgrimm.monitor.extended.BMWY' , 'N' , '表面位移' , 23 )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [iconid] ) VALUES ( 2 , 'JYL' , 'org.bgrimm.domain.bgrimm.monitor.provided.JYL' , 'N' , '降雨量' , 15 )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [iconid] ) VALUES ( 3 , 'JRX' , 'org.bgrimm.domain.bgrimm.monitor.provided.JRX' , 'N' , '浸润线' , 34 )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [iconid] ) VALUES ( 4 , 'GTGC' , 'org.bgrimm.domain.bgrimm.monitor.provided.GTGC' , 'N' , '干滩高程' , 21 )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [iconid] ) VALUES ( 5 , 'GTCD' , 'org.bgrimm.domain.bgrimm.monitor.provided.GTCD' , 'N' , '干滩长度' , 19 )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [iconid] ) VALUES ( 6 , 'NBWY' , 'org.bgrimm.domain.bgrimm.monitor.provided.NBWY' , 'N' , '内部位移' , 31 )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [iconid] ) VALUES ( 7 , 'SLL' , 'org.bgrimm.domain.bgrimm.monitor.provided.SLL' , 'N' , '渗流量' , 29 )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [iconid] ) VALUES ( 9 , 'AQCG' , 'org.bgrimm.domain.bgrimm.monitor.extended.AQCG' , 'N' , '安全超高' , 25 )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [iconid] ) VALUES ( 10 , 'BDGC' , 'org.bgrimm.domain.bgrimm.monitor.extended.BDGC' , 'N' , '坝顶高程' , 27 )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [iconid] ) VALUES ( 11 , 'KSW' , 'org.bgrimm.domain.bgrimm.monitor.provided.KSW' , 'N' , '库水位' , 17 )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [iconid] ) VALUES ( 12 , 'SP' , '' , 'N' , '视频' , 38 )
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
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 11 , 'value' , '一小时降雨量' , 2 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 12 , 'value' , '内部位移' , 6 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 13 , 'dDN' , '本次平行坝轴线变化' , 1 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 14 , 'dDE' , '本次垂直坝轴线变化' , 1 )
 INSERT [t_montypeattr] ( [id] , [attr] , [name] , [montypeid] ) VALUES ( 15 , 'dDH' , '本次铅垂方向变化' , 1 )

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

