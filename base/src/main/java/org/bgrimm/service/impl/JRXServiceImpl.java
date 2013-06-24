package org.bgrimm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.Saturation;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.extend.MonitoringPoint;
import org.bgrimm.domain.bgrimm.extend.MonitoringType;
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


@Service("JRXServiceImpl")
@Transactional
public class JRXServiceImpl {

	
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
		PagedQuery pq = new PagedQuery(Saturation.class, param.getPage(), param.getRows());
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
		PageList<Saturation> pl= commonDao.getPagedList(pq,list);
		//将DryBeachLength与MonitoringPoint关联起来，主要是为了在页面根据测点获取对应名称
		for (Saturation sa : pl.getRows()) {
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
		MonitoringType t=commonDao.findUniqueBy(MonitoringType.class, "code", Constants.JCD_JRX);
		List<MonitoringPoint> jrxPointList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		Criteria criteria=commonDao.getSession().createCriteria(Saturation.class);
		ProjectionList pList=Projections.projectionList();
//		pList.add(Projections.property("dateTime"));
//		pList.add(Projections.property("value"));
//		criteria.setProjection(pList);
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

		criteria.addOrder(Order.asc("dateTime"));
		List li= criteria.list();
		
		
		if(li.size()>100000){
			List nameList=new ArrayList();
			nameList.add("value");
			return DataUtils.packingData(nameList, li);
		}else{
			packingDataServiceImpl.packingDataOfHour();
			return toPageJSonList(li);
		}
//		return li;
	}

	private List toPageJSonList(List li) {

		List listData=new ArrayList();
		for(Object obj:li){
			Saturation sa=(Saturation)obj;
			List list=new ArrayList();
			list.add(sa.getDateTime());
			list.add(sa.getValue());
			listData.add(list);
		}
		return listData;
	}



}
