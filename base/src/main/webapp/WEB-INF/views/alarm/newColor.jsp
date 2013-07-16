<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript"
	src="resources/jquery.colorpicker.js"></script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="newColor_Form" method="post">
			<c:if test="${!empty color.id}">
				<input type="hidden" name="id" value="${color.id}"></input>
			</c:if>
			<table>
				<tr>
					<td>颜色:</td>
					<td><input id="new_color_name" class="easyui-validatebox"
						type="text" name="name" value="${color.name}"
						data-options="required:true,validType:'rmtValid[\'alarm/alarmcolor/validateColorName\',\'colorName\',\'${color.id}\']'">
					</td>
				</tr>
				<tr>
					<td>颜色编码:</td>
					<td><input id="new_color_code" name="code" value="${color.code}"
						data-options="required:true,formatter:alarm.color.add.formatColor" /></td>
					<td>
					<div id="colorpanel" style=" display: none;"></div>
					</td>
				</tr>

			</table>

		</form>
	</div>
	<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="alarm.color.add.save(${color.id})">
			保存 </a> <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)" onclick="alarm.alarmcolor.closeDialog();"> 取消
		</a>
	</div>


</div>
<script>

$("#new_color_code").colorpicker({
    fillcolor:true,
    success:function(o,color){
        $(o).css("color",color);
    }
});
Namespace.register("alarm.color.add",{
	
	formatColor:function(){
	},
	formatIconType:function(value,row,index){
			return value.cnname;
	},
	save:function(id){
		$('#newColor_Form').form('submit', {  
		    url:"alarm/alarmcolor", 
		    dataType : 'json',  
		    onSubmit: function(params){  
		    	var isValid = $(this).form('validate');
				return isValid;	// return false will stop the form submission
		    },  
		    success:function(data){ 
		    	data = $.parseJSON(data);  
		    	if(data.success){
		    		alarm.alarmcolor.closeDialog();
		    		alarm.alarmcolor.reload();
		    		 $.dialog.tips(data.msg);
		    	}else{
		    		alarm.alarmcolor.closeDialog();
		    		alarm.alarmcolor.reload();
		    		$.dialog.tips(data.msg + ":"
							+ data.obj, 3,
							'error.gif');
		    	}
		    }  
		});  
	}
});

</script>
