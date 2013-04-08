package org.bgrimm.controller;

import java.util.List;

import org.bgrimm.domain.core.TMenu;
import org.bgrimm.service.core.CommonService;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("menu")
public class MenuController {
	@Autowired
	private CommonService commonService;

	@RequestMapping("left")
	public String left(Model model) {
		List<TMenu> pMenus=commonService.findByCriterion(TMenu.class,Restrictions.isNull("parentMenu"));
		//Add Security check
		model.addAttribute("parentMenus",pMenus);
		return "menu/left";
	}
	

}
