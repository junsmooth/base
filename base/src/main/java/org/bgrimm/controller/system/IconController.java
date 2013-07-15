package org.bgrimm.controller.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.bgrimm.domain.system.TIcon;
import org.bgrimm.service.system.IconService;
import org.bgrimm.utils.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
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

	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody
	Object create(@Valid TIcon icon, BindingResult result) {
		if (result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			String err = "";
			for (ObjectError e : errors) {
				err += e.getObjectName() + ":" + e.getDefaultMessage()+"\n";
			}

			return JsonMsg.createJsonMsg(false, "操作失败", err);
		}
		try {
			service.saveOrUpdate(icon);
			return JsonMsg.simpleSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			return JsonMsg.createJsonMsg(false, "操作失败", e.getMessage());
		}

	}

	// create new icon, do nothing but redirect to jsp
	@RequestMapping(value = "new", method = RequestMethod.GET)
	public String newIcon() {
		return "icon/new";
	}

	@RequestMapping(value = "{id}/edit", method = RequestMethod.GET)
	public String editIcon(@PathVariable long id, Model model) {
		TIcon icon = service.getIcon(id);
		model.addAttribute("icon", icon);
		return "icon/new";
	}

	// delete icon
	@RequestMapping(value = "{id}", method = RequestMethod.DELETE)
	public @ResponseBody
	Object delete(@PathVariable long id) {
		try {
			service.remove(id);
			return JsonMsg.simpleSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			return JsonMsg.createJsonMsg(false, "操作失败", e.getMessage());
		}
	}

	@RequestMapping("/upload")
	public @ResponseBody
	String upload(HttpServletRequest req, HttpServletResponse resp) {

		return service.upload(req, resp);
	}

	@RequestMapping("list/data")
	public @ResponseBody
	Object dataList(@RequestParam int page, @RequestParam int rows) {
		return service.getPagedList(page, rows);
	}

	@RequestMapping("css")
	public @ResponseBody
	Object css(HttpServletRequest req) {
		try {
			service.generateIconClass(req);
			return JsonMsg.simpleSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			return JsonMsg.createJsonMsg(false, "操作失败", e.getMessage());
		}
	}

	@RequestMapping("types")
	public @ResponseBody
	Object iconTypes() {
		return service.iconTypes();
	}

	@RequestMapping("{type}")
	public @ResponseBody
	Object iconsOfType(@PathVariable String type) {
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

	@RequestMapping("validateIconName")
	public @ResponseBody
	Object validateIconName(@RequestParam("iconName") String iconName,
			@RequestParam String id) {
		return service.isValidName(iconName, id);
	}
}
