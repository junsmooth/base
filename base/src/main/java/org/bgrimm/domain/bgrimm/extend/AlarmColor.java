package org.bgrimm.domain.bgrimm.extend;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name = "t_alarmcolor")
public class AlarmColor extends IdEntity {
	private String name;
	//颜色编码: #112211
	private String code;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

}
