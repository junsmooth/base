package org.bgrimm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.MonitoringPoint;
import org.bgrimm.domain.bgrimm.MonitoringType;
import org.bgrimm.domain.bgrimm.TSaturation;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.utils.Constants;
import org.bgrimm.utils.DateUtils;
import org.bgrimm.utils.PagerUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.CriteriaImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("JRXServiceImpl")
@Transactional
public class JRXServiceImpl {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Autowired
	private	CommonDao commonDao;
	/**
	 *分页将查询
	 * @param page
	 * @param rows
	 * @return
	 */
	public Object getJRXPageList(TableParam param) {

		Session se=getSessionMethod();

		List<MonitoringType> tm=commonDao.findByCriterions(MonitoringType.class,Restrictions.like("code", Constants.JCD_JRX));
		long jrxId=((MonitoringType)tm.get(0)).getId();

		List<MonitoringPoint> tmPoint=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.eq("type.id", jrxId));

		Object [] jrxPosition=new Object[tmPoint.size()];
		Object [] jrxName=new Object[tmPoint.size()];
		int i=0;
		int j=0;
		for(MonitoringPoint t: tmPoint){
			
			jrxPosition[i++]=t.getPosition();
			jrxName[j++]=t.getMonitoringName();
		}
		
		PagedQuery pq = new PagedQuery(TSaturation.class, param.getPage(), param.getRows());
		PageList pl =getPagedList(pq,jrxPosition,jrxName,param);
	
		
		return pl;
	}
	

	
	private PageList getPagedList(PagedQuery pq,Object [] obj,Object [] name,TableParam param) {

		Criteria criteria = pq.getDetachedCriteria().getExecutableCriteria(
				getSession());
		CriteriaImpl impl = (CriteriaImpl) criteria;
		Projection projection = impl.getProjection();
		
		
		//
		Integer [] arr=strToArray(param.getStr());
		
		if(StringUtils.isNotEmpty(param.getMin())){
			Date startDate=DateUtils.strToDate(param.getMin());
			criteria.add(Restrictions.ge("date_Time", startDate));
		}
		if(StringUtils.isNotEmpty(param.getMax())){
			Date endDate=DateUtils.strToDate(param.getMax());
			criteria.add(Restrictions.le("date_Time", endDate));
		}
		if(StringUtils.isNotEmpty(param.getStr())){
			criteria.add(Restrictions.in("monitoring_position", arr));
		}else{
			criteria.add(Restrictions.in("monitoring_position", obj));
		}
		
		final int allCounts = ((Long) criteria.setProjection(
				Projections.rowCount()).uniqueResult()).intValue();
		criteria.setProjection(projection);
		
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		int offset = PagerUtil.getOffset(allCounts, pq.getCurrentPage(),
				pq.getPageSize());
		criteria.setFirstResult(offset);
		criteria.setMaxResults(pq.getPageSize());
		criteria.addOrder(Order.asc("date_Time"));
		List<TSaturation> l=criteria.list();
		for(TSaturation ts:l){
			for(int i=0;i<obj.length;i++){
				if(ts.getMonitoring_position().equals(obj[i])){
					ts.setMonitorName((String)name[i]);
				}
			}
		}
		return new PageList(l,allCounts);
	}

	/**
	 * 获取所有浸润线测点
	 */
	public Object getJRXMonitorPosition() {
		long bd=getMontypeid(Constants.JCD_JRX);
		List monitorPositionList=new ArrayList();
		if(bd!=-1){
			 monitorPositionList=getMonitorPositionById(bd);
		}
		return monitorPositionList;
	}

	//获取当前监测点所有的名称和点位
	private List getMonitorPositionById(long bd) {
		Session se=getSessionMethod();
		return se.createCriteria(MonitoringPoint.class)
			.add(Restrictions.eq("type.id", bd))
			.list();
	}


	//获取浸润线类型
	private long getMontypeid(String jcdJrx) {

		List<MonitoringType> tmt=commonDao.findByCriterions(MonitoringType.class, Restrictions.like("code", Constants.JCD_JRX));
		long bd=-1;
		if(tmt.size()>0){
			bd=tmt.get(0).getId();
		}
		return bd;
	}


	//获取本地session
	private Session getSessionMethod() {
		return sessionFactory.getCurrentSession();
	}




	//将字符串转换为Integer类型的数组
	private Integer[] strToArray(String str) {

		if(StringUtils.isNotEmpty(str)){
			String [] s=str.split(",");
			Integer [] arr=new Integer [s.length];
			for(int i=0;i<s.length;i++){
				arr[i]=Integer.parseInt(s[i]);
			}
			return arr;
		}
		return null;
	}

}
