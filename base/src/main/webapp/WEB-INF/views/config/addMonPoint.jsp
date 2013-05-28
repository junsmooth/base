<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="addMonPointForm" method="post">
		<c:if test="${!empty monpoint.id}"><input type="hidden" name="id" value="${monpoint.id}"></c:if>
		
			<table>
				<tr>
					<td>名称:</td>
					<td><input id="monName" class="easyui-validatebox" type="text"
						name="monitoringName" value="${monpoint.monitoringName}" data-options="required:true,validType:'remote[\'config/monpoint/validateMonPointName\',\'monName\']'"> </td>
				</tr>
				<tr>
					<td>监测类型:</td>
					<td><select name="type.id">
							
							<c:forEach items="${montypelist}" var="monType">
								<option value="${monType.id}"
									<c:if test="${monpoint.type==monType.id }">selected="selected"</c:if>>
									${monType.name}</option>
							</c:forEach>
					</select></td>
					
				</tr>
				<tr>
					<td>通道号:</td>
					<td><input class="easyui-validatebox" type="text"
						name="position" value="${monpoint.position}" data-options="required:true,validType:'number'" > </td>
				</tr>
			</table>

		</form>
	</div>
	<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="config.monpoint.add.save()"> 保存 </a> <a
			class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)" onclick="config.monpoint.closeDialog();">

			取消 </a>
	</div>


</div>
<script>
Namespace.register('config.monpoint.add',{
	save:function(){
		$('#addMonPointForm').form('submit', {  
		    url:"config/monpoint/save", 
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
		    		config.monpoint.closeDialog();
		    		config.monpoint.reload();
		    		 $.dialog.tips(data.msg);
		    	}
		    }  
		}); 
	}
	
	
});



</script>
