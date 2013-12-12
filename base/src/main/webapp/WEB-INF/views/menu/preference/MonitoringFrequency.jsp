<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>监测频率设置</title>
<link href='<c:url value="/resources/css/table.css"/>' rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src='<c:url value="/resources/js/commons.js"/>'></script>
<script type="text/javascript"
	src='<c:url value="/resources/js/validation.js"/>'></script>
	
<script type="text/javascript"
	src='<c:url value="/resources/js/jquery.js" />'></script>
	
	
<script type="text/javascript">
	$(document).ready(setContent);
	function setContent() {
		$.ajax({
			url : "/Bgrimminformation/preference/initData",
			success : createTable
		});
	}
	function createTable(result){
		var freqlist=result.freq;
		var unitlist=result.unit;
		var html='';
		for(var i=0;i<freqlist.length;i++){
			html+='<tr class="bg_td">';
			html+='<td class="STYLE1">';
			html+=freqlist[i].name;
			html+='<input type="hidden" name="monitoring"   value="'+freqlist[i].type+'"/>';
			html+='</td>';
			html+='<td class="STYLE1">';
			html+='<input type="text" name="data" value="'+freqlist[i].freq+'"'
			+' style="width: 150px; height: 17px; background-color: #fffff; border: solid 1px #b5d6e6; font-size: 12px; color: #283439;"'
					+'onkeyup="checkFloat(this)" onBlur="fcheck(this,1)"	size="10">';
			html+='</td>';
			
			html+='<td class="STYLE1">';
			html+='<select id="freqselect"'+i+'+>';
			for(var j=0;j<unitlist.length;j++){
				if(unitlist[j].id==freqlist[i].uid){
					html+=' <option selected="selected" value ="'+unitlist[j].id+'">'+unitlist[j].name+' </option>';
				}else{
					html+=' <option value ="'+unitlist[j].id+'">'+unitlist[j].name+' </option>';

				}
			}
			html+='</select>';
			html+='</td>';
			html+='</tr>';
		}
		
		$("#freqhead").after(html);
	}
</script>


</head>
<body>
	<form action="#" method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30"
					background='<c:url value="/resources/images/tab_05.gif"/>'>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30"><img
								src='<c:url value="/resources/images/tab_03.gif" />' width="12"
								height="30" /></td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="46%" valign="middle">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="5%">
														<div align="center">
															<img src='<c:url value="/resources/images/tb.gif"/>'
																width="16" height="16" />
														</div>
													</td>
													<td width="95%" class="STYLE1"><span class="STYLE3">您当前的位置</span>：[参数设置]-[监测频率设置]
													</td>
												</tr>
											</table>
										</td>
										<td width="54%"><security:authorize
												access="hasRole('ROLE_MANAGER')">
												<table border="0" align="right" cellpadding="0"
													cellspacing="0">
													<tr>
														<td width="60">
															<table width="90%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<img src='<c:url value="/resources/images/33.gif"/>'
																				width="14" height="14" />
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="#" onclick="submit_Update();"
																				style="text-decoration: none">修改</a>
																		</div>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</security:authorize></td>
									</tr>
								</table>
							</td>
							<td width="16"><img
								src='<c:url value="/resources/images/tab_07.gif"/>' width="16"
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
								background='<c:url value="/resources/images/tab_12.gif"/>'>
								&nbsp;</td>
							<td width="1155">
								<table id="freqtable" class="table" cellspacing="1"
									style="width: 500px" align="center">
									<tr class="bg_tr" id="freqhead">
										<td class="STYLE3">项目</td>
										<td class="STYLE3">频率</td>
										<td class="STYLE3">单位</td>
									</tr>
									
								</table>
						
						<td width="8"
							background='<c:url value="/resources/images/tab_15.gif"/>'>
							&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="35"
					background='<c:url value="/resources/images/tab_19.gif"/>'>
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