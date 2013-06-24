package org.bgrimm.domain.bgrimm.monitor.datamigration;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.bgrimm.domain.bgrimm.common.MonitoringPoint;
import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name="drybeach_length_monitoring")
public class TDryBeachLength extends IdEntity{

	@Column( name="date_Time" )
	private Date dateTime;
	@Column(name="monitoring_position")
	private Integer monitoringPosition; 
	
	private BigDecimal drybeach_length;
	@Transient
	private MonitoringPoint point;
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
