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
				var sId=divList[i].id;
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
	    	imgId=data[0].code+"_"+data[2].drawPosition.id+"_"+data[1];
	    /* 	parentdiv.attr('id',imgId);   
	    	parentdiv.css("background-image",'url('+path+')'); 
	    	parentdiv.css("position","absolute");
	    	parentdiv.css("left",data[2].drawPosition.x+"px");
	    	parentdiv.css("top",data[2].drawPosition.y+"px"); 
	    	alert("imgId--"+imgId+"--"); */
	    	$('#'+imgId).draggable({  
	    		
			});  
	    }else{
	        var parentdiv=$('<div class="easyui-draggable" ondblclick="menu.main.confirm(this)" style="background-color: white; width: 20px; height: 20px;  background-repeat: no-repeat;"></div>').appendTo('#p');
	    	imgId=data[0].code+"_"+data[1];
		   	parentdiv.attr('id',imgId);   
		  	parentdiv.css("background-image",'url('+path+')'); 
			parentdiv.css("position","absolute");
			parentdiv.css("left",518+"px");
			parentdiv.css("top",262+"px"); 
			$('#'+imgId).draggable({  
			});  
	    }
	    //alert("imgId: "+imgId);
	
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
		
		var bmwyArr=data.BMWY;
		var alarmRecord=data.ALARM;
		for(var i=0;i<bmwyArr.length;i++){
			var d = bmwyArr[i];
			var name = d.type.name;
			var dn;
			var de;
			var dh;
			if(d.latestValue==null){
				de="当前测点无数据!";
			}else{
					
				 dn = to2bits(d.latestValue[0].dn);
				 de = to2bits(d.latestValue[0].de);
				 dh = to2bits(d.latestValue[0].dh);
			}
			
			var index = d.position;
			var baseId =d.type.code+"_"+d.drawPosition.id+"_"+d.position;
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
		
		var jrxArr=data.JRX;
		for(var i=0;i<jrxArr.length;i++){
			var d = jrxArr[i];
			var name = d.type.name;
			var val;
			if(d.latestValue==null){
				val="当前测点无数据!";
			}else{
				val = d.latestValue[0].value.toFixed(2);
			}
			var index = d.position;
			var baseId =d.type.code+"_"+d.drawPosition.id+"_"+d.position;
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
		
		var gtgcArr=data.GTGC;
		for(var i=0;i<gtgcArr.length;i++){
			var d = gtgcArr[i];
			var name = d.type.name;
			var val;
			if(d.latestValue==null){
				val="当前测点无数据!";
			}else{
				val = d.latestValue[0].value.toFixed(2);
			}
			var index = d.position;
			var baseId =d.type.code+"_"+d.drawPosition.id+"_"+d.position;
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
		
		var gtcdArr=data.GTCD;
		for(var i=0;i<gtcdArr.length;i++){
			var d = gtcdArr[i];
			var name = d.type.name;
			var val;
			if(d.latestValue==null){
				val="当前测点无数据!";
			}else{
				val = d.latestValue[0].value.toFixed(2);
			}
			var index = d.position;
			var baseId =d.type.code+"_"+d.drawPosition.id+"_"+d.position;
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
		
		var kswArr=data.KSW;
		for(var i=0;i<kswArr.length;i++){
			var d = kswArr[i];
			var name = d.type.name;
			var val;
			if(d.latestValue==null){
				val="当前测点无数据!";
			}else{
				val = d.latestValue[0].value.toFixed(2);
			}
			var index = d.position;
			var baseId =d.type.code+"_"+d.drawPosition.id+"_"+d.position;
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
		
		var jylArr=data.JYL;
		for(var i=0;i<jylArr.length;i++){
			var d = jylArr[i];
			var name = d.type.name;
			var val;
			if(d.latestValue==null){
				val="当前测点无数据!";
			}else{
				val = d.latestValue[0].value.toFixed(2);
			}
			var index = d.position;
			var baseId =d.type.code+"_"+d.drawPosition.id+"_"+d.position;
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
		
		var aqcgArr=data.AQCG;
		for(var i=0;i<aqcgArr.length;i++){
			var d = aqcgArr[i];
			var name = d.type.name;
			var val;
			if(d.latestValue==null){
				val="当前测点无数据!";
			}else{
				val = d.latestValue[0].value.toFixed(2);
			}
			var index = d.position;
			var baseId =d.type.code+"_"+d.drawPosition.id+"_"+d.position;
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
		var bdgcArr=data.BDGC;
		for(var i=0;i<bdgcArr.length;i++){
			var d = bdgcArr[i];
			var name = d.type.name;
			var val;
			if(d.latestValue==null){
				val="当前测点无数据!";
			}else{
				val = d.latestValue[0].value.toFixed(2);
			}
			var index = d.position;
			var baseId =d.type.code+"_"+d.drawPosition.id+"_"+d.position;
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
		
		var sllArr=data.SLL;
		for(var i=0;i<sllArr.length;i++){
			var d = sllArr[i];
			var name = d.type.name;
			var val;
			if(d.latestValue==null){
				val="当前测点无数据!";
			}else{
				val = d.latestValue[0].value.toFixed(2);
			}
			var index = d.position;
			var baseId =d.type.code+"_"+d.drawPosition.id+"_"+d.position;
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
		
		var nbwyArr=data.NBWY;
		for(var i=0;i<nbwyArr.length;i++){
			var d = nbwyArr[i];
			var name = d.type.name;
			var val;
			if(d.latestValue==null){
				val="当前测点无数据!";
			}else{
				val = d.latestValue[0].value;
			}
			var index = d.position;
			var baseId =d.type.code+"_"+d.drawPosition.id+"_"+d.position;
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
		
		for(var j=0;j<alarmRecord.length;j++){
			
			var d = alarmRecord[j];
			var name = d.threshold.attr.type.name;
		
			var	val = d.warningContent;
			
			//var index = d.position;
		 	var baseId =d.threshold.point.type.code+"_"+d.threshold.point.drawPosition.id+"_"+d.threshold.point.position;
		
			 $("#" + baseId).css("background-color",d.threshold.alarmType.color.code);
		}
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
		
		var newPosX=mainPic.position().left*wRate;
		var newPosY=mainPic.position().top*hRate;
		
		var resultPosX=newPosX-posX;
		var resultPosY=newPosY-posY;
 	
		for(var i=0;i<sData.mpList.length;i++){
			var newDiv=$('<div class="easyui-draggable"  style="background-color: green; width: 20px; height: 20px;  background-repeat: no-repeat;"></div>').appendTo('#p');
			//var path=sData[i].type.icon.iconPath+'/'+sData[i].type.icon.iconName+sData[i].type.icon.iconExtension;
			var path=sData.mpList[i].type.icon.iconPath;
			var imgId=sData.mpList[i].type.code+"_"+sData.mpList[i].drawPosition.id+"_"+sData.mpList[i].position;
			newDiv.attr('id',imgId);   
			newDiv.css("background-image",'url('+path+')'); 
			newDiv.css("position","absolute");
			var x1=sData.mpList[i].drawPosition.x*wRate;
			var y1=sData.mpList[i].drawPosition.y*hRate;
				x1=x1+resultPosX;
				y1=y1-resultPosY;
			newDiv.css("left",x1+"px");
			newDiv.css("top",y1+"px"); 
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

