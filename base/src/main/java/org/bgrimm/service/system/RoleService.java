package org.bgrimm.service.system;

import java.util.List;

import org.bgrimm.domain.system.TRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService {
	public CommonService getCommonService() {
		return commonService;
	}

	@Autowired
	private CommonService commonService;

	public List<TRole> getAllRoles() {
		return commonService.loadAll(TRole.class);
	}

	public TRole getUniqueById(long id) {
		return commonService.findUniqueByProperty(TRole.class, "id", id);
	}

	public void saveOrUpdate(TRole role) {
		commonService.saveOrUpdate(role);
	}
}
