<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统标题</title>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-1.4.2.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.pnotify.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-ui-1.8.2.custom.min.js" />"></script>
<link href="<c:url value="/resources/css/jquery.pnotify.default.css"/>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="/resources/css/jquery.pnotify.default.icons.css"/>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/jquery-ui-1.8.2.custom.css"/>"
	rel="stylesheet" type="text/css" />
<style type="text/css">
/* <![CDATA[ */
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px;
	color: #000000;
}

.STYLE2 {
	font-size: 9px
}

.STYLE3 {
	color: #033d61;
	font-size: 12px;
}

.ui-widget {
	font-size: 85% !important;
}

.ui-pnotify.stack-bottomleft {
	bottom: 10px;
	left: 10px;
	top: auto;
	right: auto;
}
/* ]]> */
</style>
<script language="javascript">
	function freshPage() {
		parent.location.href='/Bgrimminformation/j_spring_security_logout';
	}

	function getNowTime() {
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth() + 1;
		var date = now.getDate();
		var day = now.getDay();
		var week;
		switch (day) {
		case 0:
			week = "星期日";
			break;
		case 1:
			week = "星期一";
			break;
		case 2:
			week = "星期二";
			break;
		case 3:
			week = "星期三";
			break;
		case 4:
			week = "星期四";
			break;
		case 5:
			week = "星期五";
			break;
		case 6:
			week = "星期六";
			break;
		}
		var nowdate = year + "年" + month + "月" + date + "日 " + week;
		document.getElementById("showDate").outerText = nowdate;
	}
	function onSubmit() {
		window.location.href = "/Bgrimminformation/userPasswordPageController.action";
	}
	function clickPnotify() {
		$
				.ajax({
					type : "POST",
					url : "/Bgrimminformation/infoMessager.action",
					data : "",
					dataType : "json",
					success : function(result) {
						//var stack_bottomleft = {"dir1":"right", "dir2":"up"};
						if (result.mess.count != 0) {
							var opts = {
								pnotify_title : '<span style="color:green;">'
										+ result.mess.title + '</span>',
								pnotify_text : '<div align="center" style="color:blue;"><a href="/Bgrimminformation/bgrimmalarm2.action" target="I3">接收到'
										+ result.mess.count + '条报警信息</a></div>',
								pnotify_history : false
							};
							$.pnotify(opts);
						}
					}
				});
		setTimeout("clickPnotify()", 10000);
	}
	setTimeout("clickPnotify()", 10000);
</script>
</head>
<body onLoad="getNowTime()">
	<table width="100%" height="63" border="0" cellspacing="0"
		cellpadding="0"
		background="<c:url value="/resources/images/menu/top.jpg" />">
		<tr background="<c:url value="/resources/images/menu/top.jpg" />">
			<td height="61"><table width="100%" border="0" cellspacing="0"
					cellpadding="0">

					<tr>
						<td height="61"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="700" height="61">&nbsp;</td>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="77%" height="25" valign="bottom"><table
														width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td width="70" style="cursor: pointer" height="19"><div
																	align="center">
																	<img
																		src="<c:url value="/resources/images/menu/sy.png"/>"
																		onClick="parent.location.href='/Bgrimminformation'"
																		width="49" height="19">
																</div></td>
															<td width="26"><div align="center"></div></td>
															<td width="100" style="cursor: pointer"><div
																	align="center">
																	<A
																		href="<c:url value="/user/updatePasswordView" />"
																		target="I3"><img
																		src="<c:url value="/resources/images/menu/zl.png"/>"
																		style="cursor: pointer" width="98" height="19"></A>
																</div></td>
															<td width="70" style="cursor: pointer"><div
																	align="center">
																	<A href="#"
																		onClick="freshPage()"><img
																		src="<c:url value="/resources/images/menu/tc.png"/>"
																		style="cursor: pointer" width="48" height="19"></A>
																</div></td>
															<td>&nbsp;</td>
														</tr>
													</table></td>
												<td width="220" height="63" valign="bottom" nowrap="nowrap"><div
														align="center">
														<span class="STYLE1"><span class="STYLE2"></span> <span
															id="showDate" class="STYLE2"></span></span>
													</div></td>
											</tr>
										</table></td>

								</tr>
							</table></td>
					</tr>

				</table></td>
		</tr>
		<tr>
			<td height="28"
				background="<c:url value="/resources/images/menu/main_36.gif" />"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="207" height="26"
							background="<c:url value="/resources/images/menu/main_32.gif"/>"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="20%" height="22">&nbsp;</td>
									<td width="59%" valign="bottom"><div align="center"
											class="STYLE1">
											用户名:
											<security:authentication property="principal.username"/>
										</div></td>
									<td width="21%">&nbsp;</td>
								</tr>
							</table></td>
						<td><table width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td width="65" height="26">&nbsp;</td>
									<td width="3">&nbsp;</td>
									<td width="63">&nbsp;</td>
									<td width="3">&nbsp;</td>
									<td width="63">&nbsp;</td>
									<td width="3">&nbsp;</td>
									<td width="63">&nbsp;</td>
									<td width="3">&nbsp;</td>
									<td width="63">&nbsp;</td>
									<td width="3">&nbsp;</td>
									<td width="63">&nbsp;</td>
									<td width="3">&nbsp;</td>
									<td width="63">&nbsp;</td>
									<td width="3">&nbsp;</td>
									<td width="63">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
							</table></td>
						<td width="21"><img
							src="<c:url value="/resources/images/menu/main_37.gif"/>"
							width="21" height="28"></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>
