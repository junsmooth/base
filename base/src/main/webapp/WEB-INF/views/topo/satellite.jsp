<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
#r-result{height:100%;width:20%;float:left;}
</style>

<div id="allmap"></div>
<script>
Namespace.register("topo.satellite",{
	
	
});
var map = new BMap.Map("allmap",{mapType: BMAP_HYBRID_MAP});      //设置卫星图为底图
var point = new BMap.Point(116.4035,39.915);
map.centerAndZoom(point,17);
map.enableScrollWheelZoom();   
</script>
