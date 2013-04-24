package org.bgrimm.controller.system;

import javax.servlet.http.HttpServletRequest;

import org.bgrimm.service.core.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("icon")
public class IconController {

	private CommonService commonService;

	@Autowired()
	public void setCommonService(CommonService commonService) {
		this.commonService = commonService;
	}

	@RequestMapping("init")
	public String init(HttpServletRequest request) {
		// read icon path fires, then create icon modules and save to db
		String rootpath = request.getSession().getServletContext().getRealPath("/");
		String csspath = request.getSession().getServletContext().getRealPath("/resources/themes/css/icons.css");
		return "";
	}
}
