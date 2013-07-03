package org.bgrimm.service.impl;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.monitor.datamigration.TJYL;
import org.bgrimm.domain.bgrimm.monitor.provided.JYL;
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
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service("JYLService")
@Transactional
public class JYLService{

	@Autowired
	private CommonDao commonDao;
	/**
	 * 获取所有测点
	 */
	public Object getAllPoints() {
		
		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_JYL);
		final List<MonitoringPoint> jylPoint = commonDao.findByCriterions(
				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		return jylPoint;

	}
	
	/**
	 * 获取测点数据
	 */
	public Object getJYLPageList(TableParam param) {

		List<Order> list=new ArrayList();
		MonitoringType t=commonDao.findUniqueBy(MonitoringType.class, "code", Constants.JCD_JYL);
		List<MonitoringPoint> jylPointList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		PagedQuery pq = new PagedQuery(JYL.class, param.getPage(), param.getRows());
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
			for (MonitoringPoint p : jylPointList) {
				positions.add(p.getPosition());
			}
			criteria.add(Restrictions.in("monitoringPosition", positions.toArray()));
		}
		Order or=Order.desc("dateTime");
		list.add(or);
		PageList<JYL> pl= commonDao.getPagedList(pq,list);
		//将DryBeachLength与MonitoringPoint关联起来，主要是为了在页面根据测点获取对应名称
		for (JYL jyl : pl.getRows()) {
			for (MonitoringPoint point : jylPointList) {
				if (jyl.getMonitoringPosition()== point.getPosition()) {
					jyl.setPoint(point);
				}
			}
		}
		return pl;
	}
	


	/**
	 * 获取降雨量的时间和的值List
	 * @param param
	 * @return
	 */
	@Transactional(isolation=Isolation.DEFAULT,readOnly=false)
	public Object getJYLChartList(TableParam param) {
		List<Order> list=new ArrayList();
//		List result=new ArrayList();
		Criteria criteria=commonDao.getSession().createCriteria(JYL.class);
		List li= getJYLChartData(criteria, param);
//		List everydayJYLData=getEverydayJYLData(li);
		if(li.size()>Constants.MAXIMUM_ALLOWED_VALUE){
			Criteria tCriteria=commonDao.getSession().createCriteria(TJYL.class);
			List tList=getJYLChartData(tCriteria,param);
			 return DataUtils.objectList2JSonList(tList, new Object[]{"dateTime","value"});
//			 result.add(listData1);
//			 result.add(everydayJYLData);
//			 return result;
		}else{
			return DataUtils.objectList2JSonList(li, new Object[]{"dateTime","value"});
//			result.add(listData2);
//			result.add(everydayJYLData);
//			return result;
		}
	}

	/**
	 * 获取 每日降雨量时间和值
	 * @param li
	 * @return
	 */
	public List getEverydayJYLData(TableParam param) {
		List<Order> list=new ArrayList();
		List result=new ArrayList();
		Criteria criteria=commonDao.getSession().createCriteria(JYL.class);
		List li= getJYLChartData(criteria, param);
		Date iniDate=new Date();
		double iniValue=0;
		double sumValueOfDay=0;
		Boolean flag=true;
		List everydayDataList=new ArrayList();
		for(Object object:li){
			JYL jyl=(JYL)object;
			Date date=jyl.getDateTime();
			if(flag==true){
				iniDate=date;
				iniValue=jyl.getValue().doubleValue();
				flag=false;
				continue;
			}
			if(isSameDay(iniDate,date)){
				//iniDate=jyl.getDateTime();
				sumValueOfDay+=jyl.getValue().doubleValue();
			}else{
				List l=new ArrayList();
				//l.add(setDate(iniDate));
				l.add(iniDate);
				l.add(new BigDecimal(sumValueOfDay).setScale(2,BigDecimal.ROUND_HALF_UP));
				everydayDataList.add(l);
				sumValueOfDay=jyl.getValue().doubleValue();
				iniDate=jyl.getDateTime();
			}
		}
		return everydayDataList;
	}

	private Object setDate(Date iniDate) {
		try {
			SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat s1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String str= s.format(iniDate)+" 08:00:00";
			return s1.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	private boolean isSameDay(Date iniDate, Date date) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		if(iniDate!=null && date!=null) {        
		     String time1 = sdf.format(iniDate);        
		     String time2 = sdf.format(date);    
		     return time1.equals(time2);
		    }        
		return false;
	}

	//根据条件从表中获取降雨量时间和值
	private List getJYLChartData(Criteria criteria,TableParam param) {

		Integer arr =Integer.parseInt(param.getStr());
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


}
