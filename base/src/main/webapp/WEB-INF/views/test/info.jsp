<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script>

</script>
</head>
<body>
	<span data-dojo-type="dijit.Toolbar"> <input type="button"
		data-dojo-type="dijit.form.Button" tabIndex="-1"
		intermediateChanges="false" label="Button 1" iconClass="dijitNoIcon"></input>
		<input type="button" data-dojo-type="dijit.form.Button" tabIndex="-1"
		intermediateChanges="false" label="Button 2" iconClass="dijitNoIcon"
		onclick="test();"></input> <input type="button"
		data-dojo-type="dijit.form.Button" tabIndex="-1"
		intermediateChanges="false" label="Button 3" iconClass="dijitNoIcon"></input>
	</span>
	<button data-dojo-type="dijit/form/Button" type="button">
		Click me too!
		<script type="dojo/on" data-dojo-event="click" data-dojo-args="evt">
        require(["dojo/dom"], function(dom){
            dom.byId("result2").innerHTML += "Thank you! ";
        });
    </script>
	</button>
	
	<span data-dojo-type="FancyCounter">Place Holder</span>
	<div id="result2"></div>
	<div style="font-size: 16;">
		&copy;版权所有：&nbsp;<a href="">河北金厂峪矿业有限责任公司</a> &nbsp;&nbsp;&nbsp;&nbsp;<a
			href="http://www.bgrimm.com">北京矿冶研究总院</a>
	</div>
	<div style="font-size: 12;">建议使用：IE浏览器，分辨率为1024*768</div>
</body>
</html>