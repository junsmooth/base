<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	Namespace.register("yinglichart.list", {

		myDate : function(value) {
			return formatDateTime(value);
		},
		initToolBarValue:function(value){
			var date=new Date(); 
			var oldDate=new Date(date.getTime()-7*24*60*60*1000);
			$("#yingli_chart_maxdate").attr("value",formatDateTime(date));  
			$("#yingli_chart_mindate").attr("value",formatDateTime(oldDate));
			if(value==''){
				return;
			}
			if(value.length>0){
				$("#yingli_chart_monitorPosition").combobox("setValue",value[0].position);
			}
			yinglichart.list.getChartData();
		},
		change_min:function(){
			var minv=$("#yingli_chart_mindate").datetimebox('getValue');
			$("#yingli_chart_mindate").attr("value",minv);
		},
		change_max:function(){
			var maxv=$("#yingli_chart_maxdate").datetimebox('getValue');
			$("#yingli_chart_maxdate").attr("value",maxv);
		},
		getChartData:function(){
			var validFormDate = $("#kswChart_tb").form('validate');
			if (!validFormDate) {
				return;
			}
					var mp, min1, max1;
				
					mp = $('#yingli_chart_monitorPosition').combobox('getValue');
					min1=$('#yingli_chart_mindate').val();	
				    max1 = $('#yingli_chart_maxdate').val();
				    var timeValue= checkTime(min1,max1);

			$.ajax({
				type : 'POST',
				url : "yingli/chart",
				data : {
					min : min1,
					max : max1,
					str : mp
				},
				success : yinglijiCharts
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
	function yinglijiCharts(result) {

		if (result.length == 0) {
			$.dialog.tips("您所查日期内无监测数据，请重新选择查询日期");
			return;
		}
		$('#yingli_chart').highcharts('StockChart', {

		

			title : {
				text : '应力监测过程曲线'
			},
			yAxis : {
				title : {
					text : '应力(kN)'
				}
			},
			series : [ {
				name : '应力',
				data : result
				
			} ]
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="kswId" class="easyui-datagrid"
			data-options="fit:true,toolbar:'#kswChart_tb'">
			
		</table>
	</div>
</div>
<div id="kswChart_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='yingli_chart_mindate' class="easyui-datetimebox"
			data-options="onChange:yinglichart.list.change_min,formatter:yinglichart.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='yingli_chart_maxdate' class="easyui-datetimebox"
			data-options="onChange:yinglichart.list.change_max,formatter:yinglichart.list.myDate,
						  validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'
			
			"></input>
		测点: <input id="yingli_chart_monitorPosition" class="easyui-combobox"
			name="yingli_chart_monitorPosition"
			data-options="  
                    url:'yingli/points',
                    method:'get',  
                    valueField:'position',  
                    textField:'monitoringName',  
                    panelHeight:'auto',
                    editable:false,
                    multiple:false,
                    readonly:false,
                    onLoadSuccess:yinglichart.list.initToolBarValue
            "
			> <a href="#" class="easyui-linkbutton"
			iconCls="icon-search" onclick="yinglichart.list.getChartData()">查询</a>
	</div>
		<div id="yingli_chart"></div>
</div>
