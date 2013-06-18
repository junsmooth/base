package org.bgrimm.domain.bgrimm.extend;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.bgrimm.domain.system.IdEntity;

@Entity
@Table(name = "t_montypeattr")
public class MointoringTypeAttribute extends IdEntity {
	private String code;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private String name;
}
