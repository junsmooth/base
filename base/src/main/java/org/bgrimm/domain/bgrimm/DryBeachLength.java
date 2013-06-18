package org.bgrimm.domain.bgrimm;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.bgrimm.domain.bgrimm.extend.MonitoringPoint;
import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name="drybeach_length_monitoring")
public class DryBeachLength extends IdEntity{

	private Date date_Time;
	private int monitoring_position;
	private BigDecimal drybeach_length;
	@Transient
	private MonitoringPoint point;
	public Date getDate_Time() {
		return date_Time;
	}
	public void setDate_Time(Date date_Time) {
		this.date_Time = date_Time;
	}
	public int getMonitoring_position() {
		return monitoring_position;
	}
	public void setMonitoring_position(int monitoring_position) {
		this.monitoring_position = monitoring_position;
	}
	public BigDecimal getDrybeach_length() {
		return drybeach_length;
	}
	public void setDrybeach_length(BigDecimal drybeach_length) {
		this.drybeach_length = drybeach_length;
	}
	public MonitoringPoint getPoint() {
		return point;
	}
	public void setPoint(MonitoringPoint point) {
		this.point = point;
	}
	
	
}
