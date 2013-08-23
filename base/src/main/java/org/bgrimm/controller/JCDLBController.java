package org.bgrimm.controller;

import java.util.List;

import org.bgrimm.service.system.TopoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("jcdlb")
public class JCDLBController {

	@Autowired
	private TopoService topoService;
	
	@RequestMapping("/init")
	public String index(Model model){
		return "data/jcdlb/jcdlb";
	}
	
	@RequestMapping("data")
	@ResponseBody
	public Object jcdlbData(Model model){

		return  topoService.getAllDataList();
	}
}
