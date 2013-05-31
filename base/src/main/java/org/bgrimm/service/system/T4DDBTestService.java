package org.bgrimm.service.system;

import java.util.List;

import org.bgrimm.dao.core.impl.T4DDBDao;
import org.bgrimm.domain.t4ddb.BMWY;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(value="txManager2")
public class T4DDBTestService {
	@Autowired
	private T4DDBDao dao;
	
	public List getT4ddb(){
		return dao.loadAll(BMWY.class);
	}
}
