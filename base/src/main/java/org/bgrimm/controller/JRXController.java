package org.bgrimm.controller;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.JRXServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping("jrx")
public class JRXController {

	//@Resource(name="JRXServiceImpl")
	@Autowired
	private JRXServiceImpl JRXServiceImpl;
	
	@RequestMapping("data")
	public String toJrxPage() {
		
		return "data/saturation/jrxData";
	}
	
	
	@RequestMapping("data/jrxData")
	@ResponseBody
	public Object JRXList(TableParam param) {

		return JRXServiceImpl.getJRXPageList(param);
	}
	
	@RequestMapping("data/jrxMonitorPostion")
	@ResponseBody
	public Object JRXMonitorPosition(){
		
		return JRXServiceImpl.getJRXMonitorPosition();
	}
	
}
