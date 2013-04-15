package org.bgrimm.service.core;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.bgrimm.domain.core.PageList;
import org.bgrimm.domain.core.PagedQuery;
import org.hibernate.criterion.Criterion;



public interface CommonService {
	/**
	 * 获取所有数据库表
	 * @return
	 */
	public <T> void save(T entity);
	public <T> void saveOrUpdate(T entity);
	public <T> void delete(T entity);
	/**
	 * 根据实体名称和主键获取实体
	 * 
	 * @param <T>
	 * @param entityName
	 * @param id
	 * @return
	 */
	public <T> T get(Class<T> cls, Serializable id);
	/**
	 * 根据实体名称和主键获取实体
	 * 
	 * @param <T>
	 * @param entityName
	 * @param id
	 * @return
	 */
	public <T> T getEntity(Class entityName, Serializable id);
	/**
	 * 根据实体名称和字段名称和字段值获取唯一记录
	 * @param <T>
	 * @param entityClass
	 * @param propertyName
	 * @param value
	 * @return
	 */
	public <T> List<T> findByCriterion(Class<T> entityCls,Criterion... criterions);
	public <T> T findUniqueByProperty(Class<T> entityClass, String propertyName, Object value);
	public <T> List<T> findByProperty(Class<T> entityClass,String propertyName, Object value);
	public <T> List<T> loadAll(final Class<T> entityClass);
		
	public <T> void deleteEntityById(Class entityName, Serializable id);

	public <T> void deleteAllEntitie(Collection<T> entities);

	public <T> void updateEntitie(T pojo);

	public <T> List<T> findByQueryString(String hql);
	public int updateBySqlString(String sql);

	public <T> List<T> findListbySql(String query);
	public <T> List<T> findByPropertyisOrder(Class<T> entityClass, String propertyName, Object value, boolean isAsc);
	
	public <T> List<T> getList(Class clas);
	
	public <T> T singleResult(String hql);
	
	public List findByExample(final String entityName, final Object exampleEntity);
	public void parserXml(String fileName);
	
	public PageList getPagedList(PagedQuery pq);
}
