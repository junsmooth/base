<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="ff" method="post">
		<c:if test="${!empty menu.id}"><input type="hidden" name="id" value="${menu.id}"></input></c:if>
		
			<table>
				<tr>
					<td>菜单名称:</td>
					<td><input class="easyui-validatebox" type="text"
						name="menuName" value="${menu.name}" data-options="required:true"> </input></td>
				</tr>
				<tr>
					<td>模块名称:</td>
					<td><input class="easyui-validatebox" type="text"
						name="moduleName" value="${menu.module}" data-options="required:true"> </input></td>
				</tr>
				<tr>
					<td>父菜单:</td>
					<td><select name="parentMenu.id">
							<option value="1"></option>
							<c:forEach items="${menulist}" var="pMenu">
								<option value="${pMenu.id}" <c:if test="${menu.parentid==pMenu.id }">selected="selected"</c:if>>
									${pMenu.name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>菜单地址:</td>
					<td><input name="url" class=text
						value="${menu.url}"></td>

				</tr>
				<tr>
					<td>图标名称:</td>
					<td><select name="icon.id">
							<c:forEach items="${iconlist}" var="icon">
								<option value="${icon.id}">
									${icon.iconName}</option>
							</c:forEach>
					</select></td>

				</tr>

			</table>

		</form>
	</div>
	<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="save()"> 保存 </a> <a
			class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)" onclick="javascript:$('#dd').dialog('close')">

			取消 </a>
	</div>


</div>
<script>
function save(){
	$('#ff').form('submit', {  
	    url:"menu/save", 
	    dataType : 'json',  
	    onSubmit: function(params){  
	    	var isValid = $(this).form('validate');
			if (!isValid){
				$.messager.progress('close');	// hide progress bar while the form is invalid
			}
			return isValid;	// return false will stop the form submission
	    },  
	    success:function(data){ 
	    	data = $.parseJSON(data);  
	    	if(data.success){
	    		$('#dd').dialog('close');
	    		reload();
	    		freshLeftMenu();
	    		 $.dialog.tips(data.msg);
	    	}
	    }  
	});  
}


</script>
