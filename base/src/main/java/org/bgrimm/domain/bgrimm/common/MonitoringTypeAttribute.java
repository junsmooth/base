package org.bgrimm.domain.bgrimm.common;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name = "t_montypeattr")
public class MonitoringTypeAttribute extends IdEntity {
	private String attr;
	private String name;
	public String getAttr() {
		return attr;
	}

	public void setAttr(String attr) {
		this.attr = attr;
	}

	@ManyToOne
	@JoinColumn(name = "montypeid")
	private MonitoringType type;

	public MonitoringType getType() {
		return type;
	}

	public void setType(MonitoringType type) {
		this.type = type;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
}
