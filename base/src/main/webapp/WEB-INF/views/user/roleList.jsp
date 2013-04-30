<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="easyui-layout" fit="true">
<div region="center" style="padding:1px;border:1px;">
<table id="rolisttable"
    class="easyui-datagrid"
    data-options="rownumbers:true, idField: 'id', url:'role/list/data'">
  <thead>
    <tr>
     <th data-options="field:'ck',checkbox:true"></th>  
      <th data-options="field:'name',width:200,align:'left'">
        角色名称
      </th>
    </tr>
  </thead>
</table>
</div>
<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="user.roleList.ok()"> 确定 </a> <a
			class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)" onclick="user.add.closeDialog();">

			取消 </a>
	</div>
</div>

<script type="text/javascript">
Namespace.register("user.roleList",{
	ok:function(){
		//get selected roles
		//transfer to comma split value
		//set to user.add.role
		console.log("1");
		var rows=$('#rolisttable').datagrid('getChecked');
		console.log(rows);
		var result="";
		var ids="";
		for(var i=0;i<rows.length;i++){
			result+=rows[i].name+",";
			ids+=rows[i].id+",";
		}
		user.add.setRoles(result,ids);
		user.add.closeDialog();
	}
});
</script>
