<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
Namespace.register("icon.list",{
	formatOperation:function(value,row,index){
		 if(value){
		        var edit='['+'<a href="#" onclick="icon.list.edit('+value+')">编辑</a>' +']';
		        var del='['+ '<a href="#" onclick="icon.list.remove('+value+' )">删除</a>'+']';
		        return edit+del;
		        }
	},
	formatIcon:function(value,row,index){
		 if(value)
			    return '<image border="0" src='+row["iconPath"]+'/'+row["iconName"]+row["iconExtension"]+'/>'
	},
	
	remove:function(value){
		 $.messager.confirm('提示', '确定要删除吗?', function(r){  
             if (r){  
              $.post('menu/remove',{id:value},function(data){
	    			if(data.success){
	    				console.log(icon.list);
	    				return;
	    				icon.list.reload();
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
		   $('#iconDialog').dialog({
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
		$('#icon_table').treegrid('reload');
	},
	closeDialog:function(){
		$('#iconDialog').dialog('close');
	}
	
});
icon.list.toolbar = [{
    text:'增加',
    iconCls:'icon-add',
    disabled:!hasRole('ROLE_MENU_EDIT'),
    handler:function(){
      $('#iconDialog').dialog({
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
	  icon.list.reload();
  }
  }];


</script>
<table id="icon_table" class="easyui-datagrid"
	data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'icon/list/data',toolbar:icon.list.toolbar,pagination:'true',fitColumns:true,fit:true">
	<thead>
		<tr>
			<th data-options="field:'iconName',width:200,align:'left'">图标名称</th>
			<th
				data-options="field:'iconPath',width:80,align:'left',formatter:icon.list.formatIcon">
				图标</th>
			<th data-options="field:'iconExtension',width:280,align:'left'">类型</th>
			<th
				data-options="field:'id',width:200,align:'left',formatter:icon.list.formatOperation">
				操作</th>
		</tr>
	</thead>
</table>
<div id="iconDialog"></div>
