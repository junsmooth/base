package org.bgrimm.domain.bgrimm.monitor.provided;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.bgrimm.domain.bgrimm.common.MonitoringType;
import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name="t_montypeattr")
public class Montypeattr extends IdEntity{

	private String attr;
	
	@Column(name="name")
	private String directionName;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "montypeid")
	private MonitoringType type;

	
	
	public String getAttr() {
		return attr;
	}

	public void setAttr(String attr) {
		this.attr = attr;
	}


	public String getDirectionName() {
		return directionName;
	}

	public void setDirectionName(String directionName) {
		this.directionName = directionName;
	}

	public MonitoringType getType() {
		return type;
	}

	public void setType(MonitoringType type) {
		this.type = type;
	}

	
	
}
