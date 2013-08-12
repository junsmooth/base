<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
    <meta charset="UTF-8">
        <style type="text/css">
    	.wkkgk_s1{
    		border:0px;
    		border-color: #C3D9E0;
    		background-color: #FAFAFA;
    		width:230px;
    	}
    		.wkkgk_s2{
    			width:230px;
    	}
    	td{border-color: #C3D9E0;
    		height: 30px;
    	}
    
   
    </style>
    <script type="text/javascript">
    
    
    	function edit(){
    		$("#sid").show();
    		$("#cid").show();
    		$("#eid").hide();
    		var obj=$("#tid input[type='text']");
    		for(var i=0;i<obj.length;i++){
    			var value=obj[i];
    			//alert(value.readOnly);
    			value.readOnly=false;
    			value.className="wkkgk_s2";
    			//alert(value.readonly);
    		}
    		//document.getElementById("sid").style.display=false;
    		//$("#sid").style.display = 'none';
    	}
    
    
     	function refreshPage(){
    		 var tab = $('#tabs').tabs('getSelected');

     	    $("#tabs").tabs('getTab',{
     	        tab: tab,
     	        options: {

     	            href: 'wkkgk/iniData'
     	        }
     	    });
     	    tab.panel('refresh');
    	}
    	
    	function save(){
    		
    		   $('#ff').form('submit',{
                  
    			   success:function(){  
    				   $.messager.alert('','保存成功!');
    			    }  
               });
    			var obj=$("#tid input[type='text']");
        		for(var i=0;i<obj.length;i++){
        			obj[i].readOnly=true;
        			obj[i].className="wkkgk_s1";
        		}
    		   $("#sid").hide();
       		$("#cid").hide();
       		$("#eid").show();
    		 //  refreshPage();
    	}
    	
    	function cancel(){
    		
    		$("#sid").hide();
    		$("#cid").hide();
    		$("#eid").show();
    		var obj=$("#tid input[type='text']");
    		for(var i=0;i<obj.length;i++){
    			obj[i].readOnly=true;
    			obj[i].className="wkkgk_s1";
    		}
    		  document.getElementById("ff").reset();
    	}
    </script>


<div class="easyui-panel" title=" " >
	<form id="ff" action="wkkgk/saveOrUpdateData" method="post">
	
			 <table id="tid"  border="1px" cellspacing="0px" style="margin-left: 30px;margin-top: 30px;margin-right: 20px;margin-right: 20px;">
			 
				<tr style="text-align: center;font-size: 14px;font-weight: bold;height: 22px;">
					<td colspan="7" >
						尾矿库概况
					</td>
				</tr>
                <tr>
                    <td >建设时间:</td>
                    <td ><input class="wkkgk_s1" name="time" value="${wkkgk.time }" readOnly="readonly" type="text"></input></td>
                      <td>投入使用时间:</td>
                    <td><input class="wkkgk_s1" name="using"  value="${wkkgk.using}" readOnly="readonly" type="text"></input></td>
                      <td>尾矿库类型:</td>
                    <td><input class="wkkgk_s1" name="type" value="${wkkgk.type}" readOnly="readonly"  type="text"></input></td>
                </tr>
                <tr>
                    <td>筑坝方式:</td>
                    <td><input class="wkkgk_s1" name="dams" value="${wkkgk.dams}" readOnly="readonly" type="text"></input></td>
                       <td>尾矿库等级:</td>
                    <td><input class="wkkgk_s1" name="tlevel" value="${wkkgk.tlevel}" readOnly="readonly" type="text"></input></td>
                       <td>汇水面积:</td>
                    <td><input class="wkkgk_s1" name="area" value="${wkkgk.area}" readOnly="readonly" type="text"></input></td>
                </tr>
                <tr>
                    <td>防洪标准:</td>
                    <td><input class="wkkgk_s1" name="standard" value="${wkkgk.standard}" readOnly="readonly" type="text"></input></td>
                       <td>初期坝类型:</td>
                    <td><input class="wkkgk_s1" name="early" value="${wkkgk.early}" readOnly="readonly" type="text"></input></td>
                       <td>初期坝底标高:</td>
                    <td><input class="wkkgk_s1" name="dambottom" value="${wkkgk.dambottom}" readOnly="readonly" type="text"></input></td>
                </tr>
                <tr>
                    <td>初期坝顶标高:</td>
                    <td><input class="wkkgk_s1" name="alignment1" value="${wkkgk.alignment1}" readOnly="readonly" type="text"></input></td>
                       <td>最终坝顶标高:</td>
                    <td><input class="wkkgk_s1" name="alignment2" value="${wkkgk.alignment2}" readOnly="readonly" type="text"></input></td>
                       <td>总堆积高度:</td>
                    <td><input class="wkkgk_s1" name="height" value="${wkkgk.height}" readOnly="readonly" type="text"></input></td>
                    
                </tr>
                   <tr>
                    <td >总库容:</td>
                    <td ><input class="wkkgk_s1" name="total" value="${wkkgk.total}" readOnly="readonly" type="text"></input></td>
                      <td>有效库容:</td>
                    <td><input class="wkkgk_s1" name="effective" value="${wkkgk.effective}" readOnly="readonly" type="text"></input></td>
                      <td>目标坝顶标高:</td>
                    <td><input class="wkkgk_s1" name="alignment3" value="${wkkgk.alignment3}" readOnly="readonly" type="text"></input></td>
                </tr>
                <tr>
                    <td>目标坝高:</td>
                    <td><input class="wkkgk_s1" name="damhigh" value="${wkkgk.damhigh}" readOnly="readonly" type="text"></input></td>
                       <td>目标坝体长度:</td>
                    <td><input class="wkkgk_s1" name="length" value="${wkkgk.length}" readOnly="readonly" type="text"></input></td>
                       <td>坝体纵坡度:</td>
                    <td><input class="wkkgk_s1" name="slope" value="${wkkgk.slope}" readOnly="readonly" type="text"></input></td>
                </tr>
                <tr>
                    <td>初期坝顶宽度:</td>
                    <td><input class="wkkgk_s1" name="damwidth" value="${wkkgk.damwidth}" readOnly="readonly" type="text"></input></td>
                       <td>初期坝内坡比:</td>
                    <td><input class="wkkgk_s1" name="daminslope" value="${wkkgk.daminslope}" readOnly="readonly" type="text"></input></td>
                       <td>初期坝外坡比:</td>
                    <td><input class="wkkgk_s1" name="damoutslope1" value="${wkkgk.damoutslope1}" readOnly="readonly" type="text"></input></td>
                </tr>
                <tr>
                    <td>初期坝外坡比:</td>
                    <td><input class="wkkgk_s1" name="damoutslope2" value="${wkkgk.damoutslope2}" readOnly="readonly" type="text"></input></td>
                       <td>沉积滩平均坡度:</td>
                    <td><input class="wkkgk_s1" name="avgslope" value="${wkkgk.avgslope}" readOnly="readonly" type="text"></input></td>
                       <td></td>
                    <td></td>
                    
                </tr>
            </table>
            <input name="id" value="${wkkgk.id }" type="hidden"/>
  </form>
  </div>
  	<div align="right" style="margin-top: 10px;margin-right: 70px;">
		<a id="sid" href="javascript:void(0)" class="easyui-linkbutton"  onclick="save()" style="display:none;">保存</a>  
		<a id="eid" href="javascript:void(0)" class="easyui-linkbutton"  onclick="edit()">编辑</a>  
		<a id="cid" href="javascript:void(0)" class="easyui-linkbutton"  onclick="cancel()" style="display:none;">取消</a>  
	</div>
