<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	Namespace
			.register(
					"icon.list",
					{
						formatOperation : function(value, row, index) {
							if (value) {
								var edit = '['
										+ '<a href="#" onclick="icon.list.edit('
										+ value + ')">编辑</a>' + ']';
								var del = '['
										+ '<a href="#" onclick="icon.list.remove('
										+ value + ' )">删除</a>' + ']';
								if(hasRole("${ROLE_AUTH_EDIT}"))
								return edit + del;
							}
						},
						formatType : function(value, row, index) {
							if (value) {
								return value.cnname;
							}
						},
						formatIcon : function(value, row, index) {
							if (value)
								return '<image width=16px height=16px border="0" src='+row["iconPath"]+'/>'
						},

						remove : function(value) {
							$.messager.confirm('提示', '确定要删除吗?', function(r) {
								if (r) {
									$.ajax({
										url : 'icon/' + value,
										success : function(data) {
											if (data.success) {
												$.dialog.tips(data.msg);
												icon.list.reload();
											} else {
												$.dialog.tips(data.msg + ":"
														+ data.obj, 3,
														'error.gif');
											}
										},
										type : 'DELETE'
									});
								}
							});
						},
						edit : function(value) {
							$('#iconDialog').dialog({
								title : '修改图标',
								width : 600,
								height : 300,
								closed : false,
								resizable : true,
								cache : false,
								href : 'icon/' + value + '/edit',
								modal : true
							});
						},
						reload : function() {
							$('#icon_table').datagrid('reload');
						},
						closeDialog : function() {
							$('#iconDialog').dialog('close');
						},
						toolbar : [
								{
									text : '增加',
									iconCls : 'icon-add',
									disabled : !hasRole('ROLE_AUTH_EDIT'),
									handler : function() {
										$('#iconDialog').dialog({
											title : '增加菜单',
											width : 600,
											height : 300,
											closed : false,
											resizable : true,
											cache : false,
											href : 'icon/new',
											modal : true
										});
									}
								},
								'-',
								{
									text : '生成样式表',
									iconCls : 'icon-edit',
									handler : function() {
										$.ajax({
											url : 'icon/css',
											success : function(data) {
												if (data.success) {
													$.dialog.tips(data.msg);
													icon.list.reload();
												} else {
													$.dialog.tips(data.msg
															+ ":" + data.obj,
															3, 'error.gif');
												}
											}

										});
									}
								} ]

					});
</script>
<table id="icon_table" class="easyui-datagrid"
	data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'icon/list/data',toolbar:icon.list.toolbar,pagination:'true',fitColumns:true,fit:true">
	<thead>
		<tr>
			<th data-options="field:'iconName',width:200,align:'left'">图标名称</th>
			<th
				data-options="field:'iconPath',width:80,align:'left',formatter:icon.list.formatIcon">
				图标</th>
			<th
				data-options="field:'type',width:280,align:'left',formatter:icon.list.formatType">类型</th>
			<th
				data-options="field:'id',width:200,align:'left',formatter:icon.list.formatOperation">
				操作</th>
		</tr>
	</thead>
</table>
<div id="iconDialog"></div>
