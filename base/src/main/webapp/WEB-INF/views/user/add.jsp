<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
Namespace.register('user.add',{
	save:function(){
		$('#user_addorupdate_form').form('submit', {  
		    url:"user/save", 
		    dataType : 'json',  
		    onSubmit: function(params){  
		    	var isValid = $(this).form('validate');
				return isValid;	// return false will stop the form submission
		    },  
		    success:function(data){ 
		    	data = $.parseJSON(data);  
		    	if(data.success){
		    		user.list.closeDialog();
		    		user.list.reload();
		    		 $.dialog.tips(data.msg);
		    	}else{
		    		//$.dialog.tips(data.msg);
		    		alert(data.msg+":"+data.obj);
		    	}
		    }  
		}); 
	},
	chooseRoles:function(){
		
		 $('#choose_role_dialog').dialog({
		        title: '角色列表',
		        width: 300,
		        height: 336,
		        closed: false,
		        resizable:true,
		        cache: false,
		        href: 'user/rolelist',
		        modal: true
		        });
	},
	closeDialog:function(){
		 $('#choose_role_dialog').dialog('close');
	},
	setRoles:function(value,ids){
		$("#user_add_roles").attr("value",value);
		$("#user_add_roleids").attr("value",ids);
	},
	clearRoles:function(){
		$("#user_add_roles").attr("value","");
		$("#user_add_roleids").attr("value","");
	},
	formatAlarm:function(row){
		//return value;
		var name=row.name;
		var color=row['color']['code'];
		var html="<div style='background-color:"+color+"'>"+name+"</div>";
		return html;
	}
});

</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="user_addorupdate_form" method="post">
		<c:if test="${!empty user.id}"><input type="hidden" name="id" value="${user.id}"></input></c:if>
		
			<table>
				<tr>
					<td>用户名:</td>
					<td>
					
					<c:choose>
						<c:when test="${empty user.id}">
						<input class="easyui-validatebox" type="text" 
						name="username" value="${user.username}" data-options="required:true,validType:'remote[\'user/validateUserName\',\'username\']'"> 
						</c:when>
						<c:otherwise>
							${user.username }
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<td>真实姓名:</td>
					<td><input class="easyui-validatebox" type="text"
						name="realname" value="${user.realname}" data-options="required:true"> </td>
				</tr>
				<c:if test="${empty user.id}">
				<tr>
					<td>密码:</td>
					<td><input id="txtpasswd" class="easyui-validatebox" type="password"
						name="password"  data-options="required:true"> </td>
				</tr>
				<tr>
					<td>重复密码:</td>
					<td><input class="easyui-validatebox" type="password"
						name="repassword"  data-options="required:true,validType:'equalTo[txtpasswd]'"></td>
				</tr>
				</c:if>
					<tr>
					<td>地址:</td>
					<td><input class="easyui-validatebox" type="text"
						name="address" value="${user.address}" > </td>
				</tr>
					<tr>
					<td>电话:</td>
					<td><input class="easyui-validatebox" type="text"
						name="telephone" value="${user.telephone}" > </td>
				</tr>
					<tr>
					<td>电子邮件:</td>
					<td><input class="easyui-validatebox" type="text"
						name="email" value="${user.email}" > </td>
				</tr>
					<tr>
					<td>角色:</td>
					<td>  
					<input  name="roleids" type="hidden" value="${user.roleids}"  id="user_add_roleids">
					<input id="user_add_roles" class="easyui-validatebox" type="text" readonly="readonly"
						name="rolenames" value="${user.rolenames}" data-options="required:true"> 
     				 </td>
     				 <td><a href="#" class="easyui-linkbutton l-btn l-btn-plain" data-options="plain:true"  onclick="user.add.chooseRoles()" id="">
     				 <span class="l-btn-text icon-choose l-btn-icon-left">选择</span></a></td>
					
					
					<td><a href="#" class="easyui-linkbutton l-btn l-btn-plain" data-options="plain:true"  onclick="user.add.clearRoles();" id="">
					<span class="l-btn-text icon-redo l-btn-icon-left">清空</span></a></td>
				</tr>
				<tr>
					<td>报警级别:</td>
					<td><input id="user_add_alarmType" class="easyui-combobox" name="alarmType.id"  value="${user.alarmType.id}"
    data-options="required:true,valueField:'id',textField:'name',url:'alarm/alarmtype/data',formatter:user.add.formatAlarm" />   </td>
				</tr>
			</table>

		</form>
	</div>
	<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="user.add.save()"> 保存 </a> <a
			class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)" onclick="user.list.closeDialog();">

			取消 </a>
	</div>


</div>
<div id="choose_role_dialog"></div>
