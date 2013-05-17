package org.bgrimm.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.domain.tailings.MonitoringType;
import org.bgrimm.service.ConfigService;
import org.bgrimm.uitls.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("config")
public class ConfigController {
	@Autowired
	private ConfigService configService;
	
	@RequestMapping("montype")
	public String monType() {
		return "config/monType";
	}
	
	@RequestMapping("monpoint")
	public String monPoint() {
		return "config/monPoint";
	}

	@RequestMapping("monpoint/data")
	public @ResponseBody
	Object monPointList() {
		return configService.getAllMonPoint();
	}

	@RequestMapping("montype/data")
	public @ResponseBody
	Object monTypeList() {
		return configService.getAllMonType();
	}
	
	@RequestMapping("montype/addOrUpdate")
	public String addOrUpdate(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		if (StringUtils.isNumeric(id)) {
			long pid = Long.parseLong(id);
//			TRole role = roleService.getUniqueById(pid);
			MonitoringType mt=configService.getUniqueMonTypeById(pid);
			model.addAttribute("montype", mt);
		}
		return "config/addMonType";
	}
	
	@RequestMapping("montype/save")
	public @ResponseBody
	JsonMsg saveMenu(MonitoringType mon) {
		configService.saveOrUpdateMonType(mon);
		return JsonMsg.simpleSuccessJson();

	}
	@RequestMapping("monType/remove")
	public @ResponseBody
	JsonMsg removeMonType(@RequestParam long id) {
		try {
			configService.removeMonTypeById(id);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonMsg.createJsonMsg(false, "操作失败", e.getMessage());
		}
		return JsonMsg.simpleSuccessJson();
	}
}
