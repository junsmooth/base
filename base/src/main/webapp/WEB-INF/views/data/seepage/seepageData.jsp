<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	Namespace.register("seepage.list", {
		
		formatSeepageTime : function(value) {
			return formatDateTime(value);
		},
		formatSeepagePoint : function(value) {
			return value.monitoringName;
		},
		myDate : function(value) {
			//var d = formatDateTime(value);
			return formatDateTime(value);
		}

	});

	function submit() {
		var validFormDate = $("#seepage_tb").form('validate');
		if (!validFormDate) {
			return;
		}
		var str1 = '', mp, min1, max1;

		mp = $('#seepage_mp').combobox('getValues');

		for ( var i = 0; i < mp.length; i++) {
			str1 += mp[i] + ',';
		}
		str1 = str1.substring(0, str1.length - 1);
		//return ;

		min1 = $('#seepage_min').combobox('getText');

		max1 = $('#seepage_max').combobox('getText');

		$('#seepageId').datagrid('load', {
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


		<table id="seepageId" class="easyui-datagrid"
			data-options="rownumbers:true,singleSelect:true, idField: 'id',url:'seepage/data/seepageData',pagination:'true',fitColumns:true,fit:true,toolbar:'#seepage_tb'">
			<thead>

				<tr>
					<th id="dt"
						data-options="field:'dateTime',formatter:seepage.list.formatSeepageTime,width:80,align:'left'">

						时间</th>
					<th
						data-options="field:'point',width:80,align:'left',formatter:seepage.list.formatSeepagePoint">
						测点</th>
					<th data-options="field:'value',width:120,align:'left'">
						深度</th>

				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="seepage_tb" style="padding: 5px; height: auto">
	<div>
		时间 从: <input id='seepage_min' class="easyui-datetimebox"
			data-options="formatter:seepage.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		到: <input id='seepage_max' class="easyui-datetimebox"
			data-options="formatter:seepage.list.myDate,validType:'checkDate[\'yyyy-MM-dd HH:mm:ss\']'"></input>
		测点: <input id="seepage_mp" class="easyui-combobox"
			name="seepage_mp"
			data-options="  
                    url:'seepage/data/points',  
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
