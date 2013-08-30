<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	Namespace.register("gtcd.list", {
		
		formatGTCDTime : function(value) {
			return formatDateTime(value);
		},
		formatGTCDPoint : function(value) {
			return value.monitoringName;
		},
		myDate : function(value) {
			//var d = formatDateTime(value);
			return formatDateTime(value);
		},
		formatGTCDValue: function(value){
			return value.toFixed(2);
		}

	});

	function submit() {
		var validFormDate = $("#gtcd_tb").form('validate');
		if (!validFormDate) {
			return;
		}
		var str1 = '', mp, min1, max1;

		mp = $('#gtcd_mp').combobox('getValues');

		for ( var i = 0; i < mp.length; i++) {
			str1 += mp[i] + ',';
		}
		str1 = str1.substring(0, str1.length - 1);
		//return ;

		min1 = $('#gtcd_min').combobox('getText');

		max1 = $('#gtcd_max').combobox('getText');

		$('#gtcdId').datagrid('load', {
			min : min1,
			max : max1,
			str : str1
		});

	}
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="gtcdId" class="easyui-datagrid"
			data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'gtcd/data/gtcdData',pagination:'true',fitColumns:true,fit:true,toolbar:'#gtcd_tb'">
			<thead>

				<tr>
					<th id="dt"
						data-options="field:'dateTime',formatter:gtcd.list.formatGTCDTime,width:80,align:'left'">

						时间</th>
					<th
						data-options="field:'point',width:80,align:'left',formatter:gtcd.list.formatGTCDPoint">
						测点</th>
					<th data-options="field:'value',formatter:gtcd.list.formatGTCDValue,width:120,align:'left'">
						监测值(m)</th>

				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="gtcd_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='gtcd_min' class="easyui-datetimebox"
			data-options="formatter:gtcd.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='gtcd_max' class="easyui-datetimebox"
			data-options="formatter:gtcd.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		测点: <input id="gtcd_mp" class="easyui-combobox"
			name="gtcd_mp"
			data-options="  
                    url:'gtcd/data/points',  
                    valueField:'position',  
                    textField:'monitoringName',  
                    multiple:true,  
                    panelHeight:'auto',
                    editable:false  
            "
			> <a href="#" class="easyui-linkbutton"
			iconCls="icon-search" onclick="submit()">查询</a>
	</div>
</div>
