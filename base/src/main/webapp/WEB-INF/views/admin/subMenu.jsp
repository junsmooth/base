<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>菜单管理</title>

<link rel="stylesheet" type="text/css" media="screen"
	href='<c:url value="/resources/css/smoothness/jquery-ui-1.9.0.custom.css" />' />
<link rel="stylesheet" type="text/css" media="screen"
	href='<c:url value="/resources/css/ui.jqgrid.css" />' />

<script src='<c:url value="/resources/js/jquery-1.7.2.min.js" />'
	type="text/javascript"></script>
<script src='<c:url value="/resources/js/i18n/grid.locale-cn.js" />'
	type="text/javascript"></script>
<script src='<c:url value="/resources/js/jquery.jqGrid.min.js" />'
	type="text/javascript"></script>
<script
	src='<c:url value="/resources/js/jquery-ui-1.9.0.custom.min.js" />'
	type="text/javascript"></script>
<script type="text/javascript">
	var id = "${id}";
	$(document).ready(function() {
		$("#list").jqGrid({
			url : 'admin/subMenu/' + id,
			editurl : "admin/edit",
			datatype : 'json',
			mtype : 'GET',
			colNames : [ 'ID', '顺序', '名称', 'URL', '访问权限', '启用' ],
			onCellSelect : function(rowid, iCol, cellcontent, e) {
			},
			colModel : [ {
				name : 'id',
				width : 80,
				align : 'center',
				title : false
			}, {
				name : 'indx',
				width : 80,
				align : 'center',
				editable : true,
				editrules : {
					required : true,
					number:true
				}

			}, {
				name : 'name',
				width : 160,
				align : 'center',
				editable : true,
				editrules : {
					required : true
				}
			}, {
				name : 'url',
				width : 320,
				align : 'left',
				editable : true,
				editrules : {
					required : true
				}
			}, {
				name : 'authority',
				width : 50,
				align : 'center',
				editable : true,
				edittype : "select",
				editoptions : {
					value : "ROLE_QUERY:查询;ROLE_MANAGER:操作;ROLE_ADMIN:系统管理"
				},
				editable : true
			}, {
				name : 'enabled',
				width : 80,
				align : 'center',
				editable : true,
				edittype : "checkbox",
				editoptions : {
					value : "true:false"
				}
			} ],
			loadComplete : function(data) {
			},
			//cellEdit : true,
			//cellsubmit : 'clientArray',
			pager : '#pager',
			rowNum : 10,
			rowList : [ 10, 20, 30 ],
			viewrecords : true,
			gridview : true,
			caption : '菜单管理',
			jsonReader : {
				repeatitems : false,
				id : "id",
				root : function(obj) {
					for ( var i = 0; i < obj.length; i++) {
						var auth = obj[i].authority;
						var lev = obj[i].level;
						window.menulevel = lev;
						if (lev == 1) {
							obj[i].url = "不可用";
						}
						if (auth == 'ROLE_QUERY') {

							obj[i].authority = '查询';
						}
						if (auth == 'ROLE_MANAGER') {
							obj[i].authority = '操作';
						}
						if (auth == 'ROLE_ADMIN') {
							obj[i].authority = '系统管理';
						}

					}
					return obj;
				},
				page : function(obj) {
					return 1;
				},
				total : function(obj) {
					return 1;
				},
				records : function(obj) {
					return obj.length;
				}

			}
		});
		$("#list").jqGrid('navGrid', "#pager", {
			search : false,
			refresh : false
		}, {//edit

		}, {//add
			onclickSubmit : function(params, posdata) {
				posdata.level = 2;
				posdata.parent = id;
				return posdata;
			}

		});
		/*$("#list").jqGrid('sortableRows');

		 */
		$("#list").jqGrid('navButtonAdd', "#pager", {
			caption : "",
			title : "返回",
			buttonicon : 'ui-icon-arrowreturnthick-1-w',
			onClickButton : function() {
				location.href="admin";

			}
		});
	});
</script>
</head>
<body>
	<table id="list">
		<tr>
			<td />
		</tr>
	</table>
	<div id="pager"></div>
</body>
</html>