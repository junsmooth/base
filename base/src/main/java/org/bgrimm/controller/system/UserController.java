package org.bgrimm.controller.system;

import java.lang.reflect.InvocationTargetException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.domain.system.TRole;
import org.bgrimm.domain.system.TUser;
import org.bgrimm.service.UserService;
import org.bgrimm.service.system.CommonService;
import org.bgrimm.uitls.BeanUtils;
import org.bgrimm.uitls.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("save")
	public @ResponseBody
	JsonMsg save(@Valid TUser user, BindingResult result, HttpServletRequest req)
			throws IllegalAccessException, InvocationTargetException {
		Set<TRole> roles = parseRoles(req);
		user.setRoles(roles);
		userService.saveOrUpdate(user);

		if (result.hasErrors()) {
			result.getAllErrors();
			return JsonMsg.createJsonMsg(false, "Failed:",
					result.getAllErrors());
		}
		return JsonMsg.simpleSuccessJson();

	}

	private Set<TRole> parseRoles(HttpServletRequest req) {
		String roleids = req.getParameter("roleids");
		String[] roleIdArray = StringUtils.split(roleids, ",");
		return userService.getRolesByIds(roleIdArray);
	}

	@RequestMapping("list")
	public String list() {
		return "user/list";
	}

	@RequestMapping("rolelist")
	public String rolelist() {
		return "user/roleList";
	}

	@RequestMapping("list/data")
	public @ResponseBody
	Object userList(@RequestParam int page, @RequestParam int rows) {
		return userService.getUserPageList(page, rows);
	}

	@RequestMapping("remove")
	public @ResponseBody
	JsonMsg remove(@RequestParam long id) {
		try {
			userService.removeUserById(id);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonMsg.createJsonMsg(false, "操作失败", e.getMessage());
		}
		return JsonMsg.simpleSuccessJson();
	}

	@RequestMapping("addOrUpdate")
	public String addOrUpdate(HttpServletRequest req, Model model,
			@RequestParam long id) {
		if (id != -1) {
			TUser user = userService.findUserById(id);
			Map map = BeanUtils.pojo2Map(user);
			String roleids = "";
			String rolenames = "";
			Set<TRole> roles = user.getRoles();
			for (TRole role : roles) {
				roleids += role.getId() + ",";
				rolenames += role.getName() + ",";
			}
			map.put("roleids", roleids);
			map.put("rolenames", rolenames);
			model.addAttribute("user", map);
		}
		return "user/add";

	}

}
