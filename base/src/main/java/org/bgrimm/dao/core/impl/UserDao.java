package org.bgrimm.dao.core.impl;

import java.util.ArrayList;
import java.util.List;

import org.bgrimm.domain.system.PageList;
import org.bgrimm.domain.system.PagedQuery;
import org.bgrimm.domain.system.TUser;
import org.bgrimm.utils.PagerUtil;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.internal.CriteriaImpl;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao extends CommonDao {
	/**
	 * get Paged User List.
	 * <p>
	 * Use Projection to distinct result
	 * <p>
	 * List<Object[]> list = criteria.list();
	 * <p>
	 * when use projection,criteria return result is List<Object[]>,need parse by self.
	 */
	public PageList getPagedList(PagedQuery pq) {

		Criteria criteria = pq.getDetachedCriteria().getExecutableCriteria(
				getSession());
		CriteriaImpl impl = (CriteriaImpl) criteria;
		Projection projection = impl.getProjection();
		final int allCounts = ((Long) criteria.setProjection(
				Projections.rowCount()).uniqueResult()).intValue();
		criteria.setProjection(projection);
		ProjectionList proList = Projections.projectionList();
		proList.add(Projections.property("id"));
		proList.add(Projections.property("username"));
		proList.add(Projections.property("realname"));
		proList.add(Projections.property("email"));
		proList.add(Projections.property("telephone"));
		proList.add(Projections.property("address"));
		proList.add(Projections.property("cardno"));
		proList.add(Projections.property("enabled"));
		criteria.setProjection(Projections.distinct(proList));
		int offset = PagerUtil.getOffset(allCounts, pq.getCurrentPage(),
				pq.getPageSize());
		criteria.setFirstResult(offset);
		criteria.setMaxResults(pq.getPageSize());
		List<Object[]> list = criteria.list();
		List<TUser> userList = new ArrayList<TUser>();
		for (Object[] objs : list) {
			TUser user = new TUser();
			user.setId(Long.parseLong(objs[0].toString()));
			user.setUsername(objs[1] != null ? objs[1].toString() : "");
			user.setRealname(objs[2] != null ? objs[2].toString() : "");
			user.setEmail(objs[3] != null ? objs[3].toString() : "");
			user.setTelephone(objs[4] != null ? objs[4].toString() : "");
			user.setAddress(objs[5] != null ? objs[5].toString() : "");
			user.setCardno(objs[6] != null ? objs[6].toString() : "");
			user.setEnabled(objs[7] != null ? Boolean.getBoolean(objs[7]
					.toString()) : false);
			userList.add(user);
		}
		return new PageList(userList, allCounts);
	}
}
