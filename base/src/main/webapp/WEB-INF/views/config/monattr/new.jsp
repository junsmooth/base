<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="add_MonAttr_Form" method="post">
			<c:if test="${!empty monattr.id}">
				<input type="hidden" name="id" value="${monattr.id}">
			</c:if>

			<table>
				<tr>
					<td>监测指标:</td>
					<td><input class="easyui-validatebox" type="text" name="name"
						value="${monattr.name}" data-options="required:true"></td>
				</tr>
				<tr>
					<td>关联字段:</td>
					<td><input class="easyui-validatebox" type="text" name="attr"
						value="${monattr.attr}" data-options="required:true"></td>
				</tr>
				<tr>
					<td>监测类型:</td>
					<td><input id="new_monattr_type" class="easyui-combobox"
						type="text"
						name="type.id" 
						data-options="required:true,valueField:'id',textField:'name',url:'config/montype/data',formatter:config.monattr.add.formatMonType">
					</td>
				</tr>
			</table>

		</form>
	</div>
	<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="config.monattr.add.save()"> 保存
		</a> <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)" onclick="config.monattr.closeDialog();">

			取消 </a>
	</div>


</div>
<script>
	Namespace.register('config.monattr.add', {
		save : function() {
			$('#add_MonAttr_Form').form('submit', {
				url : "config/monattr",
				dataType : 'json',
				onSubmit : function(params) {
					var isValid = $(this).form('validate');
					if (!isValid) {
						$.messager.progress('close'); // hide progress bar while the form is invalid
					}
					return isValid; // return false will stop the form submission
				},
				success : function(data) {
					data = $.parseJSON(data);
					if (data.success) {
						config.monattr.closeDialog();
						config.monattr.reload();
						$.dialog.tips(data.msg);
					} else {
						config.monattr.closeDialog();
						config.monattr.reload();
						$.dialog.tips(data.msg);
					}
				}
			});
		},
		formatMonType : function(value, row, index) {
			return value.name;
		}
	});
</script>
