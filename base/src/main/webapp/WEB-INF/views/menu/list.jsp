<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table 
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
    return '<image border="0" src='+value.iconPath+'/>'
  }
</script>
<script type="text/javascript">
  var toolbar = [{
    text:'Add',
    iconCls:'icon-add',
    handler:function(){
    $('#dd').dialog({  
    title: 'My Dialog',  
    width: 600,  
    height: 400,  
    closed: false, 
    resizable:true, 
    cache: false,  
    href: 'menu/list',  
    modal: true  
});  
    
    }
  },'-',{
    text:'Edit',
    iconCls:'icon-edit',
  handler:function(){alert('cut')}
},'-',{
  text:'Delete',
  iconCls:'icon-remove',
handler:function(){alert('cut')}
}];
</script>
