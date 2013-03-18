package org.bgrimm.persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.bgrimm.domain.Menu;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MenuDao {
	// private String menuQuery =
	// "SELECT m FROM MENU m where m.parent.id = ?1 ";

	@PersistenceContext
	private EntityManager em;

	@Transactional
	public List<Menu> getMenusByParentId(int pid) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Menu> cq = cb.createQuery(Menu.class);
		Root<Menu> r = cq.from(Menu.class);
		cq.select(r);
		cq.where(cb.equal(r.get("parent"), null));
		TypedQuery<Menu> tq = em.createQuery(cq);
		List<Menu> result = tq.getResultList();
		return result;
	}

}
