<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Blasting Management System</title>
</head>
<body>
	<h1 id="greeting">Hello</h1>
	<script type="text/javascript" src="resources/dojo/dojo.js"
		data-dojo-config="async:true" />
	<script>
 require(["dojo/dom", "dojo/domReady!"], function(dom){
	    var greeting = dom.byId("greeting");
	    greeting.innerHTML += " from Dojo!";
	});
	require(["demo/myModule"], function(myModule){
	    // Use our module to change the text in the greeting
	    myModule.setText("greeting", "Hello Dojo!");
	    // After a few seconds, restore the text to its original state
	    setTimeout(function(){
	        myModule.restoreText("greeting");
	    }, 3000);
	});
 </script>
</body>
</html>
