package org.bgrimm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.monitor.provided.DryBeachLength;
import org.bgrimm.domain.bgrimm.monitor.provided.WaterLevel;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.utils.Constants;
import org.bgrimm.utils.DateUtils;
import org.bgrimm.utils.PagerUtil;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service(value="waterLevelServiceImpl")
@Transactional
public class WaterLevelServiceImpl{

	@Autowired
	@Qualifier("commonDao")
	private CommonDao commonDao;
	/**
	 * 获取所有测点
	 */
	public Object getAllPoints() {
		
		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_WATERLEVEL);
		final List<MonitoringPoint> waterPoint = commonDao.findByCriterions(
				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		return waterPoint;

	}
	
	/**
	 * 获取测点数据
	 */
	public Object getWaterLevelPageList(TableParam param) {

		List<Order> list=new ArrayList();
		MonitoringType t=commonDao.findUniqueBy(MonitoringType.class, "code", Constants.JCD_WATERLEVEL);
		List<MonitoringPoint> waterLevelPointList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		PagedQuery pq = new PagedQuery(WaterLevel.class, param.getPage(), param.getRows());
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
			for (MonitoringPoint p : waterLevelPointList) {
				positions.add(p.getPosition());
			}
			criteria.add(Restrictions.in("monitoringPosition", positions.toArray()));
//			criteria.add(Restrictions.in("monitoring_position", new Object[]{1}));
		}
		Order or=Order.desc("dateTime");
		list.add(or);
		PageList<WaterLevel> pl= commonDao.getPagedList(pq,list);
		//将DryBeachLength与MonitoringPoint关联起来，主要是为了在页面根据测点获取对应名称
		for (WaterLevel wl : pl.getRows()) {
			for (MonitoringPoint point : waterLevelPointList) {
				if (wl.getMonitoringPosition()== point.getPosition()) {
					wl.setPoint(point);
				}
			}
		}
		return pl;
	}

	
}
