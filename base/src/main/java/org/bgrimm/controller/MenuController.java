package org.bgrimm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bgrimm.domain.core.TIcon;
import org.bgrimm.domain.core.TMenu;
import org.bgrimm.service.core.CommonService;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("menu")
public class MenuController {
	@Autowired
	private CommonService commonService;

	@RequestMapping("left")
	public String left(Model model) {
		List<TMenu> pMenus = commonService.findByCriterion(TMenu.class,
				Restrictions.isNull("parentMenu"));
		// Add Security check
		model.addAttribute("parentMenus", pMenus);
		return "menu/left";
	}

	@RequestMapping("list")
	public String list() {
		return "menu/list";
	}

	@RequestMapping("list/data")
	public @ResponseBody
	List<Map> menuList() {
		List<TMenu> pMenus = commonService.findByCriterion(TMenu.class,
				Restrictions.isNull("parentMenu"));
		List<Map> result = new ArrayList();
		for (TMenu menu : pMenus) {
			Map m = new HashMap();
			m.put("id", menu.getId());
			m.put("name", menu.getMenuName());
			m.put("url", menu.getUrl());
			m.put("icon", menu.getIcon());
			if (menu.getSubMenus() != null) {
				List<Map> children = new ArrayList();
				for (TMenu subMenu : menu.getSubMenus()) {
					Map m1 = new HashMap();
					m1.put("id", subMenu.getId());
					m1.put("name", subMenu.getMenuName());
					m1.put("url", subMenu.getUrl());
					TIcon icon = new TIcon();
					icon.setIconCls("pictures");
					icon.setIconPath("resources/custom/images/pictures.png");
					m1.put("icon",icon);
					children.add(m1);
				}
				m.put("children", children);
			}

			result.add(m);
		}
		return result;
	}
}
