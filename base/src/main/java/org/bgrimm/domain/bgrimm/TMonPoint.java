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
@Entity(name="t_monpoint")
public class TMonPoint extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 2048463947914157677L;
	@NotEmpty
	private String monitoringName;
	private int position;
	private String name;
	private BigDecimal montypeid;
	public String getMonitoringName() {
		return monitoringName;
	}
	public void setMonitoringName(String monitoringName) {
		this.monitoringName = monitoringName;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigDecimal getMontypeid() {
		return montypeid;
	}
	public void setMontypeid(BigDecimal montypeid) {
		this.montypeid = montypeid;
	}

	
}
