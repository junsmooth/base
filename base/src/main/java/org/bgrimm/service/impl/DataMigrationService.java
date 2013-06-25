/**
 * 数据同步后台服务进程<p>
 * 用于把采集到的值包括表面位移的值按一小时统计一次的频率存入到新表中
 */
package org.bgrimm.service.impl;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.bgrimm.T4DDBDao;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringTypeAttribute;
import org.bgrimm.domain.bgrimm.monitor.datamigration.TBMWY;
import org.bgrimm.domain.t4ddb.BMWY;
import org.bgrimm.utils.Constants;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
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
public class DataMigrationService {
	@Autowired
	private CommonDao commonDao;
	@Autowired
	private TransactionTemplate template;

	@Autowired
	private T4DDBDao dao;

	@Scheduled(fixedRate = 60 * 60 * 1000 * 24)
	public void dataMigration() {
		// Current Time->00:00:00
		DateTime end = new DateTime().toDateMidnight().toDateTime();
		List<MonitoringPoint> points = commonDao.loadAll(MonitoringPoint.class);
		for (MonitoringPoint mp : points) {
			if (mp.getType().getCode().equals(Constants.JCD_SP)) {
				continue;
			}
			DateTime startDate = startTimeOfThisMigration(mp);
			if (startDate == null) {
				continue;// No old data, nothing need to do
			}
			// For Performance consideration,Migrate data by oneday period
			for (; startDate.getMillis() < end.getMillis();) {
				DateTime endDate = startDate.plusDays(1).toDateMidnight()
						.toDateTime();
				migrationData(startDate, endDate, mp);
				startDate = endDate;// 0:0:0
			}

		}
	}

	private void migrationData(DateTime startDate, DateTime endDate,
			MonitoringPoint mp) {

		if (mp.getType().getCode().equals(Constants.JCD_BMWY)) {
			migrationBMWYData(startDate, endDate, mp);
		} else {
			migragionCommonData(startDate, endDate, mp);
		}

	}

