<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="new_threshold_form" method="post">
			<c:if test="${!empty threshold.id}">
				<input type="hidden" name="id" value="${threshold.id}"></input>
			</c:if>
			<table>
				<tr>
					<td>监测点:</td>
					<td><input id="new_threshold_point_name"
						class="easyui-combobox" type="text" name="point.id"
						value="${threshold.point.id}"
						data-options="required:true, valueField: 'id',  
        textField: 'monitoringName',url:'alarm/threshold/monpoints',
        onSelect: function(rec){  
            var url = 'alarm/threshold/monpoints/'+rec.id+'/attr';  
            $('#new_threshold_attr_name').combobox('reload', url);  
        }
        ">
					</td>
				</tr>
				<tr>
					<td>监测指标:</td>
					<td><input id="new_threshold_attr_name"
						class="easyui-combobox" type="text" name="attr.id" editable='false'
						value="${threshold.attr.id}"
						data-options="valueField:'id',textField:'name',required:true"></td>
				</tr>
				<tr>
					<td>操作符:</td>
					<td><input id="new_type_color" class="easyui-combobox"
						type="text" name="op.id" value="${threshold.op.id}"
						data-options="required:true,valueField:'id',textField:'displayName',url:'alarm/threshold/ops'">
					</td>
				</tr>
				<tr>
					<td>监测值:</td>
					<td><input id="new_threshold_value" class="easyui-validatebox"
						type="text" name="value" value="${threshold.value}"
						data-options="required:true,validType:['float']"></td>
				</tr>
				<tr>
					<td>报警级别:</td>
					<td><input id="new_type_color" class="easyui-combobox"
						type="text" name="alarmType.id" value="${threshold.alarmType.id}"
						data-options="required:true,valueField:'id',textField:'name',url:'alarm/alarmtype/data',
						formatter:function(value,row,index){
							if(value){
								return value.name+':'+value['color']['name'];
							}
						}
						
						">
					</td>
				</tr>
			</table>

		</form>
	</div>
	<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="alarm.threshold.add.save(${type.id})">
			保存 </a> <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)" onclick="alarm.threshold.closeDialog();">
			取消 </a>
	</div>


</div>
<script>

Namespace.register("alarm.threshold.add",{
	
	formatColor:function(){
	},
	formatIconType:function(value,row,index){
			return value.cnname;
	},
	save:function(id){
		$('#new_threshold_form').form('submit', {  
		    url:"alarm/threshold", 
		    dataType : 'json',  
		    onSubmit: function(params){  
		    	var isValid = $(this).form('validate');
				return isValid;	// return false will stop the form submission
		    },  
		    success:function(data){ 
		    	data = $.parseJSON(data);  
		    	if(data.success){
		    		alarm.threshold.closeDialog();
		    		alarm.threshold.reload();
		    		 $.dialog.tips(data.msg);
		    	}else{
		    		alarm.threshold.closeDialog();
		    		alarm.threshold.reload();
		    		$.dialog.tips(data.msg + ":"
							+ data.obj, 3,
							'error.gif');
		    	}
		    }  
		});  
	}
});

</script>
