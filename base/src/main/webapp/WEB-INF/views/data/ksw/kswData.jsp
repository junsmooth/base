<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	Namespace.register("ksw.list", {
		
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
			var validFormDate = $("#ksw_tb").form('validate');
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

			min1 = $('#ksw_min').combobox('getText');

			max1 = $('#ksw_max').combobox('getText');

			$('#kswId').datagrid('load', {
				min : min1,
				max : max1,
				str : str1
			});

		}

	});

	
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="kswId" class="easyui-datagrid"
			data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'ksw/data/kswData',pagination:'true',fitColumns:true,fit:true,toolbar:'#ksw_tb'">
			<thead>

				<tr>
					<th id="dt"
						data-options="field:'dateTime',formatter:ksw.list.formatKSWTime,width:80,align:'left'">

						时间</th>
					<th
						data-options="field:'point',width:80,align:'left',formatter:ksw.list.formatKSWPoint">
						测点</th>
					<th data-options="field:'value',width:120,align:'left'">
						深度</th>

				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="ksw_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='ksw_min' class="easyui-datetimebox"
			data-options="formatter:ksw.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='ksw_max' class="easyui-datetimebox"
			data-options="formatter:ksw.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		测点: <input id="ksw_monitorPosition" class="easyui-combobox"
			name="ksw_monitorPosition"
			data-options="  
                    url:'ksw/data/points',  
                    valueField:'position',  
                    textField:'monitoringName',  
                    multiple:true,  
                    panelHeight:'auto',
                    editable:false  
            "
			readonly="readonly"> <a href="#" class="easyui-linkbutton"
			iconCls="icon-search" onclick="formatter:ksw.list.mySubmit()">查询</a>
	</div>
</div>
