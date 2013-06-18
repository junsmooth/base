package org.bgrimm.service;

import java.util.List;

import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.extend.MonitoringPoint;
import org.bgrimm.domain.bgrimm.extend.MonitoringType;
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

	public List<MonitoringPoint> getAllMonPoint() {
		return commonDao.loadAll(MonitoringPoint.class);
	}

	public MonitoringPoint getUniqueMonPointById(long pid) {
		return commonDao.findUniqueByProperty(MonitoringPoint.class, "id", pid);
	}

	public Object isValidMonPointName(String monName) {
		MonitoringPoint mp=commonDao.findUniqueByProperty(MonitoringPoint.class, "monitoringName", monName);
		if(mp==null){
			return true;
		}
		return false;
	}

	public void saveOrUpdateMonPoint(MonitoringPoint mon) {
		commonDao.saveOrUpdate(mon);
	}

}
