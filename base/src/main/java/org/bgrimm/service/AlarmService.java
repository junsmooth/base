package org.bgrimm.service;

import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.extend.AlarmColor;
import org.bgrimm.domain.bgrimm.extend.AlarmType;
import org.bgrimm.domain.bgrimm.extend.Threshold;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AlarmService {
	@Autowired
	public CommonDao commonDao;

	public Object getAllThreshold() {
		return commonDao.loadAll(Threshold.class);
	}

	public Object getAllAlarmType() {
		return commonDao.loadAll(AlarmType.class);
	}

	public Object getAllAlarmColor() {
		return commonDao.loadAll(AlarmColor.class);
	}
}
