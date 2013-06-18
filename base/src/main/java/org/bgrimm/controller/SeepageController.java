package org.bgrimm.controller;

import javax.annotation.Resource;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.IDamCrestService;
import org.bgrimm.service.IFreeBoardService;
import org.bgrimm.service.IRainfallService;
import org.bgrimm.service.ISeepageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("seepage")
public class SeepageController {

	@Resource(name="seepageServiceImpl")
	private ISeepageService seepageServiceImpl;
	
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
