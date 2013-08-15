<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="resources/login/User_Login.css">
</head>
<body id="userlogin_body" onload='document.f.j_username.focus();'>
	<div id=user_login>
		<dl>
			<dd id=user_top>
				<ul>
					<li class=user_top_l></li>
					<li class=user_top_c></li>
					<li class=user_top_r></li>
				</ul>
			</dd>
			<form name='f' action='<c:url value="/j_spring_security_check" />' method='POST'>
			<dd id="user_main">
				<ul>
					<li class="user_main_l"></li>
					<li class="user_main_c">
						<div class="user_main_box">
							<ul>
								<li class="user_main_text">用户名：</li>
								<li class="user_main_input">
								<input class='userNameInputCls'
									id="TxtUserName" maxLength=20 name="j_username" value=''> </li>
							</ul>
							<ul>
								<li class="user_main_text">密 码：</li>
								<li class="user_main_input"><input class="TxtPasswordCssClass"
									id="TxtPassword" type="password" name="j_password"></li>
							</ul>
							<!-- <ul>
								<li class="user_main_text">记住我：</li>
								<li class="user_main_input"><input type='checkbox' name='_spring_security_remember_me'/></li>
							</ul> -->
						</div>

					</li>
					<li class="user_main_r">
					<input class="IbtnEnterCssClass"
						id="IbtnEnter"
						style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px"
						type=image src="resources/login/user_botton.gif" name="submit"></li>
				</ul>
			</dd>
			</form>
			
			<dd id="user_bottom">
				<ul>
					<li class="user_bottom_l"></li>
					<li class="user_bottom_c">
					<div align="center"  style=" COLOR: red">${SPRING_SECURITY_LAST_EXCEPTION}</div>
					
					
					</li>
					
					<li class="user_bottom_r"></li>
				</ul>
			</dd>
		</dl>
	</div>
	
</body>
</html>