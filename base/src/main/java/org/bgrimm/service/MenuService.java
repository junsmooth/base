package org.bgrimm.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import javax.sql.DataSource;

import org.bgrimm.common.datasource.DataSourceConst;
import org.bgrimm.common.datasource.DataSourceHandle;
import org.bgrimm.domain.Menu;
import org.bgrimm.persistence.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

@Service
public class MenuService {

	@Autowired
	private MenuMapper mapper;

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

	public List<Menu> getMainMenus() {
		List<Menu> allMainMenus = mapper.getMenusByParentId(0);
		return allMainMenus;
	}

	public List<Menu> getSubMenus(int id) {
		List<Menu> subMenus = mapper.getMenusByParentId(id);
		return subMenus;
	}

}
