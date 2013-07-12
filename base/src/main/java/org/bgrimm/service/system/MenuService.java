package org.bgrimm.service.system;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.system.TIcon;
import org.bgrimm.domain.system.TMenu;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("menuService")
@Transactional
public class MenuService {
//
//	@Autowired
//	private MenuDao menuDao;
	@Autowired
	private CommonDao commonDao;
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

	public void removeEntity(long id	){
		commonDao.deleteEntityById(TMenu.class, id);
	}
	public List<TMenu> getParentMenus() {
		return commonDao.findByCriterions(TMenu.class,
				Restrictions.eq("parentMenu.id", 1L));
	}
	public TMenu getRootMenu() {
		return commonDao.findUniqueByProperty(TMenu.class, "id", 1L);
	}
	public List<TMenu> getAllMenus(){
		return commonDao.loadAll(TMenu.class);
	}
	
	public List<TIcon> getAllIcon() {
		return commonDao.loadAll(TIcon.class);
	}

	public TMenu getUniqueById(long pid) {
		return commonDao.findUniqueByProperty(TMenu.class, "id", pid);
	}

	public void saveOrUpdate(TMenu menu) {
		commonDao.saveOrUpdate(menu);
	}

	public Object isValidModuleName(String menumodulename,String id) {
		
		if(StringUtils.isNumeric(id)){
			TMenu m1=commonDao.findUniqueByProperty(TMenu.class, "id", Long.parseLong(id));
			if(m1.getModuleName().equals(menumodulename)){
				return true;
			}
		}
		TMenu menu=commonDao.findUniqueByProperty(TMenu.class, "moduleName", menumodulename);
		if(menu==null){
			return true;
		}
		return false;
	}

	public Object isValidMenuName(String menuName, String id) {
		if(StringUtils.isNumeric(id)){
			TMenu m1=commonDao.findUniqueByProperty(TMenu.class, "id", Long.parseLong(id));
			if(m1.getMenuName().equals(menuName)){
				return true;
			}
		}
		TMenu menu=commonDao.findUniqueByProperty(TMenu.class, "menuName", menuName);
		if(menu==null){
			return true;
		}
		return false;
	}


}
