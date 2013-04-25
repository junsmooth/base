package org.bgrimm.persistence;

import java.util.List;

import org.bgrimm.domain.system.TMenu;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MenuDao {
	// private String menuQuery =
	// "SELECT m FROM MENU m where m.parent.id = ?1 ";

	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private MessageSource message;

	@Transactional
	public List<TMenu> getMenusByParentId(int pid) {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(TMenu.class);
		Criterion cron = null;
		if (pid == 0) {
			cron = Restrictions.isNull("parent");
		} else {
			cron = Restrictions.eq("parent.id", pid);
		}
		c.add(cron);
		List<TMenu> list = c.list();
		for (TMenu m : list) {
			//m.setText(message.getMessage("menu."+m.getText(), null, m.getText(), null));
		}
		return list;

	}

}
