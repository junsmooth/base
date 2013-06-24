package org.bgrimm.controller;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.gtgcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping("jrx")
public class JRXController {

	//@Resource(name="JRXServiceImpl")
	@Autowired
	private gtgcService JRXServiceImpl;
	
	@RequestMapping("data")
	public String toJrxPage() {
		
		return "data/jrx/jrxData";
	}
	
	@RequestMapping("chart")
	public String chartIndex() {
		
		return "data/jrx/jrxChart";
	}

	
	@RequestMapping("data/points")
	@ResponseBody
	public Object points(){
		
		return JRXServiceImpl.getAllPoints();
	}
	@RequestMapping("data/jrxMonitorPostion")
	@ResponseBody
	public Object JRXMonitorPosition(TableParam param){
		
		return JRXServiceImpl.getJRXMonitorPosition(param);
	}
	
	
	@RequestMapping("chart/jrxChart")
	@ResponseBody
	public Object JRXChart(TableParam param){
		
		return JRXServiceImpl.getJrxChartData(param);
	}
	
}
