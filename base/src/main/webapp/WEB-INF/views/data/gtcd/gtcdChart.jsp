<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	Namespace.register("gtcdChart.list", {

		myDate : function(value) {
			return formatDateTime(value);
		},
		initToolBarValue : function(value) {
			var date = new Date();
			var oldDate = new Date(date.getTime() - 7 * 24 * 60 * 60 * 1000);
			$("#gtcdChart_max").attr("value", formatDateTime(date));
			$("#gtcdChart_min").attr("value", formatDateTime(oldDate));
			if (value == '') {
				return;
			}
			if (value.length > 0) {
				$("#gtcdChart_monitorPosition").combobox("setValue",
						value[0].position);
			}
			gtcdChart.list.getChartData();
		},
		change_min : function() {
			var minv = $("#gtcdChart_min").datetimebox('getValue');
			$("#gtcdChart_min").attr("value", minv);
		},
		change_max : function() {
			var maxv = $("#gtcdChart_max").datetimebox('getValue');
			$("#gtcdChart_max").attr("value", maxv);
		},
		getChartData : function() {
			var validFormDate = $("#gtcdChart_tb").form('validate');
			if (!validFormDate) {
				return;
			}
			var mp, min1, max1;

			mp = $('#gtcdChart_monitorPosition').combobox('getValue');

			min1 = $('#gtcdChart_min').val();
			max1 = $('#gtcdChart_max').val();
			var timeValue = checkTime(min1, max1);
			/* if(timeValue>0){
				 $.dialog.tips("查询时间超过一年,请重新输入！",1,'error.gif');
				return;
			}  */

			$.ajax({
				type : 'POST',
				url : "gtcd/chart/gtcdChart",
				data : {
					min : min1,
					max : max1,
					str : mp
				},
				success : gtcdHighCharts
			});
		}
	});

	function checkTime(min1, max1) {
		var regEx = new RegExp("\\-", "gi");
		min1 = min1.replace(regEx, "/");
		max1 = max1.replace(regEx, "/");
		var value = new Date(max1).getTime() - new Date(min1).getTime() - 365
				* 24 * 60 * 60 * 1000;
		return value;
	};
	function gtcdHighCharts(result) {

		if (result.length == 0) {
			$.dialog.tips("您所查日期内无监测数据，请重新选择查询日期");
			return;
		}
		$('#gtcd_chart').highcharts('StockChart', {
			title : {
				text : '干滩长度监测过程曲线'
			},
			yAxis : {
				title : {
					text : '干滩长度(m)'
				}
			},
			series : [ {
				name : '干滩长度',
				data : result
			} ]
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="jrxgrid" class="easyui-datagrid"
			data-options="fit:true,toolbar:'#gtcdChart_tb'">

		</table>
	</div>
</div>
<div id="gtcdChart_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='gtcdChart_min' class="easyui-datetimebox"
			data-options="onChange:gtcdChart.list.change_min,formatter:gtcdChart.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='gtcdChart_max' class="easyui-datetimebox"
			data-options="onChange:gtcdChart.list.change_max,formatter:gtcdChart.list.myDate,
						  validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'
			
			"></input>
		测点: <input id="gtcdChart_monitorPosition" class="easyui-combobox"
			name="gtcdChart_monitorPosition"
			data-options="  
                    url:'gtcd/data/points',  
                    valueField:'position',  
                    textField:'monitoringName',  
                    panelHeight:'auto',
                    editable:false,
                    multiple:false,
                    readonly:false,
                    onLoadSuccess:gtcdChart.list.initToolBarValue
            ">
		<a href="#" class="easyui-linkbutton" iconCls="icon-search"
			onclick="gtcdChart.list.getChartData()">查询</a>
	</div>
	<div id="gtcd_chart"></div>
</div>
