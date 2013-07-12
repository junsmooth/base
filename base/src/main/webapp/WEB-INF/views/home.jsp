<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Management System</title>
<link rel="stylesheet" type="text/css"
	href="resources/themes/metro-blue/easyui.css">
<link rel="stylesheet" type="text/css" href="resources/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="resources/custom/css/icon.css">
<link rel="stylesheet" type="text/css"
	href="resources/custom/css/common.css">
<link rel="stylesheet" type="text/css"
	href="resources/themes/uploadify.css">

<link rel="stylesheet" type="text/css"
	href="resources/themes/portal.css">
<script type="text/javascript" src="resources/jquery-1.8.0.min.js">
	
</script>
<script type="text/javascript" src="resources/lhgdialog.min.js">
	
</script>
<script type="text/javascript" src="resources/jquery.easyui.min.js">
	
</script>
<script type="text/javascript"
	src="resources/locale/easyui-lang-zh_CN.js">
	
</script>
<script type="text/javascript" src="resources/namespace.js">
	
</script>
<script type="text/javascript" src="resources/jquery.easyui.validate.js">
	
</script>
<script type="text/javascript" src="resources/authority.js">
	
</script>
<script type="text/javascript" src="resources/dateformat.js">
	
</script>
<script type="text/javascript" src="resources/validation.js">
	
</script>

<!--   <script src="resources/highcharts.js"></script> -->
<script src="resources/highstock.js"></script>
<script src="resources/modules/exporting.js"></script>
<script type="text/javascript" src="resources/jquery.portal.js"></script>
<script src="resources/jquery.uploadify.min.js" type="text/javascript"></script>
 <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=B22e4be0e2dca29545ef3b52b411e36a"></script>
 

</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="overflow: hidden; height: 30px; background: url(resources/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%; line-height: 20px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">


		<span style="float: right; padding-right: 20px;" class="head">
			欢迎:<security:authentication property="principal.username" /> <a
			href="#" id="editpass"> 修改密码 </a> <a href="#" id="loginOut"> 安全退出
		</a>
		</span> <span style="padding-left: 10px; font-size: 16px;"> <img
			src="resources/images/blocks.gif" width="20" height="20"
			align="absmiddle" /> 管理信息系统
		</span>
	</div>
	<div id="leftDiv" href="menu/left"
		data-options="region:'west',split:true,title:'导航菜单'"
		style="width: 150px; padding: 1px;"></div>
	<div data-options="region:'south',border:false"
		style="height: 25px; overflow: hidden;">
		<div align="center" style="color: #CC99FF; padding-top: 2px">
			&copy; 版权所有 <span class="tip"><a href="http://www.bgrimm.com"
				title="BGRIMM SYSTEM">北京矿冶研究总院</a> (推荐谷歌浏览器，获得更快响应速度) </span>
		</div>
	</div>
	<div data-options="region:'center'">
		<div id="tabs" class="easyui-tabs"
			data-options="fit:true,border:false">
			<!-- <div title="欢迎使用" style="padding: 20px; overflow: hidden;" id="home">

			</div> -->
		</div>
	</div>


	<div id="mm" class="easyui-menu" style="width: 150px;">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>
</body>
<script>
	function freshLeftMenu() {
		$('#leftDiv').panel('refresh');
	}
	//create Namespace object
</script>
</html>
