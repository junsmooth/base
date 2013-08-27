<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
img.x
{

z-index:-1
}
</style>
<script>
	Namespace.register("menu.main", {
		
		addPoint:function(sValue,sMP){
			$.ajax({
				type : 'POST',
				url:"topo/mpPath",
				data:{v:sValue,m:sMP},
				success:setMpPath
			}); 
		},
		closeDialog:function(){
			$('#mpId').dialog('close');
		},
		confirm:function(obj){
			alert(obj.id+"offsetTop :"+obj.offsetTop+"offsetLeft "+obj.offsetLeft );/*  */
		},
		saveData:function(){
			var divList=$("#p").children('div');
				var arr=new Array(divList.length);
				var jsonData={};
			for(var i=0;i<divList.length;i++){
				var offsetLef=divList[i].offsetLeft;
				var offsetTp=divList[i].offsetTop;
				var sId=(divList[i].id).split("_")[1];
				jsonData[i]={"sId":sId,"x":offsetLef,"y":offsetTp};
			}
			
			var bjt=$('#p').children('img');
	 		var w=bjt.css("width");
	 		var h=bjt.css("height");
	 		var pos=bjt.position();
	 		var lef=pos.left;
	 		var top=pos.top;
	 		jsonData[divList.length]={"w":w,"h":h,"lef":lef,"top":top};
			
			$.ajax({
				type:"POST",
				data: JSON.stringify(jsonData), 
                dataType: "json",
                contentType: "application/json",
                url:"topo/storeMP",
                success:reloadPage
			});
		},
		mpUrl:function(value){
			alert("url");
		}
		
	});
	
	function reloadPage(){
		 $.dialog.tips("保存成功!");
	 		refreshCurrentPage();
	}
	function msgShow(title, msgString, msgType) {
		$.messager.alert(title, msgString, msgType);
	}
	
	function setMpPath(data){
		var path=data[0].icon.iconPath;
	    var imgId;
	    var childDivList=$("#p").children("div");
	    for(var j=0;j<childDivList.length;j++){
				var strId=childDivList[j].id;
				var id=strId.split("_")[1];
				if(id==data[2].id){
					//alert("当前测点页面已存在!");
					$.messager.alert('','当前测点页面已存在!');  
					return;
				}
	    }
	    if(data[2].drawPosition!=""&&data[2].drawPosition!=null){
	    	imgId="point_"+data[2].id;
	    	$('#'+imgId).draggable({  
	    		
			});  
	    }else{
	    	
		        var parentdiv=$('<div class="easyui-draggable" contextmenu="clickRightButton(this)" style="background-color: black; width: 20px; height: 20px;background-position:center; background-repeat: no-repeat;"></div>').appendTo('#p');
		    	imgId="point_"+data[2].id;
			   	parentdiv.attr('id',imgId);   
			  	parentdiv.css("background-image",'url('+path+')'); 
				parentdiv.css("position","absolute");
				parentdiv.css("left",518+"px");
				parentdiv.css("top",262+"px"); 
				$('#'+imgId).draggable({  
				});  
				document.getElementById(imgId).oncontextmenu=function(event) {  
					    if (document.all) window.event.returnValue = false;// for IE  
					    else event.preventDefault();  
					    $.messager.confirm('','你确定要删除当前图片?',function(r){  
						    if (r){  
						    	$("#"+imgId).remove();
						    }  
						});
					}; 
					
					$("#"+imgId).mouseover(function(){
						
						 $("#" + imgId).tooltip({  
							    position: 'right',  
							    content:data[2].monitoringName,
								onShow: function(){  
							        $(this).tooltip('tip').css({  
							            backgroundColor: '#FCFFFF',  
							            borderColor: '#000000'  
							        });  
							    } 
							});
						});
	    }
	
	  	menu.main.closeDialog();
	  	
	}

 	$(function (){
 		
 		getMpPic();
 		getAllData();
 	}
	);
 	function getMpPic(){	
 		$.ajax({
		type:"POST",
		url :"topo/mpPic",
		success:showMpPic
		});
	}
	function getAllData() {
		$.ajax({
			type:"POST",
			url:"topo/mainData",
			success:setData
			
		});
	}
	
	function setData(value){
		var data=value.dataList;
		for(var i=0;i<data.length;i++){
			
			var d = data[i];
			var name = d.monitoringName;
			var val,de,dh,dn;
			var baseId ="point_"+data[i].id;
				if(d.type.code=="BMWY"){
					if(d.mpValue==null){
						de="当前测点没有数值!";
					}else{
						de=(d.mpValue.dE*1000).toFixed(2);
						dh=(d.mpValue.dH*1000).toFixed(2);
						dn=(d.mpValue.dN*1000).toFixed(2);
						dde=(d.mpValue.dDE*1000).toFixed(2);
						ddh=(d.mpValue.dDH*1000).toFixed(2);
						ddn=(d.mpValue.dDN*1000).toFixed(2);
						var arr=[dn,de,dh,ddn,dde,ddh];
						var mpName=new Array(6);
						for(var j=0;j<mpName.length;j++){
							mpName[j]=d.mpValue.obj[j].name;
						}
					}
					showBMWYData(baseId,name,arr,mpName);
				}else if(d.url!=null&&d.url!=""){
						var link=document.getElementById(baseId);
						var ul=d.url;
						link.setAttribute("onclick","spMonitor('"+ul+"')");
					
				}else{
					if(d.mpValue==null){
						val="当前测点没有数值!";
					}else{
						val=d.mpValue.value.toFixed(2);
					}
					showOtherData(baseId,name,val);
				}
		}
		var alarmRecord=value.alarmRecordData;
		 for(var j=0;j<alarmRecord.length;j++){
			
			var alarm = alarmRecord[j];
			var name = alarm.threshold.attr.type.name;
		
			var	val = alarm.warningContent;
			
		 	var baseId ="point_"+alarm.threshold.point.id;
		
			 $("#" + baseId).css("background-color",alarm.threshold.alarmType.color.code);
			 
		} 
	}
	
	function spMonitor(ul){
		
		//addTab('视频',ul,'');
		window.open(ul);
	}
	//arr:依次为dn,de,dh,ddn,dde,ddh的值。mpName:依次为dn,de,dh,ddn,dde,ddh的名称。
	function showBMWYData(baseId,name,arr,mpName){
		 $("#" + baseId).tooltip({  
			    position: 'right',  
			    content:  "<h5>"+name+"</h5>"+"<p>"+mpName[0]+':' +arr[0]+"mm<br>"+mpName[1]+":" + arr[1] + "mm<br>"
				+ mpName[2]+':' + arr[2] + "mm"+"<br>"+mpName[3]+':' +arr[3]+"mm<br>"+mpName[4]+":" + arr[4] + "mm<br>"
				+ mpName[5]+':' + arr[5] + "mm</p>",  
				onShow: function(){  
					   $(this).tooltip('tip').className='easyui-tooltip';  
			    } 
			});
	}
	
	function showOtherData(baseId,name,val){
		 $("#" + baseId).tooltip({  
			    position: 'right',  
			    content:  "<h5>"+name+"<h5>"+"<p>"+val + "mm</p>",
				onShow: function(){  
					$(this).tooltip('tip').className='easyui-tooltip';    
			    } 
			});
	}
	
	function to2bits(flt) {
		 if (parseFloat(flt) == flt) {
			return Math.round(flt * 1000.0*10.0)/10.0;
		} else {
			return 0;
		} 
		
	}
	
 	function showMpPic(sData){
 	
 		var posX=sData.tTopo[0].posX;
		var posY=sData.tTopo[0].posY;
		var oldW=sData.tTopo[0].sizeW;
		var oldH=sData.tTopo[0].sizeH;
		var mainPic=$("#p").children('img');

		var nowW=mainPic.width();
		var nowH=mainPic.height();
		var wRate=nowW/oldW;	
		var hRate=nowH/oldH;
		var nowPositon=mainPic.position();
		
		var newPosX=posX*wRate;
		var newPosY=posY*hRate;
		
		var resultPosX=newPosX-posX;
		var resultPosY=newPosY-posY;
 	
		
		for(var i=0;i<sData.mpList.length;i++){
			var newDiv=$('<div class="easyui-draggable"  style="background-color: green;background-size: 16px; width: 16px; height: 16px;background-position:center;background-repeat: no-repeat;"></div>').appendTo('#p');
			var path=sData.mpList[i].type.icon.iconPath;
			var imgId="point_"+sData.mpList[i].id;
			newDiv.attr('id',imgId);   
			newDiv.css("background-image",'url('+path+')'); 
			newDiv.css("position","absolute");
			
			var x1=(sData.mpList[i].drawPosition.x+10)*wRate;
			var y1=(sData.mpList[i].drawPosition.y+10)*hRate;
				x1=x1+resultPosX;
				y1=y1-resultPosY; 
			newDiv.css("left",x1-10+"px");
			newDiv.css("top",y1-10+"px"); 
		}
	} 
	
 	function editDiv(){
 		document.getElementById("editId").style.display="";
 		var divList=$("#p").children('div');
 		for(var i=0;i<divList.length;i++){
 			$('#'+divList[i].id).draggable({});
 			$('#'+divList[i].id).css("background-color","black");
 			document.getElementById(divList[i].id).oncontextmenu=function(event) {
 				var divId=this.id;
			    if (document.all) window.event.returnValue = false;// for IE  
			    else event.preventDefault();  
			    $.messager.confirm('','你确定要删除当前图片?',function(r){  
				    if (r){  
				    	$("#"+divId).remove();
				    	$.ajax({
				    		type:"post",
				    		data:{imgId:divId.split("_")[1]},
				    		url:"topo/deletePic"
				    		
				    	}); 
				    }  
				});
			}; 
			
			//delete sp onclick event 
			    var oncl=$('#'+divList[i].id).attr("onclick");
			  //  alert(oncl!=undefined);
				if(oncl!=undefined){
					$('#'+divList[i].id).removeAttr("onclick");
				}			

 		}
 	}
 	
 	function cancelEdit(){
 		document.getElementById("editId").style.display="none";
 		refreshCurrentPage();
 	  
 	}
 	
 	
 	function refreshCurrentPage(){
 		 var tab = $('#tabs').tabs('getSelected');

  	    $("#tabs").tabs('getTab',{
  	        tab: tab,
  	        options: {

  	            href: 'topo/main'
  	        }
  	    });
  	    tab.panel('refresh');
 	}
