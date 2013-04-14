package org.bgrimm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.domain.core.TIcon;
import org.bgrimm.domain.core.TMenu;
import org.bgrimm.service.core.CommonService;
import org.bgrimm.uitls.JsonMsg;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("menu")
public class MenuController {
	@Autowired
	private CommonService commonService;

	@RequestMapping("left")
	public String left(Model model) {
		List<TMenu> pMenus = commonService.findByCriterion(TMenu.class,
				Restrictions.eq("parentMenu.id",1L));
		// Add Security check
		model.addAttribute("parentMenus", pMenus);
		return "menu/left";
	}

	@RequestMapping("list")
	public String list() {
		return "menu/list";
	}
	@RequestMapping("remove")
	public @ResponseBody JsonMsg remove(@RequestParam long id){
		System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"+id);
		commonService.deleteEntityById(TMenu.class, id);
		return JsonMsg.simpleSuccessJson();
	}
	
	
	@RequestMapping("addOrUpdate")
	public String addOrUpdate(HttpServletRequest req,Model model) {
		List<TIcon> iconlist = commonService.loadAll(TIcon.class);
		List<TMenu> pMenus = commonService.findByCriterion(TMenu.class,
				Restrictions.eq("parentMenu.id",1L));
		model.addAttribute("iconlist", iconlist);
		List menuList=new ArrayList();
		for (TMenu menu : pMenus) {
			Map m = new HashMap();
			m.put("id", menu.getId());
			m.put("name", menu.getMenuName());
			
			//remove self ,if exits. can't as child of self
			if(!(menu.getId()+"").equals(req.getParameter("id"))){
				menuList.add(m);
			}
		}
		model.addAttribute("menulist", menuList);
		
		String id=req.getParameter("id");
		if(StringUtils.isNumeric(id)){
			long pid=Long.parseLong(id);
			TMenu menu=commonService.findUniqueByProperty(TMenu.class, "id", pid);
			Map m=new HashMap();
			m.put("id", menu.getId());
			m.put("name", menu.getMenuName());
			m.put("url", menu.getUrl());
			m.put("icon", menu.getIcon());
			m.put("parentid", menu.getParentMenu()!=null?menu.getParentMenu().getId():1);
			model.addAttribute("menu",m);
		}
		
		
		
		
		
		
		// iconList
		// ParentMenuList

		return "menu/add";
	}
	
	@RequestMapping("save")
	public @ResponseBody JsonMsg saveMenu(TMenu menu){
		commonService.saveOrUpdate(menu);
		return JsonMsg.simpleSuccessJson();
		
	}

	@RequestMapping("list/data")
	public @ResponseBody
	List<Map> menuList() {
		List<TMenu> pMenus = commonService.findByCriterion(TMenu.class,
				Restrictions.eq("parentMenu.id", 1L));
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
					m1.put("icon", subMenu.getIcon());
					children.add(m1);
				}
				m.put("children", children);
			}

			result.add(m);
		}
		return result;
	}
}
