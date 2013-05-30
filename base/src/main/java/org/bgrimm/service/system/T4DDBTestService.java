package org.bgrimm.service.system;

import org.bgrimm.dao.core.impl.T4DDBDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class T4DDBTestService {
	@Autowired
	private T4DDBDao dao;
}
