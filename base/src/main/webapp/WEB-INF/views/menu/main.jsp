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
		}
		
	});
	
	function reloadPage(){
		 $.dialog.tips("保存成功!");
		 window.location.reload();
	}
	function msgShow(title, msgString, msgType) {
		$.messager.alert(title, msgString, msgType);
	}
	
	function setMpPath(data){
		var path=data[0].icon.iconPath;
	    var imgId;
	    if(data[2].drawPosition!=""&&data[2].drawPosition!=null){
	    	imgId="point_"+data[2].id;
	    	$('#'+imgId).draggable({  
	    		
			});  
	    }else{
	    	
		        var parentdiv=$('<div class="easyui-draggable"  style="background-color: green; width: 20px; height: 20px;background-position:center; background-repeat: no-repeat;"></div>').appendTo('#p');
		    	imgId="point_"+data[2].id;
			   	parentdiv.attr('id',imgId);   
			  	parentdiv.css("background-image",'url('+path+')'); 
				parentdiv.css("position","absolute");
				parentdiv.css("left",518+"px");
				parentdiv.css("top",262+"px"); 
				$('#'+imgId).draggable({  
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
	
	function setData(data){
		
		for(var i=0;i<data.length-1;i++){
			
			var d = data[i];
			var name = d.type.name;
			var val,de,dh,dn;
			var baseId ="point_"+data[i].id;
				if(d.type.code=="BMWY"){
					if(d.mpValue==null){
						de="当前测点没有数值!";
					}else{
						de=to2bits(d.mpValue.dE);
						dh=to2bits(d.mpValue.dH);
						dn=to2bits(d.mpValue.dN);
					}
					showBMWYData(baseId,name,de,dn,dh);
				}else{
					if(d.mpValue==null){
						val="当前测点没有数值!";
					}else{
						val=d.mpValue.value.toFixed(2);
					}
					showOtherData(baseId,name,val);
				}
		}
		var alarmRecord=data[data.length-1];
		 for(var j=0;j<alarmRecord.length;j++){
			
			var alarm = alarmRecord[j];
			var name = alarm.threshold.attr.type.name;
		
			var	val = alarm.warningContent;
			
			//var index = d.position;
		 	var baseId ="point_"+alarm.threshold.point.id;
		
			 $("#" + baseId).css("background-color",alarm.threshold.alarmType.color.code);
			 
			/*   if(alarm.threshold.attr.type.code=="BMWY"){
				 
			 }
			 else{
				 $("#" + baseId).tooltip({  
					    position: 'right',  
					    content:  "<b>"+name+"</b>"+"<br><br>"+"<font color='"+alarm.threshold.alarmType.color.code+"'>"+val+"</font>" + "mm<br>",
						onShow: function(){  
					        $(this).tooltip('tip').css({  
					            backgroundColor: '#FCFFFF',  
					            borderColor: '#000000'  
					        });  
					    } 
					}); 
			 } */
		} 
	}
	
	function showBMWYData(baseId,name,de,dn,dh){
		 $("#" + baseId).tooltip({  
			    position: 'right',  
			    content:  "<b>"+name+"</b>"+"<br><br>"+'横向水平位移:' +de+"mm<br>纵向水平位移:" + dn + "mm<br>"
				+ '竖向位移:' + dh + "mm",  
				onShow: function(){  
			        $(this).tooltip('tip').css({  
			            backgroundColor: '#FCFFFF',  
			            borderColor: '#000000'  
			        });  
			    } 
			});
	}
	
	function showOtherData(baseId,name,val){
		 $("#" + baseId).tooltip({  
			    position: 'right',  
			    content:  "<b>"+name+"</b>"+"<br><br>"+val + "mm<br>",
				onShow: function(){  
			        $(this).tooltip('tip').css({  
			            backgroundColor: '#FCFFFF',  
			            borderColor: '#000000'  
			        });  
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
			var newDiv=$('<div class="easyui-draggable"  style="background-color: green; width: 20px; height: 20px;background-position:center;background-repeat: no-repeat;"></div>').appendTo('#p');
			//var path=sData[i].type.icon.iconPath+'/'+sData[i].type.icon.iconName+sData[i].type.icon.iconExtension;
			var path=sData.mpList[i].type.icon.iconPath;
			//var imgId=sData.mpList[i].type.code+"_"+sData.mpList[i].drawPosition.id+"_"+sData.mpList[i].position;
			var imgId="point_"+sData.mpList[i].id;
			newDiv.attr('id',imgId);   
			newDiv.css("background-image",'url('+path+')'); 
			newDiv.css("position","absolute");
			var x1=(sData.mpList[i].drawPosition.x+10)*wRate;
			var y1=(sData.mpList[i].drawPosition.y+10)*hRate;
				x1=x1+resultPosX;
				y1=y1-resultPosY; 
/* 				x1=(sData.mpList[i].drawPosition.x+10-posX)*wRate+newPosX;
				y1=(sData.mpList[i].drawPosition.y+10-posY)*hRate+newPosY; */
			newDiv.css("left",x1-10+"px");
			newDiv.css("top",y1-10+"px"); 
		}
	} 
	
 	function editDiv(){
 		var divList=$("#p").children('div');
 		for(var i=0;i<divList.length;i++){
 			$('#'+divList[i].id).draggable({});
 		}
 	}
</script>
<div style="padding: 5px;  ">
	<a href="#" class="easyui-menubutton"
		data-options="menu:'#mm1',iconCls:'icon-edit'">工具</a>  
	<a href="javascript:void(0)" class="easyui-linkbutton" plain="true" onclick="menu.main.saveData()" >保存</a>  
	<a href="javascript:void(0)" class="easyui-linkbutton" plain="true" onclick="editDiv()">编辑</a>  
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

