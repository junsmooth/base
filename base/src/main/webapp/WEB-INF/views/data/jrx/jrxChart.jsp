<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	Namespace.register("jrxChart.list", {

		formatJRXTime : function(value) {
			return formatDateTime(value);
		},
		formatJRXPoint : function(value) {
			return value.monitoringName;
		},
		myDate : function(value) {
			//var d = formatDateTime(value);
			return formatDateTime(value);
		}
	});
	
	function Mystr2time(str) {
		var reg = /^(\d+)-(\d{1,2})-(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
		var r = str.match(reg);
		if (r == null)
			return false;
		r[2] = r[2] - 1;
		return new Date(r[1], r[2], r[3], r[4], r[5], r[6]);
	}
	
	
	function jrxHighCharts(result) {
		
			if(result.length==0){
				 alert("您所查日期内无监测数据，请重新选择查询日期");
				 return;
			}
			$('#jrx_chart').highcharts('StockChart', {
						
				chart : {renderTo : 'container'},
						rangeSelector : {
							selected : 1
						},
			
						title : {
							text : '浸润线监测过程曲线'
						},
						yAxis : {
							title : {text : '浸润线(mm)'},
							plotLines : [{value : 0 ,color : 'green',dashStyle : 'shortdash',width : 2,label : {text : '零界线'}}]
						},
						series : [{
							name : '浸润线',
							data : result,
							/* tooltip: {
								valueDecimals: 2
							} */
							tooltip:{yDecimals : 2} 
						}]
					});
    }
	function getChartData(jrxFlag){
		var validFormDate = $("#jrxChart_tb").form('validate');
		if (!validFormDate) {
			return;
		}
				var str1 = '', mp, min1, max1;
				//alert(st=="1");
		if(!jrxFlag=="1"){
			
				mp = $('#jrxChart_monitorPosition').combobox('getValues');
		
				for ( var i = 0; i < mp.length; i++) {
					str1 += mp[i] + ',';
				}
				str1 = str1.substring(0, str1.length - 1);
				//return ;
		
				min1 = $('#jrxChart_min').combobox('getText');
		
				max1 = $('#jrxChart_max').combobox('getText');
		}
		$.ajax({
			type : 'POST',
			url : "jrx/chart/jrxChart",
			data:{min : min1,
				max : max1,
				str : str1,
				flag : jrxFlag},
			success:jrxHighCharts
		});
	}
	
	 
	
	$(document).ready(
		function(){
			
			//1. set inital params startTime, endTime, Point
			var date=new Date(); 
			//new Date(date.getYear(),date.getDate()-7
			$("#jrxChart_min").attr("value",formatDateTime(date));
			//2. query();
			
		}		
	
	);
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="jrxgrid" class="easyui-datagrid"
			data-options="fit:true,toolbar:'#jrxChart_tb'">
			
		</table>
	</div>
</div>
<div id="jrxChart_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='jrxChart_min' class="easyui-datetimebox"
			data-options="formatter:jrxChart.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='jrxChart_max' class="easyui-datetimebox"
			data-options="formatter:jrxChart.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		测点: <input id="jrxChart_monitorPosition" class="easyui-combobox"
			name="jrxChart_monitorPosition"
			data-options="  
                    url:'jrx/data/points',  
                    valueField:'position',  
                    textField:'monitoringName',  
                    multiple:true,  
                    panelHeight:'auto',
                    editable:false  
            "
			readonly="readonly"> <a href="#" class="easyui-linkbutton"
			iconCls="icon-search" onclick="getChartData()">查询</a>
	</div>
		<div id="jrx_chart"></div>
</div>
