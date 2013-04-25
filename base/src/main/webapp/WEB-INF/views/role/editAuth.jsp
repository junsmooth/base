<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script>
var editingId;
var editAuthToolBar=
 [{
		    text:'Save',
		    iconCls:'icon-save',
		    handler:function(){
		    	//1.get all rows of treegrid
		    	//2.iterate rows, and for every rowid, get OP_{rowid} checked Authids
		    	//3.save to server with rowid,roleid,checkedauthids,altogether
		    	
		    	var chk_value =[];    
		    	  $('input[name="OP_1"]:checked').each(function(){    
		    	   chk_value.push($(this).val());    
		    	  });    
		    	console.log(chk_value);
				save();
				var rows=$("#editAuthTable").treegrid('getRoot');
				console.log(rows);
				//save auth to server
				//roleid,menuid,op{id1 id2...}
		      }
		    }]
function save(){
	
	if (editingId != undefined){
		var t = $('#editAuthTable');
		t.treegrid('endEdit', editingId);
		editingId = undefined;
	}
}		    
function formatAction(value,row,index){
	//if(value){
	//	return "Y";
	//}
	if(value)
	return "<div><input type='checkbox' name='OP_"+row.id+"' value='"+value.id+"' checked></div>";
	if(value){
		if(value=='Y'){
			return "<div><input type='checkbox' onclick='checkboxclicked()' name='auth' value='"+value+"' checked></div>"
		}else{
			return "<input type='checkbox' onclick='checkboxclicked()' name='auth' value='"+value+"'>"
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
					data-options="field:'${op.name}',width:200,align:'left',formatter:formatAction,editor:{type:'checkbox',options:{on:'Y',off:''}}">${op.name}</th>
			</c:forEach>
		</tr>
	</thead>
</table>







