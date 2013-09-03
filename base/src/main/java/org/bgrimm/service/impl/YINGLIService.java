package org.bgrimm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.monitor.datamigration.TKSW;
import org.bgrimm.domain.bgrimm.monitor.datamigration.TYINGLIJI;
import org.bgrimm.domain.bgrimm.monitor.extended.YINGLIJI;
import org.bgrimm.domain.bgrimm.monitor.provided.KSW;
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
import org.springframework.transaction.annotation.Transactional;

@Service(value = "YINGLIService")
@Transactional
public class YINGLIService {
	@Autowired
	@Qualifier("commonDao")
	private CommonDao commonDao;

	public Object getAllPoints() {

		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_YINGLI);
		Order order = Order.asc("position");
		Criteria criteria = commonDao.getSession().createCriteria(
				MonitoringPoint.class);
		criteria.add(Restrictions.eq("type.id", t.getId()));
		criteria.addOrder(order);
		return criteria.list();

	}

	public Object getChartData(TableParam param) {
		List<Order> list = new ArrayList();
		Criteria criteria = commonDao.getSession().createCriteria(YINGLIJI.class);
		List li = getRawChartData(criteria, param);
		// setDecimalDigits(li);
		if (li.size() > Constants.MAXIMUM_ALLOWED_VALUE) {
			Criteria tCriteria = commonDao.getSession().createCriteria(
					TYINGLIJI.class);
			List tList = getRawChartData(tCriteria, param);
			// setDecimalDigits(tList);
			return DataUtils.objectList2JSonList(tList, new Object[] {
					"dateTime", "value" });

		} else {
			return DataUtils.objectList2JSonList(li, new Object[] { "dateTime",
					"value" });
		}

	}

	private List getRawChartData(Criteria criteria, TableParam param) {
		Integer arr = Integer.parseInt(param.getStr());
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

	public Object getYingLiPageList(TableParam param) {
		List<Order> list=new ArrayList();
		MonitoringType t=commonDao.findUniqueBy(MonitoringType.class, "code", Constants.JCD_YINGLI);
		List<MonitoringPoint> poingList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		PagedQuery pq = new PagedQuery(YINGLIJI.class, param.getPage(), param.getRows());
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
			for (MonitoringPoint p : poingList) {
				positions.add(p.getPosition());
			}
			criteria.add(Restrictions.in("monitoringPosition", positions.toArray()));
//			criteria.add(Restrictions.in("monitoring_position", new Object[]{1}));
		}
		Order or=Order.desc("dateTime");
		list.add(or);
		PageList<YINGLIJI> pl= commonDao.getPagedList(pq,list);
		//将DryBeachLength与MonitoringPoint关联起来，主要是为了在页面根据测点获取对应名称
		for (YINGLIJI yingli : pl.getRows()) {
			for (MonitoringPoint point : poingList) {
				if (yingli.getMonitoringPosition()== point.getPosition()) {
					yingli.setPoint(point);
				}
			}
		}
//		setDecimalDigits(pl.getRows());
		return pl;
	
	}
}
