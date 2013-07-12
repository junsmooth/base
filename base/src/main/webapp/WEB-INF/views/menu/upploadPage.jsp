<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
	 	<div id="fileQueue"></div>   
        <input type="file" name="file_upload" id="file_upload" />
    </div> 
	

<script>
    	$(function() {
    	    $("#file_upload").uploadify({
    	    	'queueSizeLimit' : 1,
    	        'swf'      : 'resources/uploadify.swf',
    	        'uploader' : 'topo/data',
    	        'folder'   : 'resources/img', 
    	        'fileTypeExts': '*.png',//*.gif; *.jpg; 
    	        'cancelImg'   : 'resources/images/uploadify-cancel.png',
    	        'buttonText'     : '选择图片' ,
    	        'onUploadSuccess' : function(file, data, response) {
    	            alert('图片上传成功!');
    	        }
    	    });
    	});
    
</script>

