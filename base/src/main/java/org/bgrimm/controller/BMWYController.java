package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.BMWYService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("bmwy")
public class BMWYController {
	@Autowired
	private BMWYService service;

	@RequestMapping("data")
	public String index() {
		return "data/bmwy/list";
	}

	@RequestMapping("chart")
	public String chartIndex() {
		return "data/bmwy/bmwyChart";
	}
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return service.getAllPoints();
	}
	@RequestMapping("data/directions")
	@ResponseBody
	public Object directions(){
		
		return service.getAllDirections();
	}
	
	
	
	@RequestMapping("data/bmwyData")
	@ResponseBody
	public Object list(TableParam param) {

		return service.getPagedList(param);
	}
	
	
	@RequestMapping("chart/bmwyChart")
	@ResponseBody
	public Object bmwyChart(TableParam param){
		
		return service.getBMWYChartList(param);
	}
}
