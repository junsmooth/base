package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.XMGK;
import org.bgrimm.service.impl.XMGKService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("xmgk")
public class XMGKController {

	@Autowired
	private XMGKService xmgkService;
	
	@RequestMapping("iniData")
	public String index(Model model){
	
		Object xmgk=xmgkService.getXMGKData();
		model.addAttribute("xmgk", xmgk);
		return "xmgk";
	}
	
	@RequestMapping("saveOrUpdateData")
	public String saveOrUpdateData(@ModelAttribute XMGK xm){
		xmgkService.updateData(xm);
		return "redirect:iniData";
	}
}
