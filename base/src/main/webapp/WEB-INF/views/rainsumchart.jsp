<%@ page language="java" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>日降雨量</title>
<link href="css/table.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/dateformat.js"></script>
<script type="text/javascript" src="js/Calendar.js"></script>
<script type="text/javascript" src="js/final.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/highstock.js"></script>
<script type="text/javascript">
	function initSearchForm(data) {
		var years = data.years;
		var types = data.types;
		var year = data.year;
		var type = data.type;
		for ( var i = 0; i < years.length; i++) {
			var iYear = years[i];
			if (year == iYear) {
				$("#selYear").append(
						"<option value ="+iYear+" selected='selected'>" + iYear
								+ "</option>");
			} else {
				$("#selYear").append(
						"<option value ="+iYear+">" + iYear + "</option>");
			}

		}

		for ( var i = 0; i < types.length; i++) {
			var itype = types[i];
			if (i == type) {
				$("#selType").append(
						"<option value ="+i+" selected='selected'>" + itype
								+ "</option>");
			} else {
				$("#selType").append(
						"<option value ="+i+">" + itype + "</option>");
			}

		}
		getChartData();
	}
	
	function getChartData(){
		var year=$("#selYear option:selected").val();
		var type=$("#selType option:selected").val();
		$.ajax({
			type : 'POST',
			url : "rainFallSum",
			data:{year:year,type:type},
			success : showPicture
		});
		
	}
	
	function showPicture(data){
		window.chart = new Highcharts.StockChart({
			chart : {
				renderTo : 'container',
				alignTicks : false
			},
			rangeSelector : {
				selected : 5
			},
			title : {
				text : '日降雨量统计图'
			},
			yAxis : {
				title : {
					text : '日降雨量（mm）'
				},
				plotLines : [ {
					value : 0,
					color : 'green',
					dashStyle : 'shortdash',
					width : 2,
					label : {
						text : '零界线'
					}
				} ]
			},
			series : [ {
				type : 'column',
				name : '日降雨量',
				data : data.list,
				tooltip : {
					yDecimals : 2
				}
			} ]
		});
		$("#calDiv").html("最大值:"+data.max+" 最小值:"+data.min+" 总降雨量:"+data.total);
		
	}
	$(document).ready(function() {
		$.ajax({
			type : 'GET',
			url : "initSearchForm",
			success : initSearchForm
		});
		
	});
	
	
	
	
</script>
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30" background="images/tab_05.gif">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="12" height="30"><img src="images/tab_03.gif"
							width="12" height="30" /></td>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="46%" valign="middle">
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="5%">
													<div align="center">
														<img src="images/tb.gif" width="16" height="16" />
													</div>
												</td>
												<td width="95%" class="STYLE1"><span class="STYLE3">您当前的位置</span>：[实时监测与分析]-[降雨量统计]
												</td>
											</tr>
										</table>
									</td>
									<td width="54%"></td>
								</tr>
							</table>
						</td>
						<td width="16"><img src="images/tab_07.gif" width="16"
							height="30" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<form action="#" method="post">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="10" background="images/tab_12.gif">&nbsp;</td>
							<td width="1155">
								<table width="100%" border="0">
									<tr>
										<td colspan="2">
											<table class="table" border="0" cellspacing="0"
												style="width: 600px" align="center">
												<tr class="bg_tr">
													<td class="STYLE3">选择时间段:</td>
													<td class="STYLE1" align="left"><select id="selYear">
													</select> 年 <select id="selType">
													</select></td>
													<td><img onClick="getChartData();" src="images/chaxun.gif" /></td>
												</tr>
											</table>
										</td>

									</tr>
								</table>
								<div id="calDiv" style="min-width: 500px:" align="center"></div>
								<div id="container" style="height: 500px; min-width: 500px"></div>
							</td>
							<td width="8" background="images/tab_15.gif">&nbsp;</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr>
			<td height="35" background="images/tab_19.gif">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="12" height="35"><img src="images/tab_18.gif"
							width="12" height="35" /></td>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="STYLE4">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
						<td width="16"><img src="images/tab_20.gif" width="16"
							height="35" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>

