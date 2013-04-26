package org.bgrimm.domain.system;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name="t_authority")
public class TAuthority extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 6203477128422407520L;
	//Auth Name, Like: ROLE_USER_EDIT,ROLE_USER_QUERY
	//aka: ROLE_MODELNAME_OPERATION
	@Column(name="name", length = 100)
	private String name;
	@Column(name="description")
	private String description;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "menuid")
	private TMenu menu;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "operationid")
	private TOperation op;
	public TMenu getMenu() {
		return menu;
	}

	public void setMenu(TMenu menu) {
		this.menu = menu;
	}

	public TOperation getOp() {
		return op;
	}

	public void setOp(TOperation op) {
		this.op = op;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


}
