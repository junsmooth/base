

  SET IDENTITY_INSERT [t_icon] ON

 INSERT [t_icon] ( [id] , [iconcls] , [extension] , [iconname] , [iconpath] ) VALUES ( 1 , 'pictures' , '.png' , 'pictures' , 'resources/custom/images' )

 SET IDENTITY_INSERT [t_icon] OFF
 
 SET IDENTITY_INSERT [t_user] ON

 INSERT [t_user] ( [id] , [address] , [cardno] , [email] , [enabled] , [password] , [realname] , [telephone] , [username] ) VALUES ( 1 , 'sdfasdf' , '223' , 'dafd@sdf' , 'Y' , 'admin' , 'admin' , '212323' , 'admin' )

 SET IDENTITY_INSERT [t_user] OFF



SET IDENTITY_INSERT [t_menu] ON
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 1 , 'ROOT' , 'ROOT' , 'ROOT' , '/',NULL,NULL )
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 2 , '系统管理' , 'SYSTEM' , 'SYSTEM' , '',NULL,1 )
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 3 , '用户管理' , 'USER' , 'USER' , 'user',NULL,2)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 4 , '菜单管理' , 'MENU' , 'MENU' , 'menu',NULL,2)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 5 , '角色管理' , 'ROLE' , 'ROLE' , 'role',NULL,2)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 6 , '参数配置' , 'CONFIG' , 'CONFIG' , 'config',NULL,1)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 7 , '监测类型' , 'MONTYPE' , 'MONTYPE' , 'config/montype',NULL,6)
INSERT [t_menu] ( [id] , [menuname] , [menuorder] , [modulename] , [url],[iconid],[parentid] ) VALUES ( 8 , '监测点' , 'MONPOINT' , 'MONPOINT' , 'config/monpoint',NULL,6)
INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 9 , '实时分析' , 'CHART' , '' , 1 , 1 )
INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 10 , '表面位移过程线' , 'BMWYCHART' , 'chart/bmwy' , 1 , 9 )
INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 11 , '历史数据' , 'DATA' , '' , 1 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 12 , '表面位移数据' , 'BMWYDATA' , 'bmwy/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 13 , '系统日志' , 'LOG' , '' , 1 , 1 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 14 , '报警记录' , 'ALARMLOG' , 'alarm/alarmrecord' , 1 , 13 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 15 , '浸润线数据' , 'JRXDATA' , 'jrx/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 16 , '干滩高程' , 'DRYBEACHELEVA' , 'dryBeachElevation/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 17 , '干滩长度数据' , 'DRYBEACHLENGTH' , 'dryBeachLength/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 18 , '库水位数据' , 'WATERLEVEL' , 'waterLevel/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 19 , '降雨量数据' , 'JIANGYULANGSHJU' , 'rainfall/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 20 , '安全超高数据' , 'ANUANCHAOGOSHUJU' , 'freeBoard/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 21 , '坝顶高程数据' , 'BADINGGAOCHENGSHUJU' , 'damCrest/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 22 , '渗流量数据' , 'SHELIULIANGSHUJU' , 'seepage/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 23 , '内部位移数据' , 'NEIBUWEIYISHUJU' , 'innerDisp/data' , 1 , 11 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 24 , '浸润线过程线' , 'JINRUNXIAN' , 'jrx/chart' , 1 , 9 )
INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 25 , '监测属性' , 'MONATTR' , 'config/monattr' , 1 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 26 , '报警阈值' , 'THRESHOLD' , 'alarm/threshold' , 1 , 6 )
 
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 27 , '报警级别' , 'ALARMTYPE' , 'alarm/alarmtype' , 1 , 6 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 28 , '报警颜色' , 'ALARMCOLOR' , 'alarm/alarmcolor' , 1 , 6 )

  INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 29 , '干滩高程过程线' , 'GANTANGAOCHENGXIAN' , 'gtgc/chart' , 2 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 30 , '干滩长度过程线' , 'GANTANCHANGDUXIAN' , 'gtcd/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 31 , '库水位过程线' , 'KSWGUOCHENGXIAN' , 'ksw/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 32 , '降雨量过程线' , 'JIANGYULIANGXIAN' , 'jyl/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 33 , '安全超高过程线' , 'ANQUANCHAOGAOXIAN' , 'aqcg/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 34 , '坝顶高程过程线' , 'BADINGGAOCHENGXIAN' , 'bdgc/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 35 , '渗流量过程线' , 'SHELIULIANGXIAN' , 'sll/chart' , 1 , 9 )
 INSERT [t_menu] ( [id] , [menuname] , [modulename] , [url] , [iconid] , [parentid] ) VALUES ( 36 , '内部位移过程线' , 'NEIBUWEIYIXIAN' , 'nbwy/chart' , 1 , 9 )

 
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

 SET IDENTITY_INSERT [t_role] OFF

 INSERT [t_role_authority] ( [roleid] , [authid] ) VALUES ( 1 , 1 )
 
 
 
 INSERT [t_user_role] ( [uid] , [rid] ) VALUES ( 1 , 1 )
 
 SET IDENTITY_INSERT [t_montype] ON

 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 1 , 'BMWY' , 'org.bgrimm.domain.t4ddb.BMWY' , 'Y' , '表面位移' , 'MeanPos_DeformationMonitor_Default' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 2 , 'JYL' , 'Rainfall' , 'Y' , '降雨量' , 'rainmointoring' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 3 , 'JRX' , 'org.bgrimm.domain.bgrimm.monitor.provided.JRX' , 'Y' , '浸润线' , 'jrx' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 4 , 'GTGC' , 'DryBeachElevation' , 'Y' , '干滩高程' , 'gtgc' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 5 , 'GTCD' , 'DryBeachLength' , 'Y' , '干滩长度' , 'gtcd' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 6 , 'NBWY' , 'InnerDisplacement' , 'Y' , '内部位移' , 'nbwy' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 7 , 'SLL' , 'Seepage' , 'Y' , '渗流量' , 'sll' )
 INSERT [t_montype] ( [id] , [code] , [enabled] , [name] , [tableName] ) VALUES ( 8 , 'SP' , 'Y' , '视频' , 'sp' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 9 , 'AQCG' , 'FreeBoard' , 'Y' , '安全超高' , 'aqcg' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 10 , 'BDGC' , 'DamCrest' , 'Y' , '坝顶高程' , 'bdgc' )
 INSERT [t_montype] ( [id] , [code] , [domainClsName] , [enabled] , [name] , [tableName] ) VALUES ( 11 , 'KSW' , 'WaterLevel' , 'Y' , '库水位' , 'ksw' )
 SET IDENTITY_INSERT [t_montype] OFF
 
 SET IDENTITY_INSERT [t_monpoint] ON

 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 1 , '表面位移1#' , 1 , 1 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 2 , '浸润线1#' , 1 , 3 )
 INSERT [t_monpoint] ( [id] , [monitoringName] , [position] , [montypeid] ) VALUES ( 3 , '浸润线2#' , 2 , 3 )
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

