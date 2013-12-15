package org.bgrimm.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "staff_infor")
public class StaffInfo {
	@Id
	@GeneratedValue
	private long id;

	public long getId() {
		return id;
	}



	public void setId(long id) {
		this.id = id;
	}

	private String name;
	@Column(name="mobliePhone")
	private String mobilePhone;
	private int alarm_id;

	private int gender;

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public int getAlarm_id() {
		return alarm_id;
	}

	public void setAlarm_id(int alarm_id) {
		this.alarm_id = alarm_id;
	}
}
