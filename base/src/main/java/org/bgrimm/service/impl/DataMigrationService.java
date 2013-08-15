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
import org.bgrimm.domain.bgrimm.monitor.extended.BMWY;
import org.bgrimm.domain.t4ddb.RawBMWY;
import org.bgrimm.utils.Constants;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.joda.time.DateTime;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
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

	public List<MonitoringPoint> loadMonitoringPoints() {
		List<MonitoringPoint> points = commonDao.loadAll(MonitoringPoint.class);
		return points;
	}

	public DateTime endTimeOfThisMigration(MonitoringPoint mp) {
		DateTime dt = endTimeOfThisPoint(mp);
		// 返回本小时0分0秒的时间
		return new DateTime(dt.getYear(), dt.getMonthOfYear(),
				dt.getDayOfMonth(), dt.getHourOfDay(), 0, 0, 0);
	}

	public DateTime startTimeOfThisMigration(MonitoringPoint mp) {
		Date migratedDate = migratedTimeOfThisPoint(mp);
		if (migratedDate == null) {
			return firstTimeOfThisPoint(mp);
		}
		// 如果存在迁移数据，则本时间段内的数据已迁移完毕，从下一小时数据开始计算
		DateTime nextHour = new DateTime(migratedDate).plusHours(1);
		return new DateTime(nextHour.getYear(), nextHour.getMonthOfYear(),
				nextHour.getDayOfMonth(), nextHour.getHourOfDay(), 0, 0, 0);
		// return new DateTime(migratedDate).plusDays(1).toDateMidnight()
		// .toDateTime();
	}
