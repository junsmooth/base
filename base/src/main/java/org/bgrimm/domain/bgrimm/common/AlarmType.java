package org.bgrimm.domain.bgrimm.common;
/**
 * 报警类型， level为报警级别，级别越大越严重
 * 
 */
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.bgrimm.domain.system.IdEntity;
@Entity
@Table(name="t_alarmtype")
public class AlarmType extends IdEntity{
	//Level 1 Alarm, Level 2 Alarm
	private int severity;
	//level 1 level2.。。
	private String name;
	
	public int getSeverity() {
		return severity;
	}
	public void setSeverity(int severity) {
		this.severity = severity;
	}
	

	public AlarmColor getColor() {
		return color;
	}
	public void setColor(AlarmColor color) {
		this.color = color;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "color_id")
	private AlarmColor color;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
