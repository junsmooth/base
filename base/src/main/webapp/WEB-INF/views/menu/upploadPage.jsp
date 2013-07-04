<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="up">
	 	<div id="fileQueue"></div>   
        <input type="file" name="file_upload" id="file_upload" />
		<a href="" onclick="start()">开始上传</a>
		|<a href="javascript:$('#file_upload').uploadify('cancel', '*')">取消上传</a> 
    </div> 
	

<script>

	
    	$(function() {
    	    $("#file_upload").uploadify({
    	    	'queueSizeLimit' : 1,
    	        
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
    
</script>

