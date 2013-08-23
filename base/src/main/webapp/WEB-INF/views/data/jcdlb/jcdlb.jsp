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
		/* background: #D8D5D2; */
}

.item table {
	max-width: 100%;
}
</style>
    <script type="text/javascript">
    	$(function (){
    		iniData();
    		setTimeout(refreshJCDLBPage, 20000);
    	});
    
    	function refreshJCDLBPage() {
    		
    		$.ajax({
    			type:"get",
    			url:"jcdlb/data",
    			success:setValue
    		});
    	}
    	function setValue(result){
    		
    		for(var i=0;i<result.length;i++){
    					var name=result[i].type.code;
    					var tid=$("#"+name);
    					var childArr=$("#"+name+" tr");
    					//alert(childArr.length);
    				 	 for(var j=1;j<childArr.length;j++){
    						
    						$(childArr[j]).remove();
    					}  
	    				//tid.children().remove();
    		} 
    	 	
    		for(var k=0;k<result.length;k++){
    			var name=result[k].type.code;
    			var tid=$("#"+name);
    			var mpName=result[k].monitoringName;
    			var name=result[k].type.code;
    			if(name=='BMWY'){
    				addBMWYRow(tid,result[k].mpValue,mpName);
    			}else{
    					var v=result[k].mpValue;
						var value=null;
						if(v!==null){
							value=result[k].mpValue.value;
						}
						addRow(tid,value,mpName);
    			}
    		} 
    		
    		setTimeout(refreshJCDLBPage, 20000);
    	}
    	function iniData(){
    		$.ajax({
    			type:"get",
    			url:"jcdlb/data",
    			success:setData
    		});
    	}

    	function formatDiv(){
    		$('#container').masonry({
    		    // options
    		    itemSelector : '.item',
    		    columnWidth : 100,
    		    gutterWidth  :10,
    		    isFitWidth:true,// 适应宽度   Boolean
    		     isResizableL:true,// 是否可调整大小 Boolean
    		     isAnimated: true
    		  });
    	}
    	  function getRandomColor() {
  		    var letters = 'ABCDEF'.split('');
  		    var color = '#';
  		    for (var i=0;i<6;i++) {
  		      color += letters[Math.round(Math.random() * 5)];
  		    }
  		    return color;
  		  }
    	
    	function setData(data){
    	 	var mpArr=new Array();
    	 	for(var m=0;m<data.length;m++){
    	 		if(document.getElementById("d"+data[m].type.code)==null){
	    	 		var dv=$("<div></div>");
	    	 		dv.addClass("item");
	    	 		dv.css("background",getRandomColor());
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
    			var mpName=data[j].monitoringName;
    			 var table=$("#"+code);
   					if(code=="BMWY"){
   	    					addBMWYRow(table,data[j].mpValue,mpName);
   					}else{
   							var v=data[j].mpValue;
   							var value=null;
   							if(v!==null){
   								value=data[j].mpValue.value;
   							}
   							addRow(table,value,mpName);
   					}
    		}
      		formatDiv();
    	}
    	

    	function addRow(table,value,mpName){
    		var tr=$("<tr></tr>");
    		tr.appendTo(table);
    		var postionValue=$("<td>"+mpName+"</td>");
    		postionValue.appendTo(tr);
    		var dataValue=$("<td>"+value+"</td>");
    		dataValue.appendTo(tr);
    	}
    	
    	function addBMWYRow(tab,bmwyData,mpName){
    		var tr=$("<tr></tr>");
    		tr.appendTo(tab);
    			$("<td>"+mpName+"</td>").appendTo(tr);
    			$("<td>"+(bmwyData.dN*1000).toFixed(2)+"</td>").appendTo(tr);
    			$("<td>"+(bmwyData.dE*1000).toFixed(2)+"</td>").appendTo(tr);
    			$("<td>"+(bmwyData.dH*1000).toFixed(2)+"</td>").appendTo(tr);
    			$("<td>"+(bmwyData.dDN*1000).toFixed(2)+"</td>").appendTo(tr);
    			$("<td>"+(bmwyData.dDE*1000).toFixed(2)+"</td>").appendTo(tr);
    			$("<td>"+(bmwyData.dDH*1000).toFixed(2)+"</td>").appendTo(tr);
    	}
    	function createTable(name,header){
    		var table=$("<table border='1' cellspacing='0px'></table>");
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
    
    
    <div id="container" style="margin:10px 5px 15px 10px;padding: 20px;"></div> 
  
    
