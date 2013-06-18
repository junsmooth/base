package org.bgrimm.controller;

import javax.annotation.Resource;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.IDamCrestService;
import org.bgrimm.service.IFreeBoardService;
import org.bgrimm.service.IRainfallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("damCrest")
public class DamCrestController {

	@Autowired
	private IDamCrestService damCrestServiceImpl;
	@RequestMapping("data")
	public String index(){
		
		return "data/damCrest/damCrestData";
	}
	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return damCrestServiceImpl.getAllPoints();
	}
	

	@RequestMapping("data/damCrestData")
	@ResponseBody
	public Object DamCrestList(TableParam param) {

		return damCrestServiceImpl.getDamCrestPageList(param);
	}
}
