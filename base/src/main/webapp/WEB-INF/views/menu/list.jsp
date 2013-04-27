<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
Namespace.register("menu.list",{
	formatOperation:function(value){
		 if(value){
		        var edit='['+'<a href="#" onclick="menu.list.edit('+value+')">编辑</a>' +']';
		        var del='['+ '<a href="#" onclick="menu.list.remove('+value+' )">删除</a>'+']';
		        return edit+del;
		        }
	},
	formatIcon:function(value){
		 if(value)
			    return '<image border="0" src='+value.iconPath+'/'+value.iconName+value.iconExtension+'/>'
	},
	
	remove:function(value){
		 $.messager.confirm('提示', '确定要删除吗?', function(r){  
             if (r){  
              $.post('menu/remove',{id:value},function(data){
	    			if(data.success){
	    				console.log(menu.list);
	    				return;
	    				menu.list.reload();
	    				freshLeftMenu();
	    				$.dialog.tips(data.msg);
	    	}
 	 });
             }  else{
             return;
             }
         });  
	},
	edit:function(value){
		   $('#menudialog').dialog({
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
		$('#menutable').treegrid('reload');
	},
	closeDialog:function(){
		$('#menudialog').dialog('close');
	}
	
});
menu.list.toolbar = [{
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
    },'-',{
    text:'刷新',
    iconCls:'icon-reload',
  handler:function(){
	  menu.list.reload();
  }
  }];


</script>
<table id="menutable" class="easyui-treegrid"
	data-options="rownumbers:true,singleSelect:true, idField: 'id', treeField: 'name',url:'menu/list/data',toolbar:menu.list.toolbar">
	<thead>
		<tr>
			<th data-options="field:'name',width:200,align:'left'">菜单名称</th>
			<th
				data-options="field:'icon',width:80,align:'left',formatter:menu.list.formatIcon">
				图标</th>
			<th data-options="field:'url',width:280,align:'left'">菜单地址</th>
			<th
				data-options="field:'id',width:200,align:'left',formatter:menu.list.formatOperation">
				操作</th>
		</tr>
	</thead>
</table>
<div id="menudialog"></div>
