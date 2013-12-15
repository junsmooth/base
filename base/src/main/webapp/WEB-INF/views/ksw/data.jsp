<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div data-dojo-type="dijit/layout/ContentPane">
	<label for="date1">开始日期:</label> <input type="text"
		name="date1" id="date1" value="" width="50px"
		data-dojo-type="dijit/form/DateTextBox" />
	<table data-dojo-type="dojox.grid.DataGrid">
		<thead>
			<tr>
				<th field="fieldName" width="200px">Column Name</th>
				<th field="fieldName" width="200px">Column Name</th>
			</tr>
		</thead>
		<script type="dojo/method">
       console.log("I will execute on instantiation");
	require(["app/monitor/ksw/ksw.js"]);
    </script>
	</table>
</div>


