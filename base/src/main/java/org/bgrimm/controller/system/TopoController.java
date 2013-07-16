package org.bgrimm.controller.system;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bgrimm.service.system.TopoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("mpPath")
	@ResponseBody
	public Object getMPPath(@RequestParam("v")long v,@RequestParam("m")int m){
		
		return topoService.getMPPath(v,m);
	}
	
	@RequestMapping("storeMP")
	@ResponseBody
	public void saveMP(@RequestBody Object jsonData){
		topoService.saveData(jsonData);
	}
	
	@RequestMapping("mpPic")
	@ResponseBody
	public Object mpPic(){
		
		return topoService.getMpPic();
	}
	
	@RequestMapping("addMonitorPosition")
	public String MP(){
		
		return "menu/monitorPosition";
	}
	
	@RequestMapping("monitorPData")
	@ResponseBody
	public Object monitorPDataList(){
		
		
		return topoService.getMonitorPDataList();
	}
	
	@RequestMapping(value="/iconData",method=RequestMethod.POST)
	@ResponseBody
	public Object iconList(@RequestParam("code")String code){
		
		return topoService.getIconList(code);
	}
	
	@RequestMapping("uppload")
	public String uppload(Model model) {
	
		return "menu/upploadPage";
	}
	
	
	@RequestMapping("mainData")
	public @ResponseBody
	 Object mainData(){
		
	return  topoService.getMainData();
		
	}


}
