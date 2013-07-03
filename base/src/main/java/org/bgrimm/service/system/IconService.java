package org.bgrimm.service.system;

import java.util.ArrayList;
import java.util.List;

import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.domain.system.TIcon;
import org.bgrimm.domain.system.TUser;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("iconService")
@Transactional
public class IconService {
	@Autowired
	private CommonDao commonDao;

	public Object getPagedList(int page, int rows) {
		PagedQuery pq = new PagedQuery(TIcon.class, page, rows);
		List<Order> list = new ArrayList();
		list.add(Order.asc("iconName"));
		PageList pl = commonDao.getPagedList(pq, list);
		return pl;
	}

}
