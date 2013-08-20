<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	Namespace.register("config.monattr", {
		formatOperation : function(value) {
			if (value) {
				var edit = '[' + '<a href="#" onclick="config.monattr.edit('
						+ value + ')">编辑</a>' + ']';
				var del = '[' + '<a href="#" onclick="config.monattr.remove('
						+ value + ' )">删除</a>' + ']';
				if (hasRole('${ROLE_AUTH_EDIT}')) {
					return edit + del;
				}

			}
		},

		remove : function(value) {
			$.messager.confirm('提示', '确定要删除吗?', function(r) {
				if (r) {
					$.post('config/monAttrType/remove', {
						id : value
					}, function(data) {
						if (data.success) {
							config.monattr.reload();
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
		edit : function(value) {
			$('#monitoring_attribute_dialog').dialog({
				title : '编辑监测属性',
				width : 400,
				height : 226,
				closed : false,
				resizable : true,
				cache : false,
				href : 'config/monattr/' + value + '/edit',
				modal : true
			});
		},
		closeDialog : function() {
			$('#monitoring_attribute_dialog').dialog('close');
		},
		reload : function() {
			$('#monPointGrid').datagrid('reload');
		},
		toolbar : [ {
			text : '增加',
			iconCls : 'icon-add',
			disabled : !hasRole('${ROLE_AUTH_EDIT}'),
			handler : function() {
				$('#monitoring_attribute_dialog').dialog({
					title : '添加监测属性',
					width : 400,
					height : 226,
					closed : false,
					//resizable:true,
					cache : false,
					href : 'config/monattr/new',
					modal : true
				});
			}
		}, '-', {
			text : '刷新',
			iconCls : 'icon-reload',
			handler : function() {
				config.monattr.reload();
			}
		}

		]

	});
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<table id="monPointGrid" class="easyui-datagrid"
			data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'config/monattr/data',toolbar:config.monattr.toolbar,pagination:'true',fitColumns:true,fit:true">
			<thead>
				<tr>
					<th data-options="field:'name',width:80,align:'left'">监测指标</th>
					<th data-options="field:'attr',width:80,align:'left'">关联字段</th>
					<th
						data-options="field:'type',width:80,align:'left',formatter:function(value,row,index){return row['type']['name'];}">
						监测类型</th>

					<th
						data-options="field:'id',width:200,align:'left',formatter:config.monattr.formatOperation">
						操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="monitoring_attribute_dialog"></div>
