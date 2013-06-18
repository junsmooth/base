package org.bgrimm.controller;

import javax.annotation.Resource;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.IRainfallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("rainfall")
public class RainfallController {

	@Autowired
	private IRainfallService rainfallServiceImpl;
	@RequestMapping("data")
	public String index(){
		
		return "data/rainfall/rainfallData";
	}
	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return rainfallServiceImpl.getAllPoints();
	}
	
	
	@RequestMapping("data/rainfallData")
	@ResponseBody
	public Object RainfallList(TableParam param) {

		return rainfallServiceImpl.getRainfallPageList(param);
	}
}
