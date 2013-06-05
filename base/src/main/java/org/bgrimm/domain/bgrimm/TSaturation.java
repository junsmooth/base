package org.bgrimm.domain.bgrimm;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.bgrimm.domain.system.IdEntity;
import org.bgrimm.domain.system.MonitoringPoint;
import org.hibernate.validator.constraints.NotEmpty;

//@Table
@Entity(name="saturation_line_monitoring")
public class TSaturation extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 2048463947914157677L;
	@NotEmpty
	@Temporal(TemporalType.TIMESTAMP)
	private Date date_Time;
	private Integer monitoring_position;
	private BigDecimal water_depth;

	@Transient
	private MonitoringPoint mp;
	
	@Transient
	private String monitorName;
	
	
	public String getMonitorName() {
		return monitorName;
	}

	public void setMonitorName(String monitorName) {
		this.monitorName = monitorName;
	}

	public Date getDate_Time() {
		return date_Time;
	}

	public void setDate_Time(Date date_Time) {
		this.date_Time = date_Time;
	}
	public Integer getMonitoring_position() {
		return monitoring_position;
	}
	public void setMonitoring_position(Integer monitoring_position) {
		this.monitoring_position = monitoring_position;
	}
	public BigDecimal getWater_depth() {
		return water_depth;
	}
	public void setWater_depth(BigDecimal water_depth) {
		this.water_depth = water_depth;
	}
	public MonitoringPoint getMp() {
		return mp;
	}
	public void setMp(MonitoringPoint mp) {
		this.mp = mp;
	}


	
}
