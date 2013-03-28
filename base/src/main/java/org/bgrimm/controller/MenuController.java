package org.bgrimm.controller;

import java.util.ArrayList;
import java.util.List;

import org.bgrimm.domain.Menu;
import org.bgrimm.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("menu")
public class MenuController {
	@Autowired
	private MenuService service;

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
	@RequestMapping
	public @ResponseBody List<Menu> menu(@RequestParam(value="id", required=false) String id,@RequestParam(value="parent", required=false) String parent ){
		List<Menu> list = new ArrayList<Menu>();
		//virtual root
		if("root".equals(id)){
			Menu m=new Menu();
			m.setId(0);
			m.setText("Root");
			m.setLeaf(false);
			list.add(m);
//			return service.getMainMenus();
			return list;
		}
		if("0".equals(parent)){
			return service.getMainMenus();
		}else{
			return service.getSubMenus(Integer.parseInt(parent));
		}
		
	}
}
