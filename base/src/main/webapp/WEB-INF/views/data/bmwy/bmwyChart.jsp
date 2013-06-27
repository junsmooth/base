<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	Namespace.register("bmwyChart.list", {

		myDate : function(value) {
			return formatDateTime(value);
		},
		initToolBarValue:function(){
			var date=new Date(); 
			var oldDate=new Date(date.getTime()-7*24*60*60*1000);
			$("#bmwyChart_max").attr("value",formatDateTime(date));  
			$("#bmwyChart_min").attr("value",formatDateTime(oldDate));
			getChartData();
		},
		change_min:function(){
			var minv=$("#bmwyChart_min").datetimebox('getValue');
			$("#bmwyChart_min").attr("value",minv);
		},
		change_max:function(){
			var maxv=$("#bmwyChart_max").datetimebox('getValue');
			$("#bmwyChart_max").attr("value",maxv);
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
	
	function  checkTime(min1,max1){
		var regEx = new RegExp("\\-","gi");
	    min1=min1.replace(regEx,"/");
		max1=max1.replace(regEx,"/");
		var value =new Date(max1).getTime()-new Date(min1).getTime()-365*24*60*60*1000;
		return value;
	};
	function bmwyHighCharts(result) {
		
			if(result.length==0){
				 alert("您所查日期内无监测数据，请重新选择查询日期");
				 return;
			}
			$('#bmwy_chart').highcharts('StockChart', {
						
				chart : {renderTo : 'container'},
						rangeSelector : {
							selected : 1
						},
			
						title : {
							text : '表面位移监测过程曲线'
						},
						yAxis : {
							title : {text : '表面位移(mm)'},
							plotLines : [{value : 0 ,color : 'green',dashStyle : 'shortdash',width : 2,label : {text : '零界线'}}]
						},
						series : [{
							name : '表面位移',
							data : result,
							/* tooltip: {
								valueDecimals: 2
							} */
							tooltip:{yDecimals : 2} 
						}]
					});
    }
	function getChartData(){
		var validFormDate = $("#bmwyChart_tb").form('validate');
		if (!validFormDate) {
			return;
		}
				var str1 = '', mp, min1, max1;
			
				mp = $('#bmwyChart_monitorPosition').combobox('getValues');
				 for ( var i = 0; i < mp.length; i++) {
					str1 += mp[i] + ',';
				} 
				str1 = str1.substring(0, str1.length - 1);
				min1=$('#bmwyChart_min').val();	
			    max1 = $('#bmwyChart_max').val();
			    var value= checkTime(min1,max1);
			   if(value>0){
					alert("【查询时间超过一年,请重新输入！】");
					return;
				} 
				
	 	$.ajax({
			type : 'POST',
			url : "bmwy/chart/bmwyChart",
			data:{min : min1,
				max : max1,
				str : str1
				},
			success:bmwyHighCharts
		}); 
	}
	
	
	
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="bmwyId" class="easyui-datagrid"
			data-options="fit:true,toolbar:'#bmwyChart_tb'">
			
		</table>
	</div>
</div>
<div id="bmwyChart_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='bmwyChart_min' class="easyui-datetimebox"
			data-options="onChange:bmwyChart.list.change_min,formatter:bmwyChart.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='bmwyChart_max' class="easyui-datetimebox"
			data-options="onChange:bmwyChart.list.change_max,formatter:bmwyChart.list.myDate,
						  validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'
			
			"></input>
		测点: <input id="bmwyChart_monitorPosition" class="easyui-combobox"
			name="bmwyChart_monitorPosition"
			data-options="  
                    url:'bmwy/data/points',  
                    valueField:'position',  
                    textField:'monitoringName',  
                    panelHeight:'auto',
                    editable:false,
                    value:1,
                    multiple:false,
                    onLoadSuccess:bmwyChart.list.initToolBarValue
            "
			readonly="readonly"/>
			方位: <input id="bmwyChart_monitorPosition" class="easyui-combobox"
			name="bmwyChart_monitorPosition"
			data-options="  
                    url:'bmwy/data/directions', 
                    valueField:'id',   
                    textField:'directionName',  
                    panelHeight:'auto',
                    editable:false,
                    multiple:false
                 
            "
			readonly="readonly"/> <a href="#" class="easyui-linkbutton"
			iconCls="icon-search" onclick="getChartData()">查询</a>
	</div>
		<div id="bmwy_chart"></div>
</div>
