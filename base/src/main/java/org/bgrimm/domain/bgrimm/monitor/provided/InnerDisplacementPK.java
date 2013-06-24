package org.bgrimm.domain.bgrimm.monitor.provided;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;



@SuppressWarnings("serial")
public class InnerDisplacementPK implements Serializable{

	private Date dateTime;
	private Integer monitoringPosition;
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
	
	
	
}
