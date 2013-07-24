<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="menuForm" method="post">
			<c:if test="${!empty menu.id}">
				<input type="hidden" name="id" value="${menu.id}"></input>
			</c:if>

			<table>
				<tr>
					<td>菜单名称:</td>
					<td><input id="menu_menuName" class="easyui-validatebox" type="text"
						name="menuName" value="${menu.menuName}" data-options="required:true,validType:'rmtValid[\'menu/validateMenuName\',\'menu_menuName\',\'${menu.id}\']'">
						</td>
				</tr>
				<tr>
					<td>模块名称:</td>
					<td><input id="menu_modulename" class="easyui-validatebox"
						type="text" name="moduleName" value="${menu.moduleName}"
						data-options="required:true,validType:'rmtValid[\'menu/validateModuleName\',\'menu_modulename\',\'${menu.id}\']'"> </td>
				</tr>
				<tr>
					<td>父菜单:</td>
					<td><select name="parentMenu.id">
							<option value="1"></option>
							<c:forEach items="${menulist}" var="pMenu">
								<option value="${pMenu.id}"
									<c:if test="${menu.parentid==pMenu.id }">selected="selected"</c:if>>
									${pMenu.menuName}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>URL地址:</td>
					<td><input id="menulink" name="url" class="easyui-validatebox"
						type="text" value="${menu.url}" data-options=""></td>

				</tr>
				<tr>
					<td>图标:</td>
					<td><input id="add_menu_icon" class="easyui-combobox" name="icon.id"  value="${menu.icon.id}"
    data-options="required:true,valueField:'id',textField:'iconName',url:'icon/menuicon',formatter:menu.add.formatIcon" />   </td>
				</tr>
				

			</table>

		</form>
	</div>
	<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="menu.add.saveMenu()"> 保存 </a> <a
			class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)"
			onclick="menu.list.closeDialog();"> 取消 </a>
	</div>


</div>
<script>

$("#menumodulename").keypress(function(event) {
	var key = event.which;
	if (key >= 97 && key <= 122) {
		event.preventDefault();
		$(this).val($(this).val() + String.fromCharCode(key - 32));//transfom to uppercase
	}
});

Namespace.register("menu.add",{
	formatIcon:function(row){
		var iconName=row.iconName;
		var iconPath=row.iconPath;
		var wholeName=iconName+row.iconExtension;
		var nameStr="<span><I><B>"+iconName+"</B></I></span>";
		var picStr="<span><img width=16px height=16px src='"+iconPath+"'>"+"</img></span>";
		return nameStr+":"+picStr;
	},
	saveMenu:function(){
		$('#menuForm').form('submit', {  
		    url:"menu/save", 
		    dataType : 'json',  
		    onSubmit: function(params){  
		    	var isValid = $(this).form('validate');
				return isValid;	// return false will stop the form submission
		    },  
		    success:function(data){ 
		    	data = $.parseJSON(data);  
		    	if(data.success){
		    		menu.list.closeDialog();
		    		menu.list.reload();
		    		//freshLeftMenu();
		    		 $.dialog.tips(data.msg);
		    	}else{
		    		
		    	}
		    }  
		});  
		
		
	}
	
	
});

</script>
