package org.bgrimm.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="seepage_flow_monitoring")
public class SLL extends IdEntity {

	@Column(name="date_Time")
	private Date dateTime;

	
	@Column(name="seepage_flow")
	private BigDecimal value;
	

	@Column(name="monitoring_position")
	private Integer monitoringPosition; 
	

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public BigDecimal getValue() {
		return value;
	}

	public void setValue(BigDecimal value) {
		this.value = value;
	}
	
	public Integer getMonitoringPosition() {
		return monitoringPosition;
	}

	public void setMonitoringPosition(Integer monitoringPosition) {
		this.monitoringPosition = monitoringPosition;
	}


	
	
}
