package org.bgrimm.controller;
import java.util.List;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.service.impl.JRXService;
import org.bgrimm.utils.DataUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping("jrx")
public class JRXController {

	//@Resource(name="JRXServiceImpl")
	@Autowired
	private JRXService jrxService;
	
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
		
		return jrxService.getAllPoints();
	}
	@RequestMapping("data/jrxMonitorPostion")
	@ResponseBody
	public Object JRXMonitorPosition(TableParam param){
		
		PageList pl=jrxService.getJRXMonitorPosition(param);
		JRXService.setDecimalDigits(pl.getRows());
		return pl;
	}
	
	
	@RequestMapping("chart/jrxChart")
	@ResponseBody
	public Object JRXChart(TableParam param){
		
		 List jrxChartList=jrxService.getJrxChartData(param);
		 JRXService.setDecimalDigits(jrxChartList);
		 return DataUtils.objectList2JSonList(jrxChartList, new Object[]{"dateTime","value"});
	}
	
}
