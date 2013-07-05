package org.bgrimm.domain.system;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "t_icon_type")
public class TIconType extends IdEntity {
	// en name
	private String name; // Menu ICON//Monitoring ICON
	// cn name
	private String cnname;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCnname() {
		return cnname;
	}

	public void setCnname(String cnname) {
		this.cnname = cnname;
	}

}
