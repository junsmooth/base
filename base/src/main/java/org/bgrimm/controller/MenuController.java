package org.bgrimm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bgrimm.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("menu")
public class MenuController {
	@Autowired
	private MenuService service;

	@RequestMapping("mainMenu")
	public @ResponseBody
	List mainMenu(@RequestParam String node, @RequestParam String id) {
		List list = new ArrayList();

		if ("root".equals(node)) {
			return service.getMainMenus();
			// Map m1 = new HashMap();
			// m1.put("text", "User Mangement");
			// m1.put("leaf", false);
			// m1.put("id", 1);
			// list.add(m1);
			// Map m2 = new HashMap();
			// m2.put("text", "Security Mangement");
			// m2.put("leaf", false);
			// m2.put("id", 2);
			// list.add(m2);
		} else {

			try {
				int inde = Integer.parseInt(node);
				return service.getSubMenus(inde);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				return new ArrayList();
			}

		}
		// else if ("1".equals(node)) {
		// Map m1 = new HashMap();
		// m1.put("text", "Sub1");
		// m1.put("leaf", true);
		// m1.put("id", 3);
		// m1.put("controller", "TestController");
		// list.add(m1);
		// Map m2 = new HashMap();
		// m2.put("text", "Sub 2");
		// m2.put("leaf", true);
		// m2.put("id", 4);
		// m2.put("controller", "TestController");
		// list.add(m2);
		// } else {
		// Map m1 = new HashMap();
		// m1.put("text", "User Mangement");
		// m1.put("leaf", false);
		// m1.put("id", 5);
		// list.add(m1);
		// Map m2 = new HashMap();
		// m2.put("text", "Security Mangement");
		// m2.put("leaf", false);
		// m2.put("id", 6);
		// list.add(m2);
		// }

		// Object principal = SecurityContextHolder.getContext()
		// .getAuthentication();
		// System.out.println("-------" + principal);
		// return list;
	}
}
