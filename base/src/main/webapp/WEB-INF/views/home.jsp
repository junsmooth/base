<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>
      Full Layout - jQuery EasyUI Demo
    </title>
    <link rel="stylesheet" type="text/css" href="resources/themes/metro-red/easyui.css">
    <link rel="stylesheet" type="text/css" href="resources/themes/icon.css">
    <script type="text/javascript" src="resources/jquery-1.8.0.min.js">
    </script>
    <script type="text/javascript" src="resources/jquery.easyui.min.js">
    </script>
    <script type="text/javascript" src="resources/app.js">
    </script>
  </head>
  <body class="easyui-layout">
    <div 
        data-options="region:'north',border:false"
        style="overflow: hidden; height: 30px; background: url(resources/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%; line-height: 20px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">


      <span style="float: right; padding-right: 20px;" class="head">
        欢迎
        <a href="#" id="editpass">
          修改密码
        </a>
        <a href="#" id="loginOut">
          安全退出
        </a>
      </span>
      <span style="padding-left: 10px; font-size: 16px;">
        <img src="resources/images/blocks.gif" width="20" height="20" align="absmiddle" />
        管理信息系统
      </span>
    </div>
    <div data-options="region:'west',split:true,title:'导航菜单'" style="width: 150px; padding: 10px;">
      <div class="easyui-accordion" fit="true" border="false">
        <!--  导航内容 -->
      </div>
    </div>
    <!--
      <div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width: 100px; padding: 10px;">east
      region</div>
    -->
    <div data-options="region:'south',border:false" style="height: 30px; padding: 10px;">
      south region
    </div>
    <div data-options="region:'center'">
      <div id="tabs" class="easyui-tabs" fit="true" border="false">
        <div title="欢迎使用" style="padding: 20px; overflow: hidden;" id="home">

          <h1>
            Welcome to jQuery UI!
          </h1>

        </div>
      </div>
    </div>


    <div id="mm" class="easyui-menu" style="width: 150px;">
      <div id="mm-tabclose">
        关闭
      </div>
      <div id="mm-tabcloseall">
        全部关闭
      </div>
      <div id="mm-tabcloseother">
        除此之外全部关闭
      </div>
      <div class="menu-sep">
      </div>
      <div id="mm-tabcloseright">
        当前页右侧全部关闭
      </div>
      <div id="mm-tabcloseleft">
        当前页左侧全部关闭
      </div>
      <div class="menu-sep">
      </div>
      <div id="mm-exit">
        退出
      </div>
    </div>
  </body>
</html>
