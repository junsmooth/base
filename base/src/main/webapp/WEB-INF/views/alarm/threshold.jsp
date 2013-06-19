<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">


 Namespace.register("config.threshold",{
	formatOperation:function(value){
		 if(value){
		        var edit='['+'<a href="#" onclick="config.threshold.edit('+value+')">编辑</a>' +']';
		        var del='['+ '<a href="#" onclick="config.threshold.remove('+value+' )">删除</a>'+']';
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
	    				config.threshold.reload();
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
		   $('#monpointdialog').dialog({
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
		  $('#monpointdialog').dialog('close');
		  },
	reload:function(){
		  	$('#monPointGrid').datagrid('reload');
		  }
	
});
config.threshold.toolbar = [{
    text:'增加',
    iconCls:'icon-add',
    disabled:!hasRole('ROLE_USER_EDIT'),
    handler:function(){
      $('#monpointdialog').dialog({
        title: '添加监测点',
        width: 600,
        height: 360,
        closed: false,
        //resizable:true,
        cache: false,
        href: 'config/monpoint/addOrUpdate?id=-1',
        modal: true
        });
      }
    }
    ,'-',{
    text:'刷新',
    iconCls:'icon-reload',
 	handler:function(){
	  config.threshold.reload();
 }
}
  
  ];
 
</script>
<div  class="easyui-layout" data-options="fit:true">
<div  data-options="region:'center'" style="padding: 10px 0 10px 10px">
<table id="monPointGrid" 
    class="easyui-datagrid" 
    data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'alarm/threshold/data',toolbar:config.threshold.toolbar,pagination:'true',fitColumns:true,fit:true">
  <thead>
    <tr>
 
      <th data-options="field:'point',width:80,align:'left',formatter:function(value,row,index){return value.monitoringName;}">
        监测点
      </th>
      <th data-options="field:'attr',width:120,align:'left',formatter:function(value,row,index){return value.name;}">
      监测指标
      </th>
         <th data-options="field:'op',width:120,align:'left',formatter:function(value,row,index){return value.displayName;}">
      操作符
      </th>
         <th data-options="field:'value',width:120,align:'left'">
      监测值
      </th>
            </th>
         <th data-options="field:'alarmType',width:120,align:'left',formatter:function(value,row,index){return value.name;}">
   报警级别
      </th>
	 <th
				data-options="field:'id',width:200,align:'left',formatter:config.threshold.formatOperation">
				操作</th>
    </tr>
  </thead>
</table>
</div>
</div>
<div id="monpointdialog"></div>