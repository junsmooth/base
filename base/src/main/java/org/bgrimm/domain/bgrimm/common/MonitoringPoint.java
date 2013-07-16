package org.bgrimm.domain.bgrimm.common;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.bgrimm.domain.system.IdEntity;

//all monitoring points of the system 
@Entity
@Table(name = "t_monpoint")
public class MonitoringPoint extends IdEntity {
	private String monitoringName;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "montypeid")
	private MonitoringType type;
	private int position;
	private String url;
	public String getUrl() {
		return url;
	}
	@Transient
	private List latestValue;

	public void setUrl(String url) {
		this.url = url;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "drawPointId")
	private TDrawingPosition drawPosition;

	public TDrawingPosition getDrawPosition() {
		return drawPosition;
	}

	public void setDrawPosition(TDrawingPosition drawPosition) {
		this.drawPosition = drawPosition;
	}

	public MonitoringType getType() {
		return type;
	}

	public void setType(MonitoringType type) {
		this.type = type;
	}

	public int getPosition() {
		return position;
	}

	public void setPosition(int position) {
		this.position = position;
	}

	public String getMonitoringName() {
		return monitoringName;
	}

	public void setMonitoringName(String monitoringName) {
		this.monitoringName = monitoringName;
	}

	public List getLatestValue() {
		return latestValue;
	}

	public void setLatestValue(List latestValue) {
		this.latestValue = latestValue;
	}

	
}
