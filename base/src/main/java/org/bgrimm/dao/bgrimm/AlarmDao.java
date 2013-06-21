package org.bgrimm.dao.bgrimm;

import java.util.List;

import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.extend.Threshold;
import org.springframework.stereotype.Repository;

@Repository(value = "alarmDao")
public class AlarmDao extends CommonDao {

	public List<Threshold> loadNotDeletedThresholds() {
		return findByProperty(Threshold.class, "removed", false);
	}
}
