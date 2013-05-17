<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="addMonTypeForm" method="post">
		<c:if test="${!empty montype.id}"><input type="hidden" name="id" value="${montype.id}"></c:if>
		
			<table>
				<tr>
					<td>名称:</td>
					<td><input class="easyui-validatebox" type="text"
						name="name" value="${montype.name}" data-options="required:true"> </td>
				</tr>
				<tr>
					<td>编码:</td>
					<td><input class="easyui-validatebox" type="text"
						name="code" value="${montype.code}" data-options="required:true"> </td>
				</tr>
				<tr>
					<td>数据库表:</td>
					<td><input class="easyui-validatebox" type="text"
						name="tableName" value="${montype.tableName}" data-options="required:true"> </td>
				</tr>
			</table>

		</form>
	</div>
	<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="config.montype.add.save()"> 保存 </a> <a
			class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)" onclick="role.list.closeDialog();">

			取消 </a>
	</div>


</div>
<script>
Namespace.register('config.montype.add',{
	save:function(){
		$('#addMonTypeForm').form('submit', {  
		    url:"config/montype/save", 
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
		    		config.monType.closeDialog();
		    		config.monType.reload();
		    		 $.dialog.tips(data.msg);
		    	}
		    }  
		}); 
	}
	
	
});



</script>
