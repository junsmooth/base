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

	});
	
</script>
 
<div style="padding: 5px;  ">
	<a href="#" class="easyui-linkbutton" data-options="plain:true">Home</a>
	<a href="#" class="easyui-menubutton"
		data-options="menu:'#mm1',iconCls:'icon-edit'">Edit</a> <a href="#"
		class="easyui-menubutton"
		data-options="menu:'#mm2',iconCls:'icon-help'">Help</a> <a href="#"
		class="easyui-menubutton" data-options="menu:'#mm3'">About</a>
</div>
<div id="mm1" style="width: 150px;">
	<div data-options="iconCls:'icon-undo'">Undo</div>
	<div data-options="iconCls:'icon-redo'">Redo</div>
	<div class="menu-sep"></div>
	<div>Cut</div>
	<div>Copy</div>
	<div>Paste</div>
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
<div id="mm2" style="width: 100px;">
	<div>Help</div>
	<div>Update</div>
	<div>About</div>
</div>
<div id="mm3" class="menu-content"
	style="background: #f0f0f0; padding: 10px; text-align: left">
	<img src="http://www.jeasyui.com/images/logo1.png"
		style="width: 150px; height: 50px">
	<p style="font-size: 14px; color: #444;">Try jQuery EasyUI to build
		your modem, interactive, javascript applications.</p>
</div>


<div id="p" class="easyui-panel" data-options="fit:true"
	>
	<img id="bgimg"   src="resources/custom/images/bg.png" width="99%" height=99%/>
	<div class="easyui-draggable" id="subdiv"
		style="background-color: green; width: 18px; height: 18px; background-image: url(resources/custom/images/cut.png); background-repeat: no-repeat;"></div>

</div>
<script>
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