</script>

<div style="padding: 5px;  ">
	<a href="#" class="easyui-menubutton"
		data-options="menu:'#mm1',iconCls:'icon-add', disabled:!hasRole('${ROLE_AUTH_EDIT}')">添加</a>  
	<a href="javascript:void(0)" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-save',disabled:!hasRole('${ROLE_AUTH_EDIT}')" onclick="menu.main.saveData()" >保存</a>  
	<a href="javascript:void(0)" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-edit',disabled:!hasRole('${ROLE_AUTH_EDIT}')" onclick="editDiv()">编辑</a>  
	<a id="editId" href="javascript:void(0)" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-cancel',disabled:!hasRole('${ROLE_AUTH_EDIT}')" onclick="cancelEdit()" style="display:none;">取消</a>  
</div>
<div id="mm1" style="width: 150px;">
	<div class="menu-sep"></div>
	<div id="daoru" onclick="addPic()">导入图片</div>
	<div onclick="addMonP()">
		添加测点
	</div>

</div> 


<div id="p" class="easyui-panel" data-options="fit:true"
	>
	<img id="bgimg"   src="resources/custom/images/main.png" width="99%" height="99%" />
</div>

<div id="upId"></div>
<div id="mpId"></div>

<div id="picId"></div>

<!-- <div id="imgMenu" class="easyui-menu" style="width:120px;">    
  <div onclick="delImg(this)">New</div>    
  <div>    
      <span>Open</span>    
      <div style="width:150px;">    
          <div><b>Word</b></div>    
          <div>Excel</div>    
          <div>PowerPoint</div>    
      </div>    
  </div>    
  <div iconCls="icon-save">Save</div>    
  <div class="menu-sep"></div>    
  <div>Exit</div>    
</div>  -->  
<div id="tt"></div>
<div id="promptDiv" class="promptStyle">
        This is prompt div.
    </div>
<script>
	function addPic(){
		       $('#upId').dialog({
		        title: '上传图片',
		        width: 200,
		        height: 150,
		        closed: false,
		        resizable:true,
		        cache: false,
		        href: 'topo/uppload',
		        modal: true
		        }); 
	}
	function addMonP(){
		
		$('#mpId').dialog({
	        title: '添加测点',
	        width: 297,
	        height: 150,
	        closed: false,
	        resizable:true,
	        cache: false,
	        href: 'topo/addMonitorPosition',
	        modal: true
	        }); 
	}
    

	
</script>

