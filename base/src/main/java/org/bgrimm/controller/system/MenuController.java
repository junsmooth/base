package org.bgrimm.controller.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.domain.system.TIcon;
import org.bgrimm.domain.system.TMenu;
import org.bgrimm.service.system.MenuService;
import org.bgrimm.uitls.BeanUtils;
import org.bgrimm.uitls.JsonMsg;
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

	@RequestMapping("list")
	public String list() {
		return "menu/list";
	}
	@RequestMapping("remove")
	public @ResponseBody JsonMsg remove(@RequestParam long id){
		menuService.removeEntity(id);
		return JsonMsg.simpleSuccessJson();
	}
	
	
	@RequestMapping("addOrUpdate")
	public String addOrUpdate(HttpServletRequest req,Model model) throws Exception {
		List<TIcon> iconlist = menuService.getAllIcon();
		List<TMenu> pMenus = menuService.getParentMenus();
		model.addAttribute("iconlist", iconlist);
		List menuList=new ArrayList();
		for (TMenu menu : pMenus) {
			Map m = new HashMap();
			menu.setParentMenu(null);
			m=BeanUtils.pojo2Map(menu);
			//remove self ,if exits. can't as child of self
			if(!(menu.getId()+"").equals(req.getParameter("id"))){
				menuList.add(m);
			}
		}
		model.addAttribute("menulist", menuList);
		
		String id=req.getParameter("id");
		if(StringUtils.isNumeric(id)){
			long pid=Long.parseLong(id);
			TMenu menu=menuService.getUniqueById(pid);
			Map m=new HashMap();
			menu.setParentMenu(null);
			m=BeanUtils.pojo2Map(menu);
			m.put("parentid", menu.getParentMenu()!=null?menu.getParentMenu().getId():1);
			model.addAttribute("menu",m);
		}
		
		
		
		
		
		
		// iconList
		// ParentMenuList

		return "menu/add";
	}
	
	@RequestMapping("save")
	public @ResponseBody JsonMsg saveMenu(TMenu menu){
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
			m=BeanUtils.pojo2Map(menu);
			List<TMenu> tempMenus=menu.getSubMenus();
			menu.setSubMenus(null);
			menu.setParentMenu(null);
			if (tempMenus != null) {
				List<Map> children = new ArrayList();
				for (TMenu subMenu : tempMenus) {
					Map m1 = new HashMap();
					subMenu.setParentMenu(null);
					subMenu.setSubMenus(null);
					m1=BeanUtils.pojo2Map(subMenu);
					
					children.add(m1);
				}
				m.put("children", children);
			}
//			m.put("parentMenu", null);
//			m.put("subMenus", null);
			result.add(m);
		}
		return result;
	}
}
