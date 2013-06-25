package org.bgrimm.service;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bgrimm.dao.bgrimm.AlarmDao;
import org.bgrimm.dao.bgrimm.T4DDBDao;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.TimeValue;
import org.bgrimm.domain.bgrimm.common.AlarmColor;
import org.bgrimm.domain.bgrimm.common.AlarmRecord;
import org.bgrimm.domain.bgrimm.common.AlarmType;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.Threshold;
import org.bgrimm.domain.bgrimm.common.ThresholdOperation;
import org.bgrimm.domain.bgrimm.monitor.provided.JRX;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.utils.Constants;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.CriteriaImpl;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

@Service
@Transactional
public class AlarmService {
	@Autowired
	public AlarmDao alarmDao;
	@Autowired
	private TransactionTemplate template;

	@Autowired
	private T4DDBDao dao;

	public Object getAllThreshold() {
		return alarmDao.loadNotDeletedThresholds();
	}

	public Object getAllAlarmType() {
		return alarmDao.loadAll(AlarmType.class);
	}

	public Object getAllAlarmColor() {
		return alarmDao.loadAll(AlarmColor.class);
	}

	@Scheduled(fixedRate = 20000)
	public void checkAlarms() {
		// 1.Get All Points
		// 2.loop points, for Every Point
		// 3.Get Point Related Thresholds
		// 4.Loop thresholds, and check violates
		// 5.Get Releated Record,
		// 6.Save or Update Record
		// 1.
		List<MonitoringPoint> points = alarmDao.loadAll(MonitoringPoint.class);
		List<Threshold> thresholds = alarmDao.loadNotDeletedThresholds();
		// 2.
		for (MonitoringPoint mp : points) {
			Object pointData = getLatestPointData(mp);
			//TODO why null point
			if(pointData==null){
				continue;
			}
			// for Every Attribute
			Map<String, List<Threshold>> map = classifyPointsThresholds(mp,
					thresholds);
			for (String attr : map.keySet()) {
				TimeValue tv = transferToTimedValue(attr, pointData);
				List<Threshold> classifiedThresholds = map.get(attr);
				Threshold effectThs = effectiveThreshold(tv,
						classifiedThresholds);
				AlarmRecord aRecord = retriveNotClosedAlarmOfPoint(effectThs,
						tv);
				if (aRecord == null) {
					aRecord = newRecord(tv, effectThs);
				} else {
					aRecord.setEventTime(new Date());
					aRecord.setTimes(aRecord.getTimes() + 1);
				}
				alarmDao.saveOrUpdate(aRecord);
				// save record

			}
		}
	}

	private AlarmRecord newRecord(TimeValue tv, Threshold effectThs) {
		AlarmRecord aRecord;
		aRecord = new AlarmRecord();
		aRecord.setThreshold(effectThs);
		// aRecord.setAlarmType(effectThs.getAlarmType());
		// aRecord.setAttr(effectThs.getAttr());
		aRecord.setClosed(false);
		aRecord.setCollectTime((Date) tv.getDateTime());
		aRecord.setEventTime(new Date());
		// aRecord.setOp(effectThs.getOp());
		// aRecord.setPoint(mp);
		aRecord.setSended(false);
		aRecord.setTimes(1);
		aRecord.setWarningValue(tv.getValue() + "");
		aRecord.setWarningContent(effectThs.getPoint().getMonitoringName()
				+ "-" + effectThs.getAttr().getName() + ":"
				+ effectThs.getOp().getDisplayName() + " "
				+ effectThs.getValue());
		return aRecord;
	}

	private AlarmRecord retriveNotClosedAlarmOfPoint(Threshold effectThs,
			TimeValue tv) {
		Criteria criteria = alarmDao.getSession().createCriteria(
				AlarmRecord.class);
		List<Criterion> criterions = new ArrayList<Criterion>();
		criterions.add(Restrictions.eq("warningValue", tv.getValue() + ""));
		criterions.add(Restrictions.eq("closed", false));
		for (Criterion c : criterions) {
			criteria.add(c);
		}
		criteria.createAlias("threshold", "t", JoinType.LEFT_OUTER_JOIN);
		criteria.add(Restrictions.eq("t.id", effectThs.getId()));
		return (AlarmRecord) criteria.uniqueResult();
	}

	// Check all
	private Threshold effectiveThreshold(TimeValue tv, List<Threshold> l) {
		AlarmType alarmType = null;
		Threshold ths = null;
		for (Threshold th : l) {
			if (violateThreshold(tv, th)) {
				AlarmType curAlarmType = th.getAlarmType();
				if (alarmType == null
						|| curAlarmType.getSeverity() > alarmType.getSeverity()) {
					alarmType = curAlarmType;
					ths = th;
				}
			}
		}

		return ths;
	}

