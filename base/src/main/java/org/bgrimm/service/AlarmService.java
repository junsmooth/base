package org.bgrimm.service;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.bgrimm.AlarmDao;
import org.bgrimm.dao.bgrimm.T4DDBDao;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.TimeValue;
import org.bgrimm.domain.bgrimm.common.AlarmColor;
import org.bgrimm.domain.bgrimm.common.AlarmRecord;
import org.bgrimm.domain.bgrimm.common.AlarmType;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringTypeAttribute;
import org.bgrimm.domain.bgrimm.common.Threshold;
import org.bgrimm.domain.bgrimm.common.ThresholdOperation;
import org.bgrimm.domain.bgrimm.monitor.provided.JYL;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.utils.Constants;
import org.bgrimm.utils.DateUtils;
import org.bgrimm.utils.PagerUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.CriteriaImpl;
import org.hibernate.sql.JoinType;
import org.joda.time.DateTime;
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

	@Autowired
	private CommonDao commonDao;

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
			if (mp.getType().getCode().equals(Constants.JCD_SP)) {
				return;
			}
			Object pointData = getLatestPointData(mp);
			// TODO why null point
			if (pointData == null) {
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
				// No threshold takes effect
				if (effectThs == null) {
					continue;
				}
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
		} else if (mp.getType().getCode().equals(Constants.JCD_JYL)) {
			latestPointData = latestHoursJYLData(mp);
		} else {
			latestPointData = latestDataOfCommonPoint(clsName, mp);
		}

		return latestPointData;
	}

	private Object latestHoursJYLData(MonitoringPoint mp) {

		Criteria criteria;
		try {
			criteria = alarmDao.getSession().createCriteria(JYL.class);
			CriteriaImpl impl = (CriteriaImpl) criteria;
			Projection projection = impl.getProjection();
			ProjectionList pList = Projections.projectionList();

			pList.add(Projections.max("dateTime"));
			criteria.add(Restrictions.eq("monitoringPosition", mp.getPosition()));
			criteria.setProjection(pList);
			criteria.setFetchSize(1);
			Object obj = criteria.uniqueResult();
			DateTime dt = new DateTime(obj);
			// 当前时间->0分0秒 最近一小时
			DateTime start = dt.minuteOfHour().setCopy(0).secondOfMinute()
					.setCopy(0).millisOfSecond().setCopy(0);
			criteria.setProjection(projection);
			criteria.add(Restrictions.gt("dateTime", start.toDate()));
			criteria.add(Restrictions.lt("dateTime", dt.toDate()));
			criteria.add(Restrictions.eq("monitoringPosition", mp.getPosition()));
			List<JYL> list = criteria.list();
			JYL sum = new JYL();
			for (JYL jyl : list) {
				sum.getValue().add(jyl.getValue());
			}
			sum.setDateTime(dt.toDate());
			sum.setMonitoringPosition(mp.getPosition());
			sum.setPoint(mp);
			return sum;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

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
			criteria.setFetchSize(1);
			return criteria.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public Object getPagedAlarmRecords(TableParam param) {
		PagedQuery pq = new PagedQuery(AlarmRecord.class, param.getPage(),
				param.getRows());
		DetachedCriteria criteria = pq.getDetachedCriteria();
		criteria.add(Restrictions.eq("closed", false));
		if (StringUtils.isNotEmpty(param.getMin())) {
			Date startDate = DateUtils.strToDate(param.getMin());
			criteria.add(Restrictions.ge("collectTime", startDate));
		}
		if (StringUtils.isNotEmpty(param.getMax())) {
			Date endDate = DateUtils.strToDate(param.getMax());
			criteria.add(Restrictions.le("collectTime", endDate));
		}
		List<Order> orders = new ArrayList<Order>();
		orders.add(Order.desc("collectTime"));
		return alarmDao.getPagedList(pq, orders);
	}

	public Object getShowAlarmRecordList() {
		List<AlarmRecord> alarmList = commonDao.findByCriterions(
				AlarmRecord.class, Restrictions.eq("closed", false));
		return alarmList;
	}

	public Object isValidName(String iconName, String id) {

		if (StringUtils.isNumeric(id)) {
			AlarmColor color = commonDao.findUniqueByProperty(AlarmColor.class,
					"id", Long.parseLong(id));
			if (color.getName().equals(iconName)) {
				return true;
			}
		}
		AlarmColor color = commonDao.findUniqueByProperty(AlarmColor.class,
				"name", iconName);
		if (color == null) {
			return true;
		}
		return false;

	}

	public void saveOrUpdate(Object color) {
		commonDao.saveOrUpdate(color);
	}

	public void remove(Class cls, long id) {
		commonDao.deleteEntityById(cls, id);
	}

	public Object isValidTypeName(String typeName, String id) {

		if (StringUtils.isNumeric(id)) {
			AlarmType color = commonDao.findUniqueByProperty(AlarmType.class,
					"id", Long.parseLong(id));
			if (color.getName().equals(typeName)) {
				return true;
			}
		}
		AlarmType color = commonDao.findUniqueByProperty(AlarmType.class,
				"name", typeName);
		if (color == null) {
			return true;
		}
		return false;

	}

	public Object getUniqueObjectById(Class cls, long id) {
		return commonDao.findUniqueBy(cls, "id", id);
	}

	public Object getAllMonPoints() {
		List<MonitoringPoint> list = commonDao.loadAll(MonitoringPoint.class);
		// remove SP
		List result = new ArrayList();
		for (MonitoringPoint point : list) {
			if (point.getType().getCode().equals(Constants.JCD_SP)) {
				continue;
			}
			result.add(point);
		}
		return result;
	}

	public Object getPointsAttrs(long id) {
		MonitoringPoint p = commonDao.findUniqueBy(MonitoringPoint.class, "id",
				id);
		long typeId = p.getType().getId();
		List<MonitoringTypeAttribute> attrs = commonDao.findByProperty(
				MonitoringTypeAttribute.class, "type.id", typeId);
		return attrs;
	}

	public Object getAllOperations() {
		return commonDao.loadAll(ThresholdOperation.class);
	}

	public void disableThreshold(long id) {
		Threshold t = commonDao.findUniqueBy(Threshold.class, "id", id);
		if (t != null) {
			t.setRemoved(true);
			commonDao.saveOrUpdate(t);
		}
	}

	public void setAlarmStatus(long id) {

		AlarmRecord alarmRecord=commonDao.getEntity(AlarmRecord.class, id);
		if(alarmRecord!=null){
			
			alarmRecord.setClosed(true);
			commonDao.save(alarmRecord);
		}
	}

}
