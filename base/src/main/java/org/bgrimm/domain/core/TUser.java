package org.bgrimm.domain.core;

import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;


@Entity(name="t_user")
public class TUser extends IdEntity implements java.io.Serializable{
	private static final long serialVersionUID = 2048463947914157677L;
	private String username;
	private String realname;
	private String password;
	private String email;
	private String telephone;
	private String address;
	private String cardno;
	// private Role role;
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "t_user_role", joinColumns = @JoinColumn(name = "uid"), inverseJoinColumns = @JoinColumn(name = "rid"))
	private Set<TRole> roles;

	public Set<TRole> getRoles() {
		return roles;
	}

	public void setRoles(Set<TRole> roles) {
		this.roles = roles;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	// public Role getRole() {
	// return role;
	// }
	//
	// public void setRole(Role role) {
	// this.role = role;
	// }
}
