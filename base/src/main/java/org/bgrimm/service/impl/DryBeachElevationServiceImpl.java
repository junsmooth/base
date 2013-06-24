package org.bgrimm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.monitor.provided.DryBeachElevation;
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
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

@Service(value="dryBeachElevationServiceImpl")
@Transactional
public class DryBeachElevationServiceImpl {

	@Autowired
	private TransactionTemplate template;
	@Autowired
	@Qualifier("commonDao")
	private CommonDao commonDao;

	/**
	 * 获取干滩高程数据
	 */
	public Object getDryBeachPageList(final TableParam param) {
		final List<Order> orderList=new ArrayList();
		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_DRYBEACHELEVATION);
		final List<MonitoringPoint> dryBeachPointList = commonDao.findByCriterions(
				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));

		PageList<DryBeachElevation> result = template.execute(new TransactionCallback() {

			public PageList doInTransaction(TransactionStatus status) {
				PagedQuery pq = new PagedQuery(DryBeachElevation.class, param.getPage(),
						param.getRows());
				DetachedCriteria criteria = pq.getDetachedCriteria();
				Integer[] arr = PagerUtil.strToArray(param.getStr());
				if (StringUtils.isNotEmpty(param.getMin())) {
					Date startDate = DateUtils.strToDate(param.getMin());
					criteria.add(Restrictions.ge("date_Time", startDate));
				}
				if (StringUtils.isNotEmpty(param.getMax())) {
					Date endDate = DateUtils.strToDate(param.getMax());
					criteria.add(Restrictions.le("date_Time", endDate));
				}
				if (StringUtils.isNotEmpty(param.getStr())) {
					criteria.add(Restrictions.in("monitoring_position", arr));
				} else {
					// 设置测点
					List<Integer> positions = new ArrayList();
					for (MonitoringPoint p : dryBeachPointList) {
						positions.add(p.getPosition());
					}
					criteria.add(Restrictions.in("monitoring_position", positions.toArray()));
				}
				Order or=Order.desc("date_Time");
				orderList.add(or);
				return commonDao.getPagedList(pq,orderList);
			}
		});
		// Parse Result, Add Point Info to data
		for (DryBeachElevation dbe : result.getRows()) {
			for (MonitoringPoint point : dryBeachPointList) {
				int position = point.getPosition();
				if (dbe.getMonitoringPosition()== position) {
					dbe.setPoint(point);
				}
			}
		}
		return result;
	}	
	
	/**
	 * 获取干滩高程所有测点
	 */
	public Object getAllPoints() {

		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_DRYBEACHELEVATION);
		final List<MonitoringPoint> damPoint = commonDao.findByCriterions(
				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		return damPoint;
	}

	


}
