package org.bgrimm.domain.system;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity(name = "t_role")
public class TRole extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = -5700422752407686198L;
	//role name
	private String name;
	//role code
	private String roledesc;
	// @ManyToMany(mappedBy = "roles")
	// private List<TUser> users;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "t_role_authority", joinColumns = @JoinColumn(name = "roleid"), inverseJoinColumns = @JoinColumn(name = "authid"))
	private Set<TAuthority> auths;

	//
	//
	public Set<TAuthority> getAuths() {
		return auths;
	}

	public void setAuths(Set<TAuthority> auths) {
		this.auths = auths;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRoledesc() {
		return roledesc;
	}

	public void setRoledesc(String roledesc) {
		this.roledesc = roledesc;
	}

	@Override
	public String toString() {
		return super.toString()+" TRole [name=" + name + ", roledesc=" + roledesc + ", auths="
				+ auths + "]";
	}



	// public List<TUser> getUsers() {
	// return users;
	// }
	//
	// public void setUsers(List<TUser> users) {
	// this.users = users;
	// }
}
