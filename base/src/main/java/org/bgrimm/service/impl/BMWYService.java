package org.bgrimm.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.bgrimm.T4DDBDao;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.monitor.provided.Montypeattr;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.domain.t4ddb.BMWY;
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


	public Object getPagedList(final TableParam param) {
		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_BMWY);
		final List<MonitoringPoint> bmwyPointList = commonDao.findByCriterions(
				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));

		PageList<BMWY> result = template.execute(new TransactionCallback<PageList<BMWY>>() {

			public PageList<BMWY> doInTransaction(TransactionStatus status) {
				PagedQuery pq = new PagedQuery(BMWY.class, param.getPage(),
						param.getRows());
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
					// use all ids
					List<Integer> idList = new ArrayList();
					for (MonitoringPoint p : bmwyPointList) {
						idList.add(p.getPosition());
					}
					criteria.add(Restrictions.in("monitoringPosition", idList.toArray()));
				}

				List<Order> list=new ArrayList();
				Order or=Order.desc("dateTime");	
				return dao.getPagedList(pq,list);
			}
		});
		// Parse Result, Add Point Info to data
		for (BMWY bmwy : result.getRows()) {
			for (MonitoringPoint point : bmwyPointList) {
				int position = point.getPosition();
				if (bmwy.getMonitoringPosition() == position) {
					bmwy.setPoint(point);
				}
			}
		}
		//DataUtils.setDecimalDigits(result.getRows(), Constants.JCD_BMWY);
		setDecimalDigits(result.getRows());
		return result;
	}

	private void setDecimalDigits(List<BMWY> rows) {

		for(BMWY bmwy: rows){
			bmwy.setdE(new BigDecimal(bmwy.getdE()*1000).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue());
			bmwy.setdH(new BigDecimal(bmwy.getdH()*1000).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue());
			bmwy.setdN(new BigDecimal(bmwy.getdN()*1000).setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue());
		}
	}

	/**
	 * Get All BMWY JCDs
	 * 
	 * @return
	 */
	public Object getAllPoints() {
		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_BMWY);
		List<Montypeattr> montypeattr=commonDao.findByCriterions(Montypeattr.class,Restrictions.eq("type.id",t.getId()));
		Map mp=new HashMap();
		if(montypeattr.size()>0){
			mp.put("dId",montypeattr.get(0).getId());
		}
		final List bmwyPointList = commonDao.findByCriterions(
				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
			bmwyPointList.add(mp);
		return bmwyPointList;
	}


	public Object getAllDirections() {

		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_BMWY);
		final List<Montypeattr> bmwyDirectionList = commonDao.findByCriterions(
				Montypeattr.class, Restrictions.eq("type.id", t.getId()));
		return bmwyDirectionList;
	}
	
	
	
	public Object getBMWYChartList(final TableParam param) {

		final Montypeattr montypeattr=commonDao.findUniqueBy(Montypeattr.class, "id",Long.parseLong(param.getDirId()));
		Criteria criteria=commonDao.getSession().createCriteria(BMWY.class);
		
		List<BMWY> bmwyDataList=template.execute(new TransactionCallback<List<BMWY>>() {
			
			public List<BMWY> doInTransaction(TransactionStatus status) {
				Integer arr =Integer.parseInt(param.getStr());
				Criteria criteria=dao.getSession().createCriteria(BMWY.class);
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
				
				return criteria.list();
			}
			
		});

//		 setDecimalDigits(bmwyDataList);
		 return DataUtils.objectList2JSonList(bmwyDataList, new Object[]{"dateTime",montypeattr.getAttr()});
	
	}

}
