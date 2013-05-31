package org.bgrimm.controller;

import java.util.List;

import org.bgrimm.service.system.T4DDBTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("test")
public class TestController {
	
	@Autowired
	private T4DDBTestService service;
	
	@RequestMapping("info")
	public String infoView(Model model) {
	List list=	service.getT4ddb();
	System.out.println(list.size()+"--------------------------------");
		return "test/info";
	}

}
