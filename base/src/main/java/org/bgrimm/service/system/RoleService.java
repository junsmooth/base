package org.bgrimm.service.system;

import java.util.List;

import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.system.TRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RoleService {
	@Autowired
	private CommonDao commonDao;
	public List<TRole> getAllRoles() {
		return commonDao.loadAll(TRole.class);
	}

	public TRole getUniqueById(long id) {
		return commonDao.findUniqueByProperty(TRole.class, "id", id);
	}

	public void saveOrUpdate(TRole role) {
		commonDao.saveOrUpdate(role);
	}

	public CommonDao getCommonDao() {
		return commonDao;
	}

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}
}
