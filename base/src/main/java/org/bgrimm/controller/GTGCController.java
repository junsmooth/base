package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.GTGCServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("gtgc")
public class GTGCController {

	@Autowired
	private GTGCServiceImpl gtgcService;
	@RequestMapping("data")
	public String datIndex(){
		
		return "data/gtgc/gtgcData";
	}
	@RequestMapping("chart")
	public String chartIndex(){
		
		return "data/gtgc/gtgcChart";
	}
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return gtgcService.getAllPoints();
	}
	
	@RequestMapping("data/gtgcData")
	@ResponseBody
	public Object gtgcList(TableParam param) {

		return gtgcService.getGTGCPageList(param);
	}
	

	@RequestMapping("chart/gtgcChart")
	@ResponseBody
	public Object gtgcChart(TableParam param){
		
		return gtgcService.getGCGCChartList(param);
	}
}
