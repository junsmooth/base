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
		
		addPoint:function(value){
			//alert("success!");
			$.ajax({
				type : 'POST',
				url:"menu/mpPath",
				data:{v:value},
				success:setMpPath
			}); 
		},
		closeDialog:function(){
			$('#mpId').dialog('close');
		}
		
	});
	
	function setMpPath(data){
		var path=data[0].icon.iconPath+'/'+data[0].icon.iconName+data[0].icon.iconExtension;
	    var parentdiv=$('<div class="easyui-draggable" style="background-color: green; width: 20px; height: 20px;  background-repeat: no-repeat;"></div>').appendTo('#p');        
	     
	   	parentdiv.attr('id',data[0].code+data[0].id);   
	     
	  	parentdiv.css("background-image",'url('+path+')'); 
		parentdiv.css("position","absolute");
		parentdiv.css("left",x+"px");
		parentdiv.css("top",y+"px"); 
		$('#'+data[0].code+data[0].id).draggable({  
		   // handle:'#title'  
		});  
	  	menu.main.closeDialog();
	  	
	}

</script>
<div style="padding: 5px;  ">
	<a href="#" class="easyui-menubutton"
		data-options="menu:'#mm1',iconCls:'icon-edit'">工具</a>  
</div>
<div id="mm1" style="width: 150px;">
	<div class="menu-sep"></div>
	<div id="daoru" onclick="addPic()">导入图片</div>
	<div onclick="addMonP()">
		添加测点
	</div>
	<div class="menu-sep"></div>
	<div>
		<span>Toolbar</span>
		<div style="width: 150px;">
			<div>Address</div>
			<div>Link</div>
			<div>Navigation Toolbar</div>
			<div>Bookmark Toolbar</div>
			<div class="menu-sep"></div>
			<div>New Toolbar...</div>
		</div>
	</div>
	<div data-options="iconCls:'icon-remove'">Delete</div>
	<div>Select All</div>
</div> 



<div id="p" class="easyui-panel" data-options="fit:true"
	>
	<img id="bgimg"   src="resources/custom/images/bg.png" width="99%" height=99%/>
	<div class="easyui-draggable" id="subdiv"
		style="background-color: green; width: 18px; height: 18px; background-image: url(resources/custom/images/pie.png); background-repeat: no-repeat;"></div>
	
	
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
		        href: 'menu/uppload',
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
	        href: 'menu/addMonitorPosition',
	        modal: true
	        }); 
	}
    
	$("#bgimg").click(function(e){
		console.log($("#bgimg").width()+","+$("#bgimg").height());
		 p=$("#bgimg").position();
		 console.log("px="+p.left+",py="+p.top);
	})
	
	$("#subdiv").click(function(e){
		
		console.log("x="+e.pageX+",y="+e.pageY);
		 x=$("#subdiv").offset();
		 console.log("ofx="+x.left+",ofy="+x.top);
		
		 p=$("#subdiv").position();
		 console.log("px="+p.left+",py="+p.top);
	})
	
	//1. image position, size
	//2.resize image, postion ,size
	//3.calcute new position
	
	
	
	//$("#bgimg").width(1122);
	x=711;
	x=643;
	y=187;
	y=160.7;
	sx=1091;
	sy=269;
	sx1=$("#tabs").width();
	sy1=$("#tabs").height();
	//x=710*sx1/1091;
	//y=147*sy1/269;
	 $("#subdiv").css("position","absolute");
	$("#subdiv").css("left",x+"px");
	$("#subdiv").css("top",y+"px");
	
	
	
</script>

