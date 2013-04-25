package org.bgrimm.domain.system;

import javax.persistence.Entity;

/**
 * System Operation Type OPQuery、OPEdit ...
 * 
 * @author Administrator
 * 
 */
@Entity(name="t_operation")
public class TOperation extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 3091354586964446524L;
	//EDIT,QUERY,.....EXPORT,IMPORT
	private String opcode;
	private String name;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOpcode() {
		return opcode;
	}

	public void setOpcode(String opcode) {
		this.opcode = opcode;
	}

}
