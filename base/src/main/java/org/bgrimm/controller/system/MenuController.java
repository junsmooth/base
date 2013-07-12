package org.bgrimm.controller.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.domain.system.TIcon;
import org.bgrimm.domain.system.TMenu;
import org.bgrimm.service.system.MenuService;
import org.bgrimm.utils.BeanUtils;
import org.bgrimm.utils.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("menu")
public class MenuController {
	@Autowired
	private MenuService menuService;

	@RequestMapping("left")
	public String left(Model model) {
		List<TMenu> pMenus = menuService.getParentMenus();
		// Add Security check
		model.addAttribute("parentMenus", pMenus);
		return "menu/left";
	}
	
	
	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	@RequestMapping(method=RequestMethod.GET)
	public String list() {
		return "menu/list";
	}

	@RequestMapping("remove")
	public @ResponseBody
	JsonMsg remove(@RequestParam long id) {
		menuService.removeEntity(id);
		return JsonMsg.simpleSuccessJson();
	}
	@RequestMapping("validateModuleName")
	public @ResponseBody Object validateModuleName(@RequestParam("menu_modulename") String menumodulename,@RequestParam String id){
		return menuService.isValidModuleName(menumodulename,id);
	}
	
	@RequestMapping("validateMenuName")
	public @ResponseBody Object validateMenuName(@RequestParam("menu_menuName") String menuName,@RequestParam String id){
		return menuService.isValidMenuName(menuName,id);
	}
	@RequestMapping("addOrUpdate")
	public String addOrUpdate(HttpServletRequest req, Model model)
			throws Exception {
		List<TIcon> iconlist = menuService.getAllIcon();
		List<TMenu> pMenus = menuService.getParentMenus();
		model.addAttribute("iconlist", iconlist);
		// parent menu list to show
		List menuList = new ArrayList();
		for (TMenu menu : pMenus) {
			Map m = new HashMap();
			menu.setParentMenu(null);
			m = BeanUtils.pojo2Map(menu);
			// remove self ,if exits. can't as child of self
			if (!(menu.getId() + "").equals(req.getParameter("id"))) {
				menuList.add(m);
			} else {
				// if (menu to edit) have child,can't change parent path
				if (menu.getSubMenus() != null && menu.getSubMenus().size() > 0) {
					menuList.clear();
					break;
				}
			}
		}
		model.addAttribute("menulist", menuList);

		String id = req.getParameter("id");
		if (StringUtils.isNumeric(id)) {
			long pid = Long.parseLong(id);
			TMenu menu = menuService.getUniqueById(pid);
			Map m = new HashMap();
			TMenu tempParent = menu.getParentMenu();
			// set subMenu&ParentMenu to null, in case of recursive parsing
			menu.setParentMenu(null);
			menu.setSubMenus(null);
			m = BeanUtils.pojo2Map(menu);
			m.put("parentid", tempParent != null ? tempParent.getId() : 1);
			model.addAttribute("menu", m);
		}
		// iconList
		// ParentMenuList

		return "menu/add";
	}

	@RequestMapping("save")
	public @ResponseBody
	JsonMsg saveMenu(@Valid TMenu menu, BindingResult result) {
		if (result.hasErrors()) {
			return null;
		}
		menuService.saveOrUpdate(menu);
		return JsonMsg.simpleSuccessJson();

	}

	@RequestMapping("list/data")
	public @ResponseBody
	List<Map> menuList() throws Exception {
		List<TMenu> pMenus = menuService.getParentMenus();
		List<Map> result = new ArrayList();
		for (TMenu menu : pMenus) {
			Map m = new HashMap();
			m = BeanUtils.pojo2Map(menu);
			List<TMenu> tempMenus = menu.getSubMenus();
			// set subMenu&ParentMenu to null, in case of recursive parsing
			menu.setSubMenus(null);
			menu.setParentMenu(null);
			if (tempMenus != null) {
				List<Map> children = new ArrayList();
				for (TMenu subMenu : tempMenus) {
					Map m1 = new HashMap();
					// set subMenu&ParentMenu to null, in case of recursive
					// parsing
					subMenu.setParentMenu(null);
					subMenu.setSubMenus(null);
					m1 = BeanUtils.pojo2Map(subMenu);

					children.add(m1);
				}
				m.put("children", children);
			}
			result.add(m);
		}
		return result;
	}
	

}
