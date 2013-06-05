package org.bgrimm.domain.bgrimm;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.bgrimm.domain.system.IdEntity;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="saturation_type")
public class TSaturationType extends IdEntity{

	@NotEmpty
	private Integer monitoring_type;
	private String monitoring_name;
	
	
	public Integer getMonitoring_type() {
		return monitoring_type;
	}
	public void setMonitoring_type(Integer monitoring_type) {
		this.monitoring_type = monitoring_type;
	}
	public String getMonitoring_name() {
		return monitoring_name;
	}
	public void setMonitoring_name(String monitoring_name) {
		this.monitoring_name = monitoring_name;
	}
	
	
}
