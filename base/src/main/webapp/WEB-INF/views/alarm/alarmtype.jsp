<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	Namespace.register("alarm.alarmtype", {
		formatOperation : function(value) {
			if (value) {
				var edit = '[' + '<a href="#" onclick="alarm.alarmtype.edit('
						+ value + ')">编辑</a>' + ']';
				var del = '[' + '<a href="#" onclick="alarm.alarmtype.remove('
						+ value + ' )">删除</a>' + ']';
				if (hasRole('ROLE_AUTH_EDIT')) {
					return edit + del;
				}

			}
		},
		colorStyler : function(value) {
			if (value) {
				return 'background-color:' + value.code;
			}
		},

		remove : function(value) {
			$.messager.confirm('提示', '确定要删除吗?', function(r) {
				if (r) {
					$.ajax({
						url : 'alarm/alarmtype/' + value,
						success : function(data) {
							if (data.success) {
								$.dialog.tips(data.msg);
								alarm.alarmtype.reload();
							} else {
								$.dialog.tips(data.msg + ":" + data.obj, 3,
										'error.gif');
							}
						},
						type : 'DELETE'
					});
				}
			});
		},
		edit : function(value) {
			$('#alarm_alarmType_dialog').dialog({
				title : '编辑报警级别',
				width : 600,
				height : 336,
				closed : false,
				//resizable : true,
				cache : false,
				href : 'alarm/alarmtype/' + value + '/edit',
				modal : true
			});
		},
		closeDialog : function() {
			$('#alarm_alarmType_dialog').dialog('close');
		},
		reload : function() {
			$('#monPointGrid').datagrid('reload');
		},
		toolbar : [ {
			text : '增加',
			iconCls : 'icon-add',
			disabled : !hasRole('ROLE_AUTH_EDIT'),
			handler : function() {
				$('#alarm_alarmType_dialog').dialog({
					title : '添加报警级别',
					width : 600,
					height : 360,
					closed : false,
					//resizable:true,
					cache : false,
					href : 'alarm/alarmtype/new',
					modal : true
				});
			}
		}, '-', {
			text : '刷新',
			iconCls : 'icon-reload',
			handler : function() {
				alarm.alarmtype.reload();
			}
		}

		]

	});
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<table id="monPointGrid" class="easyui-datagrid"
			data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'alarm/alarmtype/data',toolbar:alarm.alarmtype.toolbar,pagination:'true',fitColumns:true,fit:true">
			<thead>
				<tr>

					<th data-options="field:'name',width:80,align:'left'">名称</th>
					<th data-options="field:'severity',width:120,align:'left'">
						严重程度(数值越大越严重)</th>
					<th
						data-options="field:'color',width:120,align:'left',styler:alarm.alarmtype.colorStyler,formatter:function(value,row,index){return value.name;}">
						颜色</th>

					<th
						data-options="field:'id',width:200,align:'left',formatter:alarm.alarmtype.formatOperation">
						操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="alarm_alarmType_dialog"></div>
