package org.bgrimm.controller;

import java.util.List;
import java.util.Map;

import org.bgrimm.service.RoleService;
import org.bgrimm.uitls.JSONUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private RoleService roleService;
	@RequestMapping("roles")
	public @ResponseBody
	Map getRoles() {
		List result = roleService.getRoles();
		Map m = JSONUtils.resultJsonMap(result, true);
		return m;
	}

}
