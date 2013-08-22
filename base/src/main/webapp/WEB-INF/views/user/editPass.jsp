<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
Namespace.register('user.editpass',{
	save:function(){
		$('#user_editpassword_form').form('submit', {  
		    url:"user/editPass", 
		    dataType : 'json',  
		    onSubmit: function(params){  
		    	var isValid = $(this).form('validate');
				return isValid;	// return false will stop the form submission
		    },  
		    success:function(data){ 
		    	data = $.parseJSON(data);  
		    	if(data.success){
		    		user.editpass.closeDialog();
		    		 $.dialog.tips(data.msg);
		    	}else{
		    		//$.dialog.tips(data.msg);
		    		alert(data.msg+":"+data.obj);
		    	}
		    }  
		}); 
	},
	
	closeDialog:function(){
		 $('#editPassDialog').dialog('close');
	},
	
});

</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="user_editpassword_form" method="post">
			<table>
				<tr>
					<td>旧密码:</td>
					<td>
					<input id="edit_old_passwd" class="easyui-validatebox" type="password"
						name="oldpassword"  data-options="required:true">
					
					</td>
				</tr>
				<tr>
					<td>新密码:</td>
					<td><input id="edit_txtpasswd" class="easyui-validatebox" type="password"
						name="password"  data-options="required:true"> </td>
				</tr>
				<tr>
					<td>重复新密码:</td>
					<td><input class="easyui-validatebox" type="password"
						name="repassword"  data-options="required:true,validType:'equalTo[edit_txtpasswd]'"></td>
				</tr>
					
			</table>

		</form>
	</div>
	<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="user.editpass.save()"> 保存 </a> <a
			class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)" onclick="user.editpass.closeDialog();">

			取消 </a>
	</div>


</div>
