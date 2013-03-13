<%@ page language="java" pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>坝顶标高</title>
<link href="css/table.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/dateformat.js"></script>
<script type="text/javascript" src="js/final.js"></script>
<script type="text/javascript" src="js/Calendar.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript">
	function init(url) {
		$.ajax({
			type : 'GET',
			url : url,
			success : function(data) {
				var time = data.dateTime;
				time = formatDateTime(time);
				var value = data.value;
				$("#hisValue").text(value);
				$("#hisTime").text(time);
				$("#collectDate").val("");
				$("#data").val("");
			}
		});
	}
	$(document).ready(init("damcrest/latest"));
</script>
<script type="text/javascript">
	function submit_Update() {
		var time = $("#collectTime").attr("value");
		if (time == null || time == 0) {
			alert("时间不能为空");
			return;
		}
		var data = $("#data").attr("value");
		if (data == null || data == 0) {
			alert("监测值不能为空");
			return;
		}

		$.ajax({
			type : 'POST',
			data : {
				collectTime : time,
				data : data
			},
			url : "damcrest/save",
			success : function(ds) {
				alert("保存成功");
				location.reload();
			}
		});
	}
</script>
</head>
<body>
	<form id="damcrestForm" action="#" method="post">
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
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="5%">
														<div align="center">
															<img src="images/tb.gif" width="16" height="16" />
														</div>
													</td>
													<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[参数设置]-[录入坝顶标高]
													</td>
												</tr>
											</table>
										</td>
										<td width="54%">
											<table border="0" align="right" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="60">
														<table width="90%" border="0" cellpadding="0"
															cellspacing="0">
															<tr>
																<td class="STYLE1">
																	<div align="center">
																		<img src="images/33.gif" width="14" height="14" />
																	</div>
																</td>
																<td class="STYLE1">
																	<div align="center">
																		<a href="#" onclick="submit_Update();"
																			style="text-decoration: none">保存</a>
																	</div>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
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
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						height="510px">
						<tr>
							<td width="10" background="images/tab_12.gif">&nbsp;</td>
							<td width="1155" valign="top">
								<table class="table" cellspacing="1" align="center">
									<tr class="bg_tr">
										<td>上次测量时间</td>
										<td>上次测量值(m)</td>
										<td>本次测量时间</td>
										<td>本次测量值(m)</td>
									</tr>

									<tr class="bg_td">

										<td class="STYLE1" id="hisTime"></td>
										<td class="STYLE1" id="hisValue"></td>
										<td class="STYLE1"><input type="hidden" id="collectTime"
											name="collectTime" /> <input name="collectDate" type="text"
											id="collectDate" size="20" onBlur="validateDate2(this)"
											style="border-width: 1; border-style: solid; border-color: #b5d6e6;" />
											<img src="images/cal.gif" width="16" height="16"
											onClick="showCalDialog('collectDate','collectTime',3);" /></td>
										<td class="STYLE1"><input type="text" id="data"
											name="data" value=""
											style="width: 150px; height: 17px; background-color: #fffff; border: solid 1px #b5d6e6; font-size: 12px; color: #283439; background-image: url('images/bg1.gif');"
											onkeyup="checkFloat(this)" onBlur="fcheck(this,3)" size="10">
										</td>

									</tr>
								</table>
							</td>
							<td width="8" background="images/tab_15.gif">&nbsp;</td>
						</tr>
					</table>
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
	</form>
</body>
</html>