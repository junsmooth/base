<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
Namespace.register('user.add',{
	save:function(){
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
		    		role.list.closeDialog();
		    		role.list.reload();
		    		 $.dialog.tips(data.msg);
		    	}
		    }  
		}); 
	}
});

</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="userform" method="post">
		<c:if test="${!empty user.id}"><input type="hidden" name="id" value="${user.id}"></input></c:if>
		
			<table>
				<tr>
					<td>用户名:</td>
					<td><input class="easyui-validatebox" type="text"
						name="name" value="${user.name}" data-options="required:true"> </input></td>
				</tr>
				<tr>
					<td>真实姓名:</td>
					<td><input class="easyui-validatebox" type="text"
						name="roledesc" value="${user.realname}" data-options="required:true"> </input></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input class="easyui-validatebox" type="text"
						name="roledesc" value="${user.password}" data-options="required:true"> </input></td>
				</tr>
				<tr>
					<td>重复密码:</td>
					<td><input class="easyui-validatebox" type="text"
						name="roledesc" value="${user.realname}" data-options="required:true"> </input></td>
				</tr>
					<tr>
					<td>地址:</td>
					<td><input class="easyui-validatebox" type="text"
						name="roledesc" value="${user.realname}" > </input></td>
				</tr>
					<tr>
					<td>电话:</td>
					<td><input class="easyui-validatebox" type="text"
						name="roledesc" value="${user.realname}" > </input></td>
				</tr>
					<tr>
					<td>电子邮件:</td>
					<td><input class="easyui-validatebox" type="text"
						name="roledesc" value="${user.realname}" > </input></td>
				</tr>
					<tr>
					<td>角色:</td>
					<td>  <input class="easyui-validatebox" type="text" readonly="readonly"
						name="roledesc" value="${user.realname}" data-options="required:true"> </input>
     				 </td>
     				 <td><a href="#" class="easyui-linkbutton l-btn l-btn-plain" plain="true"  onclick="choose()" id="">
     				 <span class="l-btn-text icon-choose l-btn-icon-left">选择</span></a></td>
					
					
					<td><a href="#" class="easyui-linkbutton l-btn l-btn-plain" plain="true"  onclick="clearAll();" id="">
					<span class="l-btn-text icon-redo l-btn-icon-left">清空</span></a></td>
				</tr>
			</table>

		</form>
	</div>
	<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="save()"> 保存 </a> <a
			class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)" onclick="role.list.closeDialog();">

			取消 </a>
	</div>


</div>

