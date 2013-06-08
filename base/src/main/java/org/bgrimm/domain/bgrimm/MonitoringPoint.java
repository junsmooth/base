package org.bgrimm.domain.bgrimm;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.bgrimm.domain.system.IdEntity;



//all monitoring points of the system 
@Entity
@Table(name = "t_monpoint")
public class MonitoringPoint extends IdEntity{
	private String monitoringName;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "montypeid")
	private MonitoringType type;
	private int position;
	public MonitoringType getType() {
		return type;
	}
	public void setType(MonitoringType type) {
		this.type = type;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public String getMonitoringName() {
		return monitoringName;
	}
	public void setMonitoringName(String monitoringName) {
		this.monitoringName = monitoringName;
	}
	
}
