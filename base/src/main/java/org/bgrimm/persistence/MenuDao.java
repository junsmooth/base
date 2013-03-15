package org.bgrimm.persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.bgrimm.domain.Menu;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MenuDao {
	private String menuQuery = "SELECT m FROM MENU m where m.parent.id = ?1 ";

	@PersistenceContext
	private EntityManager em;

	@Transactional
	public List<Menu> getMenusByParentId(int pid) {
		this.insert();
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery q = cb.createQuery(Menu.class);
		Root r=q.from(Menu.class);
		
		

		Query query = em.createQuery(menuQuery);
		query.setParameter(1, pid);
		List<Menu> menus = query.getResultList();
		return menus;
	}

	public void insert() {
		Menu m = new Menu();
		m.setLeaf(false);
		m.setText("系统管理");
		em.persist(m);
	}

}
