package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.WKKGK;
import org.bgrimm.service.impl.WKKGKService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("wkkgk")
public class WKKGKController {

	@Autowired
	private WKKGKService wkkgkService;
	
	@RequestMapping("iniData")
	public String index(Model model){
	
		Object wkkgk=	wkkgkService.getWKKGKData();
		model.addAttribute("wkkgk", wkkgk);
		return "wkkgk";
	}
	
	@RequestMapping("saveOrUpdateData")
	public String saveOrUpdateData(@ModelAttribute WKKGK wk){
		wkkgkService.updateData(wk);
		return "redirect:iniData";
	}
}
