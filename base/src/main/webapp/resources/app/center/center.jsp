<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Blasting Management System</title>

<link rel="stylesheet" href="resources/dijit/themes/claro/claro.css"
	media="screen">
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
	<script>dojoConfig = {parseOnLoad: true}</script>
	<script type="text/javascript" src="resources/dojo/dojo.js"
		data-dojo-config="async:true"></script>
	<script type="text/javascript" src="resources/app.js"></script>
	<script type="text/javascript" src="resources/app/head/head.js"></script>
	<script type="text/javascript" src="resources/app/left/left.js"></script>
</head>
<body class="claro">
	<div data-dojo-type="dijit/layout/BorderContainer"
		data-dojo-props="gutters:true, liveSplitters:false"
		id="boderContainer">
		<div data-dojo-type="dijit/layout/ContentPane"
			data-dojo-props="region:'top', splitter:false" style="height: 50px;"
			align="">
			<span data-dojo-type="FancyCounter">Place Holder</span>
		</div>
		<div data-dojo-type="dijit/layout/ContentPane"
			data-dojo-props="region:'leading', splitter:true"
			style="width: 200px;" id="leftTree">
		</div>
		<!-- end AccordionContainer -->
		<div id="contentTabs" data-dojo-type="dijit/layout/TabContainer"
			data-dojo-props="region:'center', tabStrip:true">
			<div data-dojo-type="dijit/layout/ContentPane" title="My first tab"
				selected="true">Lorem ipsum and all around...</div>
			
		</div>
		<!-- end TabContainer -->
	</div>
	<!-- end BorderContainer -->





</body>
</html>
