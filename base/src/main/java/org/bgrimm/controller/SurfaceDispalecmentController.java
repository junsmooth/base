package org.bgrimm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.bgrimm.domain.t4ddb.BMWY;
import org.bgrimm.service.impl.SurfaceDisplacementServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SurfaceDispalecmentController {

//	@Resource(name="surfaceDisplacementServiceImpl")
//	private SurfaceDisplacementServiceImpl surfaceDisplacementServiceImpl;
	
	@RequestMapping("/chart/bmwy")
	public String getSurfaceDispDataOfWeek(){
	//List<BMWY> surfaceDispList=surfaceDisplacementServiceImpl.getSurfaceDisplacementServiceOfWeek();
		
		return null;
	}
}
