package org.bgrimm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bgrimm.dao.core.impl.CommonDao;
import org.bgrimm.domain.bgrimm.Seepage;
import org.bgrimm.domain.bgrimm.TableParam;
import org.bgrimm.domain.bgrimm.extend.FreeBoard;
import org.bgrimm.domain.bgrimm.extend.MonitoringPoint;
import org.bgrimm.domain.bgrimm.extend.MonitoringType;
import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.service.ISeepageService;
import org.bgrimm.utils.Constants;
import org.bgrimm.utils.DateUtils;
import org.bgrimm.utils.PagerUtil;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("seepageServiceImpl")
@Transactional
public class SeepageServiceImpl implements ISeepageService {

	@Autowired
	private CommonDao commonDao;
	/**
	 * 获取所有测点
	 */
	public Object getAllPoints() {
		
		MonitoringType t = commonDao.findUniqueBy(MonitoringType.class, "code",
				Constants.JCD_SEEPAGE);
		final List<MonitoringPoint> damCrestPoint = commonDao.findByCriterions(
				MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		return damCrestPoint;

	}

	/**
	 * 获取测点数据
	 */
	public Object getSeepagePageList(TableParam param) {

		List<Order> list=new ArrayList();
		MonitoringType t=commonDao.findUniqueBy(MonitoringType.class, "code", Constants.JCD_SEEPAGE);
		List<MonitoringPoint> seepagePointList=commonDao.findByCriterions(MonitoringPoint.class, Restrictions.eq("type.id", t.getId()));
		PagedQuery pq = new PagedQuery(Seepage.class, param.getPage(), param.getRows());
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
		PageList<Seepage> pl= commonDao.getPagedList(pq,list);
		//将DryBeachLength与MonitoringPoint关联起来，主要是为了在页面根据测点获取对应名称
		for (Seepage seepage : pl.getRows()) {
			for (MonitoringPoint point : seepagePointList) {
				if (seepage.getMonitoringPosition()== point.getPosition()) {
					seepage.setPoint(point);
				}
			}
		}
		return pl;
	}


}