	private boolean violateThreshold(TimeValue tv, Threshold th) {
		double value = th.getValue();
		ThresholdOperation op = th.getOp();
		return op.checkViolate(tv.getValue(), value);
	}

	private TimeValue transferToTimedValue(String attr, Object pointData) {
		TimeValue tv = new TimeValue();
		try {
			Field f = pointData.getClass().getDeclaredField(attr);
			f.setAccessible(true);
			Object monValue = f.get(pointData);
			Field f2 = pointData.getClass().getDeclaredField("dateTime");
			f2.setAccessible(true);
			Object monTime = f2.get(pointData);
			tv.setDateTime((Date) monTime);
			tv.setValue(Double.parseDouble(monValue.toString()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tv;
	}

	private Object getLatestPointData(MonitoringPoint mp) {
		String clsName = mp.getType().getDomainClsName();

		Object latestPointData = null;
		// if about BMWY, use template to retrive data
		if (mp.getType().getCode().equals(Constants.JCD_BMWY)) {
			// BMWY use template
			latestPointData = latestBMWYPointData(clsName, mp);
		} else {
			latestPointData = latestDataOfCommonPoint(clsName, mp);
		}

		return latestPointData;
	}

	// 按照监测属性分类监测点的阈值
	private Map<String, List<Threshold>> classifyPointsThresholds(
			MonitoringPoint mp, List<Threshold> thresholds) {
		List<Threshold> ths = getThresholdsOfPoint(mp, thresholds);
		Map<String, List<Threshold>> map = new HashMap<String, List<Threshold>>();
		for (Threshold th : ths) {
			String attr = th.getAttr().getAttr();
			List<Threshold> thslist = map.get(attr);
			if (thslist == null) {
				thslist = new ArrayList();
				map.put(attr, thslist);
			}
			thslist.add(th);
		}
		return map;

	}

	private List<Threshold> getThresholdsOfPoint(MonitoringPoint mp,
			List<Threshold> thresholds) {
		List<Threshold> list = new ArrayList<Threshold>();
		for (Threshold th : thresholds) {
			if (th.getPoint().equals(mp)) {
				list.add(th);
			}
		}
		return list;
	}

	private Object latestBMWYPointData(final String clsName,
			final MonitoringPoint point) {
		Object obj = template.execute(new TransactionCallback() {
			public Object doInTransaction(TransactionStatus status) {
				Criteria criteria;
				try {
					criteria = dao.getSession().createCriteria(
							Class.forName(clsName));
					CriteriaImpl impl = (CriteriaImpl) criteria;
					Projection projection = impl.getProjection();
					ProjectionList pList = Projections.projectionList();

					pList.add(Projections.max("dateTime"));
					criteria.add(Restrictions.eq("monitoringPosition",
							point.getPosition()));
					criteria.setProjection(pList);
					criteria.setFetchSize(1);
					Object obj = criteria.uniqueResult();
					criteria.setProjection(projection);
					criteria.add(Restrictions.eq("dateTime", obj));
					criteria.add(Restrictions.eq("monitoringPosition",
							point.getPosition()));
					return criteria.uniqueResult();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				return null;
			}
		});

		return obj;
	}

	private Object latestDataOfCommonPoint(String clsName,
			final MonitoringPoint point) {
		Criteria criteria;
		try {
			criteria = alarmDao.getSession().createCriteria(
					Class.forName(clsName));
			CriteriaImpl impl = (CriteriaImpl) criteria;
			Projection projection = impl.getProjection();
			ProjectionList pList = Projections.projectionList();

			pList.add(Projections.max("dateTime"));
			criteria.add(Restrictions.eq("monitoringPosition",
					point.getPosition()));
			criteria.setProjection(pList);
			criteria.setFetchSize(1);
			Object obj = criteria.uniqueResult();
			criteria.setProjection(projection);
			criteria.add(Restrictions.eq("dateTime", obj));
			criteria.add(Restrictions.eq("monitoringPosition",
					point.getPosition()));
			return criteria.uniqueResult();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;

	}

	public Object getPagedAlarmRecords(TableParam param) {
		PagedQuery pq = new PagedQuery(AlarmRecord.class, param.getPage(), param.getRows());
		List<Order> orders=new ArrayList<Order>();
		orders.add(Order.desc("collectTime"));
		return alarmDao.getPagedList(pq, orders);
	}
}
