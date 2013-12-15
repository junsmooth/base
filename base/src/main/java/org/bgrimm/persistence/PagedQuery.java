package org.bgrimm.persistence;

import org.hibernate.criterion.DetachedCriteria;

public class PagedQuery {
	private DetachedCriteria detachedCriteria;
	//parameters:
	//page:1...;rows:10\20\30...
	private int pageSize;
	private int currentPage;
	public DetachedCriteria getDetachedCriteria() {
		return detachedCriteria;
	}
	public void setDetachedCriteria(DetachedCriteria detachedCriteria) {
		this.detachedCriteria = detachedCriteria;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public PagedQuery(Class entityCls,int page,int rows) {
		this.detachedCriteria = DetachedCriteria.forClass(entityCls);
		this.currentPage=page;
		this.pageSize=rows;
	}
}
