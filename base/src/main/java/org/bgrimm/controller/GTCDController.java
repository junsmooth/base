package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.GTCDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("gtcd")
public class GTCDController {

	@Autowired
	private GTCDService gtcdService;
	@RequestMapping("data")
	public String dataIndex(){
		
		return "data/gtcd/gtcdData";
	}
	@RequestMapping("chart")
	public String chartIndex(){
		
		return "data/gtcd/gtcdChart";
	}
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return gtcdService.getAllPoints();
	}
	
	@RequestMapping("data/gtcdData")
	@ResponseBody
	public Object gtcdList(TableParam param) {

		return gtcdService.getGTCDPageList(param);
	}
	
	@RequestMapping("chart/gtcdChart")
	@ResponseBody
	public Object gtcdChart(TableParam param){
		
		return gtcdService.getGTCDChartList(param);
	}
}
