<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table id="tt"
    class="easyui-treegrid"
    data-options="rownumbers:true,singleSelect:true, idField: 'id', treeField: 'name',url:'menu/list/data',toolbar:toolbar">
  <thead>
    <tr>
      <th data-options="field:'name',width:200,align:'left'">
        菜单名称
      </th>
      <th data-options="field:'icon',width:80,align:'left',formatter:formatIcon">
        图标
      </th>
      <th data-options="field:'url',width:280,align:'left'">
        菜单地址
      </th>

    </tr>
  </thead>
</table>
<div id="dd">
</div>
<script>
  function formatIcon(value){
    if(value)
    return '<image border="0" src='+value.iconPath+'/'+value.iconName+value.iconExtension+'/>'
  }
</script>
<script type="text/javascript">
 function reload(){
 	$('#tt').treegrid('reload');
 }

  var toolbar = [{
    text:'Add',
    iconCls:'icon-add',
    handler:function(){
      $('#dd').dialog({
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
