<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	Namespace
			.register(
					"config.monType",
					{
						formatOperation : function(value) {
							if (value) {
								var edit = '['
										+ '<a href="#" onclick="config.monType.edit('
										+ value + ')">编辑</a>' + ']';
								var del = '['
										+ '<a href="#" onclick="config.monType.remove('
										+ value + ' )">删除</a>' + ']';
								if (hasRole('ROLE_USER_EDIT')) {
									return edit + del;
								}

							}
						},
						formatIcon : function(value, row, index) {
							if (value)
								return '<image border="0" src='+value.iconPath+'/'+value.iconName+value.iconExtension+'/>'
						},
						remove : function(value) {
							$.messager.confirm('提示', '确定要删除吗?', function(r) {
								if (r) {
									$.post('config/montype/remove', {
										id : value
									},
											function(data) {
												if (data.success) {
													config.monType.reload();
													$.dialog.tips(data.msg);
												} else {
													$.dialog.tips(data.msg
															+ ":" + data.obj,
															5, 'error.gif');
												}
											});
								} else {
									return;
								}
							});
						},
						edit : function(value) {
							$('#monTypeDialog').dialog(
									{
										title : '监测类型编辑',
										width : 600,
										height : 336,
										closed : false,
										resizable : true,
										cache : false,
										href : 'config/montype/addOrUpdate?id='
												+ value,
										modal : true
									});
						},
						closeDialog : function() {
							$('#monTypeDialog').dialog('close');
						},
						reload : function() {
							$('#monTypeGrid').datagrid('reload');
						}

					});
	config.monType.toolbar = [ {
		text : '增加',
		iconCls : 'icon-add',
		disabled : !hasRole('ROLE_MONTYPE_EDIT'),
		handler : function() {
			$('#monTypeDialog').dialog({
				title : '添加类型',
				width : 600,
				height : 220,
				closed : false,
				//resizable:true,
				cache : false,
				href : 'config/montype/addOrUpdate?id=-1',
				modal : true
			});
		}
	}, '-', {
		text : '刷新',
		iconCls : 'icon-reload',
		handler : function() {
			config.monType.reload();
		}
	}

	];
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<table id="monTypeGrid" class="easyui-datagrid"
			data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'config/montype/data',toolbar:config.monType.toolbar,fitColumns:true,fit:true">
			<thead>
				<tr>
					<th data-options="field:'name',width:80,align:'left'">名称</th>
					<th data-options="field:'code',width:80,align:'left'">编码</th>
					<th
						data-options="field:'icon',width:120,align:'left',formatter:config.monType.formatIcon">
						图标</th>
					<th data-options="field:'domainClsName',width:120,align:'left'">
						领域模型类</th>
					
					<th
						data-options="field:'id',width:200,align:'left',formatter:config.monType.formatOperation">
						操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="monTypeDialog"></div>
