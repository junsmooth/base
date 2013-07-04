<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
	<script>
		$(function(){
			$('#pp').portal({
				border:false,
				fit:true
			});
			add();
			addChart();
		});
		function add(){
			var p = $('<div/>').appendTo('#pp');
				p.panel({
					title:'Title',
					height:300,
					closable:true,
					collapsible:true,
				});
				p.panel('open').panel('refresh','alarm/alarmrecord');
				$('#pp').portal('add', {
					panel:p,
					columnIndex:1
				});
			$('#pp').portal('resize');
		}
		function addChart(){
			var p = $('<div/>').appendTo('#pp');
				p.panel({
					title:'Title',
					height:300,
					closable:true,
					collapsible:true,
				});
				p.panel('open').panel('refresh','bmwy/chart');
				$('#pp').portal('add', {
					panel:p,
					columnIndex:0
				});
			$('#pp').portal('resize');
		}
		function remove(){
			$('#pp').portal('remove',$('#pgrid'));
			$('#pp').portal('resize');
		}
	</script>
		<div id="pp" style="position:relative" data-options="fit:true">
			<div id="contentId" style="width:30%;">
				<div title="Clock" style="text-align:center;background:#f3eeaf;height:150px;padding:5px;">
					<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="100" height="100">
				      <param name="movie" value="http://www.respectsoft.com/onlineclock/analog.swf">
				      <param name=quality value=high>
				      <param name="wmode" value="transparent">
				      <embed src="http://www.respectsoft.com/onlineclock/analog.swf" width="100" height="100" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" wmode="transparent"></embed>
				    </object>
			    </div>
			</div>
			<div style="width:40%;">
			</div>
		</div>
