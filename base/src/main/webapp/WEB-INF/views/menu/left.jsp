<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link href="<c:url value="/css/left.css"/>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value="/js/jquery-1.4.2.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.pnotify.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.8.2.custom.min.js" />"></script>
<link href="<c:url value="/css/jquery-ui-1.8.2.custom.css"/>" rel="stylesheet"
	type="text/css" />

<script>

	function showsubmenu(sid) {
		whichEl = eval("submenu" + sid);
		imgmenu = eval("imgmenu" + sid);
		if (whichEl.style.display == "none") {
			eval("submenu" + sid + ".style.display=\"\";");
			imgmenu.background = "<c:url value="/resources/images/menu/main_47.gif" />";
		} else {
			eval("submenu" + sid + ".style.display=\"none\";");
			imgmenu.background = "<c:url value="/resources/images/menu/main_47.gif" />";
		}
	}
	function createMenu(result) {
		var obj = result;
		var html = "";
		for ( var i = 0; i < obj.length; i++) {
			var menu = obj[i];
			var submenus = obj[i].subMenu;
			html += '<tr>'
					+ '	<td>'
					+ '		<table width="100%" border="0" cellspacing="0" cellpadding="0">'
					+ '			<tr>'
					+ '				<td height="23" background="<c:url value="/resources/images/menu/main_47.gif"/>" id="imgmenu'
					+ (i + 1)
					+ '"'
					+ '					class="menu_title" onMouseOver="this.className=\'menu_title2\';"'
					+ '					onClick="showsubmenu('
					+ (i + 1)
					+ ')" onMouseOut="this.className=\'menu_title\';"'
					+ '					style="cursor: pointer">'
					+ '					<table width="100%" border="0" cellspacing="0" cellpadding="0">'
					+ '						<tr>'
					+ '							<td width="18%">&nbsp;</td>'
					+ '							<td width="82%" class="STYLE1">'
					+ menu.name
					+ '</td>'
					+ '						</tr>'
					+ '					</table>'
					+ '				</td>'
					+ '			</tr>'
					+ '			<tr>'
					+ '				<td background="<c:url value="/resources/images/menu/main_51.gif"/>" id="submenu'
					+ (i + 1)
					+ '"'
					+ '					style="DISPLAY: none">'
					+ '					<div class="sec_menu">'
					+ '						<table width="100%" border="0" cellspacing="0" cellpadding="0">';
			if (submenus == null) {
				continue;
			}
			for ( var j = 0; j < submenus.length; j++) {
				var sub = submenus[j];
				html += '							<tr>'
						+ '								<td>'
						+ '									<table width="90%" border="0" align="center" cellpadding="0"'
						+ '										cellspacing="0">'
						+ '										<tr>'
						+ '											<td width="16%" height="25">'
						+ '												<div align="center">'
						+ '													<img src="<c:url value="/resources/images/menu/left.gif"/>" width="10" height="10" />'
						+ '												</div>'
						+ '											</td>'
						+ '											<td width="84%" height="23">'
						+ '												<table width="95%" border="0" cellspacing="0"'
						+ '													cellpadding="0">'
						+ '													<tr>'
						+ '														<td height="20" style="cursor: pointer"'+
				'															onMouseOver="this.style.borderStyle=\'solid\';this.style.borderWidth=\'1\';borderColor=\'#7bc4d3\'; "'+
				'															onmouseout="this.style.borderStyle=\'none\'"><span'+
				'															class="STYLE3"><A'+
				'																href="'+sub.url+'"'+
				'																target="I3">'
						+ sub.name + '</A> </span></td>' + '													</tr>'
						+ '												</table>' + '											</td>'
						+ '										</tr>' + '									</table>'
						+ '								</td>' + '							</tr>';

			}
			html += '							<tr>'
					+ '								<td height="5"><img src="<c:url value="/resources/images/menu/main_52.gif"/>" width="181"'+
			'									height="5" /></td>'
					+ '							</tr>' + '						</table>' + '					</div>'
					+ '				</td>' + '			</tr>' + '' + '		</table>' + '	</td>'
					+ '</tr>';

		}
		html += '<tr>'
				+ '								<td>'
				+ '									<table width="100%" border="0" cellspacing="0" cellpadding="0">'
				+ '										<tr>'
				+ '											<td height="23" background="<c:url value="/resources/images/menu/main_47.gif"/>" id="imgmenu10"'
				+ '												class="menu_title"'
				+ '												onMouseOver="this.className=\'menu_title2\';"'
				+ '												onClick="showsubmenu(10)"'
				+ '												onMouseOut="this.className=\'menu_title\';"'
				+ '												style="cursor: pointer">'
				+ '												<table width="100%" border="0" cellspacing="0"'
				+ '													cellpadding="0">'
				+ '													<tr>'
				+ '														<td width="18%">'
				+ '															&nbsp;'
				+ '														</td>'
				+ '														<td width="82%" class="STYLE1">'
				+ '															技术支持'
				+ '														</td>'
				+ '													</tr>'
				+ '												</table>'
				+ '											</td>'
				+ '										</tr>'
				+ '										<tr>'
				+ '											<td background="<c:url value="/resources/images/menu/main_51.gif" />" id="submenu10"'+
		'												style="DISPLAY: block">'
				+ '												<div class="sec_menu">'
				+ '													<table width="100%" border="0" cellspacing="0"'
				+ '														cellpadding="0">'
				+ '														<tr>'
				+ '															<td>'
				+ '																<table width="90%" border="0" align="center"'
				+ '																	cellpadding="0" cellspacing="0">'
				+ '																	<tr>'
				+ '																		<td height="20" >'
				+ '																		<span class="STYLE3" style="font-size: 15px;">Tel:010-63299648</span>'
				+ '																		</td>'
				+ '																	</tr>'
				+ '																</table>'
				+ '															</td>'
				+ '														</tr>'
				+ '														<tr>'
				+ '															<td height="5"><img src="<c:url value="/resources/images/menu/main_52.gif" />" width="181" height="5" /></td>'
				+ '														</tr>' + '													</table>'
				+ '												</div>' + '											</td>' + '										</tr>'
				+ '									</table>' + '								</td>' + '							</tr>';
	
				$("#menuTable").html(html);
	}

	$(document).ready(function() {
		$.ajax({
			url : "/Bgrimminformation/menu/menuList",
			success : createMenu

		});
	});
</script>



</head>
<body>

	<table width="195" height="100%" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="28" background="<c:url value="/resources/images/menu/main_40.gif" />">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="19%"></td>
						<td width="81%" height="20"><span class="STYLE1">管理菜单</span>
						</td>
					</tr>
				</table>
			</td>
		</tr>

		<tr>
			<td valign="top">
				<div id="tableContainer"
					style="clear: both; overflow-y: auto; height: 100%; vertical-align: middle;">
					<table id="menuTable" width="181" border="0" align="center"
						cellpadding="0" cellspacing="0">


					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td height="18" background="<c:url value="/resources//images/menu/main_58.gif" />">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="18" valign="bottom">
							<div align="center" class="STYLE3" style="font-size: 13px">
								北京矿冶研究总院版权所有</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>