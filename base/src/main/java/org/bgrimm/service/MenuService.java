package org.bgrimm.service;

import java.util.ArrayList;
import java.util.List;

import org.bgrimm.domain.core.TMenu;
import org.bgrimm.persistence.MenuDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

@Service
public class MenuService {

	@Autowired
	private MenuDao menuDao;

	private List<String> getCurrentAuthorities() {
		UserDetails userDetails = (UserDetails) SecurityContextHolder
				.getContext().getAuthentication().getPrincipal();
		Object[] bojs = userDetails.getAuthorities().toArray();
		List<String> list = new ArrayList<String>();
		for (Object obj : bojs) {
			list.add(obj.toString());
		}
		return list;
	}

	public List<TMenu> getMainMenus() {
		List<TMenu> allMainMenus = menuDao.getMenusByParentId(0);
		return allMainMenus;
	}

	public List<TMenu> getSubMenus(int id) {
		List<TMenu> subMenus = menuDao.getMenusByParentId(id);
		return subMenus;
	}

}
