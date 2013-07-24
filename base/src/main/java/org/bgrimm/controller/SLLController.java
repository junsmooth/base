package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.SLLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("sll")
public class SLLController {

	@Autowired
	private SLLService sslService;
	
	@RequestMapping("data")
	public String dataIndex(){
		return "data/sll/sllData";
	}
	
	@RequestMapping("chart")
	public String chartIndex(){
		return "data/sll/sllChart";
	}
	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return sslService.getAllPoints();
	}
	

	@RequestMapping("data/sllData")
	@ResponseBody
	public Object sllList(TableParam param) {

		return sslService.getSLLList(param);
	}
	
	@RequestMapping("chart/sllChart")
	@ResponseBody
	public Object sllChart(TableParam param){
		
		return sslService.getSLLChartList(param);
	}
}
