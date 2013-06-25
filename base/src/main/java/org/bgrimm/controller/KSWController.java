package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.KSWService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("ksw")
public class KSWController {
	@Autowired
	private KSWService kswService;

	@RequestMapping("data")
	public String dataIndex(){
		
		return "data/ksw/kswData";
	}
	@RequestMapping("chart")
	public String chartIndex(){
		
		return "data/ksw/kswChart";
	}
	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return kswService.getAllPoints();
	}
	
	
	@RequestMapping("data/kswData")
	@ResponseBody
	public Object kswList(TableParam param) {

		return kswService.getKSWPageList(param);
	}
	
	@RequestMapping("chart/kswChart")
	@ResponseBody
	public Object kswChart(TableParam param){
		
		return kswService.getKSWChartList(param);
	}
}
