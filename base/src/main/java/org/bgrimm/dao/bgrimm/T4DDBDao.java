package org.bgrimm.dao.bgrimm;

import org.apache.log4j.Logger;
import org.bgrimm.dao.core.impl.CommonDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
@Repository
public class T4DDBDao extends CommonDao{
	@Autowired
	@Qualifier("sessionFactory2")
	private SessionFactory sessionFactory;
	private static final Logger logger = Logger.getLogger(T4DDBDao.class);
	public Session getSession() {
		Session s=sessionFactory.getCurrentSession();
		s.getTransaction();
		return s;
	}
}
