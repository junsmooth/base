package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.JYLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("jyl")
public class JYLController {

	@Autowired
	private JYLService jylService;
	@RequestMapping("data")
	public String dataIndex(){
		
		return "data/jyl/jylData";
	}
	
	
	@RequestMapping("chart")
	public String chartIndex(){
		
		return "data/jyl/jylChart";
	}
	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return jylService.getAllPoints();
	}
	
	
	@RequestMapping("data/jylData")
	@ResponseBody
	public Object jylList(TableParam param) {

		return jylService.getJYLPageList(param);
	}
	
	@RequestMapping("chart/jylChart")
	@ResponseBody
	public Object	jylChart(TableParam param){
		
		return jylService.getJYLChartList(param);
	}
	
	@RequestMapping("chart/jylHistogram")
	@ResponseBody
	public Object	jylHistogram(TableParam param){
		
		return jylService.getEverydayJYLData(param);
	}
}
