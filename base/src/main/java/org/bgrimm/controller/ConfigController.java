package org.bgrimm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.domain.bgrimm.MonitoringPoint;
import org.bgrimm.domain.bgrimm.MonitoringType;
import org.bgrimm.service.ConfigService;
import org.bgrimm.utils.JsonMsg;
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
	@RequestMapping("monpoint/validateMonPointName")
	public @ResponseBody Object validateMonPointName(@RequestParam String monName){
		return configService.isValidMonPointName(monName);
		
	}
	
	@RequestMapping("montype/data")
	public @ResponseBody
	Object monTypeList() {
		return configService.getAllMonType();
	}
	
	@RequestMapping("montype/addOrUpdate")
	public String addOrUpdateMonType(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		if (StringUtils.isNumeric(id)) {
			long pid = Long.parseLong(id);
//			TRole role = roleService.getUniqueById(pid);
			MonitoringType mt=configService.getUniqueMonTypeById(pid);
			model.addAttribute("montype", mt);
		}
		return "config/addMonType";
	}
	@RequestMapping("monpoint/addOrUpdate")
	public String addOrUpdateMonPoint(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		if (StringUtils.isNumeric(id)) {
			long pid = Long.parseLong(id);
			MonitoringPoint mp=configService.getUniqueMonPointById(pid);
			model.addAttribute("monpoint", mp);
		}
		List monTyps=configService.getAllMonType();
		model.addAttribute("montypelist",monTyps);
		return "config/addMonPoint";
	}
	@RequestMapping("montype/save")
	public @ResponseBody
	JsonMsg saveMonType(MonitoringType mon) {
		configService.saveOrUpdateMonType(mon);
		return JsonMsg.simpleSuccessJson();

	}
	@RequestMapping("monpoint/save")
	public @ResponseBody
	JsonMsg saveMonPoint(MonitoringPoint mon) {
		configService.saveOrUpdateMonPoint(mon);
		return JsonMsg.simpleSuccessJson();

	}
	@RequestMapping("montype/remove")
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
