package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.NBWYService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("nbwy")
public class NBWYController {

	@Autowired
	private NBWYService nbwyService;
	
	@RequestMapping("data")
	public String dataIndex(){
		return "data/nbwy/nbwyData";
	}
	
	@RequestMapping("chart")
	public String chartIndex(){
		return "data/nbwy/nbwyChart";
	}
	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return nbwyService.getAllPoints();
	}
	
	
	@RequestMapping("data/nbwyData")
	@ResponseBody
	public Object innerDispList(TableParam param) {

		return nbwyService.getNBWYPageList(param);
	}
	
	@RequestMapping("chart/nbwyChart")
	@ResponseBody
	public Object nbwyChart(TableParam param){
		
		return nbwyService.getNBWYChartList(param);
	}
}
