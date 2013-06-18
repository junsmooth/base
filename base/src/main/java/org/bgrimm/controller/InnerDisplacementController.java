package org.bgrimm.controller;

import javax.annotation.Resource;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.IDamCrestService;
import org.bgrimm.service.IFreeBoardService;
import org.bgrimm.service.IInnerDisplacementService;
import org.bgrimm.service.IRainfallService;
import org.bgrimm.service.ISeepageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("innerDisp")
public class InnerDisplacementController {

	@Resource(name="innerDisplacementServiceImpl")
	private IInnerDisplacementService innerDisplacementServiceImpl;
	
	@RequestMapping("data")
	public String index(){
		return "data/innerDisp/innerDispData";
	}
	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return innerDisplacementServiceImpl.getAllPoints();
	}
	
	
	@RequestMapping("data/innerDispData")
	@ResponseBody
	public Object innerDispList(TableParam param) {

		return innerDisplacementServiceImpl.getInnerDispPageList(param);
	}
}
