<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="roleform" method="post">
		<c:if test="${!empty role.id}"><input type="hidden" name="id" value="${role.id}"></input></c:if>
		
			<table>
				<tr>
					<td>角色名称:</td>
					<td><input class="easyui-validatebox" type="text"
						name="name" value="${role.name}" data-options="required:true"> </input></td>
				</tr>
				<tr>
					<td>角色描述:</td>
					<td><input class="easyui-validatebox" type="text"
						name="roledesc" value="${role.roledesc}" data-options="required:true"> </input></td>
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
	$('#roleform').form('submit', {  
	    url:"role/save", 
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
	    		 $.dialog.tips(data.msg);
	    	}
	    }  
	});  
}


</script>
