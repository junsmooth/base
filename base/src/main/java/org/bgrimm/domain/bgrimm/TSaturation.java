package org.bgrimm.domain.bgrimm;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.bgrimm.domain.bgrimm.extend.MonitoringPoint;
import org.bgrimm.domain.system.IdEntity;


@Entity()
@Table(name="t_saturation_line_monitoring")
public class TSaturation extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 2048463947914157677L;
	
	@Column(name="date_Time")
	private Date dateTime;
	
	@Column(name="monitoring_position")
	private Integer monitoringPosition;
	
	@Column(name="water_depth")
	private BigDecimal value;

	@Transient
	private MonitoringPoint point;


	public TSaturation() {
	}
	
	public TSaturation(Date dateTime, BigDecimal value) {
		super();
		this.dateTime = dateTime;
		this.value = value;
	}


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

	public BigDecimal getValue() {
		return value;
	}

	public void setValue(BigDecimal value) {
		this.value = value;
	}

	public MonitoringPoint getPoint() {
		return point;
	}

	public void setPoint(MonitoringPoint point) {
		this.point = point;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	



	
}
