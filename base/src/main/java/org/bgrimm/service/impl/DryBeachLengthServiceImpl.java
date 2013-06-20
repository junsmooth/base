package org.bgrimm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.DryBeachLength;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.extend.MonitoringPoint;
import org.bgrimm.domain.bgrimm.extend.MonitoringType;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.service.IDryBeachLengthService;
import org.bgrimm.utils.Constants;
import org.bgrimm.utils.DateUtils;
import org.bgrimm.utils.PagerUtil;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

@Service(value="dryBeachLengthServiceImpl")
@Transactional
public class DryBeachLengthServiceImpl implements IDryBeachLengthService {

	@Autowired
	private TransactionTemplate template;
	@Autowired
	@Qualifier("commonDao")
	private CommonDao commonDao;
	
	/**
	 * 获取所有测点
	 */
	public Object getAllPoints() {
		
		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_DRYBEACHLENGTH);
		final List<MonitoringPoint> dryBeachPoint = commonDao.findByCriterions(
				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		return dryBeachPoint;

	}

	/**
	 * 获取测点数据
	 */
	public Object getDryBeachPageList(TableParam param) {

		List<Order> list=new ArrayList();
		MonitoringType t=commonDao.findUniqueBy(MonitoringType.class, "code", Constants.JCD_DRYBEACHLENGTH);
		List<MonitoringPoint> dryBeachLPointList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		PagedQuery pq = new PagedQuery(DryBeachLength.class, param.getPage(), param.getRows());
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
			for (MonitoringPoint p : dryBeachLPointList) {
				positions.add(p.getPosition());
			}
			criteria.add(Restrictions.in("monitoring_position", positions.toArray()));
		}
		Order or=Order.desc("date_Time");
		list.add(or);
		PageList<DryBeachLength> pl= commonDao.getPagedList(pq,list);
		//将DryBeachLength与MonitoringPoint关联起来，主要是为了在页面根据测点获取对应名称
		for (DryBeachLength dbl : pl.getRows()) {
			for (MonitoringPoint point : dryBeachLPointList) {
				if (dbl.getMonitoringPosition()== point.getPosition()) {
					dbl.setPoint(point);
				}
			}
		}
		return pl;
	}

	
	

}
