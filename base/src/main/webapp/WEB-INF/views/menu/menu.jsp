<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="menu" style="width: 300px; height: 300px">
	<div data-dojo-type="dijit/layout/AccordionContainer"
		style="height: 300px">
		<div id="testevent" data-dojo-type="dijit/layout/ContentPane" title="项目信息">
			<ul>
				<li><a id="testa" url="project/projectinfo" href="#">项目信息</a></li>
				<li><a href="project/tailingsinfo">尾矿库概况</a></li>
			</ul>
		</div>
		<div data-dojo-type="dijit/layout/ContentPane" title="实时监测">
			<ul>
				<li><a href="realtime/picture">监测图</a></li>
				<li><a href="realtime/list">监测点列表</a></li>
			</ul>
		</div>
		<div data-dojo-type="dijit/layout/ContentPane" title="参数配置">
			<ul>
				<li><a href="config/threshold">报警限值</a></li>
				<li><a href="user">用户管理</a></li>
			</ul>
		</div>
		<div data-dojo-type="dijit/layout/ContentPane" title="过程曲线">
			<ul>
				<li><a href="bmwy/line">表面位移过程线</a></li>
				<li><a href="nbwy/line">内部位移过程线</a></li>
				<li><a href="jrx/line">浸润线过程线</a></li>
				<li><a href="ksw/line">库水位过程线</a></li>
				<li><a href="jyl/line">降雨量过程线</a></li>
			</ul>
		</div>
		<div data-dojo-type="dijit/layout/ContentPane" title="历史数据">
			<ul>
				<li><a href="bmwy/data">表面位移过程线</a></li>
				<li><a href="nbwy/data">内部位移过程线</a></li>
				<li><a href="jrx/data">浸润线过程线</a></li>
				<li><a href="ksw/data">库水位过程线</a></li>
				<li><a href="jyl/data">降雨量过程线</a></li>
			</ul>
		</div>
		<div data-dojo-type="dijit/layout/ContentPane" title="报警信息">
			<ul>
				<li><a href="alarm">报警记录</a></li>
				
			</ul>
		</div>
	</div>
</div>
<script>require(["app/menu.js"]);</script>