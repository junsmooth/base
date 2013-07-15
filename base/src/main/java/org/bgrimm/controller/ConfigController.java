package org.bgrimm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.common.MonitoringTypeAttribute;
import org.bgrimm.domain.system.TIcon;
import org.bgrimm.service.ConfigService;
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
@RequestMapping("config")
public class ConfigController {
	@Autowired
	private ConfigService service;

	@RequestMapping("montype")
	public String monType() {
		return "config/montype/monType";
	}

	@RequestMapping("monpoint")
	public String monPoint() {
		return "config/monpoint/monPoint";
	}

	@RequestMapping("monattr")
	public String monAttr() {
		return "config/monattr/monAttr";
	}

	@RequestMapping(value = "monattr/new", method = RequestMethod.GET)
	public String newMonAttr() {
		return "config/monattr/new";
	}

	@RequestMapping(value = "monattr/{id}/edit", method = RequestMethod.GET)
	public String editMonAttr(@PathVariable long id, Model model) {
		MonitoringTypeAttribute monattr = service.getUniqueMonAttr(id);
		model.addAttribute("monattr", monattr);
		return "config/monattr/new";
	}

	@RequestMapping(value = "monattr", method = RequestMethod.POST)
	public @ResponseBody
	Object saveMonAttr(@Valid MonitoringTypeAttribute monattr,
			BindingResult result) {
		if (result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			String err = "";
			for (ObjectError e : errors) {
				err += e.getObjectName() + ":" + e.getDefaultMessage() + "\n";
			}

			return JsonMsg.createJsonMsg(false, "操作失败", err);
		}
		try {
			service.saveOrUpdate(monattr);
			return JsonMsg.simpleSuccessJson();
		} catch (Exception e) {
			e.printStackTrace();
			return JsonMsg.createJsonMsg(false, "操作失败", e.getMessage());
		}

	}

	@RequestMapping("monpoint/data")
	public @ResponseBody
	Object monPointList(@RequestParam int page, @RequestParam int rows) {
		return service.getAllMonPoint(page, rows);
	}

	@RequestMapping("monattr/data")
	public @ResponseBody
	Object monAttrList() {
		return service.getAllMonAttr();
	}

	@RequestMapping("monpoint/validateMonPointName")
	public @ResponseBody
	Object validateMonPointName(@RequestParam String monName,
			@RequestParam String id) {
		return service.isValidMonPointName(monName, id);

	}

	@RequestMapping("montype/data")
	public @ResponseBody
	Object monTypeList() {
		return service.getAllMonType();
	}

	@RequestMapping("montype/addOrUpdate")
	public String addOrUpdateMonType(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		if (StringUtils.isNumeric(id)) {
			long pid = Long.parseLong(id);
			// TRole role = roleService.getUniqueById(pid);
			MonitoringType mt = service.getUniqueMonTypeById(pid);
			model.addAttribute("montype", mt);
		}
		return "config/montype/addMonType";
	}

	@RequestMapping("monpoint/addOrUpdate")
	public String addOrUpdateMonPoint(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		if (StringUtils.isNumeric(id)) {
			long pid = Long.parseLong(id);
			MonitoringPoint mp = service.getUniqueMonPointById(pid);
			model.addAttribute("monpoint", mp);
		}
		List monTyps = service.getAllMonType();
		model.addAttribute("montypelist", monTyps);
		return "config/monpoint/addMonPoint";
	}

	@RequestMapping("montype/save")
	public @ResponseBody
	JsonMsg saveMonType(MonitoringType mon) {
		service.saveOrUpdateMonType(mon);
		return JsonMsg.simpleSuccessJson();

	}

	@RequestMapping("monpoint/save")
	public @ResponseBody
	JsonMsg saveMonPoint(MonitoringPoint mon) {
		service.saveOrUpdateMonPoint(mon);
		return JsonMsg.simpleSuccessJson();

	}

	@RequestMapping("montype/remove")
	public @ResponseBody
	JsonMsg removeMonType(@RequestParam long id) {
		try {
			service.removeMonTypeById(id);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonMsg.createJsonMsg(false, "操作失败", e.getMessage());
		}
		return JsonMsg.simpleSuccessJson();
	}

	@RequestMapping("monpoint/remove")
	public @ResponseBody
	JsonMsg removeMonPoint(@RequestParam long id) {
		try {
			service.removeMonPointById(id);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonMsg.createJsonMsg(false, "操作失败", e.getMessage());
		}
		return JsonMsg.simpleSuccessJson();
	}
}
