package org.bgrimm.domain.core;

import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;


@Entity(name="t_role")
public class TRole extends IdEntity implements java.io.Serializable{
	private static final long serialVersionUID = -5700422752407686198L;
	private String display;
//	@ManyToMany(mappedBy = "roles")
//	private List<TUser> users;
	
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

//	public List<TUser> getUsers() {
//		return users;
//	}
//
//	public void setUsers(List<TUser> users) {
//		this.users = users;
//	}
	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}
}
