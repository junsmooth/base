package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.BDGCService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("bdgc")
public class BDGCController {

	@Autowired
	private BDGCService bdgcService;
	@RequestMapping("data")
	public String dataIndex(){
		
		return "data/bdgc/bdgcData";
	}
	@RequestMapping("chart")
	public String chartIndex(){
		
		return "data/bdgc/bdgcChart";
	}
	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return bdgcService.getAllPoints();
	}
	

	@RequestMapping("data/bdgcData")
	@ResponseBody
	public Object DamCrestList(TableParam param) {

		return bdgcService.getDamCrestPageList(param);
	}
	
	@RequestMapping("chart/bdgcChart")
	@ResponseBody
	public Object bdgcChart(TableParam param){
		
		return bdgcService.getBDGCChartList(param);
	}
}
