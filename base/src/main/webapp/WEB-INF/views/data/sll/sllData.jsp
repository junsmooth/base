<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	Namespace.register("sll.list", {
		
		formatSLLTime : function(value) {
			return formatDateTime(value);
		},
		formatSLLPoint : function(value) {
			return value.monitoringName;
		},
		myDate : function(value) {
			//var d = formatDateTime(value);
			return formatDateTime(value);
		},
		formatSLLValue:function(value){
			return value.toFixed(2);
		}

	});

	function submit() {
		var validFormDate = $("#sll_tb").form('validate');
		if (!validFormDate) {
			return;
		}
		var str1 = '', mp, min1, max1;

		mp = $('#sll_mp').combobox('getValues');

		for ( var i = 0; i < mp.length; i++) {
			str1 += mp[i] + ',';
		}
		str1 = str1.substring(0, str1.length - 1);
		//return ;

		min1 = $('#sll_min').combobox('getText');

		max1 = $('#sll_max').combobox('getText');

		$('#sllId').datagrid('load', {
			min : min1,
			max : max1,
			str : str1
		});

	}
	function Mystr2time(str) {
		var reg = /^(\d+)-(\d{1,2})-(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
		var r = str.match(reg);
		if (r == null)
			return false;
		r[2] = r[2] - 1;
		return new Date(r[1], r[2], r[3], r[4], r[5], r[6]);
	}
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="sllId" class="easyui-datagrid"
			data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'sll/data/sllData',pagination:'true',fitColumns:true,fit:true,toolbar:'#sll_tb'">
			<thead>

				<tr>
					<th id="dt"
						data-options="field:'dateTime',formatter:sll.list.formatSLLTime,width:80,align:'left'">

						时间</th>
					<th
						data-options="field:'point',width:80,align:'left',formatter:sll.list.formatSLLPoint">
						测点</th>
					<th data-options="field:'value',formatter:sll.list.formatSLLValue,width:120,align:'left'">
						监测值(L/S)</th>

				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="sll_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='sll_min' class="easyui-datetimebox"
			data-options="formatter:sll.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='sll_max' class="easyui-datetimebox"
			data-options="formatter:sll.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		测点: <input id="sll_mp" class="easyui-combobox"
			name="sll_mp"
			data-options="  
                    url:'sll/data/points',  
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
