<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<script>
	 $(function(){  
	        var typeId = $('#jclx').combobox({  
	            url:'topo/monitorPData',  
	            editable:false,  
	            valueField:'id',  
	            textField:'name',  
	            onSelect:function(record){  
	                //刷新数据，重新读取数据，并清空当前输入的值  
	                jcdlxId.combobox({  
	                    disabled:false,  
	                    url:'topo/iconData?code='+record.code,  
	                    valueField:'position',  
	                    textField:'monitoringName'  
	                }).combobox('clear');  
	            }  
	        });  
	        var jcdlxId = $('#jcdlx').combobox({  
	            disabled:true,  
	            valueField:'position',  
	            textField:'monitoringName'  
	        });  
	}); 
	 
	 
	 
		function saveMp(){
			//alert(".....");
			var sValue=$("#jclx").datetimebox('getValue');
			var sMP=$("#jcdlx").datetimebox('getValue');
			//alert("sMP: "+sMP);
			//alert("setValue:"+sValue);
			if(sValue!=null){
				menu.main.addPoint(sValue,sMP);
			}
		}
		
	 
</script>


<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<form id="menuForm" method="post">
			<table>
				<tr>
					<td>监测类型:<select id="jclx" class="easyui-combobox" name="jclx" 
					data-options=''
					 style="width:100px;"valueField="id" textField="name"></select></td>
				</tr>
					<tr><td>监测点&nbsp&nbsp:<select id="jcdlx" class="easyui-combobox" name="jcdlx"  style="width:100px;"valueField="position" textField="monitoringName"></select></td></tr>

			</table>

		</form>
	</div>
	<div data-options="region:'south',border:false"
		style="text-align: right; padding: 5px 0 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
			href="javascript:void(0)" onclick="saveMp()"> 保存 </a> <a
			class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			href="javascript:void(0)"
			onclick="menu.main.closeDialog();"> 取消 </a>
	</div>


</div>