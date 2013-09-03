<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	Namespace.register("yingli.list", {
		
		formatKSWTime : function(value) {
			return formatDateTime(value);
		},
		formatKSWPoint : function(value) {
			return value.monitoringName;
		},
		myDate : function(value) {
			//var d = formatDateTime(value);
			return formatDateTime(value);
		},
		mySubmit:function(){
			var validFormDate = $("#yingli_data_toolbar").form('validate');
			if (!validFormDate) {
				return;
			}
			var str1 = '', mp, min1, max1;

			mp = $('#ksw_monitorPosition').combobox('getValues');

			for ( var i = 0; i < mp.length; i++) {
				str1 += mp[i] + ',';
			}
			str1 = str1.substring(0, str1.length - 1);
			//return ;

			min1 = $('#yingli_data_min').combobox('getText');

			max1 = $('#yingli_data_max').combobox('getText');

			$('#ying_table_id').datagrid('load', {
				min : min1,
				max : max1,
				str : str1
			});

		},
		formatKSWValue:function(value){
			return value.toFixed(2);
		}

	});

	
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="ying_table_id" class="easyui-datagrid"
			data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'yingli/data',pagination:'true',fitColumns:true,fit:true,toolbar:'#yingli_data_toolbar'">
			<thead>

				<tr>
					<th id="dt"
						data-options="field:'dateTime',formatter:yingli.list.formatKSWTime,width:80,align:'left'">

						时间</th>
					<th
						data-options="field:'point',width:80,align:'left',formatter:yingli.list.formatKSWPoint">
						测点</th>
					<th data-options="field:'value',formatter:yingli.list.formatKSWValue,width:120,align:'left'">
						监测值(kN)</th>

				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="yingli_data_toolbar" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='yingli_data_min' class="easyui-datetimebox"
			data-options="formatter:yingli.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='yingli_data_max' class="easyui-datetimebox"
			data-options="formatter:yingli.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		测点: <input id="ksw_monitorPosition" class="easyui-combobox"
			name="ksw_monitorPosition"
			data-options="  
                    url:'yingli/points',  
                    method:'get',
                    valueField:'position',  
                    textField:'monitoringName',  
                    multiple:true,  
                    panelHeight:'auto',
                    editable:false  
            "
			> <a href="#" class="easyui-linkbutton"
			iconCls="icon-search" onclick="formatter:yingli.list.mySubmit()">查询</a>
	</div>
</div>
