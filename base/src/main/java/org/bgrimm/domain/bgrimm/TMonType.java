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
@Entity(name="t_montype")
public class TMonType extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 2048463947914157677L;
	@NotEmpty
	private String code;
	private char enabled;
	private String name;
	private String tableName;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public char getEnabled() {
		return enabled;
	}
	public void setEnabled(char enabled) {
		this.enabled = enabled;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	
	
}
