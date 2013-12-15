/**
 * Legacy Alarm Records
 * Used for Adapting New T_AlramRecords to Old AlarmRecords
 * 
 */
package org.bgrimm.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "alarm_records")
public class OldAlarmRecords {
	@Id
	@GeneratedValue
	private long id;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	private String poistion_Name;

	private Date warning_Time;
	private short warning_Content;

	public String getPoistion_Name() {
		return poistion_Name;
	}

	public void setPoistion_Name(String poistion_Name) {
		this.poistion_Name = poistion_Name;
	}

	public Date getWarning_Time() {
		return warning_Time;
	}

	public void setWarning_Time(Date warning_Time) {
		this.warning_Time = warning_Time;
	}

	public short getWarning_Content() {
		return warning_Content;
	}

	public void setWarning_Content(short warning_Content) {
		this.warning_Content = warning_Content;
	}

	public short getClosed() {
		return closed;
	}

	public void setClosed(short closed) {
		this.closed = closed;
	}

	public short getSendtag() {
		return sendtag;
	}

	public void setSendtag(short sendtag) {
		this.sendtag = sendtag;
	}

	private short closed;

	private short sendtag;

}
