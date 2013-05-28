<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script>
var roleid='${roleid}';
Namespace.register('role.editAuth',{
	save:function(){
		var row=$("#editAuthTable").treegrid('getRoot');
    	result=[];
    	role.editAuth.parseParameters(row,result);
    	console.log(result);
    	$.ajax({
    		  type: 'POST',
    		  url: "role/auth/saveAuth",
    		  data: {roleid:roleid,
    			data:result
    		  },
    		  success: function(data){
    			  role.list.closeDialog();
    			  $.dialog.tips(data.msg);
    		  },
    		  dataType: "json"
    		});
		
	},
	parseParameters:function(row,result){
		var p={};
		p.menuid=row.id;
		var chk_value =''; 
		var name="EDITAUTH_"+row.id;
		$('input[name="'+name+'"]:checked').each(function(){    
	 	   chk_value+=$(this).val()+",";
	 	  });  
		p.auths=chk_value;
		result.push(p);
		var children=row.children;
		if(children.length>0){
			for(var i=0;i<children.length;i++){
				var child=children[i];
				role.editAuth.parseParameters(child,result);
			}
		}
		return result;
	},
	formatAction:function(value,row,index){
		if(value){
			if(value.checked){
				return "<div><input type='checkbox' name='EDITAUTH_"+row.id+"' value='"+value.id+"' checked></div>";
			}else{
				return "<div><input type='checkbox' name='EDITAUTH_"+row.id+"' value='"+value.id+"'></div>";
			}
		}
	}
	
});
  
</script>
<div class="easyui-layout" data-options="fit:true">
<div  data-options="region:'center'" style="padding: 10px 0 10px 10px">
<table id="editAuthTable" class="easyui-treegrid"
	data-options="fit:true,rownumbers:true,singleSelect:true, idField: 'id', treeField: 'name',url:'role/auth/edit?id=${roleid}'">
	<thead>

		<tr>
			<th data-options="field:'name',width:200,align:'left',rowspan:2">菜单名称</th>

			<th colspan="${fn:length(ops)}">权限</th>

		</tr>
		<tr>
			<c:forEach var="op" items="${ops}">
				<th
					data-options="field:'${op.name}',width:200,align:'left',formatter:role.editAuth.formatAction">${op.name}</th>
			</c:forEach>
		</tr>
	</thead>
</table>
</div>
<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="role.editAuth.save()"> 保存 </a> <a
			class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)" onclick="role.list.closeDialog();">

			取消 </a>
</div>
</div>
