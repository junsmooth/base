package org.bgrimm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bgrimm.domain.core.TMenu;
import org.bgrimm.service.MenuService;
import org.bgrimm.service.core.CommonService;
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
	private MenuService service;
	@Autowired
	private CommonService commonService;

	@RequestMapping("left")
	public String left(Model model) {
		List<TMenu> pMenus=commonService.loadAll(TMenu.class);
		System.out.println(pMenus.get(0).getSubMenus());
		pMenus.get(0).setSubMenus(pMenus);
		model.addAttribute("parentMenus",pMenus);
		System.out.println(pMenus);
		model.addAttribute("childMenus",pMenus);
		return "menu/left";
	}
	
	@RequestMapping("mainMenu")
	public @ResponseBody
	List mainMenu(@RequestParam String node, @RequestParam String id) {
		List list = new ArrayList();

		if ("root".equals(node)) {
			return service.getMainMenus();
		} else {
			try {
				int inde = Integer.parseInt(node);
				return service.getSubMenus(inde);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				return new ArrayList();
			}
		}
	}

	@RequestMapping("mainMenus")
	public @ResponseBody
	List<TMenu> menu(@RequestParam(value = "id", required = false) String id) {
		if (id == null) {
			List<TMenu> list = new ArrayList<TMenu>();
			list = service.getMainMenus();
			List result = new ArrayList();
			for (TMenu m : list) {
				Map map = new HashMap();
				map.put("id", m.getId());
//				map.put("text", m.getText());
				map.put("state", "closed");
				map.put("attributes", m);
				result.add(map);
			}
			System.out.println(id);
			return result;
		} else {
			int pid = Integer.parseInt(id);
			return service.getSubMenus(pid);
		}

		// return service.getMainMenus();
		// if("0".equals(parent)){
		// return service.getMainMenus();
		// }else{
		// return service.getSubMenus(Integer.parseInt(parent));
		// }

	}
}
