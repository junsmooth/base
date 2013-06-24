package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.WaterLevelServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("waterLevel")
public class WaterLevelController {
	@Autowired
	@Qualifier("waterLevelServiceImpl")
	private WaterLevelServiceImpl waterLevelService;

	@RequestMapping("data")
	public String index(){
		
		return "data/waterLevel/waterLevelData";
	}
	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return waterLevelService.getAllPoints();
	}
	
	
	@RequestMapping("data/waterLevelData")
	@ResponseBody
	public Object WaterLevelList(TableParam param) {

		return waterLevelService.getWaterLevelPageList(param);
	}
}
