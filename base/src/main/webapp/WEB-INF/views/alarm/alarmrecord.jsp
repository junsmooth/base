<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	Namespace.register("alarm.alarmrecord", {
		formatOperation : function(value, row, index) {
			if (!value) {

				var del = '[' + '<a href="#" onclick="alarm.alarmrecord.close('
						+ row['id'] + ' )">关闭</a>' + ']';
				if (hasRole('ROLE_AUTH_EDIT')) {
					return del;
				}

			}
		},
		myDate : function(value) {
			var d = formatDateTime(value);
			return formatDateTime(value);
		},
		formatAlarmType : function(value, row, index) {
			if (value) {
				var color = row['threshold']['alarmType']['color']['name'];
				var level = row['threshold']['alarmType']['name'];
				return color + "," + level+"</span>";

			}
		},
		cellStyler:function(value,row,index){
			var color=row['threshold']['alarmType']['color']['code'];
			return 'background-color:'+color;
		},
		close : function(value) {
			$.messager.confirm('提示', '确定要关闭吗?', function(r) {
				if (r) {
					$.post('alarm/alarmrecord/close', {
						id : value
					}, function(data) {
						if (data.success) {
							alarm.alarmrecord.reload();
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
		edit : function(value) {
			$('#monpointdialog').dialog({
				title : '用户编辑',
				width : 600,
				height : 336,
				closed : false,
				resizable : true,
				cache : false,
				href : 'user/addOrUpdate?id=' + value,
				modal : true
			});
		},
		closeDialog : function() {
			$('#monpointdialog').dialog('close');
		},
		reload : function() {
			$('#monPointGrid').datagrid('reload');
		},toolbar:[ {
			text : '增加',
			iconCls : 'icon-add',
			disabled : !hasRole('ROLE_AUTH_EDIT'),
			handler : function() {
				$('#monpointdialog').dialog({
					title : '添加监测点',
					width : 600,
					height : 360,
					closed : false,
					//resizable:true,
					cache : false,
					href : 'config/monpoint/addOrUpdate?id=-1',
					modal : true
				});
			}
		}, '-', {
			text : '刷新',
			iconCls : 'icon-reload',
			handler : function() {
				alarm.alarmrecord.reload();
			}
		}

		],
		submit:function(){
			var min=$('#alarmrecords_tb_min').datebox('getValue');
			var max=$("#alarmrecords_tb_max").datebox('getValue');
			$('#monPointGrid').datagrid('load', {
				min : min,
				max : max,
			});
		}

	});
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'" style="padding: 10px 0 10px 10px">
		<table id="monPointGrid" class="easyui-datagrid"
			data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'alarm/alarmrecord/data',toolbar:'#alarmrecords_tb',pagination:'true',fitColumns:true,fit:true">
			<thead>
				<tr>

					<th
						data-options="field:'collectTime',width:100,align:'left',formatter:function(value){return formatDateTime(value)}">
						采集时间</th>
					<th
						data-options="field:'eventTime',width:100,align:'left',formatter:function(value){return formatDateTime(value)}">
						报警时间</th>
					<th
						data-options="field:'threshold',width:120,align:'left',styler:alarm.alarmrecord.cellStyler,formatter:alarm.alarmrecord.formatAlarmType">
						报警级别</th>
						<!--  
					<th data-options="field:'times',width:40,align:'left'">累计次数</th>-->
					
					<th data-options="field:'warningValue',width:80,align:'left'">报警值</th>
					
					<th data-options="field:'warningContent',width:180,align:'left'">
						报警内容</th>
					<th
						data-options="field:'closed',width:200,align:'left',formatter:alarm.alarmrecord.formatOperation">
						操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="alarmrecords_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='alarmrecords_tb_min' class="easyui-datetimebox"
			data-options="formatter:alarm.alarmrecord.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='alarmrecords_tb_max' class="easyui-datetimebox"
			data-options="formatter:alarm.alarmrecord.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		<a href="#" class="easyui-linkbutton" iconCls="icon-search"
			onclick="alarm.alarmrecord.submit()">查询</a>
	</div>
</div>
<div id="monpointdialog"></div>
