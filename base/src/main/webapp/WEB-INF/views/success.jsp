<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>操作成功</title>
		<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css">
	</head>

	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" background="<c:url value="/resources/images/tab_05.gif" />">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30"><img src="<c:url value="/resources/images/tab_03.gif" />" width="12" height="30" /></td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="46%" valign="middle">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="5%">
														<div align="center">
															<img src="<c:url value="/resources/images/tb.gif" />" width="16" height="16" />
														</div>
													</td>
													<td width="95%" class="STYLE1">
														<span class="STYLE3">你当前的位置</span>：[操作成功]
													</td>
												</tr>
											</table>
										</td>
										<td width="54%">
											<table border="0" align="right" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="52">
														<table width="88%" border="0" cellpadding="0"
															cellspacing="0">
															<tr>
																<td class="STYLE1">
																	<div align="center">
																		<img src="<c:url value="/resources/images/edit-undo.gif" />" width="14" height="14" />
																	</div>
																</td>
																<td class="STYLE1">
																	<div align="center">
																		<a href="${success}" style="text-decoration: none">返回</a>
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
							<td width="16"><img src="<c:url value="/resources/images/tab_07.gif" />" width="16" height="30" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="10" background="<c:url value="/resources/images/tab_12.gif" />">
								&nbsp;
							</td>
							<td width="1155" align="center">
								<img src="<c:url value="/resources/images/success.jpg" />">
							</td>
							<td width="8" background="<c:url value="/resources/images/tab_15.gif" />">
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="35" background="<c:url value="/resources/images/tab_19.gif" />" >
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="35">
								<img src="<c:url value="/resources/images/tab_18.gif" />" width="12" height="35" />
							</td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="STYLE4">
											&nbsp;
										</td>
										<td>
											&nbsp;
										</td>
									</tr>
								</table>
							</td>
							<td width="16">
								<img src="<c:url value="/resources/images/tab_20.gif"  />" width="16" height="35" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	</body>
</html>
