package org.bgrimm.domain.t4ddb;

import java.util.Date;

public class BMWYPK implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8393067490012609543L;
	private Date dateTime;
	private int monitoringPosition;
	public Date getDateTime() {
		return dateTime;
	}
	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	public int getMonitoringPosition() {
		return monitoringPosition;
	}
	public void setMonitoringPosition(int monitoringPosition) {
		this.monitoringPosition = monitoringPosition;
	}
}
