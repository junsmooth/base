package org.bgrimm.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.bgrimm.uitls.Print;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

@Controller
@RequestMapping("homepage")
public class HomePageController {
	
	
	@RequestMapping("data")
	public @ResponseBody
	Object mainMenu() throws Exception, SAXException, IOException {
//		Map m=new HashMap();
//		m.put("type", "circle");
//		m.put("radius", 10);
//		m.put("fill", "#f00");
//		m.put("x",10);
//		m.put("y",10);
//		return m;
		//return "{type: 'circle', radius: 10, fill: '#f00', x: 10, y: 10,group: 'circles'}";
		return "["+Print.getSVGData()+"]";
	}
}
