package org.bgrimm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.DryBeachElevation;
import org.bgrimm.domain.bgrimm.Saturation;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.WaterLevel;
import org.bgrimm.domain.bgrimm.extend.MonitoringPoint;
import org.bgrimm.domain.bgrimm.extend.MonitoringType;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.utils.Constants;
import org.bgrimm.utils.DateUtils;
import org.bgrimm.utils.PagerUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.CriteriaImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;


@Service("JRXServiceImpl")
@Transactional
public class JRXServiceImpl {

	
	@Autowired
	@Qualifier("commonDao")
	private CommonDao commonDao;
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



}
