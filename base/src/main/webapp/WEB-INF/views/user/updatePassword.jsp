<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>系统密码管理</title>
		<link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css">
		<script type="text/javascript">
	    function submit_save() {
	    	var name=document.forms[0].name.value;
	    	if(name==null||name==""){
	    		alert("用户名不能为空!");
	    		return;
	    	}
	    	var password1=document.forms[0].password.value;
	    	var password2=document.forms[0].newpassword2.value;
	    	if(password2==password2){
			   document.forms[0].action = "<c:url value="/user/updatePassword" />";
			   document.forms[0].submit();
			}else{
			   alert("密码不一致，请重新确认输入!");
			}
		}
		</script>
	</head>
	<body>
		<form name="pwdForm" action="#" method="POST">
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
															<span class="STYLE3">您当前的位置</span>：[用户信息修改]
														</td>
													</tr>
												</table>
											</td>
											<td width="54%">
												<table border="0" align="right" cellpadding="0"
													cellspacing="0">
													<tr>
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
								<td width="1155">
									<table class="table" cellspacing="1" align="center"
										style="width: 350px">
										<tr class="bg_tr">
											<td class="STYLE3" align="right">
												原用户名
											</td>
											<td class="bg_td2">
												<security:authentication property="principal.username"/>
											</td>
										</tr>
										<tr class="bg_tr">
											<td class="STYLE3" align="right">
												新用户名
											</td>
											<td class="bg_td2">
												<input type="text" name="name"
													style="width: 150px; height: 17px; background-color: #fffff; border: solid 1px #a4b5c8; font-size: 12px; color: #283439;" />
											</td>
										</tr>
										<tr class="bg_tr">
											<td class="STYLE3" align="right">
												新密码
											</td>
											<td class="bg_td2">
												<input type="password" name="password"
													style="width: 150px; height: 17px; background-color: #fffff; border: solid 1px #a4b5c8; font-size: 12px; color: #283439;" />
											</td>
										</tr>
										<tr class="bg_tr">
											<td class="STYLE3" align="right">
												密码确认
											</td>
											<td class="bg_td2">
												<input type="password" name="newpassword2"
													style="width: 150px; height: 17px; background-color: #fffff; border: solid 1px #a4b5c8; font-size: 12px; color: #283439;" />
											</td>
										</tr>
										<tr class="bg_tr">
											<td colspan="2" align="center">
												<img src="<c:url value="/resources/images/tijiao.gif" />" onclick="submit_save()" />
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<img src="<c:url value="/resources/images/chongzhi.gif" />"
													onclick="javascript:pwdForm.reset()" />
											</td>
										</tr>
									</table>
								</td>
								<td width="8" background="<c:url value="/resources/images/tab_15.gif" />">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="35" background="<c:url value="/resources/images/tab_19.gif" />">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="12" height="35">
									<img src="<c:url value="/resources/images/tab_18.gif"/>" width="12" height="35" />
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
									<img src="<c:url value="/resources/images/tab_20.gif" />" width="16" height="35" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
