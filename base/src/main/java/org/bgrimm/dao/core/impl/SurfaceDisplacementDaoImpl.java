package org.bgrimm.dao.core.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.bgrimm.dao.core.ISurfaceDisplacementDao;
import org.springframework.stereotype.Repository;

@Repository("surfaceDisplacementDaoImpl")
public class SurfaceDisplacementDaoImpl extends CommonDao implements ISurfaceDisplacementDao {

	public List<Map> getSurfaceDisplacementServiceOfWeek() {
		try {
			Calendar cal=Calendar.getInstance();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			String datetime1=sdf.format(new Date());
			cal.add(Calendar.DATE, -7);
			String datetime=sdf.format(cal.getTime());
			String hql="select a.logtime,a.dN from BMWY a where a.logtime  between '"+datetime+"' and '"+datetime1+"' order by LogTime";
			List<Map> surfaceDispList=findByQueryString(hql);
			return surfaceDispList;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		
		return null;
	}

	
}
