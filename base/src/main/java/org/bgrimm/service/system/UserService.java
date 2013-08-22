package org.bgrimm.service.system;

import java.util.HashSet;
import java.util.Set;

import org.bgrimm.dao.core.impl.UserDao;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.domain.system.TRole;
import org.bgrimm.domain.system.TUser;
import org.bgrimm.utils.JSONUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserDao userDao;

	
	private Md5PasswordEncoder encoder=new Md5PasswordEncoder();
	public UserService() {
	}

	public void saveOrUpdate(TUser user) {
		if (user.getId() != 0) {
			TUser dest = userDao.findUniqueByProperty(TUser.class, "id",
					user.getId());
			dest.setRoles(user.getRoles());
			dest.setRealname(user.getRealname());
			dest.setAddress(user.getAddress());
			dest.setCardno(user.getCardno());
			dest.setTelephone(user.getTelephone());
			dest.setEmail(user.getEmail());
			dest.setAlarmType(user.getAlarmType());
			user = dest;
		}else{
			String rawPassword=user.getPassword();
			user.setPassword(encoder.encodePassword(rawPassword, "bgrimm"));
		}
		userDao.saveOrUpdate(user);
	}

	public Set<TRole> getRolesByIds(String[] roleIdArray) {
		Set<TRole> roles = new HashSet();
		for (String id : roleIdArray) {
			TRole role = userDao.findUniqueByProperty(TRole.class, "id",
					Long.parseLong(id));
			roles.add(role);
		}
		return roles;
	}

	public PageList getUserPageList(int page, int rows) {
		PagedQuery pq = new PagedQuery(TUser.class, page, rows);
		PageList pl = userDao.getPagedList(pq);
		return pl;
	}

	public void removeUserById(long id) {
		userDao.deleteEntityById(TUser.class, id);
	}

	public TUser findUserById(long id) {
		return userDao.findUniqueByProperty(TUser.class, "id", id);
	}

	public boolean isValidUserName(String username) {

		TUser user = userDao.findUniqueByProperty(TUser.class, "username",
				username);
		if (user == null) {
			return true;
		}
		return false;
	}

	public void updatePassword(String password) {
		TUser user=getCurrentUser();
		user.setPassword(encoder.encodePassword(password, "bgrimm"));
		userDao.saveOrUpdate(user);
	}

	private TUser getCurrentUser() {
		Object principal = SecurityContextHolder.getContext()
				.getAuthentication();
		String userName="";
		if (principal != null
				&& principal instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) principal;
			userName = token.getName();
		}
		return userDao.findUniqueByProperty(TUser.class, "username", userName);
	}

	public boolean validOldPassword(String oldPass) {
		TUser user=getCurrentUser();
		String encodedOldPass=encoder.encodePassword(oldPass,"bgrimm");
		return user.getPassword().equals(encodedOldPass);
	}
}