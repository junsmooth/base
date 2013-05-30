package org.bgrimm.domain.tailings;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name = "t_montype")
public class MonitoringType extends IdEntity {

	// RAIN DRYBEACH ...
	private String name;
	private String code;
	private String tableName;
	@Column
	@org.hibernate.annotations.Type(type="yes_no")
	private boolean enabled;
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
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
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

}
