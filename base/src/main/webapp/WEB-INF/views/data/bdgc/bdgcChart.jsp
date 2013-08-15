<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	Namespace.register("bdgcChart.list", {

		myDate : function(value) {
			return formatDateTime(value);
		},
		initToolBarValue:function(value){
			var date=new Date(); 
			var oldDate=new Date(date.getTime()-7*24*60*60*1000);
			$("#bdgcChart_max").attr("value",formatDateTime(date));  
			$("#bdgcChart_min").attr("value",formatDateTime(oldDate));
			if(value==''){
				return;
			}
			if(value.length>0){
				$("#bdgcChart_monitorPosition").combobox("setValue",value[0].position);
			}
			bdgcChart.list.getChartData();
		},
		change_min:function(){
			var minv=$("#bdgcChart_min").datetimebox('getValue');
			$("#bdgcChart_min").attr("value",minv);
		},
		change_max:function(){
			var maxv=$("#bdgcChart_max").datetimebox('getValue');
			$("#bdgcChart_max").attr("value",maxv);
		},
		getChartData:function(){
			var validFormDate = $("#bdgcChart_tb").form('validate');
			if (!validFormDate) {
				return;
			}
					var str1 = '', mp, min1, max1;
				
					mp = $('#bdgcChart_monitorPosition').combobox('getValue');
					min1=$('#bdgcChart_min').val();	
				    max1 = $('#bdgcChart_max').val();
				    var timeValue= checkTime(min1,max1);
/* 
				    if(timeValue>0){
						 $.dialog.tips("查询时间超过一年,请重新输入！",1,'error.gif');
						return;
					}  */
		 	$.ajax({
				type : 'POST',
				url : "bdgc/chart/bdgcChart",
				data:{min : min1,
					max : max1,
					str : mp
					},
				success:bdgcHighCharts
			}); 
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
	function bdgcHighCharts(result) {
		

		if (result.length == 0) {
			$.dialog.tips("您所查日期内无监测数据，请重新选择查询日期");
			return;
		}
			$('#bdgc_chart').highcharts('StockChart', {
						
				chart : {renderTo : 'container'},
						rangeSelector : {
							selected : 1
						},
			
						title : {
							text : '坝顶高程监测过程曲线'
						},
						yAxis : {
							title : {text : '坝顶高程(mm)'},
							plotLines : [{value : 0 ,color : 'green',dashStyle : 'shortdash',width : 2,label : {text : '零界线'}}]
						},
						series : [{
							name : '坝顶高程',
							data : result,
							/* tooltip: {
								valueDecimals: 2
							} */
							tooltip:{yDecimals : 2} 
						}]
					});
    }

	
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="bdgcId" class="easyui-datagrid"
			data-options="fit:true,toolbar:'#bdgcChart_tb'">
			
		</table>
	</div>
</div>
<div id="bdgcChart_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='bdgcChart_min' class="easyui-datetimebox"
			data-options="onChange:bdgcChart.list.change_min,formatter:bdgcChart.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='bdgcChart_max' class="easyui-datetimebox"
			data-options="onChange:bdgcChart.list.change_max,formatter:bdgcChart.list.myDate,
						  validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'
			
			"></input>
		测点: <input id="bdgcChart_monitorPosition" class="easyui-combobox"
			name="bdgcChart_monitorPosition"
			data-options="  
                    url:'bdgc/data/points',  
                    valueField:'position',  
                    textField:'monitoringName',  
                    panelHeight:'auto',
                    editable:false,
                    multiple:false,
                    readonly:false,
                    onLoadSuccess:bdgcChart.list.initToolBarValue
            "
			> <a href="#" class="easyui-linkbutton"
			iconCls="icon-search" onclick="bdgcChart.list.getChartData()">查询</a>
	</div>
		<div id="bdgc_chart"></div>
</div>
