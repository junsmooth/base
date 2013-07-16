<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="alarmtype_form" method="post">
			<c:if test="${!empty type.id}">
				<input type="hidden" name="id" value="${type.id}"></input>
			</c:if>
			<table>
				<tr>
					<td>名称:</td>
					<td><input id="new_type_name" class="easyui-validatebox"
						type="text" name="name" value="${type.name}"
						data-options="required:true,validType:'rmtValid[\'alarm/alarmtype/validateTypeName\',\'typeName\',\'${type.id}\']'">
					</td>
				</tr>
				<tr>
					<td>严重级别:</td>
					<td><input id="new_type_severity" class="easyui-validatebox"
						type="text" name="severity" value="${type.severity}"
						data-options="required:true,validType:['number']">
					</td>
				</tr>
				<tr>
					<td>颜色:</td>
					<td><input id="new_type_color" class="easyui-combobox"
						type="text" name="color.id" value="${type.color.id}"
						data-options="required:true,valueField:'id',textField:'name',url:'alarm/alarmcolor/data'">
					</td>
				</tr>

			</table>

		</form>
	</div>
	<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="alarm.type.add.save(${type.id})">
			保存 </a> <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)" onclick="alarm.alarmtype.closeDialog();"> 取消
		</a>
	</div>


</div>
<script>

Namespace.register("alarm.type.add",{
	
	formatColor:function(){
	},
	formatIconType:function(value,row,index){
			return value.cnname;
	},
	save:function(id){
		$('#alarmtype_form').form('submit', {  
		    url:"alarm/alarmtype", 
		    dataType : 'json',  
		    onSubmit: function(params){  
		    	var isValid = $(this).form('validate');
				return isValid;	// return false will stop the form submission
		    },  
		    success:function(data){ 
		    	data = $.parseJSON(data);  
		    	if(data.success){
		    		alarm.alarmtype.closeDialog();
		    		alarm.alarmtype.reload();
		    		 $.dialog.tips(data.msg);
		    	}else{
		    		alarm.alarmtype.closeDialog();
		    		alarm.alarmtype.reload();
		    		$.dialog.tips(data.msg + ":"
							+ data.obj, 3,
							'error.gif');
		    	}
		    }  
		});  
	}
});

</script>
