<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">


 Namespace.register("config.monPoint",{
	formatOperation:function(value){
		 if(value){
		        var edit='['+'<a href="#" onclick="config.monPoint.edit('+value+')">编辑</a>' +']';
		        var del='['+ '<a href="#" onclick="config.monPoint.remove('+value+' )">删除</a>'+']';
		      	if(hasRole('ROLE_USER_EDIT')){
		      		 return edit+del;
		      	}
		       	
		        }
	},

	remove:function(value){
		 $.messager.confirm('提示', '确定要删除吗?', function(r){  
             if (r){  
              $.post('user/remove',{id:value},function(data){
	    			if(data.success){
	    				config.monPoint.reload();
	    				$.dialog.tips(data.msg);
	    	}else{
	    	$.dialog.tips(data.msg+":"+data.obj,600,'error.gif');
	    	}
 	 });
             }  else{
             return;
             }
         });  
	},
	edit:function(value){
		   $('#userdialog').dialog({
		        title: '用户编辑',
		        width: 600,
		        height: 336,
		        closed: false,
		        resizable:true,
		        cache: false,
		        href: 'user/addOrUpdate?id='+value,
		        modal: true
		        });
		  },
	closeDialog:function(){
		  $('#userdialog').dialog('close');
		  },
	reload:function(){
		  	$('#monPointGrid').datagrid('reload');
		  }
	
});
config.monPoint.toolbar = [{
    text:'增加',
    iconCls:'icon-add',
    disabled:!hasRole('ROLE_USER_EDIT'),
    handler:function(){
      $('#userdialog').dialog({
        title: '添加用户',
        width: 600,
        height: 360,
        closed: false,
        //resizable:true,
        cache: false,
        href: 'user/addOrUpdate?id=-1',
        modal: true
        });
      }
    }
    ,'-',{
    text:'刷新',
    iconCls:'icon-reload',
 	handler:function(){
	  config.monPoint.reload();
 }
}
  
  ];
 
</script>
<div  class="easyui-layout" data-options="fit:true">
<div  data-options="region:'center'" style="padding: 10px 0 10px 10px">
<table id="monPointGrid" 
    class="easyui-datagrid" 
    data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'config/monpoint/data',toolbar:config.monPoint.toolbar,pagination:'true',fitColumns:true,fit:true">
  <thead>
    <tr>
      <th data-options="field:'monitoringName',width:80,align:'left'">
        监测点名称
      </th>
      <th data-options="field:'realname',width:80,align:'left'">
        监测类型
      </th>
      <th data-options="field:'telephone',width:120,align:'left'">
      监测点位置编号
      </th>
	 <th
				data-options="field:'id',width:200,align:'left',formatter:config.monPoint.formatOperation">
				操作</th>
    </tr>
  </thead>
</table>
</div>
</div>
<div id="userdialog"></div>
