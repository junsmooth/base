<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<TITLE>项目概况</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<c:url value="/resources/css/label.css" />" rel="stylesheet"
	type="text/css">
<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src='<c:url value="/resources/js/jquery.js" />'></script>
<script type="text/javascript"
	src='<c:url value="/resources/js/validation.js" />'></script>
<style type="text/css">
.input {
	border-width: 0
}
</style>
<script type="text/javascript">
	function bianji() {
		$(".input").attr('readOnly', '');
		$('.input').attr('style',
				'border-width:1;border-style:solid;border-color:#b5d6e6;');
		  $('#save').attr('style','display: ');
          $('#edit').attr('style','display:none');
          $('#cancel').attr('style','display: ');
	}
	function baocun() {
		document.forms[0].action = "projectUpdate";
		document.forms[0].submit();
	}
	 function quxiao(){
		  document.forms[0].reset();
		  $(".input").attr('readOnly','readonly');
		  $(".input").attr('style','border-width: 0');
		  $('#save').attr('style','display:none');
          $('#edit').attr('style','display: ');
          $('#cancel').attr('style','display:none');
	 }
	
	
</script>

</head>
<body>
	<form action="#" method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30"
					background='<c:url value="/resources/images/tab_05.gif" />'>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30"><img
								src='<c:url value="/resources/images/tab_03.gif" />' width="12"
								height="30" /></td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="100%" valign="middle">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="5%">
														<div align="center">
															<img src='<c:url value="/resources/images/tb.gif"/>'
																width="16" height="16" />
														</div>
													</td>
													<td width="95%" class="STYLE1"><span class="STYLE3">您当前的位置</span>：[工程简介]-[项目概况]
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
							<td width="16"><img
								src='<c:url value="/resources/images/tab_07.gif" />' width="16"
								height="30" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="10"
								background='<c:url value="/resources/images/tab_12.gif" />'>
								&nbsp;</td>
							<td width="1155">
								<table class="table" cellspacing="1" align="center">
									<tr class="bg_td">
										<td rowspan="2">基本介绍</td>
										<td height="30">项目名称：</td>
										<td><input type="text" name="projectName"
											id="projectName" value="${project.projectName}"
											readOnly="readonly" class="input" size="25" /></td>
										<td>承建单位：</td>
										<td><input type="text" name="unit" id="unit"
											value="${project.unit}" readOnly="readonly" class="input"
											size="25" /></td>
										<td>监测内容：</td>
										<td><input type="text" name="contents" id="contents"
											value="${project.contents}" readOnly="readonly" class="input"
											size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">建设时间：</td>
										<td><input type="text" name="buildTime" id="buildTime"
											value="${project.buildTime}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>竣工时间：</td>
										<td><input type="text" name="completeTime" id="completeTime"
											value="${project.completeTime}" readOnly="readonly"
											class="input" size="25" /></td>
										<td colspan="2"></td>
									</tr>
									<tr class="bg_td">
										<td rowspan="4">测量点数</td>
										<td height="30">表面位移：</td>
										<td><input type="text" name="surfaceNum" id="surfaceNum"
											value="${project.surfaceNum}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>内部位移：</td>
										<td><input type="text" name="internalNum" id="internalNum"
											value="${project.internalNum}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>干滩高程：</td>
										<td><input type="text" name="elevationNum" id="elevationNum"
											value="${project.elevationNum}" readOnly="readonly"
											class="input" size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">浸润线：</td>
										<td><input type="text" name="saturationNum"
											id="saturationNum" value="${project.saturationNum}"
											readOnly="readonly" class="input" size="25" /></td>
										<td>库水位：</td>
										<td><input type="text" name="waterNum" id="waterNum"
											value="${project.waterNum}" readOnly="readonly" class="input"
											size="25" /></td>
										<td>视频监控：</td>
										<td><input type="text" name="videoNum" id="videoNum"
											value="${project.videoNum}" readOnly="readonly" class="input"
											size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">渗流量：</td>
										<td><input type="text" name="seepageNum" id="seepageNum"
											value="${project.seepageNum}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>降雨量：</td>
										<td><input type="text" name="rainfallNum" id="rainfallNum"
											value="${project.rainfallNum}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>孔隙水压力：</td>
										<td><input type="text" name="waterpressureNum"
											id="waterpressureNum" value="${project.waterpressureNum}"
											readOnly="readonly" class="input" size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">浑浊度：</td>
										<td><input type="text" name="turbidityNum" id="turbidityNum"
											value="${project.turbidityNum}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>PH值：</td>
										<td><input type="text" name="ph" id="ph"
											value="${project.ph}" readOnly="readonly" class="input"
											size="25" /></td>
										<td>温度：</td>
										<td><input type="text" name="temperature"
											id="temperature" value="${project.temperature}"
											readOnly="readonly" class="input" size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td rowspan="4">监测技术或设备</td>
										<td height="30">表面位移：</td>
										<td><input type="text" name="surface" id="surface"
											value="${project.surface}" readOnly="readonly" class="input"
											size="25" /></td>
										<td>浸润线：</td>
										<td><input type="text" name="saturation"
											id="saturation" value="${project.saturation}"
											readOnly="readonly" class="input" size="25" /></td>
										<td>内部位移：</td>
										<td><input type="text" name="internal" id="internal"
											value="${project.internal}" readOnly="readonly" class="input"
											size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">库水位：</td>
										<td><input type="text" name="water" id="water"
											value="${project.water}" readOnly="readonly" class="input"
											size="25" /></td>
										<td>干滩高程：</td>
										<td><input type="text" name="elevation" id="elevation"
											value="${project.elevation}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>视频监控：</td>
										<td><input type="text" name="video" id="video"
											value="${project.video}" readOnly="readonly" class="input"
											size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">降雨量：</td>
										<td><input type="text" name="rainfall" id="rainfall"
											value="${project.rainfall}" readOnly="readonly" class="input"
											size="25" /></td>
										<td>坝体压力：</td>
										<td><input type="text" name="dampressure"
											id="dampressure" value="${project.dampressure}"
											readOnly="readonly" class="input" size="25" /></td>
										<td>渗流量：</td>
										<td><input type="text" name="seepage" id="seepage"
											value="${project.seepage}" readOnly="readonly" class="input"
											size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">浑浊度：</td>
										<td><input type="text" name="turbidity" id="turbidity"
											value="${project.turbidity}" readOnly="readonly"
											class="input" size="25" /></td>
										<td colspan="4"></td>
									</tr>
									<security:authorize access="hasRole('ROLE_ADMIN')">
										<tr class="bg_td" align="center">
											<td colspan="7">
												<div align="center" style="width: 75%">
													<img id="save"
														src='<c:url value="/resources/images/baocun.gif" />'
														style="display: none" onclick="baocun();"> <img
														id="edit"
														src='<c:url value="/resources/images/bianji.gif" />'
														onclick=bianji();;> <img id="cancel" alt=""
														src='<c:url value="/resources/images/quxiao.gif" />'
														style="display: none" onclick="quxiao();">
												</div>
											</td>
										</tr>
									</security:authorize>
								</table>
							</td>
							<td width="8"
								background='<c:url value="/resources/images/tab_15.gif" />'>
								&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="35"
					background='<c:url value="/resources/images/tab_19.gif" />'>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="35"><img
								src='<c:url value="/resources/images/tab_18.gif" />' width="12"
								height="35" /></td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="STYLE4">&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</table>
							</td>
							<td width="16"><img
								src='<c:url value="/resources/images/tab_20.gif" />' width="16"
								height="35" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
