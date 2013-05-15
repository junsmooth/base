package org.bgrimm.domain.tailings;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name = "t_montype")
public class MonitoringType extends IdEntity {

	// RAIN DRYBEACH ...
	private String name;
	private String code;
	private String table;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	@Override
	public String toString() {
		return "MonitoringType [name=" + name + ", code=" + code + ", table="
				+ table + "]";
	}

}
