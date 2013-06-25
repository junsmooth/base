package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.AQCGService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("aqcg")
public class AQCGController {

	@Autowired
	private AQCGService aqcgService;
	@RequestMapping("data")
	public String dataIndex(){
		
		return "data/aqcg/aqcgData";
	}
	
	@RequestMapping("chart")
	public String chartIndex(){
		
		return "data/aqcg/aqcgChart";
	}
	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return aqcgService.getAllPoints();
	}
	
	@RequestMapping("data/aqcgData")
	@ResponseBody
	public Object aqcgList(TableParam param) {

		return aqcgService.getAQCGPageList(param);
	}
	
	@RequestMapping("chart/aqcgChart")
	@ResponseBody
	public Object aqcgChart(TableParam param){
		
		return aqcgService.getAQCGChartList(param);
	}
}
