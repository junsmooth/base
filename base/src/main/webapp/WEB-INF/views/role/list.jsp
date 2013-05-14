<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="easyui-layout" data-options="fit:true">
<div data-options="region:'center'" style="padding:1px;border:1px;">
<table id="role_tablegrid"
    class="easyui-datagrid"
    data-options="rownumbers:true,singleSelect:true, idField: 'id', url:'role/list/data',toolbar:role.list.toolbar">
  <thead>
    <tr>
      <th data-options="field:'name',width:200,align:'left'">
        角色名称
      </th>
 <th data-options="field:'roledesc',width:200,align:'left'">
        角色描述
      </th>
       <th data-options="field:'id',width:200,align:'left',formatter:role.list.formatOperation">
        操作
      </th>
    </tr>
  </thead>
</table>
<div id="roleDialog"></div>
</div>
</div>

<script type="text/javascript">
Namespace.register("role.list",{
	formatOperation:function(value){
		 if(value){
		        var setAuth='['+'<a href="#" onclick="role.list.setAuth('+value+')">设置权限</a>' +']';
    			var del='['+ '<a href="#" onclick="role.list.remove('+value+' )">删除</a>'+']';
   				 var edit='['+'<a href="#" onclick="role.list.edit('+value+')">编辑</a>' +']';
   				return edit+setAuth+del;
		        }
	},
	setAuth:function(id){
   		$('#roleDialog').dialog({
        title: '设置权限',
        width: 800,
        height: 400,
        closed: false,
        resizable:true,
        cache: false,
        href: 'role/editAuth?id='+id,
        modal: true
        });
	},
	remove:function(value){
		 $.messager.confirm('提示', '确定要删除吗?', function(r){  
             if (r){  
              $.post('menu/remove',{id:value},function(data){
	    			if(data.success){
	    				role.list.reload();
	    				$.dialog.tips(data.msg);
	    	}
 	 });
             }  else{
             return;
             }
         });  
	},
	edit:function(value){
		   $('#roleDialog').dialog({
		        title: '修改角色',
		        width: 600,
		        height: 300,
		        closed: false,
		        resizable:true,
		        cache: false,
		        href: 'menu/addOrUpdate?id='+value,
		        modal: true
		        });
		  },
	reload:function(){
		  	$("#role_tablegrid").datagrid('reload');
		  },
	closeDialog:function(){
		$('#roleDialog').dialog('close');
	}
	
});
role.list.toolbar = [{
    text:'增加',
    iconCls:'icon-add',
    disabled:hasRole('ROLE_ROLE_EDIT'),
    handler:function(){
           $('#roleDialog').dialog({
        title: '增加角色',
        width: 600,
        height: 300,
        closed: false,
        resizable:true,
        cache: false,
        href: 'role/addOrUpdate',
        modal: true
        });
      }
    },'-',{
    text:'刷新',
    iconCls:'icon-reload',
 	handler:function(){
	  role.list.reload();
  }
  }];
 
</script>
