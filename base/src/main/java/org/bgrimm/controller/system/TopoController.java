package org.bgrimm.controller.system;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("topo")
public class TopoController {
	@RequestMapping("main")
	public String main(Model model) {
		return "menu/main";
	}

	@RequestMapping("data")
	public @ResponseBody
	Object loadData() {

		return null;
	}

}
