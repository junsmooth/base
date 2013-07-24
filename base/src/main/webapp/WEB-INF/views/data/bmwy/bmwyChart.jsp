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
		initToolBarValue : function(value) {
			var date = new Date();
			var oldDate = new Date(date.getTime() - 7 * 24 * 60 * 60 * 1000);
			$("#bmwyChart_max").attr("value", formatDateTime(date));
			$("#bmwyChart_min").attr("value", formatDateTime(oldDate));
			if (value == '') {
				return;
			}
			if (value.length > 0) {
				$("#bmwyChart_monitorPosition").combobox("setValue",
						value[0].position);
				//$("#bmwyChart_monitorPosition").combobox("setText",value[0].monitoringName);
			}

			bmwyChart.list.getChartData(value[value.length - 1].dId);
		},
		initToolBarValue1 : function(value) {
			//alert("initToolBarValue1");
			if (value.length > 0) {
				//alert("directionName:"+value[0].directionName+"value:"+value[0].id);
				$("#bmwyChart_direction").combobox('setValue', value[0].id);
			}

		},
		change_min : function() {
			var minv = $("#bmwyChart_min").datetimebox('getValue');
			$("#bmwyChart_min").attr("value", minv);
		},
		change_max : function() {
			var maxv = $("#bmwyChart_max").datetimebox('getValue');
			$("#bmwyChart_max").attr("value", maxv);
		},
		getChartData : function(data) {

			var validFormDate = $("#bmwyChart_tb").form('validate');
			if (!validFormDate) {
				return;
			}
			var str1 = '', mp, min1, max1, dirId;

			mp = $('#bmwyChart_monitorPosition').combobox('getValue');
			dirId = $('#bmwyChart_direction').combobox('getValue');
			min1 = $('#bmwyChart_min').val();
			max1 = $('#bmwyChart_max').val();
			var timeValue = checkTime(min1, max1);
			/*  if(timeValue>0){
				 $.dialog.tips("查询时间超过一年,请重新输入！",1,'error.gif');
				return;
			}  */
			/* alert("dirId:"+typeof dirId+dirId);
			alert(dirId==""); */
			if (dirId == "") {
				dirId = data;
			}
			$.ajax({
				type : 'POST',
				url : "bmwy/chart/bmwyChart",
				data : {
					min : min1,
					max : max1,
					str : mp,
					dirId : dirId
				},
				success : bmwyHighCharts
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
	function bmwyHighCharts(result) {

		if (result.length == 0) {
			$.dialog.tips("您所查日期内无监测数据，请重新选择查询日期");
			return;
		}
		$('#bmwy_chart').highcharts(
				'StockChart',
				{

					chart : {
						renderTo : 'container',
						zoomType : 'x'
					},
					plotOptions : {
						line : {
							gapSize : 10
						}
					},
					credits : {
						enabled : false
					},
					/* navigator : {
						enabled : false
					}, */
					title : {
						text : '表面位移监测过程曲线'
					},
					rangeSelector : {
						buttonTheme : { // styles for the buttons
							fill : 'none',
							stroke : 'none',
							'stroke-width' : 0,
							r : 8,
							style : {
								color : '#039',
								fontWeight : 'bold'
							},
							states : {
								hover : {},
								select : {
									fill : '#039',
									style : {
										color : 'white'
									}
								}
							}
						},
						inputStyle : {
							color : '#039',
							fontWeight : 'bold'
						},
						labelStyle : {
							color : 'silver',
							fontWeight : 'bold'
						},
						inputDateFormat : '%Y-%m-%d',
						selected : 5,
						buttons : [ {
							type : 'day',
							count : 1,
							text : '1天'
						}, {
							type : 'day',
							count : 7,
							text : '7天'
						}, {
							type : 'month',
							count : 1,
							text : '1月'
						}, {
							type : 'month',
							count : 3,
							text : '3月'
						}, {
							type : 'year',
							count : 1,
							text : '1年'
						}, {
							type : 'all',
							text : '全部'
						} ]
					},
					yAxis : {
						title : {
							text : '表面位移(mm)'
						},
						plotLines : [/*  {
											value : 0,
											color : 'green',
											dashStyle : 'shortdash',
											width : 2,
											label : {
												text : '零界线'
											}
										} */]
					},
					tooltip : {
						valueSuffix:'mm',
						valueDecimals: 2,
						xDateFormat:'%Y-%m-%d %H:%M:%S'
					},
					 navigator: {
						 xAxis : {
								type : 'datetime',
								dateTimeLabelFormats : {
									second : '%Y-%m-%d<br/>%H:%M:%S',
									minute : '%Y-%m-%d<br/>%H:%M',
									hour : '%Y-%m-%d<br/>%H:%M',
									day : '%Y-%m-%d',
									week : '%Y-%m-%d',
									month : '%Y-%m',
									year : '%Y'
								}
							}
					    },
					xAxis : {
						type : 'datetime',
						dateTimeLabelFormats : {
							second : '%Y-%m-%d<br/>%H:%M:%S',
							minute : '%Y-%m-%d<br/>%H:%M',
							hour : '%Y-%m-%d<br/>%H:%M',
							day : '%Y<br/>%m-%d',
							week : '%Y<br/>%m-%d',
							month : '%Y-%m',
							year : '%Y'
						}
					},

					series : [ {
						name : '表面位移',
						data : result
						
					} ]
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
                    multiple:false,
                    readonly:false,
                    onLoadSuccess:bmwyChart.list.initToolBarValue
            "
			readonly="readonly" /> 方位: <input id="bmwyChart_direction"
			class="easyui-combobox" name="bmwyChart_direction"
			data-options="  
                    url:'bmwy/data/directions', 
                    valueField:'id',   
                    textField:'directionName',  
                    panelHeight:'auto',
                    editable:false,
                    multiple:false,
                     readonly:false,
                  	onLoadSuccess:bmwyChart.list.initToolBarValue1
                 
            " />
		<a href="#" id="bmwyChartSearch" class="easyui-linkbutton"
			iconCls="icon-search" onclick="bmwyChart.list.getChartData()">查询</a>
	</div>
	<div id="bmwy_chart"></div>



</div>
