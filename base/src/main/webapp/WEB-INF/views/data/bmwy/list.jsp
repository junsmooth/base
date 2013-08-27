<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	Namespace.register("bmwydata.list", {
		formatOperation : function(value) {
			if (value) {
				var edit = '[' + '<a href="#" onclick="user.list.edit(' + value
						+ ')">编辑</a>' + ']';
				var del = '[' + '<a href="#" onclick="user.list.remove('
						+ value + ' )">删除</a>' + ']';
				if (hasRole('ROLE_USER_EDIT')) {
					return edit + del;
				}

			}
		},
		formatDataPageTime : function(value) {
			return formatDateTime(value);
		},
		formatPoint : function(value) {
			return value.monitoringName;
		},
		remove : function(value) {
			$.messager.confirm('提示', '确定要删除吗?', function(r) {
				if (r) {
					$.post('user/remove', {
						id : value
					}, function(data) {
						if (data.success) {
							user.list.reload();
							$.dialog.tips(data.msg);
						} else {
							$.dialog.tips(data.msg + ":" + data.obj, 600,
									'error.gif');
						}
					});
				} else {
					return;
				}
			});
		},
		myDate : function(value) {
			var d = formatDateTime(value);
			return formatDateTime(value);
		},
		edit : function(value) {
			$('#userdialog').dialog({
				title : '用户编辑',
				width : 600,
				height : 336,
				closed : false,
				resizable : true,
				cache : false,
				href : 'user/addOrUpdate?id=' + value,
				modal : true
			});
		},
		closeDialog : function() {
			$('#userdialog').dialog('close');
		},
		reload : function() {
			$('#jrxgrid').datagrid('reload');
		},
		submit:function(){
			var validFormDate = $("#bmwydata_tb").form('validate');
			if (!validFormDate) {
				return;
			}
			var str1 = '', mp, min1, max1;

			mp = $('#bmwydata_monitorPosition').combobox('getValues');

			for ( var i = 0; i < mp.length; i++) {
				str1 += mp[i] + ',';
			}
			str1 = str1.substring(0, str1.length - 1);
			//return ;

			min1 = $('#bmwydata_min').combobox('getText');

			max1 = $('#bmwydata_max').combobox('getText');

			$('#bmwydata_grid').datagrid('load', {
				min : min1,
				max : max1,
				str : str1
			});
		},
		formatBMWYValue:function(value){
			return (1000*value).toFixed(2);
		}

	});
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="bmwydata_grid" class="easyui-datagrid"
			data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'bmwy/data/bmwyData',pagination:'true',fitColumns:true,fit:true,toolbar:'#bmwydata_tb'">
			<thead>

				<tr>
					<th 
						data-options="field:'dateTime',formatter:bmwydata.list.formatDataPageTime,width:80,align:'left'">

						时间</th>
					<th
						data-options="field:'point',width:80,align:'left',formatter:bmwydata.list.formatPoint">
						测点</th>
					<th data-options="field:'dN',formatter:bmwydata.list.formatBMWYValue,width:120,align:'left'">累积平行坝轴线变化(mm)</th>
					<th data-options="field:'dE',formatter:bmwydata.list.formatBMWYValue,width:120,align:'left'">累积垂直坝轴线变化(mm)</th>
					<th data-options="field:'dH',formatter:bmwydata.list.formatBMWYValue,width:120,align:'left'">累积铅垂方向变化(mm)</th>
					<th data-options="field:'dDN',formatter:bmwydata.list.formatBMWYValue,width:120,align:'left'">本次平行坝轴线变化(mm)</th>
					<th data-options="field:'dDE',formatter:bmwydata.list.formatBMWYValue,width:120,align:'left'">本次垂直坝轴线变化(mm)</th>
					<th data-options="field:'dDH',formatter:bmwydata.list.formatBMWYValue,width:120,align:'left'">本次铅垂方向变化(mm)</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="bmwydata_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='bmwydata_min' class="easyui-datetimebox"
			data-options="formatter:bmwydata.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='bmwydata_max' class="easyui-datetimebox"
			data-options="formatter:bmwydata.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		测点: <input id="bmwydata_monitorPosition" class="easyui-combobox"
			name="monitorPosition"
			data-options="  
                    url:'bmwy/data/points',  
                    valueField:'position',  
                    textField:'monitoringName',  
                    multiple:true,  
                    panelHeight:'auto',
                    editable:false  
            "
			> <a href="#" class="easyui-linkbutton"
			iconCls="icon-search" onclick="bmwydata.list.submit()">查询</a>
	</div>
</div>
