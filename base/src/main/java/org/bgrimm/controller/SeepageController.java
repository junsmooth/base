package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.SeepageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("seepage")
public class SeepageController {

	@Autowired
	private SeepageServiceImpl seepageServiceImpl;
	
	@RequestMapping("data")
	public String index(){
		return "data/seepage/seepageData";
	}
	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return seepageServiceImpl.getAllPoints();
	}
	

	@RequestMapping("data/seepageData")
	@ResponseBody
	public Object seepageList(TableParam param) {

		return seepageServiceImpl.getSeepagePageList(param);
	}
}
