package org.bgrimm.domain.t4ddb;

import java.util.Date;

public class BMWYPK implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8393067490012609543L;
	private Date logtime;
	private int stationId;
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
}
