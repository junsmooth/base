package org.bgrimm.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.monitor.datamigration.TGTGC;
import org.bgrimm.domain.bgrimm.monitor.provided.GTGC;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.utils.Constants;
import org.bgrimm.utils.DataUtils;
import org.bgrimm.utils.DateUtils;
import org.bgrimm.utils.PagerUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

@Service(value="GTGCService")
@Transactional
public class GTGCService {

	@Autowired
	private TransactionTemplate template;
	@Autowired
	@Qualifier("commonDao")
	private CommonDao commonDao;

	
	/**
	 * 获取干滩高程所有测点
	 */
	public Object getAllPoints() {

		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_GTGC);
		Order or=Order.asc("position");
		Criteria criteria=commonDao.getSession().createCriteria(MonitoringPoint.class);
		criteria.add(Restrictions.eq("type.id", t.getId()));
		criteria.addOrder(or);
		return criteria.list();
	}

	
	
	/**
	 * 获取干滩高程数据
	 */
	public Object getGTGCPageList(final TableParam param) {
		List<Order> list=new ArrayList();
		MonitoringType t=commonDao.findUniqueBy(MonitoringType.class, "code", Constants.JCD_GTGC);
		List<MonitoringPoint> gtgcPointList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		PagedQuery pq = new PagedQuery(GTGC.class, param.getPage(), param.getRows());
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
			for (MonitoringPoint p : gtgcPointList) {
				positions.add(p.getPosition());
			}
			criteria.add(Restrictions.in("monitoringPosition", positions.toArray()));
		}
		Order or=Order.desc("dateTime");
		list.add(or);
		PageList<GTGC> pl= commonDao.getPagedList(pq,list);
		//将DryBeachLength与MonitoringPoint关联起来，主要是为了在页面根据测点获取对应名称
		for (GTGC gtgc : pl.getRows()) {
			for (MonitoringPoint point : gtgcPointList) {
				if (gtgc.getMonitoringPosition()== point.getPosition()) {
					gtgc.setPoint(point);
				}
			}
		}
//		setDecimalDigits(pl.getRows());
		return pl;
	}	
	
	


	/**
	 * 获取干滩高程的时间和的值List
	 * @param param
	 * @return
	 */
	@Transactional(isolation=Isolation.DEFAULT,readOnly=false)
	public Object getGCGCChartList(TableParam param) {
		List<Order> list=new ArrayList();
		Criteria criteria=commonDao.getSession().createCriteria(GTGC.class);
		List li= getGTGCChartData(criteria, param);
		//setDecimalDigits(li);
		if(li.size()>Constants.MAXIMUM_ALLOWED_VALUE){
			Criteria tCriteria=commonDao.getSession().createCriteria(TGTGC.class);
			List tList=getGTGCChartData(tCriteria,param);
			//setDecimalDigits(tList);
			return DataUtils.objectList2JSonList(tList, new Object[]{"dateTime","value"});
			
		}else{
			return DataUtils.objectList2JSonList(li, new Object[]{"dateTime","value"});
		}
	}

	//根据条件从表中获取干滩高程时间和值
	private List getGTGCChartData(Criteria criteria,TableParam param) {

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
	
//
//	private void setDecimalDigits(List<GTGC> result) {
//
//		for(GTGC gtgc: result){
//			gtgc.setValue((BigDecimal)gtgc.getValue().setScale(2,BigDecimal.ROUND_HALF_UP));
//		}
//	}

}
