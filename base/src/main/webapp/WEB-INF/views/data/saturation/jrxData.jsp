<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"uri="http://www.springframework.org/security/tags" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<script type="text/javascript">




 Namespace.register("saturation.list",{
	formatOperation:function(value){
		 if(value){
		        var edit='['+'<a href="#" onclick="user.list.edit('+value+')">编辑</a>' +']';
		        var del='['+ '<a href="#" onclick="user.list.remove('+value+' )">删除</a>'+']';
		      	if(hasRole('ROLE_USER_EDIT')){
		      		 return edit+del;
		      	}
		       	
		        }
	},
	formatJRXTime:function(value){
	return 	formatDateTime(value);
	},
	remove:function(value){
		 $.messager.confirm('提示', '确定要删除吗?', function(r){  
             if (r){  
              $.post('user/remove',{id:value},function(data){
	    			if(data.success){
	    				user.list.reload();
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
	myDate:function myformatter(value){  
		return 	formatDateTime(value);
    },  
   myParserDate:function myparser(value){  
        if (!value) return new Date();  
        var ss = (value.split('-'));  
        var y = parseInt(ss[0],10);  
        var m = parseInt(ss[1],10);  
        var d = parseInt(ss[2],10);  
        if (!isNaN(y) && !isNaN(m) && !isNaN(d)){  
            return new Date(y,m-1,d);  
        } else {  
            return new Date();  
        }  
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
		  	$('#jrxgrid').datagrid('reload');
		  }
	
});

 
 function submit(){
	var mp=$('#monitorPosition').combobox('getValues');
	var min1=$('#min').combobox('getText');
	var max1=$('#max').combobox('getText');
	var str1='';
	for(var i=0;i<mp.length;i++){
		str1+=mp[i]+',';
	}
	str1=str1.substring(0,str1.length-1);

	$('#jrxgrid').datagrid('load',{
			min:min1,
			max:max1,
			str:str1
	}
	);
  
 }
 function showData(result){
	 
 }
 
</script>
<div  class="easyui-layout" data-options="fit:true">
<div  data-options="region:'center'" style="padding: 10px 0 10px 10px">
  
     
<table id="jrxgrid" 
    class="easyui-datagrid" 
    data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'jrx/data/jrxData',pagination:'true',fitColumns:true,fit:true,toolbar:'#tb'">
  <thead>
  	
    <tr>
      <th id="dt" data-options="field:'date_Time',formatter:saturation.list.formatJRXTime,width:80,align:'left'">
      
  时间
      </th>
      <th data-options="field:'monitorName',width:80,align:'left'">
        测点
      </th>
      <th data-options="field:'water_depth',width:120,align:'left'">
    深度
      </th>

    </tr>
  </thead>
</table>
</div>
</div>
 <div id="tb" style="padding:5px;height:auto">  
        
        <div>  
            	时间  从: <input id='min' class="easyui-datebox" data-options="formatter:saturation.list.myDate,parser:saturation.list.myParserDate"></input>    
            	到: <input id='max' class="easyui-datebox" data-options="formatter:saturation.list.myDate,parser:saturation.list.myParserDate"></input>  
         		 测点:   
           <input id="monitorPosition" class="easyui-combobox"   
            name="monitorPosition"  
            data-options="  
                    url:'jrx/position/jrxMonitorPostion',  
                    valueField:'position',  
                    textField:'monitoringName',  
                    multiple:true,  
                    panelHeight:'auto'  
            "> 
            <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="submit()">查询</a>  
        </div>  
    </div>  
