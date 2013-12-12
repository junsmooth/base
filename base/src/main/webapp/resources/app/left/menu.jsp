<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="menu" style="width: 300px; height: 300px">
	<div data-dojo-type="dijit/layout/AccordionContainer" style="height:300px">
		<div data-dojo-type="dijit/layout/ContentPane" title="项目信息">
			<ul>
				<li><a href="project/projectinfo">项目信息</a></li>
				<li <li><a href="project/tailingsinfo">尾矿库概况</a></li>
			</ul>
		</div>
		<div data-dojo-type="dijit/layout/ContentPane" title="参数配置">
			<ul>
				<li><a href="config/threshold">报警限值</a></li>
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
	</div>
</div>