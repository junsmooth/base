package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.DryBeachElevationServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("dryBeachElevation")
public class DryBeachElevationController {

	@Autowired
	private DryBeachElevationServiceImpl dryBeachElevationService;
	@RequestMapping("data")
	public String index(){
		
		return "data/dryBeachElevation/dryBeachElevationData";
	}
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return dryBeachElevationService.getAllPoints();
	}
	
	@RequestMapping("data/dryBeachElevationData")
	@ResponseBody
	public Object DamList(TableParam param) {

		return dryBeachElevationService.getDryBeachPageList(param);
	}
}
