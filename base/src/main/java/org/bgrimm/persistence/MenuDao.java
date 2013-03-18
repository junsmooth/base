package org.bgrimm.persistence;

import java.util.ArrayList;
import java.util.List;

import org.bgrimm.domain.Menu;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
	Session session=	sessionFactory.openSession();
		Menu m=new Menu();
		m.setText("test");
		session.save(m);
		
		return new ArrayList<Menu>();
		
	}

}
