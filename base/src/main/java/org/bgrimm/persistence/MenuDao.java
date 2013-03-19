package org.bgrimm.persistence;

import java.util.List;

import org.bgrimm.domain.Menu;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MenuDao {
	// private String menuQuery =
	// "SELECT m FROM MENU m where m.parent.id = ?1 ";

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public List<Menu> getMenusByParentId(int pid) {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Menu.class);
		Menu m = new Menu();
		Criterion cron=null;
		if(pid==0){
			cron = Restrictions.isNull("parent");
		}else{
			cron=Restrictions.eq("parent.id", pid);
		}
		c.add(cron);
		List list = c.list();
		System.out.println(list);
		return list;

	}

}
