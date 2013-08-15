package org.bgrimm.domain.t4ddb;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.bgrimm.domain.bgrimm.common.MonitoringPoint;

@Entity
@IdClass(BMWYPK.class)
@Table(name = "MeanPos_DeformationMonitor_Default")
public class RawBMWY{
	@Id
	@Column(name = "LogTime")
	private Date dateTime;
	@Id
	@Column(name = "StationId")
	private int monitoringPosition; 
	@Column(precision=24,scale=0)
	private double dN;
	@Column(precision=24,scale=0)
	private double dE;
	@Column(precision=24,scale=0)
	private double dH;
	
	@Transient
	private MonitoringPoint point;
	
	public MonitoringPoint getPoint() {
		return point;
	}
	public void setPoint(MonitoringPoint point) {
		this.point = point;
	}
	public double getdN() {
		return dN;
	}
	public void setdN(double dN) {
		this.dN = dN;
	}
	public double getdE() {
		return dE;
	}
	public void setdE(double dE) {
		this.dE = dE;
	}
	public double getdH() {
		return dH;
	}
	public void setdH(double dH) {
		this.dH = dH;
	}
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
	@Override
	public String toString() {
		return "BMWY [logtime=" + dateTime + ", stationId=" + monitoringPosition
				+ ", dN=" + dN + ", dE=" + dE + ", dH=" + dH + "]";
	}
	
}