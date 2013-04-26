package org.bgrimm.domain.system;

import java.util.List;
import java.util.Map;

public class AuthData {
	private List<Map<String,String>> data;
	public List<Map<String, String>> getData() {
		return data;
	}

	public void setData(List<Map<String, String>> data) {
		this.data = data;
	}

	private Long roleid;
	public Long getRoleid() {
		return roleid;
	}

	public void setRoleid(Long roleid) {
		this.roleid = roleid;
	}


}
