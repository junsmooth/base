package org.bgrimm.controller.system;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bgrimm.service.system.TopoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("topo")
public class TopoController {
	
	@Autowired
	private TopoService topoService;
	
	@RequestMapping("main")
	public String main(Model model) {
		return "menu/main";
	}
	@RequestMapping("satellite")
	public String satellite(Model model) {
		return "topo/satellite";
	}
	@RequestMapping("threedimension")
	public String threedimension(Model model) {
		return "topo/threedimension";
	}
	@RequestMapping("/data")
	 @ResponseBody
	  public String upload(HttpServletRequest req, HttpServletResponse resp){

			        
			        return topoService.uploadFile(req,resp);
	  } 

}
