<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="menu" style="width: 300px; height: 300px">
	<div data-dojo-type="dijit/layout/AccordionContainer"
		style="height: 300px">
		<div data-dojo-type="dijit/layout/ContentPane" title="项目信息">
			<ul>
				<li><a url="project/projectinfo" href="#">项目信息</a></li>
				<li><a url="project/tailingsinfo" href="#">尾矿库概况</a></li>
			</ul>
		</div>
		<div data-dojo-type="dijit/layout/ContentPane" title="实时监测">
			<ul>
				<li><a url="realtime/picture" href="#">监测图</a></li>
				<li><a url="realtime/list" href="#">监测点列表</a></li>
			</ul>
		</div>
		<div data-dojo-type="dijit/layout/ContentPane" title="参数配置">
			<ul>
				<li><a url="config/threshold" href="#">报警限值</a></li>
				<li><a url="user" href="#">用户管理</a></li>
			</ul>
		</div>
		<div data-dojo-type="dijit/layout/ContentPane" title="过程曲线">
			<ul>
				<li><a url="bmwy/line" href="#">表面位移过程线</a></li>
				<li><a url="nbwy/line" href="#">内部位移过程线</a></li>
				<li><a url="jrx/line" href="#">浸润线过程线</a></li>
				<li><a url="ksw/line" href="#">库水位过程线</a></li>
				<li><a url="jyl/line" href="#">降雨量过程线</a></li>
			</ul>
		</div>
		<div data-dojo-type="dijit/layout/ContentPane" title="历史数据">
			<ul>
				<li><a url="bmwy/data" href="#">表面位移数据</a></li>
				<li><a url="nbwy/data" href="#">内部位移数据</a></li>
				<li><a url="jrx/data" href="#">浸润线数据</a></li>
				<li><a url="ksw/data" href="#">库水位数据</a></li>
				<li><a url="jyl/data" href="#">降雨量数据</a></li>
			</ul>
		</div>
		<div data-dojo-type="dijit/layout/ContentPane" title="报警信息">
			<ul>
				<li><a url="alarm" href="#">报警记录</a></li>

			</ul>
		</div>
	</div>
</div>
