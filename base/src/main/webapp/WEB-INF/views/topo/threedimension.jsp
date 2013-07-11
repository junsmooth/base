<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
body, html,#threeDMap {width: 100%;height: 100%;overflow: hidden;margin:0;}
#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
#r-result{height:100%;width:20%;float:left;}
</style>
<div id="threeDMap"></div>
<script>
Namespace.register("topo.satellite",{
	
	
});
var map = new BMap.Map("threeDMap", {mapType:BMAP_PERSPECTIVE_MAP});
var point = new BMap.Point(116.4035,39.915);
map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的

map.centerAndZoom(point,19);
map.enableScrollWheelZoom(true);  
</script>
