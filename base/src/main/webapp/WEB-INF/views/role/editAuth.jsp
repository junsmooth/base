<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script>
var editingId;
var roleid='${roleid}';
var editAuthToolBar=
 [{
		    text:'Save',
		    iconCls:'icon-save',
		    handler:function(){
		    	//1.get all rows of treegrid
		    	//2.iterate rows, and for every rowid, get OP_{rowid} checked Authids
		    	//3.save to server with rowid,roleid,checkedauthids,altogether
		    	var row=$("#editAuthTable").treegrid('getRoot');
		    	result=[];
		    	parseParameters(row,result);
		    	
		    	console.log(result);
		    	$.ajax({
		    		  type: 'POST',
		    		  url: "role/auth/saveAuth",
		    		  data: {roleid:roleid,
		    			data:result
		    		  },
		    		  success: function(){
		    			  console.log("success.");
		    		  },
		    		  dataType: "json"
		    		});
		      }
		    }]
		    
function parseParameters(row,result){
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
			parseParameters(child,result);
		}
	}
	return result;
}
function save(){
	
	if (editingId != undefined){
		var t = $('#editAuthTable');
		t.treegrid('endEdit', editingId);
		editingId = undefined;
	}
}		    
function formatAction(value,row,index){
	if(value){
		if(value.checked){
			return "<div><input type='checkbox' name='EDITAUTH_"+row.id+"' value='"+value.id+"' checked></div>";
		}else{
			return "<div><input type='checkbox' name='EDITAUTH_"+row.id+"' value='"+value.id+"'></div>";
		}
	}
	
}
function checkboxclicked(){
	var row=$("#editAuthTable").treegrid('getSelected');
	
	
}
function onClickRow(index){
	if (editingId != undefined){
		$('#editAuthTable').treegrid('select', editingId);
		return;
	}
	var row = $('#editAuthTable').treegrid('getSelected');
	if (row){
		editingId = row.id
		$('#editAuthTable').treegrid('beginEdit', editingId);
	}
}
  
</script>
<table id="editAuthTable" class="easyui-treegrid"
	data-options="rownumbers:true,singleSelect:true, idField: 'id', treeField: 'name',url:'role/auth/edit?id=${roleid}',toolbar:editAuthToolBar">
	<thead>

		<tr>
			<th data-options="field:'name',width:200,align:'left',rowspan:2">菜单名称</th>

			<th colspan="${fn:length(ops)}">权限</th>

		</tr>
		<tr>
			<c:forEach var="op" items="${ops}">
				<th
					data-options="field:'${op.name}',width:200,align:'left',formatter:formatAction">${op.name}</th>
			</c:forEach>
		</tr>
	</thead>
</table>







