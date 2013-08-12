package org.bgrimm.service.impl;

import java.util.List;

import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.WKKGK;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("wkkgkService")
@Transactional
public class WKKGKService {
	@Autowired
	private CommonDao commonDao;

	public Object getWKKGKData() {

		List list=commonDao.loadAll(WKKGK.class);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	public void updateData(WKKGK wk) {

		commonDao.saveOrUpdate(wk);
	}

}
