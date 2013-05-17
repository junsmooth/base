package org.bgrimm.service;

import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.system.TRole;
import org.bgrimm.domain.tailings.MonitoringPoint;
import org.bgrimm.domain.tailings.MonitoringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ConfigService {
	@Autowired
	public CommonDao commonDao;

	public Object getAllMonType() {
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

	public Object getAllMonPoint() {
		return commonDao.loadAll(MonitoringPoint.class);
	}

}
