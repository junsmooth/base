<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="iconForm" method="post">
			<c:if test="${!empty icon.id}">
				<input type="hidden" name="id" value="${icon.id}"></input>
			</c:if>
			<table>
				<tr>
					<td>图标名称:</td>
					<td><input id="icon_new_name" class="easyui-validatebox"
						type="text" name="iconName" value="${icon.iconName}"
						data-options="required:true,validType:'rmtValid[\'icon/validateIconName\',\'iconName\',\'${icon.id}\']'">
					</td>
				</tr>
				<tr>
					<td>图标类型:</td>
					<td><input id="icon_new_type" class="easyui-combobox"
						name="type.id"
						data-options="required:true,valueField:'id',textField:'cnname',url:'icon/types',formatter:icon.new.formatIconType" />
					</td>
				</tr>
				<tr>
					<td>图标:</td>
					<td><input id="icon_new_iconpath" type="hidden"
						name="iconPath" value="" /><span><img id="icon_new_iconid"
							src="" width=16px height=16px /></span></td>
					<td><input name="file_upload" id="icon_uploader" /></td>

				</tr>

			</table>

		</form>
	</div>
	<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="icon.new.save(${icon.id})"> 保存
		</a> <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)" onclick="icon.new.closeDialog();"> 取消 </a>
	</div>


</div>
<script>

$("#icon_uploader").uploadify({
	queueSizeLimit : 1,
    swf     : 'resources/uploadify.swf',
    uploader : 'icon/upload',
    folder   : 'resources/img', 
    fileTypeExts: '*.gif; *.jpg; *.png',
    cancelImg   : 'resources/images/uploadify-cancel.png',
    buttonText     : '浏览..' ,
    onUploadSuccess : function(file, data, response) {
    	$("#icon_new_iconid").attr('src','resources/custom/images/'+data);
    	$("#icon_new_iconpath").attr('value','resources/custom/images/'+data);
    }
});


Namespace.register("icon.new",{
	formatIconType:function(value,row,index){
			return value.cnname;
	},
	save:function(id){
		$('#iconForm').form('submit', {  
		    url:"icon", 
		    dataType : 'json',  
		    onSubmit: function(params){  
		    	var isValid = $(this).form('validate');
				return isValid;	// return false will stop the form submission
		    },  
		    success:function(data){ 
		    	data = $.parseJSON(data);  
		    	if(data.success){
		    		icon.list.closeDialog();
		    		icon.list.reload();
		    		 $.dialog.tips(data.msg);
		    	}else{
		    		
		    	}
		    }  
		});  
	}
});

</script>
