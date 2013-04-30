package org.bgrimm.domain.system;

import java.util.List;

public class MenuAuthPairs {
	private long menuid;
	private List<Long> auths;
	public long getMenuid() {
		return menuid;
	}
	public void setMenuid(long menuid) {
		this.menuid = menuid;
	}
	public List<Long> getAuths() {
		return auths;
	}
	public void setAuths(List<Long> auths) {
		this.auths = auths;
	}
}
