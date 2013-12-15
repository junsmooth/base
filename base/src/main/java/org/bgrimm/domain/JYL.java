package org.bgrimm.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="rainfall_monitoring")
public class JYL extends IdEntity {

	@Column(name="date_Time")
	private Date dateTime;
	
	@Column(name="monitoring_position")
	private Integer monitoringPosition; 
	
	@Column(name="rainfall")
	private BigDecimal value;
	

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public Integer getMonitoringPosition() {
		return monitoringPosition;
	}

	public void setMonitoringPosition(Integer monitoringPosition) {
		this.monitoringPosition = monitoringPosition;
	}

	public BigDecimal getValue() {
		return value;
	}

	public void setValue(BigDecimal value) {
		this.value = value;
	}

	
	
}
