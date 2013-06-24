package org.bgrimm.domain.bgrimm.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name = "t_threshold")
public class Threshold extends IdEntity {
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "alarmTypeid")
	private AlarmType alarmType;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "monpointid")
	private MonitoringPoint point;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "montypeattrid")
	private MonitoringTypeAttribute attr;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "thresholdopid")
	private ThresholdOperation op;

	@Column
	@org.hibernate.annotations.Type(type="yes_no")
	private boolean removed;
	public AlarmType getAlarmType() {
		return alarmType;
	}
	
	public boolean isRemoved() {
		return removed;
	}

	public void setRemoved(boolean removed) {
		this.removed = removed;
	}
	public void setAlarmType(AlarmType alarmType) {
		this.alarmType = alarmType;
	}

	public MonitoringPoint getPoint() {
		return point;
	}

	public void setPoint(MonitoringPoint point) {
		this.point = point;
	}

	public MonitoringTypeAttribute getAttr() {
		return attr;
	}

	public void setAttr(MonitoringTypeAttribute attr) {
		this.attr = attr;
	}

	public ThresholdOperation getOp() {
		return op;
	}

	public void setOp(ThresholdOperation op) {
		this.op = op;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}

	private double value;

}
