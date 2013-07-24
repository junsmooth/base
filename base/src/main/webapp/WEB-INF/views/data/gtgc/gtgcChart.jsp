<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	Namespace.register("gtgcChart.list", {

		myDate : function(value) {
			return formatDateTime(value);
		},
		initToolBarValue : function(value) {
			var date = new Date();
			var oldDate = new Date(date.getTime() - 7 * 24 * 60 * 60 * 1000);
			$("#gtgcChart_max").attr("value", formatDateTime(date));
			$("#gtgcChart_min").attr("value", formatDateTime(oldDate));
			if (value == '') {
				return;
			}
			if (value.length > 0) {
				$("#gtgcChart_monitorPosition").combobox("setValue",
						value[0].position);
			}
			gtgcChart.list.getChartData();
		},
		change_min : function() {
			var minv = $("#gtgcChart_min").datetimebox('getValue');
			$("#gtgcChart_min").attr("value", minv);
		},
		change_max : function() {
			var maxv = $("#gtgcChart_max").datetimebox('getValue');
			$("#gtgcChart_max").attr("value", maxv);
		},
		getChartData : function() {
			var validFormDate = $("#gtgcChart_tb").form('validate');
			if (!validFormDate) {
				return;
			}
			var mp, min1, max1;

			mp = $('#gtgcChart_monitorPosition').combobox('getValue');
			min1 = $('#gtgcChart_min').val();
			max1 = $('#gtgcChart_max').val();
			var timeValue = checkTime(min1, max1);
			/*  if(timeValue>0){
				 $.dialog.tips("查询时间超过一年,请重新输入！",1,'error.gif');
				return;
			}  */

			$.ajax({
				type : 'POST',
				url : "gtgc/chart/gtgcChart",
				data : {
					min : min1,
					max : max1,
					str : mp
				},
				success : gtgcHighCharts
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

	function checkTime(min1, max1) {
		var regEx = new RegExp("\\-", "gi");
		min1 = min1.replace(regEx, "/");
		max1 = max1.replace(regEx, "/");
		var value = new Date(max1).getTime() - new Date(min1).getTime() - 365
				* 24 * 60 * 60 * 1000;
		return value;
	};
	function gtgcHighCharts(result) {

		if (result.length == 0) {
			$.dialog.tips("您所查日期内无监测数据，请重新选择查询日期");
			return;
		}
		$('#jrx_chart').highcharts('StockChart', {

			title : {
				text : '干滩高程监测过程曲线'
			},
			yAxis : {
				title : {
					text : '干滩高程(mm)'
				}
			},
			series : [ {
				name : '浸润线',
				data : result,
				
			} ]
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="jrxgrid" class="easyui-datagrid"
			data-options="fit:true,toolbar:'#gtgcChart_tb'">

		</table>
	</div>
</div>
<div id="gtgcChart_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='gtgcChart_min' class="easyui-datetimebox"
			data-options="onChange:gtgcChart.list.change_min,formatter:gtgcChart.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='gtgcChart_max' class="easyui-datetimebox"
			data-options="onChange:gtgcChart.list.change_max,formatter:gtgcChart.list.myDate,
						  validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'
			
			"></input>
		测点: <input id="gtgcChart_monitorPosition" class="easyui-combobox"
			name="gtgcChart_monitorPosition"
			data-options="  
                    url:'gtgc/data/points',  
                    valueField:'position',  
                    textField:'monitoringName',  
                    panelHeight:'auto',
                    editable:false,
                    multiple:false,
                    onLoadSuccess:gtgcChart.list.initToolBarValue
            ">
		<a href="#" class="easyui-linkbutton" iconCls="icon-search"
			onclick="gtgcChart.list.getChartData()">查询</a>
	</div>
	<div id="jrx_chart"></div>
</div>
