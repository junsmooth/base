package org.bgrimm.domain.bgrimm.common;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name = "t_alarmrecords")
public class AlarmRecord extends IdEntity {
	// @ManyToOne(fetch=FetchType.EAGER)
	// @JoinColumn(name = "type_id")
	// private AlarmType alarmType;
	// @ManyToOne(fetch=FetchType.EAGER)
	// @JoinColumn(name = "point_id")
	// private MonitoringPoint point;
	// @ManyToOne(fetch=FetchType.EAGER)
	// @JoinColumn(name = "attr_id")
	// private MonitoringTypeAttribute attr;
	// @ManyToOne(fetch=FetchType.EAGER)
	// @JoinColumn(name = "thresholdop_id")
	// private ThresholdOperation op;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "threshold_id")
	private Threshold threshold;


	public Threshold getThreshold() {
		return threshold;
	}

	public void setThreshold(Threshold threshold) {
		this.threshold = threshold;
	}

	// 数据采集时间
	private Date collectTime;

	public Date getCollectTime() {
		return collectTime;
	}

	public void setCollectTime(Date collectTime) {
		this.collectTime = collectTime;
	}

	// 事件产生时间
	private Date eventTime;
	// 同一级别事件累计发生次数
	private int times;
	private Date closedTime;
	@Column
	@org.hibernate.annotations.Type(type = "yes_no")
	private boolean closed;
	@Column
	@org.hibernate.annotations.Type(type = "yes_no")
	private boolean sended;
	private String warningValue;

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	// public AlarmType getAlarmType() {
	// return alarmType;
	// }
	// public void setAlarmType(AlarmType alarmType) {
	// this.alarmType = alarmType;
	// }
	// public MonitoringPoint getPoint() {
	// return point;
	// }
	// public void setPoint(MonitoringPoint point) {
	// this.point = point;
	// }
	// public MonitoringTypeAttribute getAttr() {
	// return attr;
	// }
	// public void setAttr(MonitoringTypeAttribute attr) {
	// this.attr = attr;
	// }
	// public ThresholdOperation getOp() {
	// return op;
	// }
	// public void setOp(ThresholdOperation op) {
	// this.op = op;
	// }
	public Date getEventTime() {
		return eventTime;
	}

	public void setEventTime(Date eventTime) {
		this.eventTime = eventTime;
	}

	public Date getClosedTime() {
		return closedTime;
	}

	public void setClosedTime(Date closedTime) {
		this.closedTime = closedTime;
	}

	public boolean isClosed() {
		return closed;
	}

	public void setClosed(boolean closed) {
		this.closed = closed;
	}

	public boolean isSended() {
		return sended;
	}

	public void setSended(boolean sended) {
		this.sended = sended;
	}

	public String getWarningValue() {
		return warningValue;
	}

	public void setWarningValue(String warningValue) {
		this.warningValue = warningValue;
	}

	public String getWarningContent() {
		return warningContent;
	}

	public void setWarningContent(String warningContent) {
		this.warningContent = warningContent;
	}

	private String warningContent;
}
