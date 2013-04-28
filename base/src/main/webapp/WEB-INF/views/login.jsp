<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript">
	  function onSubmit() {
		document.forms[0].submit();
	  }
	  function onReset() {
		document.forms[0].reset();
	  }
	  function keyup(){
		  if(window.event.keyCode==13){
			  document.forms[0].submit();
		  }
	  }
</script>

    <base href="<%=basePath%>">
    <title>河北金厂峪矿业有限责任公司尾矿库安全监测系统
</title>
  </head>
  
<body onkeyup="keyup()" onload=document.form1.j_username.focus() >
<center>
 
	<div id="main" style="margin:0;padding:0;">
		<div id="mainimage">
			<a href="#"><img src="<c:url value="/resources/images/main4.JPG" />" border=0 ></img></a></div>
	</div>
 <div style="margin:0;padding:0;">
 <h2>河北金厂峪矿业有限责任公司尾矿库安全监测系统
</h2>
 </div>
	<div id="loginform" style="margin:0;padding:0;">
			<form name="form1" method="post" action="j_spring_security_check">
				<label for="inp_name">用户名:</label>
					<input type="text" name="j_username" id="j_username"  
					 size="12" maxlength="14" style="width:100px; height:22px;" >
					<label for="j_userpass">密码:</label>
					<input type="password" name="j_password" id="j_password" 
					size="12" maxlength="40" style="width:100px; height:22px;">        
					<input value="登录" type="submit" class="btn" onClick="onSubmit()" style="width:48px; height:22px;">
					<input value="重置" type="reset" class="btn" onClick="onReset()" style="width:48px; height:22px;"> 
			</form>
	</div>
	<% 
	String error=request.getParameter("login_error");
	if(error!=null) {
		out.println(error);
	//if(error.equals("1"))
	 %>
<div style="font-size:14;color:#f00">用户名或密码出错，请重新输入</div>
	<%} else {%>
<div style="font-size:14;color:#00f">请输入用户名和密码</div>
	<% }%>
<div style="font-size:16;">&copy;版权所有：&nbsp;<a href="">河北金厂峪矿业有限责任公司</a>
	&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.bgrimm.com">北京矿冶研究总院</a></div>
<div style="font-size:12;">建议使用：IE浏览器，分辨率为1024*768 </div>

<div id="errormsg"  style="display:none">"${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}"</div>
</center>
</body>
</html>
