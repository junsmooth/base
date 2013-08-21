<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	Namespace.register("alarm.alarmcolor", {
		formatOperation : function(value) {
			if (value) {
				var edit = '[' + '<a href="#" onclick="alarm.alarmcolor.edit('
						+ value + ')">编辑</a>' + ']';
				var del = '[' + '<a href="#" onclick="alarm.alarmcolor.remove('
						+ value + ' )">删除</a>' + ']';
				if (hasRole('ROLE_AUTH_EDIT')) {
					return edit + del;
				}

			}
		},
		colorStyler : function(value, row, index) {
			if (value) {
				return 'background-color:' + value;
			}

		},

		remove : function(value) {
			$.messager.confirm('提示', '确定要删除吗?', function(r) {
				if (r) {
					$.ajax({
						url : 'alarm/alarmcolor/' + value,
						success : function(data) {
							if (data.success) {
								$.dialog.tips(data.msg);
								alarm.alarmcolor.reload();
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
			$('#new_alarm_color_dialog').dialog({
				title : '编辑报警颜色',
				width : 600,
				height : 336,
				closed : false,
				resizable : true,
				cache : false,
				href : 'alarm/alarmcolor/' + value + '/edit',
				modal : true
			});
		},
		closeDialog : function() {
			$('#new_alarm_color_dialog').dialog('close');
		},
		reload : function() {
			$('#monPointGrid').datagrid('reload');
		},
		toolbar : [ {
			text : '增加',
			iconCls : 'icon-add',
			disabled : !hasRole('ROLE_AUTH_EDIT'),
			handler : function() {
				$('#new_alarm_color_dialog').dialog({
					title : '增加报警颜色',
					width : 600,
					height : 400,
					closed : false,
					resizable : true,
					cache : false,
					href : 'alarm/alarmcolor/new',
					modal : true
				});
			}
		}, '-', {
			text : '刷新',
			iconCls : 'icon-reload',
			handler : function() {
				alarm.alarmcolor.reload();
			}
		}

		]

	});
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<table id="monPointGrid" class="easyui-datagrid"
			data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'alarm/alarmcolor/data',toolbar:alarm.alarmcolor.toolbar,pagination:'true',fitColumns:true,fit:true">
			<thead>
				<tr>

					<th data-options="field:'name',width:80,align:'left'">颜色</th>
					<th
						data-options="field:'code',width:120,align:'left',styler:alarm.alarmcolor.colorStyler">颜色编码</th>

					<th
						data-options="field:'id',width:200,align:'left',formatter:alarm.alarmcolor.formatOperation">
						操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="new_alarm_color_dialog"></div>
