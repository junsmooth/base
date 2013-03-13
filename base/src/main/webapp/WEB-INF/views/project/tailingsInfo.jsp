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
		$('#save').attr('style', 'display: ');
		$('#edit').attr('style', 'display:none');
		$('#cancel').attr('style', 'display: ');
	}
	function baocun() {
		document.forms[0].action = "tailingsUpdate";
		document.forms[0].submit();
	}
	function quxiao() {
		document.forms[0].reset();
		$(".input").attr('readOnly', 'readonly');
		$(".input").attr('style', 'border-width: 0');
		$('#save').attr('style', 'display:none');
		$('#edit').attr('style', 'display: ');
		$('#cancel').attr('style', 'display:none');
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
															<img src='<c:url value="/resources/images/tb.gif" />'
																width="16" height="16" />
														</div>
													</td>
													<td width="95%" class="STYLE1"><span class="STYLE3">您当前的位置</span>：[工程简介]-[尾矿库概况]
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
								background='<c:url value="/resources/images/tab_12.gif" /> '>
								&nbsp;</td>
							<td width="1155">
								<table class="table" cellspacing="1" align="center">
									<tr class="bg_td">
										<td height="30" align="left" width="7%">建设时间：</td>
										<td width="9%"><input type="text" name="time" id="time"
											value="${tailings.time}" readOnly="readonly"
											class="input" size="25" /></td>
										<td width="7%">投入使用时间：</td>
										<td width="9%"><input type="text" name="using" id="using"
											value="${tailings.using}" readOnly="readonly"
											class="input" size="25" /></td>
										<td width="7%">尾矿库类型：</td>
										<td width="10%"><input type="text" name="type" id="type"
											value="${tailings.type}" readOnly="readonly"
											class="input" size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">筑坝方式：</td>
										<td><input type="text" name="dams" id="dams"
											value="${tailings.dams}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>尾矿库等级：</td>
										<td><input type="text" name="tlevel" id="tlevel"
											value="${tailings.tlevel}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>汇水面积：</td>
										<td><input type="text" name="area" id="area"
											value="${tailings.area}" readOnly="readonly"
											class="input" size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">防洪标准：</td>
										<td><input type="text" name="standard" id="standard"
											value="${tailings.standard}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>初期坝类型：</td>
										<td><input type="text" name="early" id="early"
											value="${tailings.early}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>初期坝底标高：</td>
										<td><input type="text" name="dambottom" id="dambottom"
											value="${tailings.dambottom}" readOnly="readonly"
											class="input" size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">初期坝顶标高：</td>
										<td><input type="text" name="alignment1" id="alignment1"
											value="${tailings.alignment1}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>最终坝顶标高：</td>
										<td><input type="text" name="alignment2" id="alignment2"
											value="${tailings.alignment2}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>总堆积高度：</td>
										<td><input type="text" name="height" id="height"
											value="${tailings.height}" readOnly="readonly"
											class="input" size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">总库容：</td>
										<td><input type="text" name="total" id="total"
											value="${tailings.total}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>有效库容：</td>
										<td><input type="text" name="effective" id="effective"
											value="${tailings.effective}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>目标坝顶标高：</td>
										<td><input type="text" name="alignment3" id="alignment3"
											value="${tailings.alignment3}" readOnly="readonly"
											class="input" size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">目标坝高：</td>
										<td><input type="text" name="damhigh" id="damhigh"
											value="${tailings.damhigh}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>目标坝体长度：</td>
										<td><input type="text" name="length" id="length"
											value="${tailings.length}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>坝体纵坡度：</td>
										<td><input type="text" name="slope" id="slope"
											value="${tailings.slope}" readOnly="readonly"
											class="input" size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">初期坝顶宽度：</td>
										<td><input type="text" name="damwidth" id="damwidth"
											value="${tailings.damwidth}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>初期坝内坡比：</td>
										<td><input type="text" name="daminslope" id="daminslope"
											value="${tailings.daminslope}" readOnly="readonly"
											class="input" size="25" /></td>
										<td>初期坝外坡比：</td>
										<td><input type="text" name="damoutslope1"
											id="damoutslope1" value="${tailings.damoutslope1}"
											readOnly="readonly" class="input" size="25" /></td>
									</tr>
									<tr class="bg_td">
										<td height="30">初期坝外坡比：</td>
										<td><input type="text" name="damoutslope2"
											id="damoutslope2" value="${tailings.damoutslope2}"
											readOnly="readonly" class="input" size="25" /></td>
										<td>沉积滩平均坡度：</td>
										<td><input type="text" name="avgslope" id="avgslope"
											value="${tailings.avgslope}" readOnly="readonly"
											class="input" size="25" /></td>
										<td colspan="2"></td>
									</tr>
									<security:authorize access="hasRole('ROLE_ADMIN')">
										<tr class="bg_td" align="center">
											<td colspan="6">
												<div align="center" style="width: 75%">
													<img id="save"
														src='<c:url value="/resources/images/baocun.gif" />'
														style="display: none" onclick="baocun();"> <img
														id="edit"
														src='<c:url value="/resources/images/bianji.gif" />'
														onclick=bianji();;> <img id="cancel" alt=""
														src='<c:url value="/resources/images/quxiao.gif"/>'
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
								src='<c:url value="/resources/images/tab_18.gif"/>' width="12"
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
								src='<c:url value="/resources/images/tab_20.gif"/>' width="16"
								height="35" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
