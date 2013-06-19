package org.bgrimm.dao.core.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.bgrimm.dao.core.ICommonDao;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.utils.PagerUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.CriteriaImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

@Repository(value="commonDao")
public class CommonDao implements ICommonDao {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	private static final Logger logger = Logger.getLogger(CommonDao.class);

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public <T> void delete(T entity) {
		try {
			getSession().delete(entity);
			getSession().flush();
			if (logger.isDebugEnabled()) {
				logger.debug("DELETE SUCCESS," + entity.getClass().getName());
			}
		} catch (RuntimeException e) {
			logger.error("DELETE EXCEPTION", e);
			throw e;
		}

	}

	public <T> T get(Class<T> entityClass, Serializable id) {
		return (T) getSession().get(entityClass, id);
	}

	public <T> T findUniqueByProperty(Class<T> entityClass,
			String propertyName, Object value) {
		Assert.hasText(propertyName);
		return (T) createCriteria(entityClass,
				Restrictions.eq(propertyName, value)).uniqueResult();
	}

	public <T> List<T> findByProperty(Class<T> entityClass,
			String propertyName, Object value) {
		Assert.hasText(propertyName);
		return (List<T>) createCriteria(entityClass,
				Restrictions.eq(propertyName, value)).list();
	}

	public <T> List<T> loadAll(Class<T> entityClass) {
		Criteria criteria = createCriteria(entityClass);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}

	public <T> T getEntity(Class entityClass, Serializable id) {
		return (T) getSession().get(entityClass, id);
	}

	public <T> void deleteEntityById(Class entityClass, Serializable id) {
		Object obj = get(entityClass, id);
		System.out.println("ooo" + obj);
		delete(get(entityClass, id));
		getSession().flush();
	}

	public <T> void deleteAllEntitie(Collection<T> entities) {
		for (Object entity : entities) {
			getSession().delete(entity);
			getSession().flush();
		}

	}

	public <T> void updateEntitie(T pojo) {
		getSession().update(pojo);
		getSession().flush();
	}

	public <T> void updateEntityById(Class entityClass, Serializable id) {
		updateEntitie(get(entityClass, id));
	}

	public <T> List<T> findByQueryString(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	public <T> T singleResult(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateBySqlString(String sql) {
		// TODO Auto-generated method stub
		return 0;
	}

	public <T> List<T> findListbySql(String query) {
		// TODO Auto-generated method stub
		return null;
	}

	public <T> List<T> findByPropertyisOrder(Class<T> entityClass,
			String propertyName, Object value, boolean isAsc) {
		// TODO Auto-generated method stub
		return null;
	}

	public Map<Object, Object> getHashMapbyQuery(String query) {
		return null;
	}

	private <T> Criteria createCriteria(Class<T> entityClass) {
		Criteria criteria = getSession().createCriteria(entityClass);
		return criteria;
	}

	private <T> Criteria createCriteria(Class<T> entityClass, boolean isAsc,
			Criterion... criterions) {
		Criteria criteria = createCriteria(entityClass, criterions);
		if (isAsc) {
			criteria.addOrder(Order.asc("asc"));
		} else {
			criteria.addOrder(Order.desc("desc"));
		}
		return criteria;
	}

	private <T> Criteria createCriteria(Class<T> entityClass,
			Criterion... criterions) {
		Criteria criteria = getSession().createCriteria(entityClass);
		for (Criterion c : criterions) {
			criteria.add(c);
		}
		return criteria;
	}

	public <T> void save(T entity) {
		try {
			getSession().save(entity);
			getSession().flush();
			if (logger.isDebugEnabled()) {
				logger.debug("保存实体成功," + entity.getClass().getName());
			}
		} catch (RuntimeException e) {
			logger.error("保存实体异常", e);
			throw e;
		}
	}

	public <T> T findUniqueBy(Class<T> entityClass, String propertyName,
			Object value) {
		Assert.hasText(propertyName);
		return (T) createCriteria(entityClass,
				Restrictions.eq(propertyName, value)).uniqueResult();
	}

	public <T> List<T> findByCriterions(Class<T> entityClass,
			Criterion... criterions) {
		return (List<T>) createCriteria(entityClass, criterions).list();
	}

	public <T> void saveOrUpdate(T entity) {
		try {
			getSession().saveOrUpdate(entity);
			getSession().flush();
			if (logger.isDebugEnabled()) {
				logger.debug("SAVE OR UPDATE SUCCESS,"
						+ entity.getClass().getName());
			}
		} catch (RuntimeException e) {
			logger.error("SAVE OR UPDATE EXCEPTION", e);
			throw e;
		}

	}
/**
 * This Implementation is only support Object that do not have child Objects
 */
	public PageList getPagedList(PagedQuery pq,List<Order> list) {

		Criteria criteria = pq.getDetachedCriteria().getExecutableCriteria(
				getSession());
		CriteriaImpl impl = (CriteriaImpl) criteria;
		Projection projection = impl.getProjection();
		
		final int allCounts = ((Long) criteria.setProjection(
				Projections.rowCount()).uniqueResult()).intValue();
		criteria.setProjection(projection);
		if (projection == null) {
			criteria.setResultTransformer(CriteriaSpecification.ROOT_ENTITY);
		}
//		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
//		criteria.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		int offset = PagerUtil.getOffset(allCounts, pq.getCurrentPage(),
				pq.getPageSize());
		criteria.setFirstResult(offset);
		criteria.setMaxResults(pq.getPageSize());
		
		for(Order order:list){
			criteria.addOrder(order);
		}
		
		return new PageList(criteria.list(),allCounts);
	}

	public <T> List<T> queryByExample(Class<T> entityClass, Object example) {
		return createCriteria(entityClass).add(Example.create(example)).list();
	}
}
