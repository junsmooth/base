package org.bgrimm.service.impl;

import java.util.Date;
import java.util.List;

import org.bgrimm.dao.bgrimm.T4DDBDao;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.utils.Constants;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.internal.CriteriaImpl;
import org.joda.time.DateTime;
import org.joda.time.Period;
import org.joda.time.PeriodType;
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

	@Scheduled(fixedRate = 10000)
	public void dataMigration() {
		// 1Get Current Time
		Date currentDate = new Date();
		List<MonitoringPoint> points = commonDao.loadAll(MonitoringPoint.class);
		for (MonitoringPoint mp : points) {
			// if mp is BMWY or SP, do other logic
			// mp.getType().getCode().equals(Constants.JCD_BMWY)
			// else
			// Get Data Size of this point, before current Date
			// for every day data, calculate data(Rain is different)
			// transfer to new Module,and save it
			if (mp.getType().getCode().equals(Constants.JCD_SP)) {
				continue;
			}
			Date startDate = startTimeOfThisMigration(mp);
			if (startDate == null) {
				// No old data, nothing need to do
				continue;
			}
			DateTime start = new DateTime(startDate);
			DateTime end = new DateTime(currentDate);
			Period p = new Period(start,end,PeriodType.days());
			int days=p.getDays();
			
			
		}
	}

	private Date startTimeOfThisMigration(MonitoringPoint mp) {

		Date migratedDate = migratedTimeOfThisPoint(mp);
		if (migratedDate == null) {
			migratedDate = firstTimeOfThisPoint(mp);
		}
		return migratedDate;
	}

	private Date firstTimeOfThisPoint(MonitoringPoint mp) {
		String clsName = mp.getType().getDomainClsName();
		Date date = null;
		if (mp.getType().getCode().equals(Constants.JCD_BMWY)) {
			// BMWY use template
			date = firstTimeOfThisBMWYPoint(clsName, mp);
		} else {
			date = firstTimeOfThisCommonPoint(clsName, mp);
		}

		return date;
	}

	private Date firstTimeOfThisCommonPoint(String clsName, MonitoringPoint mp) {
		Criteria criteria;
		try {
			criteria = commonDao.getSession().createCriteria(
					Class.forName(clsName));
			CriteriaImpl impl = (CriteriaImpl) criteria;
			Projection projection = impl.getProjection();
			ProjectionList pList = Projections.projectionList();

			pList.add(Projections.max("dateTime"));
			criteria.add(Restrictions.eq("monitoringPosition", mp.getPosition()));
			criteria.setProjection(pList);
			criteria.setFetchSize(1);
			Date obj = (Date) criteria.uniqueResult();
			return obj;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;

	}

	private Date firstTimeOfThisBMWYPoint(final String clsName,
			final MonitoringPoint mp) {
		Date obj = template.execute(new TransactionCallback() {
			public Date doInTransaction(TransactionStatus status) {
				Criteria criteria;
				try {
					criteria = dao.getSession().createCriteria(
							Class.forName(clsName));
					CriteriaImpl impl = (CriteriaImpl) criteria;
					Projection projection = impl.getProjection();
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

		return obj;
	}

	private Date migratedTimeOfThisPoint(MonitoringPoint mp) {
		return null;
	}
}
