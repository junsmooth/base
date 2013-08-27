<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
    <meta charset="UTF-8">
        <style type="text/css">
    	.wkkgk_s1{
    		border:0px;
    		border-color: #C3D9E0;
    		/* background-color: #FAFAFA; */
    		width:230px;
    	}
    		.wkkgk_s2{
    			width:230px;
    	}
    	td{border-color: #C3D9E0;
    		height: 30px;
    	}
	#tid { 
    width: auto; 
    padding: 0; 
    margin: 0; 
	} 
	
	.reven { 
	    font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
	    color: #4f6b72; 
	    border-right: 1px solid #C1DAD7; 
	    border-bottom: 1px solid #C1DAD7; 
	    border-top: 1px solid #C1DAD7; 
	    letter-spacing: 2px; 
	    text-transform: uppercase; 
	    text-align: left; 
	    padding: 6px 6px 6px 12px; 
	    background: #CAE8EA; 
	} 
	
	.rodd { 
	       font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
	    color: #4f6b72; 
	    border-right: 1px solid #C1DAD7; 
	    border-bottom: 1px solid #C1DAD7; 
	    border-top: 1px solid #C1DAD7; 
	    letter-spacing: 2px; 
	    text-transform: uppercase; 
	    text-align: left; 
	    padding: 6px 6px 6px 12px; 
	    background: none; 
	} 
	.rodd input{
		background: #F5FAFA;
	}
	
	.tdeven { 
	    border-right: 1px solid #C1DAD7; 
	    border-bottom: 1px solid #C1DAD7; 
	    background: #fff; 
	    font-size:11px; 
	    padding: 6px 6px 6px 12px; 
	    color: #4f6b72; 
	} 
	
	
	.tdodd { 
	border-right: 1px solid #C1DAD7; 
	    border-bottom: 1px solid #C1DAD7; 
	    background: #fff; 
	    font-size:11px; 
	    padding: 6px 6px 6px 12px; 
	    background: #F5FAFA; 
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
    	
    	$(function(){
    		setClass();
    		if (!hasRole('ROLE_AUTH_EDIT')){
    			$("#uid").hide();
    		} 
    	});
    	
    	function setClass(){
    		
    		var c=$(".reven td");
    		var c2=$(".rodd td");
    		for(var j=0;j<c2.length;j++){
    			$(c2[j]).addClass("tdodd");
    		}
    		for(var i=0;i<c.length;i++){
    			$(c[i]).addClass("tdeven");
    		}
    	}
    </script>


<div class="easyui-panel" title=" " >
	<form id="ff" action="wkkgk/saveOrUpdateData" method="post">
	
			 <table id="tid"  cellspacing="1"  cellpadding="3" class="tablehead" style="background:#FAFAFA;">
			 
				<tr style="text-align: center;font-size: 14px;font-weight: bold;height: 22px;">
					<td colspan="7" >
						尾矿库概况
					</td>
				</tr>
                <tr class="reven">
                    <td >建设时间:</td>
                    <td ><input class="wkkgk_s1" name="time" value="${wkkgk.time }" readOnly="readonly" type="text"></input></td>
                      <td>投入使用时间:</td>
                    <td><input class="wkkgk_s1" name="using"  value="${wkkgk.using}" readOnly="readonly" type="text"></input></td>
                      <td>尾矿库类型:</td>
                    <td><input class="wkkgk_s1" name="type" value="${wkkgk.type}" readOnly="readonly"  type="text"></input></td>
                </tr>
                <tr class="rodd">
                    <td>筑坝方式:</td>
                    <td><input class="wkkgk_s1" name="dams" value="${wkkgk.dams}" readOnly="readonly" type="text"></input></td>
                       <td>尾矿库等级:</td>
                    <td><input class="wkkgk_s1" name="tlevel" value="${wkkgk.tlevel}" readOnly="readonly" type="text"></input></td>
                       <td>汇水面积:</td>
                    <td><input class="wkkgk_s1" name="area" value="${wkkgk.area}" readOnly="readonly" type="text"></input></td>
                </tr>
                <tr class="reven">
                    <td>防洪标准:</td>
                    <td><input class="wkkgk_s1" name="standard" value="${wkkgk.standard}" readOnly="readonly" type="text"></input></td>
                       <td>初期坝类型:</td>
                    <td><input class="wkkgk_s1" name="early" value="${wkkgk.early}" readOnly="readonly" type="text"></input></td>
                       <td>初期坝底标高:</td>
                    <td><input class="wkkgk_s1" name="dambottom" value="${wkkgk.dambottom}" readOnly="readonly" type="text"></input></td>
                </tr>
                <tr class="rodd">
                    <td>初期坝顶标高:</td>
                    <td><input class="wkkgk_s1" name="alignment1" value="${wkkgk.alignment1}" readOnly="readonly" type="text"></input></td>
                       <td>最终坝顶标高:</td>
                    <td><input class="wkkgk_s1" name="alignment2" value="${wkkgk.alignment2}" readOnly="readonly" type="text"></input></td>
                       <td>总堆积高度:</td>
                    <td><input class="wkkgk_s1" name="height" value="${wkkgk.height}" readOnly="readonly" type="text"></input></td>
                    
                </tr>
                   <tr class="reven">
                    <td >总库容:</td>
                    <td ><input class="wkkgk_s1" name="total" value="${wkkgk.total}" readOnly="readonly" type="text"></input></td>
                      <td>有效库容:</td>
                    <td><input class="wkkgk_s1" name="effective" value="${wkkgk.effective}" readOnly="readonly" type="text"></input></td>
                      <td>目标坝顶标高:</td>
                    <td><input class="wkkgk_s1" name="alignment3" value="${wkkgk.alignment3}" readOnly="readonly" type="text"></input></td>
                </tr>
                <tr class="rodd">
                    <td>目标坝高:</td>
                    <td><input class="wkkgk_s1" name="damhigh" value="${wkkgk.damhigh}" readOnly="readonly" type="text"></input></td>
                       <td>目标坝体长度:</td>
                    <td><input class="wkkgk_s1" name="length" value="${wkkgk.length}" readOnly="readonly" type="text"></input></td>
                       <td>坝体纵坡度:</td>
                    <td><input class="wkkgk_s1" name="slope" value="${wkkgk.slope}" readOnly="readonly" type="text"></input></td>
                </tr>
                <tr class="reven">
                    <td>初期坝顶宽度:</td>
                    <td><input class="wkkgk_s1" name="damwidth" value="${wkkgk.damwidth}" readOnly="readonly" type="text"></input></td>
                       <td>初期坝内坡比:</td>
                    <td><input class="wkkgk_s1" name="daminslope" value="${wkkgk.daminslope}" readOnly="readonly" type="text"></input></td>
                       <td>初期坝外坡比:</td>
                    <td><input class="wkkgk_s1" name="damoutslope1" value="${wkkgk.damoutslope1}" readOnly="readonly" type="text"></input></td>
                </tr>
                <tr class="rodd">
                    <td>初期坝外坡比:</td>
                    <td><input class="wkkgk_s1" name="damoutslope2" value="${wkkgk.damoutslope2}" readOnly="readonly" type="text"></input></td>
                       <td>沉积滩平均坡度:</td>
                    <td><input class="wkkgk_s1" name="avgslope" value="${wkkgk.avgslope}" readOnly="readonly" type="text"></input></td>
                       <td colspan="2"></td>
                </tr>
            </table>
            <input name="id" value="${wkkgk.id }" type="hidden"/>
  </form>
  </div>
  	<div id="uid" align="right" style="margin-top: 10px;margin-right: 70px;">
		<a id="sid" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',disabled:!hasRole('${ROLE_AUTH_EDIT}')" onclick="save()" style="display:none;">保存</a>  
		<a id="eid" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',disabled:!hasRole('${ROLE_AUTH_EDIT}')" onclick="edit()">编辑</a>  
		<a id="cid" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',disabled:!hasRole('${ROLE_AUTH_EDIT}')"  onclick="cancel()" style="display:none;">取消</a>  
	</div>
