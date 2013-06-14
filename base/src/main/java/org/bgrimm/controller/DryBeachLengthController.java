package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.IDryBeachLengthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("dryBeachLength")
public class DryBeachLengthController {

	@Autowired
	private IDryBeachLengthService dryBeachLengthService;
	@RequestMapping("data")
	public String index(){
		
		return "data/dryBeachLength/dryBeachLengthData";
	}
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return dryBeachLengthService.getAllPoints();
	}
	
	@RequestMapping("data/dryBeachLengthData")
	@ResponseBody
	public Object DamList(TableParam param) {

		return dryBeachLengthService.getDryBeachPageList(param);
	}
}
