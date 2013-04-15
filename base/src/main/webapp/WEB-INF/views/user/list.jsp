<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="easyui-layout" fit="true">
 <div region="center" style="padding:1px;border:1px;">
<table id="tt2"
    class="easyui-datagrid" 
    data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'user/list/data',toolbar:toolbar,pagination:'true',fitColumns:'true',fit:'true'">
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

    </tr>
  </thead>
</table>
</div>
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
  }];
</script>
