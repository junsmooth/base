package org.bgrimm.service.impl;

import java.util.List;

import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.XMGK;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("xmgkService")
@Transactional
public class XMGKService {
	@Autowired
	private CommonDao commonDao;

	public Object getXMGKData() {

		//List list=commonDao.loadAll(XMGK.class);
		List xmgkList=commonDao.loadAll(XMGK.class);
		if(xmgkList.size()>0){
			return xmgkList.get(0);
		}
		return null;
	}

	public void updateData(XMGK xm) {
		commonDao.saveOrUpdate(xm);
	}


}
