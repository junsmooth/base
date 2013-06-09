package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.BMWYService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("bmwy")
public class BMWYController {
	@Autowired
	private BMWYService service;

	@RequestMapping("data")
	public String index() {
		return "data/bmwy/list";
	}

	@RequestMapping("data/bmwyData")
	@ResponseBody
	public Object list(TableParam param) {

		return service.getPagedList(param);
	}
	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return service.getAllPoints();
	}
}
