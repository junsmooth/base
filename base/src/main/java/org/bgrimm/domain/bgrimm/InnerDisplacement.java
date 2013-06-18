package org.bgrimm.domain.bgrimm;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.bgrimm.domain.bgrimm.extend.MonitoringPoint;



@Entity
@IdClass(InnerDisplacementPK.class)
@Table(name="inner_dam_deformation_monitoring")
public class InnerDisplacement {

	@Id
	@Column(name="date_Time")
	private Date dateTime;

	@Column(precision=24,scale=0, name="value")
	private BigDecimal value;

	@Id
	@Column(name="monitoring_position")
	private Integer monitoringPosition; 
	
	@Transient
	private MonitoringPoint point;

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public BigDecimal getValue() {
		return value;
	}

	public void setValue(BigDecimal value) {
		this.value = value;
	}

	public Integer getMonitoringPosition() {
		return monitoringPosition;
	}

	public void setMonitoringPosition(Integer monitoringPosition) {
		this.monitoringPosition = monitoringPosition;
	}

	public MonitoringPoint getPoint() {
		return point;
	}

	public void setPoint(MonitoringPoint point) {
		this.point = point;
	}
	
	
	
}
