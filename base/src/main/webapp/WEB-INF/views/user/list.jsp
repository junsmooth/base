<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
 Namespace.register("user.list",{
	formatOperation:function(value){
		 if(value){
		        var edit='['+'<a href="#" onclick="user.list.edit('+value+')">编辑</a>' +']';
		        var del='['+ '<a href="#" onclick="user.list.remove('+value+' )">删除</a>'+']';
		        var setRole='['+ '<a href="#" onclick="user.list.setRole('+value+' )">分配角色</a>'+']';
		        return edit+setRole+del;
		        }
	},
	setRole:function(value){
	$('#userdialog').dialog({
		        title: '分配角色',
		        width: 600,
		        height: 300,
		        closed: false,
		        resizable:true,
		        cache: false,
		        href: 'menu/addOrUpdate?id='+value,
		        modal: true
		        });
	},
	remove:function(value){
		 $.messager.confirm('提示', '确定要删除吗?', function(r){  
             if (r){  
              $.post('menu/remove',{id:value},function(data){
	    			if(data.success){
	    				user.list.reload();
	    				$.dialog.tips(data.msg);
	    	}
 	 });
             }  else{
             return;
             }
         });  
	},
	edit:function(value){
		   $('#userdialog').dialog({
		        title: '修改菜单',
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
		  	$('#usergrid').datagrid('reload');
		  }
	
});
user.list.toolbar = [{
    text:'增加',
    iconCls:'icon-add',
    handler:function(){
      $('#menudialog').dialog({
        title: '增加菜单',
        width: 600,
        height: 300,
        closed: false,
        resizable:true,
        cache: false,
        href: 'menu/addOrUpdate',
        modal: true
        });
      }
    }
  //  ,'-',{
   // text:'刷新',
   // iconCls:'icon-reload',
 	//handler:function(){
	//  user.list.reload();
 // }
 // }
  
  ];
 
</script>
<div class="easyui-layout" fit="true">
 <div region="center" style="padding:1px;border:1px;">
<table id="usergrid"
    class="easyui-datagrid" 
    data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'user/list/data',toolbar:user.list.toolbar,pagination:'true',fitColumns:'true',fit:'true'">
  <thead>
    <tr>
      <th data-options="field:'username',width:200,align:'left'">
        用户名
      </th>
      <th data-options="field:'realname',width:80,align:'left'">
        真实姓名
      </th>
      <th data-options="field:'telephone',width:280,align:'left'">
        联系电话
      </th>
	 <th
				data-options="field:'id',width:200,align:'left',formatter:user.list.formatOperation">
				操作</th>
    </tr>
  </thead>
</table>
</div>
<div id="userdialog">
</div>

