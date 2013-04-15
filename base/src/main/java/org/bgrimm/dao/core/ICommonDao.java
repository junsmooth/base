package org.bgrimm.dao.core;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.bgrimm.domain.core.PageList;
import org.bgrimm.domain.core.PagedQuery;
import org.hibernate.criterion.Criterion;

public interface ICommonDao {
	public <T> void save(T entity);
	public <T> void saveOrUpdate(T entity);
	public <T> void delete(T entitie);
	public <T> T get(Class<T> entityName, Serializable id);
	public <T> T findUniqueByProperty(Class<T> entityClass, String propertyName, Object value);
	public <T> T findUniqueBy(Class<T> entityClass, String propertyName, Object value);
	public <T> List<T> findByCriterions(Class<T> entityClass,Criterion... criterions);
	
	public <T> List<T> findByProperty(Class<T> entityClass, String propertyName, Object value);
	public <T> List<T> loadAll(final Class<T> entityClass);
	public <T> T getEntity(Class entityName, Serializable id);
	public <T> void deleteEntityById(Class entityName, Serializable id);
	public <T> void deleteAllEntitie(Collection<T> entities);
	public <T> void updateEntitie(T pojo);

	public <T> void updateEntityById(Class entityName, Serializable id);
	public <T> List<T> findByQueryString(String hql);
	public <T> T singleResult(String hql);
	public int updateBySqlString(String sql);
	public <T> List<T> findListbySql(String query);
	public <T> List<T> findByPropertyisOrder(Class<T> entityClass, String propertyName, Object value, boolean isAsc);
	public Map<Object,Object> getHashMapbyQuery(String query);
	public PageList getPageList(PagedQuery pq);
	
	
	
}
