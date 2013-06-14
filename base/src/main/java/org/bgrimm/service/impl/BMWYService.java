package org.bgrimm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.bgrimm.T4DDBDao;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.MonitoringPoint;
import org.bgrimm.domain.bgrimm.MonitoringType;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.domain.t4ddb.BMWY;
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

@Service
@Transactional
public class BMWYService {
	@Autowired
	private T4DDBDao dao;

	@Autowired
	private TransactionTemplate template;
	@Autowired
	@Qualifier("commonDao")
	private CommonDao commonDao;

	public List getT4ddb() {
		List list1 = loadBMWYTypes();
		loadBMWYDATA();
		return new ArrayList();
	}

	private List loadBMWYTypes() {
		List<MonitoringPoint> list = commonDao.loadAll(MonitoringPoint.class);
		return list;
	}

	private List loadBMWYDATA() {

		List result = template.execute(new TransactionCallback() {

			public List doInTransaction(TransactionStatus status) {
				List l = dao.loadAll(BMWY.class);
				return l;
			}
		});
		return result;
	}

	public Object getPagedList(final TableParam param) {
		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_BMWY);
		final List<MonitoringPoint> bmwyPointList = commonDao.findByCriterions(
				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));

		PageList<BMWY> result = template.execute(new TransactionCallback() {

			public PageList doInTransaction(TransactionStatus status) {
				PagedQuery pq = new PagedQuery(BMWY.class, param.getPage(),
						param.getRows());
				DetachedCriteria criteria = pq.getDetachedCriteria();
				Integer[] arr = PagerUtil.strToArray(param.getStr());
				if (StringUtils.isNotEmpty(param.getMin())) {
					Date startDate = DateUtils.strToDate(param.getMin());
					criteria.add(Restrictions.ge("logtime", startDate));
				}
				if (StringUtils.isNotEmpty(param.getMax())) {
					Date endDate = DateUtils.strToDate(param.getMax());
					criteria.add(Restrictions.le("logtime", endDate));
				}
				if (StringUtils.isNotEmpty(param.getStr())) {
					criteria.add(Restrictions.in("stationId", arr));
				} else {
					// use all ids
					List<Integer> idList = new ArrayList();
					for (MonitoringPoint p : bmwyPointList) {
						idList.add(p.getPosition());
					}
					criteria.add(Restrictions.in("stationId", idList.toArray()));
				}
				List<Order> list=new ArrayList<Order>();
				Order od=Order.desc("logtime");
				list.add(od);
				return dao.getPagedList(pq,list);
			}
		});
		// Parse Result, Add Point Info to data
		for (BMWY bmwy : result.getRows()) {
			for (MonitoringPoint point : bmwyPointList) {
				int position = point.getPosition();
				if (bmwy.getStationId() == position) {
					bmwy.setPoint(point);
				}
			}
		}
		return result;
	}

	/**
	 * Get All BMWY JCDs
	 * 
	 * @return
	 */
	public Object getAllPoints() {
		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_BMWY);
		final List<MonitoringPoint> bmwyPointList = commonDao.findByCriterions(
				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		return bmwyPointList;
	}
}
