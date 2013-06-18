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
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">


		<table id="jrxgrid" class="easyui-datagrid"
			data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'jrx/data/jrxData',pagination:'true',fitColumns:true,fit:true,toolbar:'#jrx_tb'">
			<thead>

				<tr>
					<th id="dt"
						data-options="field:'date_Time',formatter:saturation.list.formatJRXTime,width:80,align:'left'">

						时间</th>
					<th
						data-options="field:'point',width:80,align:'left',formatter:saturation.list.formatJRXPoint">
						测点</th>
					<th data-options="field:'water_depth',width:120,align:'left'">
						深度</th>

				</tr>
			</thead>
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
                    url:'jrx/data/jrxMonitorPostion',  
                    valueField:'position',  
                    textField:'monitoringName',  
                    multiple:true,  
                    panelHeight:'auto',
                    editable:false  
            "
			readonly="readonly"> <a href="#" class="easyui-linkbutton"
			iconCls="icon-search" onclick="submit()">查询</a>
	</div>
</div>
