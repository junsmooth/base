package org.bgrimm.controller;

import java.util.List;

import org.bgrimm.service.impl.BMWYService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("test")
public class TestController {
	
	@Autowired
	private BMWYService service;
	
	@RequestMapping("info")
	public @ResponseBody String infoView(Model model) {
//		service.getT4ddb();
		return "test/info";
	}

}
