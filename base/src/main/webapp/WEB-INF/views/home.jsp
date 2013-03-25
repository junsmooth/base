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

#borderContainerTwo {
	width: 100%;
	height: 100%;
}
</style>
	<script>dojoConfig = {parseOnLoad: true}</script>
</head>
<body class="claro">
	<div data-dojo-type="dijit/layout/BorderContainer"
		data-dojo-props="gutters:true, liveSplitters:false"
		id="borderContainerTwo">
		<div data-dojo-type="dijit/layout/ContentPane"
			data-dojo-props="region:'top', splitter:false" style="height: 50px;" align="">
			BGRIMM Blasting System</div>
		<div data-dojo-type="dijit/layout/AccordionContainer"
			data-dojo-props="minSize:20, region:'leading', splitter:true"
			style="width: 300px;" id="leftAccordion">
			<div data-dojo-type="dijit/layout/AccordionPane"
				title="One fancy Pane"></div>
			<div data-dojo-type="dijit/layout/AccordionPane" title="Another one">
			</div>
			<div data-dojo-type="dijit/layout/AccordionPane"
				title="Even more fancy" selected="true"></div>
			<div data-dojo-type="dijit/layout/AccordionPane"
				title="Last, but not least"></div>
		</div>
		<!-- end AccordionContainer -->
		<div data-dojo-type="dijit/layout/TabContainer"
			data-dojo-props="region:'center', tabStrip:true">
			<div data-dojo-type="dijit/layout/ContentPane" title="My first tab"
				selected="true">Lorem ipsum and all around...</div>
			<div data-dojo-type="dijit/layout/ContentPane" title="My second tab">
				Lorem ipsum and all around - second...</div>
			<div data-dojo-type="dijit/layout/ContentPane"
				data-dojo-props="closable:true" title="My last tab">Lorem
				ipsum and all around - last...</div>
		</div>
		<!-- end TabContainer -->
	</div>
	<!-- end BorderContainer -->


	<script type="text/javascript" src="resources/dojo/dojo.js"
		data-dojo-config="async:true"></script>
	<script>
	require(["dojo/parser", "dijit/layout/ContentPane", "dijit/layout/BorderContainer", "dijit/layout/TabContainer", "dijit/layout/AccordionContainer", "dijit/layout/AccordionPane"]);
 </script>
</body>
</html>
