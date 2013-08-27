<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
    <meta charset="UTF-8">
    <style type="text/css">
    	.s1{
    		border:0px;
    		border-color: #C3D9E0;
    		background-color: #FAFAFA;
    		width:210px;
    	}
    		.s2{
    			width:210px;
    	}
    	td{border-color: #C3D9E0;
    		height: 30px;
    	}
    #proTId { 
    width: auto; 
    padding: 0; 
    margin: 0; 
	} 
	
	.xm_reven { 
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
	
	.xm_rodd { 
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
	.xm_rodd input{
		background: #F5FAFA;
	}
	.xm_reven input{
		background: #FFFFFF;
	}
	
	.xm_tdeven { 
	    border-right: 1px solid #C1DAD7; 
	    border-bottom: 1px solid #C1DAD7; 
	    background: #fff; 
	    font-size:11px; 
	    padding: 6px 6px 6px 12px; 
	    color: #4f6b72; 
	} 
	
	
	.xm_tdodd { 
	border-right: 1px solid #C1DAD7; 
	    border-bottom: 1px solid #C1DAD7; 
	    background: #fff; 
	    font-size:11px; 
	    padding: 6px 6px 6px 12px; 
	    background: #F5FAFA; 
	} 
   
    </style>
    <script type="text/javascript">
    
    
    	$(function(){
    		setTRClass();
    		setTDClass();
    		if (!hasRole('ROLE_AUTH_EDIT')){
    			$("#xm_uid").hide();
    		} 
    	});
    	
    	function setTDClass(){
    		var c=$(".xm_reven td");
    		var c2=$(".xm_rodd td");
    		for(var j=0;j<c2.length;j++){
    			$(c2[j]).addClass("xm_tdodd");
    		}
    		for(var i=0;i<c.length;i++){
    			$(c[i]).addClass("xm_tdeven");
    		}
    	}
    	function setTRClass(){
    		var trArr=$("#proTId tr");
    		//alert(trArr.length);
    		for(var j=1;j<trArr.length;j++){
    			if(j%2==0){
    				$(trArr[j]).addClass("xm_rodd");
    			}else{
    				$(trArr[j]).addClass("xm_reven");
    			}
    		}
    	}
    	function xmgk_edit(){
    		$("#proSId").show();
    		$("#proCId").show();
    		$("#proEId").hide();
    		var obj=$("#proTId input[type='text']");
    		for(var i=0;i<obj.length;i++){
    			var value=obj[i];
    			//alert(value.readOnly);
    			value.readOnly=false;
    			value.className="s2";
    			//alert(value.readonly);
    		}
    		//document.getElementById("proSId").style.display=false;
    		//$("#proSId").style.display = 'none';
    	}
    
    	function xmgk_save(){
    		
    		   $('#proFId').form('submit',{
    			   onSubmit: function(){  
						//alert("success!");
						var t1=document.getElementById("time");
						var t2=document.getElementById("completion")
					if(checkingTime(t1)&&checkingTime(t2)){
						var obj=$("#proTId input[type='text']");
		        		for(var i=0;i<obj.length;i++){
		        			obj[i].readOnly=true;
		        			obj[i].className="s1";
		        		}
			    		$("#proSId").hide();
			       		$("#proCId").hide();
			       		$("#proEId").show();
					}else{
						return false;
					}
						//alert($("#time").val());
    			   }, 
    			   success:function(){  
    				   $.messager.alert('','保存成功!');
    			    }  
               });
    	}
    	
        function xmgk_cancel(){
        	
			$("#proSId").hide();
			$("#proCId").hide();
			$("#proEId").show();
			var obj=$("#proTId input[type='text']");
			for(var i=0;i<obj.length;i++){
				obj[i].readOnly=true;
				obj[i].className="s1";
			}
			document.getElementById("proFId").reset();
		
		}
        
        function checkingTime(element){
        	  var strValue=element.value;
              var objRegExp = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/ 
              if(objRegExp.test(strValue)||strValue==""){
            	  return true;
              }else{
              	$.messager.alert('',"日期格式不正确(yyyy-MM-dd)");
            	 // element.value="";
                  return false;  
        	  }
        }
        
    </script>
	

<div  class="easyui-panel" title=" " >
	<form id="proFId" action="xmgk/saveOrUpdateData" method="post">
	
			 <table id="proTId" cellspacing="1"   style="background:#FAFAFA;">
			 
			 			<tr style="text-align: center;font-size: 14px;font-weight: bold;height: 22px;">
					<td colspan="7" >
						项目概况
					</td>
				</tr>
					 	 <tr >
					 	 		<td rowspan="2">基本介绍</td>
					           <td >项目名称:</td>
					           <td><input class="s1" type="text" name="projectname"
											id="projectname"
											value="${xmgk.projectname}" readOnly="readonly"
											 /></td>
					           <td>承建单位:</td><td><input class="s1" type="text" name="unit"
											id="unit"
											value="${xmgk.unit}" readOnly="readonly"
											 /></td>
					           <td>监测内容:</td><td><input class="s1" type="text" name="contents"
											id="contents"
											value="${xmgk.contents}" readOnly="readonly"
											 /></td>
				        </tr>
								        <tr >
								           <td >建设时间：</td><td><input class="s1" type="text" name="time"
														id="time"
														value="${xmgk.time}" readOnly="readonly"
														onchange="checkingTime(this)"
														 /></td>
								           <td>竣工时间：</td><td><input class="s1" type="text" name="completion"
														id="completion"
														value="${xmgk.completion}" readOnly="readonly"
														onchange="checkingTime(this)"
														 /></td>
								           <td colspan="2"></td>
								        </tr>
								        <tr >
								           <td rowspan="4">测量点数</td>
								           <td >表面位移：</td><td><input class="s1" type="text" name="surface1"
														id="surface1"
														value="${xmgk.surface1}" readOnly="readonly"
														 /></td>
								           <td>内部位移：</td><td><input class="s1" type="text" name="internal1"
														id="internal1"
														value="${xmgk.internal1}" readOnly="readonly"
														 /></td>
								           <td>干滩高程：</td><td><input class="s1" type="text" name="elevation1"
														id="elevation1"
														value="${xmgk.elevation1}" readOnly="readonly"
														 /></td>
								        </tr>
								        <tr >
								           <td >浸润线：</td><td><input class="s1" type="text" name="saturation1"
														id="saturation1"
														value="${xmgk.saturation1}" readOnly="readonly"
														 /></td>
								           <td>库水位：</td><td><input class="s1" type="text" name="water1"
														id="water1"
														value="${xmgk.water1}" readOnly="readonly"
														 /></td>
								           <td>视频监控：</td><td><input class="s1" type="text" name="video1"
														id="video1"
														value="${xmgk.video1}" readOnly="readonly"
														 /></td>
								        </tr>
								        <tr >
								           <td >渗流量：</td><td><input class="s1" type="text" name="seepage1"
														id="seepage1"
														value="${xmgk.seepage1}" readOnly="readonly"
														 /></td>
								           <td>降雨量：</td><td><input class="s1" type="text" name="rainfall1"
														id="rainfall1"
														value="${xmgk.rainfall1}" readOnly="readonly"
														 /></td>
								           <td>孔隙水压力：</td><td><input class="s1" type="text" name="waterpressure"
														id="waterpressure"
														value="${xmgk.waterpressure}" readOnly="readonly"
														 /></td>
								        </tr>
								        <tr >
								           <td >浑浊度：</td><td><input class="s1" type="text" name="turbidity1"
														id="turbidity1"
														value="${xmgk.turbidity1}" readOnly="readonly"
														 /></td>
								           <td>PH值：</td><td><input class="s1" type="text" name="hp"
														id="hp"
														value="${xmgk.hp}" readOnly="readonly"
														 /></td>
								           <td>温度：</td><td><input class="s1" type="text" name="temperature"
														id="temperature"
														value="${xmgk.temperature}" readOnly="readonly"
														 /></td>
								        </tr>
								        <tr >
								           <td rowspan="4">监测技术或设备</td>
								           <td >表面位移：</td><td><input class="s1" type="text" name="surface2"
														id="surface2"
														value="${xmgk.surface2}" readOnly="readonly"
														 /></td>
								           <td>浸润线：</td><td><input class="s1" type="text" name="saturation2"
														id="saturation2"
														value="${xmgk.saturation2}" readOnly="readonly"
														 /></td>
								           <td>内部位移：</td><td><input class="s1" type="text" name="internal2"
														id="internal2"
														value="${xmgk.internal2}" readOnly="readonly"
														 /></td>
								        </tr>
								        <tr >
								           <td >库水位：</td><td><input class="s1" type="text" name="water2"
														id="water2"
														value="${xmgk.water2}" readOnly="readonly"
														 /></td>
								           <td>干滩高程：</td><td><input class="s1" type="text" name="elevation2"
														id="elevation2"
														value="${xmgk.elevation2}" readOnly="readonly"
														 /></td>
								           <td>视频监控：</td><td><input class="s1" type="text" name="video2"
														id="video2"
														value="${xmgk.video2}" readOnly="readonly"
														 /></td>
								        </tr>
								        <tr >
								           <td >降雨量：</td><td><input class="s1" type="text" name="rainfall2"
														id="rainfall2"
														value="${xmgk.rainfall2}" readOnly="readonly"
														 /></td> 	
								           <td>坝体压力：</td><td><input class="s1" type="text" name="dampressure"
														id="dampressure"
														value="${xmgk.dampressure}" readOnly="readonly"
														 /></td>
								           <td>渗流量：</td><td><input class="s1" type="text" name="seepage2"
														id="seepage2"
														value="${xmgk.seepage2}" readOnly="readonly"
														 /></td>
								        </tr>
								        <tr >
								           <td >浑浊度：</td><td><input class="s1" type="text" name="turbidity2"
														id="turbidity2"
														value="${xmgk.turbidity2}" readOnly="readonly"
														 /></td>
								           <td colspan="4"></td>
								        </tr>
			        
            </table>
            <input name="id" value="${xmgk.id }" type="hidden"/>
  </form>
  
  </div>
  	<div id="xm_uid" align="right" style="margin-top: 10px;margin-right: 35px;">
		<a id="proSId" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',disabled:!hasRole('${ROLE_AUTH_EDIT}')"  onclick="xmgk_save()" style="display:none;">保存</a>  
		<a id="proEId" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',disabled:!hasRole('${ROLE_AUTH_EDIT}')" onclick="xmgk_edit()">编辑</a>  
		<a id="proCId" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',disabled:!hasRole('${ROLE_AUTH_EDIT}')" onclick="xmgk_cancel()" style="display:none;">取消</a>  
	</div>
