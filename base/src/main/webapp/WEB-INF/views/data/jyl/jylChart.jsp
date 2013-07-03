<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	Namespace.register("jylChart.list", {

		myDate : function(value) {
			return formatDateTime(value);
		},
		initToolBarValue:function(value){
			var date=new Date(); 
			var oldDate=new Date(date.getTime()-7*24*60*60*1000);
			$("#jylChart_max").attr("value",formatDateTime(date));  
			$("#jylChart_min").attr("value",formatDateTime(oldDate));
			if(value==''){
				return;
			}
			if(value.length>0){
				$("#jylChart_monitorPosition").combobox("setValue",value[0].position);
			}
			jylChart.list.getChartData();
		},
		change_min:function(){
			var minv=$("#jylChart_min").datetimebox('getValue');
			$("#jylChart_min").attr("value",minv);
		},
		change_max:function(){
			var maxv=$("#jylChart_max").datetimebox('getValue');
			$("#jylChart_max").attr("value",maxv);
		},
		getChartData:function(flag){
			//alert("flag:"+flag+typeof flag);
			var validFormDate = $("#jylChart_tb").form('validate');
			if (!validFormDate) {
				return;
			}
					var str1 = '', mp, min1, max1;
				
					mp = $('#jylChart_monitorPosition').combobox('getValues');
					 for ( var i = 0; i < mp.length; i++) {
						str1 += mp[i] + ',';
					} 
					str1 = str1.substring(0, str1.length - 1);
					min1=$('#jylChart_min').val();	
				    max1 = $('#jylChart_max').val();
				    var timeValue= checkTime(min1,max1);
				    if(timeValue>0){
						 $.dialog.tips("查询时间超过一年,请重新输入！",1,'error.gif');
						return;
					} 
			if(flag==true){
				jylHistogramRequest(min1,max1,str1);
			}else{
				
				jylChartRequest(min1,max1,str1);
			}
		 	
		}
		
	});
	
	function jylChartRequest(min1,max1,str1){
		$.ajax({
			type : 'POST',
			url : "jyl/chart/jylChart",
			data:{min : min1,
				max : max1,
				str : str1
				},
			success:jylHighCharts
		}); 
	}
	
	function jylHistogramRequest(min1,max1,str1){
		$.ajax({
			type : 'POST',
			url : "jyl/chart/jylHistogram",
			data:{min : min1,
				max : max1,
				str : str1
				},
			success:jylHistogram
		}); 
	}
	function Mystr2time(str) {
		var reg = /^(\d+)-(\d{1,2})-(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
		var r = str.match(reg);
		if (r == null)
			return false;
		r[2] = r[2] - 1;
		return new Date(r[1], r[2], r[3], r[4], r[5], r[6]);
	}
	
	function  checkTime(min1,max1){
		var regEx = new RegExp("\\-","gi");
	    min1=min1.replace(regEx,"/");
		max1=max1.replace(regEx,"/");
		var value =new Date(max1).getTime()-new Date(min1).getTime()-365*24*60*60*1000;
		return value;
	};
	function jylHighCharts(result) {
		
			if(result.length==0){
				 $.dialog.tips("您所查日期内无监测数据，请重新选择查询日期",1,'error.gif');
				 return;
			}
	          //Highcharts.setOptions({global:{useUTC : false}});
			$('#ksw_chart').highcharts('StockChart', {
				
				chart : {renderTo : 'container'},
						rangeSelector : {
							selected : 1
						},
			
						title : {
							text : '降雨量监测过程曲线'
						}, global: {
	                        useUTC: false
	                    },
						yAxis : {
							title : {text : '降雨量(mm)'},
							plotLines : [{value : 0 ,color : 'green',dashStyle : 'shortdash',width : 2,label : {text : '零界线'}}]
						},
						series : [{
							name : '降雨量',
							data : result,
							/* tooltip: {
								valueDecimals: 2
							} */
							tooltip:{yDecimals : 2} 
						}]
					});
    }
	function jylHistogram(result) {
		if(result.length==0){
			 $.dialog.tips("您所查日期内无监测数据，请重新选择查询日期",1,'error.gif');
			 return;
		}
	//	 Highcharts.setOptions({global:{useUTC : false}});
		$('#ksw_chart').highcharts('StockChart', {
			 chart: {
			        alignTicks: false
			    },

			    rangeSelector: {
			        selected: 1
			    },

			    title: {
			        text: '日降雨量统计图'
			    },
			    global: {
                    useUTC: false
                },
			    series: [{
			        type: 'column',
			        name: '日降雨量',
			        data: result,
			        dataGrouping: {
						units: [[
							'week', // unit name
							[1] // allowed multiples
						], [
							'month',
							[1, 2, 3, 4, 6]
						]]
			        }
			    }]
			});
}
	

</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="kswId" class="easyui-datagrid"
			data-options="fit:true,toolbar:'#jylChart_tb'">
			
		</table>
	</div>
</div>
<div id="jylChart_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='jylChart_min' class="easyui-datetimebox"
			data-options="onChange:jylChart.list.change_min,formatter:jylChart.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='jylChart_max' class="easyui-datetimebox"
			data-options="onChange:jylChart.list.change_max,formatter:jylChart.list.myDate,
						  validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'
			
			"></input>
		测点: <input id="jylChart_monitorPosition" class="easyui-combobox"
			name="jylChart_monitorPosition"
			data-options="  
                    url:'jyl/data/points',  
                    valueField:'position',  
                    textField:'monitoringName',  
                    panelHeight:'auto',
                    editable:false,
                    multiple:false,
                    readonly:false,
                    onLoadSuccess:jylChart.list.initToolBarValue
            "
			> <a href="#" class="easyui-linkbutton" plain="true"
			iconCls="icon-search" onclick="jylChart.list.getChartData()">降雨量查询</a>
			|
			<a href="#" class="easyui-linkbutton"
			 plain="true" iconCls="icon-search" onclick="jylChart.list.getChartData(true)">日降雨量统计</a>
	</div>
		<div id="ksw_chart"></div>
</div>
