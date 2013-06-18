package org.bgrimm.controller;

import javax.annotation.Resource;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.IFreeBoardService;
import org.bgrimm.service.IRainfallService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("freeBoard")
public class FreeBoardController {

	@Resource(name="freeBoardServiceImpl")
	private IFreeBoardService freeBoardServiceImpl;
	@RequestMapping("data")
	public String index(){
		
		return "data/freeBoard/freeBoardData";
	}
	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return freeBoardServiceImpl.getAllPoints();
	}
	
	@RequestMapping("data/freeBoardData")
	@ResponseBody
	public Object DryBeachLenList(TableParam param) {

		return freeBoardServiceImpl.getFreeBoardPageList(param);
	}
}
