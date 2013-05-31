package org.bgrimm.domain.t4ddb;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@IdClass(BMWYPK.class)
@Table(name = "MeanPos_DeformationMonitor_Default")
public class BMWY{
	@Id
	@Column(name = "LogTime")
	private Date logtime;
	@Id
	@Column(name = "StationId")
	private int stationId;
	@Column(precision=24,scale=0)
	private float dN;
	@Column(precision=24,scale=0)
	private float dE;
	@Column(precision=24,scale=0)
	private float dH;
	public Date getLogtime() {
		return logtime;
	}
	public void setLogtime(Date logtime) {
		this.logtime = logtime;
	}
	public int getStationId() {
		return stationId;
	}
	public void setStationId(int stationId) {
		this.stationId = stationId;
	}
	public float getdN() {
		return dN;
	}
	public void setdN(float dN) {
		this.dN = dN;
	}
	public float getdE() {
		return dE;
	}
	public void setdE(float dE) {
		this.dE = dE;
	}
	public float getdH() {
		return dH;
	}
	public void setdH(float dH) {
		this.dH = dH;
	}
	@Override
	public String toString() {
		return "BMWY [logtime=" + logtime + ", stationId=" + stationId
				+ ", dN=" + dN + ", dE=" + dE + ", dH=" + dH + "]";
	}
	
}