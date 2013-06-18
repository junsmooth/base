<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	Namespace.register("saturation.list", {
		formatOperation : function(value) {
			if (value) {
				var edit = '[' + '<a href="#" onclick="user.list.edit(' + value
						+ ')">编辑</a>' + ']';
				var del = '[' + '<a href="#" onclick="user.list.remove('
						+ value + ' )">删除</a>' + ']';
				if (hasRole('ROLE_USER_EDIT')) {
					return edit + del;
				}

			}
		},
		formatJRXTime : function(value) {
			return formatDateTime(value);
		},
		formatJRXPoint : function(value) {
			return value.monitoringName;
		},
		remove : function(value) {
			$.messager.confirm('提示', '确定要删除吗?', function(r) {
				if (r) {
					$.post('user/remove', {
						id : value
					}, function(data) {
						if (data.success) {
							user.list.reload();
							$.dialog.tips(data.msg);
						} else {
							$.dialog.tips(data.msg + ":" + data.obj, 600,
									'error.gif');
						}
					});
				} else {
					return;
				}
			});
		},
		myDate : function(value) {
			//var d = formatDateTime(value);
			return formatDateTime(value);
		},
		edit : function(value) {
			$('#userdialog').dialog({
				title : '用户编辑',
				width : 600,
				height : 336,
				closed : false,
				resizable : true,
				cache : false,
				href: 'user/addOrUpdate?id=' + value,
				modal : true
			});
		},
		closeDialog : function() {
			$('#userdialog').dialog('close');
		},
		reload : function() {
			$('#jrxgrid').datagrid('reload');
		}

	});

	function submit() {
		var validFormDate = $("#jrx_tb").form('validate');
		if (!validFormDate) {
			return;
		}
		var str1 = '', mp, min1, max1;

		mp = $('#jrx_monitorPosition').combobox('getValues');

		for ( var i = 0; i < mp.length; i++) {
			str1 += mp[i] + ',';
		}
		str1 = str1.substring(0, str1.length - 1);
		//return ;

		min1 = $('#jrx_min').combobox('getText');

		max1 = $('#jrx_max').combobox('getText');

		$('#jrxgrid').datagrid('load', {
			min : min1,
			max : max1,
			str : str1
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
	
	
	function jrxHighCharts() {
        $('#jrx_chart').highcharts({
            chart: {
                zoomType: 'x',
                spacingRight: 20
            },
            title: {
                text: '浸润线过程线'
            },
           /* subtitle: {
                text: document.ontouchstart === undefined ?
                    'Click and drag in the plot area to zoom in' :
                    'Drag your finger over the plot to zoom in'
            },*/
            xAxis: {
                type: 'datetime',
                maxZoom: 14 * 24 * 3600000, // fourteen days
                title: {
                    text: null
                }
            },
            yAxis: {
                title: {
                    text: '干滩高程监测值（m）'
                }
            },
            tooltip: {
                shared: true
            },
            legend: {
                enabled: false
            },
            plotOptions: {
                area: {
                    fillColor: {
                        linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
                        stops: [
                            [0, Highcharts.getOptions().colors[0]],
                            [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                        ]
                    },
                    lineWidth: 1,
                    marker: {
                        enabled: false
                    },
                    shadow: false,
                    states: {
                        hover: {
                            lineWidth: 1
                        }
                    },
                    threshold: null
                }
            },
    
            series: [{
                type: 'area',
                name: 'USD to EUR',
                pointInterval: 24 * 3600 * 1000,
                pointStart: Date.UTC(2006, 0, 01),
              //  data: []//json数据
            }]
        });
    }
	
	$(document).ready(jrxHighCharts());
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="jrxgrid" class="easyui-datagrid"
			data-options="url:'jrx/data/jrxMonitorPostion',fit:true,toolbar:'#jrx_tb'">
			
		</table>
	</div>
</div>
<div id="jrx_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='jrx_min' class="easyui-datetimebox"
			data-options="formatter:saturation.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='jrx_max' class="easyui-datetimebox"
			data-options="formatter:saturation.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		测点: <input id="jrx_monitorPosition" class="easyui-combobox"
			name="jrx_monitorPosition"
			data-options="  
                    url:'jrx/data/points',  
                    valueField:'position',  
                    textField:'monitoringName',  
                    multiple:true,  
                    panelHeight:'auto',
                    editable:false  
            "
			readonly="readonly"> <a href="#" class="easyui-linkbutton"
			iconCls="icon-search" onclick="submit()">查询</a>
	</div>
		<div id="jrx_chart"></div>
</div>
