package org.bgrimm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.monitor.datamigration.TJRX;
import org.bgrimm.domain.bgrimm.monitor.provided.JRX;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.utils.Constants;
import org.bgrimm.utils.DataUtils;
import org.bgrimm.utils.DateUtils;
import org.bgrimm.utils.PagerUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;


@Service("JRXService")
@Transactional
public class JRXService {

	
	@Autowired
	@Qualifier("commonDao")
	private CommonDao commonDao;
	
	
	@Autowired
	PackingDataServiceImpl packingDataServiceImpl;
	
	/**
	 * 获取所有测点
	 */
	public Object getAllPoints() {
		
		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_JRX);
		final List<MonitoringPoint> jrxPoint = commonDao.findByCriterions(
				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		return jrxPoint;

	}
	
	/**
	 * 获取测点数据
	 */
	public Object getJRXMonitorPosition(TableParam param) {

		List<Order> list=new ArrayList();
		MonitoringType t=commonDao.findUniqueBy(MonitoringType.class, "code", Constants.JCD_JRX);
		List<MonitoringPoint> jrxPointList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		PagedQuery pq = new PagedQuery(JRX.class, param.getPage(), param.getRows());
		DetachedCriteria criteria = pq.getDetachedCriteria();
		Integer[] arr = PagerUtil.strToArray(param.getStr());
		if (StringUtils.isNotEmpty(param.getMin())) {
			Date startDate = DateUtils.strToDate(param.getMin());
			criteria.add(Restrictions.ge("dateTime", startDate));
		}
		if (StringUtils.isNotEmpty(param.getMax())) {
			Date endDate = DateUtils.strToDate(param.getMax());
			criteria.add(Restrictions.le("dateTime", endDate));
		}
		if (StringUtils.isNotEmpty(param.getStr())) {
			criteria.add(Restrictions.in("monitoringPosition", arr));
		} else {
			// 设置测点
			List<Integer> positions = new ArrayList();
			for (MonitoringPoint p : jrxPointList) {
				positions.add(p.getPosition());
			}
			criteria.add(Restrictions.in("monitoringPosition", positions.toArray()));
		}
		Order or=Order.desc("dateTime");
		list.add(or);
		PageList<JRX> pl= commonDao.getPagedList(pq,list);
		//将DryBeachLength与MonitoringPoint关联起来，主要是为了在页面根据测点获取对应名称
		for (JRX sa : pl.getRows()) {
			for (MonitoringPoint point : jrxPointList) {
				if (sa.getMonitoringPosition()== point.getPosition()) {
					sa.setPoint(point);
				}
			}
		}
		return pl;
	}

	/**
	 * 获取浸润线的时间和的值List
	 * @param param
	 * @return
	 */
	@Transactional(isolation=Isolation.DEFAULT,readOnly=false)
	public Object getJrxChartData(TableParam param) {
		List<Order> list=new ArrayList();
		Criteria criteria=commonDao.getSession().createCriteria(JRX.class);
		List li= getJRXChartData(criteria, param);
		if(li.size()>Constants.MAXIMUM_ALLOWED_VALUE){
			Criteria tCriteria=commonDao.getSession().createCriteria(TJRX.class);
			List tList=getJRXChartData(tCriteria,param);
			return DataUtils.objectList2JSonList(tList, new Object[]{"dateTime","value"});
			
		}else{
			return DataUtils.objectList2JSonList(li, new Object[]{"dateTime","value"});
		}
	}

	//根据条件从表中获取浸润线时间和值
	private List getJRXChartData(Criteria criteria,TableParam param) {

		Integer arr =Integer.parseInt(param.getStr());
		if (StringUtils.isNotEmpty(param.getMin())) {
			Date startDate = DateUtils.strToDate(param.getMin());
			criteria.add(Restrictions.ge("dateTime", startDate));
		}
		if (StringUtils.isNotEmpty(param.getMax())) {
			Date endDate = DateUtils.strToDate(param.getMax());
			criteria.add(Restrictions.le("dateTime", endDate));
		}
		if (StringUtils.isNotEmpty(param.getStr())) {
			criteria.add(Restrictions.eq("monitoringPosition", arr));
		} 

		criteria.addOrder(Order.asc("dateTime"));
		return criteria.list();
	}
	


}
