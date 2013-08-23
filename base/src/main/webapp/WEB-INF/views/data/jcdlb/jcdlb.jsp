<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>   
 
 <style type="text/css">
 .item {
		width: auto;
		 /* margin:auto */; 
		  margin-top:10px;
		margin-bottom:10px;
		margin-right:10px;
		margin-left:10px;  
		float: left;
		background: #D8D5D2;
}
</style>
    <script type="text/javascript">
    	$(function (){
    		$.ajax({
    			type:"get",
    			url:"jcdlb/data",
    			success:setData
    		});
    	});
    
    	function formatDiv(){
    		$('#container').masonry({
    		    // options
    		    itemSelector : '.item',
    		    columnWidth : 200,
    		   // isFitWidth:true,// 适应宽度   Boolean
    		     //isResizableL:true// 是否可调整大小 Boolean
    		  });
    	}
    	
    	function setData(data){
    	 	var mpArr=new Array();
    	 	for(var m=0;m<data.length;m++){
    	 		if(document.getElementById("d"+data[m].type.code)==null){
	    	 		var dv=$("<div></div>");
	    	 		dv.addClass("item");
	    	 		dv.attr("id","d"+data[m].type.code);
	    	 		dv.appendTo($("#container"));
	    	 	}
    	 	}
    		for(var i=0;i<data.length;i++){
    			var code=data[i].type.code;
    			var position=data[i].position;
		 		var table=$("#"+code);
   				if(document.getElementById(code)==null){
	    			if(code=="BMWY"){
	    				var header=new Array();
	    				header[0]=data[i].type.name;
	    				for(var k=0;k<data[i].mpValue.obj.length;k++){
	    					
	    					header[k+1]=(data[i].mpValue.obj)[k].name;
	    				}
    					createTable(code,header);
    				}else {
        					var header=[data[i].type.name,'监测值'];
        					createTable(data[i].type.code,header);
   					}
   				}
    		} 
    		
    		for(var j=0;j<data.length;j++){
    			//alert(data.length);
    			var code=data[j].type.code;
    			var position=data[j].position;
    			 var table=$("#"+code);
   					if(code=="BMWY"){
   	    					addBMWYRow(table,data[j].mpValue,position);
   					}else{
   							addRow(table,data[j].mpValue.value,position);
   					}
    		}
      		formatDiv();
    	}
    	
    	function addRow(table,value,position){
    		var tr=$("<tr></tr>");
    		tr.appendTo(table);
    		var postionValue=$("<td>"+position+"</td>");
    		postionValue.appendTo(tr);
    		var dataValue=$("<td>"+value+"</td>");
    		dataValue.appendTo(tr);
    	}
    	
    	function addBMWYRow(tab,bmwyData,position){
    		var tr=$("<tr></tr>");
    		tr.appendTo(tab);
    			$("<td>"+position+"</td>").appendTo(tr);
    			$("<td>"+(bmwyData.dN*1000).toFixed(2)+"</td>").appendTo(tr);
    			$("<td>"+(bmwyData.dE*1000).toFixed(2)+"</td>").appendTo(tr);
    			$("<td>"+(bmwyData.dH*1000).toFixed(2)+"</td>").appendTo(tr);
    			$("<td>"+(bmwyData.dDN*1000).toFixed(2)+"</td>").appendTo(tr);
    			$("<td>"+(bmwyData.dDE*1000).toFixed(2)+"</td>").appendTo(tr);
    			$("<td>"+(bmwyData.dDH*1000).toFixed(2)+"</td>").appendTo(tr);
    	}
    	function createTable(name,header){
    		var table=$("<table border='1'></table>");
    		var tr=$("<tr height='10'></tr>");
    		tr.appendTo(table);
    		for(var i=0;i<header.length;i++){
    			var td=$("<td width='116'>"+header[i]+"</td>");
    			td.appendTo(tr);
    		}
    		table.attr("id",name);
			table.appendTo($("#d"+name));
    	}
    </script>
    
    
    <div id="container" style="margin: 0 auto;"></div> 
  
    
