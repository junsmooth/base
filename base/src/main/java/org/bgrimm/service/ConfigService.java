package org.bgrimm.service;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.common.MonitoringTypeAttribute;
import org.bgrimm.domain.bgrimm.common.Threshold;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.domain.system.TIcon;
import org.bgrimm.domain.system.TMenu;
import org.bgrimm.utils.BeanUtils;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ConfigService {
	@Autowired
	public CommonDao commonDao;

	public List<MonitoringType> getAllMonType() {
			return commonDao.loadAll(MonitoringType.class);
	}

	public void saveOrUpdateMonType(MonitoringType mon) {
		commonDao.saveOrUpdate(mon);
	}

	public MonitoringType getUniqueMonTypeById(long pid) {
		return commonDao.findUniqueByProperty(MonitoringType.class, "id", pid);
	}

	public void removeMonTypeById(long id) {
		commonDao.deleteEntityById(MonitoringType.class, id);
	}
	public void removeMonPointById(long id) {
		commonDao.deleteEntityById(MonitoringPoint.class, id);
	}
	
	public Object getAllMonPoint(int page, int rows) {
		PagedQuery pq = new PagedQuery(MonitoringPoint.class, page, rows);
		List<Order> list = new ArrayList();
		list.add(Order.asc("monitoringName"));
		PageList pl = commonDao.getPagedList(pq, list);
		return pl;
	}

	public MonitoringPoint getUniqueMonPointById(long pid) {
		return commonDao.findUniqueByProperty(MonitoringPoint.class, "id", pid);
	}

	public Object isValidMonPointName(String monName,String id) {
		if(StringUtils.isNumeric(id)){
			MonitoringPoint m1=commonDao.findUniqueByProperty(MonitoringPoint.class, "id", Long.parseLong(id));
			if(m1.getMonitoringName().equals(monName)){
				return true;
			}
		}
		MonitoringPoint mp=commonDao.findUniqueByProperty(MonitoringPoint.class, "monitoringName", monName);
		if(mp==null){
			return true;
		}
		return false;
	}

	public void saveOrUpdateMonPoint(MonitoringPoint mon) {
		MonitoringType type=mon.getType();
		if(type==null){
			MonitoringPoint mo=commonDao.findUniqueBy(MonitoringPoint.class, "id", mon.getId());
			type=mo.getType();
			try {
				org.apache.commons.beanutils.BeanUtils.copyProperties(mo, mon);
				mon=mo;
				mon.setType(type);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}else{
			String code=mon.getType().getCode();
			type=commonDao.findUniqueByProperty(MonitoringType.class, "code", code);
		}
		mon.setType(type);
		commonDao.saveOrUpdate(mon);
	}

	public Object getAllMonAttr() {
		return commonDao.loadAll(MonitoringTypeAttribute.class);
	}

	

}
