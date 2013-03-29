package org.bgrimm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bgrimm.domain.Menu;
import org.bgrimm.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public @ResponseBody List<Menu> menu(@RequestParam(value="id", required=false) String id){
		if(id==null){
			List<Menu> list = new ArrayList<Menu>();
			list=service.getMainMenus();
			List result=new ArrayList();
			for(Menu m:list){
				Map map=new HashMap();
				map.put("id",m.getId());
				map.put("text", m.getText());
				map.put("state","closed");
				result.add(map);
			}
			System.out.println(id);
			return result;
		}else{
			int pid=Integer.parseInt(id);
			return service.getSubMenus(pid);
		}
		
		
//		return service.getMainMenus();
//		if("0".equals(parent)){
//			return service.getMainMenus();
//		}else{
//			return service.getSubMenus(Integer.parseInt(parent));
//		}
		
	}
}
