package org.bgrimm.service;

import java.util.HashSet;
import java.util.Set;

import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.domain.system.TRole;
import org.bgrimm.domain.system.TUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService {
	@Autowired
	public CommonDao commonDao;

	public UserService() {
	}

	public void saveOrUpdate(TUser user) {
		if (user.getId() != 0) {
			TUser dest = commonDao.findUniqueByProperty(TUser.class, "id",
					user.getId());
			dest.setRoles(user.getRoles());
			dest.setRealname(user.getRealname());
			dest.setAddress(user.getAddress());
			dest.setCardno(user.getCardno());
			dest.setTelephone(user.getTelephone());
			dest.setEmail(user.getEmail());
			user = dest;
		}
		commonDao.saveOrUpdate(user);
	}

	public Set<TRole> getRolesByIds(String[] roleIdArray) {
		Set<TRole> roles = new HashSet();
		for (String id : roleIdArray) {
			TRole role = commonDao.findUniqueByProperty(TRole.class, "id",
					Long.parseLong(id));
			roles.add(role);
		}
		return roles;
	}

	public PageList getUserPageList(int page, int rows) {
		PagedQuery pq = new PagedQuery(TUser.class, page, rows);
		PageList pl = commonDao.getPagedList(pq);
		return pl;
	}

	public void removeUserById(long id) {
		commonDao.deleteEntityById(TUser.class, id);
	}

	public TUser findUserById(long id) {
		return commonDao.findUniqueByProperty(TUser.class, "id", id);
	}
}