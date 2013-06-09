package org.bgrimm.controller;

import java.util.List;

import org.bgrimm.service.system.T4DDBTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("test")
public class TestController {
	
	@Autowired
	private T4DDBTestService service;
	
	@RequestMapping("info")
	public @ResponseBody String infoView(Model model) {
		return "test/info";
	}

}