	private void migragionCommonData(DateTime startDate, DateTime endDate,
			MonitoringPoint mp) {
		List<Object> commonDatas = retriveCommonData(startDate, endDate, mp);
		List<MonitoringTypeAttribute> attList = retriveMonitoringTypeAttributes(mp);
		Map<Date, Object> map = new TreeMap<Date, Object>();
		String clsName = mp.getType().getDomainClsName();
		clsName = StringUtils.substringAfterLast(clsName, ".");
		clsName = Constants.MIGRATION_PACKAGE + ".T" + clsName;
		try {
			for (Object oldObj : commonDatas) {
				Field f = oldObj.getClass().getDeclaredField("dateTime");
				f.setAccessible(true);
				Date dateTime = (Date) f.get(oldObj);
				DateTime mid12 = new DateTime(dateTime).minuteOfHour()
						.setCopy(30).secondOfMinute().setCopy(0)
						.millisOfSecond().setCopy(0);
				Object newObj = map.get(mid12.toDate());
				if (newObj == null) {
					Class newClass = Class.forName(clsName);
					newObj = newClass.newInstance();
					Field f2 = newObj.getClass().getDeclaredField(
							"monitoringPosition");
					f2.setAccessible(true);
					f2.set(newObj, new Integer(mp.getPosition()));
					Field f1 = newObj.getClass().getDeclaredField("dateTime");
					f1.setAccessible(true);
					f1.set(newObj, mid12.toDate());
					map.put(mid12.toDate(), newObj);
				}
				for (MonitoringTypeAttribute att : attList) {
					Field fa = oldObj.getClass()
							.getDeclaredField(att.getAttr());
					fa.setAccessible(true);
					BigDecimal oldValue = (BigDecimal) fa.get(oldObj);
					Field fb = newObj.getClass()
							.getDeclaredField(att.getAttr());
					fb.setAccessible(true);
					BigDecimal newValue = (BigDecimal) fb.get(newObj);
					// 降雨量采取累加的策略
					if (mp.getType().getCode().equals(Constants.JCD_RAINFALL)) {
						fb.set(newObj,
								newValue != null ? newValue.add(oldValue)
										: oldValue);
					} else {
						// 其他监测点取平均值
						fb.set(newObj, newValue != null ? newValue
								.add(oldValue).divide(new BigDecimal(2))
								: oldValue);
					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (Date date : map.keySet()) {
			Object tbmwy = map.get(date);
			commonDao.saveOrUpdate(tbmwy);
		}

	}

	private List<MonitoringTypeAttribute> retriveMonitoringTypeAttributes(
			MonitoringPoint mp) {
		Criterion c = Restrictions.eq("type.id", mp.getType().getId());
		return commonDao.findByCriterions(MonitoringTypeAttribute.class, c);
	}

	private List<Object> retriveCommonData(DateTime startDate,
			DateTime endDate, MonitoringPoint mp) {

		Criteria criteria;
		try {
			criteria = commonDao.getSession().createCriteria(
					Class.forName(mp.getType().getDomainClsName()));
			criteria.add(Restrictions.ge("dateTime", startDate.toDate()));
			criteria.add(Restrictions.lt("dateTime", endDate.toDate()));
			criteria.add(Restrictions.eq("monitoringPosition", mp.getPosition()));
			return criteria.list();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;

	}

	private void migrationBMWYData(DateTime startDate, DateTime endDate,
			MonitoringPoint mp) {
		List<BMWY> bmwyDatas = retriveBMWYData(startDate, endDate, mp);
		Map<Date, TBMWY> map = new TreeMap<Date, TBMWY>();
		for (BMWY bmwy : bmwyDatas) {
			DateTime mid12 = new DateTime(bmwy.getDateTime()).minuteOfHour()
					.setCopy(30).secondOfMinute().setCopy(0).millisOfSecond()
					.setCopy(0);
			TBMWY tbmwy = map.get(mid12.toDate());
			if (tbmwy == null) {
				tbmwy = new TBMWY();
				tbmwy.setDateTime(mid12.toDate());
				tbmwy.setMonitoringPosition(mp.getPosition());
				map.put(mid12.toDate(), tbmwy);
			}
			tbmwy.setdE((tbmwy.getdE() + bmwy.getdE()) / 2);
			tbmwy.setdN((tbmwy.getdN() + bmwy.getdN()) / 2);
			tbmwy.setdH((tbmwy.getdH() + bmwy.getdH()) / 2);

		}
		for (Date date : map.keySet()) {
			TBMWY tbmwy = map.get(date);
			commonDao.saveOrUpdate(tbmwy);
		}

	}

	private List<BMWY> retriveBMWYData(final DateTime startDate,
			final DateTime endDate, final MonitoringPoint mp) {
		// BMWY data, hour minus 8
		final DateTime begin = startDate.minusHours(8);
		final DateTime end = endDate.minusHours(8);
		List<BMWY> obj = template.execute(new TransactionCallback() {
			public Object doInTransaction(TransactionStatus status) {
				Criteria criteria = dao.getSession().createCriteria(BMWY.class);
				criteria.add(Restrictions.ge("dateTime", begin.toDate()));
				criteria.add(Restrictions.lt("dateTime", end.toDate()));
				criteria.add(Restrictions.eq("monitoringPosition",
						mp.getPosition()));
				return criteria.list();
			}
		});
		return obj;
	}

	private DateTime startTimeOfThisMigration(MonitoringPoint mp) {
		Date migratedDate = migratedTimeOfThisPoint(mp);
		if (migratedDate == null) {
			return firstTimeOfThisPoint(mp);
		}
		return new DateTime(migratedDate).plusDays(1).toDateMidnight()
				.toDateTime();
	}

	private DateTime firstTimeOfThisPoint(MonitoringPoint mp) {
		String clsName = mp.getType().getDomainClsName();
		DateTime date = null;
		if (mp.getType().getCode().equals(Constants.JCD_BMWY)) {
			// BMWY use template
			date = firstTimeOfThisBMWYPoint(clsName, mp);
		} else {
			date = firstTimeOfThisCommonPoint(clsName, mp);
		}
		return date;
	}

	private DateTime firstTimeOfThisCommonPoint(String clsName,
			MonitoringPoint mp) {
		Criteria criteria;
		try {
			criteria = commonDao.getSession().createCriteria(
					Class.forName(clsName));

			ProjectionList pList = Projections.projectionList();
			pList.add(Projections.min("dateTime"));
			criteria.add(Restrictions.eq("monitoringPosition", mp.getPosition()));
			criteria.setProjection(pList);
			criteria.setFetchSize(1);
			criteria.setReadOnly(true);
			Object obj = criteria.uniqueResult();
			return new DateTime(obj);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;

	}

	private DateTime firstTimeOfThisBMWYPoint(final String clsName,
			final MonitoringPoint mp) {
		Date obj = template.execute(new TransactionCallback() {
			public Date doInTransaction(TransactionStatus status) {
				Criteria criteria;
				try {
					criteria = dao.getSession().createCriteria(
							Class.forName(clsName));
					ProjectionList pList = Projections.projectionList();
					pList.add(Projections.min("dateTime"));
					criteria.add(Restrictions.eq("monitoringPosition",
							mp.getPosition()));
					criteria.setProjection(pList);
					criteria.setFetchSize(1);
					Object obj = criteria.uniqueResult();
					return (Date) obj;
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				return null;
			}
		});

		return new DateTime(obj);
	}

	private Date migratedTimeOfThisPoint(MonitoringPoint mp) {
		String clsName = mp.getType().getDomainClsName();
		clsName = StringUtils.substringAfterLast(clsName, ".");
		clsName = Constants.MIGRATION_PACKAGE + ".T" + clsName;
		Criteria criteria;
		try {
			criteria = commonDao.getSession().createCriteria(
					Class.forName(clsName));

			ProjectionList pList = Projections.projectionList();
			pList.add(Projections.max("dateTime"));
			criteria.add(Restrictions.eq("monitoringPosition", mp.getPosition()));
			criteria.setProjection(pList);
			criteria.setFetchSize(1);
			return (Date) criteria.uniqueResult();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;

	}

}
