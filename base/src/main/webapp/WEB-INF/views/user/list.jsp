<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="easyui-layout" fit="true">
 <div region="center" style="padding:1px;border:1px;">
<table id="usergrid"
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
	  <th	data-options="field:'id',width:200,align:'left',formatter:formatOperation">
				操作</th>
    </tr>
  </thead>
</table>
</div>
<div id="userdialog">
</div>
<script>
  function formatIcon(value){
    if(value)
    return '<image border="0" src='+value.iconPath+'/'+value.iconName+value.iconExtension+'/>'
  }
</script>
<script type="text/javascript">
 function reload(){
 	$('#usergrid').treegrid('reload');
 }
  var toolbar = [{
    text:'增加',
    iconCls:'icon-add',
    handler:function(){
      $('#userdialog').dialog({
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
    }];
</script>
