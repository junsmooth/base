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
	<a href="#" class="easyui-menubutton"
		data-options="menu:'#mm1',iconCls:'icon-edit'">工具</a>  
</div>
<div id="mm1" style="width: 150px;">
	<div class="menu-sep"></div>
	<!--  <div id="up">
	 	<div id="fileQueue"></div>   
        <input type="file" name="file_upload" id="file_upload" />
		<a href="" onclick="start()">开始上传</a>
		|<a href="javascript:$('#file_upload').uploadify('cancel', '*')">取消上传</a> 
    </div> -->
	<div id="daoru" onclick="addPic()"><a>导入图片</a></div>
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



<div id="p" class="easyui-panel" data-options="fit:true"
	>
	<img id="bgimg"   src="resources/custom/images/bg.png" width="99%" height=99%/>
	<div class="easyui-draggable" id="subdiv"
		style="background-color: green; width: 18px; height: 18px; background-image: url(resources/custom/images/cut.png); background-repeat: no-repeat;"></div>

</div>

<script>

	function addPic(){
		       $('#daoru').dialog({
		        title: '增加菜单',
		        width: 600,
		        height: 300,
		        closed: false,
		        resizable:true,
		        cache: false,
		        href: 'menu/uppload',
		        modal: true
		        }); 
		      
	}

    	$(function() {
    	    $("#file_upload").uploadify({
    	    	'queueSizeLimit' : 1,
    	        'auto'     : true,
    	        'swf'      : 'resources/uploadify.swf',
    	        'uploader' : 'topo/data',
    	        'folder'   : 'resources/img', 
    	        'fileTypeExts': '*.gif; *.jpg; *.png',
    	        'cancelImg'   : 'resources/images/uploadify-cancel.png',
    	        'buttonText'     : '选择图片' ,
    	        'onUploadSuccess' : function(file, data, response) {
    	            alert('文件 ' + file.name + ' 上传成功 ' + response + ':' + data);
    	        }
    	    });
    	});
    
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