//返回假时间(8小时之前的时间)
	public DateTime startTimeOfBMWYMigration(MonitoringPoint mp) {
		Date migratedDate = migratedTimeOfRawBMWY(mp);
		if (migratedDate != null) {
			return new DateTime(migratedDate).minusHours(8);
		}
		return firstTimeOfThisBMWY(mp);

	}

	private DateTime firstTimeOfThisBMWY(final MonitoringPoint mp) {

		Date obj = template.execute(new TransactionCallback<Date>() {
			public Date doInTransaction(TransactionStatus status) {
				Criteria criteria;
				criteria = dao.getSession().createCriteria(RawBMWY.class);
				ProjectionList pList = Projections.projectionList();
				pList.add(Projections.min("dateTime"));
				criteria.add(Restrictions.eq("monitoringPosition",
						mp.getPosition()));
				criteria.setProjection(pList);
				criteria.setFetchSize(1);
				Object obj = criteria.uniqueResult();
				return (Date) obj;
			}
		});
		return new DateTime(obj);
	}

	private Date migratedTimeOfRawBMWY(MonitoringPoint mp) {

		Criteria criteria = commonDao.getSession().createCriteria(BMWY.class);

		ProjectionList pList = Projections.projectionList();
		pList.add(Projections.max("dateTime"));
		criteria.add(Restrictions.eq("monitoringPosition", mp.getPosition()));
		criteria.setProjection(pList);
		criteria.setFetchSize(1);
		return (Date) criteria.uniqueResult();

	}

	private DateTime endTimeOfThisPoint(MonitoringPoint mp) {
		String clsName = mp.getType().getDomainClsName();
		DateTime date = null;

		// if (mp.getType().getCode().equals(Constants.JCD_BMWY)) {
		//
		// date = lastTimeOfThisBMWYPoint(clsName, mp);
		// } else {
		// date = lastTimeOfThisCommonPoint(clsName, mp);
		// }

		date = lastTimeOfThisCommonPoint(clsName, mp);
		return new DateTime(date);
	}

	private DateTime firstTimeOfThisPoint(MonitoringPoint mp) {
		String clsName = mp.getType().getDomainClsName();
		DateTime date = null;
		// if (mp.getType().getCode().equals(Constants.JCD_BMWY)) {
		// // BMWY use template
		// date = firstTimeOfThisBMWYPoint(clsName, mp);
		// } else {
		// date = firstTimeOfThisCommonPoint(clsName, mp);
		// }
		date = firstTimeOfThisCommonPoint(clsName, mp);
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
		Date obj = template.execute(new TransactionCallback<Date>() {
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

	private List<RawBMWY> retriveBMWYData(final DateTime startDate,
			final DateTime endDate, final MonitoringPoint mp) {
		// BMWY data, hour minus 8
		// final DateTime begin = startDate.minusHours(8);
		// final DateTime end = endDate.minusHours(8);
		final DateTime begin = startDate;
		final DateTime end = endDate;
		List<RawBMWY> obj = template
				.execute(new TransactionCallback<List<RawBMWY>>() {
					public List<RawBMWY> doInTransaction(
							TransactionStatus status) {
						Criteria criteria = dao.getSession().createCriteria(
								RawBMWY.class);
						criteria.add(Restrictions.gt("dateTime", begin.toDate()));
						criteria.add(Restrictions.le("dateTime", end.toDate()));
						criteria.add(Restrictions.eq("monitoringPosition",
								mp.getPosition()));
						criteria.addOrder(Order.asc("dateTime"));
						return criteria.list();
					}
				});
		return obj;
	}

	private void migrationBMWYData(DateTime startDate, DateTime endDate,
			MonitoringPoint mp) {
		List<RawBMWY> bmwyDatas = retriveBMWYData(startDate, endDate, mp);
		Map<Date, TBMWY> map = new TreeMap<Date, TBMWY>();
		for (RawBMWY bmwy : bmwyDatas) {
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
			criteria.add(Restrictions.gt("dateTime", startDate.toDate()));
			criteria.add(Restrictions.le("dateTime", endDate.toDate()));
			criteria.add(Restrictions.eq("monitoringPosition", mp.getPosition()));
			return criteria.list();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;

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
					Object obj = fa.get(oldObj);
					BigDecimal oldValue = null;
					if (!(obj instanceof BigDecimal)) {
						double oldDouble = (Double) fa.get(oldObj);
						oldValue = new BigDecimal(oldDouble + "");
					} else {
						oldValue = (BigDecimal) fa.get(oldObj);
					}
					Field fb = newObj.getClass()
							.getDeclaredField(att.getAttr());
					fb.setAccessible(true);

					BigDecimal newValue = null;

					if (!(obj instanceof BigDecimal)) {
						double newDouble = (Double) fb.get(newObj);
						newValue = new BigDecimal(newDouble + "");
					} else {
						newValue = (BigDecimal) fb.get(newObj);
					}
					// 降雨量采取累加的策略
					if (mp.getType().getCode().equals(Constants.JCD_JYL)) {
						System.out.println("----rainfall");
						fb.set(newObj,
								newValue != null ? newValue.add(oldValue)
										: oldValue);
					} else if (mp.getType().getCode()
							.equals(Constants.JCD_BMWY)) {
						fb.set(newObj, newValue != null ? newValue
								.add(oldValue).divide(new BigDecimal(2))
								.doubleValue() : oldValue.doubleValue());

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

	private DateTime lastTimeOfThisBMWYPoint(final String clsName,
			final MonitoringPoint mp) {

		Date obj = template.execute(new TransactionCallback<Date>() {
			public Date doInTransaction(TransactionStatus status) {
				Criteria criteria;
				try {
					criteria = dao.getSession().createCriteria(
							Class.forName(clsName));
					ProjectionList pList = Projections.projectionList();
					pList.add(Projections.max("dateTime"));
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

	private DateTime lastTimeOfThisCommonPoint(String clsName,
			MonitoringPoint mp) {
		Criteria criteria;
		try {
			criteria = commonDao.getSession().createCriteria(
					Class.forName(clsName));

			ProjectionList pList = Projections.projectionList();
			pList.add(Projections.max("dateTime"));
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

	public void migrationData(DateTime startDate, DateTime endDate,
			MonitoringPoint mp) {

		// if (mp.getType().getCode().equals(Constants.JCD_BMWY)) {
		// migrationBMWYData(startDate, endDate, mp);
		// } else {
		// migragionCommonData(startDate, endDate, mp);
		// }
		migragionCommonData(startDate, endDate, mp);
	}

	public DateTime endTimeOfBMWYMigration(final MonitoringPoint mp) {

		Date obj = template.execute(new TransactionCallback<Date>() {
			public Date doInTransaction(TransactionStatus status) {
				Criteria criteria;
				criteria = dao.getSession().createCriteria(RawBMWY.class);
				ProjectionList pList = Projections.projectionList();
				pList.add(Projections.max("dateTime"));
				criteria.add(Restrictions.eq("monitoringPosition",
						mp.getPosition()));
				criteria.setProjection(pList);
				criteria.setFetchSize(1);
				Object obj = criteria.uniqueResult();
				return (Date) obj;
			}
		});
		return new DateTime(obj);

	}

	public void migrateBMWYData(DateTime startDateTime, DateTime endDate,
			MonitoringPoint mp) {
		List<RawBMWY> rawDatas = retriveBMWYData(startDateTime, endDate, mp);
		RawBMWY lastBMWY = null;
		for (RawBMWY rawBMWY : rawDatas) {
			if (lastBMWY == null) {
				lastBMWY = getLastBMWYData(mp, rawBMWY.getDateTime());
			}
			BMWY bmwy = new BMWY();
			BeanUtils.copyProperties(rawBMWY, bmwy);
			//真实时间需要加8小时
			bmwy.setDateTime(new DateTime(bmwy.getDateTime()).plusHours(8).toDate());
			if (lastBMWY != null) {
				bmwy.setdDE(rawBMWY.getdE() - lastBMWY.getdE());
				bmwy.setdDH(rawBMWY.getdH() - lastBMWY.getdH());
				bmwy.setdDN(rawBMWY.getdN() - lastBMWY.getdN());
			}
			commonDao.saveOrUpdate(bmwy);
		}
	}

	// 获取上次采集值
	private RawBMWY getLastBMWYData(final MonitoringPoint mp,
			final Date dateTime) {

		RawBMWY obj = template.execute(new TransactionCallback<RawBMWY>() {
			public RawBMWY doInTransaction(TransactionStatus status) {
				Criteria criteria;
				criteria = dao.getSession().createCriteria(RawBMWY.class);
				// ProjectionList pList = Projections.projectionList();
				// pList.add(Projections.max("dateTime"));
				criteria.add(Restrictions.eq("monitoringPosition",
						mp.getPosition()));
				criteria.add(Restrictions.lt("dateTime", dateTime));
				criteria.addOrder(Order.desc("dateTime"));
				// criteria.setProjection(pList);
				List obj = criteria.list();
				if (obj.size() > 0) {
					return (RawBMWY) obj.get(0);
				} else {
					return null;
				}
				// Object obj = criteria.uniqueResult();
			}
		});
		return obj;

	}

}
