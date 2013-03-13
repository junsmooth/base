<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>无标题文档</title>
		<style type="text/css">
            <!--
            body {
	           margin-left: 0px;
	           margin-top: 0px;
	           margin-right: 0px;
	           margin-bottom: 0px;
            }
            .navPoint {
	           COLOR: white;
	           CURSOR: hand;
	           FONT-FAMILY: Webdings;
	           FONT-SIZE: 9pt
            }
            -->
        </style>
		<script>
	         function switchSysBar() {
		         var locate = location.href.replace('middel.jsp', '');
		         var ssrc = document.all("img1").src.replace(locate, '');
		         if (ssrc == "resources/images/menu/main_55.gif") {
			         document.all("img1").src = "<c:url value="/resources/images/menu/main_55_1.gif"/>";
			         document.all("frmTitle").style.display = "none";
		         } else {
			         document.all("img1").src = "<c:url value="/resources/images/menu/main_55.gif"/>";
			         document.all("frmTitle").style.display = "";
		         }
	         }
        </script>
	</head>
	<body style="overflow: hidden">
		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0" style="table-layout: fixed;">
			<tr>
				<td width="201" id="frmTitle" noWrap="nowrap" align="center"
					valign="top">
					<table width="201" height="100%" border="0" cellpadding="0"
						cellspacing="0" style="table-layout: fixed;">
						<tr>
							<td bgcolor="#1873aa" style="width: 6px;">
								&nbsp;
							</td>
							<td width="195">
								<iframe name="I1" height="100%" width="195" src="left"
									frameborder="0" scrolling="no">
									浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。
								</iframe>
							</td>
						</tr>
					</table>
				</td>
				<td width="6" style="width: 6px;" valign="middle" bgcolor="1873aa" onclick="switchSysBar()">
					<SPAN class=navPoint id=switchPoint title=关闭/打开左栏><img
							src="<c:url value="/resources/images/menu/main_55.gif"/>" name="img1" width="6" height="40" id="img1">
					</SPAN>
				</td>
				<td width="100%" align="center" valign="top">
					<iframe name="I3" height="100%" width="100%" frameborder="0" src="/Bgrimminformation/bgrimmfirstpage.action">
						浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。
					</iframe>
				</td>
			</tr>
		</table>
	</body>
</html>
