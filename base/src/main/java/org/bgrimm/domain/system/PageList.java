package org.bgrimm.domain.system;

import java.util.List;

public class PageList<T> {

	private List<T> rows;
	private int total;

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public long getTotal() {
		return total;
	}

	public PageList(List rows, int total) {
		this.rows = rows;
		this.total = total;
	}
}
