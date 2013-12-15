package org.bgrimm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("ksw")
public class KSWController {
	@RequestMapping("data")
	public String list() {
		return "ksw/data";
	}

}
