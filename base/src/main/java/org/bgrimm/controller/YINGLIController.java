package org.bgrimm.controller;

import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.service.impl.YINGLIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("yingli")
public class YINGLIController {
	@Autowired
	private YINGLIService service;

	@RequestMapping(value = "chart", method = RequestMethod.GET)
	public String chartIndex() {
		return "data/yingli/chart";
	}

	@RequestMapping(value = "data", method = RequestMethod.GET)
	public String dataIndex() {
		return "data/yingli/data";
	}

	@RequestMapping(value = "points", method = RequestMethod.GET)
	
	public @ResponseBody Object points() {
		return service.getAllPoints();
	}

	@RequestMapping(value = "chart", method = RequestMethod.POST)
	
	public @ResponseBody Object chartData(TableParam param) {
		return service.getChartData(param);
	}

	@RequestMapping(value = "data", method = RequestMethod.POST)
	
	public @ResponseBody Object kswList(TableParam param) {

		return service.getYingLiPageList(param);
	}
}
