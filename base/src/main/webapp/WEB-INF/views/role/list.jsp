<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table id="tt"
    class="easyui-datagrid"
    data-options="rownumbers:true,singleSelect:true, idField: 'id', url:'role/list/data',toolbar:roleListToolBar">
  <thead>
    <tr>
      <th data-options="field:'name',width:200,align:'left'">
        角色名称
      </th>
 <th data-options="field:'roledesc',width:200,align:'left'">
        角色描述
      </th>
       <th data-options="field:'id',width:200,align:'left',formatter:formatOperation">
        操作
      </th>
    </tr>
  </thead>
</table>
<div id="roleDialog">
</div>
<script>
  function formatOperation(value){
    if(value){
    var setAuth='['+'<a href="#" onclick="setAuth('+value+')">设置权限</a>' +']';
    var del='['+ '<a href="#" onclick="remove('+value+' )">删除</a>'+']';
    return setAuth+del;
    }
  }
  function remove(id){
  
  }
  function setAuth(id){
   $('#roleDialog').dialog({
        title: '设置权限',
        width: 800,
        height: 200,
        closed: false,
        resizable:true,
        cache: false,
        href: 'role/editAuth?id='+id,
        modal: true
        });
  }
</script>
<script type="text/javascript">

  var roleListToolBar = [{
    text:'Add',
    iconCls:'icon-add',
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
      text:'Edit',
      iconCls:'icon-edit',
    handler:function(){
    	var node=$('#tt').treegrid('getSelected');
    	if(!node){
    	 $.dialog.tips('请选择条目');
    	}else{
    	 $('#dd').dialog({
        title: '增加菜单',
        width: 600,
        height: 300,
        closed: false,
        resizable:true,
        cache: false,
        href: 'menu/addOrUpdate?id='+node.id,
        modal: true
        });
    	};
    
    }
  },'-',{
    text:'Delete',
    iconCls:'icon-remove',
  handler:function(){
  	var node=$('#tt').treegrid('getSelected');
    	if(!node){
    	 $.dialog.tips('请选择条目');
    	}else{
    	 $.post('menu/remove',{id:node.id},function(data){
    	 	//data = $.parseJSON(data);  
	    	if(data.success){
	    		//$('#dd').dialog('close');
	    		reload();
	    		freshLeftMenu();
	    		 $.dialog.tips(data.msg);
	    	}
    	 });
    	};
  }
  },'-',{
    text:'Refresh',
    iconCls:'icon-reload',
  handler:function(){
  	reload();
  }
  }];
</script>
