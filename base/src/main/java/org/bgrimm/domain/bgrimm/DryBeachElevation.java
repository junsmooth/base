package org.bgrimm.domain.bgrimm;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.bgrimm.domain.bgrimm.extend.MonitoringPoint;
import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name="drybeach_elevation_monitoring")
public class DryBeachElevation extends IdEntity{

	
	@Column( name="date_Time" )
	private Date dateTime;
	@Column(name="monitoring_position")
	private Integer monitoringPosition; 
	private BigDecimal drybeach_elevation;
	
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

	public BigDecimal getDrybeach_elevation() {
		return drybeach_elevation;
	}

	public void setDrybeach_elevation(BigDecimal drybeach_elevation) {
		this.drybeach_elevation = drybeach_elevation;
	}

	public MonitoringPoint getPoint() {
		return point;
	}

	public void setPoint(MonitoringPoint point) {
		this.point = point;
	}
	
	
}
