package org.bgrimm.domain.bgrimm.monitor.extended;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name = "T_bmwy_raw")
public class BMWY extends IdEntity {
	@Column(name = "LogTime")
	private Date dateTime;
	@Column(name = "StationId")
	private int monitoringPosition;
	@Column(precision = 24, scale = 0)
	private double dN;
	@Column(precision = 24, scale = 0)
	private double dE;
	@Column(precision = 24, scale = 0)
	private double dH;
	@Column(precision = 24, scale = 0)
	private double dDN;
	@Column(precision = 24, scale = 0)
	private double dDE;
	@Column(precision = 24, scale = 0)
	private double dDH;
	
	
	@Transient
	Object obj;
	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public double getdDN() {
		return dDN;
	}

	public void setdDN(double dDN) {
		this.dDN = dDN;
	}

	public double getdDE() {
		return dDE;
	}

	public void setdDE(double dDE) {
		this.dDE = dDE;
	}

	public double getdDH() {
		return dDH;
	}

	public void setdDH(double dDH) {
		this.dDH = dDH;
	}

	

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
		return "BMWY [logtime=" + dateTime + ", stationId="
				+ monitoringPosition + ", dN=" + dN + ", dE=" + dE + ", dH="
				+ dH + "]";
	}

}