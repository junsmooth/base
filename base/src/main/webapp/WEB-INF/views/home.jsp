<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>尾矿库在线监测系统</title>

<!-- <link rel="stylesheet" href="resources/dijit/themes/claro/claro.css">
<link rel="stylesheet" href="resources/dijit/themes/tundra/tundra.css"/>
<link rel="stylesheet" href="resources/dijit/themes/nihilo/nihilo.css"> -->
<link rel="stylesheet" href="resources/dijit/themes/soria/soria.css" />
<link rel="stylesheet" href="resources/css/style.css"></link>
<style type="text/css">
html,body {
	width: 100%;
	height: 100%;
	margin: 0;
	overflow: hidden;
}

#boderContainer {
	width: 100%;
	height: 100%;
}
</style>
<style type="text/css">
@import "resources/dojox/grid/resources/soriaGrid.css";

/*Grid needs an explicit height by default*/
#gridDiv {
	height: 20em;
}
</style>
<script>
	//dojoConfig = {parseOnLoad: true}
</script>
<script type="text/javascript" src="resources/dojo/dojo.js"
	data-dojo-config="async:true"></script>
<script type="text/javascript" src="resources/app.js"></script>
</head>
<body class="soria">
	<div data-dojo-type="dijit/layout/BorderContainer"
		data-dojo-props="gutters:true, liveSplitters:false"
		id="boderContainer">
		<div data-dojo-type="dijit/layout/ContentPane"
			data-dojo-props="region:'top', splitter:false"
			style="height: 50px; background-color: #c7dbfc; overflow-y: hidden"
			href="/header"></div>
		<div data-dojo-type="dijit/layout/ContentPane"
			data-dojo-props="region:'leading', splitter:true"
			href="/menu" style="width: 200px;" id="leftTree">

		</div>
		<!-- end AccordionContainer -->
		<div id="contentTabs" data-dojo-type="dijit/layout/TabContainer"
			data-dojo-props="region:'center', tabStrip:true">
			<!-- <div data-dojo-type="dijit/layout/ContentPane" title="My first tab"
				selected="true">Lorem ipsum and all around...
					<div id="testdiv">testdiv</div>
			<button id="testbtn"></button>
				</div> -->

		</div>
	</div>
	<!-- end TabContainer -->
	<!-- end BorderContainer -->

	<script type="text/javascript">
		require([ "dojo/parser", "dojo/ready" ], function(parser, ready) {
			ready(function() {
				parser.parse();
			});
		});
	</script>



</body>
</html>
