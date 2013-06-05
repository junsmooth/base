package org.bgrimm.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.dao.core.impl.T4DDBDao;
import org.bgrimm.domain.t4ddb.BMWY;
import org.bgrimm.service.ISurfaceDisplacementService;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("surfaceDisplacementServiceImpl")
public class SurfaceDisplacementServiceImpl implements
		ISurfaceDisplacementService {


	@Autowired
	private T4DDBDao dao;

	@Autowired
	private CommonDao commonDao;
	
	public List<BMWY> getSurfaceDisplacementServiceOfWeek() {
		//BMWY
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		String datetime1=sdf.format(new Date());
		cal.add(Calendar.DATE, -7);
		String datetime=sdf.format(cal.getTime());
		Criterion c = Restrictions.between("logtime", datetime, datetime1);
		//Criterion c2 = Restrictions.eq("id", 1);
		List<BMWY> Datalist = dao.findByCriterions(BMWY.class, c);
		
//		monitoringList=surface2Dao2.getAll(SurfaceSql.selectMonitoringSql);
		
//		Iterator typei = monitoringList.iterator();
//		List<Object> monitoringList1=new ArrayList();
//		int a=1;
//		while( typei.hasNext())  
//		 {
//			Map map=(Map)typei.next();
//			String str=map.get("monitoring_name").toString();
//			Map map1=new HashMap();
//			map1.put("monitoring_type",a);
//			map1.put("monitoring_name",str+"-X方向");
//			monitoringList1.add(map1);
//			a++;
//			Map map2=new HashMap();
//			map2.put("monitoring_type",a);
//			map2.put("monitoring_name",str+"-Y方向");
//			monitoringList1.add(map2);
//			a++;
//			Map map3=new HashMap();
//			map3.put("monitoring_type",a);
//			map3.put("monitoring_name",str+"-H方向");
//			monitoringList1.add(map3);
//			a++;
//		 }
		return null;
	}

}
