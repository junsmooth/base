package org.bgrimm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.bgrimm.monitor.provided.SLL;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.utils.Constants;
import org.bgrimm.utils.DataUtils;
import org.bgrimm.utils.DateUtils;
import org.bgrimm.utils.PagerUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service("SLLService")
@Transactional
public class SLLService{

	@Autowired
	private CommonDao commonDao;
	/**
	 * 获取所有测点
	 */
	public Object getAllPoints() {
		
		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_SLL);
		final List<MonitoringPoint> sllPoint = commonDao.findByCriterions(
				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		return sllPoint;

	}

	/**
	 * 获取测点数据
	 */
	public Object getSLLList(TableParam param) {

		List<Order> list=new ArrayList();
		MonitoringType t=commonDao.findUniqueBy(MonitoringType.class, "code", Constants.JCD_SLL);
		List<MonitoringPoint> seepagePointList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		PagedQuery pq = new PagedQuery(SLL.class, param.getPage(), param.getRows());
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
			for (MonitoringPoint p : seepagePointList) {
				positions.add(p.getPosition());
			}
			criteria.add(Restrictions.in("monitoringPosition", positions.toArray()));
		}
		Order or=Order.desc("dateTime");
		list.add(or);
		PageList<SLL> pl= commonDao.getPagedList(pq,list);
		//将DryBeachLength与MonitoringPoint关联起来，主要是为了在页面根据测点获取对应名称
		for (SLL sll : pl.getRows()) {
			for (MonitoringPoint point : seepagePointList) {
				if (sll.getMonitoringPosition()== point.getPosition()) {
					sll.setPoint(point);
				}
			}
		}
		return pl;
	}

	

	/**
	 * 获取渗流量的时间和的值List
	 * @param param
	 * @return
	 */
	@Transactional(isolation=Isolation.DEFAULT,readOnly=false)
	public Object getSLLChartData(TableParam param) {
		List<Order> list=new ArrayList();
		MonitoringType t=commonDao.findUniqueBy(MonitoringType.class, "code", Constants.JCD_SLL);
		List<MonitoringPoint> sllPointList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		Criteria criteria=commonDao.getSession().createCriteria(SLL.class);
		ProjectionList pList=Projections.projectionList();
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
			for (MonitoringPoint p : sllPointList) {
				positions.add(p.getPosition());
			}
			criteria.add(Restrictions.in("monitoringPosition", positions.toArray()));
		}

		criteria.addOrder(Order.asc("dateTime"));
		List li= criteria.list();
		//List showList= DataUtils.convert2JSonList(li);
		
		if(li.size()>100000){
			List nameList=new ArrayList();
			nameList.add("value");
			return DataUtils.packingData(nameList, li);
		}else{
			//packingDataServiceImpl.packingDataOfHour();
			return toPageJSonList(li);
		}
//		return li;
	}

	private List toPageJSonList(List li) {

		List listData=new ArrayList();
		for(Object obj:li){
			SLL sll=(SLL)obj;
			List list=new ArrayList();
			list.add(sll.getDateTime());
			list.add(sll.getValue());
			listData.add(list);
		}
		return listData;
	}


}