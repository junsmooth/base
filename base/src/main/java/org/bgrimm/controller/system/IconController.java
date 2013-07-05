package org.bgrimm.controller.system;

import javax.servlet.http.HttpServletRequest;

import org.bgrimm.service.system.IconService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("icon")
public class IconController {
	@Autowired
	private IconService service;

	@RequestMapping(method = RequestMethod.GET)
	public String list() {
		return "icon/list";
	}

	@RequestMapping("list/data")
	public @ResponseBody
	Object dataList(@RequestParam int page, @RequestParam int rows) {
		return service.getPagedList(page, rows);
	}

	@RequestMapping("type/{type}")
	public @ResponseBody
	Object typeIcons(@PathVariable String type) {
		return service.typedIcons(type);
	}

	@RequestMapping("init")
	public String init(HttpServletRequest request) {
		// read icon path fires, then create icon modules and save to db
		String rootpath = request.getSession().getServletContext()
				.getRealPath("/");
		String csspath = request.getSession().getServletContext()
				.getRealPath("/resources/themes/css/icons.css");
		return "";
	}
}
